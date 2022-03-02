-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2022 at 07:14 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bookslot`
--

CREATE TABLE `tbl_bookslot` (
  `lid` int(11) NOT NULL,
  `laundry_type` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `booking_date` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_bookslot`
--

INSERT INTO `tbl_bookslot` (`lid`, `laundry_type`, `quantity`, `booking_date`, `userid`) VALUES
(48, 'Churidhar', 10, '2022-02-25', 17),
(49, 'Churidhar', 2, '2022-02-23', 13),
(50, 'Shirt', 4, '2022-02-23', 13);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_laundry_type`
--

CREATE TABLE `tbl_laundry_type` (
  `l_id` int(11) NOT NULL,
  `l_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_laundry_type`
--

INSERT INTO `tbl_laundry_type` (`l_id`, `l_type`) VALUES
(2, 'Pants'),
(3, 'Churidhar'),
(4, 'Shirt'),
(5, 'Saree'),
(6, 'Dhoti');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `login_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`login_id`, `email`, `password`, `uid`) VALUES
(1, 'admin@gmail.com', 'admin', 1),
(23, 'tebin@gmail.com', 'tebin', 2),
(24, 's@gmail.com', 'Sujith@1234', 2),
(25, 'roshan@gmail.com', 'Ro@123', 2),
(26, 'aleena@gmail.com', 'Al@123', 2),
(27, 'sonu@gmail.com', 'So@123', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `userid` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userid`, `login_id`, `name`, `phone`, `address`) VALUES
(13, 23, 'tebin', '9090909090', 'tebinhouse palrivattam po kottayam'),
(14, 24, 'sujith', '9999999999', 'kottyam'),
(15, 25, 'roshan', '9876543217', 'qqqqqqqqq'),
(16, 26, 'aleena', '', 'qqqqqqq'),
(17, 27, 'sonu', '9999999999', 'wayanad');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `uid` int(11) NOT NULL,
  `utype` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`uid`, `utype`) VALUES
(1, 'admin'),
(2, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_bookslot`
--
ALTER TABLE `tbl_bookslot`
  ADD PRIMARY KEY (`lid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `tbl_laundry_type`
--
ALTER TABLE `tbl_laundry_type`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `login_id` (`login_id`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bookslot`
--
ALTER TABLE `tbl_bookslot`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tbl_laundry_type`
--
ALTER TABLE `tbl_laundry_type`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_bookslot`
--
ALTER TABLE `tbl_bookslot`
  ADD CONSTRAINT `tbl_bookslot_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `tbl_users` (`userid`);

--
-- Constraints for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD CONSTRAINT `tbl_login_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `usertype` (`uid`);

--
-- Constraints for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD CONSTRAINT `tbl_users_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `tbl_login` (`login_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
