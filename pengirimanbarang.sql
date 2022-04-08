-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2022 at 10:01 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengirimanbarang`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `kd_admin` int(11) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `tlp_admin` int(12) NOT NULL,
  `alamat_admin` varchar(100) NOT NULL,
  `kd_wilayah` int(11) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`kd_admin`, `nama_admin`, `tlp_admin`, `alamat_admin`, `kd_wilayah`, `password`) VALUES
(11111, 'asd', 0, '122453', 0, '$2y$10$8jXByfBTNn/w6NICpXhvy.XKYdSN41cHhJyHrUXUyZ7sbbQ9JaWnm'),
(99999, 'asd', 0, '122453', 0, '$2y$10$37N/Ofima1NDe.KPre8Vu.lD6ZgATxYOB7ZaPMzeOvAqpACnPtxvS'),
(999999999, 'asd', 0, '122453', 0, '$2y$10$P2cmZsjXEhPulZhAJfTRa.dK6Mu3bXRPs0racADid7LYDQM00C.D6');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(11) NOT NULL,
  `id_pengiriman` varchar(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah__barang` int(7) NOT NULL,
  `satuan_barang` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bukti_pengiriman`
--

CREATE TABLE `bukti_pengiriman` (
  `id_status` varchar(11) NOT NULL,
  `id_pengiriman` int(11) NOT NULL,
  `status_pengiriman` varchar(20) NOT NULL,
  `nama_penerima` varchar(50) NOT NULL,
  `tgl_terima` date NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id_kendaraan` varchar(11) NOT NULL,
  `jenis_kendaraan` varchar(11) NOT NULL,
  `nopol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kurir`
--

CREATE TABLE `kurir` (
  `id_kurir` varchar(11) NOT NULL,
  `nama_kurir` varchar(50) NOT NULL,
  `alamat_kurir` varchar(50) NOT NULL,
  `telp_kurir` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `id_pengiriman` varchar(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_pengirim` varchar(50) NOT NULL,
  `alamat_pengirim` varchar(50) NOT NULL,
  `telp_pengirim` int(13) NOT NULL,
  `nama_penerima` int(50) NOT NULL,
  `alamat_penerima` int(100) NOT NULL,
  `telp_penerima` int(13) NOT NULL,
  `id_barang` varchar(11) NOT NULL,
  `id_tujuan` varchar(11) NOT NULL,
  `id_tarif` varchar(11) NOT NULL,
  `tarif_dll` int(11) NOT NULL,
  `tarif_total` int(13) NOT NULL,
  `id_kendaraan` varchar(11) NOT NULL,
  `id_kurir` varchar(11) NOT NULL,
  `id_status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tarif`
--

CREATE TABLE `tarif` (
  `id_tarif` varchar(11) NOT NULL,
  `id_tujuan` varchar(11) NOT NULL,
  `satuan` int(20) NOT NULL,
  `estimasi` varchar(50) NOT NULL,
  `tarif` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tujuan`
--

CREATE TABLE `tujuan` (
  `id_tujuan` varchar(11) NOT NULL,
  `asal` varchar(50) NOT NULL,
  `tujuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`kd_admin`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `bukti_pengiriman`
--
ALTER TABLE `bukti_pengiriman`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`);

--
-- Indexes for table `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`id_kurir`);

--
-- Indexes for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`),
  ADD KEY `id_kendaraan` (`id_kendaraan`),
  ADD KEY `id_kurir` (`id_kurir`),
  ADD KEY `pengiriman_ibfk_3` (`id_tarif`),
  ADD KEY `id_tujuan` (`id_tujuan`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_status` (`id_status`);

--
-- Indexes for table `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`id_tarif`);

--
-- Indexes for table `tujuan`
--
ALTER TABLE `tujuan`
  ADD PRIMARY KEY (`id_tujuan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `kd_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000000;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD CONSTRAINT `pengiriman_ibfk_1` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id_kendaraan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pengiriman_ibfk_2` FOREIGN KEY (`id_kurir`) REFERENCES `kurir` (`id_kurir`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pengiriman_ibfk_3` FOREIGN KEY (`id_tarif`) REFERENCES `tarif` (`id_tarif`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pengiriman_ibfk_4` FOREIGN KEY (`id_tujuan`) REFERENCES `tujuan` (`id_tujuan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pengiriman_ibfk_5` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pengiriman_ibfk_6` FOREIGN KEY (`id_status`) REFERENCES `bukti_pengiriman` (`id_status`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
