
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-08-2018 a las 15:54:16
-- Versión del servidor: 10.1.22-MariaDB
-- Versión de PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `u766132325_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE IF NOT EXISTS `asistencia` (
  `idasistencia` int(11) NOT NULL AUTO_INCREMENT,
  `idMateriasUsuarios` int(11) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `idestado` int(11) DEFAULT NULL,
  `fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idasistencia`),
  KEY `fk_usuario_idx` (`idusuario`),
  KEY `fk_estadoAsistencia_idx` (`idestado`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=332 ;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`idasistencia`, `idMateriasUsuarios`, `idusuario`, `idestado`, `fecha`) VALUES
(15, 125, 23, 1, '09-08-2018'),
(16, 131, 27, 1, '09-08-2018'),
(17, 157, 30, 2, '09-08-2018'),
(18, 159, 31, 1, '09-08-2018'),
(19, 171, 28, 1, '09-08-2018'),
(20, 177, 26, 3, '09-08-2018'),
(21, 182, 25, 4, '09-08-2018'),
(22, 186, 29, 3, '09-08-2018'),
(23, 192, 32, 2, '09-08-2018'),
(24, 126, 23, 1, '09-08-2018'),
(25, 130, 27, 2, '09-08-2018'),
(26, 158, 30, 3, '09-08-2018'),
(27, 160, 31, 4, '09-08-2018'),
(28, 172, 28, 1, '09-08-2018'),
(29, 176, 26, 1, '09-08-2018'),
(30, 181, 25, 2, '09-08-2018'),
(31, 187, 29, 3, '09-08-2018'),
(32, 193, 32, 1, '09-08-2018'),
(33, 127, 23, 1, '09-08-2018'),
(34, 132, 27, 2, '09-08-2018'),
(35, 155, 30, 2, '09-08-2018'),
(36, 168, 31, 2, '09-08-2018'),
(37, 174, 28, 3, '09-08-2018'),
(38, 179, 26, 4, '09-08-2018'),
(39, 184, 25, 4, '09-08-2018'),
(40, 189, 29, 4, '09-08-2018'),
(41, 195, 32, 4, '09-08-2018'),
(42, 124, 23, 1, '09-08-2018'),
(43, 128, 27, 2, '09-08-2018'),
(44, 154, 30, 4, '09-08-2018'),
(45, 170, 31, 3, '09-08-2018'),
(46, 173, 28, 4, '09-08-2018'),
(47, 178, 26, 2, '09-08-2018'),
(48, 183, 25, 1, '09-08-2018'),
(49, 191, 29, 1, '09-08-2018'),
(50, 194, 32, 1, '09-08-2018'),
(51, 118, 23, 2, '09-08-2018'),
(52, 133, 27, 3, '09-08-2018'),
(53, 156, 30, 4, '09-08-2018'),
(54, 169, 31, 1, '09-08-2018'),
(55, 175, 28, 1, '09-08-2018'),
(56, 196, 32, 1, '09-08-2018'),
(57, 185, 25, 2, '09-08-2018'),
(58, 180, 26, 4, '09-08-2018'),
(59, 190, 29, 2, '09-08-2018'),
(60, 125, 23, 1, '08-08-2018'),
(61, 131, 27, 1, '08-08-2018'),
(62, 157, 30, 2, '08-08-2018'),
(63, 159, 31, 1, '08-08-2018'),
(64, 171, 28, 1, '08-08-2018'),
(65, 177, 26, 3, '08-08-2018'),
(66, 182, 25, 4, '08-08-2018'),
(67, 186, 29, 3, '08-08-2018'),
(68, 192, 32, 2, '08-08-2018'),
(69, 126, 23, 1, '08-08-2018'),
(70, 130, 27, 2, '08-08-2018'),
(71, 158, 30, 3, '08-08-2018'),
(72, 160, 31, 4, '08-08-2018'),
(73, 172, 28, 1, '08-08-2018'),
(74, 176, 26, 1, '08-08-2018'),
(75, 181, 25, 2, '08-08-2018'),
(76, 187, 29, 3, '08-08-2018'),
(77, 193, 32, 1, '08-08-2018'),
(78, 127, 23, 1, '08-08-2018'),
(79, 132, 27, 2, '08-08-2018'),
(80, 155, 30, 2, '08-08-2018'),
(81, 168, 31, 2, '08-08-2018'),
(82, 174, 28, 3, '08-08-2018'),
(83, 179, 26, 4, '08-08-2018'),
(84, 184, 25, 4, '08-08-2018'),
(85, 189, 29, 4, '08-08-2018'),
(86, 195, 32, 4, '08-08-2018'),
(87, 124, 23, 2, '08-08-2018'),
(88, 128, 27, 2, '08-08-2018'),
(89, 154, 30, 4, '08-08-2018'),
(90, 170, 31, 3, '08-08-2018'),
(91, 173, 28, 4, '08-08-2018'),
(92, 178, 26, 2, '08-08-2018'),
(93, 183, 25, 1, '08-08-2018'),
(94, 191, 29, 1, '08-08-2018'),
(95, 194, 32, 1, '08-08-2018'),
(96, 118, 23, 2, '08-08-2018'),
(97, 133, 27, 3, '08-08-2018'),
(98, 156, 30, 4, '08-08-2018'),
(99, 169, 31, 1, '08-08-2018'),
(100, 175, 28, 1, '08-08-2018'),
(101, 196, 32, 1, '08-08-2018'),
(102, 185, 25, 2, '08-08-2018'),
(103, 180, 26, 4, '08-08-2018'),
(104, 190, 29, 2, '08-08-2018'),
(105, 125, 23, 1, '07-08-2018'),
(106, 131, 27, 1, '07-08-2018'),
(107, 157, 30, 2, '07-08-2018'),
(108, 159, 31, 1, '07-08-2018'),
(109, 171, 28, 1, '07-08-2018'),
(110, 177, 26, 3, '07-08-2018'),
(111, 182, 25, 4, '07-08-2018'),
(112, 186, 29, 3, '07-08-2018'),
(113, 192, 32, 2, '07-08-2018'),
(114, 126, 23, 1, '07-08-2018'),
(115, 130, 27, 2, '07-08-2018'),
(116, 158, 30, 3, '07-08-2018'),
(117, 160, 31, 4, '07-08-2018'),
(118, 172, 28, 1, '07-08-2018'),
(119, 176, 26, 1, '07-08-2018'),
(120, 181, 25, 2, '07-08-2018'),
(121, 187, 29, 3, '07-08-2018'),
(122, 193, 32, 1, '07-08-2018'),
(123, 127, 23, 1, '07-08-2018'),
(124, 132, 27, 2, '07-08-2018'),
(125, 155, 30, 2, '07-08-2018'),
(126, 168, 31, 2, '07-08-2018'),
(127, 174, 28, 3, '07-08-2018'),
(128, 179, 26, 4, '07-08-2018'),
(129, 184, 25, 4, '07-08-2018'),
(130, 189, 29, 4, '07-08-2018'),
(131, 195, 32, 4, '07-08-2018'),
(132, 124, 23, 2, '07-08-2018'),
(133, 128, 27, 2, '07-08-2018'),
(134, 154, 30, 4, '07-08-2018'),
(135, 170, 31, 3, '07-08-2018'),
(136, 173, 28, 4, '07-08-2018'),
(137, 178, 26, 2, '07-08-2018'),
(138, 183, 25, 1, '07-08-2018'),
(139, 191, 29, 1, '07-08-2018'),
(140, 194, 32, 1, '07-08-2018'),
(141, 118, 23, 2, '07-08-2018'),
(142, 133, 27, 3, '07-08-2018'),
(143, 156, 30, 4, '07-08-2018'),
(144, 169, 31, 1, '07-08-2018'),
(145, 175, 28, 1, '07-08-2018'),
(146, 196, 32, 1, '07-08-2018'),
(147, 185, 25, 2, '07-08-2018'),
(148, 180, 26, 4, '07-08-2018'),
(149, 190, 29, 2, '07-08-2018'),
(150, 125, 23, 1, '06-08-2018'),
(151, 131, 27, 1, '06-08-2018'),
(152, 157, 30, 2, '06-08-2018'),
(153, 159, 31, 1, '06-08-2018'),
(154, 171, 28, 1, '06-08-2018'),
(155, 177, 26, 3, '06-08-2018'),
(156, 182, 25, 4, '06-08-2018'),
(157, 186, 29, 3, '06-08-2018'),
(158, 192, 32, 2, '06-08-2018'),
(159, 126, 23, 1, '06-08-2018'),
(160, 130, 27, 2, '06-08-2018'),
(161, 158, 30, 3, '06-08-2018'),
(162, 160, 31, 4, '06-08-2018'),
(163, 172, 28, 1, '06-08-2018'),
(164, 176, 26, 1, '06-08-2018'),
(165, 181, 25, 2, '06-08-2018'),
(166, 187, 29, 3, '06-08-2018'),
(167, 193, 32, 1, '06-08-2018'),
(168, 127, 23, 1, '06-08-2018'),
(169, 132, 27, 2, '06-08-2018'),
(170, 155, 30, 2, '06-08-2018'),
(171, 168, 31, 2, '06-08-2018'),
(172, 174, 28, 3, '06-08-2018'),
(173, 179, 26, 4, '06-08-2018'),
(174, 184, 25, 4, '06-08-2018'),
(175, 189, 29, 4, '06-08-2018'),
(176, 195, 32, 4, '06-08-2018'),
(177, 124, 23, 2, '06-08-2018'),
(178, 128, 27, 2, '06-08-2018'),
(179, 154, 30, 4, '06-08-2018'),
(180, 170, 31, 3, '06-08-2018'),
(181, 173, 28, 4, '06-08-2018'),
(182, 178, 26, 2, '06-08-2018'),
(183, 183, 25, 1, '06-08-2018'),
(184, 191, 29, 1, '06-08-2018'),
(185, 194, 32, 1, '06-08-2018'),
(186, 118, 23, 2, '06-08-2018'),
(187, 133, 27, 3, '06-08-2018'),
(188, 156, 30, 4, '06-08-2018'),
(189, 169, 31, 1, '06-08-2018'),
(190, 175, 28, 1, '06-08-2018'),
(191, 196, 32, 1, '06-08-2018'),
(192, 185, 25, 2, '06-08-2018'),
(193, 180, 26, 4, '06-08-2018'),
(194, 190, 29, 2, '06-08-2018'),
(195, 125, 23, 1, '03-08-2018'),
(196, 131, 27, 1, '03-08-2018'),
(197, 157, 30, 2, '03-08-2018'),
(198, 159, 31, 1, '03-08-2018'),
(199, 171, 28, 1, '03-08-2018'),
(200, 177, 26, 3, '03-08-2018'),
(201, 182, 25, 4, '03-08-2018'),
(202, 186, 29, 3, '03-08-2018'),
(203, 192, 32, 2, '03-08-2018'),
(204, 126, 23, 1, '03-08-2018'),
(205, 130, 27, 2, '03-08-2018'),
(206, 158, 30, 3, '03-08-2018'),
(207, 160, 31, 4, '03-08-2018'),
(208, 172, 28, 1, '03-08-2018'),
(209, 176, 26, 1, '03-08-2018'),
(210, 181, 25, 2, '03-08-2018'),
(211, 187, 29, 3, '03-08-2018'),
(212, 193, 32, 1, '03-08-2018'),
(213, 127, 23, 1, '03-08-2018'),
(214, 132, 27, 2, '03-08-2018'),
(215, 155, 30, 2, '03-08-2018'),
(216, 168, 31, 2, '03-08-2018'),
(217, 174, 28, 3, '03-08-2018'),
(218, 179, 26, 4, '03-08-2018'),
(219, 184, 25, 4, '03-08-2018'),
(220, 189, 29, 4, '03-08-2018'),
(221, 195, 32, 4, '03-08-2018'),
(222, 124, 23, 2, '03-08-2018'),
(223, 128, 27, 2, '03-08-2018'),
(224, 154, 30, 4, '03-08-2018'),
(225, 170, 31, 3, '03-08-2018'),
(226, 173, 28, 4, '03-08-2018'),
(227, 178, 26, 2, '03-08-2018'),
(228, 183, 25, 1, '03-08-2018'),
(229, 191, 29, 1, '03-08-2018'),
(230, 194, 32, 1, '03-08-2018'),
(231, 118, 23, 2, '03-08-2018'),
(232, 133, 27, 3, '03-08-2018'),
(233, 156, 30, 4, '03-08-2018'),
(234, 169, 31, 1, '03-08-2018'),
(235, 175, 28, 1, '03-08-2018'),
(236, 196, 32, 1, '03-08-2018'),
(237, 185, 25, 2, '03-08-2018'),
(238, 180, 26, 4, '03-08-2018'),
(239, 190, 29, 2, '03-08-2018'),
(240, 125, 23, 1, '02-08-2018'),
(241, 131, 27, 1, '02-08-2018'),
(242, 157, 30, 2, '02-08-2018'),
(243, 159, 31, 1, '02-08-2018'),
(244, 171, 28, 1, '02-08-2018'),
(245, 177, 26, 3, '02-08-2018'),
(246, 182, 25, 4, '02-08-2018'),
(247, 186, 29, 3, '02-08-2018'),
(248, 192, 32, 2, '02-08-2018'),
(249, 126, 23, 1, '02-08-2018'),
(250, 130, 27, 2, '02-08-2018'),
(251, 158, 30, 3, '02-08-2018'),
(252, 160, 31, 4, '02-08-2018'),
(253, 172, 28, 1, '02-08-2018'),
(254, 176, 26, 1, '02-08-2018'),
(255, 181, 25, 2, '02-08-2018'),
(256, 187, 29, 3, '02-08-2018'),
(257, 193, 32, 1, '02-08-2018'),
(258, 127, 23, 1, '02-08-2018'),
(259, 132, 27, 2, '02-08-2018'),
(260, 155, 30, 2, '02-08-2018'),
(261, 168, 31, 2, '02-08-2018'),
(262, 174, 28, 3, '02-08-2018'),
(263, 179, 26, 4, '02-08-2018'),
(264, 184, 25, 4, '02-08-2018'),
(265, 189, 29, 4, '02-08-2018'),
(266, 195, 32, 4, '02-08-2018'),
(267, 124, 23, 2, '02-08-2018'),
(268, 128, 27, 2, '02-08-2018'),
(269, 154, 30, 4, '02-08-2018'),
(270, 170, 31, 3, '02-08-2018'),
(271, 173, 28, 4, '02-08-2018'),
(272, 178, 26, 2, '02-08-2018'),
(273, 183, 25, 1, '02-08-2018'),
(274, 191, 29, 1, '02-08-2018'),
(275, 194, 32, 1, '02-08-2018'),
(276, 118, 23, 2, '02-08-2018'),
(277, 133, 27, 3, '02-08-2018'),
(278, 156, 30, 4, '02-08-2018'),
(279, 169, 31, 1, '02-08-2018'),
(280, 175, 28, 1, '02-08-2018'),
(281, 196, 32, 1, '02-08-2018'),
(282, 185, 25, 2, '02-08-2018'),
(283, 180, 26, 4, '02-08-2018'),
(284, 190, 29, 2, '02-08-2018'),
(285, 125, 23, 1, '01-08-2018'),
(286, 131, 27, 1, '01-08-2018'),
(287, 157, 30, 2, '01-08-2018'),
(288, 159, 31, 1, '01-08-2018'),
(289, 171, 28, 1, '01-08-2018'),
(290, 177, 26, 3, '01-08-2018'),
(291, 182, 25, 4, '01-08-2018'),
(292, 186, 29, 3, '01-08-2018'),
(293, 192, 32, 2, '01-08-2018'),
(294, 126, 23, 1, '01-08-2018'),
(295, 130, 27, 2, '01-08-2018'),
(296, 158, 30, 3, '01-08-2018'),
(297, 160, 31, 4, '01-08-2018'),
(298, 172, 28, 1, '01-08-2018'),
(299, 176, 26, 1, '01-08-2018'),
(300, 181, 25, 2, '01-08-2018'),
(301, 187, 29, 3, '01-08-2018'),
(302, 193, 32, 1, '01-08-2018'),
(303, 127, 23, 1, '01-08-2018'),
(304, 132, 27, 2, '01-08-2018'),
(305, 155, 30, 2, '01-08-2018'),
(306, 168, 31, 2, '01-08-2018'),
(307, 174, 28, 3, '01-08-2018'),
(308, 179, 26, 4, '01-08-2018'),
(309, 184, 25, 4, '01-08-2018'),
(310, 189, 29, 4, '01-08-2018'),
(311, 195, 32, 4, '01-08-2018'),
(312, 124, 23, 2, '01-08-2018'),
(313, 128, 27, 2, '01-08-2018'),
(314, 154, 30, 4, '01-08-2018'),
(315, 170, 31, 3, '01-08-2018'),
(316, 173, 28, 4, '01-08-2018'),
(317, 178, 26, 2, '01-08-2018'),
(318, 183, 25, 1, '01-08-2018'),
(319, 191, 29, 1, '01-08-2018'),
(320, 194, 32, 1, '01-08-2018'),
(321, 118, 23, 2, '01-08-2018'),
(322, 133, 27, 3, '01-08-2018'),
(323, 156, 30, 4, '01-08-2018'),
(324, 169, 31, 1, '01-08-2018'),
(325, 175, 28, 1, '01-08-2018'),
(326, 196, 32, 1, '01-08-2018'),
(327, 185, 25, 2, '01-08-2018'),
(328, 180, 26, 4, '01-08-2018'),
(329, 190, 29, 2, '01-08-2018'),
(330, 209, 33, 1, '10-08-2018'),
(331, 127, 23, 1, '10-08-2018');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE IF NOT EXISTS `aulas` (
  `idaula` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idaula`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`idaula`, `descripcion`, `estado`) VALUES
