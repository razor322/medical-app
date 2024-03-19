<?php

session_start();

// Periksa apakah pengguna sudah login
if (isset($_SESSION['user_id'])) {
  // Hapus sesi
  session_destroy();
  
  // Set pesan respon (opsional)
  $response = array('message' => 'Logout berhasil');
  
  // Set kode respon ke sukses (opsional)
  http_response_code(200);
  
  // Ubah respon menjadi JSON
  echo json_encode($response);
} else {
  // Set pesan respon untuk logout yang gagal (opsional)
  $response = array('message' => 'Pengguna tidak login');
  
  // Set kode respon ke tidak sah (opsional)
  http_response_code(401);
  
  // Ubah respon menjadi JSON
  echo json_encode($response);
}

?>
