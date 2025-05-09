<?php

namespace App\Http\Controllers;

use App\Models\SitePv;
use App\Services\SitePvService;
use Illuminate\Http\Request;
use App\Models\Site;

class SiteController extends Controller
{
    // 记录 PV
    public function recordPV(Request $request)
    {
        // 记录 PV
        $siteId = intval($request->input('site_id'));
        $oSite = Site::find($siteId);
        if ($oSite) {
            $oSite->increment('pv');
            SitePvService::getInstance()->store($siteId);
            return response()->json(['status' => 'success']);
        } else {
            return response()->json(['status' => 'error', 'message' => '站点不存在']);
        }
    }
}
