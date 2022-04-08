<?php
// session_start();

// if (!isset($_SESSION["login"])) {
// 	header("location: login.php");
// 	exit;
// }

require 'functions.php';

if (isset($_POST['register'])) {

	if (register($_POST) > 0) {
		echo "<script>
			alert('user baru berhasil ditambahkan');

		</script>";
		header('Location: login.php');
	} else {
		echo mysqli_error($conn);
	}
}




?>



<!DOCTYPE html>
<html>

<head>
	<title>halaman registrasi</title>
	<style>
		label {
			display: block;
		}
	</style>
</head>

<body>

	<h1>Halaman Registrasi</h1>

	<form action="" method="post">
		<ul>
			<li>
				<label for="kd_admin">Kode Admin : </label>
				<input type="number" name="kd_admin" id="kd_admin" required>
			</li>
			<li>
				<label for="nama_admin">Nama Admin : </label>
				<input type="text" name="nama_admin" id="nama_admin" required>
			</li>
			<li>
				<label for="tlp_admin">Telepon Admin : </label>
				<input type="number" name="tlp_admin" id="tlp_admin" required>
			</li>
			<li>
				<label for="alamat_admin">Alamat Admin : </label>
				<input type="text" name="alamat_admin" id="alamat_admin" required>
			</li>
			<li>
				<label for="kd_wilayah">Kode Wilayah : </label>
				<input type="text" name="kd_wilayah" id="kd_wilayah" required>
			</li>
			<li>
				<label for="password">Password : </label>
				<input type="password" name="password" id="password" required>
			</li>
			<li>
				<label for="password2">Konfirmasi Password : </label>
				<input type="password" name="password2" id="password2" required>
			</li>
			<li>
				<button type="submit" name="register">Daftar!</button>
			</li>
		</ul>
	</form>


</body>

</html>