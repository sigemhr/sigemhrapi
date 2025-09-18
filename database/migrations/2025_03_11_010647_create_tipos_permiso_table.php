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
        Schema::create('tipos_permiso', function (Blueprint $table) {
            $table->id('id_tipo_permiso');
            $table->string('nombre', 20)->unique();
            $table->string('descripcion', 255)->nullable();
        });

        // Insertar tipos de permisos básicos
        DB::table('tipos_permiso')->insert([
            ['nombre' => 'acceso', 'descripcion' => 'Permiso para acceder al módulo/submódulo/sub-submódulo'],
            ['nombre' => 'lectura', 'descripcion' => 'Permiso para ver datos en el módulo/submódulo/sub-submódulo'],
            ['nombre' => 'escritura', 'descripcion' => 'Permiso para crear y modificar datos en el módulo/submódulo/sub-submódulo'],
        ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tipos_permiso');
    }
};
