<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Repositories\ModuleRepository;
use App\Repositories\SubmoduleRepository;
use App\Repositories\UserModuleAccessRepository;
use App\Services\ModuleService;
use App\Services\SubmoduleService;
use App\Services\UserModuleAccessService;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
         // Registrar Repositories
        $this->app->singleton(ModuleRepository::class, function ($app) {
            return new ModuleRepository();
        });

        $this->app->singleton(SubmoduleRepository::class, function ($app) {
            return new SubmoduleRepository();
        });

        $this->app->singleton(UserModuleAccessRepository::class, function ($app) {
            return new UserModuleAccessRepository();
        });

        // Registrar Services
        $this->app->singleton(ModuleService::class, function ($app) {
            return new ModuleService(
                $app->make(ModuleRepository::class)
            );
        });

        $this->app->singleton(SubmoduleService::class, function ($app) {
            return new SubmoduleService(
                $app->make(SubmoduleRepository::class),
                $app->make(ModuleRepository::class)
            );
        });

        $this->app->singleton(UserModuleAccessService::class, function ($app) {
            return new UserModuleAccessService(
                $app->make(UserModuleAccessRepository::class),
                $app->make(ModuleRepository::class),
                $app->make(SubmoduleRepository::class)
            );
        });
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
