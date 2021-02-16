-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 02, 2020 at 11:54 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covid_lens`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_account`
--

CREATE TABLE `admin_account` (
  `adminID` varchar(32) NOT NULL,
  `adminEmail` varchar(64) NOT NULL,
  `adminPassword` varchar(16) NOT NULL,
  `signedIn` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_account`
--

INSERT INTO `admin_account` (`adminID`, `adminEmail`, `adminPassword`, `signedIn`) VALUES
('5f9df1e9b3499', 'Admin5f9df1e9b34bc@covidlens.com', '12345ABC!', 'true'),
('5f9df24f14abc', 'Admin5f9df24f14ace@covidlens.com', '12345ABC!', 'true'),
('5f9df293818f2', 'Admin5f9df29381900@covidlens.com', '12345ABC!', 'true'),
('5f9df3e43a022', 'Admin5f9df3e43a030@covidlens.com', '12345ABC!', 'true'),
('5f9df42810c2f', 'Admin5f9df42810c44@covidlens.com', '12345ABC!', 'true'),
('5f9df4ed60511', 'Admin5f9df4ed60525@covidlens.com', '12345ABC!', 'true'),
('5f9df50cc4e41', 'Admin5f9df50cc4e4a@covidlens.com', '12345ABC!', 'true'),
('5f9df54038dac', 'Admin5f9df54038dc5@covidlens.com', '12345ABC!', 'true'),
('5f9df5b23dbd9', 'Admin5f9df5b23dbe2@covidlens.com', '12345ABC!', 'true'),
('5f9df5cf42cf5', 'Admin5f9df5cf42cfe@covidlens.com', '12345ABC!', 'true'),
('5f9df5df917d0', 'Admin5f9df5df917d8@covidlens.com', '12345ABC!', 'true'),
('5f9df640d9747', 'Admin5f9df640d9751@covidlens.com', '12345ABC!', 'true'),
('5f9df65e788a6', 'Admin5f9df65e788bf@covidlens.com', '12345ABC!', 'true'),
('5f9df68608183', 'Admin5f9df68608198@covidlens.com', '12345ABC!', 'true'),
('5f9df760ca378', 'Admin5f9df760ca38d@covidlens.com', '12345ABC!', 'true'),
('5f9dfa8e3e730', 'Admin5f9dfa8e3e747@covidlens.com', '12345ABC!', 'true'),
('5f9dfee8d3f5b', 'Admin5f9dfee8d3f74@covidlens.com', '12345ABC!', 'true'),
('5f9dff3f3bfb7', 'Admin5f9dff3f3bfd1@covidlens.com', '12345ABC!', 'true'),
('5f9dff4890a88', 'Admin5f9dff4890aa9@covidlens.com', '12345ABC!', 'true'),
('5f9dff77e1ed2', 'Admin5f9dff77e1eed@covidlens.com', '12345ABC!', 'true'),
('5f9dff967b0e2', 'Admin5f9dff967b0f5@covidlens.com', '12345ABC!', 'true'),
('5f9e03e82d39b', 'Admin5f9e03e82d3a5@covidlens.com', '12345ABC!', 'true'),
('5f9e043fcbc0d', 'Admin5f9e043fcbc19@covidlens.com', '12345ABC!', 'true'),
('5f9e0578d7053', 'Admin5f9e0578d7067@covidlens.com', '12345ABC!', 'true'),
('5f9e059454e1b', 'Admin5f9e059454e26@covidlens.com', '12345ABC!', 'true'),
('5f9e066a9aa0b', 'Admin5f9e066a9aa1b@covidlens.com', '12345ABC!', 'true'),
('5f9e0671283c3', 'Admin5f9e0671283d1@covidlens.com', '12345ABC!', 'true'),
('5f9e06b590dce', 'Admin5f9e06b590dda@covidlens.com', '12345ABC!', 'true'),
('5f9e072547043', 'Admin5f9e072547057@covidlens.com', '12345ABC!', 'true'),
('5f9e09b36177c', 'Admin5f9e09b361788@covidlens.com', '12345ABC!', 'true'),
('5f9e0acc43c56', 'Admin5f9e0acc43c5f@covidlens.com', '12345ABC!', 'true'),
('5f9e0aff028da', 'Admin5f9e0aff028ee@covidlens.com', '12345ABC!', 'true'),
('5f9e0b22a0aec', 'Admin5f9e0b22a0afd@covidlens.com', '12345ABC!', 'true'),
('5f9e16b5611e2', 'Admin5f9e16b5611ed@covidlens.com', '12345ABC!', 'true'),
('5f9e176bdd85b', 'Admin5f9e176bdd869@covidlens.com', '12345ABC!', 'true'),
('5f9e17a0626bd', 'Admin5f9e17a0626cb@covidlens.com', '12345ABC!', 'true'),
('5f9e1800ce0fe', 'Admin5f9e1800ce109@covidlens.com', '12345ABC!', 'true'),
('5f9e184443da6', 'Admin5f9e184443db0@covidlens.com', '12345ABC!', 'true'),
('5f9e188515742', 'Admin5f9e188515757@covidlens.com', '12345ABC!', 'true'),
('5f9e1c3d1ef67', 'Admin5f9e1c3d1ef7c@covidlens.com', '12345ABC!', 'true'),
('5f9e1de4c391b', 'Admin5f9e1de4c3931@covidlens.com', '12345ABC!', 'true'),
('5f9e2033cafea', 'Admin5f9e2033caff4@covidlens.com', '12345ABC!', 'true'),
('5f9e206ec8554', 'Admin5f9e206ec8561@covidlens.com', '12345ABC!', 'true'),
('5f9ff20a5edde', 'Admin5f9ff20a5edef@covidlens.com', '12345ABC!', 'true'),
('5f9ff2fce701e', 'Admin5f9ff2fce7028@covidlens.com', '12345ABC!', 'true'),
('5fa058203e06a', 'Admin5fa058203e081@covidlens.com', '12345ABC!', 'true'),
('5fa08bbc9a210', 'Admin5fa08bbc9a21c@covidlens.com', '12345ABC!', 'true'),
('5fa08bd2eefa1', 'Admin5fa08bd2eefb9@covidlens.com', '12345ABC!', 'true'),
('5fa08bfbb242a', 'Admin5fa08bfbb2442@covidlens.com', '12345ABC!', 'true'),
('5fa08dfd94d50', 'Admin5fa08dfd94d6f@covidlens.com', '12345ABC!', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `alertID` varchar(32) NOT NULL,
  `title` varchar(64) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alert`
--

INSERT INTO `alert` (`alertID`, `title`, `message`) VALUES
('5f9df252187c8', '2020-11-01 00:25:06', 'A cluster was identified on ...'),
('5f9df5433c50b', '2020-11-01 00:37:39', 'A cluster was identified on ...'),
('5f9df5d2460ec', '2020-11-01 00:40:02', 'A cluster was identified on ...'),
('5f9df5e2950d7', '2020-11-01 00:40:18', 'A cluster was identified on ...'),
('5f9df643dd37a', '2020-11-01 00:41:55', 'A cluster was identified on ...');

-- --------------------------------------------------------

--
-- Table structure for table `map_locations`
--

CREATE TABLE `map_locations` (
  `locationID` varchar(32) NOT NULL,
  `residenceHall` varchar(64) NOT NULL,
  `latitude` varchar(64) NOT NULL,
  `longitude` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `map_locations`
--

INSERT INTO `map_locations` (`locationID`, `residenceHall`, `latitude`, `longitude`) VALUES
('5f9dfa915718b', 'The Province', '106744840359415', '63572375290155'),
('5f9dfeebdcfe7', 'The Province', '106744840359415', '63572375290155'),
('5f9dff4242ea8', 'The Province', '106744840359415', '63572375290155'),
('5f9dff4b95bc0', 'The Province', '106744840359415', '63572375290155'),
('5f9dff7ae80a5', 'The Province', '106744840359415', '63572375290155'),
('5f9dff9980fe8', 'The Province', '106744840359415', '63572375290155'),
('5f9e03eb33e20', 'The Province', '106744840359415', '63572375290155'),
('5f9e0442d284a', 'The Province', '106744840359415', '63572375290155'),
('5f9e057bdc8a3', 'The Province', '106744840359415', '63572375290155'),
('5f9e05975b1a0', 'The Province', '106744840359415', '63572375290155'),
('5f9e066da218e', 'The Province', '106744840359415', '63572375290155'),
('5f9e06742c98b', 'The Province', '106744840359415', '63572375290155'),
('5f9e0b02166da', 'The Province has changed', '63572375290155', '106744840359415');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `reportID` varchar(128) NOT NULL,
  `timeSubmitted` timestamp NOT NULL DEFAULT current_timestamp(),
  `residenceHall` varchar(64) NOT NULL,
  `age` int(11) NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  `affiliation` varchar(16) NOT NULL,
  `locationID` varchar(128) NOT NULL,
  `reportStatus` enum('CONFIRMED','UNCONFIRMED') NOT NULL,
  `reportInfo` varchar(255) NOT NULL,
  `situationDesc` varchar(255) NOT NULL,
  `submitterID` varchar(128) NOT NULL,
  `confirmerID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`reportID`, `timeSubmitted`, `residenceHall`, `age`, `phoneNumber`, `affiliation`, `locationID`, `reportStatus`, `reportInfo`, `situationDesc`, `submitterID`, `confirmerID`) VALUES
('5f9fe1bf561d6', '2020-11-02 10:38:55', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fe21018f15', '2020-11-02 10:40:16', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fe210d8f7a', '2020-11-02 10:40:16', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fe421e2bef', '2020-11-02 10:49:05', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fe5e9dec45', '2020-11-02 10:56:41', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fe6397d7a9', '2020-11-02 10:58:01', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fe63bd4867', '2020-11-02 10:58:03', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fe66a70f80', '2020-11-02 10:58:50', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fe976c29ba', '2020-11-02 11:11:50', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fe9acd93da', '2020-11-02 11:12:44', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fe9af213b4', '2020-11-02 11:12:47', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fe9c501423', '2020-11-02 11:13:09', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9febfb2738e', '2020-11-02 11:22:35', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fec55411dd', '2020-11-02 11:24:05', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fed06c343d', '2020-11-02 11:27:02', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fedbacae84', '2020-11-02 11:30:02', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9feece76160', '2020-11-02 11:34:38', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fef0cd7bd1', '2020-11-02 11:35:40', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9fef805e9b3', '2020-11-02 11:37:36', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9ff083506ff', '2020-11-02 11:41:55', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9ff0a56c9b2', '2020-11-02 11:42:29', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9ff0ec8d609', '2020-11-02 11:43:40', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9ff189396de', '2020-11-02 11:46:17', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9ff20a82119', '2020-11-02 11:48:26', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5f9ff2fcf2d4c', '2020-11-02 11:52:28', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5fa05820494ce', '2020-11-02 19:04:00', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5fa08bbca66d0', '2020-11-02 22:44:12', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5fa08bd3023c9', '2020-11-02 22:44:35', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5fa08bfbba515', '2020-11-02 22:45:15', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc'),
('5fa08dfd9d3d1', '2020-11-02 22:53:49', 'Spartan Village', 19, '3362529389', 'Student', '336', 'CONFIRMED', 'Tested at Cone Hall Hospital', 'Tested on October 12th, 2020.', '5f9e7b24a512e', '5f9df24f14abc');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `resourceID` varchar(32) NOT NULL,
  `title` varchar(64) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `linkResource` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`resourceID`, `title`, `categoryName`, `linkResource`) VALUES
('5f9e211bb49f1', 'Latest News', 'NEWS WHO', 'www.who.int/news-room'),
('5f9e213318355', 'Latest News', 'NEWS WHO', 'www.who.int/news-room'),
('5f9e2133e9ec4', 'Latest News', 'NEWS WHO', 'www.who.int/news-room'),
('5f9e2134aa435', 'Latest News', 'NEWS WHO', 'www.who.int/news-room'),
('5f9e2a2a418d9', 'Covid Lens News', 'Health', 'www.covidlensapp.com/news'),
('5f9e2a2c9181f', 'Covid Lens News', 'Health', 'www.covidlensapp.com/news'),
('5f9e2b82464bc', 'Covid Lens News', 'Health', 'www.covidlensapp.com/news'),
('5f9e2bc699947', 'Covid Lens News', 'Health', 'www.covidlensapp.com/news');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `googleID` varchar(255) DEFAULT NULL,
  `userID` varchar(32) NOT NULL,
  `userEmail` varchar(64) NOT NULL,
  `userPassword` varchar(16) NOT NULL,
  `userData` text NOT NULL,
  `signedIn` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`googleID`, `userID`, `userEmail`, `userPassword`, `userData`, `signedIn`) VALUES
(NULL, '5f9e7b24a512e', 'testUser5f9e7b24a5136@covidlens.com', '12345ABC!', 'user data, settings, etc', 'false'),
(NULL, '5f9e7b25c867e', 'testUser5f9e7b25c8692@covidlens.com', '12345ABC!', 'user data, settings, etc', 'false'),
(NULL, '5f9e7b271c28e', 'testUser5f9e7b271c2e3@covidlens.com', '12345ABC!', 'user data, settings, etc', 'false'),
(NULL, '5f9e7c70cfd32', 'testUser5f9e7c70cfd3f@covidlens.com', '12345ABC!', 'user data, settings, etc', 'true'),
(NULL, '5f9e7d445d9da', 'testUser5f9e7d445d9ef@covidlens.com', '12345ABC!', 'user data, settings, etc', 'true'),
(NULL, '5f9e7de49cefa', 'testUser5f9e7de49cf0e@covidlens.com', '12345ABC!', 'user data, settings, etc', 'false'),
(NULL, '5f9e83c7055a5', 'testUser5f9e83c7055bb@covidlens.com', '12345ABC!', 'user data, settings, etc', 'false');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_account`
--
ALTER TABLE `admin_account`
  ADD PRIMARY KEY (`adminID`),
  ADD UNIQUE KEY `adminEmail` (`adminEmail`);

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`alertID`);

--
-- Indexes for table `map_locations`
--
ALTER TABLE `map_locations`
  ADD PRIMARY KEY (`locationID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`reportID`),
  ADD KEY `submitterID` (`submitterID`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`resourceID`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userEmail` (`userEmail`),
  ADD UNIQUE KEY `googleID` (`googleID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`submitterID`) REFERENCES `user_account` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
