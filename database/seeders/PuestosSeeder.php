<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PuestosSeeder extends Seeder
{
    public function run(): void
    {
        $puestos = [
            // Recursos Humanos
            ['departamento_id' => 1, 'nombre' => 'Analista de Recursos Humanos', 'codigo' => 'RH-001', 'nivel' => 'Junior', 'descripcion' => 'Apoyo en procesos de reclutamiento, selección y capacitación', 'salario_min' => 15000, 'salario_max' => 20000, 'activo' => true],
            ['departamento_id' => 1, 'nombre' => 'Jefe de Recursos Humanos', 'codigo' => 'RH-002', 'nivel' => 'Senior', 'descripcion' => 'Supervisa las operaciones de RRHH', 'salario_min' => 25000, 'salario_max' => 35000, 'activo' => true],

            // Finanzas
            ['departamento_id' => 2, 'nombre' => 'Contador General', 'codigo' => 'FIN-001', 'nivel' => 'Senior', 'descripcion' => 'Responsable de la contabilidad general y estados financieros', 'salario_min' => 22000, 'salario_max' => 30000, 'activo' => true],
            ['departamento_id' => 2, 'nombre' => 'Auxiliar Contable', 'codigo' => 'FIN-002', 'nivel' => 'Junior', 'descripcion' => 'Apoyo en registros contables y facturación', 'salario_min' => 12000, 'salario_max' => 18000, 'activo' => true],

            // Tecnología
            ['departamento_id' => 3, 'nombre' => 'Desarrollador Backend', 'codigo' => 'IT-001', 'nivel' => 'Mid', 'descripcion' => 'Desarrollo y mantenimiento de APIs y servicios', 'salario_min' => 25000, 'salario_max' => 40000, 'activo' => true],
            ['departamento_id' => 3, 'nombre' => 'Administrador de Sistemas', 'codigo' => 'IT-002', 'nivel' => 'Senior', 'descripcion' => 'Mantenimiento de servidores y redes', 'salario_min' => 28000, 'salario_max' => 42000, 'activo' => true],

            // Ventas
            ['departamento_id' => 4, 'nombre' => 'Ejecutivo de Ventas', 'codigo' => 'VEN-001', 'nivel' => 'Mid', 'descripcion' => 'Gestión de cuentas y cierre de ventas', 'salario_min' => 15000, 'salario_max' => 30000, 'activo' => true],
            ['departamento_id' => 4, 'nombre' => 'Gerente de Ventas', 'codigo' => 'VEN-002', 'nivel' => 'Senior', 'descripcion' => 'Supervisa el equipo comercial', 'salario_min' => 28000, 'salario_max' => 45000, 'activo' => true],

            // Marketing
            ['departamento_id' => 5, 'nombre' => 'Community Manager', 'codigo' => 'MKT-001', 'nivel' => 'Junior', 'descripcion' => 'Gestión de redes sociales y contenido digital', 'salario_min' => 14000, 'salario_max' => 20000, 'activo' => true],
            ['departamento_id' => 5, 'nombre' => 'Director de Marketing', 'codigo' => 'MKT-002', 'nivel' => 'Senior', 'descripcion' => 'Diseño de estrategias de marketing y supervisión del área', 'salario_min' => 30000, 'salario_max' => 50000, 'activo' => true],
        ];

        DB::table('puestos')->insert($puestos);
    }
}
