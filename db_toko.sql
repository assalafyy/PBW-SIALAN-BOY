-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2018 at 07:37 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`username`, `password`, `nama_lengkap`, `email`, `no_telp`, `level`, `blokir`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'redaksi@bukulokomedia.com', '08238923848', 'admin', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `hubungi`
--

CREATE TABLE `hubungi` (
  `id_hubungi` int(5) NOT NULL,
  `id_kustomer` int(5) NOT NULL,
  `subjek` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pesan` text COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `hubungi`
--

INSERT INTO `hubungi` (`id_hubungi`, `id_kustomer`, `subjek`, `pesan`, `tanggal`) VALUES
(18, 13, 'kayu', 'cepetan', '2018-07-03'),
(19, 14, 'batu', 'cepetan', '2018-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(10, 'Perhutanan'),
(16, 'kayu');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id_kota` int(3) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `ongkos_kirim` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `nama_kota`, `ongkos_kirim`) VALUES
(13, 'jakarta', 500000),
(7, 'Bali', 2000000),
(8, 'Sulawesi', 1500000),
(9, 'Bogor', 300000),
(10, 'Sukabumi', 400000),
(11, 'Yogyakarta', 600000);

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE `kustomer` (
  `id_kustomer` int(5) NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `alamat` text COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `telpon` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `id_kota` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kustomer`
--

INSERT INTO `kustomer` (`id_kustomer`, `password`, `nama_lengkap`, `alamat`, `email`, `telpon`, `id_kota`) VALUES
(1, 'e10adc3949ba59abbe56e057f20f883e', 'Lukmanul Hakim', 'Jl. Prof. Dr. Soepomo No. 178, Tebet, Jakarta Timur 17280', 'algosigma@gmail.com', '081804396000', 1),
(2, 'cec1de94b66011a1cfed0a45f8ba8e16', 'budiono', 'Jl. Dipenogoro', 'budiono_114@yahoo.com', '083242233323', 5),
(3, '4b0cf71ac4f5267ae87e1092e98395ba', 'budionokompas1', 'Jl. Dorak, Selatpanjang1', 'budiono.115@gmail.com', '081275371724', 3),
(4, '4b0cf71ac4f5267ae87e1092e98395ba', 'budionokompas', 'tes', 'budiono.114@gmail.com', '081275371724', 5),
(9, 'e807f1fcf82d132f9bb018ca6738a19f', 'kevincornelius', 'asdasdasd', 'kevincornelius75@gmail.com', '1234567891011', 1),
(10, '21232f297a57a5a743894a0e4a801fc3', 'admin', 'jl.Sektor 7 Blok E No.41 RT04/RW/09', 'bagaslutfiarta@gmail.com', '97941791571259125', 9),
(11, 'ee776a18253721efe8a62e4abd29dc47', 'bagas', 'jl.sektor 7 blok e no.41', '15oktober97@gmail.com', '1234566778889', 11),
(12, 'eaccb8ea6090a40a98aa28c071810371', 'imam mujahid', 'taman krakaua', 'imam@gmail.com', '1234566778889', 13),
(13, '4eae35f1b35977a00ebd8086c259d4c9', 'w', 'jakarta', 'w@gmail.com', '123456', 13),
(14, 'c4ca4238a0b923820dcc509a6f75849b', 'www', 'jakarta', 'a@gmail.com', '123454', 13);

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE `modul` (
  `id_modul` int(5) NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `static_content`, `gambar`) VALUES
(1, '<p>\r\n<font size=\"4\"><font color=\"ORANGE\">PENJUALAN</font>\r\n</font>\r\n</p>\r\n<font size=\"4\"><font color=\"orange\">\r\n</font>\r\n</font>\r\n<p>\r\n<font size=\"4\"><span style=\"color: orange\">Alamat Toko :</span>\r\n</font>\r\n</p>\r\n<p>\r\n<font size=\"4\"><font color=\"orange\">Jl. Sektor 7 Blok E NO.41 RT 04/RW 09 Sudimara Jaya</font>&nbsp;\r\n</font>\r\n</p>\r\n<p>\r\n&nbsp;\r\n</p>\r\n<p>\r\n<font size=\"5\"><strong>WELCOME GUYS!!!</strong></font> \r\n</p>\r\n', 'ss.jpg'),
(2, '<p>\r\n&nbsp;\r\n</p>\r\n<p>\r\n<font style=\"background-color: #ffffff\" color=\"#999999\"><font face=\"andale mono, times\" size=\"5\">1. Register Terlebih Dahulu</font>\r\n</font>\r\n</p>\r\n<p>\r\n<font style=\"background-color: #ffffff\" color=\"#999999\"><font face=\"andale mono, times\" size=\"5\">2. Login</font>\r\n</font>\r\n</p>\r\n<p>\r\n<font style=\"background-color: #ffffff\" color=\"#999999\"><font face=\"andale mono, times\" size=\"5\">3. Pilih Kategori</font>\r\n</font>\r\n</p>\r\n<p>\r\n<font style=\"background-color: #ffffff\" color=\"#999999\"><font face=\"andale mono, times\" size=\"5\">4. Pilih Produk</font>\r\n</font>\r\n</p>\r\n<p>\r\n<font style=\"background-color: #ffffff\" color=\"#999999\"><font face=\"andale mono, times\" size=\"5\">5. Taruh Harga</font>\r\n</font>\r\n</p>\r\n<p>\r\n<font face=\"andale mono, times\" size=\"5\" style=\"background-color: #ffffff\" color=\"#999999\">6. Lanjutkan Transaksi</font>\r\n</p>\r\n', ''),
(3, '<p>\nPembayaran dilakukan Melalui Rekening Toko Kami di bawah ini :\n</p>\n<p>\n<strong>BRI :1909.8099.00.11</strong>\n</p>\n<p>\nA/n &nbsp; : Acuan \n</p>\n<p>\n<strong>Mandiri : 503.0292.22</strong>\n</p>\n<p>\nA/n : Acuan\n</p>\n<p>\n<strong>BNI :&nbsp; 09.8099.00.</strong>\n</p>\n<p>\nA/n : Acuan\n</p>\n<p>\n&nbsp;\n</p>\n<p>\n&nbsp;\n</p>\n<p>\n&nbsp;\n</p>\n<p>\n&nbsp;\n</p>\n<p>\n&nbsp;\n</p>\n<p>\n&nbsp;\n</p>\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_orders` int(5) NOT NULL,
  `status_order` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'Baru',
  `tgl_order` date NOT NULL,
  `jam_order` time NOT NULL,
  `id_kustomer` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_orders`, `status_order`, `tgl_order`, `jam_order`, `id_kustomer`) VALUES
(30, 'Baru', '2018-01-25', '11:51:34', 12),
(31, 'Baru', '2018-01-25', '12:01:39', 12),
(32, 'Baru', '2018-01-25', '12:06:42', 12),
(33, 'Baru', '2018-07-03', '16:24:52', 13),
(34, 'Lunas', '2018-07-04', '06:00:11', 14),
(35, 'Baru', '2018-07-04', '06:04:55', 14),
(36, 'Baru', '2018-07-04', '06:05:51', 14);

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id_orders` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id_orders`, `id_produk`, `jumlah`) VALUES
(26, 32, 1),
(26, 29, 1),
(27, 31, 1),
(28, 45, 1),
(29, 55, 1),
(30, 53, 1),
(31, 55, 1),
(32, 55, 1),
(33, 53, 4),
(34, 53, 4),
(34, 54, 3),
(35, 56, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_temp`
--

CREATE TABLE `orders_temp` (
  `id_orders_temp` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tgl_order_temp` date NOT NULL,
  `jam_order_temp` time NOT NULL,
  `stok_temp` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(5) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `deskripsi` text COLLATE latin1_general_ci NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(5) NOT NULL,
  `berat` decimal(5,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `tgl_masuk` date NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dibeli` int(5) NOT NULL DEFAULT '1',
  `diskon` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `deskripsi`, `harga`, `stok`, `berat`, `tgl_masuk`, `gambar`, `dibeli`, `diskon`) VALUES
(53, 10, 'Kayu Jati Emas', '<p style=\"text-align: justify\">\r\n&nbsp;Jenis<span style=\"white-space: pre\" class=\"Apple-tab-span\">	</span>:Jati EMAS\r\n</p>\r\n<p style=\"text-align: justify\">\r\nAsal<span style=\"white-space: pre\" class=\"Apple-tab-span\">	</span>:Jawa Timur\r\n</p>\r\n<p style=\"text-align: justify\">\r\nHarga<span style=\"white-space: pre\" class=\"Apple-tab-span\">	</span>:Rp.20.000.000\r\n</p>\r\n<p style=\"text-align: justify\">\r\nStatus :Ada\r\n</p>\r\n<p style=\"text-align: justify\">\r\n<font face=\"times new roman, times\" size=\"2\"><span style=\"white-space: pre\" class=\"Apple-tab-span\">	</span>kayu jati perhutani adalah kayu jati yang dikelola oleh perhutani mulai dari pembibitan hingga penebangan dan penjualannya. Kayu jati perhutani atau sering disebut juga dengan kayu jati TPK dikenal memiliki kualitas yang sangat bagus dibanding jenis kayu jati yang lain.</font>\r\n</p>\r\n<blockquote style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin: 0px; padding: 0px 3em; vertical-align: baseline; quotes: none\">\r\n	<p style=\"text-align: justify; background: transparent; border: 0px; margin: 0px 0px 24px; padding: 0px; vertical-align: baseline\">\r\n	<font face=\"times new roman, times\" size=\"2\" color=\"#333333\">Kekurangan Kayu Jati Emas</font>\r\n	</p>\r\n	<p style=\"text-align: justify; background: transparent; border: 0px; margin: 0px 0px 24px; padding: 0px; vertical-align: baseline\">\r\n	<span style=\"background-color: transparent; color: #333333\">banyak gubal Kadar air tinggikayunya keras, mudah pecah (karena kebanyakan kayu yang ditebang masih berumur muda)Warna kayunya pucattingat keawetan : kurang awet hingga sedang</span>\r\n	</p>\r\n	<p style=\"text-align: justify; background: transparent; border: 0px; margin: 0px 0px 24px; padding: 0px; vertical-align: baseline\">\r\n	<font face=\"times new roman, times\" size=\"2\" color=\"#333333\">Kelebihan Kayu Jati Emas</font>\r\n	</p>\r\n	<p style=\"text-align: justify; background: transparent; border: 0px; margin: 0px 0px 24px; padding: 0px; vertical-align: baseline\">\r\n	<font face=\"times new roman, times\" size=\"2\" color=\"#333333\">harganya lebih murah dari kayu jati perhutanikebanyakan kayunya lurus</font>\r\n	</p>\r\n</blockquote>\r\n', 20000000, 1, '30.00', '2018-01-24', '79kayu-jati-emas.jpg', 5, 2),
(54, 10, 'Kayu Jati Rakyat', '<p style=\"text-align: justify\">\r\nJenis<span style=\"white-space: pre\" class=\"Apple-tab-span\">	</span>:Jati RAKYAT\r\n</p>\r\n<p style=\"text-align: justify\">\r\nAsal<span style=\"white-space: pre\" class=\"Apple-tab-span\">	</span>:Jawa Barat\r\n</p>\r\n<p style=\"text-align: justify\">\r\nHarga<span style=\"white-space: pre\" class=\"Apple-tab-span\">	</span>:Rp.25.000.000\r\n</p>\r\n<p style=\"text-align: justify\">\r\nStatus :Ada\r\n</p>\r\n<p style=\"text-align: justify\">\r\n<span style=\"color: #333333\"><font face=\"times new roman, times\" size=\"2\"><span style=\"white-space: pre\" class=\"Apple-tab-span\">	</span>Pohon jati rakyat lebih cenderung banyak bengkokan pada batangnya sehingga kayu yang dihasilkan biasanya bengkok. Selain itu, pohon jati rakyat memiliki masa pertumbuhan lebih lama daripada kayu jati emas yakni sekitar 15 hingga 25 tahun untuk siap ditebang dan bisa digunakan kayunya.</font></span>\r\n</p>\r\n<ul style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin: 0px 0px 24px 1.5em; padding: 0px; vertical-align: baseline; list-style: square; color: #333333\">\r\n	<li style=\"background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline\">\r\n	<blockquote style=\"background: transparent; border: 0px; margin: 0px; padding: 0px 3em; vertical-align: baseline; quotes: none; font-style: italic\">\r\n		<p style=\"text-align: justify; background: transparent; border: 0px; margin: 0px 0px 24px; padding: 0px; vertical-align: baseline\">\r\n		<span style=\"background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; text-decoration: underline\"><font face=\"times new roman, times\" size=\"2\">Kekurangan<br />\r\n		</font></span>\r\n		</p>\r\n	</blockquote>\r\n	<ul style=\"background: transparent; border: 0px; margin: 0px 0px 0px 1.5em; padding: 0px; vertical-align: baseline; list-style: square\">\r\n		<li style=\"text-align: justify; background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline\"><span style=\"background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline\"><font face=\"times new roman, times\" size=\"2\">banyak gubal</font></span></li>\r\n		<li style=\"text-align: justify; background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline\"><span style=\"background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline\"><font face=\"times new roman, times\" size=\"2\">kadar air tinggi</font></span></li>\r\n		<li style=\"text-align: justify; background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline\"><span style=\"background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline\"><font face=\"times new roman, times\" size=\"2\">ada yang kayunya keras dan ada juga yang tidak (tergantung tua-mudanya kayu)</font></span></li>\r\n		<li style=\"text-align: justify; background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline\"><span style=\"background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline\"><font face=\"times new roman, times\" size=\"2\">warna kayu pucat</font></span></li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n<blockquote style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin: 0px; padding: 0px 3em; vertical-align: baseline; quotes: none; font-style: italic; color: #333333\">\r\n	<p style=\"text-align: justify; background: transparent; border: 0px; margin: 0px 0px 24px; padding: 0px; vertical-align: baseline\">\r\n	<span style=\"background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; text-decoration: underline\"><font face=\"times new roman, times\" size=\"2\">Kelebihan</font></span>\r\n	</p>\r\n</blockquote>\r\n<ul style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin: 0px 0px 24px 1.5em; padding: 0px; vertical-align: baseline; list-style: square; color: #333333\">\r\n	<li style=\"text-align: justify; background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline\"><font face=\"times new roman, times\" size=\"2\"><span style=\"background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline\">harganya lebih murah dari kayu jati perhutani</span><span style=\"background: transparent; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline\">cukup awet</span></font></li>\r\n</ul>\r\n<p style=\"text-align: justify\">\r\n&nbsp;\r\n</p>\r\n', 25000000, 2, '20.00', '2018-01-24', '17kayu-jati-rakyat.jpg', 4, 3),
(55, 10, 'Kayu Jati Perhutani', '<p style=\"text-align: justify\">\r\nJenis<span style=\"white-space: pre\" class=\"Apple-tab-span\">	</span>:Jati Perhutani\r\n</p>\r\n<p style=\"text-align: justify\">\r\nAsal<span style=\"white-space: pre\" class=\"Apple-tab-span\">	</span>:Jawa Tengah\r\n</p>\r\n<p style=\"text-align: justify\">\r\nHarga<span style=\"white-space: pre\" class=\"Apple-tab-span\">	</span>:Rp.30.000.000\r\n</p>\r\n<p style=\"text-align: justify\">\r\nStatus :Ada\r\n</p>\r\n<p style=\"text-align: justify\">\r\n<span style=\"color: #333333\"><span style=\"font-size: 16px; font-family: Arial, Helvetica, sans-serif; white-space: pre\" class=\"Apple-tab-span\">	</span><font face=\"times new roman, times\" size=\"2\">Kayu jati perhutani adalah kayu jati yang dikelola oleh perhutani mulai dari pembibitan hingga penebangan dan penjualannya. Kayu jati perhutani atau sering disebut juga dengan kayu jati TPK dikenal memiliki kualitas yang sangat bagus dibanding jenis kayu jati yang lain.</font></span><font face=\"times new roman, times\" size=\"2\">&nbsp;</font>\r\n</p>\r\n<p style=\"text-align: justify\">\r\n<span><span style=\"white-space: pre\" class=\"Apple-tab-span\">	</span>Kekurangan</span>\r\n</p>\r\n<ul style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px none; margin: 0px 0px 24px 1.5em; padding: 0px; vertical-align: baseline; list-style: outside none square; color: #333333\">\r\n	<li style=\"background: transparent none repeat scroll 0% 0%; border: 0px none; margin: 0px; padding: 0px; vertical-align: baseline\"><span style=\"background: transparent none repeat scroll 0% 0%; border: 0px none; margin: 0px; padding: 0px; vertical-align: baseline\"><font face=\"times new roman, times\" size=\"2\">harganya mahal</font></span></li>\r\n</ul>\r\n<blockquote style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px none; margin: 0px; padding: 0px 3em; vertical-align: baseline; quotes: none; font-style: italic; color: #333333\">\r\n	<p style=\"background: transparent none repeat scroll 0% 0%; border: 0px none; margin: 0px 0px 24px; padding: 0px; vertical-align: baseline\">\r\n	<font face=\"times new roman, times\" size=\"2\">Kelebihan</font>\r\n	</p>\r\n</blockquote>\r\n<ul style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px none; margin: 0px 0px 24px 1.5em; padding: 0px; vertical-align: baseline; list-style: outside none square; color: #333333\">\r\n	<li style=\"background: transparent none repeat scroll 0% 0%; border: 0px none; margin: 0px; padding: 0px; vertical-align: baseline\"><font face=\"times new roman, times\" size=\"2\"><span style=\"background: transparent none repeat scroll 0% 0%; border: 0px none; margin: 0px; padding: 0px; vertical-align: baseline\">pori-pori kayunya lebih padat</span><span style=\"background: transparent none repeat scroll 0% 0%; border: 0px none; margin: 0px; padding: 0px; vertical-align: baseline\">tekturnya lebih berminyak</span><span style=\"background: transparent none repeat scroll 0% 0%; border: 0px none; margin: 0px; padding: 0px; vertical-align: baseline\">warna kayunya lebih hidup</span><span style=\"background: transparent none repeat scroll 0% 0%; border: 0px none; margin: 0px; padding: 0px; vertical-align: baseline\">yang terakhir adalah sangat awet</span></font></li>\r\n</ul>\r\n<p style=\"text-align: justify\">\r\n&nbsp;\r\n</p>\r\n', 30000000, 5, '25.00', '2018-01-24', '90perhutani.jpg', 1, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `hubungi`
--
ALTER TABLE `hubungi`
  ADD PRIMARY KEY (`id_hubungi`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id_kota`);

--
-- Indexes for table `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`id_kustomer`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_orders`);

--
-- Indexes for table `orders_temp`
--
ALTER TABLE `orders_temp`
  ADD PRIMARY KEY (`id_orders_temp`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hubungi`
--
ALTER TABLE `hubungi`
  MODIFY `id_hubungi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `id_kota` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `id_kustomer` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_orders` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `orders_temp`
--
ALTER TABLE `orders_temp`
  MODIFY `id_orders_temp` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
