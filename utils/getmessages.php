<?php
require_once __DIR__ . '/common.php';

//
$db = connectToDbAndGetPdo();
$req = $db->prepare("SELECT sender.id AS sender, sender.username AS username, receiver.id AS receiver, `content`,message_date FROM `message` INNER JOIN `user` sender on sender.id = message.sender_id INNER JOIN `user` receiver on receiver.id = message.receiver_id WHERE message_date >= NOW() - INTERVAL 1 DAY  ORDER BY message_date ASC");
$req->execute();
$content_tab= array();
$sender_tab= array();
$receiver_tab= array();
$username_tab= array();
while ($data = $req->fetch()) {
    $content_tab[] = htmlspecialchars($data['content']);
    $receiver_tab[] = htmlspecialchars($data['receiver']);
    $sender_tab[] = htmlspecialchars($data['sender']);
    $username_tab[] = htmlspecialchars($data['username']);
}
$line=0;
            foreach($content_tab as $msg) :
                $userid = "userId";
                $messagesent = "message-sent";
                $messageanswer = 'message-answer';
                $theclass = ($sender_tab[$line] == $_SESSION[$userid]) ?  $messagesent: $messageanswer;
                echo "<div class=$theclass>";
                    echo "<h class='username_msg'> $username_tab[$line] : </h> $msg";
                echo "</div>";
                $line++;
            endforeach;

//$content = $data['content_tab'];

//$search = (isset($_POST['Message']) AND $_POST['Message']!="") ? '"'.$_POST['Message'].'"' . header('Location: index.php?sendmessage') : '';
//            ($search!='') ? $req = $db->prepare("INSERT INTO `message`(`game_id`,`sender_id`, `receiver_id`, `content`, `message_date`)
//                                                VALUES (1," . $_SESSION['userId'] . ",2," . $search . ", NOW())") : null;
//            $req->execute();
// Output the received data