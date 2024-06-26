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
        Schema::create('comisiones', function (Blueprint $table) {
            $table->id('idComision');
            $table->string('comisionNro');
            $table->string('idTurno');
            $table->string('name');
            $table->string('codigo');
            $table->string('tipo');
            $table->string('activo');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('comisiones');
    }
};
