<!doctype html>
<html class="no-js" lang="fr">

<?php
    require_once 'utils/common.php';
    $css_file = 'index.css';
    include 'partials/head.php';
    $db = connectToDbAndGetPdo();

    if (isset($_SESSION['message'])) {
    echo '<p style="color: green;">' . $_SESSION['message'] . '</p>';
    unset($_SESSION['message']);
}

?>

    <?php function stat_request($sql_request,$sql_name) {
    $db = connectToDbAndGetPdo();
    $req = $db->prepare($sql_request);
    $req->execute();
    $data = $req->fetch();
    echo isset($data[$sql_name]) ? $data[$sql_name] : "";
    };?>



<body>
    <?php include 'partials/header.php'; ?>

  <div class="Play">
    <section>

        <div class="Bienvenue">
            <h2>BIENVENUE DANS NOTRE STUDIO !</h2>
        </div>

        <div class="play_button">
            <a href="<?php echo isConnect() ? 'games/memory/index.php' : 'login.php' ?>">JOUER !</a>
        </div>

    </section>
  </div>

    <div class="<?php echo ($_SESSION['succesMessageRegister']) ? 'succesRegisterOn' : 'inactif'; ?>">
        <p>Inscription réussie !</p>
    </div>


  <section>
    <div class="Rules">

      <div class="rules_title">
        <h3>LES RÈGLES DU JEU</h3>
      </div>

      <div class="rules_img">
        <img src="assets/images/Exemple.png" alt="Exemple" height="400" width="400" class="Image_ex"/>
        <img src="assets/images/Memoire.png" alt="Mémoire" height="400" width="200" class="Image_mem"/>
        <img src="assets/images/Trophee.png" alt="Compétition" height="400" width="200" class="Image_trophee"/>
      </div>

      <div class="Rules_ps">

        <div class="rules_nb">01</div>
        <div class="rules_p">
            <h6>Un jeu amusant</h6>
            <p>Dans ce jeu, vous devez retrouver la paire de chaque carte le plus vite possible! Mettez vos talents à l'épreuve au travers de plusieurs niveaux de difficultés!</p>
        </div>

        <div class="rules_nb">02</div>
        <div class="rules_p">
            <h6>Un exercice mémoriel</h6>
            <p>Un jeu qui entraîne votre mémoire afin de garder votre cerveau actif! Amusez-vous tout en améliorant vos talents et vos capacitées mentales!</p>
        </div>

        <div class="rules_nb">03</div>
        <div class="rules_p">
            <h6>Une compétition</h6>
            <p>Défiez les joueurs du monde entier en faisant les meilleurs temps possibles! Améliorez vos temps et battez vos records!</p>
        </div>

      </div>
    </div>
  </section>


  <section>
    <div class="Stats">

      <div class="stats_title"><h3>STATISTIQUES</h3></div>

      <div class="stats_content">

        <div class="big_img">
          <img src="assets/images/Stats.jpg" height="323px" width="323px" alt="Stats"/>
        </div>

        <div class="stats-lr">

            <div class="stats_left">

                <div class="background"> <img src="assets/images/Cartes.jpg" width="150px" height="150px" alt="">
                <div class="statistique">
                    <p>Parties jouées:</p>
                    <?php $request="SELECT COUNT(score_game) AS nb_played FROM `score`";
                    stat_request($request,"nb_played"); ?>
                </div></div>

                <div class="background"> <img src="assets/images/leaderboard.png" width="150px" height="150px" alt="">
                <div class="statistique">
                    <p>Record de score:</p>
                    <?php $request="SELECT score_game AS high_score 
                                    FROM `score` 
                                    ORDER BY score_game DESC 
                                    LIMIT 1";
                    stat_request($request,"high_score"); ?>
                </div></div>

            </div>


            <div class="stats_right">

                <div class="background"> <img src="assets/images/user.jpg" width="150px" height="150px" alt="">
                <div class="statistique">
                    <p>Joueurs aujourd'hui:</p>
                    <?php $request="SELECT COUNT(id) AS nb_recent_users 
                                    FROM user 
                                    WHERE last_login >= NOW() - INTERVAL 1 DAY";
                    stat_request($request,"nb_recent_users"); ?>
                </div></div>

                <div class="background"> <img src="assets/images/community.png" width="150px" height="150px" alt="">
                <div class="statistique">
                    <p>Nombre de membres</p>
                    <?php $request="SELECT COUNT(id) AS nb_users 
                                    FROM user";
                        stat_request($request,"nb_users"); ?>
                </div></div>

            </div>
        </div>

      </div>
    </div>
  </section>


  <section>

      <div class="team_title">
        <h3>NOTRE ÉQUIPE</h3>
      </div>

      <div class="team_content">

        <div class="team_left">

            <div class="members"> <img src="assets/images/badis.png" width="140px" height="140px" alt="Badis">
                <div class="name"><p>OUBAICHE Badis</p></div>
                <div class="work"><p>Développeur Web</p></div>
            </div>

            <div class="members">
                <img src="assets/images/liam.png" width="140px" height="140px" alt="Liam">
                <div class="name"><p>DEPARFOURU Liam</p></div>
                <div class="work"><p>Développeur Web</p></div>
            </div>

        </div>


        <div class="team_right">

            <div class="members"> <img src="assets/images/nolhan.png" width="140px" height="140px" alt="Nolhan">
                <div class="name"><p>OPPIO Nolhan</p></div>
                <div class="work"><p>Scrum Master</p><p>Développeur Web</p></div>
            </div>

            <div class="members"> <img src="assets/images/shayan.png" width="140px" height="140px" alt="Shayan">
                <div class="name"><p>CAHELO Shayan</p></div>
                <div class="work"><p>Développeur Web</p></div>
            </div>

        </div>

      </div>
  </section>

    <?php include 'partials/footer.php'; ?>
</body>

</html>
