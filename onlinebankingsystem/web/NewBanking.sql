-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema onlinebanking
--

CREATE DATABASE IF NOT EXISTS onlinebanking;
USE onlinebanking;

--
-- Definition of table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `customerid` int(10) unsigned NOT NULL,
  `accountno` varchar(45) NOT NULL,
  `balamt` int(10) unsigned NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY  (`accountno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`customerid`,`accountno`,`balamt`,`status`) VALUES 
 (1002,'164900142911',120000,'active'),
 (1001,'164900142987',475000,'active');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;


--
-- Definition of table `acctrans`
--

DROP TABLE IF EXISTS `acctrans`;
CREATE TABLE `acctrans` (
  `transid` int(10) unsigned NOT NULL auto_increment,
  `transdate` datetime NOT NULL,
  `accountno` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `summary` varchar(45) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`transid`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acctrans`
--

/*!40000 ALTER TABLE `acctrans` DISABLE KEYS */;
INSERT INTO `acctrans` (`transid`,`transdate`,`accountno`,`type`,`status`,`summary`,`amount`) VALUES 
 (10001,'2014-04-12 00:00:00','164900142987','deposit','done','cash deposit',10000),
 (10002,'2014-04-12 00:00:00','164900142987','transfer','failed','transfer to account 16490014291',20000),
 (10003,'2014-04-12 00:00:00','164900142987','transfer','done','transferd to account 164900142911',20000),
 (10004,'2014-04-12 00:00:00','164900142911','transfer','done','transferd from account 164900142987',10000),
 (10005,'2014-04-12 00:00:00','164900142987','withdraw','done','cash withdrawal',15000);
/*!40000 ALTER TABLE `acctrans` ENABLE KEYS */;


--
-- Definition of table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`username`,`password`) VALUES 
 ('admin','gautam');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;


--
-- Definition of table `cards`
--

DROP TABLE IF EXISTS `cards`;
CREATE TABLE `cards` (
  `cardno` varchar(16) NOT NULL,
  `customerid` varchar(45) NOT NULL,
  `cvvno` int(10) unsigned NOT NULL,
  `expirydate` datetime NOT NULL,
  `cashlimit` int(10) unsigned NOT NULL,
  `creditlimit` int(10) unsigned NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY  (`cardno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cards`
--

/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` (`cardno`,`customerid`,`cvvno`,`expirydate`,`cashlimit`,`creditlimit`,`status`) VALUES 
 ('9876123443216789','1001',232,'2015-07-09 00:00:00',30000,46500,'active');
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;


--
-- Definition of table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `customerid` int(10) unsigned NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `dob` datetime NOT NULL,
  `gender` varchar(45) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `pincode` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `encpassword` varchar(100) NOT NULL,
  PRIMARY KEY  (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`customerid`,`password`,`firstname`,`lastname`,`dob`,`gender`,`address`,`city`,`state`,`country`,`pincode`,`mobile`,`email`,`encpassword`) VALUES 
 (1001,'zncb5d','sandeep','gupta','1981-11-08 00:00:00','male','defence colony','jalandhar','punjab','India','144001','919876881181','ersandeepkgupta@gmail.com','529f634d5289fe81ed20f28695bc4581'),
 (1002,'eaw79m','albert','anderson','1991-03-05 00:00:00','male','roons road','new york','new york','america','132989','9876543210','albert.ander@gmail.com','6de97de388f93455605957121ef7bb3');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


--
-- Definition of table `fds`
--

DROP TABLE IF EXISTS `fds`;
CREATE TABLE `fds` (
  `customerid` int(10) unsigned default NULL,
  `fdno` varchar(45) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `months` int(10) unsigned NOT NULL,
  `roi` float NOT NULL,
  PRIMARY KEY  (`fdno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fds`
--

/*!40000 ALTER TABLE `fds` DISABLE KEYS */;
INSERT INTO `fds` (`customerid`,`fdno`,`amount`,`months`,`roi`) VALUES 
 (1001,'112233',70000,24,10.8);
/*!40000 ALTER TABLE `fds` ENABLE KEYS */;


--
-- Definition of table `loans`
--

DROP TABLE IF EXISTS `loans`;
CREATE TABLE `loans` (
  `loantype` varchar(45) NOT NULL,
  `minamount` int(10) unsigned NOT NULL,
  `maxamount` int(10) unsigned NOT NULL,
  `roi` float NOT NULL,
  `minduration` int(10) unsigned NOT NULL,
  `maxduration` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`loantype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loans`
--

/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;


--
-- Definition of table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `tid` int(10) unsigned NOT NULL auto_increment,
  `amount` int(10) unsigned NOT NULL,
  `transdate` datetime NOT NULL,
  `cardno` varchar(16) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` (`tid`,`amount`,`transdate`,`cardno`,`type`) VALUES 
 (1,1000,'2014-04-13 00:00:00','9876123443216789','billpayment'),
 (2,2500,'2014-04-13 00:00:00','9876123443216789','taxdeposit');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
