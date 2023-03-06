-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_ventas
-- ------------------------------------------------------
-- Server version	5.7.25-log

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
-- Table structure for table `acceso`
--

DROP TABLE IF EXISTS `acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acceso` (
  `número_docu` int(11) NOT NULL,
  `nomb_usuario` varchar(45) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`número_docu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
INSERT INTO `acceso` VALUES (111111,'Admin','0000','Administrador'),(222222,'Asistente','0000','Asistente');
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `idclientes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `telefono` bigint(15) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `DNI` bigint(40) NOT NULL,
  `Razon` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idclientes`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (3,'Darell Orlando',3024186689,'Cr 40 30-17',1173348378,'Comprador de Barranquilla'),(5,'Mariano De la Rosa',3104088843,'Cl 75 #43-12',108093242,'Compra al por mayor'),(8,'Camilo Rodriguez',3026478987,'Cl 99 #42-12',1088474321,'Compras al detal'),(9,'Juan Camilo ',3075467897,'Cr 30 #17-19',1088989537,'Consulta de preción'),(10,'Pedro Hernadez',321,'Cl12 #22-12',1078982732,'prueba'),(11,'Juan Ramirez',3211621,'Cl 72 #43-10',1070232121,'Pruebas genereales'),(12,'Darell Estren',3024186689,'Cra 48A #54d-41',1044606928,'Comprador minorista'),(14,'Camilo Vargas',310776754,'Cl 75 #23-12',62422132,'Comprador del Valle'),(15,'Marcela Lopez',3021233212,'Cl 74 #21-12',1044606938,'Comprador mayorista');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleventa` (
  `iddetalleventa` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `idproductos` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`iddetalleventa`),
  KEY `Fk_venta_idx` (`idventa`),
  KEY `Fk_producto_idx1` (`idproductos`),
  CONSTRAINT `Fk_producto` FOREIGN KEY (`idproductos`) REFERENCES `productos` (`idProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventa`
--

LOCK TABLES `detalleventa` WRITE;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
INSERT INTO `detalleventa` VALUES (70,61,2,1,15000),(71,61,3,1,30000),(72,61,9,2,25000),(73,62,6,1,20000),(74,62,2,1,15000),(75,63,2,1,15000),(76,63,9,1,25000),(77,63,5,1,82000),(78,64,6,7,20000),(79,64,7,9,50000),(80,65,9,1,25000),(81,66,9,1,25000),(82,66,3,1,30000);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Precio` decimal(30,2) NOT NULL,
  `Fecha_ingreso` date NOT NULL,
  `Categoria` varchar(45) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idProductos`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (2,'Camisa Negra 2',19,15000.00,'2021-09-07','Hombre','Camisa negra estampado de leon Reff#2121'),(3,'Camiseta Azul',8,30000.00,'2021-09-07','Hombre','Nilon Reff#4054'),(5,'Happy Napper Oso',37,82000.00,'2021-09-02','Bebe','Happy para bebe estampado de oso Reff#2123'),(6,'Sueter de Anime',6,20000.00,'2021-10-06','Bebe','sueter de Algodon, estampado Reff #2143'),(7,'Blusa Estampada',17,50000.00,'2021-10-06','Niña','Blusa de poliestar Reff #0920'),(8,'Happy Napper Anime',37,75000.00,'2021-10-09','Bebe','Happy Napper Tamaño bebe, tela X Reff 000'),(9,'Hoodie estampado',15,25000.00,'2021-10-16','Mujer','Hoodie de algodon diferentes estampado Ref #2212 Tela \"x\"');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `Total` decimal(30,2) NOT NULL,
  `Fecha` varchar(20) DEFAULT NULL,
  `Cliente` varchar(60) NOT NULL,
  PRIMARY KEY (`idVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (61,95000.00,'2021/10/23','Marcela Lopez'),(62,35000.00,'2021/10/23','Darell Estren'),(63,122000.00,'2021/10/23','Camilo Vargas'),(64,590000.00,'2021/10/23','Darell Orlando'),(65,25000.00,'2021/10/23','Darell Estren'),(66,55000.00,'2021/10/24','Mariano De la Rosa');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-25 11:12:26
