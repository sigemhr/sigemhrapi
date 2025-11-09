<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\Module;
use App\Models\Submodule;
use App\Models\Subsubmodule;

class UserModuleAccessSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Asumiendo que tienes usuarios creados
        $adminUser = User::where('email', 'admin@example.com')->first();
        $regularUser = User::where('email', 'user@example.com')->first();
        
        if (!$adminUser || !$regularUser) {
            $this->command->warn('Usuarios no encontrados. Asegúrate de ejecutar primero el UserSeeder.');
            return;
        }

        // Obtener módulos de ejemplo
        $ventasModule = Module::where('name', 'Ventas')->first();
        $inventarioModule = Module::where('name', 'Inventario')->first();
        
        if (!$ventasModule || !$inventarioModule) {
            $this->command->warn('Módulos no encontrados. Asegúrate de ejecutar primero los seeders de módulos.');
            return;
        }

        $accesos = [
            // Admin tiene acceso completo al módulo de Ventas
            [
                'user_id' => $adminUser->id,
                'module_id' => $ventasModule->id,
                'submodule_id' => null,
                'subsubmodule_id' => null,
                'can_view' => true,
                'can_create' => true,
                'can_edit' => true,
                'can_delete' => true,
            ],
            
            // Admin tiene acceso completo al módulo de Inventario
            [
                'user_id' => $adminUser->id,
                'module_id' => $inventarioModule->id,
                'submodule_id' => null,
                'subsubmodule_id' => null,
                'can_view' => true,
                'can_create' => true,
                'can_edit' => true,
                'can_delete' => true,
            ],
        ];

        // Acceso a submódulos específicos para usuario regular
        $facturacionSubmodule = Submodule::where('name', 'Facturación')
            ->where('module_id', $ventasModule->id)
            ->first();
            
        if ($facturacionSubmodule) {
            $accesos[] = [
                'user_id' => $regularUser->id,
                'module_id' => $ventasModule->id,
                'submodule_id' => $facturacionSubmodule->id,
                'subsubmodule_id' => null,
                'can_view' => true,
                'can_create' => true,
                'can_edit' => false,
                'can_delete' => false,
            ];
        }

        // Acceso a subsubmódulo específico
        $reportesSubmodule = Submodule::where('name', 'Reportes')
            ->where('module_id', $ventasModule->id)
            ->first();
            
        if ($reportesSubmodule) {
            $reportesDiariosSubsubmodule = Subsubmodule::where('name', 'Reportes Diarios')
                ->where('submodule_id', $reportesSubmodule->id)
                ->first();
                
            if ($reportesDiariosSubsubmodule) {
                $accesos[] = [
                    'user_id' => $regularUser->id,
                    'module_id' => $ventasModule->id,
                    'submodule_id' => $reportesSubmodule->id,
                    'subsubmodule_id' => $reportesDiariosSubsubmodule->id,
                    'can_view' => true,
                    'can_create' => false,
                    'can_edit' => false,
                    'can_delete' => false,
                ];
            }
        }

        foreach ($accesos as $acceso) {
            DB::table('user_module_access')->insert(array_merge($acceso, [
                'created_at' => now(),
                'updated_at' => now(),
            ]));
        }

        $this->command->info('Accesos de usuarios creados exitosamente.');
    }
}