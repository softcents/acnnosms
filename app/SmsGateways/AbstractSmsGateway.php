<?php

namespace App\SmsGateways;

use App\Contracts\SmsGatewayInterface;

abstract class AbstractSmsGateway implements SmsGatewayInterface
{
    /**
     * Gateway configuration
     *
     * @var array
     */
    protected array $config = [];

    /**
     * Initialize the gateway with configuration
     *
     * @param array $config
     * @return void
     */
    public function initialize(array $config): void
    {
        $this->config = $config;
    }

    /**
     * Send SMS to multiple recipients
     *
     * @param array $recipients
     * @param string $message
     * @param array $options
     * @return array
     */
    public function sendBulk(array $recipients, string $message, array $options = []): array
    {
        $results = [];
        foreach ($recipients as $recipient) {
            $results[] = $this->send($recipient, $message, $options);
        }
        return $results;
    }

    /**
     * Validate phone number format
     *
     * @param string $phoneNumber
     * @return string
     */
    protected function validatePhoneNumber(string $phoneNumber): string
    {
        // Remove any non-numeric characters
        $number = preg_replace('/[^0-9]/', '', $phoneNumber);
        
        // Add country code if not present (customize as needed)
        if (!str_starts_with($number, '+')) {
            $number = '+' . $number;
        }
        
        return $number;
    }

    /**
     * Format the response array
     *
     * @param bool $success
     * @param string $message
     * @param array $data
     * @return array
     */
    protected function formatResponse(bool $success, string $message, array $data = []): array
    {
        return [
            'success' => $success,
            'message' => $message,
            'data' => $data
        ];
    }
}