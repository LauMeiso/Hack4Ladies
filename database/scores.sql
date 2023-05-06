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
-- Tabellenstruktur für Tabelle `scores`
--

CREATE TABLE `scores` (
  `FirmenID` int(11) NOT NULL,
  `Energie` int(11) NOT NULL,
  `Recycling` int(11) NOT NULL,
  `Langlebigkeit` int(11) NOT NULL,
  `Umweltverschmutzung` int(11) NOT NULL,
  `Soziale_Verantwortung` int(11) NOT NULL,
  `Faire_Arbeitsbedingungen` int(11) NOT NULL,
  `Transparenz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `scores`
--

INSERT INTO `scores` (`FirmenID`, `Energie`, `Recycling`, `Langlebigkeit`, `Umweltverschmutzung`, `Soziale_Verantwortung`, `Faire_Arbeitsbedingungen`, `Transparenz`) VALUES
(1, 1, 2, 3, 4, 5, 6, 7),
(2, -10, -10, 3, 0, 9, 8, -4),
(3, 2, -6, -4, 1, 4, 3, 1),
(4, 3, -1, -1, 2, 9, 9, -5),
(5, 8, 10, 4, 9, -5, -10, 5),
(6, 8, 0, 5, -5, -3, 7, 6),
(7, 2, -7, -6, 7, 5, -9, -7),
(8, -9, -7, -3, -1, 7, 2, 3),
(9, 4, 6, 1, 7, 8, -1, 0),
(10, -6, -7, -7, -6, -4, -2, 3),
(11, 1, 1, 3, 5, 8, 2, -2),
(12, -4, 5, -9, 3, 5, -3, 5),
(13, 1, -1, 8, 8, 3, 0, -4),
(14, 5, 6, 6, 5, 0, -2, 3),
(15, 1, -7, -7, 6, 0, 3, 5),
(16, 0, -10, 2, 1, -2, -8, 6),
(17, -6, -9, 7, -6, -5, 4, -6),
(18, 5, -7, 9, 5, -10, 5, 7),
(19, -3, 6, -4, 1, 0, -9, -1),
(20, -4, 7, 8, -9, -6, -5, -1),
(21, -6, 3, -3, -7, -3, 3, 10),
(22, -8, 2, 1, -5, -10, 2, 4),
(23, 0, 8, 6, -4, -10, -9, 8),
(24, 6, 5, 2, 5, -1, 3, 9),
(25, 1, -6, 2, 2, 10, 7, -10),
(26, -8, -6, -2, 8, -2, -4, -7),
(27, -9, -9, -1, 5, -5, 1, 6),
(28, -3, 4, 10, 9, 7, -4, 2),
(29, -2, 3, 4, -9, -2, 2, 0),
(30, -8, -8, 10, 3, -4, 9, -5),
(31, -8, -6, -4, -3, -4, -3, 7),
(32, -3, 1, 10, 5, 10, -5, -6),
(33, -5, 6, -4, 3, -4, 4, 9),
(34, 6, 1, 7, 0, 4, 1, 0),
(35, 3, -6, -2, 5, 5, -7, 9),
(36, -4, -10, 10, -10, 0, -9, 2),
(37, 5, -4, -10, 10, 4, 10, 6),
(38, 6, -9, -3, -5, -1, 9, -9),
(39, 7, 4, 5, 2, 3, 5, 7),
(40, -5, -4, -9, 9, 10, 10, -8),
(41, 2, -10, 0, -8, 4, -6, 5),
(42, -8, 3, -4, -1, 3, -1, -9),
(43, -7, 7, -6, 3, 7, -7, -5),
(44, 7, -7, -5, -9, -7, -3, -2),
(45, 6, -10, 0, -10, 10, 6, 7),
(46, -3, -8, -4, 0, -10, 4, -9),
(47, 5, -3, 2, -9, 7, -2, 4),
(48, -3, 6, 6, 1, 6, -10, 0),
(49, 5, -9, 7, -8, 9, 2, 7),
(50, -5, 10, 6, -3, -2, -5, 1),
(51, 5, -3, -6, 0, 8, -4, 3),
(52, -2, 5, 6, -8, 10, 1, 5),
(53, 10, 1, 10, -8, -4, 3, 10),
(54, -4, 6, -1, 9, -7, -10, 2),
(55, -3, -1, -10, -7, -7, 7, -1),
(56, -7, -9, -8, 0, 4, 6, 0),
(57, 6, -6, -9, 10, 7, 4, 3),
(58, 8, 8, -7, -10, 6, -3, -5),
(59, 9, 10, 1, 8, -8, 4, 1),
(60, -10, -7, 7, 9, 3, -9, 0),
(61, -5, -4, 5, 6, -3, -8, -8),
(62, 6, -6, 8, 9, -5, 1, 9),
(63, -10, 9, 7, 3, -7, 0, 6),
(64, 9, 1, 10, 2, 2, 2, -4),
(65, -1, -10, 3, 4, -9, 2, 7),
(66, 5, 10, -3, 3, -7, 3, 2),
(67, 2, 8, -9, -7, -6, 0, 10),
(68, -2, 10, 4, 10, 8, 1, -2),
(69, 8, 3, 1, 10, 1, -3, -2),
(70, -1, -8, -9, -2, -3, 8, 6),
(71, 5, 9, 10, 3, 3, -8, -9),
(72, -2, 4, -6, -5, 4, 8, 2),
(73, 0, 9, -6, -7, -8, 4, -7),
(74, 0, 9, 10, -3, 1, 4, 1),
(75, 5, -3, 10, -10, -7, 1, 6),
(76, 0, 0, -1, -5, -1, 9, -10),
(77, 7, -4, 9, -3, 8, -4, 7),
(78, 6, 8, -10, -1, 2, 3, -5),
(79, 3, -9, 6, 0, -1, -3, -4),
(80, -5, -2, 3, 6, 8, 7, -5),
(81, -4, 3, 5, 6, 9, -3, -6),
(82, 3, -10, 1, -8, -6, 7, 1),
(83, -5, 8, 4, -9, -1, -6, 5),
(84, 9, -10, 3, -9, 10, 4, -1),
(85, 8, 4, -8, 2, 5, 4, 4),
(86, -10, 10, 10, -4, -5, 4, 2),
(87, -8, -7, 3, -8, -7, -5, 10),
(88, 10, 5, 2, -5, -6, -4, 9),
(89, 1, -4, -5, -3, 6, 2, -1),
(90, 8, 4, 1, 6, -3, 5, 1),
(91, -8, 2, -1, -4, -2, 6, -5),
(92, 2, -3, -5, -3, -4, 1, -8),
(93, 5, 4, -6, -1, 8, 8, -2),
(94, 9, -3, -2, -10, 8, 5, -3),
(95, -10, -2, 5, 7, -10, -8, 0),
(96, -3, 9, 0, -3, 0, 9, 7),
(97, 7, 3, -5, -3, -2, -6, -2),
(98, 8, 8, 7, 1, 8, -9, 8),
(99, -6, 3, -9, -9, -5, 6, -4),
(100, 6, 6, 0, -7, 0, 0, 5),
(101, 4, -5, 4, -6, -1, -5, -8),
(102, -6, 2, 1, -7, -10, -9, 10),
(103, 3, 10, -4, -5, -3, -4, 3),
(104, -2, 5, 4, 0, -1, 0, 6),
(105, 3, 5, 2, 2, 1, -8, 3),
(106, 6, -6, 2, -9, -1, -8, -9),
(107, -7, 5, 3, -3, 9, 0, 9),
(108, -7, -6, 1, 10, 0, 9, -3),
(109, -3, -9, 2, -8, 1, 6, 7),
(110, 9, -2, 1, 1, -5, -10, 0),
(111, 6, -3, 6, 4, 10, -5, -3),
(112, -5, -8, 9, -10, 10, -6, -10),
(113, -2, -1, 5, 8, -10, 5, 10),
(114, -4, -10, 1, 8, 7, -1, -10),
(115, 10, 8, 1, 9, 7, -5, -1),
(116, 9, 10, 9, 9, 9, 9, 9);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`FirmenID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `scores`
--
ALTER TABLE `scores`
  MODIFY `FirmenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
