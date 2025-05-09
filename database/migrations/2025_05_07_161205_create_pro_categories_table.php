<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pro_categories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('parent_id')->default('0');
            $table->integer('order')->default('0');
            $table->string('title')->default('');
            $table->string('icon')->default('');
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
        Schema::dropIfExists('pro_categories');
    }
}
