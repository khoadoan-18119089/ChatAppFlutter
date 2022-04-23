<?php
$HostName = "localhost";
$DatabaseName = "id17705467_flutter";
$HostUser = "id17705467_santos";
$con = mysqli_connect($HostName,$HostUser,"9WY4D5HgQhwohm)o",$DatabaseName);
$json = file_get_contents('php://input');
$obj = json_decode($json,true);
$isMe = $obj['isMe'];
$messageType = $obj['messageType'];
$message = $obj['message'];
$profileImg = $obj['profileImg'];
$Sql_Query = "insert into mess (isMe,messageType,message,profileImg) values ('$isMe','$messageType','$message','$profileImg')"; 
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
