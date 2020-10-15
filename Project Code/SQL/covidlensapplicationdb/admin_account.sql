-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: covidlensapplicationdb
-- ------------------------------------------------------
-- Server version	8.0.21

--
-- Table structure for table `admin_account`
--

DROP TABLE IF EXISTS `admin_account`;

CREATE TABLE `admin_account` (
  `$adminID` varchar(32) NOT NULL,
  `$adminEmail` varchar(64) NOT NULL,
  `$adminPassword` varchar(16) NOT NULL,
  PRIMARY KEY (`$adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `admin_account` WRITE;
/*!40000 ALTER TABLE `admin_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_account` ENABLE KEYS */;
UNLOCK TABLES;