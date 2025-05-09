<?php

namespace App\Providers;

use App\Models\Site;
use App\Admin\Observers\SiteObserver;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Site::observe(SiteObserver::class);

        Schema::defaultStringLength(191);
    }
}
