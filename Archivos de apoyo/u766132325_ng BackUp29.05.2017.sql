
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-05-2017 a las 00:08:35
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
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE IF NOT EXISTS `alumnos` (
  `idAlumno` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `dni` int(11) NOT NULL,
  `legajo` int(11) NOT NULL,
  PRIMARY KEY (`idAlumno`),
  UNIQUE KEY `idUser` (`idUsuario`,`dni`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_materias`
--

CREATE TABLE IF NOT EXISTS `alumnos_materias` (
  `idAlumno` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  PRIMARY KEY (`idAlumno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE IF NOT EXISTS `asistencias` (
  `fecha` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `idMateria` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `asistencia` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`asistencia`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE IF NOT EXISTS `aulas` (
  `idAula` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`idAula`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE IF NOT EXISTS `dias` (
  `idDia` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idDia`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `dias`
--

INSERT INTO `dias` (`idDia`, `Nombre`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miercoles'),
(4, 'Jueves'),
(5, 'Viernes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE IF NOT EXISTS `materias` (
  `idMateria` int(11) NOT NULL AUTO_INCREMENT,
  `idAula` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cuatrimestre` int(11) NOT NULL,
  `division` varchar(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dia` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idMateria`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`idMateria`, `idAula`, `nombre`, `cuatrimestre`, `division`, `dia`) VALUES
(1, 1, 'Base de datos', 1, 'A', ''),
(2, 1, 'Matematica', 2, 'B', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE IF NOT EXISTS `profesores` (
  `idProfesor` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idProfesor`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`idProfesor`, `idUsuario`, `nombre`, `apellido`) VALUES
(1, 2, 'Diegote', 'SQL'),
(2, 2, 'Marcos', 'Vazquez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores_materias`
--

CREATE TABLE IF NOT EXISTS `profesores_materias` (
  `idProfesor` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  PRIMARY KEY (`idProfesor`,`idMateria`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `profesores_materias`
--

INSERT INTO `profesores_materias` (`idProfesor`, `idMateria`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idRol` int(11) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
