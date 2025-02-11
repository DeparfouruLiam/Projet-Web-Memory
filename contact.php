<!DOCTYPE html>
<html lang="fr">

<?php

    require_once 'utils/common.php';
    include_once 'utils/userConnexion.php';


    $css_file = 'contact.css';
    require 'partials/head.php';

    function email() {
        if(isset($_GET['submitForm'])) {
            $to      = $_POST["email"];
            $subject = $_POST['subject'];
            $message = $_POST['message'];
            $headers = 'From: river.officiel@gmail.com' . "\r\n" .
                'Reply-To: river.officiel@gmail.com' . "\r\n" .
                'X-Mailer: PHP/' . phpversion();

            mail($to, $subject, $message, $headers);
        }
    };


    email();
    ?>


<body>
    <?php include 'partials/header.php'; ?>
    <div class="header_image_container"><img src="../../assets/images/header.png" alt="paysage" class="header_image">
    <div class="overlay-text">Tableau des Scores</div></div>


    <main>

        <div class="list">
            <div class="black_square">
                <img src="assets/images/phone-solid%20(2).svg" alt="phone">
                <span>06 05 56 75 44</span>
            </div>

            <div class="black_square">
                <img src="assets/images/envelope-solid%20(3).svg" alt="email">
                <span>support@powerofmemory.fr</span>
            </div>
            <div class="black_square">
                <img src="assets/images/location-dot-solid%20(2).svg" alt="map marker">
                <span>Cergy</span>
            </div>
        </div>



        <div class="contact_box">
            <form method="POST" action="">
                <div class="list2">
                    <input class="input" type="text" name="nom" placeholder="Nom" required>
                    <input class="input" type="email" name="email" placeholder="Email" required>
                </div>
                <input class="input" type="text" name="sujet" placeholder="Sujet" required>
                <textarea class="input_message" name="message" placeholder="Message" required></textarea>
                <button type="submit" name="submitForm">Envoyer</button>
            </form>
        </div>



    </main>




    <?php include 'partials/footer.php'; ?>
</body>

</html>