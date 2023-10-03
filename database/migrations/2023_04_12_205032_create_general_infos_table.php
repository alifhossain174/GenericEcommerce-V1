<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGeneralInfosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('general_infos', function (Blueprint $table) {
            $table->id();
            $table->string('logo')->nullable();
            $table->string('logo_dark')->nullable();
            $table->string('fav_icon')->nullable();
            $table->string('tab_title')->nullable();
            $table->string('company_name')->nullable();
            $table->longText('short_description')->nullable();
            $table->string('contact')->nullable();
            $table->string('email')->nullable();
            $table->longText('address')->nullable();
            $table->string('google_map_link')->nullable();
            $table->string('footer_copyright_text')->nullable();

            $table->longText('custom_css')->nullable();
            $table->longText('custom_js')->nullable();

            // project color
            $table->string('primary_color')->nullable();
            $table->string('secondary_color')->nullable();
            $table->string('tertiary_color')->nullable();
            $table->string('title_color')->nullable();
            $table->string('paragraph_color')->nullable();
            $table->string('border_color')->nullable();

            $table->string('meta_title')->nullable();
            $table->string('meta_keywords')->nullable();
            $table->longText('meta_description')->nullable();

            // social media links
            $table->string('facebook')->nullable();
            $table->string('instagram')->nullable();
            $table->string('twitter')->nullable();
            $table->string('linkedin')->nullable();
            $table->string('youtube')->nullable();
            $table->string('messenger')->nullable();
            $table->string('whatsapp')->nullable();
            $table->string('telegram')->nullable();

            $table->longText('about_us')->nullable();
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
        Schema::dropIfExists('general_infos');
    }
}
