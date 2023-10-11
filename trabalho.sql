-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: trabalho
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `codigo_categoria` int(4) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Congresso'),(2,'Simpósio'),(3,'Feira'),(4,'Semana Acadêmica'),(5,'Encontro');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `codigo` int(4) NOT NULL,
  `nome_evento` varchar(60) DEFAULT NULL,
  `local_evento` varchar(50) DEFAULT NULL,
  `data_evento` date DEFAULT NULL,
  `email_evento` varchar(50) DEFAULT NULL,
  `codigo_categoria` int(4) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Semana de TI','Senai','2017-09-13','semanati@evento.br',4),(2,'Simpósio de Eletrônica','Senai','2017-07-20','Eletronica@teste.com.br',2),(3,'Semana Acadêmica','Faculdade Albert Einstein','2017-05-31','albert@einstein.com.br',4),(4,'Feira Metal Mecânica','Parque de Exposições','2017-09-01','metal@mecanica.com.br',3);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante`
--

DROP TABLE IF EXISTS `participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participante` (
  `codigo_participante` int(4) NOT NULL,
  `nome_participante` varchar(60) DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_participante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante`
--

LOCK TABLES `participante` WRITE;
/*!40000 ALTER TABLE `participante` DISABLE KEYS */;
/*!40000 ALTER TABLE `participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante_inscricao`
--

DROP TABLE IF EXISTS `participante_inscricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participante_inscricao` (
  `cod_part_insc` int(4) NOT NULL,
  `codigo_participante` int(4) NOT NULL,
  `codigo_tipo` int(4) NOT NULL,
  `situacao` varchar(2) DEFAULT NULL,
  `data_inscricao` date DEFAULT NULL,
  PRIMARY KEY (`cod_part_insc`),
  KEY `codigo_participante` (`codigo_participante`),
  KEY `codigo_tipo` (`codigo_tipo`),
  CONSTRAINT `participante_inscricao_ibfk_1` FOREIGN KEY (`codigo_participante`) REFERENCES `participante` (`codigo_participante`),
  CONSTRAINT `participante_inscricao_ibfk_2` FOREIGN KEY (`codigo_tipo`) REFERENCES `tipo_inscricao` (`codigo_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante_inscricao`
--

LOCK TABLES `participante_inscricao` WRITE;
/*!40000 ALTER TABLE `participante_inscricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `participante_inscricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_inscricao`
--

DROP TABLE IF EXISTS `tipo_inscricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_inscricao` (
  `codigo_tipo` int(11) NOT NULL,
  `Evento_codigo` int(4) NOT NULL,
  `valor_tipo` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo`),
  KEY `Evento_codigo` (`Evento_codigo`),
  CONSTRAINT `tipo_inscricao_ibfk_1` FOREIGN KEY (`Evento_codigo`) REFERENCES `mydb`.`evento` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_inscricao`
--

LOCK TABLES `tipo_inscricao` WRITE;
/*!40000 ALTER TABLE `tipo_inscricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_inscricao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-10 22:20:25
