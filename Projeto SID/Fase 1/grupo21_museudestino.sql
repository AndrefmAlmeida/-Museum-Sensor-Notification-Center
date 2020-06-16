-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2020 at 12:01 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grupo21_museudestino`
--

-- --------------------------------------------------------

--
-- Table structure for table `log_alertas`
--

CREATE TABLE `log_alertas` (
  `id` int(11) NOT NULL,
  `utilizador` varchar(100) COLLATE utf8_bin NOT NULL,
  `operacao` enum('SELECT','INSERT','UPDATE','DELETE') COLLATE utf8_bin NOT NULL,
  `datetime_operacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precedencia` tinyint(1) NOT NULL,
  `IDAlerta` int(11) NOT NULL,
  `tipoSensor` enum('Temperatura','Luminosidade','Humidade','Movimento') COLLATE utf8_bin NOT NULL,
  `descricao` varchar(100) COLLATE utf8_bin NOT NULL,
  `IDMedicao` int(11) NOT NULL,
  `migrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `log_consulta_utilizadores`
--

CREATE TABLE `log_consulta_utilizadores` (
  `Id` int(11) NOT NULL,
  `utilizador` varchar(100) COLLATE utf8_bin NOT NULL,
  `datetime_operacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `descricao` varchar(100) COLLATE utf8_bin NOT NULL,
  `migrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `log_consulta_utilizadores`
--

INSERT INTO `log_consulta_utilizadores` (`Id`, `utilizador`, `datetime_operacao`, `descricao`, `migrado`) VALUES
(9, 'root@localhost', '2020-04-08 21:52:12', 'Nome: aaa Email: .', 0);

-- --------------------------------------------------------

--
-- Table structure for table `log_medicoes_sensores`
--

CREATE TABLE `log_medicoes_sensores` (
  `Id` int(11) NOT NULL,
  `utilizador` varchar(100) COLLATE utf8_bin NOT NULL,
  `operacao` enum('SELECT','UPDATE','DELETE','INSERT') COLLATE utf8_bin NOT NULL,
  `datetime_operacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precedencia` tinyint(1) NOT NULL,
  `IDMedicao` int(11) NOT NULL,
  `valorMedicao` decimal(10,0) NOT NULL,
  `tipoSensor` enum('Temperatura','Luminosidade','Humidade','Movimento') COLLATE utf8_bin NOT NULL,
  `dataHoraMedicao` timestamp NOT NULL DEFAULT current_timestamp(),
  `migrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `log_ronda`
--

CREATE TABLE `log_ronda` (
  `Id` int(11) NOT NULL,
  `utilizador` varchar(100) COLLATE utf8_bin NOT NULL,
  `operacao` enum('SELECT','UPDATE','DELETE','INSERT') COLLATE utf8_bin NOT NULL,
  `datetime_operacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precedencia` tinyint(1) NOT NULL,
  `diaSemana` enum('SEG','TER','QUA','QUI','SEX','SAB','DOM') COLLATE utf8_bin NOT NULL,
  `horaRonda` time NOT NULL,
  `emailUtilizador` varchar(100) COLLATE utf8_bin NOT NULL,
  `chefeSeguranca` varchar(100) COLLATE utf8_bin NOT NULL,
  `rondaAtiva` tinyint(1) NOT NULL,
  `inicioRonda` timestamp NULL DEFAULT NULL,
  `fimRonda` timestamp NULL DEFAULT NULL,
  `migrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `log_ronda`
--

INSERT INTO `log_ronda` (`Id`, `utilizador`, `operacao`, `datetime_operacao`, `precedencia`, `diaSemana`, `horaRonda`, `emailUtilizador`, `chefeSeguranca`, `rondaAtiva`, `inicioRonda`, `fimRonda`, `migrado`) VALUES
(10, 'root', 'DELETE', '2020-04-15 16:05:19', 0, 'SEG', '21:13:52', 'bbb@museu.com', '', 0, '0000-00-00 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `log_rondaextra`
--

CREATE TABLE `log_rondaextra` (
  `Id` int(11) NOT NULL,
  `utilizador` varchar(100) COLLATE utf8_bin NOT NULL,
  `operacao` enum('SELECT','UPDATE','DELETE','INSERT') COLLATE utf8_bin NOT NULL,
  `datetime_operacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precedencia` tinyint(1) NOT NULL,
  `dataHora` timestamp NULL DEFAULT NULL,
  `emailUtilizador` varchar(100) COLLATE utf8_bin NOT NULL,
  `rondaAtiva` tinyint(1) NOT NULL,
  `inicioRonda` timestamp NULL DEFAULT NULL,
  `fimRonda` timestamp NULL DEFAULT NULL,
  `migrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `log_rondaextra`
--

INSERT INTO `log_rondaextra` (`Id`, `utilizador`, `operacao`, `datetime_operacao`, `precedencia`, `dataHora`, `emailUtilizador`, `rondaAtiva`, `inicioRonda`, `fimRonda`, `migrado`) VALUES
(2, 'root', 'DELETE', '2020-04-15 16:05:13', 0, '2020-04-05 13:14:23', 'ccc@museu.com', 0, '0000-00-00 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `log_sistema`
--

CREATE TABLE `log_sistema` (
  `id` int(11) NOT NULL,
  `utilizador` varchar(100) COLLATE utf8_bin NOT NULL,
  `operacao` enum('SELECT','INSERT','UPDATE','DELETE') COLLATE utf8_bin NOT NULL,
  `datetime_operacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precedencia` tinyint(1) NOT NULL,
  `limiteLuminosidade` decimal(11,0) NOT NULL,
  `limiteHumidade` decimal(11,0) NOT NULL,
  `limiteTemperatura` decimal(11,0) NOT NULL,
  `migrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `log_utilizador`
--

CREATE TABLE `log_utilizador` (
  `Id` int(11) NOT NULL,
  `utilizador` varchar(100) COLLATE utf8_bin NOT NULL,
  `operacao` enum('SELECT','UPDATE','DELETE','INSERT') COLLATE utf8_bin NOT NULL,
  `datetime_operacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precedencia` tinyint(1) NOT NULL,
  `emailUtilizador` varchar(100) COLLATE utf8_bin NOT NULL,
  `nomeUtilizador` varchar(100) COLLATE utf8_bin NOT NULL,
  `tipoUtilizador` enum('Administrador','ChefeSeguranca','Seguranca','DiretorMuseu','Auditor','Sensor','Migracao') COLLATE utf8_bin NOT NULL,
  `migrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `log_utilizador`
--

INSERT INTO `log_utilizador` (`Id`, `utilizador`, `operacao`, `datetime_operacao`, `precedencia`, `emailUtilizador`, `nomeUtilizador`, `tipoUtilizador`, `migrado`) VALUES
(40, 'root@localhost', 'INSERT', '2020-04-08 22:38:17', 0, 'teste@museu.teste', 'teste', 'Seguranca', 0),
(41, 'root@localhost', 'INSERT', '2020-04-13 17:12:03', 0, 'dmteste@museu.com', 'dmteste', 'DiretorMuseu', 0),
(42, 'root', 'DELETE', '2020-04-13 17:35:01', 0, 'dmteste@museu.com', 'dmteste', 'DiretorMuseu', 0),
(43, 'root', 'DELETE', '2020-04-13 17:36:28', 0, 'teste@museu.teste', 'teste', 'Seguranca', 0),
(44, 'root@localhost', 'INSERT', '2020-04-13 17:37:05', 0, 'dmuser@museu.com', 'dmuser', 'DiretorMuseu', 0),
(45, 'root', 'DELETE', '2020-04-13 17:54:30', 0, 'dmuser@museu.com', 'dmuser', 'DiretorMuseu', 0),
(46, 'root@localhost', 'INSERT', '2020-04-13 17:55:03', 0, 'dm@museu.com', 'dm', 'DiretorMuseu', 0),
(47, 'root', 'DELETE', '2020-04-13 18:00:53', 0, 'dm@museu.com', 'dm', 'DiretorMuseu', 0),
(48, 'root@localhost', 'INSERT', '2020-04-13 18:01:14', 0, 'dm@museu.com', 'dm', 'DiretorMuseu', 0),
(49, 'root', 'DELETE', '2020-04-13 18:29:28', 0, 'dm@museu.com', 'dm', 'DiretorMuseu', 0),
(50, 'root@localhost', 'INSERT', '2020-04-13 18:29:47', 0, 'dm@museu.com', 'dm', 'DiretorMuseu', 0),
(51, 'root', 'DELETE', '2020-04-15 15:57:54', 0, 'dm@museu.com', 'dm', 'DiretorMuseu', 0),
(52, 'root@localhost', 'INSERT', '2020-04-15 15:58:36', 0, 'seg1@museu.com', 'seg1', 'Seguranca', 0),
(53, 'root', 'DELETE', '2020-04-15 16:02:46', 0, 'seg1@museu.com', 'seg1', 'Seguranca', 0),
(54, 'root', 'DELETE', '2020-04-15 16:03:01', 0, 'aaa@museu.com', 'aaa', 'Administrador', 0),
(55, 'root', 'DELETE', '2020-04-15 16:05:30', 0, 'bbb@museu.com', 'bbb', 'Administrador', 0),
(56, 'root', 'DELETE', '2020-04-15 16:05:41', 0, 'ccc@museu.com', 'ccc', 'Administrador', 0),
(57, 'root@localhost', 'INSERT', '2020-04-15 16:05:59', 0, 'seg1@museu.com', 'seg1', 'Seguranca', 0),
(58, 'root', 'DELETE', '2020-04-15 16:10:31', 0, 'seg1@museu.com', 'seg1', 'Seguranca', 0),
(59, 'root@localhost', 'INSERT', '2020-04-15 16:12:28', 0, 'segat', 'seg', 'Seguranca', 0),
(60, 'root@localhost', 'INSERT', '2020-04-15 16:15:21', 0, 'seg1@museu.com', 'seg1', 'Seguranca', 0),
(61, 'root@localhost', 'INSERT', '2020-04-15 19:45:44', 0, 'admin1@museu.com', 'admin1', 'Administrador', 0),
(62, 'root', 'DELETE', '2020-04-15 19:46:04', 0, 'segat', 'seg', 'Seguranca', 0),
(63, 'root', 'DELETE', '2020-04-15 19:46:13', 0, 'seg1@museu.com', 'seg1', 'Seguranca', 0),
(64, 'root@localhost', 'INSERT', '2020-04-15 19:51:34', 0, 'seg1@museu.com', 'seg1', 'Seguranca', 0),
(65, 'root@localhost', 'INSERT', '2020-04-15 22:15:54', 0, 'seg2@museu.com', 'seg2', 'Seguranca', 0),
(66, 'root', 'DELETE', '2020-04-15 23:15:02', 0, 'admin1@museu.com', 'admin1', 'Administrador', 0),
(67, 'root', 'DELETE', '2020-04-15 23:15:15', 0, 'seg1@museu.com', 'seg1', 'Seguranca', 0),
(68, 'root', 'DELETE', '2020-04-15 23:15:20', 0, 'seg2@museu.com', 'seg2', 'Seguranca', 0),
(69, 'root@localhost', 'INSERT', '2020-04-15 23:15:35', 0, 'seg1@museu.com', 'seg1', 'Seguranca', 0),
(70, 'root', 'DELETE', '2020-04-15 23:17:43', 0, 'seg1@museu.com', 'seg1', 'Seguranca', 0),
(71, 'root@localhost', 'INSERT', '2020-04-15 23:17:58', 0, 'seg1@museu.com', 'seg1', 'Seguranca', 0),
(72, 'root@localhost', 'INSERT', '2020-04-16 22:53:55', 0, 'auditor1@museu.com', 'auditor1', 'Auditor', 0),
(73, 'root', 'DELETE', '2020-04-16 22:57:49', 0, 'seg1@museu.com', 'seg1', 'Seguranca', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log_alertas`
--
ALTER TABLE `log_alertas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_consulta_utilizadores`
--
ALTER TABLE `log_consulta_utilizadores`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `log_medicoes_sensores`
--
ALTER TABLE `log_medicoes_sensores`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `log_ronda`
--
ALTER TABLE `log_ronda`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `log_rondaextra`
--
ALTER TABLE `log_rondaextra`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `log_sistema`
--
ALTER TABLE `log_sistema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_utilizador`
--
ALTER TABLE `log_utilizador`
  ADD PRIMARY KEY (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
