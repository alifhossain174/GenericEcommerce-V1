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
        Schema::create('buy_sells', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('category_id')->nullable();
            $table->string('product_title')->nullable();
            $table->string('regular_price')->nullable();
            $table->string('discount_price')->nullable();
            $table->string('phone')->nullable();
            $table->string('condition')->nullable();
            $table->string('brand')->nullable();
            $table->string('model')->nullable();
            $table->string('color')->nullable();
            $table->longText('description')->nullable();
            $table->string('posted_by')->nullable();
            $table->string('image')->nullable();

            $table->string('slug');
            $table->tinyInteger('status')->default(1)->comment("0=>Pending; 1=>Approve; 2=>Deny; 3=>Sold");
            $table->double('serial')->default(1);

            $table->string('meta_title')->nullable();
            $table->string('meta_keyword')->nullable();
            $table->longText('meta_description')->nullable();

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
        Schema::dropIfExists('buy_sells');
    }
};
