-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: smartnote_appdb
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `recordings`
--

DROP TABLE IF EXISTS `recordings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recordings` (
  `Recording_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Note_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Recording` longblob,
  `RecName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`Recording_ID`,`Note_ID`,`User_ID`),
  KEY `UserIDfk5_idx` (`User_ID`),
  KEY `NoteIDfk6_idx` (`Note_ID`),
  CONSTRAINT `NoteIDfk6` FOREIGN KEY (`Note_ID`) REFERENCES `notes` (`note_id`),
  CONSTRAINT `UserIDfk5` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordings`
--

LOCK TABLES `recordings` WRITE;
/*!40000 ALTER TABLE `recordings` DISABLE KEYS */;
INSERT INTO `recordings` VALUES (1,1,3,'ID3\0\0\0\0vPRIV\0\0\0\0\0PeakValue\0�\0\0PRIV\0\0\0\0\0AverageLevel\0{\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ID3\0\0\0\0\0TENC\0\0\0\0\0Lavf52.31.0���d\0\0�\0U\�`\0\0\r �\0�Yc�\� \0\04�\0\0\0nT@$�~x{�?�1��x�\�\�\���\0\0��x��\����ч�����0��\�\0\0�\��\0\0\0\0F<\0\0\00����\0���\�p8\Z;l��\������ZgCE+?\��h\�y�-���f\��aTlN�dwO\�8x`m�$u3I�6;@f\�Q\�cp�h\��\�q\"�\r\�J�:\�\0@\�\�wI\�\���Ŕ\�E\�\�B\0(�\0\0���k2~\�\�r�\�CT\�8^\�O\�7H�G\"�\Zm!\���2�I�D�I/��̑D\�$��D\�$��_�\�R<ǖ\"G\�SzH�B$Ul2\�-��N\n\0\��I��$\�	��P:4��0d4\��laF\Z\"�\�`ѩ\�U8\�P\Zɽ�\�y\�8$ ���L�\�FN1�R�!)V\�(\nf�T�@R����������\�\�\�\����d;��\�+\�c \0\0\r \�\0��4lk	�\0\04�\0\0\�*@>\����욂�\Z�\�\Z�f���0�0\"��Lh�\�Rld\�8@P� RI2�����ȓ\�Fr*P$\�\��3�Z\�i)\�\�\�i~\�F\rk/�䦖�������\���z������\�\0@\0����&\'H��I\�f�hOh-)5\�_���Օ?2p\�\�a�hi�s*�W�8�H30<;.a��	\�e!i�\n\�v\0%@\���b��\�X$KE2\�\�j&$�\�i[\�y\\�\Z\�/\���������8睿\'\0V\�~{\�ƖUA�t��;0�\�I\r��\�{�i\�\�\�\r�YJƃ\�\0`><�d\�&,c�\0\�r`b �4�:\'\"֖P2:\n��a�-������\�\Z~\r\�^E\0��.�\�Y\�\��������\�\�\�\�1����d��\�-N�\�b\0\0\r \0\04�:L\�i�\0\04�\0\0�\0 \n��!\01�De\�3�uw\�\�.�\�F\�\n��d.I�\�ޅ��\�)\0�\Z0�d\�\�\��\0\�\�\�A\�wV�{�(�BX\�9�  H�À8*H�E�^oz/K)]N\�\�\�E�e������\���z�\�!\�$CI��8	\0H���|�F�� jE%!\r�eLmL�U\�$8͖�\�\��\�\0@#\0�Ue-:{@�M0�M1`	A���@a�9�H	\�GV?\�%�:�t̂�y�A\�!vt\"\�\�*{v(\�L18��\0T��-ϟ�������O�;����S.^�\�\�\�D���\Z��\0fY�\0\�$\Z�@p�b\�a8�#\r,\�\�2\�pMp\�\�I+L�+L7\�#MG$\�L�\�~L��MW(�Cq�b2\r� ����d���+\�\�f\0\0\r \0\0ܫ6���\0\04�\0\01�\�d�\0\�\�+���:(�\r\��h8d+�\�`�.\"��\Z0\�2���\�%8������\�Q\�:+Q\'b\0!P@�\�#���:\01�`\n&\�`�	b�s�.0\�s�F0K�!�0-�3�.1^K��\�Q17�EY�(��q�A��;�c\0ى%�����q[�@\�O�\�xg�K�z�+\���\"B���H̃@,\�u �0\�\�<&��(f�\"\�A%�6`2�	<bB*&\0`6���\�\�n������\�\'%@>-\�CU@\0@�#�V�4��%����@�B1��@@F�\"��\"�!��d\�0xc0\�a\�ve\nr}D0\0�`��\0��\0(�\�c�\n`��a�va�le�a@ahR`\�j`� \'���d���i,L�=\�b\0\0\r \0\0\Z�*{ɀ\0\04�\0\0\r�\0܄\00�40`\\1�X5 2�$0@O\\^m�\"a���1��As\�\�o���������/��\�\�q\0\0�\�ࢋ\�iZ�Ҫ>\�;TkzN���\�*^���6\�&$\�\�\�#�,�J\�Ҋ�\�|4�1�\�\���Ϝ|!\�\n\�����\����\�\�z�\�lj�\�\�D\�\�+\�D�_�\�\�LȬ��NI\�À��z�\\\�\�h�-\���O�\r\�\�EC{\�،R2��^\�\�o��]^��#*CAAD����vA\�\�#(�Z�!$혝���8\�\�j�Qᬷ�v����QD\�sU��\0\0\0��\�\�6S��������\��-�*���$n5\r�i�.\�vC�t��\�7Mn��fS�c[E\�\�a�cO�-�5����\�\��\�~7]WV����\�\�\�\\37(��`+��b+b1N���d���3,\�3=\�`\0\0\r \0\0\ZY�c�i\�\�\0\04�\0\0�\"�ult褈��\�#Dh�5%�C���\�IO\�x���#����Q\�&G����l�=Hyd\'J2ڤ!*ܧ\rI�7�\�\r\�\�~��\'����\0\�>�S8��TTr\nx�^�\�\��\�?K\n@\�k2Xl*�Q\0\0\'��M7E2G�|\�e�J&fd���I�+<�ƗMnM7�F7,\�\�\�b���0f.}7�f{d�}\�x�Y�´B�#n\�\�B�&�2�d\�J\�\�q\�)JJMBji5V�3&��\�\�\�\�[j@X�\'�\�\�Z�e\0���h\�3t\�q\�X\�=i\�w������_\�,��5���뿟\�ϲꬥ�ᕌ�\�T\�+���\��|��%\�5Kb�\�����O#\nۻ�\��� 4r	*\�ٙm}D�7ꘘyj���\�B%\�\'\�0�l,n�0���CG����d��\"h\�P\�{t\0\0\r \0\0h�mCa\�\0\04�\0\0u&\�\�\�\�f~����\�p>S5˕\�v\��lU�(���[/llÚ\�z#�\0\0V\�\n\�b��ʓ�8\nn�8=��3��U����\�\�u/]뒈�ͅ�F��M\�流)\�ׂ�\�=\�h\�\0\�t�_!�.�c\�R\�\�V%��e\�\�\�qV9�U\�̥]y�7���(W��yU�^�\r\�/X\�}}\�D3\�ڥF��}\��ӦM��e�U�\�j\�ec�s�R5�\�ڛ/<:D���u83?՟%S\��\�RQ�\�H�\�\���\r�N����<�cT�n\�\�2�\0\0JP9g|��e��:\�~.\Z\�\���\�T\�\��#\�����<\��\�<M���\�\�]�\�ibp�f!^�Z�\�`d�=\�5\�\�k�*?uye�\�\�r\�2hEU<\��v�+oWb�$0\�*\�{\�l�����d����h\�Q�ct\0\0\r \0\0\Z��Xlq��\0\04�\0\0�O\"}����\�\�tT�-ٟ/(\�\�v\�:P\0In$�N2,�m�F\ZQ�K�3�p�q�\�p;�`A�\�jnK\"ej�<\�D\'�A��s;�8�G��\�,q3��儶�s�Ox\�M\�z\�3\�.P7|\�f\n�\n��i\�	ؖC8ͺ�=-S�hh\�`�buZ����\�sS\�ͣ\\�jj\�̛z\�\�4:�6NǑ��Rb\nj)�q\��q��������������������������������������������������������������������\0H\���=@\�g@�thc͂���\�.�\�n�@�A%�\�i\�Xf<M 9;Q��10-@�BP�YXL��*S�[�����\�qS\�i��\�\�9a`\�9\�ث{�O\�ͅ� �a�\�F6�,>^qJ�qӆ\����d����dי�Cr\0\0\r \0\0M�`g\�m\�\0\04�\0\0o�5g|Z:\��ט�/�\��v.m�u\���7�q�\�s\�f\�/9=�U\�3m��\�\�φ\�P�\�2�����\�2���\�┗\nJ`�(�4%�OƸ����LUk;��D\�,�|\�\� PX&]�Py\'U\�¿\n4\nC�0\�/��~(�����R\�\'\�COMO��n���\�`\rK(�\�)q\�Y\�A\��\�N5�\n��j�GT\�E\�z�\�(I\�Ե�v\��~\�\�ԷmK}Xu\�=�V�Ȇ�\�>�Ci~-J��\�LAME3.98.2��������\0G\�)|\�lb\�Y\�3��\0F�\�\�n �0�\�a�\0���@2;z��(p��@$���b����p-PUo!�1�\�=�\r��V�3} !�\"IK%�W\�v!b�0�k\Z�;@я����n?L8}�\�\�\��\�����d���\�ZT�[r\0\0\r \0\0فV�m\�\0\04�\0\0�Lbj��d,ǽZc*[oM\�8\�Uu���\�\�\".c��C\�l\�ą8\�5L�\�}3X/afc\�\�u��\�/c��/\�JNzw\��|R�4\�s�����j��]��U��(\")\�`p���\�7q�x\09�=�X��x`\�\�o\�t\�\��`�dR,�/��\�w\�\�(�L\�\'�^�ˋ\�{;�\�ex�?e�g��\�\�(��\�W\�`d\�/wLǏ,M!\�kB�\�p��O��8��s�8�\�Y\�o�=\����\�ƩL@p\�\�[\�\�\��\�֬(T�b�\r �3\0 \0\0-\�\�,����L�i\\�@K)��\�$\0	�he9�\�)���tVG)�\�\�u��\��b�W�t��1\�AVԦ�n�꽫V���s�s�iY;�;L\�-\�{nf2�Y�\����R\�\�_݆���d���\�`T�[p\0\0\r \0\0\Z��R�\��\0\04�\0\0��Z��\�?Ź\�a)��$\�{%+N��RƟ�k+&\�\�\\`\�\�\�\�V�\��Ҋp\��p`�\�9ђ\�\�Jϳ�\�\�u�7�� \0&d\�p\�p\��L\�ְ����6*H�\�@\r}�\�t,XF\��7y&�./�����m�2\�=,�\��;�Z�8/Y�/+IL}\�\�-\�޳vܽ�\�K��V�\�n\�^\�\�9�3�-\�\�n[iy�\�aز\�E\�Cj֕Z\�K6�9��m\�c\�f��M�o@\�/U���V���U����)��e\�\'\�UUUUU\0R�^�%d�\�uM�;I]6�\�p\�\\�\�|,.\rU`�B\"07P\�\��@�L<\"\0C�\�\n�\�L2%�\0�`ă\"�I%T*~b(ڳ���Ϧ{+\�|Kh\�?�\��\�\��\�%�9�\�=;�\�`�,�m���d���`\�Q�[r\0\0\r \0\0��XG�\�\0\04�\0\0\�n\�:D3H��\���4Wic9t:����\�웶�\"+7���;x߃\�tRHǈy9\�\�-�:3\�C��\"�z]�i���t�/B���ʃ�\\\r��L+Z\�kMiw4,�\�S	D\0�R`\�RA\�x`�3jU��%�`��0Ȥ\r�>\\,%n8�\�%\�\�J�տt��\�\�Kϐ l�\�\�\���z]��\�r\�\���\�C\�s\\h��:MC}N~��\�\�\�yK��&{�b%\��\�+w=\\4\�kl�dWp����g�\�յ� �����*������\0@\�x��jUU/(�G�Aw��\r�m\�NC\0�ĳ�`���f0\"�020����\�!\0\0�\�\�\���QF$!��â�7��.�YʪC\rՠ1\��]O\�Ɯz==M(WE��\"es���\r\����\��g\����d���bӋCr\0\0\r \0\0��Xmm�\0\04�\0\0\�;I\�]��y��m��Y�L%�jN�,;\�\��\�6+}A�\�+�V}_�F���_H��/�\�$K\�z}�\����\�\��x8�����{b#z�v���n\�\�W�T�\�_�4\�\�(\��\�,�:	�\��\�a�Ka+\��\"BqTB&\���K��%�]\�i q���\0b2群=m\�$E����}[|p~���i<��Q\�	\�\�ҍΫ�\�?0=z\�=\�Ҷc\�n:�\�0\��\�w�f��w}\�Y�Ӷ\�/��^ߟ�R�cgz�\�\��͛G\���+�6�\�\�5����\��\0F�܄�\�&//�1��\\@\�\��d-�8D\\(&1#��+�\��}GŁ�\0\n	\r�\�\�z^�)B�w \�^^՗i�ŢC̱���iC0!�xn�IY�$z_@\�5b�\���\'�Ǣy4���d���weU{r\0\0\r \0\0��T\��\0\04�\0\0ʖ;���7U\�=\�\��T\���l$�\�:�Q+�\\��z��\�ﷺ\�nw�w�3o�\�\�Qu�~\�6�JR=\�3L\�Ĭ���oَzָ\�1�]\�\�\�&��i\�\��R�a_�U3\�{ep�u\�4p\�hcVA\�H!�$\r�\��t@\0\0�\�1 }腢\0ZE`�G�ڬ\�\0A\�\�\�෋��\�G�a�$\�\�&�R�\�ɠXh>v�iړ\�\�Z�\�\��7k��\�M��ű{��o5�������I���1|��\\wQ=^\�[)7�b���\�U\�IF�Eq\0@PW�7��5	:��p�LI�2�Z�P\0\�U:	D,\�E\�\01*\��#�K2]`P\Z#\0<`p0(8\�O\��ABҷ\�\�PV:�D!`\�3H�8�\����pn~���j����qÃ�A�\����d��BeU\\{r\0\0\r \0\0quTqm\�\0\04�\0\0Ҏ�RLt\�T��cʴ\�mo���\��s3�]�YI\�\�[&\�yϩ�}3�\�~��U|q4ʕ�|u��ː�\�\�\�v��\rH�\n�$�)\�|�u��O�\�Qg�\�y����Wv��T\�D3|��|�Ãa\rD��\�\�L�5ף�\�(Dbbf*\rfr�=��\�(\�aI�!+�\�*����\�nb�\nZP�/���\0Q\������z>2����sk!�IH9\�\\J����\�\�\�fN��3���\�\�Q\�\�\�Ɔ\�\�\\�G��c\"�1\�YM2�\�3\�_i�g��\�,�+}\�\�v�\�ӧo\\\�r�/(\0\0uU}\�E2�\�E��\�[�\�?�.�i�\�תl2w��Tq���\0\'Ri~�Ȩ#\0���Z\�x���\� z��ħ�\�EʖLY�\\��\�b\�jz6\�y?-���d��\�aU[r\0\0\r \0\0\Z٭R\�\�\0\04�\0\0cĐHAzsv\Z��\�e&bNb\�t�\�m�ѷG�\�0�����--uգ�~���7,�Jj\�M�=ի�\�\�*\��a\�\Z\�C\�\�E,ï�V�\�@��n�J�\�\�\�(�\�q\�\�C&C�T%\�b�M5\�)8�M�Ӡ\r�6tD*�Sb\�#��P��\�܇\�*ho-4\�~x�k��AR�ߦ\�f.�K�Rf,\�_�ԋ�@�\�\�\�\\.��\�Ϯ\�\�)f��T\�6=5�nܤ7�\�\�\�\�\���C�n\�*v�y�=\�ڄ�.�\�\"A�ڍ�\�Rk�\�+�Y\�k��\�\0\0	2�U#\��Y蘃\0��8�%T�2(]�pΕ�*\0�c5D�1(�l�\0B\�\�)aa)\�-*P�L�`j\\J`=��``��Ә<�\�O�\�\�\��R�r�n��@`�\�\�5h{�K]ٜ\�\�l�u}����d\���a֓<[r\0\0\r \0\0\rsZMim\�\0\04�\0\0\�o򂂪\�\"��\�\�i�\�xGJ\"Y�Zzp���l.�b\r9�\�J��%�Di4��\��0�kO\�\�4\���x��\�\��(�d\Z� �+\�\��\'%Ad�nA���(��A���4\nc���R	�x� \��< 18]\�\r�>���\"\�#\�Z�[�\�L\�٢\���\�@�ҊX\� x\��X�a��[$ab��\�Q\"�(>���D!�-\�\�j\�\\\�\�1j�ÎU5.��� �.LL>��4\�T\�ůhh�\�i\0*�8�4��Ӧ�Ɔu��n\�<�\�p�\�\�\Z���\0!r���q�\�ŀI�A��\�q�`x^a�a(�a	di<o8�0\"�j$6@\0�\���s\ndф�3Y\rp\�\�\"��F\�%�\�\����d���gW;\Z3r\0\0\r \0\09�PMq\r�\0\04�\0\0\�\�1d\�s\��\n��{\�uܹ����\�\�ٛ�j���\�) Sa�TP\\�\\�c��\����WBt#�ba\\\n�S�M�*܂�+�\\��\\����\�i�fo���I�^\�Rm%)6�\�t;�@\�\�H�\0\�4 4d8\�#\n���\�1�\�\�@`*\\��P\0�	w:���U��c��Acȡ\�xz\'\�gˬc\�a�����\�\�B�r�\�˶A��hǿvї~-�.�cF=�ǌ�h˹�c2\��mwQqv\�c\�Ӣhe\�����!��\�\�Ha\�\�\'\n\0�Ns9�6X�Vs��Y	(r\�;X0\\!N�@�\�\�$�Lh\�91�\�2�\"\n�Ff5	,�<�\0\r\�[g�\n\�\�\�R	� �8ITShQ	*�l\��hj�SԤ��O~ \�p�\�i\�!B1\�?���d���A,\�}\�b\0\0\r \0\0i�Tl�\��\0\04�\0\0Z\�h�.ɡd\�L �1s\�\� �b�޽���=\�s\�y�3C6\�	�m\r\�N2\�\���\�����wx\�U�Ͼ�uZ\�7�\n\�v��x?�;4-�X,4ٞ4�b@�\�7y\�Z	(�\�*F̠�8\\0i5\�\�+W.�5���\�Nk\�x$.����rJ��\�jď��\�\��u�\�E\�L,;Iz�<-�s\Z��W]s}G�\�3bn���U݇q�R�h�\�\�\�W\�={��_k�\�W�~�\��zRe\�?6\��\�\�m\n\�f��Y\��4��\�\�\�ӯC�\��\�\0\0N�E�ȟ�o$[\�tx�L��̲T\r\rL%��2�W.��OqU�Y�\'R֖,*\",Ga�\�~\� h!�\�NTA��n�8�C���\�BY�kK�T\��I\���`��U<\\d����d����a\�<3r\0\0\r \0\0��VL\�\�\0\04�\0\0\r31�\�3*���\�}���ҫ2�h�e6V`\�~�h\�\�����QN>�t�\�$�I2�$\��\�l\�Y�\n�f�64lO\'����\�\Z�,+�iu\�d�\"5O?^e\��z\�4K�\�5\�X \"`�#\�̘���VX8pp#)�C@$UN���G�7�q#rhZ\�D��L\�݌%�AnҎv;H��t��PPƤ��*+�~�\�G|\��:y�1\���|(���\��\�\�\�\�\rj��yÕ\�3<K\�\\�+X��L\�\�\�yu��\�x\��>\�\�\�[��`\�U0�\�~��یH\�\�[�,��\�.\�%\"ǴG�@\�\0\��\�����c��\"\��v�\�;-\���T�KćC\��\�0(!�N�}\0\�@\�&)Xk�\��,��$�4�\�\�\�aD�\�\r�|\0��<)�|ؐ���d���Rfֻ;Kr\0\0\r \0\0E�Zl�\�\�\0\04�\0\0���@6a�/\�\�]�\�\�\n)ڰ�u\r\�<d:V���s2�\��֟o���\�,�q��	�\���_T+�+\�Z�\\���)+\��f�z݈՚ٓ\�\rmh/u�g��lV\�\�\�\�r\�\��\�$߅\�\�[�=��k>\�J\0���--V�e3�\�8��oZ\�\�\�kxC��G\�_\0\r\�[wY\�|���[�\\\�g�W\�@MՊOՍ\�D\��\Z�\�\��\�.\����\Z�!\�L=\�>G�G�;�y�pT\�\�g@�V\�Ysܜ\�̚G\�\�(f�@`���8k@\�ك��V\ZdS�%i/��#:\�1P�`�� \�91(\�xz�(\��\�	\�Ϥ\� \�a\��L\�BL���N\�\�ӌ�\�\�ٌ��M�\\%[1�\"ʅ�\�01K�\� 	2T@\"#r\����@��������d\���hԋ\\{p\0\0\r \0\0Iqd\�dm\�\0\04�\0\0k\�p\�.�`Z��\�%`�\�\�\�5��r��/4�Wq��N�m\�D�Ů:\'��\�˚ܧ��\�WT�O���0\��TH�o`#j[&.��\0\0N\���o�:\'/i�N�Q��ʍ� ��\"\�[��\�a\�a1��A��49\�=2,.\�1Rݗ	�E)�D�e\r�Bd*6��\�0?.\�,�\�@R�\�,ױ{��45)��ȁ���\�\�c\�,5�#����̢\�5�\�ծk1j\�����Mc\�o�&�\�A�\�\�Sn���A�\�\�Z���\0 1v/��&L�D�PZnoY���?��ZF���:�Мo�XӠ\�\r��ц�f\"�x�*L8H\�c3\n�)0�\�B��A�0e�2J%-Fg\�#+0#\�62��\�A���\�3N�\n\0���d��b\\R�{3r\0\0\r \0\0\�{[L\�m\�\0\04�\0\0�a*\�r\�^c̩����\�Y~5��\�\��oP\�\�\�K��Se�\�\�q�\nhQ\����?�7^\���\�����t\'��7A��\�g�e]�B��`\�hm�k�oyRCp50�\0�\�\�0,\�p�1�\�0K0�\0\�Q0�/���1:&3E#\�4*J� i1\nS�k1[��26sP�w231T0\�c 0Ds\�cc\0�\�@6��\�0N��5z.\���0q3���ɀ\���������\n�с ��)�`\n�b�6o��I\�\\?o�^�ް\�?ucq`(\0\0�{=o[@\0\0]�}z�j\�i�H\�v�\�1!~�\0�O�\�\Z��&i� rc	P�P�\n\0���-�B[�^ch��\�\�(%|�\0N����d���|1Г�\�\�\0\0\r \0\0�0�Ɉ\0\04�\0\0��b�V�/��ݳ��m�;:~fg\�y�\�ۼ�n\�\�ab\�mz�m{��c��YØ\n\��@DL�\\	��B@\��@t/�`<|��T ����L��\0@� (&\�xId�\��\n����ĵl	�\�	;\��̞��A2#�y2�\0\��4R��\�\�\��\�ˣ��\�/#P·g8�M�.�\�kl\�@�fz\�?�\��b3/�ևd�ؐq\�\�~6q�%�c\��ֿ\�\\O#o\Z�}!\��hY\Z./������\�\�+Tr\�1\�\"�z�;)�R���\�-�ʦ�j�[��\�I�0�B�i$�a�\�Ң�&�Lq\�U� \0\0T�x\�kr\�g\�0y�QN���*�%\�TQxX1�|��/\�`�C:L�\�W51E�W�Z�\�\����\�%$�k��a���d\��Khջ;ct\0\0\r \0\0��gLa\r\�\0\04�\0\0�0\�~R��:\\\�91c|\���\�Y\�\�\�\n8p��p�̾vX0P\��9��\�\�\�[͘/\'\�7^erԯ��d�x�9�\�uUH\� �K����\�p�\�@Pt�����Je�Hq�,��Q�,\nX+����`@\0�-�D(O\�\�\���9�=Z�M98I\�\�h�|\04�1\�TY�ħ�\�b�FӬaS\�֩n\���e\�w��n��{�\�\�\�%��[\�k\�,\Z\�|\�0&�])�+��,����WA`+P�%TJ1/�B��e�2+\�MS\��Pw)\'\�khro�}�\�2;�H���-�teu�l\�ehrKDn8\r\�+\�X���Z�7*�\n\�\��\�\�\0h.\�Wwra�h;�T\�\���\�Lgo�g�[i\�@\�᛹�2y �B`Qv\�}\�\�OK`^\����d\���h\�\��ct\0\0\r \0\0E�mG\�\�\�\0\04�\0\0W�%��\�봳�)&,Wn��\�v0�h�N]D\��\�\�sQ\���~��o�\�I\rs�͖V�\�Pz?��\�\�\�}�\�6��{\�E\�\�%[%�\�CK\�T\0ܧ\�Fa\�S9�o\"\�N�8��3 ,hb�\0\n)1\�\0��Z(@ �<z��\�&�C&-É�#A` \�`.��\0[\�2�vٝ�\�w%�_�C�Ξue9\�\�\�e��J񀚮�%v\�` &?eUUUU�ff\���\�z�|fc��%K�ff�̪�\��)�\�T\�\rD�i%�\0\0\�\�R��\\\��C\rL��\Z,A���\�\�\�0\� ��iX���g)0^Lf�Q���Z7\�VbVY�\�\'h�p1\�\�k&70\ZBkcɅB�H��0��Z�\�d�H\��\�(\�\\�\��Ó\�}$0T(6:O���d\��\�[\�9Cv\0\0\r \0\0\�cY,\�m�\0\04�\0\0B\�@tXd�B\�$r8��\�\�صV�K[\���\�\�If\�\�8\��\�Q�H\nD\"\Z�	��@DBEO\r\"4*�\�\n\���\�P\��t\��\�5�ؤ��0�#!��\n�q���Fp�|.\�+|\�0�Od&L1�vL\Z\�h\�n���\�\�DAL9��Ġ	\�/\�@\�<H��FFja\�&^k���z\'\0�\Z��e�ٲ\�\�L�\�md���\�7Y��1p�&Fa�)��\�B�\r�0\��f���0ve�\�����Κ��#�ONݜ\�i\\Pt-�\�����ޘ�\nh	��\0#ǃ\'K3�p\�h(�eh�aʲf/\�lQ�i�fg�q\�B(���e�\�p�\�\Z\�)K�,c8	\�s2\0��x\�`\�\��\��4\"\�\�CS�̫)=\�\����d����+\��\�`\0\0\r \0\0�4���\0\04�\0\0\�\�\�X0\Zh\�\�\�pp\�C%�\0$08`x8b�I0�Tba�H!L&e�\��\������\�ʤ\�|�Yݵ䄴��\�\�\0k�i�I�SF@�*\� \0`\�\�` a �\�`\��4`bjF\n(@j����\�b�V\�!\Za8	f&\�a�#:&\�c\�&F<b�*&.\�`�&\�sВ0�1� Lc2��,���ŠL\�����)&LlLE@�Y�i 4s�f�\�	f�EaX �p\���J9�������v��\�FbKVտ���7Տ�8\�\r\0{RFN\"D�I�\�\n�\��HAT�X���� 	\�?@(,\0`aR0&\�IB�0q(�0X\�\0p\�0d��00�c��0��	pP0	s���d��\�-M��\�b\0\0\r \0\0�0{��\0\04�\0\0�080608\\P�4�\"#)���=�D�\�C@DC\����\"\�D1�[��\0�\�P�c�%�LhF&\�b\��������Q8�\'}_ئ�U^`\rM\�]�\�΋R3Fp\�s*�B�\Z`\0H�`<`\�0\nC\r\�0H3\�\n0\"�м0��\r\�t0Y\�\"B�0~B��0)�\0\�M0�#\n�a0\�p�0B	�\�6$�80\�lT�b���\�&�0\�e�\�\�\�I\�CfR%\0a�\�à#\�\�r&��\0Ç\�覭��m�?������;\rE\��\n�]�\�:9jS��Hr�1�@\�\�cӑL,0@\�\nA�s��@\�oC\0�0���B�\�R\�ƂL/�R�\�I�0\r��\0\r\�o�&�\�Ҟt�>b�\n\�&&�F���d��!-M��\�f\0\0\r \0\0t�8N{��\0\04�\0\0�!R��\�ƣ.�b0��G\�+ `�g�ɲP&�%�\�\�X\�`P�[0��\0Q\�4@/�3�n?M��c�\�\�s�\��vf_�G7V\0\0	ͳ�~bS��729�\�(]�N���\�ڤ\�T4A8��_u\�ҌqSEHN,y\"\�\�[\"2OE!^����Y\�\\�b6��c�\">\�i�/�\�\��|�\�\�lFh\�P��.s�Bѱh\�QM�]��n+��@\0a��8\0\0��\'�18�\0��\0π�`�\�\0\�m@8�\�\0@�\�(\0\�\�0L\�\06 \�(m\n�\�r\�\n\�\�Q�\0\0\0�j\�O\�p\�\�\�fWV\�\�m�4�w�Tx\�@�iU\r?R\�\�\�\r(�\\��F��\�\�?�H\�ȗ߆�X�r){\�\����d\���,O�\�b\0\0\r \0\0-�[Mi-\�\0\04�\0\0\�\\��͵[Ľ�Ϗ8ݵ.��5�\�3\�:�\�\�Ȅ��`\�\\\�H�\�+�\��^\�T��>8HY즆>\�ay-O�&\�$IΕlDc�����^d�lItaB\�r+�9\�\\O��e����S\�\�(��Hz<��%\�32\�gP��y\�z\"��a�{e�\"\0#m�\�j\�\�@�n)\�l��\n�\��\���1vg��&�`Aë�;��ݸ�\�&?\������UMQ��jk�jua���U��\Z\�Q-?QEESb�<Ԯ\�-\"�q�%�UE|��W6*s\�t�\0t�1�\���6_L2e \0�jE�R_h}�h�X\"�4\����\n�\�\�)�v\Z ������BY�(���\"\Z\�=:0�Dv����@R8F3@b7%S/6�\\���d\��\�h\�\�{t\0\0\r \0\0�\rs�<k�\0\04�\0\0\�=�3��44Cu�\r�6�S5.B=X�FLx0X\�@��b.DQ\�z�\��\�?��\�zG�=�Ye�\�(י�`\� B\n�fu*ќm\0��ba`����8K��\�g����cZfM\�H6\r�\�$c9d\�R;7\�r!\��s\�e\�;H|�9���1T�\rLa湚Ɔ0fd��\�8��բ�B�L01K`X\��\�0�T`DP1 iUx\�a��^\� E�����������\�C\�In�\�ܔHQ15��\00bPx�b�K�g���C&&���\0� ��#I�Ɖ�&9�!!�\�A�q(�\�4\�L���FP	�;f� &��f*�fv�f`�\�,��t\Zf�\�z`�b\�(c!\\g��a�\�\�B\�!�\rFg�	΃�j1\����d��\�.M��\�f\0\0\r \0\0�6�\0\04�\0\0�\�D�t2�18,\0\0\�\�*-2ϋA@�\��\���������+r��{����Oz\�Y%���`\00\�K0z6$\�5$�0P?0\�0d�2\�b4|$28*3\\-1-]3A�4�;�2U\�6�M0��8(>4�5hr8t\�2\0\�1�0��6\�f&ϖ&\0�(&h\"& �\�8lXf\�Ѣ�bYbu\�:�m$�\�\�\�L�LXd�\�I&?�0\0�\� \�\�ل\�&3��H,c\�\�\�������\�^��\�\��\�\�ս\�\�^\�\�9\�AVbp\�n\�j,|f�d������\�\�AL`X�\'\�\��.L6/\�G>�\��A�\��jFsG\�c��$\�\�\�S�\�\�;ES\ZD\�.C�Q IS� �Lpj1�\�3A=�\�l8@�\�\'$�����d���\�/M�\�`\0\0\r \0\0`�2.���\0\04�\0\0�1K \�c�\Z%�A\0�p�E1�P\n\'\",��|Y\�.� P����\��������]v���\�\��/�\����-\Z�e)���0AX�\0Q�x%�\0ؐ:�)�a�\�0�\0Q��m�ي�V�)���!��x?9�Q�x.�v�	�0��\�\Z!�\��\"y�0��i�@M�@�8�/@G\��Ŏ�P��\�\�z�~40\�h�\�c�\�hZ1:�\�Bq�A�	f\n�4\n3��W\" 	�A��X���������^�#|\rM;����^\�w�\0 t��у�\�p\�+�T��D\r\0��� ��aȠN\rLaZ\�Q3LB%�Q\ZQ�\�C*M\�+�3()\�\�K\�3B��\�L3�\�\� c�46	F��F[�<.f0��\�\�f	1��R`L���d��\�-\��\�`\0\0\r \0\0��8.{��\0\04�\0\0(n1�d\nK0�\�	\�?�ƀf�IF\Z&`��!�*�A�>P-������\�4�O4W�[�Ha\�Q\�\�\�}�o\�SN��\�\�1O\�;z�G���\�p��(&\rA(�4v\0\�$7$���D<LN�Hļ\�\�\��ż\�n�|\�h\'\�	�\�\�\0\"�+Ƅ��TM�\�H�tPM���p*\Z��\�[\�7D��M{	L�.\�X\0��� \�\��\�1�\�\���D�X1\�2a3\�\�1�20,\r0З0\0e0|]0d0hH\� 6\r\n�\"Ih\'^|y��������\�Kb\�5�r�?�w\ZUՀ\0\0(\0\"\�\�G\�\�Ó\Z<��&\"a`L`\n040�0DZ1�D0H91�91��0\��6�b2|-4T 1S�&\0\���\����a��a�呞!��\�4��1�\�4A0���d����0M��\�d\0\0\r \0\0\Z\�2.���\0\04�\0\0\��L�1Y\�E0�8� \�\�\�?\n!Р\0(_1���d$��x\0D�`�@�(J�e\Z\�F�y�������\�\"\r��_wY;b��p��\�ڧro�Dbaa.\�.c:�\0�AA��\�\"-�%�`����4M\�gX�ٸ\�\r�t\�e�ȇ#�\�\�1�4� \�3F`\r\�\�0\��\�c#	\� �4x�\���7!�5�3<3G�\�~3�Z,��\�\�2�D��M9dɤL\n�\��86\�E���Ҋ\��������)k�\�\�\�%I�ay& ������\n��f)m�&\���L��	\�\Z�\�$ \0X��H\�ƈ\�\��Գ\�\�b\�٣x\�gtق`�\�\���\�\�S�\�`p�o1�2hs4�#1�_5h]\Za�\�\"\�P\Z\r>�2�\n#\�\�	1R�\�\�\��®\�dL5�6�\����d����.\�;�\�b\0\0\r \0\0ص:Nsi�\0\04�\0\0\�\�S���3+\�8�`䉅�\n�\��3\nL(1ء(�&c\�\�?\�\�\�?�������\�f\�1v3u�y��ި\0	\�\��\�\�\�p�\�6hґ\�\�\�\�\�\Z���4ȑ4��`ő�\��\�\�3�\�p,Ɛt\��,\�d�\�b\\\�\�L\�q�\��\�1�\�\�\�h\��ıH���\�`�\�T�\�\�\�\�q\�Rl\�x8�2�F\"+	�\�Z\�9d\�DLv\�`��΁�\\|F�`bƴ\�r�fNBDx!;�1R\�\�\�^ ����\��������}\�J��/\�U�{\��mKw2\0A\\<M\�.�Q�<䌔h\rN_M;\'\�d(LQ\"LgC�\�@�\�E\�3;F�\nC�\�4O��c�P1&gm�``	~e\�h\�xf�Ze��k1�d�\�jh\�cP�dIXep>h\0ِ!&9\Zl\�hÁ�����d���-L�\�b\0\0\r \0\0��0n�i�\0\04�\0\0\�7�c\���\0\�3�,>dRш���j`�9�� 9��`��-j�&p#\\����������V�\�\���\�|�\0�Ɏ`\�$��k\Z:�l՜P�� ��\�1�\�T\�\�\�\�\�є\�\�8�Qѐ\0\�`�\�C�\�r4Ʋ\�\�c�\�\�|\�#@�\�\�P\�τ\�\�A@Ȑ�\��\��±\��\�X\�!C�@��h\�\���Mb9�f[<�!ȍ\�H\Z�,�`@<H\��L(�\0`\�R#b]�|\�������봧\�}d��K�\�U\0@\0x �Â@���;<�X\�&�ɆF	�&p4|�f`1�FIw\'\�s�\�\�\�fĞ��TfuɃǄO�c9L\\�1*�\�\�#f��\�7;Xƈ\�Hx�l��\�\�a�H�hr�#\�\�a���d���-\��\�`\0\0\r \0\00�4N���\0\04�\0\0�h�e(8�c�I�� P�����\n	@\�0h�`\�	À�\�f�q_������\��aP\�i\nW\r�/\�N\�8Ѥ@\�z�\"��(\�eA�o\�x;`Ƞdx\Z`�&@Xa\�\n@�`�F\r�&ar!\�\�`ajF,�a\�<F�2c\0���ar�®`\�R\�id\�f\�Z\�\�<\n @����0]���A�\'��d&58hסW\�\�E3X,\��[\�\�i4���.�Ă&�\�\�@\��˦UI�Rd\�1�\�\���\�\"�R�=k������\�\�\�~\�p�\�߹��j\�*�tU�fJ�d��\���\�x`C�A`��L.A���L,@\�\� ]�L�\�8�#H\�\�ŴL)D\��u�#Bl�,/\�C\���+\�/è\��J��0Q�^\�Ø-�����d��\�-͛�\�b\0\0\r \0\0ط.���\0\04�\0\0à)\�C�EL8I\0\Z\�Zp\"f�i�;&���ǂgY1�u�t񩅈�\0�*apI�Ŧ~,�a\0�ph!�ѩ(��������\�e,�,u\�u\�h `II@s\0�8\"\r\�%L\��\0\�T\0[�`Xa@\nard�z	\��A�\���\�A�c��������\�1�\�8X4$u>ln1p�2h�3LQ2�z1��0�\�1\�1�2( \��A|ë3$0N7�X0�b	\0,\�G��X\�t�@�2�@`��J��\nkA�	0\����\��������f]-�F\�}�x��O�\�|\r�\�\�54R�\�|�)!`1�\\sB#C\�PS=ţE�\ZPD3�2c�\Z�\r�>\�MQ\r�\�o�b\�7M�9\�\�9\�a\rL\'\�\�,Ly�+���d��T-L��\�b\0\0\r \0\0�6\����\0\04�\0\0L��\�$L�_2�<�.\�CM�K�9�� \�1#jAI\�Ƶ�*\rP\�\�^e5�\\��\�i\0I#�,�Vow������㱞K-FP�\�\�ܑ�~��@S�\�\0�\�z��*V�`\�8�\�1\�`\0�f\�`kb&m�be&j\�dE=�f9@l�\�U\�6<�0�j6c\04�\�7Pk3\�A2\�70�_2@Y7(�\�H\�O��J�+\n\��4��\�H\�;��(1Ȕ\�(sa\�V0X<\rDL@X0�4���� A\08X\�f��������\�K\�RG\�n��v\� p���@�B��P\�?0\�D&�2�\�hiLx�,\�f\�\\LS\r�MNz�M\��[Jwi\��LQcND�=_M:[�w��6G�Ͼb̗$�\�\��q��H��Gɞ�Q���d���-\��\�d\0\0\r \0\0��2���\0\04�\0\0��\�bx\�\�3F�I!F,A	eb�\�\�De�p\�k\�\�YG|7��Va`A�Ba��0E2�\�#�`\n1a$��K�Fo�������݊Y\�u/\�+\�!��@X300\'FC\��&nP\'�\'FN\�\��fi	�7\'\�b:�0��^F\�\�\�C�:\�ͧ\\jF}�F8�\��R$\�\�\�0˅\�a�\�\�H\�\�\�3`\�4(Ȳx\�PX\�T$\�\� \�\�sG�s\"~���e0э�Pǉ�\�\�\�T�g4�܀\�\�RF*\0\�2`P�0\Za`�\0�\0(^jl������\�Xy\�v%�T�U�\��:0<0�)2��0\�n5�><��:\�J;0\�2F�1$1lG2eF5(�3\�\�2�>4t�1j1\01@�0}C9{\�3$\�3� FG,\�c.I�e\�ãDsуQ���d��9-J�\�\�b\0\0\r \0\0��*.���\0\04�\0\0�F\�s�\�H���B\�~5�sN�4U\�X\���H���̘��-lk)dD�\nb	J&HP�(!��B���R�������z�%�\�\�,q���\0 L� \�\�\0$�!�\�)\�\��\�:\�\�1\�\�E|\�0\�\�cA\�L\'�4�\�\�\�C\�͌�2�dȠCt\�\�Ap7\�\�\�\�3	�\�\�66\"\�*�ߤM\�8\�4\��C���R>3 ,ƭs!�22\��l5�w51P4�$�8��	ٮ,\ZY��h�8 4` �lT`���@�)\�����������$:\�[{\Z{8���:\0 ��\��H\�C8ƣ �Q��\�\�\�&�#\\�\'if!2a�(m\�\�n�\�bBcj\"ez~l�nt�D��5�&\'rR�\"��n��\�h��y Q4j\�:��4�Z�F���d\��\�.J��\�b\0\0\r \0\0l�,N�i�\0\04�\0\0.\Z���\�a̎\'`А\�ގ�:��\��������q�(��q�&�0g��Ҡl,o��d�\�;�������YhN\�G%\�h��\�\���\�\"\'\�+�\�5�J�f+2�F)��j�FFI�F�-F��F=���}�&ʀ椏\'�Ǥ>&����\'����I&\�\�F�X\�GP.���fڗf\�\�\�掖Q�& �F9�f\�,�EH�\n\�Y1ƫ��p\��ƍ�\�F ��&\Z0�A�@\����WL�\�\n\�C�\�`\0,(\�_\�\�������^= ��<�E+�/7�\0 %��\�\0(1Rp�\��B\�ph��9�\�m#)�x��\Z����!��)�p1�TL:\�(\�l\�)¥fA\�`.���d���-ʓ�\�f\0\0\r \0\0Ե(���\0\04�\0\0%��cF&!�$C�`0�\�С`&��cd��L\�\�F\r9��0\�L\�h3����/�MVL\0����\�9�\�60��*\0u\�p����������R���⢕Z\��_�ˆ`@>PX\0�L\�A=��π�\rH�&�f$�cF@�&	�K�fy}f\�F;$F�a�p�\�f��j)�b\0�a�Da\�|gq\�fa�`��g8�b��aHlb\�Pip�`Pcp)��\�\"�\�&gy�C\�P>`�\����\Z<�\����A�@jh������\�htl���������\�~r޻I\��1H0 �d��IfQ�|9\�\�\�T.P&\nAP`�&�d`��`�cF�&�n\�a\�T�.JaR$Fac�\�<�\�a�8\�!\��b2\�2xa0f6���d\��:0M�\�d\0\0\r \0\0�6w��\0\04�\0\0�hc�Fa\�a~f	Cc*@\�\"aP\�Y;�T|7i��\�ِ Vl����F�ӛDLe\�\�d\�ւ\�D	�0\� �	Lp[!\rt\�!s\�IW��B.�\�\��������\�ewj\�M\�+\��ߢ�6C��F1�D\��C\�-I��\" H\��!\0�ς	��h\�9[<\�\'A#9�Sf\Z$�g0	�\0�_\'�\�Dk���/\�NQo��cС�B b� 2�3�;0��[�7W0�a�\�\r5�\�2��y\�[%Q\"\�>��\�A֛� r>\��������\�Ƃ\���C�R\00\0P\0�\�F�]�L�D`Ҭ\Z�\ZD0È7\�#A�\��xVo0r\�*�(!\���)��K����T\\�$F�\�.�\�E�2��\�7�|\"��P�\�K���]��c�{���d\���,\��\�b\0\0\r \0\0��:nsi�\0\04�\0\0�fJ\�U�&ufIfU-\0��_�x\�i�A\�҆�,\�TiY�����ahR8T�c\�Z(��f1EE4�\�,$�IYN\������\�W�G\�T)��#yR\�\�CGp\0\"�<a䁆\�\�\�4�n\0y��$<l\�Q�Ȇ+F[�\�Z�F\r�R�mC\�\��\"bđ��!�b\�b��\�Q� 鏦�}1 �\���$���=�&�A\�	@\�#>4z9r0�;=PY��i�e���\r0j\�g��+9F@`#\�\�Z�ű7�������\�]�$3Te\�*j9��:[]�\�u�\�lL\Z�\�W�\�\�%!�x�\�7L0\�\�9\�\��2\�\�ܦ\�9A�#�;�.\�1߰�곿=\�-�4t� m�h4�f�A\�\�\�S8jeWI����d��q.I�\�\�b\0\0\r \0\0(�.nwi�\0\04�\0\0I\�s�\�\�n���D\��äckH1�4Jy�A�\\� \0�g \�\�Pj&�6A\�T/I\�<\�(d�\�\0`�p9g\Z\��\�,\�;�������\�\�T��\\��an0��\�4�\�\�\�\�a\�@h\�\�\���\�\�P\�@\��;\�=�\�u����[\�\Z�\�֘\�C\nH\Z�P��s\��\'\�R��S�H\�s\�9��<�\�!�\�!��#�ɠ�^q�fFc\�Ǝ\�#44G�a1\�Ы����y���0�x(,`�� �HU�X�\�������\�a=~�\�\�Y�U\0f��\�\Zb�r�fxTg���F���g	\�Q�q�&\�!f\�\��\�%&;Ƌ\�\'\�\'ơ����&o�F��f\�1f\�$f\��&;�\�f�fM\�f�\�F�����d�&Q���d\���-ɋ\�\�d\0\0\r \0\00�$�i�\0\04�\0\0F��eq�!�\�Fu\�ké�A�-��`dA��&\n\Z��N\0�$xb�錀\0��@\0 Y�B��pɯ)CCcT��������+7lc3:\�h4��0\�4`25~i5VP;6S95\�2\n::�C	��JR�@\�\�H\�cVAi<\�\��5\�\�\� �z\�Ed\�\0�\�\�\�Cϔ�\�4\�\�hX}r��$\Z\��;l^�t��\0�\��\�GC�f`AцڦB$�h�7��:pr!�DF\�,a@Y�EB�±4L�G�#G\�\�UCh\���\�Z������.Y�.�3pU\�Mu\nqLᒍl�M,��\�	\�\r�l\' )(��%\rQ3(\�\�b3R��H|��Ӫt\��\�0����\�k�A�X�n$;VsC����%\Z=@d1�4�\�E��Zh�9��\����d��+\��\�b\0\0\r \0\0�����\0\04�\0\0�\'\Z\\\"dD���\��&�f$���I���\n&*(�@s\�@âBP\�_��\�,\�4�`@s��p\nz3iu\������\�fr�7\�\�~[\'��ղ�\0`�bcEpsi\�g�\�tf).>L�&͉)\�S\�@\0͟K\�N��R,�?\�puM\'\�d\�J\r�LtL�u�LOX;M�a\��	́�\�*MgU\r>3J̅�1�G\�\�a�����F~#L2Q\�3��\�@cS�\�x�8*\�\0�0X��0\�g�(\Z)z\��0\�4�&�\�y�?6�������Z�d%\0ph$[��ryc\�\0@\0��u\ne�:x�\0�dC`��\�{���D�Pt\�\Z*���\�J\Zh��Q�Mfj�Y�&\r��f]F�������������#����d���\�-\��\�f\0\0\r \0\0ܿ$n���\0\04�\0\0��)��a��i� \�a14(0\�0W�U�\�\�\�Jt\�M\Z,\�$͌Hň̘`\�\r!�a��@�C�\�TC\�i�\n�O3cX�������5�؋LYC�&���ίb�	��Fh�^w]!��9b�\�^|\�!�\�7\0\�\��\�D\�\"��\�\��h\���\�B#hՔ2u�\�i���\�?�L���\�>�+\��F��9�F���\0ኅ�\�$k\��&�\�a_!!�\�̙�B\�S0`h�PB�$� \Z��c,~��~�o������\�\��\�RJ%�tŜ	\�E	L��һM�E��01�\�h^��\�\r�O�7L@ͼwL\�8\�\�$M�nLnW\�&LF�I \ryR\��ye5��2�\�4�^1�\�3a5,:3�E61�?1,X=LB2�K���d\���/J��\�`\0\0\r \0\0 �(wI�\0\04�\0\0\�|\�7T\�\�\�&�\ro3��ީsV��Q3p\�10ɬ\�\�#�\�u(0`�N/\�\0#B\�08\Z\�5\�\�7Kw����ܭ\�VP\�?�Tj\�<�\�V\�1̗2;�>\"8�9\�\�=\�\�9�\'4L:�\r2�\�3�=1]�4\�\�6L�4mK20.8Zn2L6i3U�=d�0��3P�1@UQcCᰄ���4\�U3T�0<\\0 3̦̕cB�hᱎ�\�nN8\�080ݖN���jV63ã.62���\�C7\'i&.�\� �	\��\�\������\�kѾHk\�9Cw5R\�\0p\0\��\���3p\���\�|ϧT\�38\�1t\�\��\n�`^v���h8!\�F��\Z\�r&�:\�D\�E�W�\r5J7\�\�@v0��\�\�cr�R-5����s+,��[$@;���d��H.ǋ�\�f\0\0\r \0\0���i�\0\04�\0\0�\�L�\'�2\�341�3=\\1R��4c1A\� A2�� �����\�L]=���Z\Z\0�Q\��U�����\��IU��H\�VqǗ\�\�\�\r\�h`�Ly��_6�qu�YS\�CL�!�\�#4@M�:�S\�\�\'�#D\0\r�S4acBcbWCJ#-s;\�6�i�S38̓AH�SLsB\�B��\���p\�Q\\̱x\�9\Z\�\�f\�Z�\�,�uL�\�1�(\�D��=2\�(ˡ��!\�\�\�T\�`�\�Y���G��5\�Ƨ�����\�Zn���/{%��q�\�	㑍?q��\�MY�+�9R\r��́\n���*$f��]&TI��mWY\�Pf;)�EN`\�yȅbB\�c\r��8*P\��c\'�̈�3*t�L#����d���.ț�\�`\0\0\r \0\0�� .���\0\04�\0\0�,ɽ��!��\Z{�G�\�	\�nUx�\�\��\�Ŝ�\�M�\�F�#*���b	�Hf:\n���\�#GD;�S]\���������ҙ<\��|�u�ysMc-ec>UCH	#T�S3Vs>�#\"���\�B���<6�\�Ǌ��\�`\�=�\�\�у\Z��45a�\��\�O��F3I!��F\'s*\�0�\�\�\�C�\�P\�f\'0.4�1��� S=A\rv*0�T҅\�\0��^!\�\nc�CFr,\"a�a���P(��}�\�р�̒SIG�������jP\�l\�\�\�ۧ�7IWj\00;\�O9\\ \�\��8<OYc1\� \�$s\�\nΒ�1\�?5l�2͑5.\�2h{0�3\�M4�+3Fp6��6,\�2�\�3�a2�\�5@�0U0�\�3��3D[2l�0�2\�D0��I\n`)���d\���.G��\�b\0\0\r \0\0���\0\04�\0\0�:y�84n29\�c&L�b��X&%��NbqA�L\0�٪���I-�TpfpY��\�)�\�\"j!�K�\��������j�,�YL�B\���Gz����у[9�j��/I�M\�ĩ�\�y�$a�$����l\�\Zz��CƎ��s\�e\0ɭW\���ɬ50t@\�kC\�\ZL\�2\�\�\�s)L�6<\�\0?!��q2�$ԁ�?�\�|5ۼ\��I\�L�=�$\�\"��,ecy�\�\���`*|2��Y1A\�f\�	@F\"	@ `{a�\�P{o�������V��OnQ\�(\�V\�J\0 \�\� \��#J\�c5y�0S�\�,\�b_3	N\�<\r�\�#-��xk?4��}N\�1rc\"\��T\n�q�d�i)\0��S \rB1(�\�bD\r\����d��=/F�\�b\0\0\r \0\0ܻ\Z�\0\04�\0\0\�m6`@Ѫ`<5s\�*Z\nȞ\�٬똺)����P\�\�efT\�\�ptaf22*j��\�\\��\r�Д	�0��7�����]�S�\ny\�}[���\�\�+������.�Ś�ϜL��g��k�T����ؽ�P�\�@r��a�j]�]��6\ZH(f�\�`LA�K\��JhC��\�\��diPY�B`���Ć{I\�\�@��\�`���[f�@��`\��G\�~5���m\ZPg4�T\�f��\�Rx0b!\"@0%�]��(�U��%ɖ\�\�\�xR���\��\�]ת�P7\��\�8U\0\0\Z�@\0x�\���f@l`\���\n\�(5\�r����Á���`٢��Ax\0�,\\ \r\0�\�p5\�,�\0\�\�0h\0h\"�\"�@@\�`@P\\�@\'�T\0\�p����d\��\�/G��\�f\0\0\r \0\0(�U\�\0\0\04��\0�L1\n@hn\0���\�\01Xc�7Pc��a��m�\�Aے\'�v\�\�\�E\�I��\�i�\0`c0l�\�Ħ2a�\n\0p	LPc����\�\"�\�\"\�rE\n�\\������p��|��p\��i�!���������x*M;K�1�Y\0\�.R)C�1\�4\�6\\7\�9j;�;\�8U�7�ڣI�\�5�\�\�Q�ݳV\"\�T1dL�!QUS1QUX��3fi\�a˹ɖ�,�\Z��\�?�\���]\�I�<o�]�\n��I�\�P�� �_�(Q\�\n	\n;A](((($((((%LAME3.98.2UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU���d�\0��M�n�\0\0\r �\0\0d�*]�\0\0\04��\0UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUULAME3.98.2UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU���d\��\0\0i\0\0\0\0\0\r \0\0\0\0�\0\0\0 \0\04�\0\0UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUTAG\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0                              ','horse.mp3',0);
/*!40000 ALTER TABLE `recordings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-03 22:33:45
