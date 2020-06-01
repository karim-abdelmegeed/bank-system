<?php

use Illuminate\Database\Seeder;
class CurrencyConversionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $currencies=\App\Currency::all();
        $egp_currency=$currencies->filter(function ($currency){
            if($currency->name=="egp"){
              return $currency;
            }
        })->values()->toArray();
        $euro_currency=$currencies->filter(function ($currency){
            if($currency->name=="euro"){
              return $currency;
            }
        })->values()->toArray();
        $usd_currency=$currencies->filter(function ($currency){
            if($currency->name=="usd"){
              return $currency;
            }
        })->values()->toArray();
        $banks=\App\Bank::all();
        $data=[];
        foreach ($banks as $bank){

            array_push($data,
                ['bank_id'=>$bank->id,
                 'from_currency'=> $usd_currency[0]['id'],
                 'to_currency'=> $egp_currency[0]['id'],
                  'rate'=>15.75
            ]);
            array_push($data,
                ['bank_id'=>$bank->id,
                 'from_currency'=> $euro_currency[0]['id'],
                 'to_currency'=> $egp_currency[0]['id'],
                  'rate'=>19.04
            ]);
            array_push($data,
                ['bank_id'=>$bank->id,
                 'from_currency'=> $euro_currency[0]['id'],
                 'to_currency'=> $usd_currency[0]['id'],
                  'rate'=>1.04
            ]);
        }
        \App\CurrencyConversion::insert($data);
    }
}
