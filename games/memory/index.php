<!DOCTYPE html>
<html lang="fr">

<?php
    require_once __DIR__ . '/../../utils/common.php';
    $css_file = 'memory.css';
    include '../../partials/head.php';
    $db=connectToDbAndGetPdo();

    if (!isConnect()) {
        header("Location: /login.php");
    }

    ?>


<?php
    function random_gif(){
        $url = "https://api.thecatapi.com/v1/images/search?mime_types=gif";
        $response = file_get_contents($url);
        $data = json_decode($response, true);
        $gifUrl = $data[0]['url'];
        echo "<img src='$gifUrl' alt='Cat GIF' />";
    }

?>


<body>
    <?php include '../../partials/header.php'; ?>

  <div class="header_image_container">
      <img src="../../assets/images/header.png" alt="paysage" class="header_image">
      <div class="overlay-text">MEMORY</div>
  </div>

  <main>

      <div class="game-time" id="game-time">Temps de jeu : 0 secondes</div>

      <h1>Choisissez une difficulté et un thème :</h1>
      <label for="difficult-select">Difficulté :</label>
      <select class ="difficulty" id="difficult-select"></select>
      <label for="theme-select">Thème :</label>
      <select class ="theme" id="theme-select"></select>

      <button id="button_start">Lancer la partie</button>
      <button id="button_stop">Arrêter la partie</button>



      <div id="win-message">
          <h2>Félicitations ! Vous avez gagné !</h2>
          <div class="win" style="
        text-align: center;
        background-color: #9402c5;
        border-radius: 10px;
        border: solid 5px #5f0373;
        color: #ffffff;
        font-size: 20px;
        padding: 2px;
        width: 90px;
        cursor: pointer;
        margin: 7px;
        text-decoration: none;
    ">
              <a href="index.php" style="color: #ffffff; text-decoration: none;">Rejouer</a>
          </div>
      </div>




      <div class="memory-grid" id="memory-grid"></div>












      <div class="body">

        <a href="#chat" class="button">ChatBox</a>
        <div id="chat" class="chat-box">
            <div class="chat-header">
                <span>Chat</span>
                <a href="#" class="close-button">x</a>
            </div>
            <div class="chat_body">
                <form action="" method="post" id="chat-form">
                    <label for="Message"><input type="text" placeholder="Écrivez un message..." class="chat-input" name="Message" id="Message"></label>
                </form>
                <div class="gif"><?php random_gif(); ?></div>
                <div class="chat-messages">
                    <p>Bienvenue dans le chat !</p>
                </div>
                <div class="all_messages"></div>




<!--          --><?php
//            $search = (isset($_POST['Message']) AND $_POST['Message']!="") ? '"'.$_POST['Message'].'"' . header('Location: index.php?sendmessage') : '';
//            ($search!='') ? $req = $db->prepare("INSERT INTO `message`(`game_id`,`sender_id`, `receiver_id`, `content`, `message_date`)
//                                                VALUES (1," . $_SESSION['userId'] . ",2," . $search . ", NOW())") : null;
//            $req->execute();
//          ?>

            </div>
        </div>
    </div>

  </main>

    <script src="../../assets/js/send.js"></script>
    <script src="../../assets/js/memory.js"></script>
    <script src="../../assets/js/chatbox.js"></script>
    <?php include '../../partials/footer.php'; ?>
</body>
</html>