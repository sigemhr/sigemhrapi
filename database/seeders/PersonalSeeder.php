<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class PersonalSeeder extends Seeder
{
    public function run(): void
    {
        $empleados = [
            [
                'nombre' => 'Juan',
                'apellido_paterno' => 'Pérez',
                'apellido_materno' => 'López',
                'correo_electronico' => 'juan.perez@example.com',
                'telefono' => '555-123-4567',
                'telefono_emergencia' => '555-765-4321',
                'fecha_nacimiento' => '1990-06-15',
                'sexo' => 'masculino',
                'estado_civil' => 'soltero',
                'nacionalidad' => 'Mexicana',
                'direccion' => 'Av. Reforma 123',
                'colonia' => 'Centro',
                'ciudad' => 'Ciudad de México',
                'estado' => 'CDMX',
                'pais' => 'México',
                'codigo_postal' => '01000',
                'departamento_id' => null,
                'puesto_id' => null,
                'fecha_contratacion' => '2022-03-15',
                'salario' => 18500.00,
                'tipo_contrato' => 'tiempo completo',
                'turno' => 'matutino',
                'estatus' => 'activo',
                'dias_vacaciones' => 12,
                'nss' => '12345678901',
                'rfc' => 'PELJ800101ABC',
                'curp' => 'PELJ800101HDFLPN09',
                'numero_empleado' => 'EMP-001',
                'banco' => 'BBVA',
                'numero_cuenta' => '0123456789',
                'clabe_interbancaria' => '012345678901234567',
                'foto' => null,
                'observaciones' => 'Empleado destacado en puntualidad.',
                'es_supervisor' => false,
                'tiene_acceso_sistema' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'nombre' => 'María',
                'apellido_paterno' => 'Gómez',
                'apellido_materno' => 'Ramírez',
                'correo_electronico' => 'maria.gomez@example.com',
                'telefono' => '555-987-6543',
                'telefono_emergencia' => '555-321-7890',
                'fecha_nacimiento' => '1988-11-05',
                'sexo' => 'femenino',
                'estado_civil' => 'casada',
                'nacionalidad' => 'Mexicana',
                'direccion' => 'Calle Morelos 456',
                'colonia' => 'Americana',
                'ciudad' => 'Guadalajara',
                'estado' => 'Jalisco',
                'pais' => 'México',
                'codigo_postal' => '44100',
                'departamento_id' => null,
                'puesto_id' => null,
                'fecha_contratacion' => '2021-07-01',
                'salario' => 22000.00,
                'tipo_contrato' => 'tiempo completo',
                'turno' => 'mixto',
                'estatus' => 'activo',
                'dias_vacaciones' => 15,
                'nss' => '23456789012',
                'rfc' => 'GORM850202JKL',
                'curp' => 'GORM850202MJCLRS02',
                'numero_empleado' => 'EMP-002',
                'banco' => 'Banorte',
                'numero_cuenta' => '9876543210',
                'clabe_interbancaria' => '098765432109876543',
                'foto' => null,
                'observaciones' => 'Encargada de nóminas y pagos.',
                'es_supervisor' => true,
                'tiene_acceso_sistema' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        DB::table('personal')->insert($empleados);
    }
}
