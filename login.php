<!doctype html>
<html class="no-js" lang="fr">

<?php
    require_once __DIR__. '/utils/common.php';
    $css_file = 'register.css';
    include 'partials/head.php';
    $db = connectToDbAndGetPdo();
    global $db;

    if (isset($_SESSION['message'])) {
        echo '<p style="color: red;">' . $_SESSION['message'] . '</p>';
        unset($_SESSION['message']);
    }

    function formLogin($db) {
        if (isset($_POST['submitConnexion'])) {
            $email = $_POST['email_login'];
            $password = $_POST['password_login'];

            $idValid = identifiantVerif($email, $password, $db);

            if($idValid != false){
                $req = $db->prepare('UPDATE `user` SET last_login = NOW() WHERE email = ?');
                $req->execute([$email]);
                $_SESSION['message'] = 'Connexion réussie';
                header("Location: /index.php");
                exit();
            }
            else{
                $_SESSION['message'] = 'Mot de passe ou email incorecte';
                header("Location: ../login.php");
            }
        }
    }
    formLogin($db);

?>

<body>
    <?php include 'partials/header.php'; ?>

<div class="header_image_container">
    <img src="assets/images/header.png" alt="paysage" class="header_image">
    <div class="overlay-text">Connexion</div>
</div>

<main class="register">

    <div class="registerBox">
        <form method = "POST" action="">
            <input name = 'email_login' placeholder="Email">
            <input name = 'password_login' placeholder="Mot de passe">
            <button name = 'submitConnexion' class ="registerBtn" type="submit"> Connexion </button>
        </form>
    </div>


</main>


<?php include 'partials/footer.php'; ?>
</body>

</html>