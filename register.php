<!doctype html>
<html class="no-js" lang="fr">

<?php
    require_once __DIR__. "/utils/common.php";

    $css_file = 'register.css';
    include 'partials/head.php';

    $db = connectToDbAndGetPdo();
    global $db;

    function initError() {
        $_SESSION['errorMessageEmail'] = false;
        $_SESSION['errorMessagePseudo'] = false;
        $_SESSION['errorMessagePseudo2'] = false;
        $_SESSION['errorMessagePassword'] = false;
        $_SESSION['errorMessagePassword2'] = false;
        $_SESSION['succesMessageRegister'] = false;
        $_SESSION['errorMessageRegister'] = false;
    }
    initError();


    function formRegister($db) {
        if (isset($_POST['submitInscription'])) {
            $email = $_POST['email'];
            $pseudo = $_POST['pseudo'];
            $password = $_POST['password'];
            $confirm_password = $_POST['confirm_password'];

            if (pseudoVerif($pseudo) && emailVerif($email) && registerPasswordVerif($password, $confirm_password, $db)) {
                $hashed_mdp = password_hash($password, PASSWORD_DEFAULT);
                $req = $db->prepare('INSERT INTO `user` (username, email, password,registration_date,last_login) VALUES (?, ?, ?, NOW(), NOW())');
                $req->execute([$pseudo, $email, $hashed_mdp]);
                $lastInsertId = $db->lastInsertId();
                $_SESSION['userId'] = $lastInsertId;
                $_SESSION['succesMessageRegister'] = true;
                $_SESSION['message'] = "Inscription réussi";
                header("Location: ../index.php");
            }
            else {
                $_SESSION['errorMessageRegister'] = true;
            }
        }
    }
    formRegister($db);
?>


<body>
<?php include 'partials/header.php'; ?>
<div class="header_image_container">
    <img src="assets/images/header.png" alt="paysage" class="header_image">
    <div class="overlay-text">Inscription</div>
</div>

<main>
    <div class="registerBox">
        <form method = "POST" action="">
            <input name="email" placeholder="Email" type="email">
            <input name="pseudo" placeholder="Pseudo" type="text">
            <input name="password" id="password" placeholder="Mot de passe" type="password">
            <progress id="progress-bar" value="0" max="100"></progress><br/>
            <input name = "confirm_password" placeholder="Confirm le mot de passe" type="password">
            <button name = 'submitInscription' value ="Inscription" type="submit"> Inscription </button>
        </form>
        <div class="<?php echo $_SESSION['errorMessageEmail'] ? 'active' : 'inactif'; ?>">
            <p>l'adresse mail est déjà utilisé</p>
        </div>
        <div class="<?php echo ($_SESSION['errorMessagePseudo']) ? 'active' : 'inactif'; ?>">
            <p>pseudo invalide, votre pseudo doit avoir minimum 4 lettres</p>
        </div>
        <div class="<?php echo ($_SESSION['errorMessagePseudo2']) ? 'active' : 'inactif'; ?>">
            <p>pseudo déjà existant</p>
        </div>
        <div class="<?php echo ($_SESSION['errorMessagePassword']) ? 'active' : 'inactif'; ?>">
            <p>Le mot de passe doit comporter au minimum 8 caractères, 1 majuscule et 1 caractère spécial.</p>
        </div>
        <div class="<?php echo ($_SESSION['errorMessagePassword2']) ? 'active' : 'inactif'; ?>">
            <p>Les mots de passe ne sont pas identiques</p>
        </div>

        <div class="<?php echo ($_SESSION['errorMessageRegister']) ? 'active' : 'inactif'; ?>">
             <p>l'inscritpion a échoué</p>
        </div>
</main>

<script src="assets/js/register.js"></script>
<?php include 'partials/footer.php';?>
</body>
</html>