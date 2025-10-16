<?php

namespace App\SmsGateways;

use Illuminate\Support\Facades\Http;

class CustomGateway
{
    public static function send_message($gateway, $numbers, $contents, $sender_name = null)
    {
        try {            
            $response = Http::withHeaders([
                'Authorization' => 'Bearer ' . $gateway->params['api_key_value'] ?? '',
                'Content-Type' => 'application/json',
            ])->asForm()->{$gateway->params['api_method']}($gateway->params['api_url'], array_merge([
                $gateway->params['api_key_name'] => $gateway->params['api_key_value'],
                //'username' => $gateway->params['username'],
                //'password' => $gateway->params['password'],
                $gateway->params['sender_id_key'] => $gateway->params['sender_id_value'],
                $gateway->params['action_key'] => $gateway->params['action_value'],
                $gateway->params['number_key'] => $numbers,
                $gateway->params['message_key'] => $contents,
                $gateway->params['custom_key_1'] => $gateway->params['custom_key_1_value'] ?? null,
            ]));

            if ($response->successful()) {
                //dd($response->json());
                return true;
            }

            //dd($response->body());
            return false;
        } catch (\Exception $e) {
            return false;
        }
    }
}