<?php
function validateData()
{
    $email = $_GET['mail'];
    $pattern = "/^[a-zA-Z\d]+@[a-zA-Z\d]+([.][a-zA-Z\d]+)+$/i";
    $valid = true;
    if (!preg_match($pattern, $email)) {
        $valid = false;
        echo '<p>Invalid email address</p>';
    }
    return $valid;
}

function activateAccount()
{
    $success = true;
    try {
        $connection = new mysqli("localhost", "root", "", "ajax_db");
        $query = "UPDATE accounts SET activated=1 WHERE email=?";

        $email = $_GET['mail'];

        $statement = $connection->prepare($query);
        $statement->bind_param('s', $email);
        $statement->execute();

    } catch (Exception $e) {
        $success = false;
    }
    return $success;
}

if (!validateData()) {
    return;
}
if (!activateAccount()) {
    echo "<p>Couldn't activate account</p>";
    return;
}

echo '<p>Account activated successfully.</p>';

?>