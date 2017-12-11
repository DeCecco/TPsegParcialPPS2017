-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2017 a las 19:08:37
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejemploabm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `idAlumno` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `dni` int(11) NOT NULL,
  `legajo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`idAlumno`, `idUsuario`, `nombre`, `apellido`, `dni`, `legajo`) VALUES
(1, 4, 'Elias', 'Rodriguez', 33276333, 195205),
(2, 5, 'Lucas', 'Rodriguez', 33278445, 195808),
(3, 6, 'Julian', 'Reinoso', 35568954, 456788),
(4, 7, 'Pablo', 'De Cecco', 45180846, 789789),
(5, 11, 'Marcos', 'Galarza', 45465789, 195848),
(6, 12, 'Juan', 'Chotra', 12346455, 123878),
(7, 13, 'Mariana', 'Pinchuk', 46458459, 123456),
(8, 14, 'Sofia', 'Reinoso', 48455654, 568751),
(9, 15, 'Nestor', 'Laresca', 784564555, 157888),
(10, 16, 'Luis', 'Maygua', 84694555, 337855),
(11, 17, 'Daniela', 'Cardone', 89946666, 248787),
(12, 18, 'Julieta', 'Venegas', 48888555, 777777),
(13, 19, 'Tomas', 'Sapia', 21045201, 888888),
(14, 20, 'Jesus', 'Neirus', 30555436, 999999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_materias`
--

