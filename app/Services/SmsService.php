<?php

namespace App\Services;

use App\Contracts\SmsGatewayInterface;
use App\Models\SmsGateway;
use App\SmsGateways\GatewayFactory;
use InvalidArgumentException;

class SmsService
{
    /**
     * The active SMS gateway
     *
     * @var SmsGatewayInterface
     */
    protected SmsGatewayInterface $gateway;

    /**
     * Create a new SMS service instance
     *
     * @param int|null $gatewayId
     * @return void
     */
    public function __construct(?int $gatewayId = null)
    {
        $this->setGateway($gatewayId);
    }

    /**
     * Set the active SMS gateway
     *
     * @param int|null $gatewayId
     * @return self
     */
    public function setGateway(?int $gatewayId = null): self
    {
        // If no gateway ID is provided, get the one with highest priority
        $gateway = $gatewayId 
            ? SmsGateway::findOrFail($gatewayId)
            : SmsGateway::where('status', true)
                ->orderBy('priority', 'desc')
                ->first();

        if (!$gateway) {
            throw new InvalidArgumentException("No active SMS gateway found");
        }

        $this->gateway = GatewayFactory::create($gateway);

        return $this;
    }

    /**
     * Send an SMS
     *
     * @param string $to
     * @param string $message
     * @param array $options
     * @return array
     */
    public function send(string $to, string $message, array $options = []): array
    {
        return $this->gateway->send($to, $message, $options);
    }

    /**
     * Send bulk SMS
     *
     * @param array $recipients
     * @param string $message
     * @param array $options
     * @return array
     */
    public function sendBulk(array $recipients, string $message, array $options = []): array
    {
        return $this->gateway->sendBulk($recipients, $message, $options);
    }

    /**
     * Check gateway balance
     *
     * @return array
     */
    public function checkBalance(): array
    {
        return $this->gateway->checkBalance();
    }

    /**
     * Get message status
     *
     * @param string $messageId
     * @return array
     */
    public function getStatus(string $messageId): array
    {
        return $this->gateway->getStatus($messageId);
    }
}