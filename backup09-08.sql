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
  `idMateriasUsuarios` int(11) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `idestado` int(11) DEFAULT NULL,
  `fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idasistencia`),
  KEY `fk_usuario_idx` (`idusuario`),
  KEY `fk_estadoAsistencia_idx` (`idestado`),
  CONSTRAINT `fk_estadoAsistencia` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` VALUES (15,125,23,1,'09-08-2018'),(16,131,27,1,'09-08-2018'),(17,157,30,2,'09-08-2018'),(18,159,31,1,'09-08-2018'),(19,171,28,1,'09-08-2018'),(20,177,26,3,'09-08-2018'),(21,182,25,4,'09-08-2018'),(22,186,29,3,'09-08-2018'),(23,192,32,2,'09-08-2018'),(24,126,23,1,'09-08-2018'),(25,130,27,2,'09-08-2018'),(26,158,30,3,'09-08-2018'),(27,160,31,4,'09-08-2018'),(28,172,28,1,'09-08-2018'),(29,176,26,1,'09-08-2018'),(30,181,25,2,'09-08-2018'),(31,187,29,3,'09-08-2018'),(32,193,32,1,'09-08-2018'),(33,127,23,1,'09-08-2018'),(34,132,27,2,'09-08-2018'),(35,155,30,2,'09-08-2018'),(36,168,31,2,'09-08-2018'),(37,174,28,3,'09-08-2018'),(38,179,26,4,'09-08-2018'),(39,184,25,4,'09-08-2018'),(40,189,29,4,'09-08-2018'),(41,195,32,4,'09-08-2018'),(42,124,23,1,'09-08-2018'),(43,128,27,2,'09-08-2018'),(44,154,30,4,'09-08-2018'),(45,170,31,3,'09-08-2018'),(46,173,28,4,'09-08-2018'),(47,178,26,2,'09-08-2018'),(48,183,25,1,'09-08-2018'),(49,191,29,1,'09-08-2018'),(50,194,32,1,'09-08-2018'),(51,118,23,2,'09-08-2018'),(52,133,27,3,'09-08-2018'),(53,156,30,4,'09-08-2018'),(54,169,31,1,'09-08-2018'),(55,175,28,1,'09-08-2018'),(56,196,32,1,'09-08-2018'),(57,185,25,2,'09-08-2018'),(58,180,26,4,'09-08-2018'),(59,190,29,2,'09-08-2018'),(60,125,23,1,'08-08-2018'),(61,131,27,1,'08-08-2018'),(62,157,30,2,'08-08-2018'),(63,159,31,1,'08-08-2018'),(64,171,28,1,'08-08-2018'),(65,177,26,3,'08-08-2018'),(66,182,25,4,'08-08-2018'),(67,186,29,3,'08-08-2018'),(68,192,32,2,'08-08-2018'),(69,126,23,1,'08-08-2018'),(70,130,27,2,'08-08-2018'),(71,158,30,3,'08-08-2018'),(72,160,31,4,'08-08-2018'),(73,172,28,1,'08-08-2018'),(74,176,26,1,'08-08-2018'),(75,181,25,2,'08-08-2018'),(76,187,29,3,'08-08-2018'),(77,193,32,1,'08-08-2018'),(78,127,23,1,'08-08-2018'),(79,132,27,2,'08-08-2018'),(80,155,30,2,'08-08-2018'),(81,168,31,2,'08-08-2018'),(82,174,28,3,'08-08-2018'),(83,179,26,4,'08-08-2018'),(84,184,25,4,'08-08-2018'),(85,189,29,4,'08-08-2018'),(86,195,32,4,'08-08-2018'),(87,124,23,2,'08-08-2018'),(88,128,27,2,'08-08-2018'),(89,154,30,4,'08-08-2018'),(90,170,31,3,'08-08-2018'),(91,173,28,4,'08-08-2018'),(92,178,26,2,'08-08-2018'),(93,183,25,1,'08-08-2018'),(94,191,29,1,'08-08-2018'),(95,194,32,1,'08-08-2018'),(96,118,23,2,'08-08-2018'),(97,133,27,3,'08-08-2018'),(98,156,30,4,'08-08-2018'),(99,169,31,1,'08-08-2018'),(100,175,28,1,'08-08-2018'),(101,196,32,1,'08-08-2018'),(102,185,25,2,'08-08-2018'),(103,180,26,4,'08-08-2018'),(104,190,29,2,'08-08-2018'),(105,125,23,1,'07-08-2018'),(106,131,27,1,'07-08-2018'),(107,157,30,2,'07-08-2018'),(108,159,31,1,'07-08-2018'),(109,171,28,1,'07-08-2018'),(110,177,26,3,'07-08-2018'),(111,182,25,4,'07-08-2018'),(112,186,29,3,'07-08-2018'),(113,192,32,2,'07-08-2018'),(114,126,23,1,'07-08-2018'),(115,130,27,2,'07-08-2018'),(116,158,30,3,'07-08-2018'),(117,160,31,4,'07-08-2018'),(118,172,28,1,'07-08-2018'),(119,176,26,1,'07-08-2018'),(120,181,25,2,'07-08-2018'),(121,187,29,3,'07-08-2018'),(122,193,32,1,'07-08-2018'),(123,127,23,1,'07-08-2018'),(124,132,27,2,'07-08-2018'),(125,155,30,2,'07-08-2018'),(126,168,31,2,'07-08-2018'),(127,174,28,3,'07-08-2018'),(128,179,26,4,'07-08-2018'),(129,184,25,4,'07-08-2018'),(130,189,29,4,'07-08-2018'),(131,195,32,4,'07-08-2018'),(132,124,23,2,'07-08-2018'),(133,128,27,2,'07-08-2018'),(134,154,30,4,'07-08-2018'),(135,170,31,3,'07-08-2018'),(136,173,28,4,'07-08-2018'),(137,178,26,2,'07-08-2018'),(138,183,25,1,'07-08-2018'),(139,191,29,1,'07-08-2018'),(140,194,32,1,'07-08-2018'),(141,118,23,2,'07-08-2018'),(142,133,27,3,'07-08-2018'),(143,156,30,4,'07-08-2018'),(144,169,31,1,'07-08-2018'),(145,175,28,1,'07-08-2018'),(146,196,32,1,'07-08-2018'),(147,185,25,2,'07-08-2018'),(148,180,26,4,'07-08-2018'),(149,190,29,2,'07-08-2018'),(150,125,23,1,'06-08-2018'),(151,131,27,1,'06-08-2018'),(152,157,30,2,'06-08-2018'),(153,159,31,1,'06-08-2018'),(154,171,28,1,'06-08-2018'),(155,177,26,3,'06-08-2018'),(156,182,25,4,'06-08-2018'),(157,186,29,3,'06-08-2018'),(158,192,32,2,'06-08-2018'),(159,126,23,1,'06-08-2018'),(160,130,27,2,'06-08-2018'),(161,158,30,3,'06-08-2018'),(162,160,31,4,'06-08-2018'),(163,172,28,1,'06-08-2018'),(164,176,26,1,'06-08-2018'),(165,181,25,2,'06-08-2018'),(166,187,29,3,'06-08-2018'),(167,193,32,1,'06-08-2018'),(168,127,23,1,'06-08-2018'),(169,132,27,2,'06-08-2018'),(170,155,30,2,'06-08-2018'),(171,168,31,2,'06-08-2018'),(172,174,28,3,'06-08-2018'),(173,179,26,4,'06-08-2018'),(174,184,25,4,'06-08-2018'),(175,189,29,4,'06-08-2018'),(176,195,32,4,'06-08-2018'),(177,124,23,2,'06-08-2018'),(178,128,27,2,'06-08-2018'),(179,154,30,4,'06-08-2018'),(180,170,31,3,'06-08-2018'),(181,173,28,4,'06-08-2018'),(182,178,26,2,'06-08-2018'),(183,183,25,1,'06-08-2018'),(184,191,29,1,'06-08-2018'),(185,194,32,1,'06-08-2018'),(186,118,23,2,'06-08-2018'),(187,133,27,3,'06-08-2018'),(188,156,30,4,'06-08-2018'),(189,169,31,1,'06-08-2018'),(190,175,28,1,'06-08-2018'),(191,196,32,1,'06-08-2018'),(192,185,25,2,'06-08-2018'),(193,180,26,4,'06-08-2018'),(194,190,29,2,'06-08-2018'),(195,125,23,1,'03-08-2018'),(196,131,27,1,'03-08-2018'),(197,157,30,2,'03-08-2018'),(198,159,31,1,'03-08-2018'),(199,171,28,1,'03-08-2018'),(200,177,26,3,'03-08-2018'),(201,182,25,4,'03-08-2018'),(202,186,29,3,'03-08-2018'),(203,192,32,2,'03-08-2018'),(204,126,23,1,'03-08-2018'),(205,130,27,2,'03-08-2018'),(206,158,30,3,'03-08-2018'),(207,160,31,4,'03-08-2018'),(208,172,28,1,'03-08-2018'),(209,176,26,1,'03-08-2018'),(210,181,25,2,'03-08-2018'),(211,187,29,3,'03-08-2018'),(212,193,32,1,'03-08-2018'),(213,127,23,1,'03-08-2018'),(214,132,27,2,'03-08-2018'),(215,155,30,2,'03-08-2018'),(216,168,31,2,'03-08-2018'),(217,174,28,3,'03-08-2018'),(218,179,26,4,'03-08-2018'),(219,184,25,4,'03-08-2018'),(220,189,29,4,'03-08-2018'),(221,195,32,4,'03-08-2018'),(222,124,23,2,'03-08-2018'),(223,128,27,2,'03-08-2018'),(224,154,30,4,'03-08-2018'),(225,170,31,3,'03-08-2018'),(226,173,28,4,'03-08-2018'),(227,178,26,2,'03-08-2018'),(228,183,25,1,'03-08-2018'),(229,191,29,1,'03-08-2018'),(230,194,32,1,'03-08-2018'),(231,118,23,2,'03-08-2018'),(232,133,27,3,'03-08-2018'),(233,156,30,4,'03-08-2018'),(234,169,31,1,'03-08-2018'),(235,175,28,1,'03-08-2018'),(236,196,32,1,'03-08-2018'),(237,185,25,2,'03-08-2018'),(238,180,26,4,'03-08-2018'),(239,190,29,2,'03-08-2018'),(240,125,23,1,'02-08-2018'),(241,131,27,1,'02-08-2018'),(242,157,30,2,'02-08-2018'),(243,159,31,1,'02-08-2018'),(244,171,28,1,'02-08-2018'),(245,177,26,3,'02-08-2018'),(246,182,25,4,'02-08-2018'),(247,186,29,3,'02-08-2018'),(248,192,32,2,'02-08-2018'),(249,126,23,1,'02-08-2018'),(250,130,27,2,'02-08-2018'),(251,158,30,3,'02-08-2018'),(252,160,31,4,'02-08-2018'),(253,172,28,1,'02-08-2018'),(254,176,26,1,'02-08-2018'),(255,181,25,2,'02-08-2018'),(256,187,29,3,'02-08-2018'),(257,193,32,1,'02-08-2018'),(258,127,23,1,'02-08-2018'),(259,132,27,2,'02-08-2018'),(260,155,30,2,'02-08-2018'),(261,168,31,2,'02-08-2018'),(262,174,28,3,'02-08-2018'),(263,179,26,4,'02-08-2018'),(264,184,25,4,'02-08-2018'),(265,189,29,4,'02-08-2018'),(266,195,32,4,'02-08-2018'),(267,124,23,2,'02-08-2018'),(268,128,27,2,'02-08-2018'),(269,154,30,4,'02-08-2018'),(270,170,31,3,'02-08-2018'),(271,173,28,4,'02-08-2018'),(272,178,26,2,'02-08-2018'),(273,183,25,1,'02-08-2018'),(274,191,29,1,'02-08-2018'),(275,194,32,1,'02-08-2018'),(276,118,23,2,'02-08-2018'),(277,133,27,3,'02-08-2018'),(278,156,30,4,'02-08-2018'),(279,169,31,1,'02-08-2018'),(280,175,28,1,'02-08-2018'),(281,196,32,1,'02-08-2018'),(282,185,25,2,'02-08-2018'),(283,180,26,4,'02-08-2018'),(284,190,29,2,'02-08-2018'),(285,125,23,1,'01-08-2018'),(286,131,27,1,'01-08-2018'),(287,157,30,2,'01-08-2018'),(288,159,31,1,'01-08-2018'),(289,171,28,1,'01-08-2018'),(290,177,26,3,'01-08-2018'),(291,182,25,4,'01-08-2018'),(292,186,29,3,'01-08-2018'),(293,192,32,2,'01-08-2018'),(294,126,23,1,'01-08-2018'),(295,130,27,2,'01-08-2018'),(296,158,30,3,'01-08-2018'),(297,160,31,4,'01-08-2018'),(298,172,28,1,'01-08-2018'),(299,176,26,1,'01-08-2018'),(300,181,25,2,'01-08-2018'),(301,187,29,3,'01-08-2018'),(302,193,32,1,'01-08-2018'),(303,127,23,1,'01-08-2018'),(304,132,27,2,'01-08-2018'),(305,155,30,2,'01-08-2018'),(306,168,31,2,'01-08-2018'),(307,174,28,3,'01-08-2018'),(308,179,26,4,'01-08-2018'),(309,184,25,4,'01-08-2018'),(310,189,29,4,'01-08-2018'),(311,195,32,4,'01-08-2018'),(312,124,23,2,'01-08-2018'),(313,128,27,2,'01-08-2018'),(314,154,30,4,'01-08-2018'),(315,170,31,3,'01-08-2018'),(316,173,28,4,'01-08-2018'),(317,178,26,2,'01-08-2018'),(318,183,25,1,'01-08-2018'),(319,191,29,1,'01-08-2018'),(320,194,32,1,'01-08-2018'),(321,118,23,2,'01-08-2018'),(322,133,27,3,'01-08-2018'),(323,156,30,4,'01-08-2018'),(324,169,31,1,'01-08-2018'),(325,175,28,1,'01-08-2018'),(326,196,32,1,'01-08-2018'),(327,185,25,2,'01-08-2018'),(328,180,26,4,'01-08-2018'),(329,190,29,2,'01-08-2018');
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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias-aulas`
--

