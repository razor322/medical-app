-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Mar 2024 pada 08.55
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_kesehatan`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id`, `judul`, `isi_berita`, `gambar_berita`, `tgl_berita`) VALUES
(1, 'Kemenkes: Vaksinasi Booster Kedua Sasar Lansia dan Orang Berisiko Tinggi', 'Sasaran lansia dan orang berisiko tinggi untuk meningkatkan kekebalan terhadap Covid-19.', 'pict1.png', '2024-03-02 21:22:18'),
(2, 'Cacar Monyet Melonjak', 'Kasus meningkat di 78 negara, perhatikan gejala dan protokol kesehatan.', 'pict2.jpeg', '2024-03-13 21:22:18'),
(3, 'Varian Baru Covid-XBB1.5', 'Waspadai gejala seperti batuk pilek, demam, dan sakit kepala.', 'pict3.jpeg', '2024-03-20 21:25:43'),
(4, 'Kasus Campak Meningkat', 'Orang tua diminta waspada dan segera vaksinasi anak.', 'pict4.jpeg', '2024-03-24 21:25:43'),
(5, 'Cemaran Obat Sirop', 'BPOM temukan 23 obat sirop tercemar etilen glikol dan dietilen glikol, hentikan penggunaan dan periksa daftar obat terlarang.', 'pict5.jpeg', '2024-03-14 21:25:43'),
(6, 'Aturan Baru Pengobatan Covid-19', 'Kemenkes terbitkan aturan baru, perhatikan perubahannya.', 'pict6.jpeg', '2024-03-08 21:25:43'),
(7, 'Demam Berdarah Dengue Meningkat', 'Waspada di musim hujan, lakukan pencegahan seperti 3M Plus.', 'pict7.jpeg', '2024-03-07 21:25:43'),
(8, 'Vaksinasi Covid-19 untuk Anak', 'Dimulai untuk anak usia 6 bulan - 5 tahun, lindungi anak dari Covid-19.', 'pict8.jpeg', '2024-03-09 21:25:43'),
(9, 'Cemaran Etilen Glikol di Obat Sirop', 'BPOM temukan 4 produk obat sirop tercemar, hentikan penggunaan dan periksa daftar obat terlarang.', 'pict9.jpeg', '2024-03-09 21:25:43'),
(10, 'Kasus Covid-19 Varian XBB Meningkat', 'Waspada penularan, patuhi protokol kesehatan dan lakukan vaksinasi.', 'pict10.jpeg', '2024-03-07 21:25:43'),
(11, 'Vaksinasi Booster Kedua Dimulai', 'Syarat: usia 18 tahun ke atas, sudah booster pertama minimal 6 bulan.', 'pict11.jpeg', '2024-03-24 21:25:43'),
(12, 'Kasus Covid-19 Global Meningkat', 'Waspada gelombang baru, patuhi protokol kesehatan dan lakukan vaksinasi.', 'pict12.jpeg', '2024-03-13 21:25:43'),
(13, 'Hepatitis Akut Misterius pada Anak Menurun', 'Kasus menurun, namun tetap waspada dan jaga kebersihan.', 'pict13.jpeg', '2024-03-05 21:25:43'),
(14, 'Obat Ilegal Berbahaya', 'Cek kemasan dan izin edar obat sebelum membeli, waspada obat palsu dan ilegal.', 'pict14.jpeg', '2024-03-08 21:25:43'),
(15, 'Cegah Stunting', 'Perhatikan gizi anak sejak dini, konsumsi makanan bergizi seimbang.', 'pict15.jpeg', '2024-03-19 21:25:43'),
(16, 'Kasus HIV/AIDS Meningkat', 'Lakukan tes deteksi dini untuk mengetahui status HIV, lindungi diri dan pasangan.', 'pict16.jpeg', '2024-03-15 21:25:43'),
(17, 'Gangguan Ginjal Akut Misterius pada Anak', 'Waspada gejala seperti diare, muntah, dan demam, segera konsultasikan ke dokter.', 'pict17.jpeg', '2024-03-20 21:25:43'),
(18, 'Peduli Kesehatan Mental', 'Cegah stigma dan diskriminasi terhadap orang dengan gangguan mental, berikan dukungan dan akses pengobatan.', 'pict18.jpeg', '2024-03-21 21:31:20'),
(19, 'Gizi Seimbang Kunci Kesehatan', 'Konsumsi pangan beragam untuk memenuhi kebutuhan gizi tubuh', 'pict19.jpeg', '2024-03-18 21:31:20'),
(20, 'Berhenti Merokok', 'Demi kesehatan diri dan orang lain, lindungi diri dari bahaya rokok.', 'pict20.jpeg', '2024-03-10 21:31:20');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
