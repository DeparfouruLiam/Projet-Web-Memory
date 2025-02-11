<?php
    require_once __DIR__. "/common.php";

    function emailVerif($email) {
        global $db;
        $req = $db->prepare('SELECT email FROM `user` WHERE email = ?');
        $req->execute([$email]);

        if ($req->fetch() != null) {
            $_SESSION['errorMessageEmail'] = true;
            return false;
        }
        return true;
    }

    function pseudoVerif($pseudo) {
        global $db;
        if (strlen($pseudo) < 4) {
            $_SESSION['errorMessagePseudo'] = true;
            return false;
        }
        $req = $db->prepare('SELECT username FROM `user` WHERE username = ?');
        $req->execute([$pseudo]);

        if ($req->fetch() != null) {
            $_SESSION['errorMessagePseudo2'] = true;
            return false;
        }
        return true;
    }

    function registerPasswordVerif($password, $confirm_password) {
        if (strlen($password) < 8 || !preg_match('/[A-Z]/', $password) || !preg_match('/[\W]/', $password)) {
            $_SESSION['errorMessagePassword'] = true;
            return false;
        }
        if ($password !== $confirm_password) {
            $_SESSION['errorMessagePassword2'] = true;
            return false;
        }
        return true;
    }

    function identifiantVerif($email, $password, $db) {
        $req = $db->prepare('SELECT id, password FROM `user` WHERE email = ?');
        $req->execute([$email]);
        $user = $req->fetch();

        if($user&&password_verify($password,$user['password'])){
            $_SESSION['userId'] = $user['id'];
            return $_SESSION['userId'];
        }
        return false;
    }

    function checkPasswordUser($password, $db) {
        $id = $_SESSION['userId'];
        $req = $db->prepare('SELECT password FROM `user` WHERE id = ?');
        $req->execute(array($id));
        $result = $req->fetch();

        if ($result && password_verify($password, $result['password'])) {
            return true;
        }
        return false;
    }

?>