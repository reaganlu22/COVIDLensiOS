DROP TABLE IF EXISTS `user_account`;

CREATE TABLE `user_account` (
  `$userID` varchar(32) NOT NULL,
  `$userEmail` varchar(64) NOT NULL,
  `$userPassword` varchar(16) NOT NULL,
  `$userData` varchar(255) NOT NULL,
  PRIMARY KEY (`$userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `user_account` WRITE;

UNLOCK TABLES;
