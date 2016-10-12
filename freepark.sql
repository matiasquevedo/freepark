-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 05, 2016 at 09:43 AM
-- Server version: 5.7.14
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `freepark`
--

-- --------------------------------------------------------

--
-- Table structure for table `estacionamientos`
--

CREATE TABLE IF NOT EXISTS `estacionamientos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `playas_id` bigint(20) NOT NULL,
  `techo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `playas_id` (`playas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `estacionamientos`
--

INSERT INTO `estacionamientos` (`id`, `estado`, `playas_id`, `techo`) VALUES
(1, 0, 1, 0),
(2, 0, 1, 0),
(3, 0, 1, 0),
(4, 0, 1, 0),
(5, 0, 1, 0),
(6, 0, 1, 0),
(7, 0, 2, 0),
(8, 0, 2, 0),
(9, 0, 2, 0),
(10, 0, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `playas`
--

CREATE TABLE IF NOT EXISTS `playas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `latitud` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `longitud` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `playas`
--

INSERT INTO `playas` (`id`, `nombre`, `latitud`, `longitud`) VALUES
(1, 'playa de la mitre', '111111', '222222'),
(2, 'playa de carlitos', '33333', '44444'),
(3, 'playa centro', '55555', '66666');

-- --------------------------------------------------------

--
-- Table structure for table `reservas`
--

CREATE TABLE IF NOT EXISTS `reservas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuarios_id` bigint(20) NOT NULL,
  `vehiculos_id` bigint(20) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `estacionamientos_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estacionamientos_id` (`estacionamientos_id`),
  KEY `usuarios_id` (`usuarios_id`),
  KEY `vehiculos_id` (`vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `tipo`) VALUES
(1, 'administrador', ''),
(2, 'cliente', ''),
(3, 'usuario playa', '');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `activado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `roles_id` (`roles_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `login`, `roles_id`, `password`, `activado`) VALUES
(1, 'pepito', 3, '', 1),
(2, 'juancito', 3, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_datos`
--

CREATE TABLE IF NOT EXISTS `usuarios_datos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `usuarios_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarios_id` (`usuarios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_vehiculos`
--

CREATE TABLE IF NOT EXISTS `usuarios_vehiculos` (
  `usuarios_id` bigint(20) NOT NULL,
  `vehiculos_id` bigint(20) NOT NULL,
  PRIMARY KEY (`usuarios_id`,`vehiculos_id`),
  KEY `vehiculos_id` (`vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuarios_vehiculos`
--

INSERT INTO `usuarios_vehiculos` (`usuarios_id`, `vehiculos_id`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `vehiculos`
--

CREATE TABLE IF NOT EXISTS `vehiculos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `patente` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `patente`, `marca`, `modelo`) VALUES
(1, 'nhj321', 'Renault', '12'),
(2, 'fer329', 'vw', 'saveiro'),
(3, 'wer321', 'ford', 'ka');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `estacionamientos`
--
ALTER TABLE `estacionamientos`
  ADD CONSTRAINT `estacionamientos_ibfk_1` FOREIGN KEY (`playas_id`) REFERENCES `playas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`vehiculos_id`) REFERENCES `vehiculos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`estacionamientos_id`) REFERENCES `estacionamientos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuarios_datos`
--
ALTER TABLE `usuarios_datos`
  ADD CONSTRAINT `usuarios_datos_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuarios_vehiculos`
--
ALTER TABLE `usuarios_vehiculos`
  ADD CONSTRAINT `usuarios_vehiculos_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_vehiculos_ibfk_2` FOREIGN KEY (`vehiculos_id`) REFERENCES `vehiculos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
