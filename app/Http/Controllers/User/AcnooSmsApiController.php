<?php

namespace App\Http\Controllers\User;

use App\Models\Sms;
use App\Models\User;
use App\Models\Senderid;
use App\Models\Smsgateway;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class AcnooSmsApiController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'clientId' => 'nullable',
            'clientSecret' => 'nullable',
            'numbers' => 'required',
            'contents' => 'required',
            'schedule' => 'nullable',
            'schedule_type' => 'nullable',
            'senderId' => 'required|string|exists:senderids,sender',
        ]);

        $user = User::where(['client_id' => $request->clientId, 'client_secret' => $request->clientSecret])->first();

        if (!$user) {
            return response()->json([
                'status' => 404,
                'message' => __('User not found'),
            ], 404);
        }

        $sender_id_info = Senderid::where(['user_id' => $user->id, 'sender' => $request->senderId])->first();

        if (!$sender_id_info) {
            return response()->json([
                'status' => 404,
                'message' => __('Sender id not found'),
            ], 404);
        }

        $isUnicode = didITypeUnicode($request->contents);
        $total_sms = wordCountDown($isUnicode, $request->contents);
        $total_numbers = count(explode(',', $request->numbers)); // Numbers in array
        $grand_total_sms = $total_numbers * $total_sms; // Total sms count
        $total_charges = calculateCharge($grand_total_sms, $sender_id_info, $user);

        if ($total_charges <= $user->balance) {
            DB::beginTransaction();
            try {

                $gateway = Smsgateway::whereStatus(1)->exists();
                if (!$gateway) {
                    return response()->json([
                        'message' => __("Api gateway is not available, Please contact with admin.")
                    ], 406);
                }

                $response = sendMessage($request->numbers, $request->contents, $sender_id_info->sender);

                if (!$response) {
                    return response()->json(__('Please enter a valid phone number or contact with admin!'), 406);
                }

                $message_details = makeSms($request, $sender_id_info, $isUnicode, $user, $total_sms);
                Sms::insert($message_details);

                $user->update([
                    'balance' => $user->balance - $total_charges
                ]);

                session()->forget('gateway_id');

                DB::commit();
                return response()->json([
                    'status' => 200,
                    'message' => "Message sent successfully",
                ]);

            } catch (\Exception $e) {
                DB::rollback();
                return response()->json(__('Invalid phone number or credentials.'), 404);
            }
        } else {
            return response()->json([
                'message' => __("You don't have enough balance. Please recharge now.")
            ], 406);
        }
    }
}