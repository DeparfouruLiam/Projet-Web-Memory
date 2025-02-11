<?php


session_start();
require 'database.php';

if ("$_POST[difficult]"==1){
    $diff="Facile";
}
else if ("$_POST[difficult]"==2){
    $diff="Moyen";
}
else{
    $diff="Difficile";
}


$db = connectToDbAndGetPdo();
$req = $db->prepare("INSERT INTO `score`(`player_id`, `game_id`, `difficulty`, `score_game`, `game_date`) 
                            VALUES (".$_SESSION['userId'].",1,'".$diff."',$_POST[timer],NOW())");
$req->execute();


