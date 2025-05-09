<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProSitesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pro_sites', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('category_id')->comment('分类');
            $table->string('title')->default('')->comment('标题');
            $table->string('thumb')->nullable()->comment('图标');
            $table->string('describe')->default('')->comment('描述');
            $table->string('url')->default('')->comment('网址');
            $table->unsignedTinyInteger('is_show')->default('1')->nullable()->comment('显示/隐藏');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pro_sites');
    }
}
