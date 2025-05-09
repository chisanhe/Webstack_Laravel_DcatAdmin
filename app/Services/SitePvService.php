<?php

namespace App\Services;

use App\Models\SitePv;
use App\Services\BaseService;
use App\Services\BrowserDetectService;

class SitePvService extends BaseService
{
    // 存储文章浏览记录
    public function store($siteId)
    {
        SitePv::create(
            array_merge(
                [
                    'site_id' => $siteId,
                ],
                BrowserDetectService::getBrowserDetect(),
            )
        );
    }
}
