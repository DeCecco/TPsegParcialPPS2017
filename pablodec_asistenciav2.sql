-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-10-2018 a las 12:28:12
-- Versión del servidor: 5.5.61-cll
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pablodec_asistenciav2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `idasistencia` int(11) NOT NULL,
  `idMateriasUsuarios` int(11) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `idestado` int(11) DEFAULT NULL,
  `fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`idasistencia`, `idMateriasUsuarios`, `idusuario`, `idestado`, `fecha`) VALUES
(16, 131, 27, 1, '09-07-2018'),
(17, 157, 30, 2, '09-07-2018'),
(18, 159, 31, 1, '09-07-2018'),
(19, 171, 28, 1, '09-07-2018'),
(20, 177, 26, 3, '09-07-2018'),
(21, 182, 25, 4, '09-07-2018'),
(22, 186, 29, 3, '09-07-2018'),
(23, 192, 32, 2, '09-07-2018'),
(24, 126, 23, 1, '09-07-2018'),
(25, 130, 27, 2, '09-07-2018'),
(26, 158, 30, 3, '09-07-2018'),
(27, 160, 31, 4, '09-07-2018'),
(28, 172, 28, 1, '09-07-2018'),
(29, 176, 26, 1, '09-07-2018'),
(30, 181, 25, 2, '09-07-2018'),
(31, 187, 29, 3, '09-07-2018'),
(32, 193, 32, 1, '09-07-2018'),
(33, 127, 23, 1, '09-07-2018'),
(34, 132, 27, 2, '09-07-2018'),
(35, 155, 30, 2, '09-07-2018'),
(36, 168, 31, 2, '09-07-2018'),
(37, 174, 28, 3, '09-07-2018'),
(38, 179, 26, 4, '09-07-2018'),
(39, 184, 25, 4, '09-07-2018'),
(40, 189, 29, 4, '09-07-2018'),
(41, 195, 32, 4, '09-07-2018'),
(42, 124, 23, 1, '09-07-2018'),
(43, 128, 27, 2, '09-07-2018'),
(44, 154, 30, 4, '09-07-2018'),
(45, 170, 31, 3, '09-07-2018'),
(46, 173, 28, 4, '09-07-2018'),
(47, 178, 26, 2, '09-07-2018'),
(48, 183, 25, 1, '09-07-2018'),
(49, 191, 29, 1, '09-07-2018'),
(50, 194, 32, 1, '09-07-2018'),
(51, 118, 23, 2, '09-07-2018'),
(52, 133, 27, 3, '09-07-2018'),
(53, 156, 30, 4, '09-07-2018'),
(54, 169, 31, 1, '09-07-2018'),
(55, 175, 28, 1, '09-07-2018'),
(56, 196, 32, 1, '09-07-2018'),
(57, 185, 25, 2, '09-07-2018'),
(58, 180, 26, 4, '09-07-2018'),
(59, 190, 29, 2, '09-07-2018'),
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
(331, 125, 23, 1, '09-07-2018'),
(332, 173, 28, 1, '09-08-2018'),
(340, 127, 23, 1, '10-08-2018'),
(341, 192, 32, 1, '10-08-2018'),
(343, 193, 32, 2, '10-08-2018'),
(344, 212, 34, 1, '10-08-2018'),
(345, 124, 23, 1, '10-08-2018'),
(346, 214, 35, 1, '10-08-2018'),
(347, 216, 36, 1, '10-08-2018'),
(348, 221, 37, 1, '10-08-2018'),
(349, 132, 27, 1, '12-08-2018'),
(351, 195, 32, 2, '12-08-2018'),
(352, 189, 29, 4, '12-08-2018'),
(353, 124, 23, 1, '13-08-2018'),
(354, 209, 33, 2, '13-08-2018'),
(358, 42, 32, 1, '13-10-2018'),
(356, 38, 29, 2, '13-10-2018'),
(359, 230, 42, 4, '13-10-2018'),
(360, 127, 23, 1, '14-10-2018'),
(361, 132, 27, 2, '14-10-2018'),
(362, 155, 30, 3, '14-10-2018'),
(363, 184, 25, 4, '14-10-2018'),
(364, 189, 29, 1, '14-10-2018'),
(365, 168, 31, 1, '14-10-2018'),
(366, 174, 28, 1, '14-10-2018'),
(367, 179, 26, 1, '14-10-2018'),
(368, 195, 32, 1, '14-10-2018'),
(369, 241, 143, 1, '16-10-2018'),
(370, 124, 23, 1, '16-10-2018');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `idaula` int(11) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(28, '1234', 0),
(29, '16', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idestados` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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

