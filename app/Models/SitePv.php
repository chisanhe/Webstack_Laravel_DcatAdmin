<?php

namespace App\Models;


use App\Models\Category;

// 站点浏览量
class SitePv extends BaseModel
{
    protected $table = 'pro_site_pvs';

    protected $fillable = [
        'site_id',
        'browser_family',
        'browser_version',
        'device_type',
        'device_family',
        'device_model',
        'platform_family',
        'platform_version',
        'user_agent',
        'ip',
    ];
}
