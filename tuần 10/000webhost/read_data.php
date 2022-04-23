<?php
require_once('conection.php');
$query = 'SELECT * FROM mess';
$stm = $db ->prepare($query);
$stm ->execute();
$myarray = array();
if ($stm->rowCount()  > 0) {
    while($row = $stm->fetch(PDO::FETCH_ASSOC)){
    array_push(
        $myarray,$row
    );
}
}
echo json_encode($myarray);
?>
