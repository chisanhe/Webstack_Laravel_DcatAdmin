<?php

namespace App\Services;

class BaseService
{
    protected static $instance;

    public static function getInstance()
    {
        if (static::$instance instanceof static){
            return self::$instance;
        }
        static::$instance = new static();
        return self::$instance;
    }

    protected function __clone(){}
}
