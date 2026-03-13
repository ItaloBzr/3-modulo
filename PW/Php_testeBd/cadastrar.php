<?php

$nome = $_POST['nome'];
$email = $_POST['email'];
$senha = $_POST['senha'];

echo "O nome digitado foi ...: $nome <br>";
echo "O email digitado foi ...: $email <br>";
echo "a senha digitado foi ...: $senha <br>";

require 'Usuario.class.php';
$usuario = new Usuario();
$conecta = $usuario->conn();

if($conecta){   
    $user = $usuario->checkUser($email, $senha);
    if( !$user){
        $user = $usuario->inserUser($nome, $email, $senha);
        if($user){
            echo "Usuário cadastrado com sucesso!";
        }else{
            echo "Erro ao cadastrar usuário";
        }
    }else{
        echo "usuario ja cadastrado. va para login";
    }

    
}else{
    echo "Banco indisponível. Tente mais tarde";
    exit();
}
