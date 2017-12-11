
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 27-05-2017 a las 04:55:18
-- Versión del servidor: 10.1.22-MariaDB
-- Versión de PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `u766132325_ng`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE IF NOT EXISTS `materias` (
  `idMateria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cuatrimestre` int(11) NOT NULL,
  `division` varchar(1) COLLATE latin1_spanish_ci NOT NULL,
  `aula` int(11) NOT NULL,
  `dia` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idMateria`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipoUsuario` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `apellido` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_materias`
--

CREATE TABLE IF NOT EXISTS `usuarios_materias` (
  `idUsuario` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `ausente` int(11) NOT NULL,
  `presente` int(11) NOT NULL,
  `mediaFalta` int(11) NOT NULL,
  `ausenteJustificado` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`,`idMateria`),
  KEY `idMateria` (`idMateria`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
