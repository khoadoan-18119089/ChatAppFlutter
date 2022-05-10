<?php
$HostName = "localhost";
$DatabaseName = "message";
$HostUser = "root";
$passWord ='';
$con = mysqli_connect($HostName,$HostUser,$passWord,$DatabaseName);
$json = file_get_contents('php://input');
$obj = json_decode($json,true);
$message = $obj['message'];
$sentByMe = $obj['sentByMe'];
$sentByYou = $obj['sentByYou'];
$messageType = $obj['messageType'];
$Sql_Query = "insert into micheline_skyl (message,sentByMe,sentByYou,messageType) values ('$message','$sentByMe','$sentByYou','$messageType')"; 
 if(mysqli_query($con,$Sql_Query)){
	$MSG = 'Data Successfully Submitted.' ;
	$json = json_encode($MSG);
	 echo $json ;
 }
 else{
	echo 'Try Again';
 }
 mysqli_close($con);
?>