DROP TABLE IF EXISTS `alert`;

CREATE TABLE `alert` (
  `alertID` varchar(32) NOT NULL,
  `title` varchar(64) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`alertID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `alert` WRITE;

UNLOCK TABLES;
