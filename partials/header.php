<header>
    <link rel="stylesheet" href="/assets/css/header.css">
    <?php

    include $_SERVER['DOCUMENT_ROOT'] . '/partials/head.php';

    $current_path = $_SERVER['REQUEST_URI'];
    $bd = connectToDbAndGetPdo();
    global $bd;

    if (isset($_GET['action']) && $_GET['action'] === 'deconnect') {
        deconnect();
        header("Location: login.php");
        exit();
    }

    ?>

    <div class="menu">
        <div class="menu_title"><div>Power Of Memory</div></div>
        <ul class="menu_right">
            <li class="<?php echo ($current_path == '/index.php') ? 'isPage' : ''; ?>">
                <a href="/index.php"><div>Accueil</div></a>
            </li>
            <li class="<?php echo ($current_path == '/games/memory/index.php') ? 'isPage' : ''; ?>">
                <a href="/games/memory/index.php"><div>Jouer</div></a>
            </li>
            <li class="<?php echo ($current_path == '/games/memory/scores.php') ? 'isPage' : ''; ?>">
                <a href="/games/memory/scores.php"><div>Scores</div></a>
            </li>
            <li class="has_sous_nav <?php echo ($current_path == '/myAccount.php' || $current_path == '/login.php' || $current_path == '/register.php') ? 'isPage' : ''; ?>">
                <a href="#"><div><?= getUsername($bd) ?></div></a>
                <ul class="under_menu">
                    <li class="<?= isConnect() ? 'connectOn' : 'connectOff' ?>"><a href="/myAccount.php"><div>Mon espace</div></a></li>
                    <li class="<?= isConnect() ? 'connectOff' : 'connectOn' ?>"><a href="/login.php"><div>Connexion</div></a></li>
                    <li class="<?= isConnect() ? 'connectOff' : 'connectOn' ?>"><a href="/register.php"><div>Inscription</div></a></li>
                    <li class="<?= isConnect() ? 'connectOn' : 'connectOff' ?>"><a href="/index.php?action=deconnect"><div>Déconnexion</div></a></li>
                </ul>
            </li>
            <li class="<?php echo ($current_path == '/contact.php') ? 'isPage' : ''; ?>">
                <a href="/contact.php"><div>Contact</div></a>
            </li>
        </ul>
    </div>
</header>
