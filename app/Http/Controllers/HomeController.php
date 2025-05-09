<?php

namespace App\Http\Controllers;

use App\Models\Seo;
use Dcat\Admin\Models\Setting;
use Illuminate\Http\Request;
use App\Models\Category;

class HomeController extends Controller
{
    public function index()
    {
        $categories = Category::with([
            'children' => function ($query) {
                $query->orderBy('order');
            },
            'sites' => function ($query) {
                $query->where('is_show', 1);
            }
        ])
            ->withCount('children')
            ->where('is_show', 1)
            ->orderBy('order')
            ->get([
                'id',
                'parent_id',
                'title',
                'order',
                'is_show'
            ]);
        // 首页 SEO
        $seo = Seo::where('is_show', 1)->latest()->first();

        return view('index', compact('seo', 'categories'));
    }

    public function about()
    {
        return view('about');
    }
}
