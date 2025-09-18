<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;
return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::statement("
        CREATE VIEW vista_permisos_usuario AS
        SELECT 
            u.id,
            u.name AS nombre_usuario,
            u.email,
            r.id_rol,
            r.nombre AS nombre_rol,
            m.id_modulo,
            m.nombre AS nombre_modulo,
            m.icono AS icono_modulo,
            m.orden AS orden_modulo,
            NULL AS id_submodulo,
            NULL AS nombre_submodulo,
            NULL AS icono_submodulo,
            NULL AS orden_submodulo,
            NULL AS id_sub_submodulo,
            NULL AS nombre_sub_submodulo,
            NULL AS icono_sub_submodulo,
            NULL AS ruta_sub_submodulo,
            NULL AS orden_sub_submodulo,
            tp.id_tipo_permiso,
            tp.nombre AS nombre_permiso
        FROM 
            users u
        JOIN 
            usuario_roles ur ON u.id = ur.id_usuario
        JOIN 
            roles r ON ur.id_rol = r.id_rol
        JOIN 
            permisos_modulo pm ON r.id_rol = pm.id_rol
        JOIN 
            modulos m ON pm.id_modulo = m.id_modulo
        JOIN 
            tipos_permiso tp ON pm.id_tipo_permiso = tp.id_tipo_permiso
        WHERE 
            m.activo = TRUE

        UNION ALL

        SELECT 
            u.id,
            u.name AS nombre_usuario,
            u.email,
            r.id_rol,
            r.nombre AS nombre_rol,
            m.id_modulo,
            m.nombre AS nombre_modulo,
            m.icono AS icono_modulo,
            m.orden AS orden_modulo,
            sm.id_submodulo,
            sm.nombre AS nombre_submodulo,
            sm.icono AS icono_submodulo,
            sm.orden AS orden_submodulo,
            NULL AS id_sub_submodulo,
            NULL AS nombre_sub_submodulo,
            NULL AS icono_sub_submodulo,
            NULL AS ruta_sub_submodulo,
            NULL AS orden_sub_submodulo,
            tp.id_tipo_permiso,
            tp.nombre AS nombre_permiso
        FROM 
            users u
        JOIN 
            usuario_roles ur ON u.id = ur.id_usuario
        JOIN 
            roles r ON ur.id_rol = r.id_rol
        JOIN 
            permisos_submodulo ps ON r.id_rol = ps.id_rol
        JOIN 
            submodulos sm ON ps.id_submodulo = sm.id_submodulo
        JOIN 
            modulos m ON sm.id_modulo = m.id_modulo
        JOIN 
            tipos_permiso tp ON ps.id_tipo_permiso = tp.id_tipo_permiso
        WHERE 
            sm.activo = TRUE AND m.activo = TRUE

        UNION ALL

        SELECT 
            u.id,
            u.name AS nombre_usuario,
            u.email,
            r.id_rol,
            r.nombre AS nombre_rol,
            m.id_modulo,
            m.nombre AS nombre_modulo,
            m.icono AS icono_modulo,
            m.orden AS orden_modulo,
            sm.id_submodulo,
            sm.nombre AS nombre_submodulo,
            sm.icono AS icono_submodulo,
            sm.orden AS orden_submodulo,
            ssm.id_sub_submodulo,
            ssm.nombre AS nombre_sub_submodulo,
            ssm.icono AS icono_sub_submodulo,
            ssm.ruta AS ruta_sub_submodulo,
            ssm.orden AS orden_sub_submodulo,
            tp.id_tipo_permiso,
            tp.nombre AS nombre_permiso
        FROM 
            users u
        JOIN 
            usuario_roles ur ON u.id = ur.id_usuario
        JOIN 
            roles r ON ur.id_rol = r.id_rol
        JOIN 
            permisos_sub_submodulo pssm ON r.id_rol = pssm.id_rol
        JOIN 
            sub_submodulos ssm ON pssm.id_sub_submodulo = ssm.id_sub_submodulo
        JOIN 
            submodulos sm ON ssm.id_submodulo = sm.id_submodulo
        JOIN 
            modulos m ON sm.id_modulo = m.id_modulo
        JOIN 
            tipos_permiso tp ON pssm.id_tipo_permiso = tp.id_tipo_permiso
        WHERE 
            ssm.activo = TRUE AND sm.activo = TRUE AND m.activo = TRUE
    ");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::statement("DROP VIEW IF EXISTS vista_permisos_usuario");
    }
};
