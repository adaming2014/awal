-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 08 Octobre 2014 à 09:50
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
-- Structure de la table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id_address` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_address`),
  UNIQUE KEY `id_address_UNIQUE` (`id_address`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `address`
--

INSERT INTO `address` (`id_address`, `city`, `street`, `postcode`) VALUES
(1, 'nantes', '1,rue gigant', '44100'),
(2, 'nantes', '1,rue charles', '44100');

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `id_admin_UNIQUE` (`id_admin`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  KEY `fk_idUser_idx` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `id_address` int(11) DEFAULT NULL,
  `numbercard` varchar(45) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `id_client_UNIQUE` (`id_client`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  KEY `fk_client_user_idx` (`id_user`),
  KEY `fk_client_address_idx` (`id_address`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`id_client`, `id_address`, `numbercard`, `id_user`) VALUES
(8, 1, '123456', 6),
(9, NULL, NULL, 8);

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

CREATE TABLE IF NOT EXISTS `competence` (
  `id_competence` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_repairer` int(10) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id_competence`),
  UNIQUE KEY `id_competence_UNIQUE` (`id_competence`),
  KEY `fk_competence_repairer_idx` (`id_repairer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `device`
--

CREATE TABLE IF NOT EXISTS `device` (
  `id_device` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `id_modele` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id_device`),
  UNIQUE KEY `id_device_UNIQUE` (`id_device`),
  KEY `fk_device_modele_idx` (`id_modele`),
  KEY `fk_device_client_idx` (`id_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Contenu de la table `device`
--

INSERT INTO `device` (`id_device`, `description`, `id_modele`, `id_client`) VALUES
(29, 'myphone', 1, 8),
(30, 'mytablette', 2, 8),
(42, 'myphone2', 1, 8),
(43, 'QSDFG', 2, 8);

-- --------------------------------------------------------

--
-- Structure de la table `deviceinsurance`
--

CREATE TABLE IF NOT EXISTS `deviceinsurance` (
  `id_deviceInsurance` int(11) NOT NULL AUTO_INCREMENT,
  `beginDate` date NOT NULL,
  `id_deviceInsuranceModel` int(11) NOT NULL,
  `id_device` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_deviceInsurance`),
  KEY `fk_deviceInsurance_device_idx` (`id_device`),
  KEY `fk_deviceinsurance_deviceinsurancemodel_idx` (`id_deviceInsuranceModel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `deviceinsurance`
--

INSERT INTO `deviceinsurance` (`id_deviceInsurance`, `beginDate`, `id_deviceInsuranceModel`, `id_device`, `description`) VALUES
(5, '2014-10-31', 6, 30, '01'),
(6, '2014-10-31', 3, 42, '02'),
(7, '2014-10-28', 4, 43, '03');

-- --------------------------------------------------------

--
-- Structure de la table `deviceinsurancemodel`
--

CREATE TABLE IF NOT EXISTS `deviceinsurancemodel` (
  `id_deviceinsurancemodel` int(11) NOT NULL AUTO_INCREMENT,
  `id_modele` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id_deviceinsurancemodel`),
  UNIQUE KEY `id_deviceinsurancemodel_UNIQUE` (`id_deviceinsurancemodel`),
  KEY `fk_deviceinsurancemodel_model_idx` (`id_modele`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `deviceinsurancemodel`
--

INSERT INTO `deviceinsurancemodel` (`id_deviceinsurancemodel`, `id_modele`, `name`, `description`, `duration`, `price`) VALUES
(1, 1, 'insurance1', '1 month', 1, 10),
(2, 1, 'insurance3', '3 month', 3, 25),
(3, 1, 'insurance6', '6 month', 6, 50),
(4, 2, 'insurance1', '1 month', 1, 10),
(5, 2, 'insurance3', '3 month', 3, 25),
(6, 2, 'insurance6', '6 month', 6, 50);

-- --------------------------------------------------------

--
-- Structure de la table `devicerepair`
--

CREATE TABLE IF NOT EXISTS `devicerepair` (
  `id_deviceRepair` int(11) NOT NULL AUTO_INCREMENT,
  `id_repairer` int(11) DEFAULT NULL,
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
  KEY `fk_devicerepain_device_idx` (`id_device`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `devicerepair`
--

INSERT INTO `devicerepair` (`id_deviceRepair`, `id_repairer`, `id_modelpackage`, `description`, `price`, `state`, `date_creation`, `date_in_repair`, `date_repair`, `date_closed`, `id_device`) VALUES
(19, 10, 1, NULL, 90, 'CREATE', '2014-10-07', NULL, NULL, NULL, 29),
(20, 10, 2, NULL, 90, 'CREATE', '2014-10-07', NULL, NULL, NULL, 30),
(21, 10, 3, NULL, 50, 'CREATE', '2014-10-07', NULL, NULL, NULL, 42);

-- --------------------------------------------------------

--
-- Structure de la table `firm`
--

CREATE TABLE IF NOT EXISTS `firm` (
  `id_firm` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `id_address` int(11) DEFAULT NULL,
  `logo_path` varchar(45) DEFAULT NULL,
  `css_path` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_firm`),
  UNIQUE KEY `id_firm_UNIQUE` (`id_firm`),
  KEY `fk_firm_address_idx` (`id_address`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `firm`
--

INSERT INTO `firm` (`id_firm`, `name`, `phone`, `id_address`, `logo_path`, `css_path`) VALUES
(1, 'evolution-consulting', '02123456', 2, NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `modele`
--

INSERT INTO `modele` (`id_modele`, `weigth`, `dimension`, `brand`, `type`, `name`) VALUES
(1, 2, '10*10*2', 'samsung', 'phone', 'smartphone'),
(2, 5, '10*10*10', 'samsung', 'tablette', 'smarttablette');

-- --------------------------------------------------------

--
-- Structure de la table `modelpackage`
--

CREATE TABLE IF NOT EXISTS `modelpackage` (
  `id_modelpackage` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `price` varchar(45) NOT NULL,
  `id_modele` int(11) NOT NULL,
  PRIMARY KEY (`id_modelpackage`),
  UNIQUE KEY `id_devicePackage_UNIQUE` (`id_modelpackage`),
  KEY `fk_devicePackage_modele_idx` (`id_modele`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `modelpackage`
--

INSERT INTO `modelpackage` (`id_modelpackage`, `name`, `description`, `price`, `id_modele`) VALUES
(1, 'forfait ecran cassé', 'ecran cassé', '90', 1),
(2, 'forfait ecran cassé', 'ecran cassé', '90', 2),
(3, 'forfait batterie ', 'batterie ', '50', 1),
(4, 'forfait batterie ', 'batterie ', '50', 2);

-- --------------------------------------------------------

--
-- Structure de la table `repairer`
--

CREATE TABLE IF NOT EXISTS `repairer` (
  `id_repairer` int(11) NOT NULL AUTO_INCREMENT,
  `available` enum('AVAILABLE','NOT_AVAILABLE') NOT NULL,
  `id_firm` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_address` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_repairer`),
  UNIQUE KEY `id_repairer_UNIQUE` (`id_repairer`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  KEY `fk_isUser_idx` (`id_user`),
  KEY `fk_repairer_user_idx` (`id_user`),
  KEY `fk_repairer_firm_idx` (`id_firm`),
  KEY `FK_7rkttfh3faeu0qarplg7ed5g6` (`id_address`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `repairer`
--

INSERT INTO `repairer` (`id_repairer`, `available`, `id_firm`, `id_user`, `id_address`) VALUES
(10, 'AVAILABLE', 1, 7, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reseller`
--

CREATE TABLE IF NOT EXISTS `reseller` (
  `id_seller` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_firm` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_seller`),
  UNIQUE KEY `id_seller_UNIQUE` (`id_seller`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  KEY `fk_seller_user_idx` (`id_user`),
  KEY `fk_seller_firm_idx` (`id_firm`)
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
  `password` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  UNIQUE KEY `mail_UNIQUE` (`mail`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `firstname`, `lastname`, `mail`, `password`, `phone`) VALUES
(6, 'bian', 'loic', 'bian.loic@gmail.com', '123456', '06123456'),
(7, 'lucas', 'antoine', 'lucas.antoine@gmail.com', '123456', '06123456'),
(8, 'mathis', 'bian', 'mathis.bian@gmail.com', '123456', NULL);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_idUser` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_client_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `competence`
--
ALTER TABLE `competence`
  ADD CONSTRAINT `fk_competence_repairer` FOREIGN KEY (`id_repairer`) REFERENCES `repairer` (`id_repairer`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_deviceInsurance_device` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_deviceinsurance_deviceinsurancemodel` FOREIGN KEY (`id_deviceInsuranceModel`) REFERENCES `deviceinsurancemodel` (`id_deviceinsurancemodel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `deviceinsurancemodel`
--
ALTER TABLE `deviceinsurancemodel`
  ADD CONSTRAINT `fk_deviceinsurancemodel_model` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id_modele`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `devicerepair`
--
ALTER TABLE `devicerepair`
  ADD CONSTRAINT `fk_devicerepair_repairer` FOREIGN KEY (`id_repairer`) REFERENCES `repairer` (`id_repairer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_devicerepain_device` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_devicerepair_modelpackage` FOREIGN KEY (`id_modelpackage`) REFERENCES `modelpackage` (`id_modelpackage`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `firm`
--
ALTER TABLE `firm`
  ADD CONSTRAINT `fk_firm_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `modelpackage`
--
ALTER TABLE `modelpackage`
  ADD CONSTRAINT `fk_devicePackage_modele` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id_modele`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `repairer`
--
ALTER TABLE `repairer`
  ADD CONSTRAINT `FK_7rkttfh3faeu0qarplg7ed5g6` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`),
  ADD CONSTRAINT `fk_repairer_firm` FOREIGN KEY (`id_firm`) REFERENCES `firm` (`id_firm`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_repairer_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reseller`
--
ALTER TABLE `reseller`
  ADD CONSTRAINT `fk_seller_firm` FOREIGN KEY (`id_firm`) REFERENCES `firm` (`id_firm`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_seller_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