CREATE TABLE `alumnos_materias` (
  `idAlumno` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=FIXED;

--
-- Volcado de datos para la tabla `alumnos_materias`
--

INSERT INTO `alumnos_materias` (`idAlumno`, `idMateria`) VALUES
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 9),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 16),
(1, 17),
(2, 5),
(2, 6),
(2, 7),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(3, 5),
(3, 7),
(3, 8),
(3, 11),
(3, 13),
(3, 15),
(4, 3),
(4, 4),
(4, 8),
(4, 12),
(5, 3),
(5, 4),
(5, 5),
(6, 3),
(6, 4),
(6, 5),
(7, 6),
(7, 7),
(7, 8),
(8, 6),
(8, 7),
(8, 8),
(9, 9),
(9, 10),
(9, 11),
(10, 9),
(10, 10),
(10, 11),
(11, 12),
(11, 13),
(11, 14),
(12, 12),
(12, 13),
(12, 14),
(13, 15),
(13, 16),
(13, 17),
(14, 15),
(14, 16),
(14, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `fecha` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `idMateria` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `asistencia` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asistencias`
--

INSERT INTO `asistencias` (`fecha`, `idMateria`, `idAlumno`, `asistencia`) VALUES
('2017-05-29', 3, 1, 1),
('2017-05-29', 3, 2, 1),
('2017-05-29', 3, 3, 1),
('2017-05-29', 4, 4, 1),
('2017-05-30', 4, 1, 2),
('2017-05-30', 4, 2, 2),
('2017-05-30', 4, 3, 2),
('2017-05-30', 5, 4, 2),
('2017-05-30', 5, 1, 3),
('2017-05-31', 5, 1, 3),
('2017-05-31', 6, 2, 4),
('2017-05-31', 7, 3, 4),
('2017-05-31', 7, 4, 1),
('2017-05-31', 7, 1, 2),
('2017-05-31', 7, 2, 3),
('2017-06-03', 14, 11, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `idAula` int(11) NOT NULL,
  `numero` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`idAula`, `numero`) VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105),
(6, 106),
(7, 107);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE `dias` (
  `idDia` int(11) NOT NULL,
  `Nombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `dias`
--

INSERT INTO `dias` (`idDia`, `Nombre`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miercoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'Sabado'),
(7, 'Domingo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `idMateria` int(11) NOT NULL,
  `idDia` int(11) NOT NULL,
  `idAula` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cuatrimestre` int(11) NOT NULL,
  `division` varchar(1) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`idMateria`, `idDia`, `idAula`, `nombre`, `cuatrimestre`, `division`) VALUES
(3, 1, 102, 'Matemática', 1, 'A'),
(4, 1, 101, 'Gimnasia', 1, 'B'),
(5, 2, 102, 'Lengua', 1, 'C'),
(6, 2, 103, 'Sociales', 2, 'A'),
(7, 3, 101, 'Naturales', 2, 'B'),
(8, 3, 102, 'Programacion', 2, 'C'),
(9, 4, 107, 'Laboratorio', 3, 'A'),
(10, 4, 106, 'Civica', 3, 'B'),
(11, 5, 101, 'Legislacion', 4, 'A'),
(12, 5, 104, 'Base de datos', 4, 'B'),
(13, 5, 102, 'Informatica', 5, 'A'),
(14, 6, 101, 'Laboratorio 2', 5, 'B'),
(15, 6, 103, 'Programacion 2', 6, 'A'),
(16, 6, 105, 'Matematica 2', 6, 'B'),
(17, 6, 102, 'Lengua 2', 1, 'D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `idProfesor` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`idProfesor`, `idUsuario`, `nombre`, `apellido`) VALUES
(3, 8, 'Octavio', 'Villegas'),
(4, 9, 'Maxi', 'Neiner'),
(5, 10, 'German', 'Scarafilo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores_materias`
--

CREATE TABLE `profesores_materias` (
  `idProfesor` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `profesores_materias`
--

INSERT INTO `profesores_materias` (`idProfesor`, `idMateria`) VALUES
(3, 3),
(3, 4),
(3, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(5, 10),
(5, 11),
(5, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `descripcion`) VALUES
(1, 'administrador'),
(2, 'administrativo'),
(3, 'alumno'),
(4, 'profesor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposasistencia`
--

CREATE TABLE `tiposasistencia` (
  `idTipoAsistencia` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tiposasistencia`
--

INSERT INTO `tiposasistencia` (`idTipoAsistencia`, `descripcion`) VALUES
(1, 'presente'),
(2, 'ausente'),
(3, 'media falta'),
(4, 'ausente justificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `idRol` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `apellido`, `idRol`, `email`, `password`) VALUES
(1, 'Admin', 'Admin', 1, 'admin@utn.com', '123'),
(2, 'administrativo', 'administrativo', 2, 'administrativo1@utn.com', '123'),
(3, 'adminis', 'adminis', 2, 'administrativo2@utn.com', '123'),
(4, 'Elias', 'Rodriguez', 3, 'elias@utn.com', '123'),
(5, 'Lucas', 'Rodriguez', 3, 'lucas@utn.com', '123'),
(6, 'Julian', 'Reinoso', 3, 'julian@utn.com', '123'),
(7, 'Pablo', 'De Cecco', 3, 'pablo@utn.com', '123'),
(8, 'Octavio', 'Villegas', 4, 'octavio@utn.com', '123'),
(9, 'Maxi', 'Neiner', 4, 'neiner@utn.com', '123'),
(10, 'German', 'Scarafilo', 4, 'german@utn.com', '123'),
(11, 'Marcos', 'Galarza', 3, 'marcos@utn.com', '123'),
(12, 'Juan', 'Chotra', 3, 'juan@utn.com', '123'),
(13, 'Mariana', 'Pinchuk', 3, 'mariana@utn.com', '123'),
(14, 'Sofia', 'Reinoso', 3, 'sofia@utn.com', '123'),
(15, 'Nestor', 'Laresca', 3, 'nestor@utn.com', '123'),
(16, 'Luis', 'Maygua', 3, 'luis@utn.com', '123'),
(17, 'Daniela', 'Cardone', 3, 'daniela@utn.com', '123'),
(18, 'Julieta', 'Venegas', 3, 'julieta@utn.com', '123'),
(19, 'Tomas', 'Sapia', 3, 'tomas@utn.com', '123'),
(20, 'Jesus', 'Neirus', 3, 'jesus@utn.com', '123'),
(31, 'nombre', 'apellido', 1, 'email', 'password');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`idAlumno`),
  ADD UNIQUE KEY `idUser` (`idUsuario`,`dni`);

--
-- Indices de la tabla `alumnos_materias`
--
ALTER TABLE `alumnos_materias`
  ADD PRIMARY KEY (`idAlumno`,`idMateria`);

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`fecha`,`idMateria`,`idAlumno`);

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`idAula`);

--
-- Indices de la tabla `dias`
--
ALTER TABLE `dias`
  ADD PRIMARY KEY (`idDia`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`idMateria`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`idProfesor`);

--
-- Indices de la tabla `profesores_materias`
--
ALTER TABLE `profesores_materias`
  ADD PRIMARY KEY (`idProfesor`,`idMateria`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `tiposasistencia`
--
ALTER TABLE `tiposasistencia`
  ADD PRIMARY KEY (`idTipoAsistencia`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `idAlumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `idAula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `dias`
--
ALTER TABLE `dias`
  MODIFY `idDia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `idMateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `idProfesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tiposasistencia`
--
ALTER TABLE `tiposasistencia`
  MODIFY `idTipoAsistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
