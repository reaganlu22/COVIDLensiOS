DROP TABLE IF EXISTS `resources`;

CREATE TABLE `resources` (
  `$resourceID` varchar(32) NOT NULL,
  `$title` varchar(64) NOT NULL,
  `$cateogryName` varchar(255) NOT NULL,
  `$linkResource` varchar(64) NOT NULL,
  PRIMARY KEY (`$resourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `resources` WRITE;

UNLOCK TABLES;
