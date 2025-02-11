<?php
    function connectToDbAndGetPdo() {
        $host = 'localhost:8889';
        $dbname = 'memory';
        $user = 'root';
        $password = 'root';

        $dsn = "mysql:host=$host;dbname=$dbname";

        try {
            $pdo = new PDO($dsn, $user, $password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            return $pdo;
        } catch (PDOException $e) {
            echo 'Connexion échouée : ' . $e->getMessage();
            exit;
        }
    }
    $db = connectToDbAndGetPdo();

?>
