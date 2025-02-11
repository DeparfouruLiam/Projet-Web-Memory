<!DOCTYPE html>
<html lang="fr">

<?php
    require_once 'utils/common.php';
    $css_file = 'myAccount.css';
    include 'partials/head.php';
    $bd = connectToDbAndGetPdo();
    global $bd;

    if (isset($_SESSION['message'])) {
        echo '<p style="color: green;">' . $_SESSION['message'] . '</p>';
        unset($_SESSION['message']);
    }

    if (!isConnect()) {
        header("Location: index.php");
    }
?>

<body>
<?php
    include 'partials/header.php';

    $userId = 1;
    $target_dir = "userfiles/";
    $target_file = $target_dir . $userId . '.jpg';
    $uploadOk = 1;
    if(isset($_POST["submit"])) {
        if (move_uploaded_file($_FILES['fileToUpload']['tmp_name'], $target_file)) {
            $uploadOk = 1;
        } else {
            echo "File is not an image.";
            $uploadOk = 0;
        }
    }

?>

<div class="header_image_container">
    <img src="assets/images/header.png" alt="paysage" class="header_image">
    <div class="overlay-text">Mon Espace</div>
</div>

<form action="myAccount.php" method="post" enctype="multipart/form-data">
    Select image to upload:
    <input type="file" name="fileToUpload" id="fileToUpload">
    <input type="submit" value="Upload Image" name="submit">
</form>




<main>
    <div class="userAccount">
        <div class="infoPlayerBox">
            <div class ="backOfProfilPic">
                <img src="<?php echo $target_dir .  $userId . '.jpg' ?>" alt="Profile Pic">
            </div>
            <div class ="backOfInfoPlayer">
                <p><?= getUsername($bd) ?></p>
            </div>
        </div>
        <div class="actionBtn">
            <a href="change_email.php" class="buttonMail">Changer Mon Adresse Mail</a>
            <a href="change_password.php" class = "buttonMotDePasse">Changer Mon Mot De Passe</a>
        </div>
    </div>
</main>


<?php include 'partials/footer.php'; ?>
</body>
</html>