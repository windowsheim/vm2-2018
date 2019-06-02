-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Gegenereerd op: 09 mei 2019 om 06:51
-- Serverversie: 5.7.26-0ubuntu0.18.10.1
-- PHP-versie: 7.2.17-0ubuntu0.18.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vm2db`
--
CREATE DATABASE IF NOT EXISTS `vm2db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `vm2db`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Klanten`
--

DROP TABLE IF EXISTS `Klanten`;
CREATE TABLE `Klanten` (
  `klantnaam` text NOT NULL,
  `klantnummer` int(255) NOT NULL,
  `omgeving` text NOT NULL,
  `aantal_omgevingen` int(11) NOT NULL,
  `servernaam` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tabel leegmaken voor invoegen `Klanten`
--

TRUNCATE TABLE `Klanten`;
--
-- Gegevens worden geëxporteerd voor tabel `Klanten`
--

INSERT INTO `Klanten` (`klantnaam`, `klantnummer`, `omgeving`, `aantal_omgevingen`, `servernaam`) VALUES
('Piet Paulusma', 1, 'test', 1, 'klant001-test-web1');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `Klanten`
--
ALTER TABLE `Klanten`
  ADD PRIMARY KEY (`klantnummer`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `Klanten`
--
ALTER TABLE `Klanten`
  MODIFY `klantnummer` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
