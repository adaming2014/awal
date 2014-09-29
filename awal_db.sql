-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 29 Septembre 2014 à 14:41
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `awal_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `id_admin_UNIQUE` (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `numbercard` varchar(45) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `id_client_UNIQUE` (`id_client`),
  KEY `fk_client_user_idx` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `device`
--

CREATE TABLE IF NOT EXISTS `device` (
  `id_device` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `id_modele` int(11) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_device`),
  UNIQUE KEY `id_device_UNIQUE` (`id_device`),
  KEY `fk_device_modele_idx` (`id_modele`),
  KEY `fk_device_client_idx` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `deviceinsurance`
--

CREATE TABLE IF NOT EXISTS `deviceinsurance` (
  `id_deviceInsurance` int(11) NOT NULL,
  `beginDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `id_device` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_deviceInsurance`),
  KEY `fk_deviceInsurance_device_idx` (`id_device`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `devicerepair`
--

CREATE TABLE IF NOT EXISTS `devicerepair` (
  `id_deviceRepair` int(11) NOT NULL AUTO_INCREMENT,
  `id_repairer` int(11) DEFAULT NULL,
  `id_modelpackage` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `state` enum('CREATE','IN_REPAIR','REPAIR','CLOSED') DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `date_in_repair` date DEFAULT NULL,
  `date_repair` date DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `id_device` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_deviceRepair`),
  UNIQUE KEY `id_deviceRepair_UNIQUE` (`id_deviceRepair`),
  KEY `fk_devicerepair_modelpackage_idx` (`id_modelpackage`),
  KEY `fk_devicerepair_repairer_idx` (`id_repairer`),
  KEY `fk_devicerepain_device_idx` (`id_device`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `modele`
--

CREATE TABLE IF NOT EXISTS `modele` (
  `id_modele` int(11) NOT NULL AUTO_INCREMENT,
  `weigth` double NOT NULL,
  `dimension` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_modele`),
  UNIQUE KEY `id_modele_UNIQUE` (`id_modele`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `modelpackage`
--

CREATE TABLE IF NOT EXISTS `modelpackage` (
  `id_modelpackage` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `id_modele` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_modelpackage`),
  UNIQUE KEY `id_devicePackage_UNIQUE` (`id_modelpackage`),
  KEY `fk_devicePackage_modele_idx` (`id_modele`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `repairer`
--

CREATE TABLE IF NOT EXISTS `repairer` (
  `id_repairer` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `competence` enum('PHONE','ELECTROMENAGER','COMPUTER','MECHANICAL','OTHER') DEFAULT NULL,
  `available` enum('AVAILABLE','NOT_AVAILABLE') DEFAULT NULL,
  `id_repaireraddress` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_repairer`),
  UNIQUE KEY `id_repairer_UNIQUE` (`id_repairer`),
  KEY `fk_repairer_repaireraddress_idx` (`id_repaireraddress`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `repaireraddress`
--

CREATE TABLE IF NOT EXISTS `repaireraddress` (
  `id_repairerAddress` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `postCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_repairerAddress`),
  UNIQUE KEY `id_repairerAddress_UNIQUE` (`id_repairerAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `seller`
--

CREATE TABLE IF NOT EXISTS `seller` (
  `id_seller` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_seller`),
  UNIQUE KEY `id_seller_UNIQUE` (`id_seller`),
  KEY `fk_seller_user_idx` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  UNIQUE KEY `mail_UNIQUE` (`mail`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `device`
--
ALTER TABLE `device`
  ADD CONSTRAINT `fk_device_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_device_modele` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id_modele`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `deviceinsurance`
--
ALTER TABLE `deviceinsurance`
  ADD CONSTRAINT `fk_deviceInsurance_device` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `devicerepair`
--
ALTER TABLE `devicerepair`
  ADD CONSTRAINT `fk_devicerepain_device` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_devicerepair_modelpackage` FOREIGN KEY (`id_modelpackage`) REFERENCES `modelpackage` (`id_modelpackage`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_devicerepair_repairer` FOREIGN KEY (`id_repairer`) REFERENCES `repairer` (`id_repairer`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `modelpackage`
--
ALTER TABLE `modelpackage`
  ADD CONSTRAINT `fk_devicePackage_modele` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id_modele`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `repairer`
--
ALTER TABLE `repairer`
  ADD CONSTRAINT `fk_repairer_repaireraddress` FOREIGN KEY (`id_repaireraddress`) REFERENCES `repaireraddress` (`id_repairerAddress`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `fk_seller_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
