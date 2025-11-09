<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('personal', function (Blueprint $table) {
            $table->id();

            // === DATOS PERSONALES ===
            $table->string('nombre');
            $table->string('apellido_paterno');
            $table->string('apellido_materno')->nullable();
            $table->string('correo_electronico')->unique();
            $table->string('telefono')->nullable();
            $table->string('telefono_emergencia')->nullable();
            $table->date('fecha_nacimiento')->nullable();
            $table->enum('sexo', ['masculino', 'femenino', 'otro'])->nullable();
            $table->string('estado_civil')->nullable();
            $table->string('nacionalidad')->default('Mexicana');

            // === DOMICILIO ===
            $table->string('direccion')->nullable();
            $table->string('colonia')->nullable();
            $table->string('ciudad')->nullable();
            $table->string('estado')->nullable();
            $table->string('pais')->nullable()->default('México');
            $table->string('codigo_postal', 10)->nullable();

            // === DATOS LABORALES ===
            $table->unsignedBigInteger('departamento_id')->nullable();
            $table->unsignedBigInteger('puesto_id')->nullable();
            $table->date('fecha_contratacion')->nullable();
            $table->date('fecha_baja')->nullable();
            $table->decimal('salario', 12, 2)->nullable();
            $table->decimal('bono', 12, 2)->nullable();
            $table->enum('tipo_contrato', [
                'tiempo completo',
                'medio tiempo',
                'temporal',
                'prácticas',
                'honorarios'
            ])->default('tiempo completo');
            $table->enum('turno', ['matutino', 'vespertino', 'nocturno', 'mixto'])->nullable();
            $table->enum('estatus', ['activo', 'inactivo', 'baja'])->default('activo');
            $table->integer('dias_vacaciones')->default(0);
            $table->integer('dias_restantes_vacaciones')->default(0);

            // === DATOS FISCALES Y ADMINISTRATIVOS ===
            $table->string('nss')->nullable();  // Seguridad social
            $table->string('rfc')->nullable();
            $table->string('curp')->nullable();
            $table->string('infonavit')->nullable();
            $table->string('numero_empleado')->unique();
            $table->string('banco')->nullable();
            $table->string('numero_cuenta')->nullable();
            $table->string('clabe_interbancaria', 18)->nullable();

            // === INFORMACIÓN ADICIONAL ===
            $table->string('foto')->nullable(); // Path o URL de la foto del empleado
            $table->text('observaciones')->nullable();
            $table->boolean('es_supervisor')->default(false);
            $table->boolean('tiene_acceso_sistema')->default(false);
            $table->unsignedBigInteger('usuario_id')->nullable(); // Relación con tabla users (si aplica)

            // === AUDITORÍA ===
            $table->unsignedBigInteger('creado_por')->nullable();
            $table->unsignedBigInteger('actualizado_por')->nullable();

            $table->timestamps();
            $table->softDeletes();

            // === LLAVES FORÁNEAS (opcional) ===
            $table->foreign('departamento_id')->references('id')->on('departamentos')->nullOnDelete();
            $table->foreign('puesto_id')->references('id')->on('puestos')->nullOnDelete();
            $table->foreign('usuario_id')->references('id')->on('users')->nullOnDelete();
            $table->foreign('creado_por')->references('id')->on('users')->nullOnDelete();
            $table->foreign('actualizado_por')->references('id')->on('users')->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('personal');
    }
};
