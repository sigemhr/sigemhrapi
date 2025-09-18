<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('submodulos', function (Blueprint $table) {
            $table->id('id_submodulo');
            $table->foreignId('id_modulo')->constrained('modulos', 'id_modulo')->onDelete('cascade');
            $table->string('nombre', 50);
            $table->string('descripcion', 255)->nullable();
            $table->string('icono', 50)->nullable();
            $table->integer('orden')->nullable();
            $table->boolean('activo')->default(true);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('submodulos');
    }
};
