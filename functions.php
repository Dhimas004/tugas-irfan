<?php

$conn = mysqli_connect("localhost", "root", "", "pengirimanbarang");

function query($query)
{
	global $conn;
	$result = mysqli_query($conn, $query);
	$rows = [];
	while ($row = mysqli_fetch_assoc($result)) {
		$rows[] = $row;
	}
	return $rows;
}


function register($data)
{
	global $conn;


	$kd_admin = strtolower(stripslashes($data["kd_admin"]));
	$nama_admin = htmlspecialchars($data["nama_admin"]);
	$alamat_admin = htmlspecialchars($data["alamat_admin"]);
	$telp_admin = htmlspecialchars($data["tlp_admin"]);
	$kd_wilayah = htmlspecialchars($data["kd_wilayah"]);
	$password = mysqli_real_escape_string($conn, $data['password']);
	$password2 = mysqli_real_escape_string($conn, $data['password2']);



	// cek apakah kd_admin sudah ada

	$result = mysqli_query($conn, "SELECT kd_admin FROM admin WHERE kd_admin= '$kd_admin'");

	if (mysqli_fetch_assoc($result)) {
		echo "<script>
				alert ('kode admin sudah terdaftar');
			</script>";
		return false;
	}

	// cek konfirmasi password
	if ($password !== $password2) {
		echo "<script>
				alert ('konfirmasi password tidak sesuai');
			</script>";
		return false;
	}
	// enkripsi password
	$password = password_hash($password, PASSWORD_DEFAULT);

	// query
	mysqli_query($conn, "INSERT INTO admin VALUES ('$kd_admin', '$nama_admin', '$telp_admin', '$alamat_admin', '$kd_wilayah', '$password')");

	return mysqli_affected_rows($conn);
}
