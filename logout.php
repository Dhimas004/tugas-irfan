<?php 
session_start();
$_SESSION = [];
unset($_SESSION['user']);
session_unset();
session_destroy();

// $_SESSION yang diberi kotak kosong bertujuan untuk mengosongkan $_SESSION
// session_unset pun untuk menghapus session
// session_destroy() pun untuk menghapus session
// untuk lebih meyakinkan kita sudah menghapus isi session kita memakai 3 kali menghapus


setcookie('un', '', time() - 3600);
setcookie('key', '', time() - 3600);


header("location: login.php");
exit;
