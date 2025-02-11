<?php

session_start();
require 'database.php';

$json = json_decode(file_get_contents('php://input'), true);


$message = $json['message'];

$db = connectToDbAndGetPdo();
$search = (isset($message) AND $message!="") ? '"'.$message.'"' . header('Location: ../games/memory/index.php?sendmessage') : '';
($search!='') ? $req = $db->prepare("INSERT INTO `message`(`game_id`,`sender_id`, `receiver_id`, `content`, `message_date`)
                                    VALUES (1," . $_SESSION['userId'] . ",2," . $search . ", NOW())") : null;
$req->execute();