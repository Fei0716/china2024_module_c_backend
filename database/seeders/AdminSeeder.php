<?php

namespace Database\Seeders;

use App\Models\Admin;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //create the admin default accounts
        $admin1 = new Admin();
        $admin1->name = 'admin';
        $admin1->password = Hash::make('admin');
        $admin1->save();

        $admin2 = new Admin();
        $admin2->name = 'ntw_001';
        $admin2->password = Hash::make('ntw_001_pwd');
        $admin2->save();

        $admin3 = new Admin();
        $admin3->name = 'ntw_002';
        $admin3->password = Hash::make('ntw_002_pwd');
        $admin3->save();

        $admin4 = new Admin();
        $admin4->name = 'ntw_003';
        $admin4->password = Hash::make('ntw_003_pwd');
        $admin4->save();
    }
}
