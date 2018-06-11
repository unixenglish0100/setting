-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: basededatos
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

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
-- Current Database: `basededatos`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `basededatos` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `basededatos`;

--
-- Current Database: `bien`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bien` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bien`;

--
-- Table structure for table `articulos_Sena`
--

DROP TABLE IF EXISTS `articulos_Sena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos_Sena` (
  `PK_codigo` int(7) unsigned zerofill NOT NULL DEFAULT '0000000',
  `nombre` varchar(40) DEFAULT NULL,
  `modelo` varchar(40) DEFAULT NULL,
  `marca` varchar(40) DEFAULT NULL,
  `serial` varchar(40) DEFAULT NULL,
  `fechaDeCompra` date DEFAULT NULL,
  `cuentaDante` set('hector sanches','evelio martines','alipio valenzuela','anacleto distrorcion','alstor venavides') DEFAULT NULL,
  `ubicacion` varchar(30) NOT NULL,
  `cantidad` int(6) unsigned DEFAULT NULL,
  `estado` text,
  `categoria` enum('devolutivo','consumible') DEFAULT NULL,
  `tipoDeequipo` enum('maquinas','instrumentos','complementos') DEFAULT NULL,
  `descripcion` text,
  `funcion` text,
  PRIMARY KEY (`PK_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_Sena`
--

LOCK TABLES `articulos_Sena` WRITE;
/*!40000 ALTER TABLE `articulos_Sena` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos_Sena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacionDelarticulo`
--

DROP TABLE IF EXISTS `informacionDelarticulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informacionDelarticulo` (
  `FK_codigoArticulo` int(7) unsigned zerofill DEFAULT NULL,
  `epecificacionesTecnicas` text,
  `alistamientosAntesdeUso` text,
  `instruccionesDeuso` text,
  `verificacionYcalibracion` text,
  `condicionesDelequipo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacionDelarticulo`
--

LOCK TABLES `informacionDelarticulo` WRITE;
/*!40000 ALTER TABLE `informacionDelarticulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacionDelarticulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento`
--

DROP TABLE IF EXISTS `mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantenimiento` (
  `FK_codigoArticulo` int(7) unsigned zerofill DEFAULT NULL,
  `tipoDemantenimiento` enum('preventivo','correctivo') DEFAULT NULL,
  `fechaRealizarmantenimeto` date DEFAULT NULL,
  `observaciones` text,
  KEY `FK_codigoArticulo` (`FK_codigoArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento`
--

LOCK TABLES `mantenimiento` WRITE;
/*!40000 ALTER TABLE `mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos` (
  `FK_codigoArticulo` int(9) unsigned zerofill DEFAULT NULL,
  `fechaPrestamo` date DEFAULT NULL,
  `fechaDevolucion` date DEFAULT NULL,
  `FK_documento` char(12) NOT NULL,
  KEY `FK_codigoArticulo` (`FK_codigoArticulo`,`FK_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba`
--

DROP TABLE IF EXISTS `prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prueba` (
  `id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL DEFAULT 'desconocido',
  `apellido` varchar(30) NOT NULL DEFAULT 'desconocido',
  `precio` decimal(5,2) unsigned DEFAULT '4.50',
  `estadocivil` enum('nunguno','soltero','casado','viudo') DEFAULT NULL,
  `idiomas` set('ingles','italiano','portugues') DEFAULT NULL,
  `cantidad` int(6) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba`
--

LOCK TABLES `prueba` WRITE;
/*!40000 ALTER TABLE `prueba` DISABLE KEYS */;
/*!40000 ALTER TABLE `prueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `PK_documento` char(12) NOT NULL,
  `tipoDeusuario` enum('estudiante','docente') DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PK_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ControlDeInventario`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ControlDeInventario` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ControlDeInventario`;

--
-- Table structure for table `articulos_Sena`
--

DROP TABLE IF EXISTS `articulos_Sena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos_Sena` (
  `PK_codigo` int(7) unsigned zerofill NOT NULL DEFAULT '0000000',
  `nombre` varchar(40) DEFAULT NULL,
  `modelo` varchar(40) DEFAULT NULL,
  `marca` varchar(40) DEFAULT NULL,
  `serial` varchar(40) DEFAULT NULL,
  `fechaDeCompra` date DEFAULT NULL,
  `cuentaDante` set('hector sanches','evelio martines','alipio valenzuela','anacleto distrorcion','alstor venavides') DEFAULT NULL,
  `ubicacion` varchar(30) NOT NULL,
  `cantidad` int(6) unsigned DEFAULT NULL,
  `estado` text,
  `categoria` enum('devolutivo','consumible') DEFAULT NULL,
  `tipoDeequipo` enum('maquinas','instrumentos','complementos') DEFAULT NULL,
  `descripcion` text,
  `funcion` text,
  PRIMARY KEY (`PK_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_Sena`
--

LOCK TABLES `articulos_Sena` WRITE;
/*!40000 ALTER TABLE `articulos_Sena` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos_Sena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacionDelarticulo`
--

DROP TABLE IF EXISTS `informacionDelarticulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informacionDelarticulo` (
  `FK_codigoArticulo` int(7) unsigned zerofill DEFAULT NULL,
  `epecificacionesTecnicas` text,
  `alistamientosAntesdeUso` text,
  `instruccionesDeuso` text,
  `verificacionYcalibracion` text,
  `condicionesDelequipo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacionDelarticulo`
--

LOCK TABLES `informacionDelarticulo` WRITE;
/*!40000 ALTER TABLE `informacionDelarticulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacionDelarticulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento`
--

DROP TABLE IF EXISTS `mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantenimiento` (
  `FK_codigoArticulo` int(7) unsigned zerofill DEFAULT NULL,
  `tipoDemantenimiento` enum('preventivo','correctivo') DEFAULT NULL,
  `fechaRealizarmantenimeto` date DEFAULT NULL,
  `observaciones` text,
  KEY `FK_codigoArticulo` (`FK_codigoArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento`
--

LOCK TABLES `mantenimiento` WRITE;
/*!40000 ALTER TABLE `mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos` (
  `FK_codigoArticulo` int(9) unsigned zerofill DEFAULT NULL,
  `fechaPrestamo` date DEFAULT NULL,
  `fechaDevolucion` date DEFAULT NULL,
  `FK_documento` char(12) NOT NULL,
  KEY `FK_codigoArticulo` (`FK_codigoArticulo`,`FK_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `PK_documento` char(12) NOT NULL,
  `tipoDeusuario` enum('estudiante','docente') DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PK_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `educacion1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `educacion1` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `educacion1`;

--
-- Table structure for table `alquileres`
--

DROP TABLE IF EXISTS `alquileres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alquileres` (
  `codigopelicula` smallint(5) unsigned NOT NULL,
  `socio` varchar(30) NOT NULL,
  `fechaprestamo` date NOT NULL,
  `fechadevolucion` date DEFAULT NULL,
  PRIMARY KEY (`codigopelicula`,`fechaprestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquileres`
--

LOCK TABLES `alquileres` WRITE;
/*!40000 ALTER TABLE `alquileres` DISABLE KEYS */;
INSERT INTO `alquileres` VALUES (1,'juan lopez','2006-07-02',NULL),(1,'luis molina','2006-08-02',NULL),(1,'andrea torres','2006-08-25',NULL),(1,'andrea torres','2006-09-02',NULL),(2,'juan lopez','2006-07-02',NULL),(2,'andrea torres','2006-08-02',NULL),(3,'juan lopez','2006-07-12',NULL),(3,'luis molina','2006-08-12',NULL),(3,'andrea torres','2006-08-15',NULL),(4,'luis molina','2006-08-02',NULL),(4,'andrea torres','2006-08-22',NULL),(4,'juan lopez','2006-08-25',NULL);
/*!40000 ALTER TABLE `alquileres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barrios`
--

DROP TABLE IF EXISTS `barrios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barrios` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrios`
--

LOCK TABLES `barrios` WRITE;
/*!40000 ALTER TABLE `barrios` DISABLE KEYS */;
INSERT INTO `barrios` VALUES (1,'centro'),(2,'alberdi'),(3,'gral. paz'),(4,'pueyrredon');
/*!40000 ALTER TABLE `barrios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'cordoba'),(2,'alta grecia'),(3,'villa dolores'),(4,'carlos paz');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `codigoprovincia` tinyint(3) unsigned DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'lopez marcos','colon 111','cordoba',1,NULL),(2,'perez ana','san martin 222','cruz del eje',1,'4578585'),(3,'garcia juan','rivadavia 333','villa maria',1,'4578445'),(4,'perez luis','sarmiento 444','rosario',2,NULL),(5,'pereyra lucas','san martin 555','crua del eje',1,'4253685'),(6,'gomez ines','san martin 666','santa fe',2,'345252525'),(7,'torres fabiola','alem 777','villa del rosario',1,'4554455'),(8,'lopez carlos','irigoyen 888','cruz del eje',1,NULL),(9,'ramos betina','san martin 999','cordoba',1,'4223366'),(10,'lopez lucas','san martin 1010','posadas',4,'457858745');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientesduplicados`
--

DROP TABLE IF EXISTS `clientesduplicados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientesduplicados` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `codigoprovincia` tinyint(3) unsigned DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientesduplicados`
--

LOCK TABLES `clientesduplicados` WRITE;
/*!40000 ALTER TABLE `clientesduplicados` DISABLE KEYS */;
INSERT INTO `clientesduplicados` VALUES (1,'lopez marcos','colon 111','cordoba',1,NULL),(2,'perez ana','san martin 222','cruz del eje',1,'4578585'),(3,'garcia juan','rivadavia 333','villa maria',1,'4578445'),(4,'perez luis','sarmiento 444','rosario',2,NULL),(5,'pereyra lucas','san martin 555','crua del eje',1,'4253685'),(6,'gomez ines','san martin 666','santa fe',2,'345252525'),(7,'torres fabiola','alem 777','villa del rosario',1,'4554455'),(8,'lopez carlos','irigoyen 888','cruz del eje',1,NULL),(9,'ramos betina','san martin 999','cordoba',1,'4223366'),(10,'lopez lucas','san martin 1010','posadas',4,'457858745');
/*!40000 ALTER TABLE `clientesduplicados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comidas`
--

DROP TABLE IF EXISTS `comidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comidas` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `rubro` varchar(30) DEFAULT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comidas`
--

LOCK TABLES `comidas` WRITE;
/*!40000 ALTER TABLE `comidas` DISABLE KEYS */;
INSERT INTO `comidas` VALUES (1,'milanesa y fritas','plato pricipal',3.40),(2,'arroz primavera','plato pricipal',2.50),(3,'pollo','plato pricipal',2.80),(4,'flan','postre',1.00),(5,'porcion de torta','postre',2.10),(6,'gelatina','postre',0.90);
/*!40000 ALTER TABLE `comidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comidas1`
--

DROP TABLE IF EXISTS `comidas1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comidas1` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) DEFAULT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comidas1`
--

LOCK TABLES `comidas1` WRITE;
/*!40000 ALTER TABLE `comidas1` DISABLE KEYS */;
INSERT INTO `comidas1` VALUES (1,'milanesa y fritas',3.40),(2,'arroz primavera',2.50),(3,'pollo',2.80);
/*!40000 ALTER TABLE `comidas1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas` (
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `documento` char(9) NOT NULL,
  `codigoobrasocial` tinyint(3) unsigned DEFAULT NULL,
  `medico` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`fecha`,`hora`,`medico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
INSERT INTO `consultas` VALUES ('2006-08-10','08:00:00','22333444',1,'perez'),('2006-08-10','08:30:00','25333444',1,'garcia'),('2006-08-10','09:00:00','24333444',2,'perez'),('2006-08-10','10:00:00','22333444',1,'lopez'),('2006-08-10','10:00:00','25333444',3,'perez'),('2006-08-19','08:30:00','23333444',1,'perez'),('2006-09-10','08:30:00','25333444',1,'lopez');
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportes`
--

DROP TABLE IF EXISTS `deportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deportes` (
  `codigo` char(1) NOT NULL DEFAULT '',
  `nombre` varchar(30) DEFAULT NULL,
  `profesor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportes`
--

LOCK TABLES `deportes` WRITE;
/*!40000 ALTER TABLE `deportes` DISABLE KEYS */;
INSERT INTO `deportes` VALUES ('b','basquet','antonio juarez'),('n','natacion','maria lopez'),('t','tenis','juan lopez');
/*!40000 ALTER TABLE `deportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

LOCK TABLES `editoriales` WRITE;
/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
INSERT INTO `editoriales` VALUES (1,'paidos'),(2,'emece'),(3,'planeta'),(4,'sudamerica');
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorialesduplicados`
--

DROP TABLE IF EXISTS `editorialesduplicados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editorialesduplicados` (
  `codigoeditorial` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoeditorial`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorialesduplicados`
--

LOCK TABLES `editorialesduplicados` WRITE;
/*!40000 ALTER TABLE `editorialesduplicados` DISABLE KEYS */;
INSERT INTO `editorialesduplicados` VALUES (1,'paidos'),(2,'emece'),(3,'planeta'),(4,'sudamerica');
/*!40000 ALTER TABLE `editorialesduplicados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmuebles`
--

DROP TABLE IF EXISTS `inmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inmuebles` (
  `edificio` varchar(30) NOT NULL DEFAULT '',
  `domicilio` varchar(30) NOT NULL,
  `piso` char(1) NOT NULL,
  `numerodpto` char(2) NOT NULL,
  `detalles` varchar(200) DEFAULT NULL,
  `codigobarrio` tinyint(3) unsigned DEFAULT NULL,
  `precio` decimal(6,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`edificio`,`piso`,`numerodpto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmuebles`
--

LOCK TABLES `inmuebles` WRITE;
/*!40000 ALTER TABLE `inmuebles` DISABLE KEYS */;
INSERT INTO `inmuebles` VALUES ('avellaneda','avellaneda 86','1','1',NULL,1,400.50),('avellaneda','avellaneda 86','1','2',NULL,1,400.50),('avellaneda','avellaneda 86','2','1',NULL,1,400.50),('bolivar','sarmiento 1203','1','1',NULL,3,500.00),('centauro l','peru 456','1','A',NULL,4,300.00),('centauro l','peru 456','2','C',NULL,4,350.00),('paris','urquiza 364','1','12',NULL,1,600.00);
/*!40000 ALTER TABLE `inmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos`
--

DROP TABLE IF EXISTS `inscriptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos` (
  `documento` char(9) NOT NULL DEFAULT '',
  `deporte` varchar(30) NOT NULL DEFAULT '',
  `año` year(4) NOT NULL DEFAULT '0000',
  `matricula` char(1) DEFAULT NULL,
  PRIMARY KEY (`documento`,`deporte`,`año`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos`
--

LOCK TABLES `inscriptos` WRITE;
/*!40000 ALTER TABLE `inscriptos` DISABLE KEYS */;
INSERT INTO `inscriptos` VALUES ('22333444','natacion',2005,'s'),('22333444','natacion',2006,'n'),('23333444','natacion',2005,'s'),('23333444','natacion',2006,'s'),('23333444','tenis',2006,'s'),('24333444','basquet',2006,'n'),('24333444','tenis',2006,'n'),('25333444','basquet',2006,'n'),('25333444','tenis',2006,'n'),('29333444','futbol',2007,'n');
/*!40000 ALTER TABLE `inscriptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptosd`
--

DROP TABLE IF EXISTS `inscriptosd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptosd` (
  `documento` char(8) NOT NULL,
  `codigodeporte` tinyint(3) unsigned NOT NULL,
  `año` year(4) NOT NULL DEFAULT '0000',
  `matriculapaga` char(1) DEFAULT NULL,
  PRIMARY KEY (`documento`,`codigodeporte`,`año`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptosd`
--

LOCK TABLES `inscriptosd` WRITE;
/*!40000 ALTER TABLE `inscriptosd` DISABLE KEYS */;
INSERT INTO `inscriptosd` VALUES ('22333444',2,2005,'s'),('22333444',2,2006,'n'),('23333444',1,2005,'s'),('23333444',1,2006,'s'),('23333444',2,2005,'s'),('24333444',2,2006,'n'),('24333444',3,2006,'n');
/*!40000 ALTER TABLE `inscriptosd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptosduplicados`
--

DROP TABLE IF EXISTS `inscriptosduplicados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptosduplicados` (
  `documento` char(9) NOT NULL DEFAULT '',
  `deporte` varchar(30) NOT NULL DEFAULT '',
  `año` year(4) NOT NULL DEFAULT '0000',
  `matricula` char(1) DEFAULT NULL,
  PRIMARY KEY (`documento`,`deporte`,`año`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptosduplicados`
--

LOCK TABLES `inscriptosduplicados` WRITE;
/*!40000 ALTER TABLE `inscriptosduplicados` DISABLE KEYS */;
INSERT INTO `inscriptosduplicados` VALUES ('22333444','natacion',2005,'s'),('22333444','natacion',2006,'n'),('23333444','natacion',2005,'s'),('23333444','natacion',2006,'s'),('23333444','tenis',2006,'s'),('24333444','basquet',2006,'n'),('24333444','tenis',2006,'n'),('25333444','basquet',2006,'n'),('25333444','tenis',2006,'n');
/*!40000 ALTER TABLE `inscriptosduplicados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) NOT NULL,
  `autor` varchar(40) NOT NULL DEFAULT 'desconocido',
  `codigoeditorial` tinyint(3) unsigned NOT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL,
  `cantidad` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'el aleph','borges',3,43.50,200),(2,'alicia en el pais de las maravillas','lewis carroll',2,33.50,100),(3,'aprenda php','mario perez',1,55.80,50),(4,'java en 10 minutos','juan lopez',1,88.00,150),(5,'alicia atraves del espejo','lewis carroll',1,15.50,80),(6,'cervantes y el quijote','borges - bioy casares',3,25.50,255);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros1`
--

DROP TABLE IF EXISTS `libros1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros1` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(60) DEFAULT NULL,
  `autor` varchar(30) DEFAULT NULL,
  `editorial` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros1`
--

LOCK TABLES `libros1` WRITE;
/*!40000 ALTER TABLE `libros1` DISABLE KEYS */;
INSERT INTO `libros1` VALUES (15,'manual de 1 grado','moreno luis','emece'),(28,'manual de 2 grado','moreno luis','emece'),(30,'alicia en el pais de las maravillas','lewis carroll','planeta'),(35,'el aleph','borges','emece');
/*!40000 ALTER TABLE `libros1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros3`
--

DROP TABLE IF EXISTS `libros3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros3` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) NOT NULL,
  `autor` varchar(40) NOT NULL DEFAULT '1',
  `codigoeditorial` tinyint(3) unsigned NOT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros3`
--

LOCK TABLES `libros3` WRITE;
/*!40000 ALTER TABLE `libros3` DISABLE KEYS */;
INSERT INTO `libros3` VALUES (1,'sant germain','borges',3,43.50),(2,'sant germain','lewis carroll',2,33.50),(3,'aprenda php','mario perez',1,55.80),(4,'java en 10 minutos','juan lopez',1,88.00),(5,'alicia atraves del espejo','lewis carroll',1,15.50),(6,'cervantes y el quijote','borges - bioy casares',3,25.50);
/*!40000 ALTER TABLE `libros3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librosduplicados`
--

DROP TABLE IF EXISTS `librosduplicados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librosduplicados` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) DEFAULT NULL,
  `autor` varchar(40) NOT NULL DEFAULT 'desconocido',
  `codigoeditorial` tinyint(3) unsigned NOT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL,
  `cantidad` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librosduplicados`
--

LOCK TABLES `librosduplicados` WRITE;
/*!40000 ALTER TABLE `librosduplicados` DISABLE KEYS */;
INSERT INTO `librosduplicados` VALUES (1,'el aleph','borges',3,43.50,200),(2,'alicia en el pais de las marav','lewis carroll',2,33.50,100),(3,'aprenda php','mario perez',1,55.80,50),(4,'java en 10 minutos','juan lopez',1,88.00,150),(5,'alicia atraves del espejo','lewis carroll',1,15.50,80),(6,'cervantes y el quijote','borges - bioy casares',3,25.50,255);
/*!40000 ALTER TABLE `librosduplicados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numerosrifa`
--

DROP TABLE IF EXISTS `numerosrifa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numerosrifa` (
  `numero` tinyint(3) unsigned NOT NULL,
  `documento` char(9) NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numerosrifa`
--

LOCK TABLES `numerosrifa` WRITE;
/*!40000 ALTER TABLE `numerosrifa` DISABLE KEYS */;
INSERT INTO `numerosrifa` VALUES (1,'24333444'),(5,'23333444'),(8,'23333444'),(15,'30333444'),(28,'32333444'),(29,'29333444'),(109,'28333444'),(200,'23333444'),(205,'22333444');
/*!40000 ALTER TABLE `numerosrifa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obrassociales`
--

DROP TABLE IF EXISTS `obrassociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obrassociales` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `monto` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obrassociales`
--

LOCK TABLES `obrassociales` WRITE;
/*!40000 ALTER TABLE `obrassociales` DISABLE KEYS */;
INSERT INTO `obrassociales` VALUES (1,'pami',2.00),(2,'ipam',5.00),(3,'osdop',3.00);
/*!40000 ALTER TABLE `obrassociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peliculas` (
  `codigo` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) NOT NULL,
  `actores` varchar(30) DEFAULT NULL,
  `duracion` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` VALUES (1,'elsa y fred','china zorrilla',90),(2,'mision imposible','tom cruise',120),(3,'mision imposible 2','tom cruise',160),(4,'harry potter y la piedra filos','daniel h.',120),(5,'harry potter y la camara secre','daniel h.',150);
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postres`
--

DROP TABLE IF EXISTS `postres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postres` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postres`
--

LOCK TABLES `postres` WRITE;
/*!40000 ALTER TABLE `postres` DISABLE KEYS */;
INSERT INTO `postres` VALUES (1,'flan',1.00),(2,'porcion de torta',2.10),(3,'gelatina',0.90);
/*!40000 ALTER TABLE `postres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premios`
--

DROP TABLE IF EXISTS `premios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `premios` (
  `posicion` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `premio` varchar(30) DEFAULT NULL,
  `numeroganador` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`posicion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premios`
--

LOCK TABLES `premios` WRITE;
/*!40000 ALTER TABLE `premios` DISABLE KEYS */;
INSERT INTO `premios` VALUES (1,'pc pentium',205),(2,'televisor 22 pulgadas',29),(3,'microhondas',5),(4,'multiprocesador',15),(5,'cafetera',33);
/*!40000 ALTER TABLE `premios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos` (
  `codigolibro` int(10) unsigned NOT NULL DEFAULT '0',
  `documento` char(10) NOT NULL,
  `fechaprestamo` date NOT NULL,
  `fechadevolucion` date DEFAULT NULL,
  PRIMARY KEY (`codigolibro`,`fechaprestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (15,'22333444','2006-07-10','2006-07-12'),(15,'22333444','2006-07-20','2006-07-21'),(15,'23333444','2006-07-25',NULL),(28,'25333444','2006-08-10',NULL),(30,'23333444','2006-07-28',NULL);
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'cordoba'),(2,'santa fe'),(3,'corrintes'),(4,'misiones'),(5,'salta'),(6,'buenos aires'),(7,'neuquen');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinciasduplicadas`
--

DROP TABLE IF EXISTS `provinciasduplicadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinciasduplicadas` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinciasduplicadas`
--

LOCK TABLES `provinciasduplicadas` WRITE;
/*!40000 ALTER TABLE `provinciasduplicadas` DISABLE KEYS */;
INSERT INTO `provinciasduplicadas` VALUES (1,'cordoba'),(2,'santa fe'),(3,'corrintes'),(4,'misiones'),(5,'salta'),(6,'buenos aires'),(7,'neuquen');
/*!40000 ALTER TABLE `provinciasduplicadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios`
--

DROP TABLE IF EXISTS `socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socios` (
  `documento` char(8) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios`
--

LOCK TABLES `socios` WRITE;
/*!40000 ALTER TABLE `socios` DISABLE KEYS */;
INSERT INTO `socios` VALUES ('22333444','juan perez','colon 234'),('23333444','maria lopez','sarmiento 465'),('24333444','antonio juarez','caseros 980'),('25333444','ana juarez','sucre 134'),('26333444','sofia herrero','avellaneda 1234');
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sociosduplicados`
--

DROP TABLE IF EXISTS `sociosduplicados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sociosduplicados` (
  `documento` char(8) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sociosduplicados`
--

LOCK TABLES `sociosduplicados` WRITE;
/*!40000 ALTER TABLE `sociosduplicados` DISABLE KEYS */;
INSERT INTO `sociosduplicados` VALUES ('22333444','juan perez','colon 234'),('23333444','maria lopez','sarmiento 465'),('24333444','antonio juarez','caseros 980'),('25333444','ana juarez','sucre 134'),('26333444','sofia herrero','avellaneda 1234');
/*!40000 ALTER TABLE `sociosduplicados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitantes`
--

DROP TABLE IF EXISTS `visitantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitantes` (
  `nombre` varchar(30) DEFAULT NULL,
  `edad` tinyint(3) unsigned DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `codigociudad` tinyint(3) unsigned NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `montocompra` decimal(6,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitantes`
--

LOCK TABLES `visitantes` WRITE;
/*!40000 ALTER TABLE `visitantes` DISABLE KEYS */;
INSERT INTO `visitantes` VALUES ('susana molina',28,'f','colon 123',1,NULL,45.50),('marcela mercado',36,'f','avellaneda 345',1,'4545454',0.00),('alberto garcia',35,'m','gral. paz 123',2,'03547123456',25.00),('teresa garcia',33,'f','gral. paz 123',2,'03547123456',0.00),('roberto perez',45,'m','urquiza 335',1,'4123456',33.20),('marina torres',22,'f','colon 222',3,'03544112233',25.00),('julieta gomez',24,'f','san martin 333',2,'03547121212',53.50),('roxana lopez',20,'f','triunvirato 345',2,NULL,0.00),('liliana garcia',50,'f','paso 999',1,'4588778',48.00),('juan torres',43,'m','sarmiento 876',1,'4988778',15.30);
/*!40000 ALTER TABLE `visitantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `educacion3`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `educacion3` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `educacion3`;

--
-- Table structure for table `alquileres`
--

DROP TABLE IF EXISTS `alquileres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alquileres` (
  `codigopelicula` smallint(5) unsigned NOT NULL,
  `codigosocio` smallint(5) unsigned NOT NULL,
  `fechaprestamo` date NOT NULL,
  `fechadevolucion` date DEFAULT NULL,
  PRIMARY KEY (`codigopelicula`,`fechaprestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquileres`
--

LOCK TABLES `alquileres` WRITE;
/*!40000 ALTER TABLE `alquileres` DISABLE KEYS */;
INSERT INTO `alquileres` VALUES (1,1,'2006-07-02',NULL),(1,2,'2006-08-02',NULL),(1,3,'2006-08-25',NULL),(1,3,'2006-09-02',NULL),(2,1,'2006-07-02',NULL),(2,3,'2006-08-02',NULL),(3,2,'0206-08-12',NULL),(3,1,'2006-07-02',NULL),(3,3,'2006-08-15',NULL),(4,2,'2006-08-02',NULL),(4,3,'2006-08-22',NULL),(4,1,'2006-08-25',NULL);
/*!40000 ALTER TABLE `alquileres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
  `documento` char(8) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES ('22333444','juan perez'),('23555666','marina herrero'),('24000333','daniel juarez'),('25222111','hector paz');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carreras` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'analista de sistemas'),(2,'diseñador web');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportes`
--

DROP TABLE IF EXISTS `deportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deportes` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportes`
--

LOCK TABLES `deportes` WRITE;
/*!40000 ALTER TABLE `deportes` DISABLE KEYS */;
INSERT INTO `deportes` VALUES (1,'tenis'),(2,'natacion'),(3,'basquet'),(4,'voley');
/*!40000 ALTER TABLE `deportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos`
--

DROP TABLE IF EXISTS `inscriptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos` (
  `documento` char(9) NOT NULL,
  `codigodeporte` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `año` year(4) NOT NULL,
  `cuota` char(1) DEFAULT NULL,
  PRIMARY KEY (`documento`,`codigodeporte`,`año`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos`
--

LOCK TABLES `inscriptos` WRITE;
/*!40000 ALTER TABLE `inscriptos` DISABLE KEYS */;
INSERT INTO `inscriptos` VALUES ('22333444',1,2005,'s'),('22333444',1,2006,'s'),('22333444',2,2005,'s'),('24333444',1,2005,'s'),('24333444',2,2006,'s'),('25333444',1,2005,'s'),('25333444',1,2006,'s'),('25333444',3,2006,'s');
/*!40000 ALTER TABLE `inscriptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos1`
--

DROP TABLE IF EXISTS `inscriptos1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos1` (
  `documento` char(9) NOT NULL,
  `codigocarrera` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `codigomateria` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `año` year(4) NOT NULL DEFAULT '0000',
  `cuota` char(1) DEFAULT NULL,
  PRIMARY KEY (`documento`,`codigocarrera`,`codigomateria`,`año`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos1`
--

LOCK TABLES `inscriptos1` WRITE;
/*!40000 ALTER TABLE `inscriptos1` DISABLE KEYS */;
INSERT INTO `inscriptos1` VALUES ('22333444',1,1,2005,'s'),('22333444',1,2,2005,'s'),('22333444',1,3,2006,'n'),('23222222',1,1,2005,'s'),('23222222',1,2,2006,'s'),('24555666',1,1,2005,'s'),('24555666',2,1,2005,'s'),('25000999',1,1,2005,'s'),('25000999',1,2,2005,'s'),('25000999',2,1,2006,'n'),('25000999',2,2,2006,'s');
/*!40000 ALTER TABLE `inscriptos1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) NOT NULL,
  `autor` varchar(30) DEFAULT 'desconocido',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'manual de 2 grado','molina manuel'),(25,'aprenda php','oscar mendez'),(42,'martin fierro','jose hernandez');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `codigocarrera` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) DEFAULT NULL,
  `profesor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`codigocarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,1,'programacion I','alfredo lopez'),(1,2,'programacion basica','alfredo lopez'),(2,1,'sistemas de datos I','bernardo garcia'),(2,2,'ingles I','edit torres'),(3,1,'ingles tecnico','edit torres'),(3,2,'protocolos','hector juarez');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
  `documento` char(8) NOT NULL,
  `nota` decimal(4,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES ('22333444',7.00),('23555666',8.00),('24000333',3.00),('25222111',7.00),('22333444',7.00),('23555666',9.00),('24000333',4.00),('22333444',6.00),('23555666',10.00),('24000333',3.00),('25222111',9.00),('23555666',10.00);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peliculas` (
  `codigo` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) NOT NULL,
  `actores` varchar(30) DEFAULT NULL,
  `duracion` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` VALUES (1,'elsa y fred','china zorrilla',90),(2,'mision imposible','tom cruise',120),(3,'mision imposible 2','tom cruise',160),(4,'harry potter y la piedra filos','daniel h.',120),(5,'harry potter y la camara secre','daniel h.',150);
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos` (
  `documento` char(8) NOT NULL,
  `codigolibro` int(10) unsigned NOT NULL DEFAULT '0',
  `fechaprestamo` date NOT NULL,
  `fechadevolucion` date DEFAULT NULL,
  PRIMARY KEY (`codigolibro`,`fechaprestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES ('22333444',1,'2006-08-10','2006-08-12'),('22333444',1,'2006-08-15',NULL),('25333444',2,'2006-08-02','2006-08-05'),('25333444',25,'2006-08-10','2006-08-13'),('25333444',25,'2006-08-15',NULL),('30333444',42,'2006-08-02','2006-08-05'),('25333444',42,'2006-08-10',NULL);
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios`
--

DROP TABLE IF EXISTS `socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socios` (
  `documento` char(8) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios`
--

LOCK TABLES `socios` WRITE;
/*!40000 ALTER TABLE `socios` DISABLE KEYS */;
INSERT INTO `socios` VALUES ('22333444','juan perez','colon 345'),('23333444','luis perez','caseros 940'),('25333444','ana herrero','sucre 120');
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios1`
--

DROP TABLE IF EXISTS `socios1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socios1` (
  `codigo` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `documento` char(9) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios1`
--

LOCK TABLES `socios1` WRITE;
/*!40000 ALTER TABLE `socios1` DISABLE KEYS */;
INSERT INTO `socios1` VALUES (1,'22333444','juan lopez',NULL),(2,'23333444','diana perez',NULL),(3,'24333444','luis fuentes',NULL);
/*!40000 ALTER TABLE `socios1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios3`
--

DROP TABLE IF EXISTS `socios3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socios3` (
  `documento` char(9) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios3`
--

LOCK TABLES `socios3` WRITE;
/*!40000 ALTER TABLE `socios3` DISABLE KEYS */;
INSERT INTO `socios3` VALUES ('22333444','juan perez'),('23333444','ana garcia'),('24333444','hector fuentes'),('25333444','marta molina');
/*!40000 ALTER TABLE `socios3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `educacion4`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `educacion4` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `educacion4`;

--
-- Table structure for table `cantidadporeditorial`
--

DROP TABLE IF EXISTS `cantidadporeditorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cantidadporeditorial` (
  `nombre` varchar(30) NOT NULL,
  `count(*)` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cantidadporeditorial`
--

LOCK TABLES `cantidadporeditorial` WRITE;
/*!40000 ALTER TABLE `cantidadporeditorial` DISABLE KEYS */;
INSERT INTO `cantidadporeditorial` VALUES ('emece',1),('paidos',3),('planeta',2);
/*!40000 ALTER TABLE `cantidadporeditorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras5`
--

DROP TABLE IF EXISTS `carreras5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carreras5` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras5`
--

LOCK TABLES `carreras5` WRITE;
/*!40000 ALTER TABLE `carreras5` DISABLE KEYS */;
INSERT INTO `carreras5` VALUES (1,'analista de sistemas'),(2,'diseñador web');
/*!40000 ALTER TABLE `carreras5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tema` varchar(30) NOT NULL,
  `dias` set('lunes','martes','miercoles','jueves','viernes','sabado') NOT NULL,
  `horario` enum('AM','PM') NOT NULL,
  `clases` tinyint(3) unsigned DEFAULT '1',
  `fechadeinicio` date DEFAULT NULL,
  `costo` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'PHP basico','lunes,martes,miercoles','AM',18,'2006-08-07',200.00),(2,'PHP basico','lunes,martes,miercoles','PM',18,'2006-08-14',200.00),(3,'PHP basico','sabado','AM',18,'2006-08-05',280.00),(4,'PHP avanzado','martes,jueves','AM',20,'2006-08-01',350.00),(5,'javascript','lunes,martes,miercoles','PM',15,'2006-09-11',150.00),(6,'paginas web','martes,jueves','PM',10,'2006-08-08',250.00),(7,'paginas web','sabado','AM',10,'2006-08-12',280.00),(8,'paginas web','lunes,viernes','AM',10,'2006-08-21',200.00),(9,'paginas web','lunes,martes,miercoles,jueves,viernes','AM',10,'2006-09-18',180.00),(10,'paginas web','lunes,viernes','PM',10,'2006-09-25',280.00),(11,'javascript','lunes,martes,viernes,sabado','PM',12,'2006-09-18',150.00);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportes1`
--

DROP TABLE IF EXISTS `deportes1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deportes1` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportes1`
--

LOCK TABLES `deportes1` WRITE;
/*!40000 ALTER TABLE `deportes1` DISABLE KEYS */;
INSERT INTO `deportes1` VALUES (1,'tenis'),(2,'natacion'),(3,'basquet'),(4,'voley');
/*!40000 ALTER TABLE `deportes1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

LOCK TABLES `editoriales` WRITE;
/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
INSERT INTO `editoriales` VALUES (1,'paidos'),(2,'emece'),(3,'planeta'),(4,'sudamerica');
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales3`
--

DROP TABLE IF EXISTS `editoriales3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales3` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL,
  `domicilio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales3`
--

LOCK TABLES `editoriales3` WRITE;
/*!40000 ALTER TABLE `editoriales3` DISABLE KEYS */;
INSERT INTO `editoriales3` VALUES (1,'paidos','colon 245'),(2,'emece','san martin 590'),(3,'planeta','san martin 222'),(4,'sudamerica',NULL);
/*!40000 ALTER TABLE `editoriales3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `documento` char(9) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `fechadeingreso` date DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('20111222','hector pereyra','m','caseros 987','1995-04-01'),('20125478','ana gomez','f','sarmiento 975','2004-09-23'),('20555444','maria laura torres','f','san martin 1122','2000-05-15'),('22333111','juan perez','m','colon 123','1990-02-01'),('24154269','ofelia garcia','f','triunvirato 628','2004-09-23'),('25444444','susana morales','f','avellaneda 345','1990-04-01'),('30000222','luis luque','m','urquiza 456','1980-09-01'),('30000234','alberto soto','m','peru 232','2003-08-15'),('30154269','oscar mendez','m','colon1245','2004-06-23');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `numero` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `numeroitem` smallint(5) unsigned NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `precioporunidad` decimal(5,2) unsigned DEFAULT NULL,
  `cantidad` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`numero`,`numeroitem`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (0000000100,1,'escuadra de 20 cm',2.50,20),(0000000100,2,'escuadra 50 cm',5.00,30),(0000000100,3,'goma lapiz-tinta',0.35,100),(0000000102,1,'lapices coloresx6',4.40,50),(0000000102,2,'lapices coloresx12',8.00,60),(0000000255,1,'lapices coloresx24',12.35,100),(0000000567,1,'compas plastico',12.00,50),(0000000567,2,'compas metal',18.90,80);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingresos` (
  `AÑOS` int(4) DEFAULT NULL,
  `CANTIDAD` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` VALUES (1980,1),(1990,2),(1995,1),(2000,1),(2003,1),(2004,3);
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripciones` (
  `documento` char(9) NOT NULL,
  `codigocurso` tinyint(3) unsigned NOT NULL,
  `pago` char(1) DEFAULT NULL,
  PRIMARY KEY (`documento`,`codigocurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES ('22333333',1,'s'),('22333333',5,'s'),('22333333',6,'n'),('23333444',4,'s'),('23333444',5,'s'),('23333444',7,'s'),('23333777',1,'s'),('24333555',11,'s'),('25333666',3,'n'),('25333666',7,'n'),('26333777',10,'s'),('26333777',11,'s');
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos`
--

DROP TABLE IF EXISTS `inscriptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos` (
  `documento` char(9) NOT NULL,
  `deporte` varchar(30) NOT NULL,
  `año` year(4) NOT NULL,
  `cuota` char(1) DEFAULT NULL,
  PRIMARY KEY (`documento`,`deporte`,`año`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos`
--

LOCK TABLES `inscriptos` WRITE;
/*!40000 ALTER TABLE `inscriptos` DISABLE KEYS */;
INSERT INTO `inscriptos` VALUES ('22333444','natacion',2005,'s'),('22333444','tenis',2005,'s'),('22333444','tenis',2006,'s'),('24333444','natacion',2006,'s'),('24333444','tenis',2005,'s'),('25333444','basquet',2006,'s'),('25333444','tenis',2005,'s'),('25333444','tenis',2006,'s');
/*!40000 ALTER TABLE `inscriptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos1`
--

DROP TABLE IF EXISTS `inscriptos1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos1` (
  `documento` char(9) NOT NULL,
  `codigodeporte` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `año` year(4) NOT NULL,
  `cuota` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos1`
--

LOCK TABLES `inscriptos1` WRITE;
/*!40000 ALTER TABLE `inscriptos1` DISABLE KEYS */;
INSERT INTO `inscriptos1` VALUES ('22333444',1,2005,'s'),('22333444',1,2006,'s'),('22333444',2,2005,'s'),('24333444',1,2005,'s'),('24333444',2,2006,'s'),('25333444',1,2005,'s'),('25333444',1,2006,'s'),('25333444',3,2006,'s');
/*!40000 ALTER TABLE `inscriptos1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos3`
--

DROP TABLE IF EXISTS `inscriptos3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos3` (
  `numerosocio` int(10) unsigned NOT NULL DEFAULT '0',
  `deporte` varchar(30) NOT NULL DEFAULT '',
  `año` year(4) NOT NULL,
  `cuota` char(1) DEFAULT NULL,
  PRIMARY KEY (`numerosocio`,`deporte`,`año`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos3`
--

LOCK TABLES `inscriptos3` WRITE;
/*!40000 ALTER TABLE `inscriptos3` DISABLE KEYS */;
INSERT INTO `inscriptos3` VALUES (23,'natacion',2005,'s'),(23,'tenis',2005,'s'),(23,'tenis',2006,'s'),(56,'basquet',2006,'s'),(102,'natacion',2006,'s'),(102,'tenis',2005,'s'),(230,'natacion',2006,'s'),(231,'basquet',2006,'s'),(231,'natacion',2006,'s');
/*!40000 ALTER TABLE `inscriptos3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos5`
--

DROP TABLE IF EXISTS `inscriptos5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos5` (
  `documento` char(9) NOT NULL,
  `codigocarrera` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `codigomateria` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `año` year(4) NOT NULL DEFAULT '0000',
  `cuota` char(1) DEFAULT NULL,
  PRIMARY KEY (`documento`,`codigocarrera`,`codigomateria`,`año`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos5`
--

LOCK TABLES `inscriptos5` WRITE;
/*!40000 ALTER TABLE `inscriptos5` DISABLE KEYS */;
INSERT INTO `inscriptos5` VALUES ('22333444',1,1,2005,'s'),('22333444',1,2,2005,'s'),('22333444',1,3,2006,'n'),('23222222',1,1,2005,'s'),('23222222',1,2,2006,'s'),('24555666',1,1,2005,'s'),('25000999',1,1,2005,'s'),('25000999',1,2,2005,'s'),('25000999',2,1,2006,'n'),('25000999',2,2,2006,'s'),('30222333',2,1,2006,'s');
/*!40000 ALTER TABLE `inscriptos5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptospordeportesaños`
--

DROP TABLE IF EXISTS `inscriptospordeportesaños`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptospordeportesaños` (
  `nombre` varchar(30) DEFAULT NULL,
  `año` year(4) NOT NULL,
  `CANTIDAD` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptospordeportesaños`
--

LOCK TABLES `inscriptospordeportesaños` WRITE;
/*!40000 ALTER TABLE `inscriptospordeportesaños` DISABLE KEYS */;
INSERT INTO `inscriptospordeportesaños` VALUES ('basquet',2006,1),('natacion',2005,1),('natacion',2006,1),('tenis',2005,3),('tenis',2006,2);
/*!40000 ALTER TABLE `inscriptospordeportesaños` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) NOT NULL,
  `autor` varchar(40) NOT NULL DEFAULT 'desconocido',
  `codigoeditorial` tinyint(3) unsigned NOT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'el aleph','borges',3,43.50),(2,'alicia en el pais de las maravillas','lewis carroll',2,33.50),(3,'aprenda php','mario perez',1,55.80),(4,'java en 10 minutos','juan lopez',1,88.00),(5,'alicia atraves del espejo','lewis carroll',1,15.50),(6,'cervantes y el quijote','borges - bioy casares',3,25.50),(9,'metafisica','Borges',3,50.00),(10,'krull','lewis carroll',3,40.00);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros1`
--

DROP TABLE IF EXISTS `libros1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros1` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) DEFAULT NULL,
  `autor` varchar(30) DEFAULT NULL,
  `editorial` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros1`
--

LOCK TABLES `libros1` WRITE;
/*!40000 ALTER TABLE `libros1` DISABLE KEYS */;
INSERT INTO `libros1` VALUES (15,'manual de 1 grado','moreno luis','emece'),(28,'manual de 2 grado','moreno luis','emece'),(30,'alicia en el pais de las marav','lewis carroll','planeta'),(35,'el aleph','borges','emece'),(45,'aprenda PHP','mario molina','planeta');
/*!40000 ALTER TABLE `libros1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros3`
--

DROP TABLE IF EXISTS `libros3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros3` (
  `codigo` int(10) unsigned NOT NULL DEFAULT '0',
  `titulo` varchar(40) NOT NULL,
  `autor` varchar(40) NOT NULL DEFAULT 'desconocido',
  `codigoeditorial` tinyint(3) unsigned NOT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros3`
--

LOCK TABLES `libros3` WRITE;
/*!40000 ALTER TABLE `libros3` DISABLE KEYS */;
INSERT INTO `libros3` VALUES (1,'el aleph','borges',3,43.50),(2,'alicia en el pais de las maravillas','lewis carroll',2,33.50),(3,'aprenda php','mario perez',1,55.80),(4,'java en 10 minutos','juan lopez',1,88.00),(5,'alicia atraves del espejo','lewis carroll',1,15.50),(6,'cervantes y el quijote','borges - bioy casares',3,25.50),(0,'Harry Potter y la camara secreta','J.K.Rowling',2,45.90),(0,'Harry Potter y la camara secreta','J.K.Rowling',2,45.90),(9,'metafisica','Borges',3,50.00),(10,'krull','lewis carroll',3,40.00),(16,'harry potter y la piedra filosofal','borges',2,45.00),(20,'algebra','sant germain',2,56.00),(20,'algebra','sant germain',3,56.00);
/*!40000 ALTER TABLE `libros3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros4`
--

DROP TABLE IF EXISTS `libros4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros4` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) DEFAULT NULL,
  `autor` varchar(30) DEFAULT NULL,
  `editorial` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros4`
--

LOCK TABLES `libros4` WRITE;
/*!40000 ALTER TABLE `libros4` DISABLE KEYS */;
INSERT INTO `libros4` VALUES (15,'manual de 1 grado','moreno luis','emece'),(28,'manual de 2 grado','moreno luis','emece'),(30,'alicia en el pais de las marav','lewis carroll','planeta'),(35,'el aleph','borges','emece'),(36,'aprenda php','molina marcos','planeta'),(40,'cervantes y el quijote','borges','paidos'),(46,'aprenda java','molina marcos','planeta');
/*!40000 ALTER TABLE `libros4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librosausentes`
--

DROP TABLE IF EXISTS `librosausentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librosausentes` (
  `codigo` int(10) unsigned NOT NULL DEFAULT '0',
  `titulo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librosausentes`
--

LOCK TABLES `librosausentes` WRITE;
/*!40000 ALTER TABLE `librosausentes` DISABLE KEYS */;
INSERT INTO `librosausentes` VALUES (15,'manual de 1 grado'),(28,'manual de 2 grado'),(30,'alicia en el pais de las marav'),(35,'el aleph'),(40,'cervantes y el quijote'),(46,'aprenda java');
/*!40000 ALTER TABLE `librosausentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias5`
--

DROP TABLE IF EXISTS `materias5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias5` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `codigocarrera` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) DEFAULT NULL,
  `profesor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`codigocarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias5`
--

LOCK TABLES `materias5` WRITE;
/*!40000 ALTER TABLE `materias5` DISABLE KEYS */;
INSERT INTO `materias5` VALUES (1,1,'programacion I','alfredo lopez'),(1,2,'programacion basica','alfredo lopez'),(2,1,'sistemas de datos I','bernardo garcia'),(2,2,'igles I','edit torres'),(3,1,'ingles tecnico','edit torres'),(3,2,'protocolos','hector juarez');
/*!40000 ALTER TABLE `materias5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `montofactura`
--

DROP TABLE IF EXISTS `montofactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `montofactura` (
  `numero` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `TOTAL` decimal(30,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `montofactura`
--

LOCK TABLES `montofactura` WRITE;
/*!40000 ALTER TABLE `montofactura` DISABLE KEYS */;
INSERT INTO `montofactura` VALUES (0000000100,235.00),(0000000102,700.00),(0000000255,1235.00),(0000000567,2112.00);
/*!40000 ALTER TABLE `montofactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `morosos`
--

DROP TABLE IF EXISTS `morosos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `morosos` (
  `documento` char(9) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `morosos`
--

LOCK TABLES `morosos` WRITE;
/*!40000 ALTER TABLE `morosos` DISABLE KEYS */;
INSERT INTO `morosos` VALUES ('20222000','juan perez'),('25222111','juan perez'),('25333222','ana maria lopez');
/*!40000 ALTER TABLE `morosos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestados`
--

DROP TABLE IF EXISTS `prestados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestados` (
  `titulo` varchar(30) DEFAULT NULL,
  `mas de 1 mes` varchar(2) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestados`
--

LOCK TABLES `prestados` WRITE;
/*!40000 ALTER TABLE `prestados` DISABLE KEYS */;
INSERT INTO `prestados` VALUES ('manual de 1 grado','SI'),('manual de 1 grado','SI'),('manual de 1 grado','SI'),('manual de 2 grado','SI'),('alicia en el pais de las marav','SI'),('aprenda PHP','SI'),('aprenda PHP','SI');
/*!40000 ALTER TABLE `prestados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos1`
--

DROP TABLE IF EXISTS `prestamos1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos1` (
  `codigolibro` int(10) unsigned NOT NULL,
  `documento` char(8) NOT NULL,
  `fechaprestamo` date NOT NULL,
  `fechadevolucion` date DEFAULT NULL,
  PRIMARY KEY (`codigolibro`,`fechaprestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos1`
--

LOCK TABLES `prestamos1` WRITE;
/*!40000 ALTER TABLE `prestamos1` DISABLE KEYS */;
INSERT INTO `prestamos1` VALUES (15,'22333444','2006-07-10','2006-07-12'),(15,'22333444','2006-07-20','2006-07-21'),(15,'23333444','2006-07-25','0000-00-00'),(28,'25333444','2006-08-10','0000-00-00'),(30,'23333444','2006-07-28','0000-00-00'),(45,'28333444','2006-08-10','2006-08-12'),(45,'25333444','2006-09-10','0000-00-00');
/*!40000 ALTER TABLE `prestamos1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos4`
--

DROP TABLE IF EXISTS `prestamos4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos4` (
  `codigolibro` int(10) unsigned NOT NULL,
  `numerosocio` int(11) NOT NULL,
  `fechaprestamo` date NOT NULL,
  `fechadevolucion` date DEFAULT NULL,
  PRIMARY KEY (`codigolibro`,`fechaprestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos4`
--

LOCK TABLES `prestamos4` WRITE;
/*!40000 ALTER TABLE `prestamos4` DISABLE KEYS */;
INSERT INTO `prestamos4` VALUES (15,20,'2006-07-10','2006-07-12'),(15,31,'2006-07-12','2006-07-15'),(15,20,'2006-07-18',NULL),(28,20,'2006-07-15',NULL),(30,20,'2006-07-20',NULL),(35,31,'2006-07-20','2006-07-22'),(35,31,'2009-08-10',NULL),(36,82,'2006-07-09',NULL),(36,90,'2006-07-25','2006-07-26'),(36,90,'2006-07-28','2006-07-28'),(40,52,'2006-09-10',NULL),(46,90,'2009-06-10',NULL);
/*!40000 ALTER TABLE `prestamos4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recaudacion`
--

DROP TABLE IF EXISTS `recaudacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recaudacion` (
  `tema` varchar(30) NOT NULL,
  `cantidad` bigint(21) NOT NULL DEFAULT '0',
  `TOTAL` decimal(25,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recaudacion`
--

LOCK TABLES `recaudacion` WRITE;
/*!40000 ALTER TABLE `recaudacion` DISABLE KEYS */;
INSERT INTO `recaudacion` VALUES ('javascript',4,600.00),('paginas web',2,560.00),('PHP avanzado',1,350.00),('PHP basico',2,400.00);
/*!40000 ALTER TABLE `recaudacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios`
--

DROP TABLE IF EXISTS `socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socios` (
  `documento` char(8) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios`
--

LOCK TABLES `socios` WRITE;
/*!40000 ALTER TABLE `socios` DISABLE KEYS */;
INSERT INTO `socios` VALUES ('22333444','juan perez'),('23333444','luis perez'),('24333444','hector fuentes'),('25333444','ana herrero');
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios3`
--

DROP TABLE IF EXISTS `socios3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socios3` (
  `numero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documento` char(9) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios3`
--

LOCK TABLES `socios3` WRITE;
/*!40000 ALTER TABLE `socios3` DISABLE KEYS */;
INSERT INTO `socios3` VALUES (20,'20222000','juan perez','colon 123'),(23,'22333444','juan perez','colon 123'),(31,'25222111','juan perez','sucre 34'),(52,'25333555','ana maria lopez','avellaneda 235'),(56,'23333444','ana garcia','sarmiento 984'),(82,'28333222','luisa duarte','san martin 877'),(90,'29333222','carlos fuentes','rivadavia 864'),(102,'24333444','hector fuentes','sucre 293'),(150,'25333444','agustin perez','avellaneda 1234'),(230,'26333444','maria perez','urquiza 283'),(231,'29333444','agustin perez','urquiza 283');
/*!40000 ALTER TABLE `socios3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios4`
--

DROP TABLE IF EXISTS `socios4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socios4` (
  `numero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documento` char(9) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios4`
--

LOCK TABLES `socios4` WRITE;
/*!40000 ALTER TABLE `socios4` DISABLE KEYS */;
INSERT INTO `socios4` VALUES (20,'20222000','juan perez','colon 123'),(31,'25222111','juan perez','sucre 34'),(52,'25333222','ana maria lopez','avellaneda 235'),(82,'28333222','luisa duarte','san martin 877'),(90,'29333222','carlos fuentes','rivadavia 864');
/*!40000 ALTER TABLE `socios4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sociosdeporte`
--

DROP TABLE IF EXISTS `sociosdeporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sociosdeporte` (
  `nombre` varchar(30) DEFAULT NULL,
  `INGRESOS` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sociosdeporte`
--

LOCK TABLES `sociosdeporte` WRITE;
/*!40000 ALTER TABLE `sociosdeporte` DISABLE KEYS */;
INSERT INTO `sociosdeporte` VALUES ('ana herrero',3),('hector fuentes',2),('juan perez',3),('luis perez',0);
/*!40000 ALTER TABLE `sociosdeporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas`
--

DROP TABLE IF EXISTS `temas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas` (
  `tema` varchar(30) NOT NULL,
  `cantidad` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas`
--

LOCK TABLES `temas` WRITE;
/*!40000 ALTER TABLE `temas` DISABLE KEYS */;
INSERT INTO `temas` VALUES ('javascript',4),('paginas web',4),('PHP avanzado',1),('PHP basico',3);
/*!40000 ALTER TABLE `temas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `educacion5`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `educacion5` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `educacion5`;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
  `documento` varchar(9) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `domicilio` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES ('22333444','juan perez',NULL),('23333444','marta molina',NULL),('24333444','carlos fuentes',NULL),('25333444','sandra lopez',NULL);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnosporprofesor`
--

DROP TABLE IF EXISTS `alumnosporprofesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnosporprofesor` (
  `profesor` varchar(30) DEFAULT NULL,
  `deporte` varchar(30) DEFAULT NULL,
  `cantidad` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnosporprofesor`
--

LOCK TABLES `alumnosporprofesor` WRITE;
/*!40000 ALTER TABLE `alumnosporprofesor` DISABLE KEYS */;
INSERT INTO `alumnosporprofesor` VALUES ('bautista pereyra','basquet',1),('natalia nores','natacion',2),('tadeo torres','tenis',5),('bautista pereyra','basquet',1),('bautista pereyra','paddle',0),('natalia nores','natacion',2),('tadeo torres','tenis',5);
/*!40000 ALTER TABLE `alumnosporprofesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aprobados`
--

DROP TABLE IF EXISTS `aprobados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aprobados` (
  `numero` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `documento` char(9) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprobados`
--

LOCK TABLES `aprobados` WRITE;
/*!40000 ALTER TABLE `aprobados` DISABLE KEYS */;
INSERT INTO `aprobados` VALUES (1,'30333444','juan perez'),(2,'30433444','ana maria garcia'),(3,'30633444','fabiola juarez');
/*!40000 ALTER TABLE `aprobados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aprobados1`
--

DROP TABLE IF EXISTS `aprobados1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aprobados1` (
  `documento` char(9) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `promedio` decimal(4,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprobados1`
--

LOCK TABLES `aprobados1` WRITE;
/*!40000 ALTER TABLE `aprobados1` DISABLE KEYS */;
INSERT INTO `aprobados1` VALUES ('22333444','juan perez',8.00),('24333444','carlos fuentes',5.50),('25333444','sandra lopez',9.00);
/*!40000 ALTER TABLE `aprobados1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cantidadporeditorial`
--

DROP TABLE IF EXISTS `cantidadporeditorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cantidadporeditorial` (
  `nombre` varchar(40) DEFAULT NULL,
  `cantidad` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cantidadporeditorial`
--

LOCK TABLES `cantidadporeditorial` WRITE;
/*!40000 ALTER TABLE `cantidadporeditorial` DISABLE KEYS */;
INSERT INTO `cantidadporeditorial` VALUES ('emece',1),('paidos',3),('planeta',4),('Plaza & Janes',0);
/*!40000 ALTER TABLE `cantidadporeditorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `nombre` varchar(30) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `edad` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('juan perez',NULL,'m',45),('ana lopez',NULL,'f',50),('federico herrero',NULL,'m',30),('mariano juarez',NULL,'m',35),('maria torres',NULL,'f',36),('ines duarte',NULL,'f',55),('alejandra figueroa',NULL,'f',40);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes1`
--

DROP TABLE IF EXISTS `clientes1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes1` (
  `documento` varchar(9) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `domicilio` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes1`
--

LOCK TABLES `clientes1` WRITE;
/*!40000 ALTER TABLE `clientes1` DISABLE KEYS */;
INSERT INTO `clientes1` VALUES ('22333444','juan perez',NULL),('23333444','marta molina',NULL),('24333444','carlos fuentes',NULL),('25333444','sandra lopez',NULL);
/*!40000 ALTER TABLE `clientes1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicion`
--

DROP TABLE IF EXISTS `condicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condicion` (
  `documento` char(9) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `condicion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicion`
--

LOCK TABLES `condicion` WRITE;
/*!40000 ALTER TABLE `condicion` DISABLE KEYS */;
INSERT INTO `condicion` VALUES ('30333444','juan perez','aprobado'),('30433444','ana maria garcia','aprobado'),('30533444','marcelo morales','reprobado'),('30633444','fabiola juarez','aprobado');
/*!40000 ALTER TABLE `condicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentas` (
  `numero` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `documento` char(9) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `saldo` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=35988 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (0000001234,'22333444','juan perez',2000.60),(0000002566,'23333444','maria pereyra',5050.00),(0000005987,'24333444','marcos torres',200.00),(0000014434,'25333444','ana juarez',8000.60),(0000028566,'23333444','maria pereyra',8050.00),(0000035987,'24333444','marcos torres',2000.00);
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas1`
--

DROP TABLE IF EXISTS `cuentas1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentas1` (
  `numero` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `documento` char(9) NOT NULL,
  `saldo` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=35988 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas1`
--

LOCK TABLES `cuentas1` WRITE;
/*!40000 ALTER TABLE `cuentas1` DISABLE KEYS */;
INSERT INTO `cuentas1` VALUES (000001234,'22333444',2000.60),(000002566,'23333444',5050.00),(000005987,'24333444',200.00),(000014434,'25333444',8000.60),(000028566,'23333444',8050.00),(000035987,'24333444',2000.00);
/*!40000 ALTER TABLE `cuentas1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentasporcliente`
--

DROP TABLE IF EXISTS `cuentasporcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentasporcliente` (
  `numero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documento` char(9) DEFAULT NULL,
  `cantidad` tinyint(3) unsigned DEFAULT NULL,
  `total` decimal(9,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentasporcliente`
--

LOCK TABLES `cuentasporcliente` WRITE;
/*!40000 ALTER TABLE `cuentasporcliente` DISABLE KEYS */;
INSERT INTO `cuentasporcliente` VALUES (1,'22333444',1,2000.60),(2,'23333444',2,13100.00),(3,'24333444',2,2200.00),(4,'25333444',1,8000.60);
/*!40000 ALTER TABLE `cuentasporcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportes`
--

DROP TABLE IF EXISTS `deportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deportes` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `profesor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportes`
--

LOCK TABLES `deportes` WRITE;
/*!40000 ALTER TABLE `deportes` DISABLE KEYS */;
INSERT INTO `deportes` VALUES (1,'tenis','tadeo torres'),(2,'natacion','natalia nores'),(3,'basquet','bautista pereyra'),(4,'paddle','bautista pereyra');
/*!40000 ALTER TABLE `deportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales` (
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

LOCK TABLES `editoriales` WRITE;
/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
INSERT INTO `editoriales` VALUES ('emece'),('planeta'),('paidos');
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales1`
--

DROP TABLE IF EXISTS `editoriales1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales1` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales1`
--

LOCK TABLES `editoriales1` WRITE;
/*!40000 ALTER TABLE `editoriales1` DISABLE KEYS */;
INSERT INTO `editoriales1` VALUES (1,'paidos'),(2,'emece'),(3,'planeta'),(4,'Plaza & Janes');
/*!40000 ALTER TABLE `editoriales1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuentros`
--

DROP TABLE IF EXISTS `encuentros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuentros` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `equipo1` varchar(30) DEFAULT NULL,
  `equipo2` varchar(30) DEFAULT NULL,
  `lugarencuentro` varchar(30) DEFAULT NULL,
  `barrioencuentro` varchar(30) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuentros`
--

LOCK TABLES `encuentros` WRITE;
/*!40000 ALTER TABLE `encuentros` DISABLE KEYS */;
INSERT INTO `encuentros` VALUES (1,'los leones','los tigres','colon 123','centro',NULL),(2,'campeones','los tigres','guemes 346','pueyrredon',NULL),(3,'cebollitas','los tigres','colon 1234','alberdi',NULL),(4,'los tigres','los leones','sarmiento 234','gral. paz',NULL),(5,'campeones','los leones','guemes 346','pueyrredon',NULL),(6,'cebollitas','los leones','colon 1234','alberdi',NULL),(7,'los tigres','campeones','sarmiento 234','gral. paz',NULL),(8,'los leones','campeones','colon 123','centro',NULL),(9,'cebollitas','campeones','colon 1234','alberdi',NULL),(10,'los tigres','cebollitas','sarmiento 234','gral. paz',NULL),(11,'los leones','cebollitas','colon 123','centro',NULL),(12,'campeones','cebollitas','guemes 346','pueyrredon',NULL);
/*!40000 ALTER TABLE `encuentros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `barrio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'los tigres','sarmiento 234','gral. paz'),(2,'los leones','colon 123','centro'),(3,'campeones','guemes 346','pueyrredon'),(4,'cebollitas','colon 1234','alberdi');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `numero` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `numeroitem` smallint(5) unsigned NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `precioporunidad` decimal(5,2) unsigned DEFAULT NULL,
  `cantidad` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`numero`,`numeroitem`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (0000000100,1,'escuadra de 20 cm',2.50,20),(0000000100,2,'escuadra 50 cm',5.00,30),(0000000100,3,'goma lapiz-tinta',0.35,100),(0000000102,1,'lapices coloresx6',4.40,50),(0000000102,2,'lapices coloresx12',8.00,60),(0000000255,1,'lapices coloresx24',12.35,100),(0000000567,1,'compas plastico',12.00,50),(0000000567,2,'compas metal',18.90,80);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcionesporpersona`
--

DROP TABLE IF EXISTS `inscripcionesporpersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripcionesporpersona` (
  `documento` char(9) NOT NULL DEFAULT '',
  `cantidad` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcionesporpersona`
--

LOCK TABLES `inscripcionesporpersona` WRITE;
/*!40000 ALTER TABLE `inscripcionesporpersona` DISABLE KEYS */;
INSERT INTO `inscripcionesporpersona` VALUES ('22333444',3),('24333444',2),('25333444',3);
/*!40000 ALTER TABLE `inscripcionesporpersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos`
--

DROP TABLE IF EXISTS `inscriptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos` (
  `documento` char(9) NOT NULL,
  `codigodeporte` varchar(20) NOT NULL,
  `año` year(4) NOT NULL DEFAULT '0000',
  `cuota` char(1) DEFAULT NULL,
  PRIMARY KEY (`documento`,`codigodeporte`,`año`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos`
--

LOCK TABLES `inscriptos` WRITE;
/*!40000 ALTER TABLE `inscriptos` DISABLE KEYS */;
INSERT INTO `inscriptos` VALUES ('22333444','1',2005,'s'),('22333444','1',2006,'n'),('22333444','2',2005,'s'),('23333444','1',2005,'s'),('23333444','1',2006,'s'),('23333444','2',2006,'s'),('24333444','1',2006,'s'),('24333444','3',2006,'n');
/*!40000 ALTER TABLE `inscriptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptospordeportesyaños`
--

DROP TABLE IF EXISTS `inscriptospordeportesyaños`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptospordeportesyaños` (
  `deporte` varchar(30) DEFAULT NULL,
  `año` year(4) DEFAULT NULL,
  `cantidad` smallint(5) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptospordeportesyaños`
--

LOCK TABLES `inscriptospordeportesyaños` WRITE;
/*!40000 ALTER TABLE `inscriptospordeportesyaños` DISABLE KEYS */;
INSERT INTO `inscriptospordeportesyaños` VALUES ('basquet',2006,1),('natacion',2005,1),('natacion',2006,1),('tenis',2005,3),('tenis',2006,2);
/*!40000 ALTER TABLE `inscriptospordeportesyaños` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptospordeportesyaños1`
--

DROP TABLE IF EXISTS `inscriptospordeportesyaños1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptospordeportesyaños1` (
  `deporte` varchar(20) DEFAULT NULL,
  `año` year(4) DEFAULT NULL,
  `cantidad` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptospordeportesyaños1`
--

LOCK TABLES `inscriptospordeportesyaños1` WRITE;
/*!40000 ALTER TABLE `inscriptospordeportesyaños1` DISABLE KEYS */;
INSERT INTO `inscriptospordeportesyaños1` VALUES ('basquet',2006,1),('natacion',2005,1),('natacion',2006,1),('tenis',2005,2),('tenis',2006,3);
/*!40000 ALTER TABLE `inscriptospordeportesyaños1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) DEFAULT NULL,
  `autor` varchar(30) DEFAULT NULL,
  `editorial` varchar(30) DEFAULT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'el aleph','borges','emece',23.50),(2,'alicia en el pais de las maravillas','lewis carroll','planeta',15.00),(3,'matematicas estas ahi','paenza','emece',34.60),(4,'martin fierro','jose hernandez','paidos',43.50),(5,'martin fierro','jose hernandez','planeta',12.00),(6,'aprenda php','mario molina','paidos',21.80),(7,'aprenda java','mario molina','paidos',55.40),(8,'alicia atraves del espejo','lewis carroll','emece',18.00),(9,'antologia poetica','borges','paidos',47.90);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros1`
--

DROP TABLE IF EXISTS `libros1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros1` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) NOT NULL,
  `autor` varchar(40) NOT NULL DEFAULT 'desconocido',
  `codigoeditorial` tinyint(3) unsigned NOT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros1`
--

LOCK TABLES `libros1` WRITE;
/*!40000 ALTER TABLE `libros1` DISABLE KEYS */;
INSERT INTO `libros1` VALUES (1,'el aleph','borges',3,43.50),(2,'alicia en el pais de las maravillas','lewis carroll',2,33.50),(3,'aprenda php','mario perez',1,55.80),(4,'java en 10 minutos','juan lopez',1,88.00),(5,'alicia atraves del espejo','lewis carroll',1,15.50),(6,'cervantes y el quijote','borges - bioy casares',3,25.50),(9,'metafisica','Borges',3,50.00),(10,'krull','lewis carroll',3,40.00);
/*!40000 ALTER TABLE `libros1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `montofacturas`
--

DROP TABLE IF EXISTS `montofacturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `montofacturas` (
  `numero` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `total` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `montofacturas`
--

LOCK TABLES `montofacturas` WRITE;
/*!40000 ALTER TABLE `montofacturas` DISABLE KEYS */;
INSERT INTO `montofacturas` VALUES (0000000100,235.00),(0000000102,700.00),(0000000255,999.99),(0000000567,999.99);
/*!40000 ALTER TABLE `montofacturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
  `documento` char(9) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `nota` decimal(4,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES ('30333444','juan perez',8.00),('30433444','ana maria garcia',7.50),('30533444','marcelo morales',3.50),('30633444','fabiola juarez',4.50),('30333444','juan perez',7.80),('30433444','ana maria garcia',6.00),('30533444','marcelo morales',4.20),('30633444','fabiola juarez',7.00),('30333444','juan perez',9.00),('30433444','ana maria garcia',5.80),('30633444','fabiola juarez',2.00),('30333444','juan perez',10.00),('30633444','fabiola juarez',6.70);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas1`
--

DROP TABLE IF EXISTS `notas1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas1` (
  `documento` varchar(9) NOT NULL,
  `nota` decimal(4,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas1`
--

LOCK TABLES `notas1` WRITE;
/*!40000 ALTER TABLE `notas1` DISABLE KEYS */;
INSERT INTO `notas1` VALUES ('22333444',8.00),('23333444',3.00),('24333444',6.00),('25333444',9.00),('23333444',2.00),('24333444',5.00),('25333444',8.00),('25333444',10.00);
/*!40000 ALTER TABLE `notas1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promedios`
--

DROP TABLE IF EXISTS `promedios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promedios` (
  `documento` char(9) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `promedio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promedios`
--

LOCK TABLES `promedios` WRITE;
/*!40000 ALTER TABLE `promedios` DISABLE KEYS */;
INSERT INTO `promedios` VALUES ('30333444','juan perez',8.70),('30433444','ana maria garcia',6.43),('30533444','marcelo morales',3.85),('30633444','fabiola juarez',5.05);
/*!40000 ALTER TABLE `promedios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promedios1`
--

DROP TABLE IF EXISTS `promedios1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promedios1` (
  `documento` varchar(9) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `promedio` decimal(4,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promedios1`
--

LOCK TABLES `promedios1` WRITE;
/*!40000 ALTER TABLE `promedios1` DISABLE KEYS */;
INSERT INTO `promedios1` VALUES ('22333444','juan perez',8.00),('23333444','marta molina',2.50),('24333444','carlos fuentes',5.50),('25333444','sandra lopez',9.00);
/*!40000 ALTER TABLE `promedios1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios`
--

DROP TABLE IF EXISTS `socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socios` (
  `documento` char(9) NOT NULL DEFAULT '',
  `nombre` varchar(30) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios`
--

LOCK TABLES `socios` WRITE;
/*!40000 ALTER TABLE `socios` DISABLE KEYS */;
INSERT INTO `socios` VALUES ('22333444','juan perez','colon 123'),('23333444','ana lopez','caseros 984'),('24333444','marcelo morales','sucre 356'),('25333444','susana juarez','sarmiento 723');
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sociosdeudores`
--

DROP TABLE IF EXISTS `sociosdeudores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sociosdeudores` (
  `socio` varchar(20) DEFAULT NULL,
  `deporte` varchar(20) DEFAULT NULL,
  `año` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sociosdeudores`
--

LOCK TABLES `sociosdeudores` WRITE;
/*!40000 ALTER TABLE `sociosdeudores` DISABLE KEYS */;
INSERT INTO `sociosdeudores` VALUES ('juan perez','tenis',2005),('juan perez','tenis',2006),('ana lopez','tenis',2005),('ana lopez','tenis',2006),('marcelo morales','tenis',2006),('juan perez','natacion',2005),('ana lopez','natacion',2006),('marcelo morales','basquet',2006);
/*!40000 ALTER TABLE `sociosdeudores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `educacion6`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `educacion6` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `educacion6`;

--
-- Table structure for table `alumnos20`
--

DROP TABLE IF EXISTS `alumnos20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos20` (
  `documento` char(8) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos20`
--

LOCK TABLES `alumnos20` WRITE;
/*!40000 ALTER TABLE `alumnos20` DISABLE KEYS */;
INSERT INTO `alumnos20` VALUES ('22333445','juan perez'),('23555666','marina herrero'),('24000333','daniel juarez'),('25222111','hector paz');
/*!40000 ALTER TABLE `alumnos20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos25`
--

DROP TABLE IF EXISTS `alumnos25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos25` (
  `legajo` int(3) unsigned DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos25`
--

LOCK TABLES `alumnos25` WRITE;
/*!40000 ALTER TABLE `alumnos25` DISABLE KEYS */;
INSERT INTO `alumnos25` VALUES (223,'marta molina'),(456,'hector fuentes'),(467,'alfredo lopez'),(678,'carla juarez');
/*!40000 ALTER TABLE `alumnos25` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos4`
--

DROP TABLE IF EXISTS `alumnos4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos4` (
  `apellido` varchar(30) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `documento` char(9) NOT NULL DEFAULT '',
  `domicilio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos4`
--

LOCK TABLES `alumnos4` WRITE;
/*!40000 ALTER TABLE `alumnos4` DISABLE KEYS */;
INSERT INTO `alumnos4` VALUES ('perez','luis perez','22333444','colon 123'),('lopez','natalia lopez','23333444','caseros 980'),('torres','mariano torres','24333444','bulnes 256'),('garcia','ana garcia','25333444','sucre 209'),('perez','antonio perez','26333444','avellaneda 1083');
/*!40000 ALTER TABLE `alumnos4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aprobados`
--

DROP TABLE IF EXISTS `aprobados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aprobados` (
  `legajo` int(3) unsigned DEFAULT NULL,
  `promedio` decimal(4,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprobados`
--

LOCK TABLES `aprobados` WRITE;
/*!40000 ALTER TABLE `aprobados` DISABLE KEYS */;
INSERT INTO `aprobados` VALUES (223,9.40),(456,6.00),(467,4.50),(678,7.80);
/*!40000 ALTER TABLE `aprobados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carreras` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'analista de sistemas'),(2,'diseñador web');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `codigo` int(10) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `provincias` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'lopez marcos','colon 111','cordoba',NULL,'cordoba'),(2,'perez ana','san martin 222','cruz del eje','4578585','cordoba'),(3,'garcia juan','rivadavia 333','villa maria','4578445','cordoba'),(4,'perez luis','sarmiento 444','rosario',NULL,'santa fe'),(5,'pereyra lucas','san martin 555','crua del eje','4253685','cordoba'),(6,'gomez ines','san martin 666','santa fe','345252525','santa fe'),(7,'torres fabiola','alem 777','villa del rosario','4554455','cordoba'),(8,'lopez carlos','irigoyen 888','cruz del eje',NULL,'cordoba'),(9,'ramos betina','san martin 999','cordoba','4223366','cordoba'),(10,'lopez lucas','san martin 1010','posadas','457858745','misiones');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes20`
--

DROP TABLE IF EXISTS `clientes20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes20` (
  `codigo` int(10) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `codigoprovincia` tinyint(3) unsigned DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes20`
--

LOCK TABLES `clientes20` WRITE;
/*!40000 ALTER TABLE `clientes20` DISABLE KEYS */;
INSERT INTO `clientes20` VALUES (1,'lopez marcos','colon 111','cordoba',10,NULL),(2,'perez ana','san martin 222','cruz del eje',10,'4578585'),(3,'garcia juan','rivadavia 333','villa maria',10,'4578445'),(4,'perez luis','sarmiento 444','rosario',2,NULL),(5,'pereyra lucas','san martin 555','crua del eje',10,'4253685'),(6,'gomez ines','san martin 666','santa fe',2,'345252525'),(7,'torres fabiola','alem 777','villa del rosario',10,'4554455'),(8,'lopez carlos','irigoyen 888','cruz del eje',10,NULL),(9,'ramos betina','san martin 999','cordoba',10,'4223366'),(10,'lopez lucas','san martin 1010','posadas',4,'457858745');
/*!40000 ALTER TABLE `clientes20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes30`
--

DROP TABLE IF EXISTS `clientes30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes30` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `codigoprovincia` tinyint(3) unsigned DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes30`
--

LOCK TABLES `clientes30` WRITE;
/*!40000 ALTER TABLE `clientes30` DISABLE KEYS */;
INSERT INTO `clientes30` VALUES (1,'lopez marcos','colon 111','cordoba',10,NULL),(2,'perez ana','san martin 222','cruz del eje',10,'4578585'),(3,'garcia juan','rivadavia 333','villa maria',10,'4578445'),(5,'pereyra lucas','san martin 555','crua del eje',10,'4253685'),(7,'torres fabiola','alem 777','villa del rosario',10,'4554455'),(8,'lopez carlos','irigoyen 888','cruz del eje',10,NULL),(9,'ramos betina','san martin 999','cordoba',10,'4223366'),(10,'lopez lucas','san martin 1010','posadas',4,'457858745');
/*!40000 ALTER TABLE `clientes30` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencias`
--

DROP TABLE IF EXISTS `dependencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependencias` (
  `documento` char(8) NOT NULL,
  `seccion` varchar(20) DEFAULT NULL,
  `sueldo` decimal(6,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencias`
--

LOCK TABLES `dependencias` WRITE;
/*!40000 ALTER TABLE `dependencias` DISABLE KEYS */;
INSERT INTO `dependencias` VALUES ('20111222','Sistemas',1400.00),('20555444','Secretaría',1000.00),('22333111','Gerencia',2000.00),('25444444','Sistemas',1500.00),('30000222','Contaduría',1400.00),('30000234','Secretaría',1000.00),('30154269','Relaciones públicas',1100.00);
/*!40000 ALTER TABLE `dependencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportes`
--

DROP TABLE IF EXISTS `deportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deportes` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `profesor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportes`
--

LOCK TABLES `deportes` WRITE;
/*!40000 ALTER TABLE `deportes` DISABLE KEYS */;
INSERT INTO `deportes` VALUES (1,'alfredo perez','sarmiento 984'),(2,'betina molina','sucre 356'),(3,'carlos garcia','urquiza 209');
/*!40000 ALTER TABLE `deportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportes1`
--

DROP TABLE IF EXISTS `deportes1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deportes1` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `profesor` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportes1`
--

LOCK TABLES `deportes1` WRITE;
/*!40000 ALTER TABLE `deportes1` DISABLE KEYS */;
INSERT INTO `deportes1` VALUES (2,'natacion',2),(4,'futbol',1);
/*!40000 ALTER TABLE `deportes1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportes60`
--

DROP TABLE IF EXISTS `deportes60`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deportes60` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(20) NOT NULL,
  `profesor` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportes60`
--

LOCK TABLES `deportes60` WRITE;
/*!40000 ALTER TABLE `deportes60` DISABLE KEYS */;
INSERT INTO `deportes60` VALUES (1,'tenis',1),(2,'natacion',2),(3,'basquet',3),(4,'futbol',1);
/*!40000 ALTER TABLE `deportes60` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

LOCK TABLES `editoriales` WRITE;
/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
INSERT INTO `editoriales` VALUES (1,'paidos'),(9,'emece'),(3,'planeta'),(4,'Plaza & Janes');
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales1`
--

DROP TABLE IF EXISTS `editoriales1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales1` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales1`
--

LOCK TABLES `editoriales1` WRITE;
/*!40000 ALTER TABLE `editoriales1` DISABLE KEYS */;
INSERT INTO `editoriales1` VALUES (1,'paidos'),(3,'planeta'),(4,'Plaza & Janes');
/*!40000 ALTER TABLE `editoriales1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales20`
--

DROP TABLE IF EXISTS `editoriales20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales20` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales20`
--

LOCK TABLES `editoriales20` WRITE;
/*!40000 ALTER TABLE `editoriales20` DISABLE KEYS */;
INSERT INTO `editoriales20` VALUES (1,'paidos'),(2,'emece'),(3,'planeta');
/*!40000 ALTER TABLE `editoriales20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales3`
--

DROP TABLE IF EXISTS `editoriales3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales3` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales3`
--

LOCK TABLES `editoriales3` WRITE;
/*!40000 ALTER TABLE `editoriales3` DISABLE KEYS */;
INSERT INTO `editoriales3` VALUES (1,'paidos'),(9,'emece'),(3,'planeta'),(4,'Plaza & Janes');
/*!40000 ALTER TABLE `editoriales3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales4`
--

DROP TABLE IF EXISTS `editoriales4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales4` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales4`
--

LOCK TABLES `editoriales4` WRITE;
/*!40000 ALTER TABLE `editoriales4` DISABLE KEYS */;
INSERT INTO `editoriales4` VALUES (1,'paidos'),(2,'emece'),(3,'planeta'),(4,'Plaza & Janes');
/*!40000 ALTER TABLE `editoriales4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `documento` char(8) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `domicilio` varchar(20) DEFAULT NULL,
  `fechaingreso` date DEFAULT NULL,
  `seccion` varchar(20) DEFAULT NULL,
  `sueldo` decimal(6,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('20111222','Hector Pereyra','Caseros 987','1995-04-01','Sistemas',1400.00),('20555444','Laura Torres','San Martin 1122','2000-05-15','Secretaría',1000.00),('22333111','Juan Perez','Colon 123','1990-02-01','Gerencia',2000.00),('25444444','Susana Morales','Avellaneda 345','1995-04-01','Sistemas',1500.00),('30000222','Luis Luque','Urquiza 456','1980-09-01','Contaduría',1400.00),('30000234','Alberto Soto','Peru 232','2003-08-15','Secretaría',1000.00),('30154269','Oscar Mendez','Colon 1245','2004-06-23','Relaciones públicas',1100.00);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos`
--

DROP TABLE IF EXISTS `inscriptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos` (
  `documento` char(9) NOT NULL DEFAULT '',
  `deporte` varchar(30) NOT NULL DEFAULT '',
  `año` year(4) NOT NULL DEFAULT '0000',
  `matricula` char(1) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `domicilio` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos`
--

LOCK TABLES `inscriptos` WRITE;
/*!40000 ALTER TABLE `inscriptos` DISABLE KEYS */;
INSERT INTO `inscriptos` VALUES ('22333444','natacion',2005,'s','juan perez','colon 234'),('22333444','natacion',2006,'n','juan perez','colon 234'),('23333444','natacion',2005,'s','maria lopez','sarmiento 465'),('23333444','natacion',2006,'s','maria lopez','sarmiento 465'),('23333444','tenis',2006,'s','maria lopez','sarmiento 465'),('24333444','basquet',2006,'n','antonio juarez','caseros 980'),('24333444','tenis',2006,'n','antonio juarez','caseros 980'),('25333444','basquet',2006,'n','ana juarez','sucre 134'),('25333444','tenis',2006,'n','ana juarez','sucre 134'),('29333444','futbol',2007,'n',NULL,NULL);
/*!40000 ALTER TABLE `inscriptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos1`
--

DROP TABLE IF EXISTS `inscriptos1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos1` (
  `numerosocio` int(10) unsigned DEFAULT NULL,
  `deporte` tinyint(3) unsigned DEFAULT NULL,
  `año` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos1`
--

LOCK TABLES `inscriptos1` WRITE;
/*!40000 ALTER TABLE `inscriptos1` DISABLE KEYS */;
INSERT INTO `inscriptos1` VALUES (102,2,2006),(104,2,2006),(109,2,2006);
/*!40000 ALTER TABLE `inscriptos1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos20`
--

DROP TABLE IF EXISTS `inscriptos20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos20` (
  `documento` char(9) NOT NULL,
  `codigocarrera` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `codigomateria` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `año` year(4) NOT NULL DEFAULT '0000',
  `cuota` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos20`
--

LOCK TABLES `inscriptos20` WRITE;
/*!40000 ALTER TABLE `inscriptos20` DISABLE KEYS */;
INSERT INTO `inscriptos20` VALUES ('22333444',1,1,2005,'s'),('22333444',1,3,2006,'n'),('23222222',1,1,2005,'s'),('24555666',1,1,2005,'s'),('25000999',1,1,2005,'s'),('25000999',2,1,2006,'n'),('25000999',2,2,2006,'s'),('30222333',2,1,2006,'s');
/*!40000 ALTER TABLE `inscriptos20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos25`
--

DROP TABLE IF EXISTS `inscriptos25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos25` (
  `numerosocio` int(10) unsigned NOT NULL DEFAULT '0',
  `deporte` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `año` year(4) NOT NULL,
  `cuota` char(1) DEFAULT NULL,
  PRIMARY KEY (`numerosocio`,`deporte`,`año`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos25`
--

LOCK TABLES `inscriptos25` WRITE;
/*!40000 ALTER TABLE `inscriptos25` DISABLE KEYS */;
INSERT INTO `inscriptos25` VALUES (102,1,2006,'s'),(102,2,2006,'s'),(104,2,2006,'s'),(104,3,2006,'s'),(106,1,2006,'s'),(109,2,2006,'s');
/*!40000 ALTER TABLE `inscriptos25` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos5`
--

DROP TABLE IF EXISTS `inscriptos5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos5` (
  `documento` char(9) NOT NULL,
  `codigocarrera` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `codigomateria` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `año` year(4) NOT NULL DEFAULT '0000',
  `cuota` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos5`
--

LOCK TABLES `inscriptos5` WRITE;
/*!40000 ALTER TABLE `inscriptos5` DISABLE KEYS */;
INSERT INTO `inscriptos5` VALUES ('22333444',1,1,2005,'s'),('22333444',1,2,2005,'s'),('22333444',1,3,2006,'n'),('23222222',1,1,2005,'s'),('23222222',1,2,2006,'s'),('24555666',1,1,2005,'s'),('25000999',1,1,2005,'s'),('25000999',1,2,2005,'s'),('25000999',2,1,2006,'n'),('25000999',2,2,2006,'s'),('30222333',2,1,2006,'s');
/*!40000 ALTER TABLE `inscriptos5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos60`
--

DROP TABLE IF EXISTS `inscriptos60`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos60` (
  `numerosocio` int(10) unsigned DEFAULT NULL,
  `deporte` tinyint(3) unsigned DEFAULT NULL,
  `año` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos60`
--

LOCK TABLES `inscriptos60` WRITE;
/*!40000 ALTER TABLE `inscriptos60` DISABLE KEYS */;
INSERT INTO `inscriptos60` VALUES (102,1,2006),(102,2,2006),(104,2,2006),(104,3,2006),(106,1,2006),(109,2,2006);
/*!40000 ALTER TABLE `inscriptos60` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `codigo` int(10) unsigned NOT NULL DEFAULT '0',
  `titulo` varchar(40) NOT NULL,
  `autor` varchar(40) NOT NULL DEFAULT 'desconocido',
  `precio` decimal(5,2) unsigned DEFAULT NULL,
  `editorial` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'el aleph','borges',43.50,'planeta'),(2,'alicia en el pais de las maravillas','lewis carroll',33.50,'emece'),(3,'aprenda php','mario perez',55.80,'paidos'),(4,'java en 10 minutos','juan lopez',88.00,'paidos'),(5,'alicia atraves del espejo','lewis carroll',15.50,'paidos'),(6,'cervantes y el quijote','borges - bioy casares',25.50,'planeta'),(9,'metafisica','Borges',50.00,'planeta'),(10,'krull','lewis carroll',40.00,'planeta');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros1`
--

DROP TABLE IF EXISTS `libros1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros1` (
  `codigo` int(10) unsigned NOT NULL DEFAULT '0',
  `titulo` varchar(40) NOT NULL,
  `autor` varchar(40) NOT NULL DEFAULT 'desconocido',
  `codigoeditorial` tinyint(3) unsigned NOT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros1`
--

LOCK TABLES `libros1` WRITE;
/*!40000 ALTER TABLE `libros1` DISABLE KEYS */;
INSERT INTO `libros1` VALUES (2,'alicia en el pais de las maravillas','lewis carroll',9,33.50),(3,'aprenda php','mario perez',1,55.80),(4,'java en 10 minutos','juan lopez',1,88.00),(5,'alicia atraves del espejo','lewis carroll',1,15.50);
/*!40000 ALTER TABLE `libros1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros20`
--

DROP TABLE IF EXISTS `libros20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros20` (
  `codigo` int(10) unsigned NOT NULL DEFAULT '0',
  `titulo` varchar(20) DEFAULT NULL,
  `autor` varchar(20) DEFAULT NULL,
  `codigoeditorial` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros20`
--

LOCK TABLES `libros20` WRITE;
/*!40000 ALTER TABLE `libros20` DISABLE KEYS */;
INSERT INTO `libros20` VALUES (1,'el aleph','borges',2),(2,'alicia en el pais de','lewis carroll',1),(3,'matematicas estas ah','paenza',2),(4,'martin fierro','jose hernandez',3),(5,'martin fierro','jose hernandez',2);
/*!40000 ALTER TABLE `libros20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros30`
--

DROP TABLE IF EXISTS `libros30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros30` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(20) DEFAULT NULL,
  `autor` varchar(20) DEFAULT NULL,
  `codigoeditorial` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros30`
--

LOCK TABLES `libros30` WRITE;
/*!40000 ALTER TABLE `libros30` DISABLE KEYS */;
INSERT INTO `libros30` VALUES (1,'el aleph','borges',2),(2,'alicia en el pais de','lewis carroll',1),(3,'matematicas estas ah','paenza',2),(4,'martin fierro','jose hernandez',3),(5,'martin fierro','jose hernandez',2),(6,'aprenda php','mario molina',9);
/*!40000 ALTER TABLE `libros30` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros40`
--

DROP TABLE IF EXISTS `libros40`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros40` (
  `codigo` int(10) unsigned NOT NULL DEFAULT '0',
  `titulo` varchar(20) DEFAULT NULL,
  `autor` varchar(20) DEFAULT NULL,
  `codigoeditorial` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros40`
--

LOCK TABLES `libros40` WRITE;
/*!40000 ALTER TABLE `libros40` DISABLE KEYS */;
INSERT INTO `libros40` VALUES (2,'alicia en el pais de','lewis carroll',1),(4,'martin fierro','jose hernandez',3),(6,'aprenda php','mario molina',9);
/*!40000 ALTER TABLE `libros40` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `codigocarrera` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) DEFAULT NULL,
  `profesor` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,1,'programacion I','alfredo lopez'),(1,2,'programacion basica','alfredo lopez'),(2,1,'sistemas de datos I','bernardo garcia'),(2,2,'igles I','edit torres'),(3,1,'ingles tecnico','edit torres'),(3,2,'protocolos','hector juarez');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `morosos`
--

DROP TABLE IF EXISTS `morosos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `morosos` (
  `documento` char(9) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `morosos`
--

LOCK TABLES `morosos` WRITE;
/*!40000 ALTER TABLE `morosos` DISABLE KEYS */;
INSERT INTO `morosos` VALUES ('345','2006-08-10'),('567','2006-09-24'),('789','2006-10-06');
/*!40000 ALTER TABLE `morosos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas20`
--

DROP TABLE IF EXISTS `notas20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas20` (
  `documento` char(8) NOT NULL,
  `nota` decimal(4,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas20`
--

LOCK TABLES `notas20` WRITE;
/*!40000 ALTER TABLE `notas20` DISABLE KEYS */;
INSERT INTO `notas20` VALUES ('22333445',7.00),('23555666',8.00),('24000333',3.00),('25222111',7.00),('22333445',7.00),('23555666',9.00),('24000333',4.00),('22333445',6.00),('23555666',10.00),('24000333',3.00),('25222111',9.00),('23555666',10.00);
/*!40000 ALTER TABLE `notas20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obrassociales`
--

DROP TABLE IF EXISTS `obrassociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obrassociales` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `domicilio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obrassociales`
--

LOCK TABLES `obrassociales` WRITE;
/*!40000 ALTER TABLE `obrassociales` DISABLE KEYS */;
INSERT INTO `obrassociales` VALUES (1,'pami','colon 345'),(2,'ipam','sucre 98'),(3,'osdop','avellaneda 267');
/*!40000 ALTER TABLE `obrassociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obrassociales1`
--

DROP TABLE IF EXISTS `obrassociales1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obrassociales1` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(20) DEFAULT NULL,
  `domicilio` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obrassociales1`
--

LOCK TABLES `obrassociales1` WRITE;
/*!40000 ALTER TABLE `obrassociales1` DISABLE KEYS */;
INSERT INTO `obrassociales1` VALUES (2,'ipam','sucre 98'),(3,'osdop','avellaneda 267');
/*!40000 ALTER TABLE `obrassociales1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacientes` (
  `documento` char(9) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `domicilio` varchar(20) DEFAULT NULL,
  `codigoobrasocial` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES ('22333444','juan lopez','guemes 235',1),('23444555','analia juarez','avellaneda 367',1),('24555666','juan lopez','guemes 235',2),('25666777','jose ferrero','urquiza 312',3),('26777888','hector garcia','caseros 411',3),('27888999','susana duarte','peru 211',3);
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes1`
--

DROP TABLE IF EXISTS `pacientes1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacientes1` (
  `documento` char(9) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `domicilio` varchar(20) DEFAULT NULL,
  `codigoobrasocial` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes1`
--

LOCK TABLES `pacientes1` WRITE;
/*!40000 ALTER TABLE `pacientes1` DISABLE KEYS */;
INSERT INTO `pacientes1` VALUES ('24555666','juan lopez','guemes 235',2),('25666777','jose ferrero','urquiza 312',3),('26777888','hector garcia','caseros 411',3),('27888999','susana duarte','peru 211',3);
/*!40000 ALTER TABLE `pacientes1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesores` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `domicilio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'tenis','1'),(2,'natacion','2'),(3,'basquet','3'),(4,'futbol','1');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores1`
--

DROP TABLE IF EXISTS `profesores1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesores1` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `domicilio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores1`
--

LOCK TABLES `profesores1` WRITE;
/*!40000 ALTER TABLE `profesores1` DISABLE KEYS */;
INSERT INTO `profesores1` VALUES (1,'alfredo perez','sarmiento 984'),(2,'betina molina','sucre 356'),(4,'daniel morales','salta 1234');
/*!40000 ALTER TABLE `profesores1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores60`
--

DROP TABLE IF EXISTS `profesores60`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesores60` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(20) DEFAULT NULL,
  `domicilio` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores60`
--

LOCK TABLES `profesores60` WRITE;
/*!40000 ALTER TABLE `profesores60` DISABLE KEYS */;
INSERT INTO `profesores60` VALUES (1,'alfredo perez','sarmiento 984'),(2,'betina molina','sucre 356'),(3,'carlos garcia','urquiza 209'),(4,'daniel morales','salta 1234');
/*!40000 ALTER TABLE `profesores60` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias20`
--

DROP TABLE IF EXISTS `provincias20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias20` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias20`
--

LOCK TABLES `provincias20` WRITE;
/*!40000 ALTER TABLE `provincias20` DISABLE KEYS */;
INSERT INTO `provincias20` VALUES (2,'santa fe'),(3,'corrintes'),(4,'misiones'),(5,'salta'),(6,'buenos aires'),(7,'neuquen'),(10,'cordoba');
/*!40000 ALTER TABLE `provincias20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias30`
--

DROP TABLE IF EXISTS `provincias30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias30` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias30`
--

LOCK TABLES `provincias30` WRITE;
/*!40000 ALTER TABLE `provincias30` DISABLE KEYS */;
INSERT INTO `provincias30` VALUES (2,'santa fe'),(3,'corrintes'),(4,'misiones'),(5,'salta'),(6,'buenos aires'),(7,'neuquen'),(10,'cordoba');
/*!40000 ALTER TABLE `provincias30` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios`
--

DROP TABLE IF EXISTS `socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socios` (
  `documento` char(8) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios`
--

LOCK TABLES `socios` WRITE;
/*!40000 ALTER TABLE `socios` DISABLE KEYS */;
INSERT INTO `socios` VALUES ('22333444','juan perez','colon 234'),('23333444','maria lopez','sarmiento 465'),('24333444','antonio juarez','caseros 980'),('25333444','ana juarez','sucre 134'),('26333444','sofia herrero','avellaneda 1234');
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios25`
--

DROP TABLE IF EXISTS `socios25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socios25` (
  `documento` char(9) NOT NULL DEFAULT '',
  `nombre` varchar(20) DEFAULT NULL,
  `domicilio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios25`
--

LOCK TABLES `socios25` WRITE;
/*!40000 ALTER TABLE `socios25` DISABLE KEYS */;
INSERT INTO `socios25` VALUES ('234','juan lopez','colon 345'),('456','juan perez','urquiza 356'),('678','juan lopez','avellaneda 234');
/*!40000 ALTER TABLE `socios25` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `nombre` varchar(20) DEFAULT NULL,
  `clave` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('arturo venavides','ñÂÂ'),('andres rojas','Rt?e');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `IngresarDatos`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `IngresarDatos` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `IngresarDatos`;

--
-- Table structure for table `favores`
--

DROP TABLE IF EXISTS `favores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favores` (
  `PK_idFavores` int(7) unsigned NOT NULL DEFAULT '0',
  `FK_documento` char(12) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `descripcion` text,
  `monto` int(7) DEFAULT NULL,
  PRIMARY KEY (`PK_idFavores`),
  KEY `FK_documento` (`FK_documento`),
  CONSTRAINT `favores_ibfk_1` FOREIGN KEY (`FK_documento`) REFERENCES `usuario` (`PK_documento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favores`
--

LOCK TABLES `favores` WRITE;
/*!40000 ALTER TABLE `favores` DISABLE KEYS */;
/*!40000 ALTER TABLE `favores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `PK_idRoles` int(7) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(20) DEFAULT NULL,
  `FK_documento` char(12) DEFAULT NULL,
  PRIMARY KEY (`PK_idRoles`),
  KEY `FK_documento` (`FK_documento`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`FK_documento`) REFERENCES `usuario` (`PK_documento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `PK_documento` char(12) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `tipoDedocumento` enum('tarjeta de identidad','cedula de ciudadania') DEFAULT NULL,
  `fechaDenacimiento` date DEFAULT NULL,
  `ciudadDenacimiento` varchar(20) DEFAULT NULL,
  `genero` enum('femenino','masculino') DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `referencias` text,
  `ciudadDondevive` varchar(20) DEFAULT NULL,
  `direccionRecidencia` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PK_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `libros`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `libros` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `libros`;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `codigoprovincia` tinyint(3) unsigned DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales` (
  `codigo` char(1) DEFAULT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

LOCK TABLES `editoriales` WRITE;
/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
INSERT INTO `editoriales` VALUES ('2','emece'),('1','planeta'),('2','paidos');
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) NOT NULL,
  `autor` varchar(30) NOT NULL DEFAULT 'desconocido',
  `codigoeditorial` char(1) DEFAULT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL,
  `cantidad` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'el aleph','borge','2',4.55,10),(2,'alicia en el pais de las maravillas','lewis carroll','2',11.55,2),(3,'martin fierro','jose hernandez','1',7.12,4);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `prueba`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `prueba` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `prueba`;

--
-- Table structure for table `bien`
--

DROP TABLE IF EXISTS `bien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bien` (
  `id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL DEFAULT 'desconocido',
  `apellido` varchar(30) NOT NULL DEFAULT 'desconocido',
  `precio` decimal(5,2) unsigned NOT NULL DEFAULT '3.00',
  `estadocivil` enum('soltero','casado','viudo','novio') NOT NULL,
  `idiomas` set('ingles','italiano','portugues') DEFAULT NULL,
  `fechaprestamo` date DEFAULT NULL,
  `fechadevolucion` date DEFAULT NULL,
  `historia` text,
  `histo` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bien`
--

LOCK TABLES `bien` WRITE;
/*!40000 ALTER TABLE `bien` DISABLE KEYS */;
/*!40000 ALTER TABLE `bien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bien3`
--

DROP TABLE IF EXISTS `bien3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bien3` (
  `id` int(6) NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL DEFAULT '',
  `costo` decimal(5,2) NOT NULL DEFAULT '6.90',
  `estadocivil` enum('soltero','casado','viudo','ninguno') NOT NULL,
  `idiomas` set('ingles','italiano','portugues') NOT NULL,
  PRIMARY KEY (`id`,`nombre`,`costo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bien3`
--

LOCK TABLES `bien3` WRITE;
/*!40000 ALTER TABLE `bien3` DISABLE KEYS */;
/*!40000 ALTER TABLE `bien3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `prueba1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `prueba1` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `prueba1`;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
  `id` int(10) unsigned zerofill DEFAULT NULL,
  `legajo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `documento` char(8) NOT NULL,
  `domicilio` varchar(40) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `provincia` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`legajo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos1`
--

DROP TABLE IF EXISTS `alumnos1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos1` (
  `legajo` char(9) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `promedio` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos1`
--

LOCK TABLES `alumnos1` WRITE;
/*!40000 ALTER TABLE `alumnos1` DISABLE KEYS */;
INSERT INTO `alumnos1` VALUES ('3456','perez luis',8.50),('3556','garcia ana',7.00),('3656','ludueña juan',9.60),('2756','moreno gabriela',4.80),('4856','morales hugo',3.20),('7856','gomez susana',6.40);
/*!40000 ALTER TABLE `alumnos1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amigos`
--

DROP TABLE IF EXISTS `amigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amigos` (
  `nombre` varchar(40) DEFAULT NULL,
  `domicilio` varchar(40) DEFAULT NULL,
  `telefono` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amigos`
--

LOCK TABLES `amigos` WRITE;
/*!40000 ALTER TABLE `amigos` DISABLE KEYS */;
INSERT INTO `amigos` VALUES ('Juancito',NULL,'4565657'),('Patricia',NULL,'4223344');
/*!40000 ALTER TABLE `amigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactos` (
  `nombre` varchar(40) DEFAULT NULL,
  `domicilio` varchar(40) DEFAULT NULL,
  `telefono` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
INSERT INTO `contactos` VALUES ('perez luis',NULL,'4565657'),('lopez',NULL,'4223344');
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tema` varchar(30) NOT NULL,
  `dias` set('lunes','martes','miercoles','jueves','viernes','sabado') NOT NULL,
  `horario` enum('AM','PM') NOT NULL,
  `clases` tinyint(3) unsigned DEFAULT '1',
  `fechadeinicio` date DEFAULT NULL,
  `costo` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'PHP basico','lunes,martes,miercoles','AM',18,'2006-08-07',200.00),(2,'PHP basico','lunes,martes,miercoles','PM',18,'2006-08-14',200.00),(3,'PHP basico','sabado','AM',18,'2006-08-05',280.00),(4,'PHP avanzado','martes,jueves','AM',20,'2006-08-01',350.00),(5,'javascript','lunes,martes,miercoles','PM',15,'2006-09-11',150.00),(6,'paginas web','martes,jueves','PM',10,'2006-08-08',250.00),(7,'paginas web','sabado','AM',10,'2006-08-12',280.00),(8,'paginas web','lunes,viernes','AM',10,'2006-08-21',200.00),(9,'paginas web','lunes,martes,miercoles,jueves,viernes','AM',10,'2006-09-18',180.00),(10,'paginas web','lunes,viernes','PM',10,'2006-09-25',280.00),(11,'javascript','lunes,martes,viernes,sabado','PM',12,'2006-09-18',150.00);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `documento` char(9) NOT NULL DEFAULT '',
  `nombre` varchar(30) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `estadocivil` enum('soltero','casado','divorciado','viudo') NOT NULL,
  `sueldobasico` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('22333444','juan lopez','m','soltero',300.00),('23333444','ana acosta','f','viudo',400.00),('25333444','jose velasques','m','soltero',600.00),('26333444','liliana borrero','f','casado',800.00),('28333444','karol hernandes','f','',600.00),('29333444','muller','m','',800.00),('30333444','jimi hernandes','f','',600.00);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados1`
--

DROP TABLE IF EXISTS `empleados1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados1` (
  `documento` char(8) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `fechaingreso` date DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `sueldobasico` decimal(5,2) unsigned DEFAULT NULL,
  `hijos` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados1`
--

LOCK TABLES `empleados1` WRITE;
/*!40000 ALTER TABLE `empleados1` DISABLE KEYS */;
INSERT INTO `empleados1` VALUES ('20111222','hector pereyra','m','caseros 987','1995-04-01','1965-03-25',510.00,1),('20125478','ana gomez','f','sarmiento 975','2004-06-14','1976-09-21',350.00,2),('20555444','maria laura torres','f','san martin 1122','2000-05-15','1965-12-22',400.00,3),('22333111','juan perez','m','colon 123','1990-02-01','1970-05-10',550.00,0),('24154269','ofelia garcia','f','triunvirato 628','2004-09-23','1974-05-12',390.00,0),('25444444','susana morales','f','avellaneda 345','1995-04-01','1975-11-06',650.00,2),('30000222','luis luque','m','urquiza 456','1980-09-01','1980-03-29',700.00,3),('30000234','alberto soto','m','peru 232','2003-08-15','1989-10-10',420.00,1),('30415426','oscar torres','m','hernandez 1234','1996-04-10','1978-05-02',400.00,0),('31204060','carlos salazar','m','las brisas 234','1964-08-10','1940-08-10',800.00,10);
/*!40000 ALTER TABLE `empleados1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entradas` (
  `sala` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `capacidad` smallint(5) unsigned DEFAULT NULL,
  `entradasvendidas` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`sala`,`fecha`,`hora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
INSERT INTO `entradas` VALUES (1,'2006-05-10','20:00:00',300,50),(1,'2006-05-10','23:00:00',300,250),(2,'2006-05-10','20:00:00',400,350),(2,'2006-05-11','20:00:00',400,380),(2,'2006-05-11','23:00:00',400,400),(3,'2006-05-12','20:00:00',350,350),(3,'2006-05-12','22:30:00',350,100),(4,'2006-05-12','20:00:00',250,0);
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmuebles`
--

DROP TABLE IF EXISTS `inmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inmuebles` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domicilio` varchar(40) NOT NULL,
  `barrio` varchar(30) DEFAULT NULL,
  `detalles` text,
  `historia` blob,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmuebles`
--

LOCK TABLES `inmuebles` WRITE;
/*!40000 ALTER TABLE `inmuebles` DISABLE KEYS */;
INSERT INTO `inmuebles` VALUES (1,'sucre 346','centro','patio,3 dormitorios,garage doble,pileta,asador,living,cocina,comedor,escritorio,2 baños','2 Dormitorios, problemas de humedad'),(2,'caseros 345','alberdi','2 dormitorios, problemas de humedad',NULL),(3,'sarmiento 832','Gral. paz','3 dormitorios, garage, 2 patios',NULL),(4,'avellaneda 384','centro','2 patios, 2 dormitorios, garage',NULL);
/*!40000 ALTER TABLE `inmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) DEFAULT NULL,
  `autor` varchar(30) DEFAULT NULL,
  `editorial` varchar(30) DEFAULT NULL,
  `temas` blob,
  `precio` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'aprenda php','mario molina','emece','Instalacion de PHP.Palabras reservadas. Sentencias basicas.Definicion de variables',45.60),(2,'java en 10 minutos','mario molina','planeta','Instalacion de Java en Windows.Instalacion de Java en Linux.Palabras reservadas.Sentencias basicas.Definir variables.',55.00),(3,'php desde cero','joaquin perez','planeta','instalacion de php.instrucciones basicas.definicion de variables.',50.00);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luz`
--

DROP TABLE IF EXISTS `luz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luz` (
  `documento` char(9) NOT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `monto` decimal(5,2) unsigned DEFAULT NULL,
  `vencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luz`
--

LOCK TABLES `luz` WRITE;
/*!40000 ALTER TABLE `luz` DISABLE KEYS */;
INSERT INTO `luz` VALUES ('20101010','mercedes',100.00,'2014-08-20'),('21101010','chicala',100.00,'2014-08-29'),('22101010','galindo',100.00,'2014-08-10'),('23101010','candido',100.00,'2014-08-29'),('24101010','santa ines',100.00,'2014-08-15'),('25101010','los dujos',100.00,'2014-08-30'),('26101010','martires',100.00,'2014-08-12'),('27101010','comuneros',100.00,'2014-09-10'),('28101010','centro',100.00,'2014-07-10'),('29101010','altico',100.00,'2014-10-10'),('20101010','mercedes',300.00,'2014-01-10'),('20101010','mercedes',300.00,'2014-04-10');
/*!40000 ALTER TABLE `luz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peliculas` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `autor` varchar(30) DEFAULT NULL,
  `duracion` tinyint(3) unsigned DEFAULT NULL,
  `sinopsis` text,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` VALUES (1,'mentes que brillan','jodie foster',120,'El no entiende al mundo ni el  mundo lo entiende a él, es un niño superdotado.La escuela especial a la que asiste tampoco resuelve los problemas del niño.Su madre hará todo lo que esté a su alcance para ayudarlo. Drama'),(2,'charlie y la fabrica de chocol','J. Deep',120,'Un niño llamado Charlie tiene la ilusión de encontrar uno de los 5 tickets del concurso para entrar a la fabulosa fábrica de chocolates del excéntrico Willy Wonka y descubrir el misterio de sus golosinas. Aventuras');
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulantes`
--

DROP TABLE IF EXISTS `postulantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postulantes` (
  `numero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documento` char(9) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `estudios` enum('ninguno','primario','secundario','terciario','universitario') DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulantes`
--

LOCK TABLES `postulantes` WRITE;
/*!40000 ALTER TABLE `postulantes` DISABLE KEYS */;
INSERT INTO `postulantes` VALUES (1,'22255265','juana pereyra','universitario'),(2,'2298765','javier gutierres','universitario'),(3,'2298765','javier gutierres',''),(4,'2298765','javier gutierres',''),(5,'2298765','javier gutierres',''),(6,'23333444','jairo perez','ninguno'),(7,'24333444','mario luna','primario'),(8,'25333444','andres griego','secundario'),(9,'26333444','sergio andrade','terciario'),(10,'27333444','arnulfo ramires','universitario'),(11,'28333444','leidi valenzuela','');
/*!40000 ALTER TABLE `postulantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulantes1`
--

DROP TABLE IF EXISTS `postulantes1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postulantes1` (
  `numero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documento` char(9) DEFAULT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `estudios` enum('ninguno','primario','secundario','terciario','universitario') NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulantes1`
--

LOCK TABLES `postulantes1` WRITE;
/*!40000 ALTER TABLE `postulantes1` DISABLE KEYS */;
INSERT INTO `postulantes1` VALUES (1,'22333444','ana acosta','f','primario'),(2,'22433444','mariana mercado','m','universitario'),(3,'22333234','luis lopes','m','ninguno'),(4,'556677443','diego wolfgang','m','secundario'),(5,'556677443','karl scnheider','m','');
/*!40000 ALTER TABLE `postulantes1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulantes3`
--

DROP TABLE IF EXISTS `postulantes3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postulantes3` (
  `cantidad` smallint(5) unsigned NOT NULL DEFAULT '20',
  `numero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documento` char(9) DEFAULT NULL,
  `costo` smallint(6) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `idioma` set('ingles','italiano','portugues') DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulantes3`
--

LOCK TABLES `postulantes3` WRITE;
/*!40000 ALTER TABLE `postulantes3` DISABLE KEYS */;
INSERT INTO `postulantes3` VALUES (0,1,'22555444',0,'ana acosta','ingles'),(0,2,'23555444',0,'juanita','ingles,italiano'),(0,3,'23555444',0,'juanita','ingles,italiano,portugues'),(0,4,'26555444',0,'luisa','ingles,portugues'),(0,5,'29555444',0,'maria','ingles,italiano,portugues'),(0,6,'30333444',0,'maria','ingles'),(0,7,'31333444',0,'guadalupe','italiano'),(0,8,'32333444',0,'mario','ingles,italiano'),(0,9,'33333444',0,'schneider','portugues'),(0,10,'34333444',0,'muller','ingles,portugues'),(0,11,'35333444',0,'michael','italiano,portugues'),(0,12,'36333444',0,'esnaider','ingles,italiano,portugues');
/*!40000 ALTER TABLE `postulantes3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulantes4`
--

DROP TABLE IF EXISTS `postulantes4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postulantes4` (
  `numero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documento` char(9) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `idioma` set('ingles','italiano','portugues') NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulantes4`
--

LOCK TABLES `postulantes4` WRITE;
/*!40000 ALTER TABLE `postulantes4` DISABLE KEYS */;
INSERT INTO `postulantes4` VALUES (1,'22555444','anan acosta','ingles'),(2,'23555444','juana pereyra','ingles,italiano'),(3,'24555444','andrea garcia','ingles,italiano'),(4,'25555444','diego morales','ingles,italiano'),(5,'26555444','diana herrero',''),(6,'27555444','pedro perez',''),(7,'28555444','nicolas duarte',''),(8,'30555444','ines figueroa',''),(9,'31555444','bien',''),(10,'32555444','esteban juares','ingles,italiano,portugues');
/*!40000 ALTER TABLE `postulantes4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos` (
  `id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) DEFAULT NULL,
  `editorial` varchar(40) DEFAULT NULL,
  `fechaprestamo` date DEFAULT NULL,
  `fechadevolucion` date DEFAULT NULL,
  `precio` decimal(6,2) unsigned DEFAULT NULL,
  `cantidad` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (000001,'geografia','planeta','2014-08-10','2014-08-20',1234.24,100),(000002,'filosofia','emece','2014-08-26','2014-08-30',100.50,200),(000003,'geografia','planeta','2014-08-10','2014-08-20',1234.24,100),(000004,'filosofia','emece','2014-08-26','2014-08-30',100.50,200),(000005,'historia','emece','2014-08-26','2014-09-15',2000.50,300),(000006,'filosofia',NULL,'2014-08-29','2014-10-29',NULL,NULL),(000007,'algebra',NULL,'2010-04-10','2012-04-10',NULL,NULL),(000008,'sociales','planeta','2014-09-02','2014-09-10',300.20,100),(000009,'metafisica','planeta','2014-08-10','2014-08-20',400.00,390);
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba20`
--

DROP TABLE IF EXISTS `prueba20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prueba20` (
  `id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL DEFAULT 'desconocido',
  `apellido` varchar(30) NOT NULL DEFAULT 'desconocido',
  `fechaingreso` date DEFAULT NULL,
  `fechasalida` date DEFAULT NULL,
  `estadocivil` enum('soltero','casado','viudo','ninguno') NOT NULL,
  `idiomas` set('ingles','italiano','portugues') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba20`
--

LOCK TABLES `prueba20` WRITE;
/*!40000 ALTER TABLE `prueba20` DISABLE KEYS */;
INSERT INTO `prueba20` VALUES (000001,'evelio','gutierres','2011-08-10','2014-08-10','soltero','ingles'),(000002,'marco','salazar','2010-08-10','2014-08-10','casado','ingles,italiano');
/*!40000 ALTER TABLE `prueba20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba30`
--

DROP TABLE IF EXISTS `prueba30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prueba30` (
  `id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `documento` varchar(30) DEFAULT NULL,
  `estadocivil` enum('ninguno','soltero','casado','viudo') NOT NULL,
  `idiomas` set('ingles','italiano','portugues') NOT NULL,
  `historia` blob NOT NULL,
  `detalles` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba30`
--

LOCK TABLES `prueba30` WRITE;
/*!40000 ALTER TABLE `prueba30` DISABLE KEYS */;
INSERT INTO `prueba30` VALUES (000001,'alejandor gutierres','XDF123','soltero','italiano','aprenda java con sus variables definidas y sus constantes','aprenda java con sus variables definidas y sus constantes'),(000002,'carlos holguin','NML123','casado','ingles,italiano','Aprenda php que es kool','aprenda java con sus variables definidas y sus constantes');
/*!40000 ALTER TABLE `prueba30` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba50`
--

DROP TABLE IF EXISTS `prueba50`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prueba50` (
  `id` int(6) unsigned zerofill NOT NULL DEFAULT '000000',
  `nombre` varchar(30) NOT NULL DEFAULT '',
  `documento` varchar(30) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `edad` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`nombre`,`edad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba50`
--

LOCK TABLES `prueba50` WRITE;
/*!40000 ALTER TABLE `prueba50` DISABLE KEYS */;
/*!40000 ALTER TABLE `prueba50` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculos` (
  `patente` char(6) NOT NULL,
  `tipo` char(4) DEFAULT NULL,
  `horadellegada` time NOT NULL,
  `horadesalida` time DEFAULT NULL,
  PRIMARY KEY (`patente`,`horadellegada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES ('ACD123','carr','08:30:00','09:40:00'),('AKL098','carr','08:45:00','15:10:00'),('DRT123','carr','15:30:00',NULL),('FRT545','moto','19:45:00',NULL),('GTY154','carr','20:30:00','21:00:00'),('HGF123','carr','09:30:00','18:40:00');
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `repasar`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `repasar` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `repasar`;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
  `legajo` char(9) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `promedio` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES ('3456','perez luis',8.50),('3556','garcia ana',7.00),('3656','ludueña juan',9.60),('2756','moreno gabriela',4.80),('4856','morales hugo',3.20),('7856','gomez susana',6.40);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT 'desconocido',
  `apellido` varchar(20) NOT NULL,
  `telefono` int(9) unsigned DEFAULT NULL,
  `año` year(4) DEFAULT NULL,
  `fechadenacimiento` date DEFAULT NULL,
  `estadocivil` enum('soltero','casado','viudo') DEFAULT NULL,
  `idiomas` set('english','italian','portug') DEFAULT NULL,
  `sueldobasico` decimal(5,2) DEFAULT NULL,
  `hijos` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (00001,'carlos','polanco',34532452,1990,'1982-06-03','soltero','english,italian,portug',925.20,3),(00002,'fernando','',4235452,1995,'1982-12-03','casado','english,italian',520.95,1),(00003,'desconocido','reiseger',4235452,1995,'1982-12-03','casado','english,italian',520.95,1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente1`
--

DROP TABLE IF EXISTS `cliente1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente1` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `telefono` int(9) DEFAULT NULL,
  `año` year(4) DEFAULT NULL,
  `fechadenacimiento` date DEFAULT NULL,
  `estadocivil` enum('soltero','casado','viudo') DEFAULT NULL,
  `idiomas` set('ingles','italiano','portugues') DEFAULT NULL,
  `sueldobasico` decimal(5,2) unsigned DEFAULT NULL,
  `hijos` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente1`
--

LOCK TABLES `cliente1` WRITE;
/*!40000 ALTER TABLE `cliente1` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente3`
--

DROP TABLE IF EXISTS `cliente3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente3` (
  `id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT 'desconocido',
  `apellido` varchar(20) DEFAULT NULL,
  `telefono` int(9) DEFAULT '23456',
  `año` year(4) DEFAULT NULL,
  `fechadenacimiento` date DEFAULT NULL,
  `estadocivil` enum('soltero','casado','viudo') DEFAULT 'soltero',
  `idiomas` set('ingles','italiano','portugues') DEFAULT NULL,
  `sueldobasico` decimal(5,2) unsigned DEFAULT NULL,
  `hijos` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente3`
--

LOCK TABLES `cliente3` WRITE;
/*!40000 ALTER TABLE `cliente3` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente4`
--

DROP TABLE IF EXISTS `cliente4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente4` (
  `id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT 'deesconocido',
  `apellido` varchar(20) DEFAULT NULL,
  `telefono` int(9) unsigned DEFAULT '23456',
  `año` year(4) DEFAULT NULL,
  `fechadenacimiento` date DEFAULT NULL,
  `estadocivil` enum('soltero','casado','viudo') DEFAULT 'soltero',
  `idiomas` set('ingles','italiano','portugues') NOT NULL,
  `sueldobasico` decimal(5,2) unsigned DEFAULT NULL,
  `hijos` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente4`
--

LOCK TABLES `cliente4` WRITE;
/*!40000 ALTER TABLE `cliente4` DISABLE KEYS */;
INSERT INTO `cliente4` VALUES (00001,'jefferson','baldion bohorques',8767570,2001,'1995-12-25','soltero','ingles,italiano',412.35,4),(00002,'matias','bonilla',9528450,2009,'1992-01-12','casado','ingles',213.12,2),(00003,'pedro','ruso baldion',8767570,2001,'1995-12-25','casado','ingles,italiano',412.49,4),(00004,'matias','bonilla',9528450,2009,'1992-01-12','viudo','portugues',213.50,2),(00005,'pedro','baldion',8767570,2001,'1995-12-25','soltero','ingles,italiano',412.72,4),(00006,'matias','bonilla',9528450,2009,'1992-01-12','viudo','portugues',213.63,3),(00007,'arturo','bonilla',32545353,1995,'1990-06-20','soltero','ingles,italiano,portugues',525.20,3),(00008,'mario','reiseger',4235452,1995,'1982-12-03','casado','ingles,italiano',520.95,1),(00009,'mario','cerquera',4235452,1995,'1982-12-03','soltero','ingles,italiano',520.95,2);
/*!40000 ALTER TABLE `cliente4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente5`
--

DROP TABLE IF EXISTS `cliente5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente5` (
  `id` smallint(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `tiempohora` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente5`
--

LOCK TABLES `cliente5` WRITE;
/*!40000 ALTER TABLE `cliente5` DISABLE KEYS */;
INSERT INTO `cliente5` VALUES (000001,'1990-12-20 09:16:20');
/*!40000 ALTER TABLE `cliente5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente6`
--

DROP TABLE IF EXISTS `cliente6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente6` (
  `id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT 'desconocido',
  `apellido` varchar(20) DEFAULT NULL,
  `telefono` int(9) unsigned DEFAULT '12345',
  `año` year(4) DEFAULT NULL,
  `fechadenacimiento` date DEFAULT NULL,
  `estadocivil` enum('soltero','casado','viudo') DEFAULT 'soltero',
  `idiomas` set('ingles','italiano','portugues') DEFAULT NULL,
  `sueldobasico` decimal(5,2) unsigned DEFAULT NULL,
  `hijos` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente6`
--

LOCK TABLES `cliente6` WRITE;
/*!40000 ALTER TABLE `cliente6` DISABLE KEYS */;
INSERT INTO `cliente6` VALUES (00001,'andres','manhatan',345698,1990,'1982-06-03','soltero','ingles,italiano,portugues',234.98,3);
/*!40000 ALTER TABLE `cliente6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `documento` char(8) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `fechaingreso` date DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `sueldobasico` decimal(5,2) unsigned DEFAULT NULL,
  `hijos` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('20111222','hector pereyra','m','caseros 987','1995-04-01','1965-03-25',510.00,1),('20125478','ana gomez','f','sarmiento 975','2004-06-14','1976-09-21',350.00,2),('20555444','maria laura torres','f','san martin 1122','2000-05-15','1965-12-22',400.00,3),('22333111','juan perez','m','colon 123','1990-02-01','1970-05-10',550.00,0),('24154269','ofelia garcia','f','triunvirato 628','2004-09-23','1974-05-12',390.00,0),('25444444','susana morales','f','avellaneda 345','1995-04-01','1975-11-06',650.00,2),('30000222','luis luque','m','urquiza 456','1980-09-01','1980-03-29',700.00,3),('30000234','alberto soto','m','peru 232','2003-08-15','1989-10-10',420.00,1),('30415426','oscar torres','m','hernandez 1234','1996-04-10','1978-05-02',400.00,0),('31204060','carlos salazar','m','las brisas 234','1964-08-10','1940-08-10',800.00,10);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmuebles`
--

DROP TABLE IF EXISTS `inmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inmuebles` (
  `codigo` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `domicilio` varchar(40) NOT NULL,
  `barrio` varchar(30) DEFAULT NULL,
  `detalles` text,
  `historia` blob,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmuebles`
--

LOCK TABLES `inmuebles` WRITE;
/*!40000 ALTER TABLE `inmuebles` DISABLE KEYS */;
INSERT INTO `inmuebles` VALUES (1,'sucre 346','centro','patio,3 dormitorios,garage doble,pileta,asador,living,cocina,comedor,escritorio,2 baños','2 Dormitorios, problemas de humedad'),(2,'caseros 345','alberdi','2 dormitorios, problemas de humedad',NULL),(3,'sarmiento 832','Gral. paz','3 dormitorios, garage, 2 patios',NULL),(4,'avellaneda 384','centro','2 patios, 2 dormitorios, garage',NULL);
/*!40000 ALTER TABLE `inmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro` (
  `id` smallint(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `titulo` varchar(20) DEFAULT NULL,
  `auto` varchar(20) DEFAULT NULL,
  `editorial` varchar(20) DEFAULT NULL,
  `precio` decimal(4,2) unsigned DEFAULT NULL,
  `cantidad` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (000001,'el aleph','borges','planeta',15.00,100),(000002,'martin fierro','jose hernandes','emece',20.20,200),(000003,'antologia poetica','j. l. borges','planeta',40.00,150),(000004,'aprenda php','mario molina','emece',18.20,200),(000005,'cervantes y el quijo','Bioy Casares - J. L.','paidos',36.40,100),(000006,'manual de php','J. C. Paez','paidos',30.80,120),(000007,'Harry potter y la pi','J. K. Rowling','paidos',45.00,50),(000008,'Harry potter y la ca','J. K. Rowling ','bien',46.00,100),(000009,'la odisea','ciceron','emece',32.40,255);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro1`
--

DROP TABLE IF EXISTS `libro1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro1` (
  `id` smallint(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL DEFAULT 'desconocido',
  `apellido` varchar(30) NOT NULL DEFAULT 'desconocido',
  `telefono` int(9) NOT NULL DEFAULT '4444',
  `fechadenacimiento` date NOT NULL DEFAULT '0000-00-00',
  `horadellegada` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro1`
--

LOCK TABLES `libro1` WRITE;
/*!40000 ALTER TABLE `libro1` DISABLE KEYS */;
INSERT INTO `libro1` VALUES (000001,'carlos','rivera',4444,'0000-00-00','00:00:00'),(000002,'andres','lopes',4444,'0000-00-00','00:00:00'),(000003,'geoani','urban',4444,'0000-00-00','00:00:00'),(000013,'sergei','arturo',4444,'0000-00-00','00:00:00'),(000015,'ana','arturo',4444,'0000-00-00','00:00:00'),(000029,'angel','arturo',4444,'0000-00-00','00:00:00');
/*!40000 ALTER TABLE `libro1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro3`
--

DROP TABLE IF EXISTS `libro3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro3` (
  `id` smallint(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `telefono` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro3`
--

LOCK TABLES `libro3` WRITE;
/*!40000 ALTER TABLE `libro3` DISABLE KEYS */;
INSERT INTO `libro3` VALUES (000001,'carlos','peres',444),(000002,'andres','orjuela',555),(000003,'geoani','cerquera',666),(000004,'sergey','lavrot',4444);
/*!40000 ALTER TABLE `libro3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro4`
--

DROP TABLE IF EXISTS `libro4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro4` (
  `id` smallint(6) unsigned zerofill NOT NULL DEFAULT '000000',
  `titulo` varchar(20) DEFAULT 'desconocido',
  `autor` varchar(30) NOT NULL DEFAULT 'desconocido',
  `editorial` varchar(20) DEFAULT NULL,
  `precio` decimal(4,2) unsigned DEFAULT NULL,
  `cantidad` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro4`
--

LOCK TABLES `libro4` WRITE;
/*!40000 ALTER TABLE `libro4` DISABLE KEYS */;
INSERT INTO `libro4` VALUES (000001,'el aleph','borges','planeta',15.00,100),(000002,'martin fierro','jose hernandes','emece',20.20,200),(000003,'antologia poetica','j. l. borges','planeta',40.00,150),(000004,'aprenda php','mario molina','emece',18.20,200),(000005,'cervantes y el quijo','Bioy Casares - J. L.','paidos',36.40,100),(000006,'manual de php','J. C. Paez','paidos',30.80,120),(000007,'Harry potter y la pi','J. K. Rowling','paidos',45.00,50),(000008,'Harry potter y la ca','J. K. Rowling ','bien',46.00,100),(000009,'la odisea','ciceron','emece',32.40,255);
/*!40000 ALTER TABLE `libro4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro6`
--

DROP TABLE IF EXISTS `libro6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro6` (
  `id` smallint(5) unsigned zerofill NOT NULL DEFAULT '00000',
  `titulo` varchar(20) DEFAULT NULL,
  `autor` varchar(30) NOT NULL DEFAULT 'desconocido',
  `editorial` varchar(20) DEFAULT NULL,
  `valor` decimal(5,2) unsigned NOT NULL DEFAULT '90.50',
  `cantidad` tinyint(3) unsigned DEFAULT '140'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro6`
--

LOCK TABLES `libro6` WRITE;
/*!40000 ALTER TABLE `libro6` DISABLE KEYS */;
INSERT INTO `libro6` VALUES (00001,'bien','sergei lavrot','planeta',23.24,140);
/*!40000 ALTER TABLE `libro6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro8`
--

DROP TABLE IF EXISTS `libro8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro8` (
  `id` smallint(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT 'desconocido',
  `apellido` varchar(30) DEFAULT 'desconocido',
  `telefono` int(9) unsigned DEFAULT '4444',
  `fechadenacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro8`
--

LOCK TABLES `libro8` WRITE;
/*!40000 ALTER TABLE `libro8` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `codigo` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) DEFAULT NULL,
  `autor` varchar(30) DEFAULT NULL,
  `editorial` varchar(30) DEFAULT NULL,
  `temas` blob,
  `precio` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'aprenda php','mario molina','emece','Instalacion de PHP.Palabras reservadas. Sentencias basicas.Definicion de variables',45.60),(2,'java en 10 minutos','mario molina','planeta','Instalacion de Java en Windows.Instalacion de Java en Linux.Palabras reservadas.Sentencias basicas.Definir variables.',55.00),(3,'php desde cero','joaquin perez','planeta','instalacion de php.instrucciones basicas.definicion de variables.',50.00);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulantes`
--

DROP TABLE IF EXISTS `postulantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postulantes` (
  `cantidad` smallint(5) unsigned NOT NULL DEFAULT '20',
  `numero` int(10) unsigned NOT NULL DEFAULT '0',
  `documento` char(9) DEFAULT NULL,
  `costo` smallint(6) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `idioma` set('ingles','italiano','portugues') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulantes`
--

LOCK TABLES `postulantes` WRITE;
/*!40000 ALTER TABLE `postulantes` DISABLE KEYS */;
INSERT INTO `postulantes` VALUES (0,1,'22555444',0,'ana acosta','ingles'),(0,2,'23555444',0,'juanita','ingles,italiano'),(0,3,'23555444',0,'juanita','ingles,italiano,portugues'),(0,4,'26555444',0,'luisa','ingles,portugues'),(0,5,'29555444',0,'maria','ingles,italiano,portugues'),(0,6,'30333444',0,'maria','ingles'),(0,7,'31333444',0,'guadalupe','italiano'),(0,8,'32333444',0,'mario','ingles,italiano'),(0,9,'33333444',0,'schneider','portugues'),(0,10,'34333444',0,'muller','ingles,portugues'),(0,11,'35333444',0,'michael','italiano,portugues'),(0,12,'36333444',0,'esnaider','ingles,italiano,portugues');
/*!40000 ALTER TABLE `postulantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba`
--

DROP TABLE IF EXISTS `prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prueba` (
  `id` smallint(7) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `horallegada` time DEFAULT NULL,
  `tiempohorallegada` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba`
--

LOCK TABLES `prueba` WRITE;
/*!40000 ALTER TABLE `prueba` DISABLE KEYS */;
INSERT INTO `prueba` VALUES (0000005,'06:34:42','1990-12-21 12:23:46'),(0000006,'02:25:19','2002-04-01 06:24:12'),(0000007,'19:35:12','2014-02-14 09:24:40'),(0000008,'06:34:42','1990-12-21 12:23:46'),(0000009,'02:25:19','2002-04-01 06:24:12'),(0000010,'19:35:12','2014-02-14 09:24:40'),(0000011,'06:34:42','1990-12-21 12:23:46'),(0000012,'02:25:19','2002-04-01 06:24:12');
/*!40000 ALTER TABLE `prueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ru`
--

DROP TABLE IF EXISTS `ru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ru` (
  `id` smallint(6) unsigned zerofill NOT NULL DEFAULT '000000',
  `titulo` varchar(20) DEFAULT NULL,
  `autor` varchar(30) NOT NULL DEFAULT 'desconocido',
  `editorial` varchar(20) DEFAULT NULL,
  `precio` decimal(4,2) unsigned DEFAULT NULL,
  `cantidad` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ru`
--

LOCK TABLES `ru` WRITE;
/*!40000 ALTER TABLE `ru` DISABLE KEYS */;
INSERT INTO `ru` VALUES (000001,'el aleph','borges','planeta',15.00,100),(000002,'martin fierro','jose hernandes','emece',20.20,200),(000003,'antologia poetica','j. l. borges','planeta',40.00,150),(000004,'aprenda php','mario molina','emece',18.20,200),(000005,'cervantes y el quijo','Bioy Casares - J. L.','paidos',36.40,100),(000006,'manual de php','J. C. Paez','paidos',30.80,120),(000007,'Harry potter y la pi','J. K. Rowling','paidos',45.00,50),(000008,'Harry potter y la ca','J. K. Rowling ','bien',46.00,100),(000009,'la odisea','ciceron','emece',32.40,255);
/*!40000 ALTER TABLE `ru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `repasar1join`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `repasar1join` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `repasar1join`;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `codigo` int(10) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `codigoprovincia` tinyint(3) unsigned DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'lopez marcos','colon 111','cordoba',1,NULL),(2,'perez ana','san martin 222','cruz del eje',1,'4578585'),(3,'garcia juan','rivadavia 333','villa maria',1,'4578445'),(4,'perez luis','sarmiento 444','rosario',2,NULL),(5,'pereyra lucas','san martin 555','crua del eje',1,'4253685'),(6,'gomez ines','san martin 666','santa fe',2,'345252525'),(7,'torres fabiola','alem 777','villa del rosario',1,'4554455'),(8,'lopez carlos','irigoyen 888','cruz del eje',1,NULL),(9,'ramos betina','san martin 999','cordoba',1,'4223366'),(10,'lopez lucas','san martin 1010','posadas',4,'457858745');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comidas`
--

DROP TABLE IF EXISTS `comidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comidas` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) DEFAULT NULL,
  `rubro` varchar(30) DEFAULT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comidas`
--

LOCK TABLES `comidas` WRITE;
/*!40000 ALTER TABLE `comidas` DISABLE KEYS */;
INSERT INTO `comidas` VALUES (1,'milanesa y fritas','plato pricipal',3.40),(2,'arroz primavera','plato pricipal',2.50),(3,'pollo','plato pricipal',2.80),(4,'flan','postre',1.00),(5,'porcion de torta','postre',2.10),(6,'gelatina','postre',0.90);
/*!40000 ALTER TABLE `comidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportes`
--

DROP TABLE IF EXISTS `deportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deportes` (
  `codigo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `profesor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportes`
--

LOCK TABLES `deportes` WRITE;
/*!40000 ALTER TABLE `deportes` DISABLE KEYS */;
INSERT INTO `deportes` VALUES (1,'tenis','tadeo torres'),(2,'natacion','natalia nores'),(3,'basquet','bautista pereyra'),(4,'paddle','bautista pereyra');
/*!40000 ALTER TABLE `deportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

LOCK TABLES `editoriales` WRITE;
/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
INSERT INTO `editoriales` VALUES (1,'paidos'),(2,'emece'),(3,'planeta'),(4,'Plaza & Janes');
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorialesduplicados`
--

DROP TABLE IF EXISTS `editorialesduplicados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editorialesduplicados` (
  `codigoeditorial` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorialesduplicados`
--

LOCK TABLES `editorialesduplicados` WRITE;
/*!40000 ALTER TABLE `editorialesduplicados` DISABLE KEYS */;
INSERT INTO `editorialesduplicados` VALUES (1,'paidos'),(2,'emece'),(3,'planeta'),(4,'sudamerica');
/*!40000 ALTER TABLE `editorialesduplicados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptos`
--

DROP TABLE IF EXISTS `inscriptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptos` (
  `documento` char(9) NOT NULL,
  `codigodeporte` varchar(20) NOT NULL,
  `año` year(4) NOT NULL DEFAULT '0000',
  `cuota` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptos`
--

LOCK TABLES `inscriptos` WRITE;
/*!40000 ALTER TABLE `inscriptos` DISABLE KEYS */;
INSERT INTO `inscriptos` VALUES ('22333444','1',2005,'s'),('22333444','1',2006,'n'),('22333444','2',2005,'s'),('23333444','1',2005,'s'),('23333444','1',2006,'s'),('23333444','2',2006,'s'),('24333444','1',2006,'s'),('24333444','3',2006,'n');
/*!40000 ALTER TABLE `inscriptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `codigo` int(10) unsigned NOT NULL DEFAULT '0',
  `titulo` varchar(40) NOT NULL,
  `autor` varchar(40) NOT NULL DEFAULT 'desconocido',
  `codigoeditorial` tinyint(3) unsigned NOT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'el aleph','borges',3,43.50),(2,'alicia en el pais de las maravillas','lewis carroll',2,33.50),(3,'aprenda php','mario perez',1,55.80),(4,'java en 10 minutos','juan lopez',1,88.00),(5,'alicia atraves del espejo','lewis carroll',1,15.50),(6,'cervantes y el quijote','borges - bioy casares',3,25.50),(9,'metafisica','Borges',3,50.00),(10,'krull','lewis carroll',3,40.00);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librosmultijoin`
--

DROP TABLE IF EXISTS `librosmultijoin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librosmultijoin` (
  `codigo` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) NOT NULL,
  `autor` varchar(30) DEFAULT 'desconocido',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librosmultijoin`
--

LOCK TABLES `librosmultijoin` WRITE;
/*!40000 ALTER TABLE `librosmultijoin` DISABLE KEYS */;
INSERT INTO `librosmultijoin` VALUES (1,'manual de 2 grado','molina manuel'),(25,'aprenda php','oscar mendez'),(42,'martin fierro','jose hernandez');
/*!40000 ALTER TABLE `librosmultijoin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postres`
--

DROP TABLE IF EXISTS `postres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postres` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) DEFAULT NULL,
  `precio` decimal(5,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postres`
--

LOCK TABLES `postres` WRITE;
/*!40000 ALTER TABLE `postres` DISABLE KEYS */;
INSERT INTO `postres` VALUES (1,'flan',1.00),(2,'porcion de torta',2.10),(3,'gelatina',0.90);
/*!40000 ALTER TABLE `postres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamomultijoin`
--

DROP TABLE IF EXISTS `prestamomultijoin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamomultijoin` (
  `documento` char(8) NOT NULL,
  `codigolibro` int(10) unsigned NOT NULL DEFAULT '0',
  `fechaprestamo` date NOT NULL,
  `fechadevolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamomultijoin`
--

LOCK TABLES `prestamomultijoin` WRITE;
/*!40000 ALTER TABLE `prestamomultijoin` DISABLE KEYS */;
INSERT INTO `prestamomultijoin` VALUES ('22333444',1,'2006-08-10','2006-08-12'),('22333444',1,'2006-08-15',NULL),('25333444',2,'2006-08-02','2006-08-05'),('25333444',25,'2006-08-10','2006-08-13'),('25333444',25,'2006-08-15',NULL),('30333444',42,'2006-08-02','2006-08-05'),('25333444',42,'2006-08-10',NULL);
/*!40000 ALTER TABLE `prestamomultijoin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias` (
  `codigo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'cordoba'),(2,'santa fe'),(3,'corrintes'),(4,'misiones'),(5,'salta'),(6,'buenos aires'),(7,'neuquen');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sociosmultijoin`
--

DROP TABLE IF EXISTS `sociosmultijoin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sociosmultijoin` (
  `documento` char(8) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sociosmultijoin`
--

LOCK TABLES `sociosmultijoin` WRITE;
/*!40000 ALTER TABLE `sociosmultijoin` DISABLE KEYS */;
INSERT INTO `sociosmultijoin` VALUES ('22333444','juan perez','colon 345'),('23333444','luis perez','caseros 940'),('25333444','ana herrero','sucre 120');
/*!40000 ALTER TABLE `sociosmultijoin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `repaso`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `repaso` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `repaso`;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas` (
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `documento` char(9) NOT NULL,
  `codigoobrasocial` tinyint(3) unsigned DEFAULT NULL,
  `medico` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`fecha`,`hora`,`medico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
INSERT INTO `consultas` VALUES ('2006-08-10','08:00:00','22333444',1,'perez'),('2006-08-10','08:30:00','25333444',1,'garcia'),('2006-08-10','09:00:00','24333444',2,'perez'),('2006-08-10','10:00:00','22333444',1,'lopez'),('2006-08-10','10:00:00','25333444',3,'perez'),('2006-08-19','08:30:00','23333444',1,'perez'),('2006-09-10','08:30:00','25333444',1,'lopez');
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `documento` char(8) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `fechaingreso` date DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `sueldobasico` decimal(5,2) unsigned DEFAULT NULL,
  `hijos` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('20111222','hector pereyra','m','caseros 987','1995-04-01','1965-03-25',510.00,1),('20125478','ana gomez','f','sarmiento 975','2004-06-14','1976-09-21',350.00,2),('20555444','maria laura torres','f','san martin 1122','2000-05-15','1965-12-22',400.00,3),('22333111','juan perez','m','colon 123','1990-02-01','1970-05-10',550.00,0),('24154269','ofelia garcia','f','triunvirato 628','2004-09-23','1974-05-12',390.00,0),('25444444','susana morales','f','avellaneda 345','1995-04-01','1975-11-06',650.00,2),('30000222','luis luque','m','urquiza 456','1980-09-01','1980-03-29',700.00,3),('30000234','alberto soto','m','peru 232','2003-08-15','1989-10-10',420.00,1),('30415426','oscar torres','m','hernandez 1234','1996-04-10','1978-05-02',400.00,0),('31204060','carlos salazar','m','las brisas 234','1964-08-10','1940-08-10',800.00,10);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos` (
  `documento` char(8) NOT NULL,
  `codigolibro` int(10) unsigned NOT NULL DEFAULT '0',
  `fechaprestamo` date NOT NULL,
  `fechadevolucion` date DEFAULT NULL,
  PRIMARY KEY (`codigolibro`,`fechaprestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES ('22333444',1,'2006-08-10','2006-08-12'),('22333444',1,'2006-08-15',NULL),('24333444',1,'2010-10-20','2020-10-20'),('25333444',2,'2006-08-02','2006-08-05'),('26333444',20,'2014-11-21','2014-11-30'),('25333444',25,'2006-08-10','2006-08-13'),('25333444',25,'2006-08-15',NULL),('30333444',42,'2006-08-02','2006-08-05'),('25333444',42,'2006-08-10',NULL),('25333444',42,'2010-10-20','2020-10-20');
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba`
--

DROP TABLE IF EXISTS `prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prueba` (
  `id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL DEFAULT 'desconocido',
  `apellido` varchar(30) NOT NULL DEFAULT 'no conosco',
  `telefono` int(9) DEFAULT '111',
  `año` year(4) DEFAULT NULL,
  `fechadenacimiento` date DEFAULT NULL,
  `estadocivil` enum('soltero','casado','divorciado','unionlibre') DEFAULT NULL,
  `idiomas` set('ingles','italiano','portugues') DEFAULT NULL,
  `cantidad` int(9) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba`
--

LOCK TABLES `prueba` WRITE;
/*!40000 ALTER TABLE `prueba` DISABLE KEYS */;
/*!40000 ALTER TABLE `prueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba1`
--

DROP TABLE IF EXISTS `prueba1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prueba1` (
  `id` tinyint(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL DEFAULT 'desconocido',
  `apellido` varchar(20) NOT NULL DEFAULT 'no conosco',
  `telefono` int(12) unsigned NOT NULL DEFAULT '111',
  `año` year(4) DEFAULT NULL,
  `fechadenacimiento` date DEFAULT NULL,
  `estadocivil` enum('soltero','casado','divorciado','unionlibre') DEFAULT NULL,
  `idiomas` set('ingles','italiano','portugues') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba1`
--

LOCK TABLES `prueba1` WRITE;
/*!40000 ALTER TABLE `prueba1` DISABLE KEYS */;
INSERT INTO `prueba1` VALUES (001,'fernando','gutierres',534534253,2014,'1981-10-24','soltero','ingles,italiano'),(002,'luisa','teruel',43224324,2014,'1990-03-12','casado','ingles,portugues'),(003,'maria','valbuena',4294967295,2014,'1994-05-20','unionlibre','ingles,italiano,portugues'),(004,'arch','linux',5564564,2014,'1990-04-16','divorciado','portugues'),(005,'isabel','valenzuela',89875676,2014,'1991-09-12','soltero','ingles,portugues'),(006,'manuela','esponia',755664,2014,'1982-03-12','divorciado','italiano');
/*!40000 ALTER TABLE `prueba1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba4`
--

DROP TABLE IF EXISTS `prueba4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prueba4` (
  `id` tinyint(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL DEFAULT 'desconocido',
  `apellido` varchar(20) NOT NULL DEFAULT 'no conosco',
  `telefono` int(12) unsigned NOT NULL DEFAULT '111',
  `año` year(4) DEFAULT NULL,
  `fechadenacimiento` date DEFAULT NULL,
  `estadocivil` enum('soltero','casado','divorciado','unionlibre') DEFAULT NULL,
  `idiomas` set('ingles','italiano','portugues') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba4`
--

LOCK TABLES `prueba4` WRITE;
/*!40000 ALTER TABLE `prueba4` DISABLE KEYS */;
INSERT INTO `prueba4` VALUES (001,'fernando','gutierres',534534253,2014,'1981-10-24','soltero','ingles,italiano'),(002,'luisa','teruel',43224324,2014,'1990-03-12','casado','ingles,portugues'),(003,'maria','valbuena',4294967295,2014,'1994-05-20','unionlibre','ingles,italiano,portugues'),(004,'arch','linux',5564564,2014,'1990-04-16','divorciado','portugues'),(005,'sant','valenzuela',89875676,2014,'1991-09-12','soltero','ingles,portugues'),(006,'manuela','esponia',755664,2014,'1982-03-12','divorciado','italiano');
/*!40000 ALTER TABLE `prueba4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba5`
--

DROP TABLE IF EXISTS `prueba5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prueba5` (
  `id` tinyint(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL DEFAULT 'desconocido',
  `apellido` varchar(20) NOT NULL DEFAULT 'no conosco',
  `telefono` int(12) unsigned NOT NULL DEFAULT '111',
  `año` year(4) DEFAULT NULL,
  `precio` decimal(6,2) NOT NULL DEFAULT '20.00',
  `fechadenacimiento` date DEFAULT NULL,
  `estadocivil` enum('soltero','casado','divorciado','unionlibre') DEFAULT NULL,
  `idiomas` set('ingles','italiano','portugues') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba5`
--

LOCK TABLES `prueba5` WRITE;
/*!40000 ALTER TABLE `prueba5` DISABLE KEYS */;
INSERT INTO `prueba5` VALUES (001,'fernando','gutierres',534534253,2014,20.00,'1981-10-24','soltero','ingles,italiano'),(002,'luisa','teruel',43224324,2014,40.60,'1990-03-12','casado','ingles,portugues'),(003,'maria','valbuena',4294967295,2014,40.40,'1994-05-20','unionlibre','ingles,italiano,portugues'),(004,'arch','linux',5564564,2014,44.10,'1990-04-16','divorciado','portugues'),(005,'sant','valenzuela',89875676,2014,90.80,'1991-09-12','soltero','ingles,portugues'),(006,'manuela','esponia',755664,2014,20.00,'1982-03-12','divorciado','italiano');
/*!40000 ALTER TABLE `prueba5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `sena`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sena` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sena`;

--
-- Current Database: `SenaIndustrial`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `SenaIndustrial` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `SenaIndustrial`;

--
-- Table structure for table `estudiantesSena`
--

DROP TABLE IF EXISTS `estudiantesSena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiantesSena` (
  `id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT 'desconocido',
  `estadocivil` enum('soltero','casado','viudo','ninguno') DEFAULT NULL,
  `idiomas` set('ingles','italiano','portugues') DEFAULT NULL,
  `fechaprestamo` date DEFAULT NULL,
  `fechadevolucion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantesSena`
--

LOCK TABLES `estudiantesSena` WRITE;
/*!40000 ALTER TABLE `estudiantesSena` DISABLE KEYS */;
INSERT INTO `estudiantesSena` VALUES (000001,'cesar','soltero','portugues','2014-08-10','2014-08-12'),(000002,'cesar','soltero','ingles,portugues','2014-08-10','2014-08-12'),(000003,'carlos','viudo','ingles,italiano,portugues','2014-09-20','2016-09-20');
/*!40000 ALTER TABLE `estudiantesSena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `tutorial`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tutorial` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tutorial`;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autores` (
  `PK_codigoAutor` varchar(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PK_codigoAutor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales` (
  `PK_codigoEditorial` varchar(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PK_codigoEditorial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

LOCK TABLES `editoriales` WRITE;
/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `PK_codigoLibro` varchar(11) NOT NULL,
  `FK_codigoAutor` varchar(11) DEFAULT NULL,
  `titulo` varchar(40) DEFAULT NULL,
  `FK_editorial` varchar(20) DEFAULT NULL,
  `edicion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PK_codigoLibro`),
  KEY `FK_editorial` (`FK_editorial`),
  KEY `FK_codigoAutor` (`FK_codigoAutor`),
  CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`FK_editorial`) REFERENCES `editoriales` (`PK_codigoEditorial`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`FK_codigoAutor`) REFERENCES `autores` (`PK_codigoAutor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamoUsuarios`
--

DROP TABLE IF EXISTS `prestamoUsuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamoUsuarios` (
  `FK_identificacionUsuario` varchar(11) DEFAULT NULL,
  `FK_codigoLibro` varchar(11) DEFAULT NULL,
  `fechaPrestamo` date DEFAULT NULL,
  `fechaDevolucion` date DEFAULT NULL,
  KEY `FK_identificacionUsuario` (`FK_identificacionUsuario`),
  KEY `FK_codigoLibro` (`FK_codigoLibro`),
  CONSTRAINT `prestamoUsuarios_ibfk_1` FOREIGN KEY (`FK_identificacionUsuario`) REFERENCES `usuarios` (`PK_identificacionUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prestamoUsuarios_ibfk_2` FOREIGN KEY (`FK_codigoLibro`) REFERENCES `libros` (`PK_codigoLibro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamoUsuarios`
--

LOCK TABLES `prestamoUsuarios` WRITE;
/*!40000 ALTER TABLE `prestamoUsuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamoUsuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `PK_identificacionUsuario` varchar(11) NOT NULL,
  `tipoDocumento` char(3) DEFAULT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PK_identificacionUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
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

-- Dump completed on 2018-05-26 16:29:22
