<?php

namespace App\SmsGateways;

use App\Contracts\SmsGatewayInterface;
use App\Models\SmsGateway;
use InvalidArgumentException;

class GatewayFactory
{
    /**
     * Create a new gateway instance
     *
     * @param SmsGateway $gateway
     * @return SmsGatewayInterface
     * @throws InvalidArgumentException
     */
    public static function create(SmsGateway $gateway): SmsGatewayInterface
    {
        $type = $gateway->type;
        
        if (!$type || !$type->namespace) {
            throw new InvalidArgumentException("Invalid gateway type configuration");
        }

        $class = $type->namespace;
        
        if (!class_exists($class)) {
            throw new InvalidArgumentException("Gateway class {$class} not found");
        }

        $instance = new $class();
        
        if (!$instance instanceof SmsGatewayInterface) {
            throw new InvalidArgumentException("Gateway class must implement SmsGatewayInterface");
        }

        // Initialize the gateway with its credentials
        $instance->initialize([
            'driver' => $type->driver,
            ...$gateway->credentials
        ]);

        return $instance;
    }
}