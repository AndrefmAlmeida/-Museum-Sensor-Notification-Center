-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2020 at 12:13 PM
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
-- Database: `grupo36_mongodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `alerta`
--

CREATE TABLE `alerta` (
  `ID` int(11) NOT NULL,
  `dataHoraMedicao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipoSensor` varchar(4) NOT NULL,
  `valorMedicao` decimal(6,2) NOT NULL,
  `descricao` varchar(1000) NOT NULL,
  `controlo` tinyint(1) NOT NULL,
  `extra` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicoes_sensores`
--

CREATE TABLE `medicoes_sensores` (
  `IDMedicao` int(11) NOT NULL,
  `valorT` decimal(6,2) DEFAULT NULL,
  `valorH` decimal(10,0) DEFAULT NULL,
  `valorL` decimal(10,0) DEFAULT NULL,
  `valorM` tinyint(1) DEFAULT NULL,
  `dataHoraMedicao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ronda`
--

CREATE TABLE `ronda` (
  `horaRonda` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `diaSemana` enum('SEG','TER','QUA','QUI','SEX','SAB','DOM') NOT NULL,
  `emailUtilizador` varchar(100) NOT NULL,
  `chefeSeguranca` varchar(100) NOT NULL,
  `rondaAtiva` tinyint(1) NOT NULL,
  `inicioRonda` timestamp NULL DEFAULT NULL,
  `fimRonda` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rondaextra`
--

CREATE TABLE `rondaextra` (
  `horaRonda` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `emailUtilizador` varchar(100) NOT NULL,
  `rondaAtiva` tinyint(1) NOT NULL,
  `inicioRonda` timestamp NULL DEFAULT NULL,
  `fimRonda` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rondaextra`
--

INSERT INTO `rondaextra` (`horaRonda`, `emailUtilizador`, `rondaAtiva`, `inicioRonda`, `fimRonda`) VALUES
('2020-05-26 14:22:26', 'asd', 0, '2020-05-18 12:16:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sistema`
--

CREATE TABLE `sistema` (
  `limiteTemperaturaMax` decimal(6,2) NOT NULL,
  `limiteTemperaturaMin` decimal(6,2) NOT NULL,
  `limiteHumidadeMax` decimal(6,2) NOT NULL,
  `limiteHumidadeMin` decimal(6,2) NOT NULL,
  `limiteLuminosidadeMax` decimal(6,2) NOT NULL,
  `margemPico` int(11) NOT NULL,
  `timeAfterAlert` int(11) NOT NULL,
  `percentagemMargem` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `sistema`
--

INSERT INTO `sistema` (`limiteTemperaturaMax`, `limiteTemperaturaMin`, `limiteHumidadeMax`, `limiteHumidadeMin`, `limiteLuminosidadeMax`, `margemPico`, `timeAfterAlert`, `percentagemMargem`) VALUES
('50.00', '10.00', '80.00', '20.00', '5000.00', 3, 5000, '0.20');

-- --------------------------------------------------------

--
-- Table structure for table `utilizador`
--

CREATE TABLE `utilizador` (
  `emailUtilizador` varchar(100) NOT NULL,
  `nomeUtilizador` varchar(100) DEFAULT NULL,
  `tipoUtilizador` enum('Administrador','ChefeSeguranca','DiretorMuseu','Seguranca','Auditor','Sensor','Migracao') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utilizador`
--

INSERT INTO `utilizador` (`emailUtilizador`, `nomeUtilizador`, `tipoUtilizador`) VALUES
('asd', 'asd', 'ChefeSeguranca');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alerta`
--
ALTER TABLE `alerta`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `medicoes_sensores`
--
ALTER TABLE `medicoes_sensores`
  ADD PRIMARY KEY (`IDMedicao`);

--
-- Indexes for table `ronda`
--
ALTER TABLE `ronda`
  ADD PRIMARY KEY (`horaRonda`,`diaSemana`),
  ADD KEY `FOREIGN` (`emailUtilizador`);

--
-- Indexes for table `rondaextra`
--
ALTER TABLE `rondaextra`
  ADD PRIMARY KEY (`horaRonda`),
  ADD KEY `FOREIGN` (`emailUtilizador`);

--
-- Indexes for table `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`emailUtilizador`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alerta`
--
ALTER TABLE `alerta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2710;

--
-- AUTO_INCREMENT for table `medicoes_sensores`
--
ALTER TABLE `medicoes_sensores`
  MODIFY `IDMedicao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4876;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ronda`
--
ALTER TABLE `ronda`
  ADD CONSTRAINT `ronda_ibfk_1` FOREIGN KEY (`emailUtilizador`) REFERENCES `utilizador` (`emailUtilizador`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `rondaextra`
--
ALTER TABLE `rondaextra`
  ADD CONSTRAINT `rondaextra_ibfk_1` FOREIGN KEY (`emailUtilizador`) REFERENCES `utilizador` (`emailUtilizador`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
