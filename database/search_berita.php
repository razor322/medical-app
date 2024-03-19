<?php

header("Access-Control-Allow-Origin: *"); // Allow requests from any origin
header("Content-Type: application/json; charset=UTF-8"); // Set response format

// Include database connection
include 'koneksi.php';

// Get search parameters from query string
$keyword = isset($_GET['keyword']) ? trim($_GET['keyword']) : null;
$kategori = isset($_GET['kategori']) ? trim($_GET['kategori']) : null;
$tanggal_awal = isset($_GET['tanggal_awal']) ? trim($_GET['tanggal_awal']) : null;
$tanggal_akhir = isset($_GET['tanggal_akhir']) ? trim($_GET['tanggal_akhir']) : null;

// Build WHERE clause with conditions
$where = "";
if (!empty($keyword)) {
  $where .= " AND (judul LIKE '%$keyword%' OR isi LIKE '%$keyword%')";
}
if (!empty($kategori)) {
  $where .= " AND kategori = '$kategori'";
}
if (!empty($tanggal_awal) && !empty($tanggal_akhir)) {
  $where .= " AND tgl_berita BETWEEN '$tanggal_awal' AND '$tanggal_akhir'";
} else if (!empty($tanggal_awal)) {
  $where .= " AND tgl_berita >= '$tanggal_awal'";
} else if (!empty($tanggal_akhir)) {
  $where .= " AND tgl_berita <= '$tanggal_akhir'";
}

// Construct query to search berita
$query = "SELECT * FROM berita WHERE 1=1 $where ORDER BY tgl_berita DESC";

$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_execute($stmt);

$result = mysqli_stmt_get_result($stmt);
$berita = [];

while ($row = mysqli_fetch_assoc($result)) {
  $berita[] = $row;
}

mysqli_stmt_close($stmt);
mysqli_close($conn);

// Return search results in JSON format
echo json_encode($berita);

?>
