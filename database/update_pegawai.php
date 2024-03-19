<?php
header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
// header("Content-Type: application/json");
include 'koneksi.php'; // Include koneksi database

// Dapatkan data dari request (biasanya PUT/PATCH)
$id = isset($_POST['id']) ? (int) $_POST['id'] : 0; // Pastikan ID integer
$nama = isset($_POST['nama']) ? $_POST['nama'] : "";
$no_bp = isset($_POST['no_bp']) ? $_POST['no_bp'] : "";
$no_hp = isset($_POST['no_hp']) ? $_POST['no_hp'] : "";
$email = isset($_POST['email']) ? $_POST['email'] : "";

// Validasi data (opsional)
if (empty($id) || empty($nama) || empty($no_bp) || empty($no_hp) || empty($email)) {
  $response = array('value' => 0, 'message' => 'Ada parameter yang kurang atau kosong!');
  http_response_code(400); // Bad Request
  echo json_encode($response);
  exit();
}

// Escape data untuk mencegah SQL injection
$id = mysqli_real_escape_string($conn, $id);
$nama = mysqli_real_escape_string($conn, $nama);
$no_bp = mysqli_real_escape_string($conn, $no_bp);
$no_hp = mysqli_real_escape_string($conn, $no_hp);
$email = mysqli_real_escape_string($conn, $email);

// Query UPDATE menggunakan prepared statement
$query = "UPDATE `pegawai` SET `nama` = ?,`no_bp`=?, `no_hp`=?,`email`=? WHERE `id`= ?";

$stmt = mysqli_prepare($conn, $query);

// Bind parameter untuk keamanan
mysqli_stmt_bind_param($stmt, "sssss", $nama, $no_bp, $no_hp, $email, $id);

// Eksekusi query
$result = mysqli_stmt_execute($stmt);

// Periksa hasil query
if (!$result) {
  $response = array('value' => 0, 'message' => 'Gagal update data pegawai!');
  http_response_code(500); // Internal Server Error
} else {
  $response = array('value' => 1, 'message' => 'Data pegawai berhasil diupdate!');
}

// Tampilkan respons dalam format JSON
echo json_encode($response);


// Tutup koneksi database
// mysqli_close($conn);