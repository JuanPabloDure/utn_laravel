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
        Schema::create('docentes', function (Blueprint $table) {
            $table->id('idDocente');
            $table->string('nombre');
            $table->string('legajo');
            $table->string('telCelular');
            $table->string('telFijo');
            //$table->string('telCelular');
            $table->string('emailDocente');
            $table->string('emailSistemas');
            $table->string('apellido');
            $table->string('activo');
            $table->timestamps();
        });
        // Luego volvemos a agregar la clave primaria con el nuevo nombre
        Schema::table('docentes', function (Blueprint $table) {
            $table->primary('idDocente');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('docentes');
    }
};
