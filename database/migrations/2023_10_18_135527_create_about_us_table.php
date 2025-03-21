<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAboutUsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('about_us', function (Blueprint $table) {
            $table->id();
            $table->string('banner_bg')->nullable();
            $table->string('image')->nullable();
            $table->string('section_sub_title')->nullable();
            $table->string('section_title')->nullable();
            $table->longText('section_description')->nullable();
            $table->string('btn_icon_class')->nullable();
            $table->string('btn_text')->nullable();
            $table->string('btn_link')->nullable();

            $table->string('mission_image')->nullable();
            $table->string('mission_btn_text')->nullable();
            $table->string('mission_btn_link')->nullable();
            $table->string('mission_section_title')->nullable();
            $table->longText('mission_description')->nullable();

            $table->string('vision_image')->nullable();
            $table->string('vision_btn_text')->nullable();
            $table->string('vision_btn_link')->nullable();
            $table->string('vision_section_title')->nullable();
            $table->longText('vision_description')->nullable();

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
        Schema::dropIfExists('about_us');
    }
}
