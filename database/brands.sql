-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Mai 2023 um 20:28
-- Server-Version: 10.4.27-MariaDB
-- PHP-Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `test2`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brandname` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `brands`
--

INSERT INTO `brands` (`id`, `brandname`, `logo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Nokia', NULL, NULL, '2023-05-06 00:02:10', '2023-05-06 00:02:10'),
(2, 'alcatel', NULL, NULL, '2023-05-06 00:02:47', '2023-05-06 00:02:47'),
(3, 'Benefon', NULL, NULL, '2023-05-06 00:03:49', '2023-05-06 00:03:49'),
(4, 'Samsung', NULL, NULL, '2023-05-06 00:04:02', '2023-05-06 00:04:02'),
(5, 'Mitsubishi', NULL, NULL, '2023-05-06 00:04:21', '2023-05-06 00:04:21'),
(6, 'Motorola', NULL, NULL, '2023-05-06 00:04:41', '2023-05-06 00:04:41'),
(7, 'Siemens', NULL, NULL, '2023-05-06 00:05:22', '2023-05-06 00:05:22'),
(8, 'Ericsson', NULL, NULL, '2023-05-06 00:05:48', '2023-05-06 00:05:48'),
(9, 'Panasonic', NULL, NULL, '2023-05-06 00:06:42', '2023-05-06 00:06:42'),
(10, 'Sony', NULL, NULL, '2023-05-06 00:06:55', '2023-05-06 00:06:55'),
(11, 'Bosch', NULL, NULL, '2023-05-06 00:07:10', '2023-05-06 00:07:10'),
(12, 'Philips', NULL, NULL, '2023-05-06 00:07:30', '2023-05-06 00:07:30'),
(13, 'NEC', NULL, NULL, '2023-05-06 00:07:54', '2023-05-06 00:07:54'),
(14, 'Sagem', NULL, NULL, '2023-05-06 00:08:02', '2023-05-06 00:08:02'),
(15, 'Maxon', NULL, NULL, '2023-05-06 00:08:27', '2023-05-06 00:08:27'),
(16, 'Kyocera', NULL, NULL, '2023-05-06 00:08:59', '2023-05-06 00:08:59'),
(17, 'Telit', NULL, NULL, '2023-05-06 00:09:01', '2023-05-06 00:09:01'),
(18, 'Sendo', NULL, NULL, '2023-05-06 00:10:11', '2023-05-06 00:10:11'),
(19, 'LG', NULL, NULL, '2023-05-06 00:16:06', '2023-05-06 00:16:06'),
(20, 'Tel.Me.', NULL, NULL, '2023-05-06 00:16:13', '2023-05-06 00:16:13'),
(21, 'Neonode', NULL, NULL, '2023-05-06 00:16:24', '2023-05-06 00:16:24'),
(22, 'Sharp', NULL, NULL, '2023-05-06 00:18:48', '2023-05-06 00:18:48'),
(23, 'Chea', NULL, NULL, '2023-05-06 00:20:08', '2023-05-06 00:20:08'),
(24, 'Mitac', NULL, NULL, '2023-05-06 00:23:23', '2023-05-06 00:23:23'),
(25, 'Sewon', NULL, NULL, '2023-05-06 00:24:02', '2023-05-06 00:24:02'),
(26, 'Palm', NULL, NULL, '2023-05-06 00:24:23', '2023-05-06 00:24:23'),
(27, 'Amoi', NULL, NULL, '2023-05-06 00:24:49', '2023-05-06 00:24:49'),
(28, 'Innostream', NULL, NULL, '2023-05-06 00:25:52', '2023-05-06 00:25:52'),
(29, 'O2', NULL, NULL, '2023-05-06 00:28:15', '2023-05-06 00:28:15'),
(30, 'BenQ', NULL, NULL, '2023-05-06 00:30:12', '2023-05-06 00:30:12'),
(31, 'Pantech', NULL, NULL, '2023-05-06 00:30:44', '2023-05-06 00:30:44'),
(32, 'Haier', NULL, NULL, '2023-05-06 00:33:13', '2023-05-06 00:33:13'),
(33, 'Bird', NULL, NULL, '2023-05-06 00:37:19', '2023-05-06 00:37:19'),
(34, 'i-mate', NULL, NULL, '2023-05-06 00:37:36', '2023-05-06 00:37:36'),
(35, 'BlackBerry', NULL, NULL, '2023-05-06 00:39:22', '2023-05-06 00:39:22'),
(36, 'VK', NULL, NULL, '2023-05-06 00:40:03', '2023-05-06 00:40:03'),
(37, 'Qtek', NULL, NULL, '2023-05-06 00:45:00', '2023-05-06 00:45:00'),
(38, 'Vertu', NULL, NULL, '2023-05-06 00:46:59', '2023-05-06 00:46:59'),
(39, 'Eten', NULL, NULL, '2023-05-06 00:47:09', '2023-05-06 00:47:09'),
(40, 'HP', NULL, NULL, '2023-05-06 00:50:14', '2023-05-06 00:50:14'),
(41, 'BenQ-Siemens', NULL, NULL, '2023-05-06 00:53:55', '2023-05-06 00:53:55'),
(42, 'XCute', NULL, NULL, '2023-05-06 00:56:27', '2023-05-06 00:56:27'),
(43, 'Toshiba', NULL, NULL, '2023-05-06 00:58:11', '2023-05-06 00:58:11'),
(44, 'HTC', NULL, NULL, '2023-05-06 01:02:52', '2023-05-06 01:02:52'),
(45, 'Asus', NULL, NULL, '2023-05-06 01:05:24', '2023-05-06 01:05:24'),
(46, 'Gigabyte', NULL, NULL, '2023-05-06 01:06:03', '2023-05-06 01:06:03'),
(47, 'Apple', NULL, NULL, '2023-05-06 01:08:57', '2023-05-06 01:08:57'),
(48, 'Thuraya', NULL, NULL, '2023-05-06 01:12:30', '2023-05-06 01:12:30'),
(49, 'Fujitsu', NULL, NULL, '2023-05-06 01:13:30', '2023-05-06 01:13:30'),
(50, 'WND', NULL, NULL, '2023-05-06 01:21:08', '2023-05-06 01:21:08'),
(51, 'T-Mobile', NULL, NULL, '2023-05-06 01:23:03', '2023-05-06 01:23:03'),
(52, 'i-mobile', NULL, NULL, '2023-05-06 01:29:14', '2023-05-06 01:29:14'),
(53, 'Vodafone', NULL, NULL, '2023-05-06 01:31:19', '2023-05-06 01:31:19'),
(54, 'Sonim', NULL, NULL, '2023-05-06 01:32:11', '2023-05-06 01:32:11'),
(55, 'MWg', NULL, NULL, '2023-05-06 01:34:58', '2023-05-06 01:34:58'),
(56, 'AT&T', NULL, NULL, '2023-05-06 01:36:36', '2023-05-06 01:36:36'),
(57, 'Huawei', NULL, NULL, '2023-05-06 01:37:34', '2023-05-06 01:37:34'),
(58, 'Acer', NULL, NULL, '2023-05-06 01:40:50', '2023-05-06 01:40:50'),
(59, 'Garmin-Asus', NULL, NULL, '2023-05-06 01:41:08', '2023-05-06 01:41:08'),
(60, 'iNQ', NULL, NULL, '2023-05-06 01:50:56', '2023-05-06 01:50:56'),
(61, 'Dell', NULL, NULL, '2023-05-06 01:51:22', '2023-05-06 01:51:22'),
(62, 'ZTE', NULL, NULL, '2023-05-06 01:54:33', '2023-05-06 01:54:33'),
(63, 'Modu', NULL, NULL, '2023-05-06 01:59:24', '2023-05-06 01:59:24'),
(64, 'Microsoft', NULL, NULL, '2023-05-06 02:00:23', '2023-05-06 02:00:23'),
(65, 'Micromax', NULL, NULL, '2023-05-06 02:01:49', '2023-05-06 02:01:49'),
(66, 'BLU', NULL, NULL, '2023-05-06 02:10:35', '2023-05-06 02:10:35'),
(67, 'Spice', NULL, NULL, '2023-05-06 02:13:52', '2023-05-06 02:13:52'),
(68, 'Icemobile', NULL, NULL, '2023-05-06 02:25:48', '2023-05-06 02:25:48'),
(69, 'verykool', NULL, NULL, '2023-05-06 02:26:51', '2023-05-06 02:26:51'),
(70, 'Orange', NULL, NULL, '2023-05-06 02:29:47', '2023-05-06 02:29:47'),
(71, 'Plum', NULL, NULL, '2023-05-06 02:32:17', '2023-05-06 02:32:17'),
(72, 'Honor', NULL, NULL, '2023-05-06 02:33:59', '2023-05-06 02:33:59'),
(73, 'Meizu', NULL, NULL, '2023-05-06 02:40:21', '2023-05-06 02:40:21'),
(74, 'Lenovo', NULL, NULL, '2023-05-06 02:42:08', '2023-05-06 02:42:08'),
(75, 'Celkon', NULL, NULL, '2023-05-06 02:43:53', '2023-05-06 02:43:53'),
(76, 'Amazon', NULL, NULL, '2023-05-06 02:45:48', '2023-05-06 02:45:48'),
(77, 'Casio', NULL, NULL, '2023-05-06 02:46:45', '2023-05-06 02:46:45'),
(78, 'NIU', NULL, NULL, '2023-05-06 02:51:08', '2023-05-06 02:51:08'),
(79, 'Yezz', NULL, NULL, '2023-05-06 02:51:23', '2023-05-06 02:51:23'),
(80, 'Xiaomi', NULL, NULL, '2023-05-06 03:00:26', '2023-05-06 03:00:26'),
(81, 'Parla', NULL, NULL, '2023-05-06 03:03:25', '2023-05-06 03:03:25'),
(82, 'Oppo', NULL, NULL, '2023-05-06 03:08:52', '2023-05-06 03:08:52'),
(83, 'Karbonn', NULL, NULL, '2023-05-06 03:09:22', '2023-05-06 03:09:22'),
(84, 'Jolla', NULL, NULL, '2023-05-06 03:19:36', '2023-05-06 03:19:36'),
(85, 'XOLO', NULL, NULL, '2023-05-06 03:22:13', '2023-05-06 03:22:13'),
(86, 'Prestigio', NULL, NULL, '2023-05-06 03:23:22', '2023-05-06 03:23:22'),
(87, 'Maxwest', NULL, NULL, '2023-05-06 03:26:11', '2023-05-06 03:26:11'),
(88, 'Cat', NULL, NULL, '2023-05-06 03:38:52', '2023-05-06 03:38:52'),
(89, 'Allview', NULL, NULL, '2023-05-06 03:39:20', '2023-05-06 03:39:20'),
(90, 'Unnecto', NULL, NULL, '2023-05-06 03:39:31', '2023-05-06 03:39:31'),
(91, 'Archos', NULL, NULL, '2023-05-06 03:41:28', '2023-05-06 03:41:28'),
(92, 'Gionee', NULL, NULL, '2023-05-06 03:42:28', '2023-05-06 03:42:28'),
(93, 'Emporia', NULL, NULL, '2023-05-06 03:47:36', '2023-05-06 03:47:36'),
(94, 'Lava', NULL, NULL, '2023-05-06 03:48:45', '2023-05-06 03:48:45'),
(95, 'OnePlus', NULL, NULL, '2023-05-06 03:51:26', '2023-05-06 03:51:26'),
(96, 'Wiko', NULL, NULL, '2023-05-06 03:56:25', '2023-05-06 03:56:25'),
(97, 'Nvidia', NULL, NULL, '2023-05-06 04:01:18', '2023-05-06 04:01:18'),
(98, 'vivo', NULL, NULL, '2023-05-06 04:08:32', '2023-05-06 04:08:32'),
(99, 'Yota', NULL, NULL, '2023-05-06 04:14:21', '2023-05-06 04:14:21'),
(100, 'YU', NULL, NULL, '2023-05-06 04:15:22', '2023-05-06 04:15:22'),
(101, 'Posh', NULL, NULL, '2023-05-06 04:21:58', '2023-05-06 04:21:58'),
(102, 'Intex', NULL, NULL, '2023-05-06 04:26:37', '2023-05-06 04:26:37'),
(103, 'QMobile', NULL, NULL, '2023-05-06 04:27:14', '2023-05-06 04:27:14'),
(104, 'Coolpad', NULL, NULL, '2023-05-06 04:35:48', '2023-05-06 04:35:48'),
(105, 'Energizer', NULL, NULL, '2023-05-06 04:42:02', '2023-05-06 04:42:02'),
(106, 'Google', NULL, NULL, '2023-05-06 04:45:50', '2023-05-06 04:45:50'),
(107, 'BQ', NULL, NULL, '2023-05-06 04:46:14', '2023-05-06 04:46:14'),
(108, 'LeEco', NULL, NULL, '2023-05-06 04:54:00', '2023-05-06 04:54:00'),
(109, 'Razer', NULL, NULL, '2023-05-06 05:25:45', '2023-05-06 05:25:45'),
(110, 'Blackview', NULL, NULL, '2023-05-06 05:29:58', '2023-05-06 05:29:58'),
(111, 'Ulefone', NULL, NULL, '2023-05-06 05:32:18', '2023-05-06 05:32:18'),
(112, 'Realme', NULL, NULL, '2023-05-06 05:35:50', '2023-05-06 05:35:50'),
(113, 'Infinix', NULL, NULL, '2023-05-06 05:43:36', '2023-05-06 05:43:36'),
(114, 'Tecno', NULL, NULL, '2023-05-06 05:44:28', '2023-05-06 05:44:28'),
(115, 'TCL', NULL, NULL, '2023-05-06 05:59:10', '2023-05-06 05:59:10'),
(116, 'Fairphone', NULL, NULL, '2023-05-06 06:07:28', '2023-05-06 06:07:28');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`brandname`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
