<?php

$connection = new mysqli("localhost", "root", "", "ajax_db");

$attr = $_GET['attr'];
$value = $_GET['value'];
if ($attr === "Memorie" || $attr === "CapacitateHDD") {
    $query = "SELECT * FROM notebook where " . $attr . " = ?";
    $statement = $connection->prepare($query);
    $statement->bind_param('i', $value);
    $statement->execute();
    $statement->bind_result($t1, $t2, $t3, $t4, $t5,$t6);
    while ($statement->fetch()) {
        echo "<tr>";
        echo "<td>" . $t1 . "</td>";
        echo "<td>" . $t2 . "</td>";
        echo "<td>" . $t3 . "</td>";
        echo "<td>" . $t4 . "</td>";
        echo "<td>" . $t5 . "</td>";
        echo "<td>" . $t6 . "</td>";
        echo "</tr>";
    }
} else {
    $value="%".$value."%";
    $query = "SELECT * FROM notebook where " . $attr . " like ?";
    $statement = $connection->prepare($query);
    $statement->bind_param('s', $value);
    $statement->execute();
    $statement->bind_result($t1, $t2, $t3, $t4, $t5,$t6);
    while ($statement->fetch()) {
        echo "<tr>";
        echo "<td>" . $t1 . "</td>";
        echo "<td>" . $t2 . "</td>";
        echo "<td>" . $t3 . "</td>";
        echo "<td>" . $t4 . "</td>";
        echo "<td>" . $t5 . "</td>";
        echo "<td>" . $t6 . "</td>";
        echo "</tr>";
    }
}
?>