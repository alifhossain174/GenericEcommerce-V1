<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('courier_api_keys', function (Blueprint $table) {
            $table->id();
            $table->string('image')->nullable();
            $table->string('provider_name');
            $table->string('app_key')->nullable();
            $table->string('secret_key')->nullable();
            $table->string('courier_cod_charge')->nullable();
            $table->tinyInteger('status')->default(1)->comment("0=>Inactive; 1=>Active");

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('courier_api_keys');
    }
};