LOCK TABLES `materias-aulas` WRITE;
/*!40000 ALTER TABLE `materias-aulas` DISABLE KEYS */;
INSERT INTO `materias-aulas` VALUES (77,16,22,1),(78,16,11,3),(81,17,10,1),(82,17,11,2),(83,17,12,3),(95,22,18,1),(96,22,17,3),(97,23,15,1),(98,23,16,3),(99,24,11,1),(100,24,10,3),(101,25,9,1),(102,25,9,3),(103,15,27,1),(104,15,12,3),(105,19,12,1),(106,19,9,3),(107,18,10,1),(108,18,12,3),(109,21,9,1),(110,21,27,3),(122,30,10,1),(123,30,11,3),(134,20,17,1),(135,20,17,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias-turnos`
--

LOCK TABLES `materias-turnos` WRITE;
/*!40000 ALTER TABLE `materias-turnos` DISABLE KEYS */;
INSERT INTO `materias-turnos` VALUES (120,16,1),(121,16,3),(125,17,1),(126,17,2),(127,17,3),(140,22,1),(141,22,3),(142,23,1),(143,23,3),(144,24,1),(145,24,3),(146,25,1),(147,25,3),(148,15,1),(149,15,3),(150,19,1),(151,19,3),(152,18,1),(153,18,3),(154,21,1),(155,21,3),(167,30,1),(168,30,3),(181,20,1),(182,20,3);
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
  KEY `fk_idusuario_idx` (`idUsuario`),
  CONSTRAINT `fk_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias-usuarios`
--

LOCK TABLES `materias-usuarios` WRITE;
/*!40000 ALTER TABLE `materias-usuarios` DISABLE KEYS */;
INSERT INTO `materias-usuarios` VALUES (18,136,30,1,1,1),(21,137,31,1,1,1),(28,137,28,1,1,1),(31,137,26,1,1,1),(36,137,25,1,1,1),(37,155,29,1,1,2),(38,141,29,1,1,2),(39,145,29,1,1,2),(40,147,29,1,1,2),(41,155,32,1,1,2),(42,141,32,1,1,2),(43,143,32,1,1,2),(44,145,32,1,1,2),(45,147,32,1,1,2),(118,152,23,1,1,1),(119,137,23,1,1,1),(124,148,23,1,1,1),(125,151,23,1,1,1),(126,182,23,1,1,1),(127,120,23,1,1,1),(128,148,27,1,1,1),(130,182,27,1,1,1),(131,151,27,1,1,1),(132,120,27,1,1,1),(133,152,27,1,1,1),(134,148,17,1,1,1),(135,151,17,1,1,1),(136,182,17,1,1,1),(154,148,30,1,1,1),(155,120,30,1,1,1),(156,152,30,1,1,1),(157,151,30,1,1,1),(158,182,30,1,1,1),(159,151,31,1,1,1),(160,182,31,1,1,1),(168,120,31,1,1,1),(169,152,31,1,1,1),(170,148,31,1,1,1),(171,151,28,1,1,1),(172,182,28,1,1,1),(173,148,28,1,1,1),(174,120,28,1,1,1),(175,152,28,1,1,1),(176,182,26,1,1,1),(177,151,26,1,1,1),(178,148,26,1,1,1),(179,120,26,1,1,1),(180,152,26,1,1,1),(181,182,25,1,1,1),(182,151,25,1,1,1),(183,148,25,1,1,1),(184,120,25,1,1,1),(185,152,25,1,1,1),(186,151,29,1,1,1),(187,182,29,1,1,1),(189,120,29,1,1,1),(190,152,29,1,1,1),(191,148,29,1,1,1),(192,151,32,1,1,1),(193,182,32,1,1,1),(194,148,32,1,1,1),(195,120,32,1,1,1),(196,152,32,1,1,1);
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
  `idimagen` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `mail` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `mail_UNIQUE` (`mail`),
  KEY `fk_usuario_tipo_idx` (`idtipo`),
  KEY `fk_usuarios_imagen_idx` (`idimagen`(255)),
  CONSTRAINT `fk_usuario_tipo` FOREIGN KEY (`idtipo`) REFERENCES `tipos` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (17,1,'1','Pablo Martin','De Cecco Rios','pablomdececcorios@gmail.com',1),(22,4,'1','Administrativo','Uno','pablo.dececco@hotmail.com',1),(23,3,'1','Luciana','Arrua','luciana.a.arrua@gmail.com',1),(24,2,'1','Octavio ','Villegas','ovillegas@gmail.com',1),(25,3,'1','Jorge','Rios','jrios@gmail.com',1),(26,3,'1','Nicolas','Ortega','nortega@mail.com',1),(27,3,'1','Jesica','Barrientos','jbarrientos@mail.com',1),(28,3,'1','Carlos','Lopez','clopez@mail.com',1),(29,3,'1','Silvina','Rosa','srosa@mail.com',1),(30,3,'1','Laura','Espinosa','lespinosa@mail.com',1),(31,3,'1','Rosaura','ladie','rladie@mail.com',1),(32,3,'1','Emilia','Sarasa','esarasa@mail.com',1);
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

-- Dump completed on 2018-08-09  1:32:51
