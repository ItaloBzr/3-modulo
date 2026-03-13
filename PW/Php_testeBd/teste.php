<?php

require 'Usuario.class.php';

$usuario = new Usuario();
$conecta = $usuario -> conn();

if ($conecta){
    $user = $usuario->checkUser("adimin@gmail.com" , "123");
    if( $user ){
         echo  " P A R A B E N S ! Usuario existente no banco de dados! ";
    
}else{
    echo "Não existe usuario com esse email cadastrado no banco!";
}
    $pass = $usuario->checkPass("adimin@gmail.com" , "123");
    if( $pass ){
        echo "<script>alert('Usuario e senha cadastrados')</script>";
    }

}else{
    echo "<script>alert('NÃO ENCONTREI Usuario e senha!')</script>";

}

?>