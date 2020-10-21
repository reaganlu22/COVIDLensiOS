DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `$timeSubmitted` timestamp NOT NULL,
  `$residenceHall` varchar(64) NOT NULL,
  `$age` int NOT NULL,
  `$phoneNumber` varchar(10) NOT NULL,
  `$affiliation` varchar(16) NOT NULL,
  `$locationID` varchar(32) NOT NULL,
  `$reportStatus` varchar(16) NOT NULL,
  `$reportInfo` varchar(64) NOT NULL,
  `$situationDesc` varchar(64) NOT NULL,
  `$submitterID` varchar(32) NOT NULL,
  `$confirmerID` varchar(32) NOT NULL,
  KEY `$submitterID` (`$submitterID`),
  KEY `$confirmerID` (`$confirmerID`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`$submitterID`) REFERENCES `user_account` (`$userID`),
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`$confirmerID`) REFERENCES `admin_account` (`$adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `report` WRITE;

UNLOCK TABLES;
