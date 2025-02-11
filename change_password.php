<!doctype html>
<html class="no-js" lang="fr">

<?php
    require_once 'utils/common.php';
    $css_file = 'change_password.css';
    include 'partials/head.php';
    $db = connectToDbAndGetPdo();
    global $db;
    $_SESSION['errorMessagePassword'] = false;
    $_SESSION['errorMessagePassword2'] = false;


if (!isConnect()) {
    header("Location: index.php");
}

    if (isset($_SESSION['message'])) {
        echo '<p style="color: red;">' . $_SESSION['message'] . '</p>';
        unset($_SESSION['message']);
    }

    function formChangePassword($db) {
        $id = $_SESSION["userId"];

        if(isset($_POST['submitForm'])) {
            $old_password = $_POST["old_password"];
            $new_password = $_POST["new_password"];
            $confirm_new_password = $_POST["confirm_new_password"];

            if (checkPasswordUser($old_password, $db)) {
                if (registerPasswordVerif($new_password, $confirm_new_password)) {
                    if ($old_password != $new_password) {
                        $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);
                        $req = $db->prepare('UPDATE `user` SET password = ? WHERE id = ?');
                        $req->execute(array($hashed_password, $id));
                        $_SESSION['message'] = "Changement de mot de passe réussi";
                        header('Location: myAccount.php');
                    }
                    else {
                        $_SESSION['message'] = 'Nouveau et ancien ancien mot de passe identique';
                        header('Location: change_password.php');
                    }
                }
                else {
                    $_SESSION['message'] = 'Nouveau mot de passe erroné ou mot de passe de confirmation invalide';
                    header('Location: change_password.php');
                }
            }
            else {
                $_SESSION['message'] = 'Mot de passe erroné ';
                header('Location: change_password.php');
            }
        }
    }
    formChangePassword($db);

?>

<body>
    <?php include 'partials/header.php'; ?>

    <div class="header_image_container">
        <img src="assets/images/header.png" alt="paysage" class="header_image">
    </div>



<main class="register">

    <div class="registerBox">
        <form method="POST" action="">
            <input type="password" name="old_password" placeholder = "Ancien mot de passe" required>
            <input type="password" name="new_password" placeholder = "Nouveau mot de passe" required>
            <input type="password" name="confirm_new_password" placeholder = "Confirmer nouveau mot de passe" required>
            <button type="submit" name="submitForm" class="registerBtn">Confirmer</button>
        </form>
    </div>


</main>


    <?php include 'partials/footer.php'; ?>
</body>

</html>