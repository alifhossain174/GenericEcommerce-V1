<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCartsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('carts', function (Blueprint $table) {
            $table->id();
            $table->string('user_unique_cart_no');
            $table->unsignedBigInteger('product_id');

            // added later start
            $table->unsignedBigInteger('color_id')->comment("Variant")->nullable();
            $table->unsignedBigInteger('region_id')->comment("Variant")->nullable();
            $table->unsignedBigInteger('sim_id')->comment("Variant")->nullable();
            $table->unsignedBigInteger('storage_id')->comment("Variant")->nullable();
            $table->unsignedBigInteger('warrenty_id')->comment("Variant")->nullable();
            $table->unsignedBigInteger('device_condition_id')->comment("Variant")->nullable();
            // added later end

            $table->unsignedBigInteger('unit_id')->nullable();
            $table->double('qty');
            $table->double('unit_price');
            $table->double('total_price');
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
        Schema::dropIfExists('carts');
    }
}
