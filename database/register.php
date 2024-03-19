<?php

header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");
include 'koneksi.php';

if($_SERVER['REQUEST_METHOD'] == "POST") {

	$response = array();
	$username = $_POST['username'];
	$password = md5($_POST['password']);
	$fullname = $_POST['fullname'];
	$email = $_POST['email'];

	$cek = "SELECT * FROM users WHERE username = '$username' || email = '$email'";
	$result = mysqli_fetch_array(mysqli_query($conn, $cek));

	if(isset($result)){
		$response['value'] = 2;
		$response['message'] = "Username atau email telah digunakan";
		echo json_encode($response);
	} else {
		$insert = "INSERT INTO users VALUE(NULL, '$username', '$password', '$email',  '$fullname', NOW())";
		if(mysqli_query($conn, $insert)){
			$response['value'] = 1;
			$response['message'] = "Berhasil didaftarkan";
			echo json_encode($response);
		} else {
			$response['value'] = 0;
			$response['message'] = "Gagal didaftarkan";
			echo json_encode($response);
		}
	}
}

?>