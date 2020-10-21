DROP TABLE IF EXISTS `map_locations`;

CREATE TABLE `map_locations` (
  `$locationID` varchar(32) NOT NULL,
  `$residenceHall` varchar(64) NOT NULL,
  `$latitude` varchar(64) NOT NULL,
  `$longitude` varchar(64) NOT NULL,
  PRIMARY KEY (`$locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `map_locations` WRITE;

UNLOCK TABLES;

