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

function createAccount()
{
    $success = true;
    try {
        $connection = new mysqli("localhost", "root", "", "ajax_db");
        $query = "INSERT INTO accounts(email, password) VALUES (?,?)";

        $email = $_POST['email'];
        $password = $_POST['password'];

        $statement = $connection->prepare($query);
        $statement->bind_param('ss', $email, $password);
        $statement->execute();

    } catch (Exception $e) {
        echo '<p>email already in use</p>';
        $success = false;
    }
    return $success;
}

function sendEmail(){
    $dest = $_POST['email'];
    $subjetc = "Confirm Creation";
    $body = "http://localhost/ajax/p4_confirmation.php?mail=".$dest;
    $headers = "From: activation@confirm.com";
    return mail($dest, $subjetc, $body, $headers);
}

if (!validateData()) {
    return;
}
if (!createAccount()) {
    echo "<p>Couldn't create account</p>";
    return;
}
if(!sendEmail()){
    echo '<p>Couldn\'t send confirmation email</p>';
    return;
}

echo '<p>Account created successfully. Activate it by confirming on email.</p>';
?>
