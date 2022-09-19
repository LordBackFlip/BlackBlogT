<?php
    $client_id = "";
    $image = file_get_contents("tmp.png");

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, 'https://api.imgur.com/3/image.json');
    curl_setopt($ch, CURLOPT_POST, TRUE);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Authorization: Client-ID ' . $client_id));
    curl_setopt($ch, CURLOPT_POSTFIELDS, array('image' => base64_encode($image)));

    $reply = curl_exec($ch);
    curl_close($ch);

    $reply = json_decode($reply);

    imagedestroy($img);
    unlink("tmp.png");
    
    die($reply->data->link);