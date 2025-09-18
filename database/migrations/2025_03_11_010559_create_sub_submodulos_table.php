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
        Schema::create('sub_submodulos', function (Blueprint $table) {
            $table->id('id_sub_submodulo');
            $table->foreignId('id_submodulo')->constrained('submodulos', 'id_submodulo')->onDelete('cascade');
            $table->string('nombre', 50);
            $table->string('descripcion', 255)->nullable();
            $table->string('icono', 50)->nullable();
            $table->string('ruta', 100)->nullable();
            $table->integer('orden')->nullable();
            $table->boolean('activo')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sub_submodulos');
    }
};
