-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: asistencia
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistencia` (
  `idasistencia` int(11) NOT NULL AUTO_INCREMENT,
  `idMateriasUsuarios` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idestado` int(11) NOT NULL,
  `fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idasistencia`),
  KEY `fk_usuario_idx` (`idusuario`),
  KEY `fk_materiausuarios_idx` (`idMateriasUsuarios`),
  KEY `fk_estadoAsistencia_idx` (`idestado`),
  CONSTRAINT `fk_estadoAsistencia` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materiausuarios` FOREIGN KEY (`idMateriasUsuarios`) REFERENCES `materias-usuarios` (`idMateriasUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` VALUES (2,14,30,2,'06-08-2018'),(3,19,31,1,'06-08-2018'),(4,29,26,1,'06-08-2018'),(5,32,25,4,'06-08-2018'),(7,4,27,1,'06-08-2018'),(8,15,30,1,'06-08-2018'),(9,27,28,1,'06-08-2018'),(10,33,25,1,'06-08-2018'),(11,16,30,4,'06-08-2018'),(12,34,25,1,'06-08-2018');
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aulas` (
  `idaula` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idaula`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
INSERT INTO `aulas` VALUES (9,'10',1),(10,'11',1),(11,'12',1),(12,'13',1),(13,'20',1),(14,'21',1),(15,'22',1),(16,'23',1),(17,'Laboratorio 1',1),(18,'Laboratorio 2',1),(19,'Laboratorio 3',1),(20,'Laboratorio 4',1),(21,'Laboratorio 5',1),(22,'19',1),(23,'Laboratorio    ',0),(24,'laboratorio 11',0),(25,'laboratorio 11',0),(26,'15',0),(27,'15',1),(28,'1234',0);
/*!40000 ALTER TABLE `aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `idestados` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idestados`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Presente',1),(2,'Ausente',1),(3,'Justificado',1),(4,'Media Falta',1),(5,'Vacio',1);
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenesu`
--

DROP TABLE IF EXISTS `imagenesu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenesu` (
  `idimagenesU` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idimagenesU`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='imagen de perfil de usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenesu`
--

LOCK TABLES `imagenesu` WRITE;
/*!40000 ALTER TABLE `imagenesu` DISABLE KEYS */;
INSERT INTO `imagenesu` VALUES (1,'default.jpg');
/*!40000 ALTER TABLE `imagenesu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias` (
  `idmateria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcionCorta` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  `cuatrimestre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `anio` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idmateria`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (15,'Matematicas','Matematicas',1,'1','1'),(16,'Ingles','Ingles',1,'1','1'),(17,'SPD','SPD',0,'',''),(18,'Sistema de Procesamiento de Datos','SPD',1,'1','1'),(19,'Programacion I','Programacion I',1,'1','1'),(20,'Laboratorio I','Laboratorio I',1,'1','1'),(21,'Programacion II','Programacion II',1,'2','1'),(22,'Laboratorio II','Laboratorio II',1,'2','1'),(23,'Arquitectura y Sistemas Operativos','Sistemas Operativos',1,'2','1'),(24,'Estadistica','Estadistica',1,'2','1'),(25,'Ingles II','Ingles II',1,'2','1'),(30,'Metodologia','Metodo',1,'2','1');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias-aulas`
--

DROP TABLE IF EXISTS `materias-aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias-aulas` (
  `idMateriasAulas` int(11) NOT NULL AUTO_INCREMENT,
  `idmateria` int(11) NOT NULL,
  `idaula` int(11) NOT NULL,
  `idturno` int(11) NOT NULL,
  PRIMARY KEY (`idMateriasAulas`,`idaula`,`idmateria`,`idturno`),
  KEY `fk_materiaTurno_idx` (`idmateria`),
  KEY `fk_turnoMateria_idx` (`idturno`),
  KEY `fk_aulaMateria_idx` (`idaula`),
  CONSTRAINT `fk_aula` FOREIGN KEY (`idaula`) REFERENCES `aulas` (`idaula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materia` FOREIGN KEY (`idmateria`) REFERENCES `materias` (`idmateria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_turno` FOREIGN KEY (`idturno`) REFERENCES `turnos` (`idturno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias-aulas`
--

LOCK TABLES `materias-aulas` WRITE;
/*!40000 ALTER TABLE `materias-aulas` DISABLE KEYS */;
INSERT INTO `materias-aulas` VALUES (77,16,22,1),(78,16,11,3),(81,17,10,1),(82,17,11,2),(83,17,12,3),(91,20,17,1),(92,20,17,3),(95,22,18,1),(96,22,17,3),(97,23,15,1),(98,23,16,3),(99,24,11,1),(100,24,10,3),(101,25,9,1),(102,25,9,3),(103,15,27,1),(104,15,12,3),(105,19,12,1),(106,19,9,3),(107,18,10,1),(108,18,12,3),(109,21,9,1),(110,21,27,3),(122,30,10,1),(123,30,11,3);
/*!40000 ALTER TABLE `materias-aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias-turnos`
--

DROP TABLE IF EXISTS `materias-turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias-turnos` (
  `idMateriasTurnos` int(11) NOT NULL AUTO_INCREMENT,
  `idmateria` int(11) NOT NULL,
  `idturno` int(11) NOT NULL,
  PRIMARY KEY (`idMateriasTurnos`,`idmateria`,`idturno`),
  KEY `fk_materiaTurno_idx` (`idmateria`),
  KEY `fk_TurnoMateria_idx` (`idturno`),
  CONSTRAINT `fk_TurnoMateria` FOREIGN KEY (`idturno`) REFERENCES `turnos` (`idturno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materiaTurno` FOREIGN KEY (`idmateria`) REFERENCES `materias` (`idmateria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias-turnos`
--

LOCK TABLES `materias-turnos` WRITE;
/*!40000 ALTER TABLE `materias-turnos` DISABLE KEYS */;
INSERT INTO `materias-turnos` VALUES (120,16,1),(121,16,3),(125,17,1),(126,17,2),(127,17,3),(136,20,1),(137,20,3),(140,22,1),(141,22,3),(142,23,1),(143,23,3),(144,24,1),(145,24,3),(146,25,1),(147,25,3),(148,15,1),(149,15,3),(150,19,1),(151,19,3),(152,18,1),(153,18,3),(154,21,1),(155,21,3),(167,30,1),(168,30,3);
/*!40000 ALTER TABLE `materias-turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias-usuarios`
--

DROP TABLE IF EXISTS `materias-usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias-usuarios` (
  `idMateriasUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  `idMateriasTurnos` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `asignado` tinyint(4) DEFAULT NULL,
  `anio` int(11) NOT NULL,
  `cuatrimestre` int(11) NOT NULL,
  PRIMARY KEY (`idMateriasUsuarios`,`idMateriasTurnos`,`idUsuario`),
  KEY `fk_materiaTurno_idx` (`idMateriasTurnos`),
  KEY `fk_idusuario_idx` (`idUsuario`),
  CONSTRAINT `fk_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materiaTurnos` FOREIGN KEY (`idMateriasTurnos`) REFERENCES `materias-turnos` (`idMateriasTurnos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias-usuarios`
--

LOCK TABLES `materias-usuarios` WRITE;
/*!40000 ALTER TABLE `materias-usuarios` DISABLE KEYS */;
INSERT INTO `materias-usuarios` VALUES (4,148,27,1,1,1),(5,150,27,1,1,1),(6,136,27,1,1,1),(14,148,30,1,1,1),(15,120,30,1,1,1),(16,152,30,1,1,1),(17,150,30,1,1,1),(18,136,30,1,1,1),(19,149,31,1,1,1),(20,151,31,1,1,1),(21,137,31,1,1,1),(22,151,23,1,1,1),(23,137,23,1,1,1),(27,121,28,1,1,1),(28,137,28,1,1,1),(29,149,26,1,1,1),(30,151,26,1,1,1),(31,137,26,1,1,1),(32,149,25,1,1,1),(33,121,25,1,1,1),(34,153,25,1,1,1),(35,151,25,1,1,1),(36,137,25,1,1,1),(37,155,29,1,1,2),(38,141,29,1,1,2),(39,145,29,1,1,2),(40,147,29,1,1,2),(41,155,32,1,1,2),(42,141,32,1,1,2),(43,143,32,1,1,2),(44,145,32,1,1,2),(45,147,32,1,1,2);
/*!40000 ALTER TABLE `materias-usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos`
--

DROP TABLE IF EXISTS `tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idtipo`),
  UNIQUE KEY `idtipos_UNIQUE` (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Base de tipos de usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos`
--

LOCK TABLES `tipos` WRITE;
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` VALUES (1,'Administrador',1),(2,'Profesor',1),(3,'Alumno',1),(4,'Administrativo',1);
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turnos` (
  `idturno` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idturno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` VALUES (1,'Mañana',1),(2,'Tarde',1),(3,'Noche',1);
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idtipo` int(11) NOT NULL,
  `idimagen` int(11) NOT NULL,
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `mail` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `mail_UNIQUE` (`mail`),
  KEY `fk_usuario_tipo_idx` (`idtipo`),
  KEY `fk_usuarios_imagen_idx` (`idimagen`),
  CONSTRAINT `fk_usuario_tipo` FOREIGN KEY (`idtipo`) REFERENCES `tipos` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_imagen` FOREIGN KEY (`idimagen`) REFERENCES `imagenesu` (`idimagenesU`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (17,1,1,'Pablo Martin','De Cecco Rios','pablomdececcorios@gmail.com',1),(22,4,1,'Administrativo','Uno','pablo.dececco@hotmail.com',1),(23,3,1,'Luciana','Arrua','luciana.a.arrua@gmail.com',1),(24,2,1,'Octavio ','Villegas','ovillegas@gmail.com',1),(25,3,1,'Jorge','Rios','jrios@gmail.com',1),(26,3,1,'Nicolas','Ortega','nortega@mail.com',1),(27,3,1,'Jesica','Barrientos','jbarrientos@mail.com',1),(28,3,1,'Carlos','Lopez','clopez@mail.com',1),(29,3,1,'Silvina','Rosa','srosa@mail.com',1),(30,3,1,'Laura','Espinosa','lespinosa@mail.com',1),(31,3,1,'Rosaura','ladie','rladie@mail.com',1),(32,3,1,'Emilia','Sarasa','esarasa@mail.com',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-06  1:21:15
