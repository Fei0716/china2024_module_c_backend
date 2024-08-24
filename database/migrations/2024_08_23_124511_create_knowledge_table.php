<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('knowledges', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('excerpt');
            $table->text('content');
            $table->timestamps();
            $table->softDeletes();
            $table->unsignedBigInteger('author_id');

            $table->foreign('author_id')->references('id')->on('admins');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('knowledge');
    }
};
