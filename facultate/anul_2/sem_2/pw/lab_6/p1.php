<?php

$connection = new mysqli("localhost", "root", "", "ajax_db");

$query = "SELECT Finish FROM route WHERE Start = ?;";

$statement = $connection->prepare($query);
$statement -> bind_param('s', $_GET['string']);
$statement -> execute();
$statement -> bind_result($result);

while($statement -> fetch()){
    echo "<option>" . $result . "</option>";
}

$statement->close();
?>
