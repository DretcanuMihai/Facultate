<?php
function validateData()
{
    $email = $_POST['email'];
    $pattern = "/^[a-zA-Z\d]+@[a-zA-Z\d]+([.][a-zA-Z\d]+)+$/i";
    $password = $_POST['password'];
    $valid = true;
    if (!preg_match($pattern, $email)) {
        $valid = false;
        echo '<p>Invalid email address</p>';
    }
    if (strlen($password) < 5 || strlen($password) > 20) {
        $valid = false;
        echo '<p>Password size should be between 5 and 20 characters</p>';
    }
    return $valid;
}

function validateUser()
{
    $success = false;
    try {
        $connection = new mysqli("localhost", "root", "", "ajax_db");
        $query = "SELECT email FROM accounts where email=? AND password=? AND activated=1";

        $email = $_POST['email'];
        $password = $_POST['password'];

        $statement = $connection->prepare($query);
        $statement->bind_param('ss', $email, $password);
        $statement->execute();
        $statement->bind_result($result);
        while ($statement->fetch()) {
            $success = true;
        }
        $statement->close();

    } catch (Exception $e) {
    }
    return $success;
}

if (!validateData()) {
    return;
}
if (!validateUser()) {
    echo "<p>No active user with given credentials.</p>";
    return;
}

echo '<p>You\'re logged in, ' . $_POST["email"] . ' !</p>';
?>
