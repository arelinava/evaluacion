<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index()
    {
        try{
            $db = \Config\Database::connect();

            $query= $db->query("SELECT * FROM tbtiposcuenta");
            $results = $query->getResultArray();
            
            var_dump($results);

        }catch(Exception $e){

        }

        return view('welcome_message');
    }
}
