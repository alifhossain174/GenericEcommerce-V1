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
        Schema::create('footers', function (Blueprint $table) {
            $table->id();

            $table->string('widget1_title')->nullable();
            $table->longText('widget1_links')->nullable();
            $table->string('widget2_title')->nullable();
            $table->longText('widget2_links')->nullable();
            $table->string('widget3_title')->nullable();
            $table->longText('widget3_links')->nullable();
            $table->string('social_link_title')->nullable();
            $table->string('social_links')->nullable();
            
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
        Schema::dropIfExists('footers');
    }
};
