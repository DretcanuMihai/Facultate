<?php

$connection = new mysqli("localhost", "root", "", "ajax_db");

$query = "UPDATE paine SET denumire=?,cantitate=? WHERE id=?";

$statement = $connection->prepare($query);
$statement->bind_param('sii', $_GET['denumire'], $_GET['cantitate'], $_GET['id']);
$statement->execute();
?>