(9, '10', 1),
(10, '11', 1),
(11, '12', 1),
(12, '13', 1),
(13, '20', 1),
(14, '21', 1),
(15, '22', 1),
(16, '23', 1),
(17, 'Laboratorio 1', 1),
(18, 'Laboratorio 2', 1),
(19, 'Laboratorio 3', 1),
(20, 'Laboratorio 4', 1),
(21, 'Laboratorio 5', 1),
(22, '19', 1),
(23, 'Laboratorio    ', 0),
(24, 'laboratorio 11', 0),
(25, 'laboratorio 11', 0),
(26, '15', 0),
(27, '15', 1),
(28, '1234', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
  `idestados` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idestados`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idestados`, `descripcion`, `estado`) VALUES
(1, 'Presente', 1),
(2, 'Ausente', 1),
(3, 'Justificado', 1),
(4, 'Media Falta', 1),
(5, 'Vacio', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenesu`
--

CREATE TABLE IF NOT EXISTS `imagenesu` (
  `idimagenesU` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idimagenesU`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='imagen de perfil de usuarios' AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `imagenesu`
--

INSERT INTO `imagenesu` (`idimagenesU`, `imagen`) VALUES
(1, 'default.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE IF NOT EXISTS `materias` (
  `idmateria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcionCorta` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  `cuatrimestre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `anio` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idmateria`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=31 ;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`idmateria`, `descripcion`, `descripcionCorta`, `estado`, `cuatrimestre`, `anio`) VALUES
(15, 'Matematicas', 'Matematicas', 1, '1', '1'),
(16, 'Ingles', 'Ingles', 1, '1', '1'),
(17, 'SPD', 'SPD', 0, '', ''),
(18, 'Sistema de Procesamiento de Datos', 'SPD', 1, '1', '1'),
(19, 'Programacion I', 'Programacion I', 1, '1', '1'),
(20, 'Laboratorio I', 'Laboratorio I', 1, '1', '1'),
(21, 'Programacion II', 'Programacion II', 1, '2', '1'),
(22, 'Laboratorio II', 'Laboratorio II', 1, '2', '1'),
(23, 'Arquitectura y Sistemas Operativos', 'Sistemas Operativos', 1, '2', '1'),
(24, 'Estadistica', 'Estadistica', 1, '2', '1'),
(25, 'Ingles II', 'Ingles II', 1, '2', '1'),
(30, 'Metodologia', 'Metodo', 1, '2', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias-aulas`
--

CREATE TABLE IF NOT EXISTS `materias-aulas` (
  `idMateriasAulas` int(11) NOT NULL AUTO_INCREMENT,
  `idmateria` int(11) NOT NULL,
  `idaula` int(11) NOT NULL,
  `idturno` int(11) NOT NULL,
  PRIMARY KEY (`idMateriasAulas`,`idaula`,`idmateria`,`idturno`),
  KEY `fk_materiaTurno_idx` (`idmateria`),
  KEY `fk_turnoMateria_idx` (`idturno`),
  KEY `fk_aulaMateria_idx` (`idaula`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=142 ;

--
-- Volcado de datos para la tabla `materias-aulas`
--

INSERT INTO `materias-aulas` (`idMateriasAulas`, `idmateria`, `idaula`, `idturno`) VALUES
(81, 17, 10, 1),
(82, 17, 11, 2),
(83, 17, 12, 3),
(95, 22, 18, 1),
(96, 22, 17, 3),
(97, 23, 15, 1),
(98, 23, 16, 3),
(99, 24, 11, 1),
(100, 24, 10, 3),
(101, 25, 9, 1),
(102, 25, 9, 3),
(105, 19, 12, 1),
(106, 19, 9, 3),
(107, 18, 10, 1),
(108, 18, 12, 3),
(109, 21, 9, 1),
(110, 21, 27, 3),
(122, 30, 10, 1),
(123, 30, 11, 3),
(134, 20, 17, 1),
(135, 20, 17, 3),
(137, 16, 22, 1),
(138, 16, 11, 3),
(140, 15, 16, 1),
(141, 15, 27, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias-turnos`
--

CREATE TABLE IF NOT EXISTS `materias-turnos` (
  `idMateriasTurnos` int(11) NOT NULL AUTO_INCREMENT,
  `idmateria` int(11) NOT NULL,
  `idturno` int(11) NOT NULL,
  PRIMARY KEY (`idMateriasTurnos`,`idmateria`,`idturno`),
  KEY `fk_materiaTurno_idx` (`idmateria`),
  KEY `fk_TurnoMateria_idx` (`idturno`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=191 ;

--
-- Volcado de datos para la tabla `materias-turnos`
--

INSERT INTO `materias-turnos` (`idMateriasTurnos`, `idmateria`, `idturno`) VALUES
(125, 17, 1),
(126, 17, 2),
(127, 17, 3),
(140, 22, 1),
(141, 22, 3),
(142, 23, 1),
(143, 23, 3),
(144, 24, 1),
(145, 24, 3),
(146, 25, 1),
(147, 25, 3),
(150, 19, 1),
(151, 19, 3),
(152, 18, 1),
(153, 18, 3),
(154, 21, 1),
(155, 21, 3),
(167, 30, 1),
(168, 30, 3),
(181, 20, 1),
(182, 20, 3),
(185, 16, 3),
(186, 16, 1),
(189, 15, 3),
(190, 15, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias-usuarios`
--

CREATE TABLE IF NOT EXISTS `materias-usuarios` (
  `idMateriasUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  `idMateriasTurnos` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `asignado` tinyint(4) DEFAULT NULL,
  `anio` int(11) NOT NULL,
  `cuatrimestre` int(11) NOT NULL,
  PRIMARY KEY (`idMateriasUsuarios`,`idMateriasTurnos`,`idUsuario`),
  KEY `fk_idusuario_idx` (`idUsuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=211 ;

--
-- Volcado de datos para la tabla `materias-usuarios`
--

INSERT INTO `materias-usuarios` (`idMateriasUsuarios`, `idMateriasTurnos`, `idUsuario`, `asignado`, `anio`, `cuatrimestre`) VALUES
(18, 136, 30, 1, 1, 1),
(21, 137, 31, 1, 1, 1),
(28, 137, 28, 1, 1, 1),
(31, 137, 26, 1, 1, 1),
(36, 137, 25, 1, 1, 1),
(37, 155, 29, 1, 1, 2),
(38, 141, 29, 1, 1, 2),
(39, 145, 29, 1, 1, 2),
(40, 147, 29, 1, 1, 2),
(41, 155, 32, 1, 1, 2),
(42, 141, 32, 1, 1, 2),
(43, 143, 32, 1, 1, 2),
(44, 145, 32, 1, 1, 2),
(45, 147, 32, 1, 1, 2),
(118, 152, 23, 1, 1, 1),
(119, 137, 23, 1, 1, 1),
(124, 148, 23, 1, 1, 1),
(125, 151, 23, 1, 1, 1),
(126, 182, 23, 1, 1, 1),
(127, 120, 23, 1, 1, 1),
(128, 148, 27, 1, 1, 1),
(130, 182, 27, 1, 1, 1),
(131, 151, 27, 1, 1, 1),
(132, 120, 27, 1, 1, 1),
(133, 152, 27, 1, 1, 1),
(134, 148, 17, 1, 1, 1),
(135, 151, 17, 1, 1, 1),
(136, 182, 17, 1, 1, 1),
(154, 148, 30, 1, 1, 1),
(155, 120, 30, 1, 1, 1),
(156, 152, 30, 1, 1, 1),
(157, 151, 30, 1, 1, 1),
(158, 182, 30, 1, 1, 1),
(159, 151, 31, 1, 1, 1),
(160, 182, 31, 1, 1, 1),
(168, 120, 31, 1, 1, 1),
(169, 152, 31, 1, 1, 1),
(170, 148, 31, 1, 1, 1),
(171, 151, 28, 1, 1, 1),
(172, 182, 28, 1, 1, 1),
(173, 148, 28, 1, 1, 1),
(174, 120, 28, 1, 1, 1),
(175, 152, 28, 1, 1, 1),
(176, 182, 26, 1, 1, 1),
(177, 151, 26, 1, 1, 1),
(178, 148, 26, 1, 1, 1),
(179, 120, 26, 1, 1, 1),
(180, 152, 26, 1, 1, 1),
(181, 182, 25, 1, 1, 1),
(182, 151, 25, 1, 1, 1),
(183, 148, 25, 1, 1, 1),
(184, 120, 25, 1, 1, 1),
(185, 152, 25, 1, 1, 1),
(186, 151, 29, 1, 1, 1),
(187, 182, 29, 1, 1, 1),
(189, 120, 29, 1, 1, 1),
(190, 152, 29, 1, 1, 1),
(191, 148, 29, 1, 1, 1),
(192, 151, 32, 1, 1, 1),
(193, 182, 32, 1, 1, 1),
(194, 148, 32, 1, 1, 1),
(195, 120, 32, 1, 1, 1),
(196, 152, 32, 1, 1, 1),
(204, 150, 24, 1, 1, 1),
(205, 181, 24, 1, 1, 1),
(208, 151, 24, 1, 1, 1),
(207, 182, 24, 1, 1, 1),
(209, 148, 33, 1, 1, 1),
(210, 121, 33, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE IF NOT EXISTS `tipos` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idtipo`),
  UNIQUE KEY `idtipos_UNIQUE` (`idtipo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Base de tipos de usuarios' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`idtipo`, `descripcion`, `estado`) VALUES
(1, 'Administrador', 1),
(2, 'Profesor', 1),
(3, 'Alumno', 1),
(4, 'Administrativo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE IF NOT EXISTS `turnos` (
  `idturno` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idturno`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`idturno`, `descripcion`, `estado`) VALUES
(1, 'Mañana', 1),
(2, 'Tarde', 1),
(3, 'Noche', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idtipo` int(11) NOT NULL,
  `idimagen` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `mail` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `mail_UNIQUE` (`mail`),
  KEY `fk_usuario_tipo_idx` (`idtipo`),
  KEY `fk_usuarios_imagen_idx` (`idimagen`(255))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='	' AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `idtipo`, `idimagen`, `nombre`, `apellido`, `mail`, `estado`) VALUES
(17, 1, '1', 'Pablo Martin', 'De Cecco Rios', 'pablomdececcorios@gmail.com', 1),
(22, 4, '1', 'Administrativo', 'Uno', 'pablo.dececco@hotmail.com', 1),
(23, 3, '1', 'Luciana', 'Arrua', 'luciana.a.arrua@gmail.com', 1),
(24, 2, '1', 'Octavio ', 'Villegas', 'ovillegas@gmail.com', 1),
(25, 3, '1', 'Jorge', 'Rios', 'jrios@gmail.com', 1),
(26, 3, '1', 'Nicolas', 'Ortega', 'nortega@mail.com', 1),
(27, 3, '1', 'Jesica', 'Barrientos', 'jbarrientos@mail.com', 1),
(28, 3, '1', 'Carlos', 'Lopez', 'clopez@mail.com', 1),
(29, 3, '1', 'Silvina', 'Rosa', 'srosa@mail.com', 1),
(30, 3, '1', 'Laura', 'Espinosa', 'lespinosa@mail.com', 1),
(31, 3, '1', 'Rosaura', 'ladie', 'rladie@mail.com', 1),
(32, 3, '1', 'Emilia', 'Saras', 'esarasa@mail.com', 1),
(33, 3, 'file:///storage/emulated/0/Android/data/io.ionic.starter/cache/1533878152576.jpg', 'Lalos', 'Landas', 'Llanda@mail.com', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