CREATE TABLE `imagenesu` (
  `idimagenesU` int(11) NOT NULL,
  `imagen` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='imagen de perfil de usuarios';

--
-- Volcado de datos para la tabla `imagenesu`
--

INSERT INTO `imagenesu` (`idimagenesU`, `imagen`) VALUES
(1, 'default.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `idmateria` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcionCorta` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  `cuatrimestre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `anio` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`idmateria`, `descripcion`, `descripcionCorta`, `estado`, `cuatrimestre`, `anio`) VALUES
(15, 'Matematicas', 'Matematicas', 1, '1', '1'),
(16, 'Ingles', 'Ingles', 1, '1', '1'),
(18, 'Sistema de Procesamiento de Datos', 'SPD', 1, '1', '1'),
(19, 'Programacion I', 'Programacion I', 1, '1', '1'),
(20, 'Laboratorio I', 'Laboratorio I', 1, '1', '1'),
(21, 'Programacion II', 'Programacion II', 1, '2', '1'),
(22, 'Laboratorio II', 'Laboratorio II', 1, '2', '1'),
(23, 'Arquitectura y Sistemas Operativos', 'Sistemas Operativos', 1, '2', '1'),
(24, 'Estadistica', 'Estadistica', 1, '2', '1'),
(25, 'Ingles II', 'Ingles II', 1, '2', '1'),
(30, 'Metodologia de estudio', 'Metodologia de estudio', 1, '2', '1'),
(31, 'Programacion III', 'Programacion III', 1, '1', '2'),
(32, 'A', 'A', 0, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias-aulas`
--

CREATE TABLE `materias-aulas` (
  `idMateriasAulas` int(11) NOT NULL,
  `idmateria` int(11) NOT NULL,
  `idaula` int(11) NOT NULL,
  `idturno` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(103, 15, 27, 1),
(104, 15, 12, 3),
(105, 19, 12, 1),
(106, 19, 9, 3),
(107, 18, 10, 1),
(108, 18, 12, 3),
(109, 21, 9, 1),
(110, 21, 27, 3),
(134, 20, 17, 1),
(135, 20, 17, 3),
(140, 31, 29, 1),
(141, 31, 29, 3),
(144, 30, 10, 1),
(145, 30, 11, 3),
(151, 16, 22, 1),
(152, 16, 11, 3),
(154, 32, 10, 2),
(155, 32, 29, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias-turnos`
--

CREATE TABLE `materias-turnos` (
  `idMateriasTurnos` int(11) NOT NULL,
  `idmateria` int(11) NOT NULL,
  `idturno` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(148, 15, 1),
(149, 15, 3),
(150, 19, 1),
(151, 19, 3),
(152, 18, 1),
(153, 18, 3),
(154, 21, 1),
(155, 21, 3),
(181, 20, 1),
(182, 20, 3),
(189, 31, 1),
(190, 31, 3),
(195, 30, 1),
(196, 30, 3),
(205, 16, 3),
(206, 16, 1),
(208, 32, 2),
(209, 32, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias-usuarios`
--

CREATE TABLE `materias-usuarios` (
  `idMateriasUsuarios` int(11) NOT NULL,
  `idMateriasTurnos` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `asignado` tinyint(4) DEFAULT NULL,
  `anio` int(11) NOT NULL,
  `cuatrimestre` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(222, 151, 30, 1, 1, 1),
(223, 182, 30, 1, 1, 1),
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
(239, 148, 32, 1, 1, 1),
(195, 120, 32, 1, 1, 1),
(240, 152, 32, 1, 1, 1),
(209, 148, 33, 1, 1, 1),
(210, 121, 33, 1, 1, 1),
(212, 189, 34, 1, 2, 1),
(213, 121, 35, 1, 1, 1),
(214, 149, 35, 1, 1, 1),
(215, 153, 35, 1, 1, 1),
(216, 182, 36, 1, 1, 1),
(217, 151, 24, 1, 1, 1),
(218, 182, 24, 1, 1, 1),
(219, 150, 24, 1, 1, 1),
(220, 181, 24, 1, 1, 1),
(221, 189, 37, 1, 2, 1),
(230, 141, 42, 1, 1, 2),
(233, 140, 23, 1, 1, 2),
(232, 155, 42, 1, 1, 2),
(231, 145, 42, 1, 1, 2),
(234, 144, 23, 1, 1, 2),
(235, 146, 23, 1, 1, 2),
(236, 144, 25, 1, 1, 2),
(237, 195, 25, 1, 1, 2),
(238, 206, 32, 1, 1, 1),
(241, 141, 143, 1, 1, 2),
(242, 155, 143, 1, 1, 2),
(246, 142, 143, 1, 1, 2),
(247, 144, 143, 1, 1, 2),
(248, 146, 143, 1, 1, 2),
(249, 195, 143, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Base de tipos de usuarios';

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

CREATE TABLE `turnos` (
  `idturno` int(11) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  `idimagen` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `mail` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='	';

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
(32, 3, '1', 'Emilia', 'Sarasa', 'esarasa@mail.com', 1),
(33, 3, '1', 'Lalos', 'Landas', 'Llanda@mail.com', 1),
(48, 3, '1', 'Arthur', 'Branch', 'Duis.ac@convallis.co.uk', 1),
(34, 3, '1', 'Julio', 'Ramirez', 'Julio@mail.com', 1),
(47, 3, '1', 'Shoshana', 'Lewis', 'sagittis.Duis.gravida@penatibus.org', 1),
(35, 3, '1', 'Juan', 'Clavel', 'Juan@mail.com', 1),
(46, 3, '1', 'Rhoda', 'Obrien', 'ante.blandit.viverra@blanditatnisi.edu', 1),
(36, 3, '1', 'Carla', 'Gonzalez', 'Carla@mail.com', 1),
(42, 3, '1', 'Pepe', 'Martin', 'Pmartin@mail.com', 1),
(43, 3, '1', 'Ayanna', 'Velasquez', 'Suspendisse.aliquet@nec.net', 1),
(44, 3, '1', 'Colleen', 'Austin', 'eu.enim.Etiam@anteiaculisnec.edu', 1),
(45, 3, '1', 'Jack', 'Hopkins', 'lectus.Nullam@Ut.com', 1),
(49, 3, '1', 'Sara', 'Gillespie', 'hendrerit.id@lectusNullamsuscipit.com', 1),
(50, 3, '1', 'Yen', 'Mcmillan', 'Phasellus@velit.co.uk', 1),
(51, 3, '1', 'Camden', 'Blevins', 'Integer@pharetrautpharetra.org', 1),
(52, 3, '1', 'Ferris', 'Ward', 'lacus.varius.et@eu.ca', 1),
(53, 3, '1', 'Sierra', 'Bryan', 'sollicitudin@Namnulla.co.uk', 1),
(54, 3, '1', 'Cheryl', 'Mooney', 'arcu.Vestibulum@aliquetodio.ca', 1),
(55, 3, '1', 'Shay', 'Williamson', 'luctus.felis@tinciduntduiaugue.edu', 1),
(56, 3, '1', 'Aurelia', 'Luna', 'Proin@a.net', 1),
(57, 3, '1', 'Cullen', 'Sosa', 'nec.malesuada.ut@facilisiseget.edu', 1),
(58, 3, '1', 'Rebekah', 'Chambers', 'lorem@vestibulumneceuismod.edu', 1),
(59, 3, '1', 'Mara', 'Hahn', 'cursus.Nunc@ultricesiaculisodio.net', 1),
(60, 3, '1', 'Chancellor', 'Booker', 'egestas.urna@eu.org', 1),
(61, 3, '1', 'Barbara', 'Livingston', 'eget.mollis.lectus@infaucibusorci.co.uk', 1),
(62, 3, '1', 'Brenna', 'Mercado', 'eu@Pellentesquetincidunt.co.uk', 1),
(63, 3, '1', 'Megan', 'Bond', 'semper@rutrum.ca', 1),
(64, 3, '1', 'Yuli', 'Barry', 'vulputate.mauris.sagittis@mifringillami.net', 1),
(65, 3, '1', 'Hayes', 'Thornton', 'eu.placerat.eget@arcu.org', 1),
(66, 3, '1', 'Aimee', 'Wallace', 'Aliquam@odioEtiam.net', 1),
(67, 3, '1', 'Carl', 'Branch', 'ut.nulla.Cras@felisDonec.net', 1),
(68, 3, '1', 'Orli', 'Kane', 'arcu.et@et.net', 1),
(69, 3, '1', 'Janna', 'Nielsen', 'sit@eusemPellentesque.org', 1),
(70, 3, '1', 'Connor', 'Lowery', 'risus.Nulla@ornarelectusjusto.ca', 1),
(71, 3, '1', 'Olympia', 'Barr', 'et@ut.com', 1),
(72, 3, '1', 'Fay', 'Booth', 'lorem@tinciduntnibh.org', 1),
(73, 3, '1', 'Ignatius', 'Buckner', 'enim.Mauris.quis@vulputate.com', 1),
(74, 3, '1', 'Zachery', 'Reed', 'eget.volutpat@rutrumloremac.ca', 1),
(75, 3, '1', 'Beck', 'Jenkins', 'non.dapibus.rutrum@gravida.net', 1),
(76, 3, '1', 'Donovan', 'Santiago', 'Phasellus.at@ornare.co.uk', 1),
(77, 3, '1', 'Nell', 'Greene', 'eget.odio.Aliquam@necdiamDuis.org', 1),
(78, 3, '1', 'Ross', 'Medina', 'lectus.ante.dictum@Etiam.org', 1),
(79, 3, '1', 'Bruce', 'Reilly', 'placerat.Cras@magnaet.org', 1),
(80, 3, '1', 'Ethan', 'Schwartz', 'ac.arcu.Nunc@quam.edu', 1),
(81, 3, '1', 'Marcia', 'Emerson', 'fringilla@urna.com', 1),
(82, 3, '1', 'Rylee', 'Owens', 'tincidunt@lacus.org', 1),
(83, 3, '1', 'Helen', 'Bright', 'lobortis@ullamcorpereueuismod.co.uk', 1),
(84, 3, '1', 'Allegra', 'Robertson', 'Integer@feugiatmetussit.ca', 1),
(85, 3, '1', 'Malcolm', 'Pacheco', 'consectetuer.cursus.et@ornare.net', 1),
(86, 3, '1', 'Eliana', 'Day', 'ultrices.Vivamus.rhoncus@Praesentluctus.net', 1),
(87, 3, '1', 'Teagan', 'Morin', 'suscipit.est@metus.net', 1),
(88, 3, '1', 'Kibo', 'Schmidt', 'Nulla.facilisi@sedfacilisisvitae.org', 1),
(89, 3, '1', 'Price', 'Jimenez', 'hendrerit.neque.In@metus.edu', 1),
(90, 3, '1', 'Rhiannon', 'Cotton', 'lacus@eratnequenon.net', 1),
(91, 3, '1', 'Abraham', 'Owen', 'nisl@etmagnisdis.com', 1),
(92, 3, '1', 'Maryam', 'Gray', 'eu@accumsanlaoreet.co.uk', 1),
(93, 3, '1', 'Ulysses', 'Mcbride', 'fermentum.metus@netusetmalesuada.ca', 1),
(94, 3, '1', 'Yetta', 'Gay', 'ipsum.Suspendisse.non@lobortis.org', 1),
(95, 3, '1', 'Evan', 'Gentry', 'quis.lectus.Nullam@tinciduntorci.net', 1),
(96, 3, '1', 'Odette', 'Bird', 'cursus@Nunc.com', 1),
(97, 3, '1', 'Aurelia', 'Levy', 'eget.metus.In@lobortis.ca', 1),
(98, 3, '1', 'Jordan', 'Daniels', 'ante@necmetus.net', 1),
(99, 3, '1', 'Sydnee', 'Hopper', 'Sed.et@cursusnonegestas.net', 1),
(100, 3, '1', 'Cara', 'Rios', 'Cras.eget.nisi@rhoncusNullam.com', 1),
(101, 3, '1', 'Joelle', 'Massey', 'vestibulum.Mauris@ipsumleoelementum.edu', 1),
(102, 3, '1', 'Hakeem', 'Skinner', 'In.faucibus.Morbi@tortor.net', 1),
(103, 3, '1', 'Michael', 'Randall', 'lorem@quama.ca', 1),
(104, 3, '1', 'Alexis', 'Merritt', 'Fusce.aliquam@idrisus.co.uk', 1),
(105, 3, '1', 'Hoyt', 'Burke', 'nonummy.ut.molestie@pedemalesuada.edu', 1),
(106, 3, '1', 'Keelie', 'Baxter', 'ipsum@malesuadaaugue.org', 1),
(107, 3, '1', 'Whilemina', 'Carson', 'eu@magnatellusfaucibus.ca', 1),
(108, 3, '1', 'Alexander', 'Crane', 'non.quam@Integer.co.uk', 1),
(109, 3, '1', 'Perry', 'Davis', 'sem@Etiam.com', 1),
(110, 3, '1', 'Ezra', 'Sears', 'sit.amet@augueSedmolestie.edu', 1),
(111, 3, '1', 'Joelle', 'Hayes', 'blandit@consequat.co.uk', 1),
(112, 3, '1', 'Paloma', 'Chaney', 'et.malesuada.fames@bibendumullamcorperDuis.co.uk', 1),
(113, 3, '1', 'Austin', 'Nash', 'Cras.interdum.Nunc@magnisdisparturient.ca', 1),
(114, 3, '1', 'David', 'Mullen', 'vitae.diam@inlobortis.org', 1),
(115, 3, '1', 'Leonard', 'Walters', 'quis.accumsan@rutrum.com', 1),
(116, 3, '1', 'Zia', 'Macdonald', 'velit.Quisque@metusvitaevelit.co.uk', 1),
(117, 3, '1', 'Nora', 'Pratt', 'venenatis.vel.faucibus@lacus.com', 1),
(118, 3, '1', 'Harriet', 'Sanchez', 'montes.nascetur@auguescelerisquemollis.co.uk', 1),
(119, 3, '1', 'Axel', 'Rosa', 'erat.volutpat.Nulla@telluslorem.org', 1),
(120, 3, '1', 'Irma', 'Larsen', 'est.congue.a@idrisus.com', 1),
(121, 3, '1', 'Iola', 'Smith', 'torquent.per.conubia@ipsumdolorsit.org', 1),
(122, 3, '1', 'Jameson', 'Ochoa', 'nascetur.ridiculus.mus@cursuspurusNullam.org', 1),
(123, 3, '1', 'Ashton', 'Cross', 'ac.libero.nec@etrutrum.com', 1),
(124, 3, '1', 'Anne', 'Rogers', 'Cras.eget@insodales.edu', 1),
(125, 3, '1', 'Trevor', 'Vazquez', 'ante.ipsum.primis@eros.com', 1),
(126, 3, '1', 'Otto', 'Sellers', 'fermentum.fermentum@Morbi.com', 1),
(127, 3, '1', 'Hashim', 'Howard', 'aliquet@risusquis.edu', 1),
(128, 3, '1', 'Lenore', 'Blackwell', 'cursus@egestasFusce.net', 1),
(129, 3, '1', 'Grant', 'Lowe', 'placerat@nec.edu', 1),
(130, 3, '1', 'Ross', 'Strickland', 'neque.In.ornare@porttitortellusnon.com', 1),
(131, 3, '1', 'Leonard', 'Aguirre', 'Aenean@adipiscing.edu', 1),
(132, 3, '1', 'Abdul', 'Holden', 'enim.Sed.nulla@Etiamimperdietdictum.org', 1),
(133, 3, '1', 'Travis', 'Walter', 'mauris@sit.co.uk', 1),
(134, 3, '1', 'Tamekah', 'Huff', 'Morbi@fringilla.com', 1),
(135, 3, '1', 'Alexis', 'Carlson', 'vehicula.Pellentesque@veliteu.com', 1),
(136, 3, '1', 'Keefe', 'Cunningham', 'egestas.hendrerit@Pellentesque.net', 1),
(137, 3, '1', 'Nicole', 'Hickman', 'posuere@arcuac.net', 1),
(138, 3, '1', 'Trevor', 'Woodard', 'sodales@turpisegestas.ca', 1),
(139, 3, '1', 'Autumn', 'Dorsey', 'vulputate.eu.odio@ipsum.net', 1),
(140, 3, '1', 'Clio', 'Odom', 'sed@lacinia.net', 1),
(141, 3, '1', 'Nadine', 'Cash', 'cursus@Crasdolordolor.edu', 1),
(142, 3, '1', 'Carol', 'Moses', 'dolor@arcuSedeu.ca', 1),
(143, 3, 'file:///storage/emulated/0/Android/data/io.ionic.starter/cache/1539656977059.jpg', 'Pedro', 'Lopez', 'Plopez@mail.com', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`idasistencia`),
  ADD KEY `fk_usuario_idx` (`idusuario`),
  ADD KEY `fk_estadoAsistencia_idx` (`idestado`);

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`idaula`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idestados`);

--
-- Indices de la tabla `imagenesu`
--
ALTER TABLE `imagenesu`
  ADD PRIMARY KEY (`idimagenesU`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`idmateria`);

--
-- Indices de la tabla `materias-aulas`
--
ALTER TABLE `materias-aulas`
  ADD PRIMARY KEY (`idMateriasAulas`,`idaula`,`idmateria`,`idturno`),
  ADD KEY `fk_materiaTurno_idx` (`idmateria`),
  ADD KEY `fk_turnoMateria_idx` (`idturno`),
  ADD KEY `fk_aulaMateria_idx` (`idaula`);

--
-- Indices de la tabla `materias-turnos`
--
ALTER TABLE `materias-turnos`
  ADD PRIMARY KEY (`idMateriasTurnos`,`idmateria`,`idturno`),
  ADD KEY `fk_materiaTurno_idx` (`idmateria`),
  ADD KEY `fk_TurnoMateria_idx` (`idturno`);

--
-- Indices de la tabla `materias-usuarios`
--
ALTER TABLE `materias-usuarios`
  ADD PRIMARY KEY (`idMateriasUsuarios`,`idMateriasTurnos`,`idUsuario`),
  ADD KEY `fk_idusuario_idx` (`idUsuario`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`idtipo`),
  ADD UNIQUE KEY `idtipos_UNIQUE` (`idtipo`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`idturno`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `mail_UNIQUE` (`mail`),
  ADD KEY `fk_usuario_tipo_idx` (`idtipo`),
  ADD KEY `fk_usuarios_imagen_idx` (`idimagen`(255));

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `idasistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=371;

--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `idaula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idestados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `imagenesu`
--
ALTER TABLE `imagenesu`
  MODIFY `idimagenesU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `idmateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `materias-aulas`
--
ALTER TABLE `materias-aulas`
  MODIFY `idMateriasAulas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT de la tabla `materias-turnos`
--
ALTER TABLE `materias-turnos`
  MODIFY `idMateriasTurnos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT de la tabla `materias-usuarios`
--
ALTER TABLE `materias-usuarios`
  MODIFY `idMateriasUsuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `idtipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `idturno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
