<?php
$dns = 'mysql:host=localhost;dbname=id17705467_flutter';
$user = 'id17705467_santos';
$pass = '9WY4D5HgQhwohm)o';
try{
    $db = new PDO($dns,$user,$pass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //echo 'connected';
} catch(PDOException $Exception){
    echo $Exception ->getMessage();
}