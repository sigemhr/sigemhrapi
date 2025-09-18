<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('permisos_submodulo', function (Blueprint $table) {
            $table->foreignId('id_rol')->constrained('roles', 'id_rol')->onDelete('cascade');
            $table->foreignId('id_submodulo')->constrained('submodulos', 'id_submodulo')->onDelete('cascade');
            $table->foreignId('id_tipo_permiso')->constrained('tipos_permiso', 'id_tipo_permiso')->onDelete('cascade');
            $table->timestamp('fecha_asignacion')->useCurrent();
            $table->primary(['id_rol', 'id_submodulo', 'id_tipo_permiso']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('permisos_submodulo');
    }
};
