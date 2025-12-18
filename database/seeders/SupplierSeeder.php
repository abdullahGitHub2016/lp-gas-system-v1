<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Supplier;

class SupplierSeeder extends Seeder
{
    public function run(): void
    {
        Supplier::insert([
            ['name'=>'ABC Supplies','contact_person'=>'Mr. Rahman','phone'=>'01711111111','address'=>'Dhaka','credit_limit'=>100000],
            ['name'=>'Delta Traders','contact_person'=>'Ms. Sultana','phone'=>'01712222222','address'=>'Chittagong','credit_limit'=>150000],
            ['name'=>'Omega Store','contact_person'=>'Mr. Karim','phone'=>'01713333333','address'=>'Khulna','credit_limit'=>200000],
        ]);
    }
}
