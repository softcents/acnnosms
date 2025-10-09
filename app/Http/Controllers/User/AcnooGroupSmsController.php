<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Contact;
use App\Models\Group;
use App\Models\Senderid;
use App\Models\Sms;
use App\Models\Smsgateway;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AcnooGroupSmsController extends Controller
{
    public function __construct()
    {
        $this->middleware('expired')->only('store');
    }

    public function index()
    {
        $groups = Group::where('user_id', auth()->id())->latest()->get();
        $senderids = Senderid::where('user_id', auth()->id())->latest()->get();

        return view('users.group-sms.index', compact('senderids', 'groups'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'campaing_name' => 'nullable|string|max:250',
            'senderid_id' => 'required|string|max:20|exists:senderids,id',
            'group_id' => 'required|string|max:20|exists:groups,id',
            'contents' => 'required',
            'schedule_type' => 'required',
            'schedule' => 'nullable',
        ]);

        $numbers = Contact::where('group_id', $request->group_id)->get()->pluck('number')->toArray();
        $request->merge(['numbers' => implode(',', $numbers)]);

        $user = auth()->user();
        $isUnicode = didITypeUnicode($request->contents);
        $total_sms = wordCountDown($isUnicode, $request->contents);

        $numbers_arr = Contact::where('group_id', $request->group_id)->get()->pluck('number')->toArray();
        $sender_id_info = Senderid::where('user_id', $user->id)->findOrFail($request->senderid_id);

        $request->input('numbers', $numbers_arr);
        $grand_total_sms = count($numbers_arr) * $total_sms; // Total sms count
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
                        return response()->json(__('Please enter a valid phone number or contact with admin!'), 406);
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
                    'message' => "Message sent successfully",
                    'redirect' => route('users.group-sms.store'),
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