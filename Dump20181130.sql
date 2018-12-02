-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: bullets_ink
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `artist` (
  `Artist_id` int(11) NOT NULL,
  `Fname` varchar(15) NOT NULL,
  `Lname` varchar(15) NOT NULL,
  `Shop_id` int(11) NOT NULL,
  `Artist_rating` float DEFAULT NULL,
  PRIMARY KEY (`Artist_id`),
  KEY `Shop_id` (`Shop_id`),
  CONSTRAINT `artist_ibfk_1` FOREIGN KEY (`Shop_id`) REFERENCES `location` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (0,'Bullet','Elmore',0,5),(1,'Chris','Smith',0,4),(2,'Denny','Skywalker',0,4.5),(3,'Tommy','Gunn',0,4.2),(4,'Ned','Stark',1,5),(5,'Walter','White',1,4),(6,'Daenerys','Targaryen',1,5),(7,'Rick','Sanchez',2,5),(8,'Morty','Smith',2,3),(9,'Peter','Griffin',2,2.5),(10,'Eric','Cartman',2,3.8);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancellation_policy`
--

DROP TABLE IF EXISTS `cancellation_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cancellation_policy` (
  `Pol_id` int(11) NOT NULL,
  `Pol_signed` tinyint(1) NOT NULL,
  `Pol_date` date NOT NULL,
  `Cust_id` int(11) NOT NULL,
  PRIMARY KEY (`Pol_id`),
  KEY `Cust_id` (`Cust_id`),
  CONSTRAINT `cancellation_policy_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancellation_policy`
--

LOCK TABLES `cancellation_policy` WRITE;
/*!40000 ALTER TABLE `cancellation_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancellation_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `Cust_id` int(11) NOT NULL,
  `Fname` varchar(15) NOT NULL,
  `Lname` varchar(15) NOT NULL,
  PRIMARY KEY (`Cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (0,'Andrew','Louder'),(1,'David','Hanlon'),(2,'Jude','Barlow');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_account`
--

DROP TABLE IF EXISTS `customer_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_account` (
  `Cust_id` int(11) NOT NULL,
  `Uname` varchar(20) NOT NULL,
  `Passwd` varchar(15) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  PRIMARY KEY (`Cust_id`),
  CONSTRAINT `customer_account_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_account`
--

LOCK TABLES `customer_account` WRITE;
/*!40000 ALTER TABLE `customer_account` DISABLE KEYS */;
INSERT INTO `customer_account` VALUES (0,'alouder','alouder450','alouder17@gmail.com','2402056738'),(1,'dhanlon','dhanlon450','davidhanlon23@gmail.com','4437352450'),(2,'jbarlow','jbarlow450','jbarlow524@gmail.com','4437990791');
/*!40000 ALTER TABLE `customer_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inventory` (
  `Equip_id` int(11) NOT NULL,
  `Equip_name` varchar(25) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  PRIMARY KEY (`Equip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (0,'Tattoo Gun',500),(1,'Needle',60),(2,'Piercing Gun',300),(3,'Ink Cartridge',50),(4,'Black Ink',60),(5,'Red Ink',70),(6,'Green Ink',70),(7,'Yellow Ink',70),(8,'Blue Ink',70),(9,'Pink Ink',70);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `location` (
  `Shop_id` int(11) NOT NULL,
  `State` char(2) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Zip` char(5) NOT NULL,
  PRIMARY KEY (`Shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (0,'MD','Mt.Airy','1603 Ridgeside Dr','21771'),(1,'MD','Towson','123 York Rd','21204'),(2,'PA','Philadelphia','John F Kennedy Blvd','19019');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager` (
  `Man_id` int(11) NOT NULL,
  `Fname` varchar(15) NOT NULL,
  `Lname` varchar(15) NOT NULL,
  `Shop_id` int(11) NOT NULL,
  PRIMARY KEY (`Man_id`),
  KEY `Shop_id` (`Shop_id`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Shop_id`) REFERENCES `location` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (0,'Bullet','Elmore',0),(1,'Ned','Stark',1),(2,'Rick','Sanchez',2);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_account`
--

DROP TABLE IF EXISTS `manager_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager_account` (
  `Man_id` int(11) NOT NULL,
  `Uname` varchar(20) NOT NULL,
  `Passwd` varchar(15) NOT NULL,
  PRIMARY KEY (`Man_id`),
  CONSTRAINT `manager_account_ibfk_1` FOREIGN KEY (`Man_id`) REFERENCES `manager` (`man_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_account`
--

LOCK TABLES `manager_account` WRITE;
/*!40000 ALTER TABLE `manager_account` DISABLE KEYS */;
INSERT INTO `manager_account` VALUES (0,'bullet','bullet450'),(1,'nstark','stark450'),(2,'rsanchez','sanchez450');
/*!40000 ALTER TABLE `manager_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchandise`
--

DROP TABLE IF EXISTS `merchandise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `merchandise` (
  `Merch_id` int(11) NOT NULL,
  `Merch_type` varchar(20) DEFAULT NULL,
  `Merch_name` varchar(35) NOT NULL,
  `Merch_price` float NOT NULL,
  `Merch_count` int(11) NOT NULL,
  PRIMARY KEY (`Merch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchandise`
--

LOCK TABLES `merchandise` WRITE;
/*!40000 ALTER TABLE `merchandise` DISABLE KEYS */;
INSERT INTO `merchandise` VALUES (0,'T-Shirt','Bullet Logo Shortsleeve',20,100),(1,'Sweatshirt','Bullet Logo Sweatshirt',40,50),(2,'Beanie','Bullet Logo Beanie',15,50);
/*!40000 ALTER TABLE `merchandise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piercing`
--

DROP TABLE IF EXISTS `piercing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `piercing` (
  `Pierce_no` int(11) NOT NULL,
  `Cust_id` int(11) NOT NULL,
  `Pierce_type` varchar(15) NOT NULL,
  `Price` float NOT NULL,
  `Equip_id` int(11) NOT NULL,
  PRIMARY KEY (`Pierce_no`),
  KEY `Cust_id` (`Cust_id`),
  KEY `Equip_id` (`Equip_id`),
  CONSTRAINT `piercing_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `piercing_ibfk_2` FOREIGN KEY (`Equip_id`) REFERENCES `inventory` (`equip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piercing`
--

LOCK TABLES `piercing` WRITE;
/*!40000 ALTER TABLE `piercing` DISABLE KEYS */;
/*!40000 ALTER TABLE `piercing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservation` (
  `Res_id` int(11) NOT NULL,
  `Shop_id` int(11) NOT NULL,
  `Cust_id` int(11) NOT NULL,
  `Artist_id` int(11) NOT NULL,
  `Res_type` varchar(10) NOT NULL,
  `Res_date` date NOT NULL,
  `Start_time` time NOT NULL,
  `End_time` time NOT NULL,
  PRIMARY KEY (`Res_id`),
  KEY `Shop_id` (`Shop_id`),
  KEY `Cust_id` (`Cust_id`),
  KEY `Artist_id` (`Artist_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`Shop_id`) REFERENCES `location` (`shop_id`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`Artist_id`) REFERENCES `artist` (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `result` (
  `Result_id` int(11) NOT NULL,
  `Shop_id` int(11) NOT NULL,
  `Cust_id` int(11) NOT NULL,
  `Artist_id` int(11) NOT NULL,
  `Res_type` varchar(10) NOT NULL,
  `Res_date` date NOT NULL,
  `Start_time` time NOT NULL,
  `End_time` time NOT NULL,
  PRIMARY KEY (`Result_id`),
  KEY `Shop_id` (`Shop_id`),
  KEY `Cust_id` (`Cust_id`),
  KEY `Artist_id` (`Artist_id`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`Shop_id`) REFERENCES `location` (`shop_id`),
  CONSTRAINT `result_ibfk_2` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `result_ibfk_3` FOREIGN KEY (`Artist_id`) REFERENCES `artist` (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_has`
--

DROP TABLE IF EXISTS `shop_has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shop_has` (
  `Equip_id` int(11) NOT NULL,
  `Shop_id` int(11) NOT NULL,
  `Equip_count` int(11) NOT NULL,
  PRIMARY KEY (`Equip_id`,`Shop_id`),
  KEY `Shop_id` (`Shop_id`),
  CONSTRAINT `shop_has_ibfk_1` FOREIGN KEY (`Equip_id`) REFERENCES `inventory` (`equip_id`),
  CONSTRAINT `shop_has_ibfk_2` FOREIGN KEY (`Shop_id`) REFERENCES `location` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_has`
--

LOCK TABLES `shop_has` WRITE;
/*!40000 ALTER TABLE `shop_has` DISABLE KEYS */;
INSERT INTO `shop_has` VALUES (0,0,10),(0,1,10),(0,2,10),(1,0,20),(1,1,20),(1,2,20),(2,0,10),(2,1,10),(2,2,10),(3,0,20),(3,1,20),(3,2,20),(4,0,100),(4,1,100),(4,2,100),(5,0,60),(5,1,60),(5,2,60),(6,0,60),(6,1,60),(6,2,60),(7,0,60),(7,1,60),(7,2,60),(8,0,60),(8,1,60),(8,2,60),(9,0,60),(9,1,60),(9,2,60);
/*!40000 ALTER TABLE `shop_has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_owner`
--

DROP TABLE IF EXISTS `shop_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shop_owner` (
  `Own_id` int(11) NOT NULL,
  `Fname` varchar(15) NOT NULL,
  `Lname` varchar(15) NOT NULL,
  `Shop_id` int(11) NOT NULL,
  PRIMARY KEY (`Own_id`),
  KEY `Shop_id` (`Shop_id`),
  CONSTRAINT `shop_owner_ibfk_1` FOREIGN KEY (`Shop_id`) REFERENCES `location` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_owner`
--

LOCK TABLES `shop_owner` WRITE;
/*!40000 ALTER TABLE `shop_owner` DISABLE KEYS */;
INSERT INTO `shop_owner` VALUES (0,'Bullet','Elmore',0),(1,'John','Doe',1),(2,'Michael','Scott',2);
/*!40000 ALTER TABLE `shop_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tattoo`
--

DROP TABLE IF EXISTS `tattoo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tattoo` (
  `Tat_no` int(11) NOT NULL,
  `Cust_id` int(11) NOT NULL,
  `Color` tinyint(1) DEFAULT NULL,
  `Size` int(11) DEFAULT NULL,
  `Est_time` int(11) DEFAULT NULL,
  `Shop_id` int(11) NOT NULL,
  `Equip_id` int(11) NOT NULL,
  PRIMARY KEY (`Tat_no`),
  KEY `Cust_id` (`Cust_id`),
  KEY `Shop_id` (`Shop_id`),
  KEY `Equip_id` (`Equip_id`),
  CONSTRAINT `tattoo_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `tattoo_ibfk_2` FOREIGN KEY (`Shop_id`) REFERENCES `location` (`shop_id`),
  CONSTRAINT `tattoo_ibfk_3` FOREIGN KEY (`Equip_id`) REFERENCES `inventory` (`equip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tattoo`
--

LOCK TABLES `tattoo` WRITE;
/*!40000 ALTER TABLE `tattoo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tattoo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiver_policy`
--

DROP TABLE IF EXISTS `waiver_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `waiver_policy` (
  `Pol_id` int(11) NOT NULL,
  `Pol_signed` tinyint(1) NOT NULL,
  `Pol_date` date NOT NULL,
  `Cust_id` int(11) NOT NULL,
  PRIMARY KEY (`Pol_id`),
  KEY `Cust_id` (`Cust_id`),
  CONSTRAINT `waiver_policy_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiver_policy`
--

LOCK TABLES `waiver_policy` WRITE;
/*!40000 ALTER TABLE `waiver_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `waiver_policy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-30 15:41:21
