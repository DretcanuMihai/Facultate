<?php
function checkCompletion($symbol, $stage)
{
    if ($stage[0] == $symbol and $stage[1] == $symbol and $stage[2] == $symbol)
        return true;
    elseif ($stage[3] == $symbol and $stage[4] == $symbol and $stage[5] == $symbol)
        return true;

    elseif ($stage[6] == $symbol and $stage[7] == $symbol and $stage[8] == $symbol)
        return true;

    elseif ($stage[0] == $symbol and $stage[3] == $symbol and $stage[6] == $symbol)
        return true;

    elseif ($stage[1] == $symbol and $stage[4] == $symbol and $stage[7] == $symbol)
        return true;

    elseif ($stage[2] == $symbol and $stage[5] == $symbol and $stage[8] == $symbol)
        return true;

    elseif ($stage[0] == $symbol and $stage[4] == $symbol and $stage[8] == $symbol)
        return true;

    elseif ($stage[2] == $symbol and $stage[4] == $symbol and $stage[6] == $symbol)
        return true;
    return false;
}

$current_stage = str_split($_GET['table']);
if (checkCompletion("X", $current_stage)) {
    echo 'X';
} elseif (checkCompletion("O", $current_stage)) {
    echo 'O';
} else {
    $done = true;
    $indexToSend = 0;
    $steps = rand(0, 8);
    for ($i = 0; $i < 9; $i++) {
        if ($current_stage[$i] == "-") {
            $done = false;
            if ($steps >= 0) {
                $indexToSend = $i;
            }
            $steps--;
        }
    }
    if ($done) {
        echo '-';
    } else {
        echo $indexToSend;
    }
}
?>