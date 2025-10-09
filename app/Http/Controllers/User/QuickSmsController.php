<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Senderid;
use App\Models\Sms;
use App\Models\Smsgateway;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class QuickSmsController extends Controller
{
    public function __construct()
    {
        $this->middleware('expired')->only('store');
    }

    public function index()
    {
        $senderids = Senderid::where('user_id', auth()->id())->latest()->get();
        return view('users.quick-sms.index', compact('senderids'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'campaing_name' => 'nullable|string|max:250',
            'senderid_id' => 'required|string|max:20|exists:senderids,id',
            'numbers' => 'required|min:5',
            'contents' => 'required',
            'schedule_type' => 'required',
            'schedule' => 'nullable',
        ]);

        $user = auth()->user();
        $isUnicode = didITypeUnicode($request->contents);
        $total_sms = wordCountDown($isUnicode, $request->contents);
        $total_numbers = count(explode(',', $request->numbers)); // Numbers in array
        $grand_total_sms = $total_numbers * $total_sms; // Total sms count

        $sender_id_info = Senderid::where('user_id', $user->id)->findOrFail($request->senderid_id);
        $total_charges = calculateCharge($grand_total_sms, $sender_id_info, $user);

        if ($total_charges <= $user->balance) {
            DB::beginTransaction();
            try {

                if ($request->schedule_type == 'sendnow') {
                    $gateway = Smsgateway::whereStatus(1)->exists();
                    if (!$gateway) {
                        return response()->json([
                            'message' => __("Api gateway is not available, Please contact with admin."),
                        ], 406);
                    }
                    $response = sendMessage($request->numbers, $request->contents, $sender_id_info->sender);

                    if (!$response) {
                        return response()->json(__('Invalid credentials, please contact with your sms service provider.'), 406);
                    }
                }

                $message_details = makeSms($request, $sender_id_info, $isUnicode, $user, $total_sms);
                Sms::insert($message_details);

                $user->update([
                    'balance' => $user->balance - $total_charges,
                ]);

                session()->forget('gateway_id');

                DB::commit();
                return response()->json([
                    'message' => __("Message sent successfully."),
                    'redirect' => route('users.quick-sms.index'),
                ]);

            } catch (\Exception $e) {
                DB::rollback();
                return response()->json(__('Invalid phone number or credentials.'), 404);
            }
        } else {
            return response()->json([
                'message' => __("You don't have enough balance. Please recharge now."),
            ], 406);
        }
    }
}
