-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2020 at 03:44 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `otbs`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus_data`
--

CREATE TABLE `bus_data` (
  `bid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `bname` varchar(50) NOT NULL,
  `bcode` varchar(50) NOT NULL,
  `btype` varchar(50) NOT NULL,
  `dept_time` varchar(50) NOT NULL,
  `dept_date` date NOT NULL,
  `dept_add` varchar(50) NOT NULL,
  `duration` int(11) NOT NULL,
  `arr_time` varchar(50) NOT NULL,
  `arr_date` date NOT NULL,
  `arr_add` varchar(50) NOT NULL,
  `seats_capacity` int(11) NOT NULL,
  `fare` double NOT NULL,
  `seats_avail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus_data`
--

INSERT INTO `bus_data` (`bid`, `tid`, `bname`, `bcode`, `btype`, `dept_time`, `dept_date`, `dept_add`, `duration`, `arr_time`, `arr_date`, `arr_add`, `seats_capacity`, `fare`, `seats_avail`) VALUES
(1, 1, 'DELUXE', '8391', 'NONAC', '05:00', '2020-08-31', 'Sri Nagar Colony', 4, '09:10', '2020-08-31', 'HANMAKONDA', 30, 200, 30),
(2, 1, 'SUPER LUXURY', '8368', 'AC', '06:30', '2020-08-31', 'Jubilee Bus Station', 3, '09:15', '2020-08-31', 'HANMAKONDA', 35, 203, 35);

-- --------------------------------------------------------

--
-- Table structure for table `tours_data`
--

CREATE TABLE `tours_data` (
  `tid` int(50) NOT NULL,
  `fromcity` varchar(50) NOT NULL,
  `tocity` varchar(50) NOT NULL,
  `tourdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tours_data`
--

INSERT INTO `tours_data` (`tid`, `fromcity`, `tocity`, `tourdate`) VALUES
(1, 'Hyderabad', 'Warangal', '2020-08-31'),
(2, 'Hyderabad', 'Mumbai', '2020-08-31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus_data`
--
ALTER TABLE `bus_data`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `tours_data`
--
ALTER TABLE `tours_data`
  ADD PRIMARY KEY (`tid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
