<?php
header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");

include 'koneksi.php'; // Include koneksi database

// Periksa koneksi
if (!$conn) {
  die("Koneksi gagal: " . mysqli_connect_error());
}

// Query untuk mengambil data pegawai (sesuaikan dengan struktur tabel Anda)
$query = "SELECT * FROM pegawai";

// Eksekusi query
$result = mysqli_query($conn, $query);

// Memproses hasil query
$pegawai = array();
if ($result && mysqli_num_rows($result) > 0) {
  while ($row = mysqli_fetch_assoc($result)) {
    $pegawai[] = $row;
  }
}

// Set header Content-Type sebagai JSON
header('Content-Type: application/json');

// Respon berupa array berisi data pegawai
$response = array('data' => $pegawai);

// Kirim respon berupa JSON
echo json_encode($response);

// Tutup koneksi database
mysqli_close($conn);
