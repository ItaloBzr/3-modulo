<?php
class Usuario {

    private $id;
    private $nome;
    private $email;
    private $senha;
    private $pdo;

    public function checkUser($email){
        $sql = "SELECT * FROM usuarios WHERE email = :e";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(":e", $email);
        $stmt->execute();

        return $stmt->rowCount() > 0;        
    }

    public function checkPass($email, $senha){
        $sql = "SELECT * FROM usuarios WHERE email = :e AND senha = :s";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(":e", $email);
        $stmt->bindValue(":s", $senha);
        $stmt->execute();

        return$stmt->rowCount() > 0;
    }

    public function connection(){

    $dns = "mysql:dbname=banco;host=localhost;charset=utf8";
    $user = "root";
    $pass = "";

    try {
        $this->pdo = new PDO($dns, $user, $pass);
        return true;

    } catch (PDOException $e) {
        echo "Erro de conexão: ";
        return false;
    }
}
}