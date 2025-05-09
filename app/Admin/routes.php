<?php

use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;
use Dcat\Admin\Admin;

Admin::routes();

Route::group([
    'prefix'     => config('admin.route.prefix'),
    'namespace'  => config('admin.route.namespace'),
    'middleware' => config('admin.route.middleware'),
], function (Router $router) {
    $router->get('/', 'HomeController@index');
    // 分类
    $router->resource('categories', 'CategoryController');
    // 网站
    $router->resource('sites', 'SiteController');
    // SEO
    $router->resource('seo', 'SeoController');
});
