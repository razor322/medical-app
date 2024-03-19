<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
include 'koneksi.php'; // Include koneksi database

// Dapatkan ID pegawai dari request (biasanya DELETE)
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0; // Pastikan ID integer

// Validasi ID pegawai
if (empty($id)) {
  $response = array('value' => 0, 'message' => 'ID pegawai tidak ditemukan!');
  http_response_code(400); // Bad Request
  echo json_encode($response);
  exit();
}

// Query DELETE menggunakan prepared statement
$query = "DELETE FROM `pegawai` WHERE `id` = ?";

$stmt = mysqli_prepare($conn, $query);

// Bind parameter untuk keamanan
mysqli_stmt_bind_param($stmt, "i", $id);

// Eksekusi query
$result = mysqli_stmt_execute($stmt);

// Periksa hasil query
if (!$result) {
  $response = array('value' => 0, 'message' => 'Gagal menghapus data pegawai!');
  http_response_code(500); // Internal Server Error
} else {
  $response = array('value' => 1, 'message' => 'Data pegawai berhasil dihapus!');
  http_response_code(200); // OK
}

// Tampilkan response dalam format JSON
echo json_encode($response);
