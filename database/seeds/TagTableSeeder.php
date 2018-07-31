<?php

use App\Tag;
use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class TagTableSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        Tag::truncate();

        factory(Tag::class,5)->create();
    }
}