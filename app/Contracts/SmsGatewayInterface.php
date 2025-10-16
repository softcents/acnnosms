<?php

namespace App\Contracts;

interface SmsGatewayInterface
{
    /**
     * Send SMS to a single recipient
     *
     * @param string $to
     * @param string $message
     * @param array $options
     * @return array
     */
    public function send(string $to, string $message, array $options = []): array;

    /**
     * Send SMS to multiple recipients
     *
     * @param array $recipients
     * @param string $message
     * @param array $options
     * @return array
     */
    public function sendBulk(array $recipients, string $message, array $options = []): array;

    /**
     * Check the balance of the SMS gateway account
     *
     * @return array
     */
    public function checkBalance(): array;

    /**
     * Get the delivery status of a message
     *
     * @param string $messageId
     * @return array
     */
    public function getStatus(string $messageId): array;

    /**
     * Initialize the gateway with configuration
     *
     * @param array $config
     * @return void
     */
    public function initialize(array $config): void;
}