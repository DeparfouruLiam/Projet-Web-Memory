<?php

    require __DIR__. "/common.php";

    $db = connectToDbAndGetPdo();
    global $db;
    $_SESSION['error'] = false;


    function getUsername($bd) {
        $req = $bd->prepare("SELECT username FROM `user` WHERE id = ?");
        $req->execute(array($_SESSION['userId']));
        $data = $req->fetch();

        return $data ? htmlspecialchars($data["username"]) : "Utilisateur";
    }

    function isConnect() {
        if ($_SESSION['userId'] == 0 ) {
            return false;
        }
        else {
            return true;
        }
    }









?>
