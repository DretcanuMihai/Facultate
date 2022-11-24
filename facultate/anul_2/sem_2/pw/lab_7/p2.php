<?php
function initialize()
{
    echo '
    <form method="get" action="p2.php">
        <label>
            <select name="no_rows">
                <option value="1">1</option>
                <option value="3">3</option>
                <option value="5">5</option>
                <option value="10">10</option>
           </select>
        </label>
        <input type="hidden" name="page_no" value="0">
        <input type="submit">
    </form>';
}

function validateData()
{
    $noRows = $_GET['no_rows'];
    $pageNo = $_GET['page_no'];
    return is_numeric($noRows) && $noRows > 0 && is_numeric($pageNo) && $pageNo >= 0;
}

function printTable()
{
    $connection = new mysqli("localhost", "root", "", "ajax_db");

    $noRows = $_GET['no_rows'];
    $pageNo = $_GET['page_no'];

    $currentOffset = $pageNo * $noRows;

    $query = "SELECT * FROM notebook LIMIT ? OFFSET ?";

    $statement = $connection->prepare($query);
    $statement->bind_param('ii', $noRows, $currentOffset);
    $statement->execute();
    $statement->bind_result($t1, $t2, $t3, $t4, $t5, $t6);

    echo '<table>';
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
    echo '<table>';
    $statement->close();

}

function printButtons()
{
    $connection = new mysqli("localhost", "root", "", "ajax_db");

    $noRows = $_GET['no_rows'];
    $pageNo = $_GET['page_no'];
    $pageNoAux = $pageNo + 1;

    $currentOffset = $pageNoAux * $noRows;

    $query = "SELECT id FROM notebook LIMIT ? OFFSET ?";

    $statement = $connection->prepare($query);
    $statement->bind_param('ii', $noRows, $currentOffset);
    $statement->execute();
    $statement->bind_result($result);

    $hasPrevious = $pageNo != 0;
    $hasNext = false;
    while ($statement->fetch()) {
        $hasNext = true;
    }
    $statement->close();
    echo '
    <form method="get" action="p2.php">
        <input type="hidden" name="page_no" value="' . ($pageNo - 1) . '">
        <input type="hidden" name="no_rows" value="' . $noRows . '">
        <input type="submit" value="Previous"';
    if (!$hasPrevious) {
        echo ' disabled';
    }
    echo '>
    </form>';

    echo '
    <form method="get" action="p2.php">
        <input type="hidden" name="page_no" value="' . ($pageNo + 1) . '">
        <input type="hidden" name="no_rows" value="' . $noRows . '">
        <input type="submit" value="Next"';
    if (!$hasNext) {
        echo ' disabled';
    }
    echo '>
    </form>';

}

if (!validateData()) {
    echo 'invalid data';
    return;
}

initialize();
printTable();
printButtons();

?>
