<?php

session_start();
include './functions.php';
if (!isset($_SESSION["login"])) {
    header("location: login.php");
    exit;
}

$kd_admin = query("SELECT * FROM admin");
var_dump($kd_admin);
?>





<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    ?>
    <a href="logout.php">logout</a>
</body>

</html>