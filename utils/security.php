
<?php
    require_once __DIR__. "/common.php";
    $db = connectToDbAndGetPdo();
    global $db;

    function deconnect() {
        $_SESSION['userId'] = 0;
    }


?>