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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias-turnos`
--

LOCK TABLES `materias-turnos` WRITE;
/*!40000 ALTER TABLE `materias-turnos` DISABLE KEYS */;
INSERT INTO `materias-turnos` VALUES (2,2,1),(3,3,1),(7,2,3),(8,3,3),(20,6,1),(21,6,2),(22,5,1),(30,8,1),(31,4,2),(38,1,1),(39,1,2),(43,9,3),(47,10,3),(48,11,1),(53,12,1),(57,13,3),(58,14,1),(59,14,3);
/*!40000 ALTER TABLE `materias-turnos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-14 12:48:35
