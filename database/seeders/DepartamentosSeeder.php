<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DepartamentosSeeder extends Seeder
{
    public function run(): void
    {
        $departamentos = [
            ['nombre' => 'Recursos Humanos', 'codigo' => 'RH', 'descripcion' => 'Gestión de personal y nómina', 'activo' => true],
            ['nombre' => 'Finanzas', 'codigo' => 'FIN', 'descripcion' => 'Control financiero y contabilidad', 'activo' => true],
            ['nombre' => 'Tecnología', 'codigo' => 'IT', 'descripcion' => 'Infraestructura y desarrollo de software', 'activo' => true],
            ['nombre' => 'Ventas', 'codigo' => 'VEN', 'descripcion' => 'Ventas y atención a clientes', 'activo' => true],
            ['nombre' => 'Marketing', 'codigo' => 'MKT', 'descripcion' => 'Promoción y campañas publicitarias', 'activo' => true],
        ];

        DB::table('departamentos')->insert($departamentos);
    }
}
