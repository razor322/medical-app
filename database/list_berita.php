<?php

include 'koneksi.php'; // Include koneksi database

// Periksa koneksi
if (!$conn) {
  die("Koneksi gagal: " . mysqli_connect_error());
}

// Query untuk mengambil data berita (sesuaikan dengan struktur tabel Anda)
$query = "SELECT id, judul, isi_berita, gambar_berita, tgl_berita FROM berita";

// Eksekusi query
$result = mysqli_query($conn, $query);

// Memproses hasil query
$berita = array();
if ($result && mysqli_num_rows($result) > 0) {
  while ($row = mysqli_fetch_assoc($result)) {
    $berita[] = $row;
  }
}

// Set header Content-Type sebagai JSON
header('Content-Type: application/json');

// Respon berupa array berisi data berita
$response = array('data' => $berita);

// Kirim respon berupa JSON
echo json_encode($response);

// Tutup koneksi database
mysqli_close($conn);

?>
