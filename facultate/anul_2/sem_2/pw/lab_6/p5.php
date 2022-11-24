<?php

function getContent($requestedFile)
{
    if (is_dir($requestedFile)) {
        $filesInDirectory = scandir($requestedFile);
        echo '<ul>';
        foreach ($filesInDirectory as $file) {
            if ($file != '.' && $file != '..') {
                $fullPath = $requestedFile . '/' . $file;
                echo '<li>';
                if (is_dir($fullPath)) {
                    echo '<p onclick="request(this);">' . $file . '</p>';
                } else {
                    echo '<p onclick="request(this);">' . $file . '</p>';
                }
                echo '</li>';
            }
        }
        echo '</ul>';
    } else {
        echo '<plaintext>';
        echo file_get_contents($requestedFile);
    }
}

getContent($_GET['url']);
?>