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
        Schema::create('withdraws', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('vendor_id')->nullable();
            $table->unsignedBigInteger('store_id')->nullable();
            $table->tinyInteger('payment_method')->comment("1=>Bank; 2=>Bkash; 3=>Nagad; 4=>Rocket; 5=>Upay; 6=>Sure Cash")->nullable();
            $table->string('acc_holder_name')->nullable();
            $table->string('acc_no')->nullable();
            $table->string('bank_name')->nullable();
            $table->string('branch_name')->nullable();
            $table->string('routing_no')->nullable();
            $table->string('swift_code')->nullable();
            $table->string('mobile_no')->nullable();
            $table->string('transaction_id')->comment("Given By Admin While Disbursing Amount")->nullable();
            $table->longText('remarks')->nullable();
            $table->double('amount_before_withdraw')->default(0);
            $table->double('withdraw_amount')->default(0);
            $table->double('amount_after_withdraw')->default(0);
            $table->double('store_comission')->default(0);
            $table->tinyInteger('status')->comment("0=>Pending; 1=>Disbursed; 3=>Denied")->nullable();
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
        Schema::dropIfExists('withdraws');
    }
};
