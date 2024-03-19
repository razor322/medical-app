-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Mar 2024 pada 05.38
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kesehatan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi_berita` text NOT NULL,
  `gambar_berita` varchar(100) NOT NULL,
  `tgl_berita` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id`, `judul`, `isi_berita`, `gambar_berita`, `tgl_berita`) VALUES
(1, 'Kemenkes: Vaksinasi Booster Kedua Sasar Lansia dan Orang Berisiko Tinggi', 'Sasaran lansia dan orang berisiko tinggi untuk meningkatkan kekebalan terhadap Covid-19.', 'pict1.jpg', '2024-03-02 21:22:18'),
(2, 'Cacar Monyet Melonjak', 'Kasus meningkat di 78 negara, perhatikan gejala dan protokol kesehatan.', 'pict2.jpg', '2024-03-13 21:22:18'),
(3, ' Varian Baru Covid-XBB1.5', 'Waspadai gejala seperti batuk pilek, demam, dan sakit kepala.', 'pict3.jpg', '2024-03-20 21:25:43'),
(4, 'Kasus Campak Meningkat', 'Orang tua diminta waspada dan segera vaksinasi anak.', 'pict4.jpg', '2024-03-24 21:25:43'),
(5, 'Cemaran Obat Sirop', 'BPOM temukan 23 obat sirop tercemar etilen glikol dan dietilen glikol, hentikan penggunaan dan periksa daftar obat terlarang.', 'pict5.jpg', '2024-03-14 21:25:43'),
(6, ' Aturan Baru Pengobatan Covid-19', 'Kemenkes terbitkan aturan baru, perhatikan perubahannya.', 'pict6.jpg', '2024-03-08 21:25:43'),
(7, ' Demam Berdarah Dengue Meningkat', 'Waspada di musim hujan, lakukan pencegahan seperti 3M Plus.', 'pict7.jpg', '2024-03-07 21:25:43'),
(8, ' Vaksinasi Covid-19 untuk Anak', 'Dimulai untuk anak usia 6 bulan - 5 tahun, lindungi anak dari Covid-19.', 'pict8.jpg', '2024-03-09 21:25:43'),
(9, 'Cemaran Etilen Glikol di Obat Sirop', 'BPOM temukan 4 produk obat sirop tercemar, hentikan penggunaan dan periksa daftar obat terlarang.', 'pict9.jpg', '2024-03-09 21:25:43'),
(10, 'Kasus Covid-19 Varian XBB Meningkat', 'Waspada penularan, patuhi protokol kesehatan dan lakukan vaksinasi.', 'pict10.jpg', '2024-03-07 21:25:43'),
(11, 'Vaksinasi Booster Kedua Dimulai', 'Syarat: usia 18 tahun ke atas, sudah booster pertama minimal 6 bulan.', 'pict11.jpg', '2024-03-24 21:25:43'),
(12, ' Kasus Covid-19 Global Meningkat', 'Waspada gelombang baru, patuhi protokol kesehatan dan lakukan vaksinasi.', 'pict12.jpg', '2024-03-13 21:25:43'),
(13, 'Hepatitis Akut Misterius pada Anak Menurun', 'Kasus menurun, namun tetap waspada dan jaga kebersihan.', 'pict13.jpg', '2024-03-05 21:25:43'),
(14, 'Obat Ilegal Berbahaya', 'Cek kemasan dan izin edar obat sebelum membeli, waspada obat palsu dan ilegal.', 'pict14.jpg', '2024-03-08 21:25:43'),
(15, 'Cegah Stunting', 'Perhatikan gizi anak sejak dini, konsumsi makanan bergizi seimbang.', 'pict15.jpg', '2024-03-19 21:25:43'),
(16, 'Kasus HIV/AIDS Meningkat', 'Lakukan tes deteksi dini untuk mengetahui status HIV, lindungi diri dan pasangan.', 'pict16.jpg', '2024-03-15 21:25:43'),
(17, 'Gangguan Ginjal Akut Misterius pada Anak', 'Waspada gejala seperti diare, muntah, dan demam, segera konsultasikan ke dokter.', 'pict17.jpg', '2024-03-20 21:25:43'),
(18, 'Peduli Kesehatan Mental', 'Cegah stigma dan diskriminasi terhadap orang dengan gangguan mental, berikan dukungan dan akses pengobatan.', 'pict18.jpg', '2024-03-21 21:31:20'),
(19, 'Gizi Seimbang Kunci Kesehatan', 'Konsumsi pangan beragam untuk memenuhi kebutuhan gizi tubuh', 'pict19.jpg', '2024-03-18 21:31:20'),
(20, 'Berhenti Merokok', 'Demi kesehatan diri dan orang lain, lindungi diri dari bahaya rokok.', 'pict20.jpg', '2024-03-10 21:31:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `no_bp` varchar(25) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tanggal_input` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `no_bp`, `no_hp`, `email`, `tanggal_input`) VALUES
(1, 'Alisya', '2111080000', '081234567890', 'alisyaputri@gmail.com', '2024-03-18 11:27:13'),
(2, 'Akaela', '2111080001', '081234567898', 'akaelamaya@gmai.com', '2024-03-14 21:10:39'),
(3, 'Aleandro', '2111080002', '081234567876', 'aleandrojale@gmail.com', '2024-03-19 21:10:39'),
(4, 'Biyana', '2111080004', '0812345676543', 'biyanarika@gmail.com', '2024-03-20 21:10:39'),
(5, 'Bagas', '2111080005', '0812345676543', 'bagassaputra@gmail.com', '2024-03-22 21:10:39'),
(6, 'Chantika', '2111080006', '081234543211', 'chantikaraisa@gmail.com', '2024-03-12 21:10:39'),
(7, 'Delima', '2111080007', '081234554321', 'delimakamila@gmail.com', '2024-03-16 21:10:39'),
(8, 'Eynasari', '2111080008', '0812345678873', 'eynasariani@gmail.com', '2024-03-23 21:10:39'),
(9, 'Elina', '2111080009', '0812212121456', 'elinafiya@gmail.com', '2024-03-15 21:10:39'),
(10, 'Fiona', '2111080010', '0812353212342', 'fionaana@gmail.com', '2024-03-24 21:10:39'),
(11, 'Farhan', '2111080011', '081232345453', 'farhanridho@gmail.com', '2024-03-20 21:10:39'),
(12, 'Giordano', '2111080012', '081234321342', 'giornadoali@gmail.com', '2024-03-02 21:10:39'),
(13, 'Hariansyah', '2111080013', '081344638327', 'hariansyahsukro@gmail.com', '2024-03-15 21:10:39'),
(14, 'Inaanika', '2111080014', '0813467428452', 'inaanikala@gmail.com', '2024-03-23 21:10:39'),
(15, 'Isaliaya', '2111080015', '081346242848', 'isaliayanara@gmail.com', '2024-03-28 21:10:39'),
(16, 'Jandika', '2111080016', '081232438458', 'jandikaputra@gmail.com', '2024-03-28 21:10:39'),
(17, 'Kylee', '2111080017', '0812452842528', 'kyleehanna@gmail.com', '2024-03-30 21:10:39'),
(18, 'Leony', '2111080018', '081247153724', 'leonyanaya@gmail.com', '2024-03-23 21:10:39'),
(19, 'Monika', '2111080019', '081243745452', 'monikaira@gmail.com', '2024-03-17 21:10:39'),
(20, 'Niraya', '2111080020', '081234826528', 'nirayakahi@gmail.com', '2024-03-29 21:10:39'),
(21, 'Amelia', '2111082006', '082169359854', 'ameliamenson@gmail.com', '2024-03-17 19:11:47'),
(23, 'melia', '2111080987', '08966528392', 'melia@gmail.com', '2024-03-18 11:05:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `tgl_daftar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `fullname`, `tgl_daftar`) VALUES
(6, 'sarisa', '5f4dcc3b5aa765d61d8327deb882cf99', 'yasarisa@gmail.com', 'yasarisa lah', '2024-03-17 22:17:45'),
(7, 'amelia', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '2024-03-18 11:00:28'),
(8, 'gibran', '5f4dcc3b5aa765d61d8327deb882cf99', 'gibran@gmail.com', 'gibran', '2024-03-18 11:02:09');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
