-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2018 at 05:20 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mythologytree`
--

-- --------------------------------------------------------

--
-- Table structure for table `character_data`
--

CREATE TABLE `character_data` (
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_fact` varchar(150) NOT NULL,
  `second_fact` varchar(150) DEFAULT NULL,
  `id` int(4) NOT NULL,
  `picture_file` char(30) DEFAULT NULL,
  `tree_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `character_data`
--

INSERT INTO `character_data` (`first_name`, `last_name`, `first_fact`, `second_fact`, `id`, `picture_file`, `tree_id`) VALUES
('Rhea', '', 'God of Motherhood', 'Queen of the Titans', 3, 'rhea.jpg', 0),
('Zeus', '', 'God of the Sky', 'King of the Titans', 7, 'zeus.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `parables`
--

CREATE TABLE `parables` (
  `id` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Body` longtext NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parables`
--

INSERT INTO `parables` (`id`, `Title`, `Body`, `member_id`) VALUES
(2, 'Zeus and the Potsherds', 'Those with the potsherds on the on the bottom of the pile get punished last', 7),
(4, 'Rheas Motherhood', 'Rhea is queen of the Titans', 3);

-- --------------------------------------------------------

--
-- Table structure for table `relative`
--

CREATE TABLE `relative` (
  `id` int(11) NOT NULL,
  `first_name` char(50) NOT NULL,
  `last_name` char(50) NOT NULL,
  `type` char(10) NOT NULL,
  `member_id` int(11) NOT NULL,
  `link` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trees`
--

CREATE TABLE `trees` (
  `id` int(11) NOT NULL,
  `link` char(50) NOT NULL,
  `name` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trees`
--

INSERT INTO `trees` (`id`, `link`, `name`) VALUES
(1, '', 'Greek Mythology');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `character_data`
--
ALTER TABLE `character_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parables`
--
ALTER TABLE `parables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `relative`
--
ALTER TABLE `relative`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trees`
--
ALTER TABLE `trees`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `character_data`
--
ALTER TABLE `character_data`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `parables`
--
ALTER TABLE `parables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `relative`
--
ALTER TABLE `relative`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trees`
--
ALTER TABLE `trees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
