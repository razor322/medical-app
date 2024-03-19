<?php

header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");
include 'koneksi.php';

if($_SERVER['REQUEST_METHOD'] == "POST") {

    $response = array();
    $nama = $_POST['nama'];
    $no_bp = $_POST['no_bp'];
    $no_hp = $_POST['no_hp'];
    $email = $_POST['email'];

    // Cek apakah ada pegawai dengan nama atau no_bp yang sama
    $cek = "SELECT * FROM pegawai WHERE nama = '$nama' OR no_bp = '$no_bp'";
    $result = mysqli_query($conn, $cek);

    if(mysqli_num_rows($result) > 0) {
        $response['value'] = 2;
        $response['message'] = "Nama atau Nomor BP sudah digunakan";
        echo json_encode($response);
    } else {
        // Insert data pegawai baru
        $insert = "INSERT INTO pegawai (nama, no_bp, no_hp, email) VALUES ('$nama', '$no_bp', '$no_hp', '$email')";
        if(mysqli_query($conn, $insert)) {
            $response['value'] = 1;
            $response['message'] = "Pegawai berhasil ditambahkan";
            echo json_encode($response);
        } else {
            $response['value'] = 0;
            $response['message'] = "Gagal menambahkan pegawai: " . mysqli_error($conn);
            echo json_encode($response);
        }
    }
}

?>