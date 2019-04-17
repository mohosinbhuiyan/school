-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 17, 2019 at 11:26 AM
-- Server version: 5.7.24
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `class_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject_code` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `number_of_student` int(11) NOT NULL,
  `class_hour` double NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`class_id`),
  KEY `subject_ibfk_1` (`subject_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `subject_code`, `number_of_student`, `class_hour`, `status`) VALUES
(1, 101, 40, 24, 1),
(2, 102, 40, 24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `first_name`, `last_name`, `grade`, `status`) VALUES
(1, 'Parvez', 'Hossain', 'B+', 1),
(2, 'Jobayer', 'Hossain', 'A+', 1),
(3, 'Mohosin', 'Bhuiyan', 'A+', 1),
(4, 'Robin', 'Ahmed', 'C+', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_code` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `teacher_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `no_of_credit` int(11) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`subject_code`),
  KEY `subject_fk` (`student_id`),
  KEY `teacher_fk` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_code`, `student_id`, `teacher_id`, `name`, `no_of_credit`, `description`, `status`) VALUES
(101, 1, 1, 'Java', 3, 'Java is a general-purpose programming language that is class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible.', 1),
(102, 1, 2, 'Computer Fundamental', 3, 'Computer Fundamentals Tutorial. Computer is an advanced electronic device that takes raw data as an input from the user and processes it under the control of a set of instructions (called program), produces a result (output), and saves it for future use.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `first_name`, `last_name`, `phone`, `email`, `status`) VALUES
(1, 'Akhter', 'Hossain', '014xxxxxxx', 'akhter@gmail.com', 1),
(2, 'Yousuf', 'Mohammad', '014xxxxxxx', 'yousuf@gmail.com', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`subject_code`) REFERENCES `subject` (`subject_code`);

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_fk` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `teacher_fk` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
