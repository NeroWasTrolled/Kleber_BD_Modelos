-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: livraria
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
  `codigo_categoria` int(4) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_categoria` (`codigo_categoria`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`codigo_categoria`) REFERENCES `categoria` (`codigo_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Semana de TI','Senai','2017-09-13','semanati@evento.br',4),(2,'Simpósio de Eletrônica','Senai','2017-07-20','Eletronica@teste.com.br',2),(3,'Semana Acadêmica','Faculdade Albert Einstein','2017-05-31','albert@einstein.com.br',4),(4,'Feira Metal Mecânica','Parque de Exposições','2017-09-01','metal@mecanica.com.br',3),(5,'Semana de Eletromecanica','Senai','2017-09-28','semanati@evento.br',3),(6,'Feira de Exposição','Senai','2017-03-17','Feiradeexposicao@teste.com.br',2);
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
INSERT INTO `participante` VALUES (1,'Gabriel','Rua Agostinho dos Santos','955','Jardim Leblon','Maringá','Pr','gabrielfrancasimoes@gmail.com'),(2,'Lucas','Rua das Morangueiras','122','Jardim França','Maringá','Pr','lucasvasquez@gmail.com'),(3,'Marcos','Rua das Babosas','44','Jardim Vila Operária','Maringá','Pr','MarcosOrelho@gmail.com'),(4,'Geovanna','Alameda Antônio Andrade','67','Colina Verde','Maringá','Pr','GeovannaRodrigues@gmail.com'),(5,'Candace','Alameda Doutor João Paulino','223','Jardim Dias','Maringá','Pr','Candace007@gmail.com'),(6,'Jorge','Avenida Pinguim','506','Conjunto Ângelo Planas','Maringá','Pr','JorginhoGameplays@gmail.com'),(7,'Julinho Gameplays','Avenida Sophia Rasgulaeff','37','Vila Santo Antônio.','Maringá','Pr','JulinhoMatadorDeOnça@gmail.com'),(8,'Ferdinanda','Avenida Riachuelo','154','Jardim Anchieta','Maringá','Pr','FerdinandaZoi@gmail.com'),(9,'Mocoquinha','Avenida Rio Branco','222','Vila Bosque','Maringá','Pr','MocoquinhaToddy@gmail.com'),(10,'Júlio Ceasar','Avenida Palmeiras','51','Mundial','Maringá','Pr','JúlioCeasar@gmail.com');
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
  `codigo_participante` int(4) DEFAULT NULL,
  `codigo_tipo` int(4) DEFAULT NULL,
  `situacao` varchar(45) DEFAULT NULL,
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
INSERT INTO `participante_inscricao` VALUES (1,1,1,'ABERTO','2017-09-15'),(2,3,2,'PAGO','2017-09-03'),(3,5,1,'CANCELADO','2017-09-28'),(4,7,3,'CANCELADO','2017-03-01'),(5,2,1,'ABERTO','2017-07-22'),(6,10,1,'PAGO','2017-12-02'),(7,4,3,'ABERTO','2017-03-06'),(8,2,2,'PAGO','2017-11-12'),(9,2,1,'PAGO','2017-09-07'),(10,6,2,'CANCELADO','2017-05-17');
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
  `Evento_codigo` int(4) DEFAULT NULL,
  `valor_tipo` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo`),
  KEY `Evento_codigo` (`Evento_codigo`),
  CONSTRAINT `tipo_inscricao_ibfk_1` FOREIGN KEY (`Evento_codigo`) REFERENCES `evento` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_inscricao`
--

LOCK TABLES `tipo_inscricao` WRITE;
/*!40000 ALTER TABLE `tipo_inscricao` DISABLE KEYS */;
INSERT INTO `tipo_inscricao` VALUES (1,1,80.00),(2,1,98.00),(3,2,30.00),(4,2,40.00),(5,3,150.00),(6,3,180.00),(7,4,90.00),(8,4,140.00);
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

-- Dump completed on 2023-10-17 20:29:04
