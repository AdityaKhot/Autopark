-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2022 at 09:24 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kleparking`
--
CREATE DATABASE IF NOT EXISTS `kleparking` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kleparking`;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city`) VALUES
(1, 'Nipani'),
(2, 'Chikodi');

-- --------------------------------------------------------

--
-- Table structure for table `parkers`
--

CREATE TABLE IF NOT EXISTS `parkers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `parkers`
--

INSERT INTO `parkers` (`id`, `fullname`, `mobile`, `email`, `username`, `password`, `published`) VALUES
(1, 'Sachin Jadhav', '7709054041', 'sachin@gmail.com', 'sachin', 'sachin', 1),
(2, 'Vaibhav Patil', '9657719686', 'vaibhav@gmail.com', 'vaibhav', 'vaibhav', 1),
(3, 'Aditya Khot', '7411107925', 'adityakhot55@gmail.com', 'Aditya', 'Aditya@2002', 1),
(4, 'Shreyansh Ainapure ', '9071295107', 'Shreyansh@gmail.com', 'Shreyansh Ainapure ', 'Shreyanshainapure', 1),
(6, 'Pratiksha Khot', '9148619932', 'pratikshakhot2001@gmail.com', 'Pratiksha Khot', 'Pratiksha@2001', 1),
(7, 'shrejashree Ainapure ', '9071295107', 'shreja9071295107@gmail.com', 'Shrejashree Ainapure ', 'Ainapureshreja51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `parking_spaces`
--

CREATE TABLE IF NOT EXISTS `parking_spaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `no_of_slots` int(11) NOT NULL,
  `amount_per_hour` decimal(10,2) NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `parking_spaces`
--

INSERT INTO `parking_spaces` (`id`, `city_id`, `address`, `no_of_slots`, `amount_per_hour`, `published`) VALUES
(1, 1, 'Bus Stand Nipani', 10, '20.00', 1),
(2, 1, 'Channama Circle, Ashok Nagar Nipani', 10, '25.00', 1),
(3, 2, 'Chikodi Bus Stand', 12, '25.00', 1),
(4, 2, 'KLE Hospital Chikodi ', 10, '25.00', 1),
(5, 1, 'Nagar Palika', 15, '20.00', 1),
(7, 1, 'Magnum Fun Cinema ', 10, '15.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE IF NOT EXISTS `reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parker_id` int(11) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `city_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `slots` text NOT NULL,
  `no_of_slots` int(11) NOT NULL,
  `hours` int(11) NOT NULL,
  `amount_per_hour` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `parker_id`, `from_date`, `to_date`, `city_id`, `address`, `slots`, `no_of_slots`, `hours`, `amount_per_hour`, `amount`) VALUES
(1, 2, '2022-08-18 11:00:00', '2022-08-18 12:00:00', 2, 'Chikodi Bus Stand', 'P01', 1, 1, 25, '25.00'),
(3, 3, '2022-08-18 08:00:00', '2022-08-18 00:00:00', 2, 'KLE Hospital Chikodi ', 'P01', 1, 8, 25, '200.00'),
(4, 4, '2022-08-20 11:00:00', '2022-08-20 12:00:00', 1, 'Nagar Palika', 'P02', 1, 1, 20, '220.00'),
(6, 5, '2022-08-18 03:00:00', '2022-08-19 03:00:00', 1, 'Bus Stand Nipani', 'P03', 1, 24, 20, '480.00'),
(10, 1, '2022-08-22 16:00:00', '2022-08-22 17:00:00', 1, 'Channama Circle, Ashok Nagar Nipani', 'P03', 1, 1, 25, '25.00'),
(12, 7, '2022-09-25 11:00:00', '2022-09-26 23:00:00', 1, 'Bus Stand Nipani', 'P01', 1, 36, 20, '720.00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `username`, `password`, `published`) VALUES
(1, 'Parking Admin', '1234567890', 'admin@parkingportal.com', 'admin', 'admin', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
