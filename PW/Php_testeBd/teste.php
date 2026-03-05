<?php

require 'usuario.class.php';

$usuario = new Usuario();
$conecta = $usuario->connection();

if ($conecta) {
    $user = $usuario -> checkUser("admin@gmail.com");
    if($user){
        echo "Parabens";
    }else{
        echo "não existe esse usuario";
    }
}else{
    echo "erro ao conectar";
}