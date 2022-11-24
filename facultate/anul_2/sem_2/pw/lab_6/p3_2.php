<?php

$connection = new mysqli("localhost", "root", "", "ajax_db");

$query = "SELECT denumire, cantitate FROM paine where id=?";

$statement = $connection->prepare($query);
$statement -> bind_param('i', $_GET['id']);
$statement->execute();
$statement->bind_result($t1,$t2);

echo '<myxml>';
while ($statement->fetch()) {
    echo "<denumire>".$t1."</denumire>";
    echo "<cantitate>".$t2."</cantitate>";
}
echo '</myxml>';

?>