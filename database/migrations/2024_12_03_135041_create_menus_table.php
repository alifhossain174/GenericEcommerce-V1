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
        Schema::create('menus', function (Blueprint $table) {
            $table->id();
            $table->string('menu_name')->nullable();
            $table->string('app_url')->nullable();
            $table->string('web_url')->nullable();
            $table->tinyInteger('menu_type')->default(0)->comment("0=>Top Menu; 1=>Main Menu; 2=>Footer Menu");
            $table->unsignedBigInteger('parent_id')->nullable();
            $table->string('parent_menu')->nullable();
            $table->string('icon')->nullable();
            $table->double('serial')->default(1);
            $table->tinyInteger('status')->default(1)->comment("1=>Active; 0=>Inactive");
            $table->string('slug');

            $table->longText('description')->nullable();

            $table->string('meta_title')->nullable();
            $table->string('meta_keywords')->nullable();
            $table->string('meta_description')->nullable();

            $table->string('og_title')->nullable();
            $table->string('og_keywords')->nullable();
            $table->string('og_image')->nullable();

            $table->tinyInteger('featured')->default(0)->comment("0=>Not Featured; 1=>Featured");
            $table->tinyInteger('show_on_navbar')->default(1)->comment("1=>Yes; 0=>No");
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
        Schema::dropIfExists('menus');
    }
};
