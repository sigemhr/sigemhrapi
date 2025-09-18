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
        Schema::create('usuario_roles', function (Blueprint $table) {
            $table->foreignId('id_usuario')->constrained('users', 'id')->onDelete('cascade');
            $table->foreignId('id_rol')->constrained('roles', 'id_rol')->onDelete('cascade');
            $table->timestamp('fecha_asignacion')->useCurrent();
            $table->primary(['id_usuario', 'id_rol']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('usuario_roles');
    }
};
