<?php
$connection = new mysqli("localhost", "root", "", "ajax_db");

$query = "SELECT id FROM paine";

$statement = $connection->prepare($query);
$statement->execute();
$statement->bind_result($t1);

echo '<option disabled selected value></option>';
while ($statement->fetch()) {
    echo "<option>";
    echo $t1;
    echo "</option>";
}
?>