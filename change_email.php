<!doctype html>
<html class="no-js" lang="fr">

<?php
    require_once 'utils/common.php';
    $css_file = 'change_email.css';
    include 'partials/head.php';
    $db = connectToDbAndGetPdo();
    global $db;

    if (!isConnect()) {
    header("Location: index.php");
}

    if (isset($_SESSION['message'])) {
    echo '<p style="color: red;">' . $_SESSION['message'] . '</p>';
    unset($_SESSION['message']);
}

    function formChangeEmail($db) {
        $id = $_SESSION["userId"];

        if(isset($_POST['submitForm'])) {
            $email = $_POST["email"];
            $new_email = $_POST['new_email'];
            $password = $_POST['password'];
            if (!emailVerif($email)) {
                if (emailVerif($new_email)) {
                    if (checkPasswordUser($password, $db)){
                        $req = $db->prepare('UPDATE `user` SET email = ? WHERE id = ?');
                        $req->execute(array($new_email, $id));
                        $_SESSION['message'] = "Changement de l'adresse email réussi";
                        header('Location: myAccount.php');
                        exit();
                    }
                    else {
                        $_SESSION['message'] = 'Mot de passe incorrect';
                        header('Location: change_email.php');
                    }
                }
                else {
                    $_SESSION['message'] = 'Nouvel email incorrect';
                    header('Location: change_email.php');
                }
            }
            else {
                $_SESSION['message'] = 'Ancien email invalide';
                header('Location: change_email.php');
            }
        }
    }
    formChangeEmail($db);

?>

<body>
    <?php include 'partials/header.php'; ?>

<div class="header_image_container">
    <img src="assets/images/header.png" alt="paysage" class="header_image">
</div>



<main class="register">
    <form method="POST" action="">
        <div class="registerBox">
            <input type="email" name="email" placeholder="Email" required>
            <input type="email" name="new_email" placeholder="Nouvel Email" required>
            <input type="password" name="password" placeholder="Mot De Passe" required>
            <button type="submit" name="submitForm" class="registerBtn">Accepter</button>
        </div>
    </form>



</main>

    <?php include 'partials/footer.php'; ?>

</body>

</html>