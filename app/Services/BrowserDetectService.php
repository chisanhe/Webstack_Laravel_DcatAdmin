<?php

namespace App\Services;

use Browser;
trait BrowserDetectService
{
    public static function getBrowserDetect()
    {
        return [
            'browser_family'   =>   Browser::browserFamily(),
            'browser_version'  =>   Browser::browserVersion(),
            'device_type'      =>   Browser::deviceType(),
            'device_family'    =>   Browser::deviceFamily(),
            'device_model'     =>   Browser::deviceModel(),
            'platform_family'  =>   Browser::platformFamily(),
            'platform_version' =>   Browser::platformVersion(),
            'user_agent'       =>   Browser::userAgent(),
            'ip'               =>   getRealIp(),
        ];
    }
}
