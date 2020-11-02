DROP TABLE IF EXISTS `admin_account`;

CREATE TABLE `admin_account` (
  `adminID` varchar(32) NOT NULL,
  `adminEmail` varchar(64) NOT NULL,
  `adminPassword` varchar(16) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `admin_account` WRITE;

UNLOCK TABLES;