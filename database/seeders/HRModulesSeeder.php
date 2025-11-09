<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class HRModulesSeeder extends Seeder
{
    public function run(): void
    {
        // 1. MÓDULO: EMPLEADOS
        $empleadosId = DB::table('modules')->insertGetId([
            'name' => 'Empleados',
            'slug' => 'empleados',
            'description' => 'Gestión completa de empleados',
            'icon' => 'users',
            'route' => '/empleados',
            'order' => 1,
            'is_active' => true,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        // Submódulos de Empleados
        $directorioId = DB::table('submodules')->insertGetId([
            'module_id' => $empleadosId,
            'name' => 'Directorio',
            'slug' => 'empleados-directorio',
            'icon' => 'address-book',
            'route' => '/empleados/directorio',
            'order' => 1,
            'level' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $organigramaId = DB::table('submodules')->insertGetId([
            'module_id' => $empleadosId,
            'name' => 'Organigrama',
            'slug' => 'empleados-organigrama',
            'icon' => 'sitemap',
            'route' => '/empleados/organigrama',
            'order' => 2,
            'level' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $expedientesId = DB::table('submodules')->insertGetId([
            'module_id' => $empleadosId,
            'name' => 'Expedientes',
            'slug' => 'empleados-expedientes',
            'icon' => 'folder',
            'route' => '/empleados/expedientes',
            'order' => 3,
            'level' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        // Sub-submódulos de Expedientes
        DB::table('submodules')->insert([
            [
                'module_id' => $empleadosId,
                'parent_submodule_id' => $expedientesId,
                'name' => 'Datos Personales',
                'slug' => 'expedientes-datos-personales',
                'route' => '/empleados/expedientes/datos-personales',
                'order' => 1,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $empleadosId,
                'parent_submodule_id' => $expedientesId,
                'name' => 'Documentos',
                'slug' => 'expedientes-documentos',
                'route' => '/empleados/expedientes/documentos',
                'order' => 2,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $empleadosId,
                'parent_submodule_id' => $expedientesId,
                'name' => 'Historial Laboral',
                'slug' => 'expedientes-historial',
                'route' => '/empleados/expedientes/historial',
                'order' => 3,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $empleadosId,
                'name' => 'Onboarding',
                'slug' => 'empleados-onboarding',
                'icon' => 'user-plus',
                'route' => '/empleados/onboarding',
                'order' => 4,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $empleadosId,
                'name' => 'Offboarding',
                'slug' => 'empleados-offboarding',
                'icon' => 'user-minus',
                'route' => '/empleados/offboarding',
                'order' => 5,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        // 2. MÓDULO: TIEMPO Y ASISTENCIA
        $tiempoId = DB::table('modules')->insertGetId([
            'name' => 'Tiempo y Asistencia',
            'slug' => 'tiempo-asistencia',
            'description' => 'Control de horarios, asistencia y ausencias',
            'icon' => 'clock',
            'route' => '/tiempo',
            'order' => 2,
            'is_active' => true,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $registroId = DB::table('submodules')->insertGetId([
            'module_id' => $tiempoId,
            'name' => 'Registro de Tiempo',
            'slug' => 'tiempo-registro',
            'icon' => 'clock-check',
            'route' => '/tiempo/registro',
            'order' => 1,
            'level' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        // Sub-submódulos de Registro
        DB::table('submodules')->insert([
            [
                'module_id' => $tiempoId,
                'parent_submodule_id' => $registroId,
                'name' => 'Checadas',
                'slug' => 'tiempo-checadas',
                'route' => '/tiempo/registro/checadas',
                'order' => 1,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $tiempoId,
                'parent_submodule_id' => $registroId,
                'name' => 'Horas Extras',
                'slug' => 'tiempo-horas-extras',
                'route' => '/tiempo/registro/horas-extras',
                'order' => 2,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        $ausenciasId = DB::table('submodules')->insertGetId([
            'module_id' => $tiempoId,
            'name' => 'Ausencias',
            'slug' => 'tiempo-ausencias',
            'icon' => 'calendar-x',
            'route' => '/tiempo/ausencias',
            'order' => 2,
            'level' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $tiempoId,
                'parent_submodule_id' => $ausenciasId,
                'name' => 'Solicitudes',
                'slug' => 'ausencias-solicitudes',
                'route' => '/tiempo/ausencias/solicitudes',
                'order' => 1,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $tiempoId,
                'parent_submodule_id' => $ausenciasId,
                'name' => 'Balance de Días',
                'slug' => 'ausencias-balance',
                'route' => '/tiempo/ausencias/balance',
                'order' => 2,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $tiempoId,
                'name' => 'Calendario',
                'slug' => 'tiempo-calendario',
                'icon' => 'calendar',
                'route' => '/tiempo/calendario',
                'order' => 3,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $tiempoId,
                'name' => 'Turnos',
                'slug' => 'tiempo-turnos',
                'icon' => 'rotate',
                'route' => '/tiempo/turnos',
                'order' => 4,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        // 3. MÓDULO: NÓMINA
        $nominaId = DB::table('modules')->insertGetId([
            'name' => 'Nómina',
            'slug' => 'nomina',
            'description' => 'Gestión de pagos y nómina',
            'icon' => 'wallet',
            'route' => '/nomina',
            'order' => 3,
            'is_active' => true,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $procesoNominaId = DB::table('submodules')->insertGetId([
            'module_id' => $nominaId,
            'name' => 'Proceso de Nómina',
            'slug' => 'nomina-proceso',
            'icon' => 'calculator',
            'route' => '/nomina/proceso',
            'order' => 1,
            'level' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $nominaId,
                'parent_submodule_id' => $procesoNominaId,
                'name' => 'Cálculo',
                'slug' => 'nomina-calculo',
                'route' => '/nomina/proceso/calculo',
                'order' => 1,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $nominaId,
                'parent_submodule_id' => $procesoNominaId,
                'name' => 'Validación',
                'slug' => 'nomina-validacion',
                'route' => '/nomina/proceso/validacion',
                'order' => 2,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $nominaId,
                'parent_submodule_id' => $procesoNominaId,
                'name' => 'Dispersión',
                'slug' => 'nomina-dispersion',
                'route' => '/nomina/proceso/dispersion',
                'order' => 3,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $nominaId,
                'name' => 'Recibos de Nómina',
                'slug' => 'nomina-recibos',
                'icon' => 'file-text',
                'route' => '/nomina/recibos',
                'order' => 2,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $nominaId,
                'name' => 'Percepciones y Deducciones',
                'slug' => 'nomina-percepciones-deducciones',
                'icon' => 'percent',
                'route' => '/nomina/percepciones-deducciones',
                'order' => 3,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $nominaId,
                'name' => 'Finiquitos',
                'slug' => 'nomina-finiquitos',
                'icon' => 'file-check',
                'route' => '/nomina/finiquitos',
                'order' => 4,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        // 4. MÓDULO: DESEMPEÑO
        $desempenoId = DB::table('modules')->insertGetId([
            'name' => 'Desempeño',
            'slug' => 'desempeno',
            'description' => 'Evaluaciones y gestión del desempeño',
            'icon' => 'target',
            'route' => '/desempeno',
            'order' => 4,
            'is_active' => true,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $evaluacionesId = DB::table('submodules')->insertGetId([
            'module_id' => $desempenoId,
            'name' => 'Evaluaciones',
            'slug' => 'desempeno-evaluaciones',
            'icon' => 'clipboard-check',
            'route' => '/desempeno/evaluaciones',
            'order' => 1,
            'level' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $desempenoId,
                'parent_submodule_id' => $evaluacionesId,
                'name' => 'Evaluación 360°',
                'slug' => 'evaluaciones-360',
                'route' => '/desempeno/evaluaciones/360',
                'order' => 1,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $desempenoId,
                'parent_submodule_id' => $evaluacionesId,
                'name' => 'Evaluación por Objetivos',
                'slug' => 'evaluaciones-objetivos',
                'route' => '/desempeno/evaluaciones/objetivos',
                'order' => 2,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $desempenoId,
                'parent_submodule_id' => $evaluacionesId,
                'name' => 'Evaluación Continua',
                'slug' => 'evaluaciones-continua',
                'route' => '/desempeno/evaluaciones/continua',
                'order' => 3,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $desempenoId,
                'name' => 'Objetivos (OKRs)',
                'slug' => 'desempeno-okrs',
                'icon' => 'bullseye',
                'route' => '/desempeno/okrs',
                'order' => 2,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $desempenoId,
                'name' => 'One-on-Ones',
                'slug' => 'desempeno-one-on-ones',
                'icon' => 'users-chat',
                'route' => '/desempeno/one-on-ones',
                'order' => 3,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $desempenoId,
                'name' => 'Feedback',
                'slug' => 'desempeno-feedback',
                'icon' => 'message-square',
                'route' => '/desempeno/feedback',
                'order' => 4,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        // 5. MÓDULO: RECLUTAMIENTO
        $reclutamientoId = DB::table('modules')->insertGetId([
            'name' => 'Reclutamiento',
            'slug' => 'reclutamiento',
            'description' => 'Gestión de vacantes y candidatos',
            'icon' => 'user-search',
            'route' => '/reclutamiento',
            'order' => 5,
            'is_active' => true,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $vacantesId = DB::table('submodules')->insertGetId([
            'module_id' => $reclutamientoId,
            'name' => 'Vacantes',
            'slug' => 'reclutamiento-vacantes',
            'icon' => 'briefcase',
            'route' => '/reclutamiento/vacantes',
            'order' => 1,
            'level' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $reclutamientoId,
                'parent_submodule_id' => $vacantesId,
                'name' => 'Crear Vacante',
                'slug' => 'vacantes-crear',
                'route' => '/reclutamiento/vacantes/crear',
                'order' => 1,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $reclutamientoId,
                'parent_submodule_id' => $vacantesId,
                'name' => 'Publicar Vacante',
                'slug' => 'vacantes-publicar',
                'route' => '/reclutamiento/vacantes/publicar',
                'order' => 2,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $reclutamientoId,
                'name' => 'Candidatos',
                'slug' => 'reclutamiento-candidatos',
                'icon' => 'users',
                'route' => '/reclutamiento/candidatos',
                'order' => 2,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $reclutamientoId,
                'name' => 'Pipeline',
                'slug' => 'reclutamiento-pipeline',
                'icon' => 'workflow',
                'route' => '/reclutamiento/pipeline',
                'order' => 3,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $reclutamientoId,
                'name' => 'Entrevistas',
                'slug' => 'reclutamiento-entrevistas',
                'icon' => 'calendar-event',
                'route' => '/reclutamiento/entrevistas',
                'order' => 4,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        // 6. MÓDULO: CAPACITACIÓN
        $capacitacionId = DB::table('modules')->insertGetId([
            'name' => 'Capacitación',
            'slug' => 'capacitacion',
            'description' => 'Formación y desarrollo de empleados',
            'icon' => 'graduation-cap',
            'route' => '/capacitacion',
            'order' => 6,
            'is_active' => true,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $cursosId = DB::table('submodules')->insertGetId([
            'module_id' => $capacitacionId,
            'name' => 'Cursos',
            'slug' => 'capacitacion-cursos',
            'icon' => 'book',
            'route' => '/capacitacion/cursos',
            'order' => 1,
            'level' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $capacitacionId,
                'parent_submodule_id' => $cursosId,
                'name' => 'Catálogo',
                'slug' => 'cursos-catalogo',
                'route' => '/capacitacion/cursos/catalogo',
                'order' => 1,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $capacitacionId,
                'parent_submodule_id' => $cursosId,
                'name' => 'Mis Cursos',
                'slug' => 'cursos-mis-cursos',
                'route' => '/capacitacion/cursos/mis-cursos',
                'order' => 2,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $capacitacionId,
                'name' => 'Planes de Desarrollo',
                'slug' => 'capacitacion-planes',
                'icon' => 'map',
                'route' => '/capacitacion/planes',
                'order' => 2,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $capacitacionId,
                'name' => 'Certificaciones',
                'slug' => 'capacitacion-certificaciones',
                'icon' => 'award',
                'route' => '/capacitacion/certificaciones',
                'order' => 3,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $capacitacionId,
                'name' => 'Proveedores',
                'slug' => 'capacitacion-proveedores',
                'icon' => 'building',
                'route' => '/capacitacion/proveedores',
                'order' => 4,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        // 7. MÓDULO: BENEFICIOS
        $beneficiosId = DB::table('modules')->insertGetId([
            'name' => 'Beneficios',
            'slug' => 'beneficios',
            'description' => 'Gestión de beneficios y prestaciones',
            'icon' => 'gift',
            'route' => '/beneficios',
            'order' => 7,
            'is_active' => true,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $beneficiosId,
                'name' => 'Seguro Médico',
                'slug' => 'beneficios-seguro-medico',
                'icon' => 'heart-pulse',
                'route' => '/beneficios/seguro-medico',
                'order' => 1,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $beneficiosId,
                'name' => 'Vales de Despensa',
                'slug' => 'beneficios-vales',
                'icon' => 'shopping-cart',
                'route' => '/beneficios/vales',
                'order' => 2,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $beneficiosId,
                'name' => 'Plan de Pensiones',
                'slug' => 'beneficios-pensiones',
                'icon' => 'piggy-bank',
                'route' => '/beneficios/pensiones',
                'order' => 3,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $beneficiosId,
                'name' => 'Otros Beneficios',
                'slug' => 'beneficios-otros',
                'icon' => 'sparkles',
                'route' => '/beneficios/otros',
                'order' => 4,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        // 8. MÓDULO: REPORTES
        $reportesId = DB::table('modules')->insertGetId([
            'name' => 'Reportes y Analítica',
            'slug' => 'reportes',
            'description' => 'Reportes e indicadores de RRHH',
            'icon' => 'chart-bar',
            'route' => '/reportes',
            'order' => 8,
            'is_active' => true,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $dashboardsId = DB::table('submodules')->insertGetId([
            'module_id' => $reportesId,
            'name' => 'Dashboards',
            'slug' => 'reportes-dashboards',
            'icon' => 'dashboard',
            'route' => '/reportes/dashboards',
            'order' => 1,
            'level' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $reportesId,
                'parent_submodule_id' => $dashboardsId,
                'name' => 'Dashboard General',
                'slug' => 'dashboards-general',
                'route' => '/reportes/dashboards/general',
                'order' => 1,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $reportesId,
                'parent_submodule_id' => $dashboardsId,
                'name' => 'Dashboard Ejecutivo',
                'slug' => 'dashboards-ejecutivo',
                'route' => '/reportes/dashboards/ejecutivo',
                'order' => 2,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $reportesId,
                'name' => 'Rotación de Personal',
                'slug' => 'reportes-rotacion',
                'icon' => 'refresh',
                'route' => '/reportes/rotacion',
                'order' => 2,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $reportesId,
                'name' => 'Ausentismo',
                'slug' => 'reportes-ausentismo',
                'icon' => 'calendar-x',
                'route' => '/reportes/ausentismo',
                'order' => 3,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $reportesId,
                'name' => 'Costos de Nómina',
                'slug' => 'reportes-costos',
                'icon' => 'currency-dollar',
                'route' => '/reportes/costos',
                'order' => 4,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $reportesId,
                'name' => 'Exportar Datos',
                'slug' => 'reportes-exportar',
                'icon' => 'download',
                'route' => '/reportes/exportar',
                'order' => 5,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        // 9. MÓDULO: CONFIGURACIÓN
        $configId = DB::table('modules')->insertGetId([
            'name' => 'Configuración',
            'slug' => 'configuracion',
            'description' => 'Configuración del sistema',
            'icon' => 'settings',
            'route' => '/configuracion',
            'order' => 9,
            'is_active' => true,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $empresaId = DB::table('submodules')->insertGetId([
            'module_id' => $configId,
            'name' => 'Empresa',
            'slug' => 'config-empresa',
            'icon' => 'building',
            'route' => '/configuracion/empresa',
            'order' => 1,
            'level' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $configId,
                'parent_submodule_id' => $empresaId,
                'name' => 'Información General',
                'slug' => 'empresa-info',
                'route' => '/configuracion/empresa/info',
                'order' => 1,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $configId,
                'parent_submodule_id' => $empresaId,
                'name' => 'Sucursales',
                'slug' => 'empresa-sucursales',
                'route' => '/configuracion/empresa/sucursales',
                'order' => 2,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $configId,
                'parent_submodule_id' => $empresaId,
                'name' => 'Departamentos',
                'slug' => 'empresa-departamentos',
                'route' => '/configuracion/empresa/departamentos',
                'order' => 3,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $configId,
                'parent_submodule_id' => $empresaId,
                'name' => 'Puestos',
                'slug' => 'empresa-puestos',
                'route' => '/configuracion/empresa/puestos',
                'order' => 4,
                'level' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        DB::table('submodules')->insert([
            [
                'module_id' => $configId,
                'name' => 'Usuarios y Permisos',
                'slug' => 'config-usuarios',
                'icon' => 'shield',
                'route' => '/configuracion/usuarios',
                'order' => 2,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $configId,
                'name' => 'Políticas',
                'slug' => 'config-politicas',
                'icon' => 'file-text',
                'route' => '/configuracion/politicas',
                'order' => 3,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'module_id' => $configId,
                'name' => 'Integraciones',
                'slug' => 'config-integraciones',
                'icon' => 'plug',
                'route' => '/configuracion/integraciones',
                'order' => 4,
                'level' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        echo "✅ Seeder de módulos HR completado exitosamente!\n";
        echo "📊 Módulos creados: 9\n";
        echo "📁 Submódulos nivel 1: ~40\n";
        echo "📂 Sub-submódulos nivel 2: ~15\n";
    }
}