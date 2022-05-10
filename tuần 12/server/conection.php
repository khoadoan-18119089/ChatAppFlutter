<?php
$dns = 'mysql:host=localhost;dbname=message';
$user = 'root';
$pass = '';
try{
    $db = new PDO($dns,$user,$pass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //echo 'connected';
} catch(PDOException $Exception){
    echo $Exception ->getMessage();
    exit();
}
?>