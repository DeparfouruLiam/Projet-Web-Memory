<?php
    require_once __DIR__. '/database.php';
    require_once __DIR__. '/userConnexion.php';
    require_once __DIR__. '/security.php';
    require_once __DIR__. '/validator.php';



    if (session_status() === PHP_SESSION_NONE) {
        session_start();
        if ($_SESSION['userId'] == null) {
            $_SESSION['userId'] = 0;
        }
        $_SESSION['errorMessageEmail'] = false;
        $_SESSION['errorMessagePseudo'] = false;
        $_SESSION['errorMessagePseudo2'] = false;
        $_SESSION['errorMessagePassword'] = false;
        $_SESSION['errorMessagePassword2'] = false;
        $_SESSION['succesMessageRegister'] = false;
        $_SESSION['errorMessageRegister'] = false;

}
?>
