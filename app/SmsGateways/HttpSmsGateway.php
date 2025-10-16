<?php

namespace App\SmsGateways;

use Illuminate\Support\Facades\Http;

class HttpSmsGateway extends AbstractSmsGateway
{
    /**
     * Send SMS to a single recipient
     *
     * @param string $to
     * @param string $message
     * @param array $options
     * @return array
     */
    public function send(string $to, string $message, array $options = []): array
    {
        try {
            $to = $this->validatePhoneNumber($to);
            
            $response = Http::withHeaders([
                'Authorization' => 'Bearer ' . $this->config['api_key'] ?? '',
                'Content-Type' => 'application/json',
            ])->post($this->config['endpoint'] ?? '', [
                'to' => $to,
                'message' => $message,
                'from' => $this->config['sender_id'] ?? '',
                ...$options
            ]);

            if ($response->successful()) {
                return $this->formatResponse(
                    true,
                    'Message sent successfully',
                    $response->json()
                );
            }

            return $this->formatResponse(
                false,
                'Failed to send message: ' . $response->body()
            );
        } catch (\Exception $e) {
            return $this->formatResponse(
                false,
                'Error sending message: ' . $e->getMessage()
            );
        }
    }

    /**
     * Check the balance of the SMS gateway account
     *
     * @return array
     */
    public function checkBalance(): array
    {
        try {
            $response = Http::withHeaders([
                'Authorization' => 'Bearer ' . $this->config['api_key'] ?? '',
            ])->get($this->config['balance_endpoint'] ?? '');

            if ($response->successful()) {
                return $this->formatResponse(
                    true,
                    'Balance retrieved successfully',
                    $response->json()
                );
            }

            return $this->formatResponse(
                false,
                'Failed to get balance: ' . $response->body()
            );
        } catch (\Exception $e) {
            return $this->formatResponse(
                false,
                'Error checking balance: ' . $e->getMessage()
            );
        }
    }

    /**
     * Get the delivery status of a message
     *
     * @param string $messageId
     * @return array
     */
    public function getStatus(string $messageId): array
    {
        try {
            $response = Http::withHeaders([
                'Authorization' => 'Bearer ' . $this->config['api_key'] ?? '',
            ])->get($this->config['status_endpoint'] ?? '', [
                'message_id' => $messageId
            ]);

            if ($response->successful()) {
                return $this->formatResponse(
                    true,
                    'Status retrieved successfully',
                    $response->json()
                );
            }

            return $this->formatResponse(
                false,
                'Failed to get status: ' . $response->body()
            );
        } catch (\Exception $e) {
            return $this->formatResponse(
                false,
                'Error checking status: ' . $e->getMessage()
            );
        }
    }
}