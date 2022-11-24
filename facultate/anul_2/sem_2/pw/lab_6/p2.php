<?php

$connection = new mysqli("localhost", "root", "", "ajax_db");

$current_offset = $_GET['page_index'] * 3;

$query = "SELECT * FROM persoana LIMIT 3 OFFSET ?";

$statement = $connection->prepare($query);
$statement->bind_param('i', $current_offset);
$statement->execute();
$statement->bind_result($t1, $t2, $t3, $t4);


while ($statement->fetch()) {
    echo "<tr>";
    echo "<td>" . $t1 . "</td>";
    echo "<td>" . $t2 . "</td>";
    echo "<td>" . $t3 . "</td>";
    echo "<td>" . $t4 . "</td>";
    echo "</tr>";
}
?>