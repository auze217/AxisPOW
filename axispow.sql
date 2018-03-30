-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 30, 2018 at 06:46 PM
-- Server version: 5.6.39
-- PHP Version: 7.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `axispow`
--

-- --------------------------------------------------------

--
-- Table structure for table `camps`
--

CREATE TABLE `camps` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `state` varchar(1000) NOT NULL,
  `prisoners` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `camps`
--

INSERT INTO `camps` (`id`, `name`, `state`, `prisoners`, `image`) VALUES
(1, 'Camp Aliceville', 'Alabama', 6000, 'aliceville.jpg'),
(2, 'Camp Atterbury', 'Indiana', 13500, 'atterbury.jpg'),
(3, 'Camp Florence', 'Arizona', 0, 'florence.jpg'),
(4, 'Camp McAlester', 'Oklahoma', 0, 'mcalester.jpg'),
(5, 'Camp New Ulm', 'Minnesota', 0, 'newulm.jpg'),
(6, 'Camp Rhinelander', 'Wisconsin', 0, ''),
(7, 'Camp Ritchie', 'Maryland', 0, 'ritchie.jpg'),
(8, 'Camp Tonakawa', 'Oklahoma', 0, ''),
(9, 'Camp White Rock', 'Texas', 0, ''),
(10, 'Fort Kearney', 'Rhode Island', 0, ''),
(11, 'Camp Salina', 'Utah', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `life_event`
--

CREATE TABLE `life_event` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `details` varchar(20000) NOT NULL,
  `image` varchar(50) NOT NULL,
  `camp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `life_event`
--

INSERT INTO `life_event` (`id`, `title`, `details`, `image`, `camp_id`) VALUES
(1, 'Aliceville POW Newspaper', 'While imprisoned, the prisoners created their own newspaper about daily events in the outside world and called their newspaper, \"The Fenced Guest\".', 'alicevillenewspaper.png', 1),
(2, 'The Influx of Prisoners', 'The majority of prisoners in Aliceville came from the Allied Powers decisive victory at the Battle of El Alamein and in North Africa in November 1942. The victory resulted in over 3,000 prisoners needing to be housed and Aliceville was the chosen location.', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `password`, `email`) VALUES
(1, 'Austin', 'Zensen', 'auze217', 'lmao', 'auze217@vt.edu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `camps`
--
ALTER TABLE `camps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `life_event`
--
ALTER TABLE `life_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `camps`
--
ALTER TABLE `camps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `life_event`
--
ALTER TABLE `life_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
