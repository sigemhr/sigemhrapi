<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('puestos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('departamento_id')->nullable();
            $table->string('nombre');
            $table->string('codigo', 10)->unique();
            $table->string('nivel')->nullable(); // Ej: Junior, Senior, Coordinador
            $table->text('descripcion')->nullable();
            $table->decimal('salario_min', 12, 2)->nullable();
            $table->decimal('salario_max', 12, 2)->nullable();
            $table->boolean('activo')->default(true);
            $table->timestamps();

            $table->foreign('departamento_id')->references('id')->on('departamentos')->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('puestos');
    }
};
