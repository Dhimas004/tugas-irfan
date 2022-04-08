<?php

session_start();
require 'functions.php';

if (isset($_COOKIE['un']) && isset($_COOKIE['key'])) {
	$un = $_COOKIE['un'];
	$key = $_COOKIE['key'];
	// ambil kd_admin berdasarkan un
	$result = mysqli_query($conn, "SELECT kd_admin FROM admin WHERE id=$un");
	$row = mysqli_fetch_assoc($result);

	// cek cookie dan kd_admin
	if ($key === hash('sha256', $row['kd_admin'])) {
		$_SESSION['login'] = true;
	}
}

if (isset($_SESSION["login"])) {
	header("location: index.php");
	exit;
}


if (isset($_POST['login'])) {

	$kd_admin = $_POST["kd_admin"];
	$password = $_POST["password"];

	$result = mysqli_query($conn, "SELECT * FROM admin WHERE kd_admin = '$kd_admin'");

	// cek kd_admin
	if (mysqli_num_rows($result) === 1) {
		// mysqli_rum_rows berfungsi untuk menghitung jumlah baris yang ada di database. jadi kalau sudah ada
		// cek password
		$row = mysqli_fetch_assoc($result);
		if (password_verify($password, $row["password"])) {
			// set session
			$_SESSION["login"] = true;

			// cek remember me
			if (isset($_POST['ingat'])) {
				// buat cookie
				setcookie('un', $row['id']);
				setcookie('key', hash('sha256', $row['kd_admin'], time() + 60));
			}


			// header("location: index.php");
			// exit;
		}
	}
	$error = true;
}



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


	<h1>halaman login</h1>
	<?php if (isset($error)) : ?>
		<p style="font-style: italic; color: red;">kode admin atau password salah</p>
	<?php endif ?>

	<form action="" method="post">

		<ul>
			<li>
				<label for="kd_admin">kode admin : </label>
				<input type="text" name="kd_admin" id="kd_admin" required>
			</li>
			<li>
				<label for="password">password : </label>
				<input type="password" name="password" id="password" required>
			</li>
			<li>
				<button type="submit" name="login">masuk</button>
			</li>
		</ul>

	</form>
</body>

</html>