CREATE DATABASE  IF NOT EXISTS `awal_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `awal_db`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: awal_db
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id_address` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_address`),
  UNIQUE KEY `id_address_UNIQUE` (`id_address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `id_admin_UNIQUE` (`id_admin`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  KEY `fk_idUser_idx` (`id_user`),
  CONSTRAINT `fk_idUser` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `id_address` int(11) DEFAULT NULL,
  `numbercard` varchar(45) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `id_client_UNIQUE` (`id_client`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  KEY `fk_client_user_idx` (`id_user`),
  KEY `fk_client_address_idx` (`id_address`),
  CONSTRAINT `fk_client_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_client_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competence`
--

DROP TABLE IF EXISTS `competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competence` (
  `id_competence` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_repairer` int(10) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id_competence`),
  UNIQUE KEY `id_competence_UNIQUE` (`id_competence`),
  KEY `fk_competence_repairer_idx` (`id_repairer`),
  CONSTRAINT `fk_competence_repairer` FOREIGN KEY (`id_repairer`) REFERENCES `repairer` (`id_repairer`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `id_device` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `id_modele` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id_device`),
  UNIQUE KEY `id_device_UNIQUE` (`id_device`),
  KEY `fk_device_modele_idx` (`id_modele`),
  KEY `fk_device_client_idx` (`id_client`),
  CONSTRAINT `fk_device_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_device_modele` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id_modele`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deviceinsurance`
--

DROP TABLE IF EXISTS `deviceinsurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceinsurance` (
  `id_deviceInsurance` int(11) NOT NULL,
  `beginDate` date NOT NULL,
  `endDate` date NOT NULL,
  `id_device` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_deviceInsurance`),
  KEY `fk_deviceInsurance_device_idx` (`id_device`),
  CONSTRAINT `fk_deviceInsurance_device` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deviceinsurancemodel`
--

DROP TABLE IF EXISTS `deviceinsurancemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceinsurancemodel` (
  `id_deviceinsurancemodel` int(11) NOT NULL AUTO_INCREMENT,
  `id_modele` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id_deviceinsurancemodel`),
  UNIQUE KEY `id_deviceinsurancemodel_UNIQUE` (`id_deviceinsurancemodel`),
  KEY `fk_deviceinsurancemodel_model_idx` (`id_modele`),
  CONSTRAINT `fk_deviceinsurancemodel_model` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id_modele`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devicerepair`
--

DROP TABLE IF EXISTS `devicerepair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicerepair` (
  `id_deviceRepair` int(11) NOT NULL AUTO_INCREMENT,
  `id_repairer` int(11) NOT NULL,
  `id_modelpackage` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `state` enum('CREATE','IN_REPAIR','REPAIR','CLOSED') DEFAULT 'CREATE',
  `date_creation` date NOT NULL,
  `date_in_repair` date DEFAULT NULL,
  `date_repair` date DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `id_device` int(11) NOT NULL,
  PRIMARY KEY (`id_deviceRepair`),
  UNIQUE KEY `id_deviceRepair_UNIQUE` (`id_deviceRepair`),
  KEY `fk_devicerepair_modelpackage_idx` (`id_modelpackage`),
  KEY `fk_devicerepair_repairer_idx` (`id_repairer`),
  KEY `fk_devicerepain_device_idx` (`id_device`),
  CONSTRAINT `fk_devicerepair_repairer` FOREIGN KEY (`id_repairer`) REFERENCES `repairer` (`id_repairer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_devicerepain_device` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_devicerepair_modelpackage` FOREIGN KEY (`id_modelpackage`) REFERENCES `modelpackage` (`id_modelpackage`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `firm`
--

DROP TABLE IF EXISTS `firm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firm` (
  `id_firm` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `id_address` int(11) DEFAULT NULL,
  `logo_path` varchar(45) DEFAULT NULL,
  `css_path` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_firm`),
  UNIQUE KEY `id_firm_UNIQUE` (`id_firm`),
  KEY `fk_firm_address_idx` (`id_address`),
  CONSTRAINT `fk_firm_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modele`
--

DROP TABLE IF EXISTS `modele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modele` (
  `id_modele` int(11) NOT NULL AUTO_INCREMENT,
  `weigth` double NOT NULL,
  `dimension` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_modele`),
  UNIQUE KEY `id_modele_UNIQUE` (`id_modele`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modelpackage`
--

DROP TABLE IF EXISTS `modelpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelpackage` (
  `id_modelpackage` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `price` varchar(45) NOT NULL,
  `id_modele` int(11) NOT NULL,
  PRIMARY KEY (`id_modelpackage`),
  UNIQUE KEY `id_devicePackage_UNIQUE` (`id_modelpackage`),
  KEY `fk_devicePackage_modele_idx` (`id_modele`),
  CONSTRAINT `fk_devicePackage_modele` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id_modele`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repairer`
--

DROP TABLE IF EXISTS `repairer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repairer` (
  `id_repairer` int(11) NOT NULL AUTO_INCREMENT,
  `available` enum('AVAILABLE','NOT_AVAILABLE') NOT NULL,
  `id_firm` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_repairer`),
  UNIQUE KEY `id_repairer_UNIQUE` (`id_repairer`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  KEY `fk_isUser_idx` (`id_user`),
  KEY `fk_repairer_user_idx` (`id_user`),
  KEY `fk_repairer_firm_idx` (`id_firm`),
  CONSTRAINT `fk_repairer_firm` FOREIGN KEY (`id_firm`) REFERENCES `firm` (`id_firm`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_repairer_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reseller`
--

DROP TABLE IF EXISTS `reseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reseller` (
  `id_seller` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_firm` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_seller`),
  UNIQUE KEY `id_seller_UNIQUE` (`id_seller`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  KEY `fk_seller_user_idx` (`id_user`),
  KEY `fk_seller_firm_idx` (`id_firm`),
  CONSTRAINT `fk_seller_firm` FOREIGN KEY (`id_firm`) REFERENCES `firm` (`id_firm`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_seller_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  UNIQUE KEY `mail_UNIQUE` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-02 15:13:31
