-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 17, 2017 at 06:03 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `collegetimetable`
--
CREATE DATABASE `collegetimetable` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `collegetimetable`;

-- --------------------------------------------------------

--
-- Table structure for table `admindetails`
--

CREATE TABLE IF NOT EXISTS `admindetails` (
  `AdminId` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  PRIMARY KEY (`AdminId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3001 ;

--
-- Dumping data for table `admindetails`
--

INSERT INTO `admindetails` (`AdminId`, `Username`, `Password`) VALUES
(3000, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE IF NOT EXISTS `grade` (
  `gradeid` int(11) NOT NULL AUTO_INCREMENT,
  `gradename` varchar(250) NOT NULL,
  PRIMARY KEY (`gradeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`gradeid`, `gradename`) VALUES
(1, 'ECE'),
(2, 'CSE'),
(3, 'MECH'),
(4, 'CIVIL'),
(5, 'E&I');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
  `sectionid` int(11) NOT NULL AUTO_INCREMENT,
  `sectionsname` varchar(250) NOT NULL,
  PRIMARY KEY (`sectionid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`sectionid`, `sectionsname`) VALUES
(1, 'W'),
(2, 'I'),
(3, 'S'),
(4, 'N'),
(5, 'Q');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `subjectid` int(11) NOT NULL AUTO_INCREMENT,
  `subjectname` varchar(250) NOT NULL,
  PRIMARY KEY (`subjectid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subjectid`, `subjectname`) VALUES
(1, 'Literature'),
(2, 'Language'),
(3, 'Maths'),
(4, 'Science'),
(5, 'Social Studies'),
(6, 'Humanities'),
(7, 'Arabic'),
(8, 'Islamic'),
(9, 'ICT'),
(10, 'Art'),
(11, 'PE'),
(12, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `subject_grade`
--

CREATE TABLE IF NOT EXISTS `subject_grade` (
  `subject_gradeid` int(11) NOT NULL AUTO_INCREMENT,
  `subjectid` int(11) NOT NULL,
  `gradeid` int(11) NOT NULL,
  `NoOfClasses` int(11) NOT NULL,
  PRIMARY KEY (`subject_gradeid`),
  KEY `subjectid` (`subjectid`),
  KEY `gradeid` (`gradeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=144 ;

--
-- Dumping data for table `subject_grade`
--

INSERT INTO `subject_grade` (`subject_gradeid`, `subjectid`, `gradeid`, `NoOfClasses`) VALUES
(1, 3, 1, 8),
(2, 4, 1, 3),
(3, 12, 1, 8),
(4, 5, 1, 3),
(5, 7, 1, 2),
(6, 8, 1, 2),
(7, 9, 1, 3),
(8, 10, 1, 3),
(9, 11, 1, 3),
(10, 3, 2, 8),
(11, 12, 2, 8),
(12, 4, 2, 3),
(13, 5, 2, 3),
(14, 7, 2, 2),
(15, 8, 2, 2),
(16, 9, 2, 3),
(17, 10, 2, 3),
(18, 11, 2, 3),
(28, 3, 3, 8),
(29, 12, 3, 8),
(30, 4, 3, 4),
(31, 5, 3, 4),
(32, 7, 3, 4),
(33, 8, 3, 3),
(34, 9, 3, 1),
(35, 10, 3, 2),
(36, 11, 3, 1),
(37, 3, 4, 8),
(38, 12, 4, 8),
(39, 4, 4, 4),
(40, 5, 4, 4),
(41, 7, 4, 4),
(42, 8, 4, 3),
(43, 9, 4, 1),
(44, 10, 4, 2),
(45, 11, 4, 1),
(64, 3, 5, 7),
(65, 12, 5, 6),
(66, 1, 5, 4),
(67, 4, 5, 4),
(68, 5, 5, 4),
(69, 7, 5, 4),
(70, 8, 5, 3),
(71, 9, 5, 1),
(72, 10, 5, 1),
(73, 11, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_grades`
--

CREATE TABLE IF NOT EXISTS `teacher_grades` (
  `teacher_grades_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) NOT NULL,
  `gradeid` int(11) NOT NULL,
  PRIMARY KEY (`teacher_grades_id`),
  KEY `teacherid` (`teacherid`),
  KEY `gradeid` (`gradeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `teacher_grades`
--

INSERT INTO `teacher_grades` (`teacher_grades_id`, `teacherid`, `gradeid`) VALUES
(11, 2, 1),
(12, 2, 3),
(37, 15, 1),
(38, 15, 2),
(43, 17, 1),
(44, 17, 2);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_sections`
--

CREATE TABLE IF NOT EXISTS `teacher_sections` (
  `teacher_sections_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) NOT NULL,
  `sectionid` int(11) NOT NULL,
  PRIMARY KEY (`teacher_sections_id`),
  KEY `teacherid` (`teacherid`),
  KEY `sectionid` (`sectionid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `teacher_sections`
--

INSERT INTO `teacher_sections` (`teacher_sections_id`, `teacherid`, `sectionid`) VALUES
(11, 2, 1),
(12, 2, 3),
(34, 15, 1),
(35, 15, 2),
(36, 16, 1),
(37, 16, 2),
(38, 16, 3),
(40, 17, 1),
(41, 17, 3);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subjects`
--

CREATE TABLE IF NOT EXISTS `teacher_subjects` (
  `teacher_subjects_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  PRIMARY KEY (`teacher_subjects_id`),
  KEY `teacherid` (`teacherid`),
  KEY `subjectid` (`subjectid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `teacher_subjects`
--

INSERT INTO `teacher_subjects` (`teacher_subjects_id`, `teacherid`, `subjectid`) VALUES
(11, 2, 8),
(12, 2, 9),
(35, 15, 10),
(36, 15, 11),
(37, 16, 9),
(38, 16, 10),
(39, 16, 11),
(41, 17, 1),
(42, 17, 2);

-- --------------------------------------------------------

--
-- Table structure for table `teacherinfo`
--

CREATE TABLE IF NOT EXISTS `teacherinfo` (
  `teacherid` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(250) NOT NULL,
  `Age` int(11) NOT NULL,
  `Nationality` varchar(250) NOT NULL,
  `ContactNo` bigint(20) NOT NULL,
  `Address` varchar(250) NOT NULL,
  `PassportNo` varchar(250) NOT NULL,
  `PassportExpiryDate` date NOT NULL,
  `VisaType` varchar(250) NOT NULL,
  `SchoolAccommodation` varchar(250) NOT NULL,
  `Tutor` varchar(250) NOT NULL,
  `Grade` varchar(250) NOT NULL,
  `RecordedDate` date NOT NULL,
  PRIMARY KEY (`teacherid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `teacherinfo`
--

INSERT INTO `teacherinfo` (`teacherid`, `FullName`, `Age`, `Nationality`, `ContactNo`, `Address`, `PassportNo`, `PassportExpiryDate`, `VisaType`, `SchoolAccommodation`, `Tutor`, `Grade`, `RecordedDate`) VALUES
(2, 'Kalam', 87, 'Indian', 9043963074, 'chennai', '1233', '2015-08-06', 'H1B', 'on', 'on', 'A', '2015-08-06'),
(15, 'kiruba', 87, 'Indian', 9043963074, 'chennai', '1233', '2015-08-09', 'H1B', 'on', 'on', 'A', '2015-08-12'),
(16, 'Tamil', 87, 'Indian', 9043963074, 'dde', '1233', '2015-08-09', 'H1B', 'on', 'on', 'A', '2015-08-18'),
(17, 'kiruba karan', 23, 'India', 9043963074, 'south sivan kovil street', '1222', '2016-09-12', 'HIB', 'Yes', 'y', 'Grade 1', '2016-03-30');

-- --------------------------------------------------------

--
-- Table structure for table `timetable_i`
--

CREATE TABLE IF NOT EXISTS `timetable_i` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `Grade` int(11) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `8_9` (`8_9`),
  KEY `9_10` (`9_10`),
  KEY `10_11` (`10_11`),
  KEY `11_12` (`11_12`),
  KEY `1_2` (`1_2`),
  KEY `2_3` (`2_3`),
  KEY `3_4` (`3_4`),
  KEY `Grade` (`Grade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `timetable_i`
--

INSERT INTO `timetable_i` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `1_2`, `2_3`, `3_4`, `Grade`) VALUES
(26, 'Monday', 12, 9, 10, 8, 12, 12, 5, 1),
(27, 'Tueday', 12, 12, 3, 12, 11, 3, 4, 1),
(28, 'Wednesday', 8, 3, 3, 3, 4, 5, 10, 1),
(29, 'Thursday', 7, 12, 4, 5, 11, 3, 11, 1),
(30, 'Friday', 3, 9, 12, 10, 7, 9, 3, 1),
(31, 'Monday', 3, 12, 3, 3, 12, 5, 3, 2),
(32, 'Tueday', 5, 4, 3, 12, 10, 5, 11, 2),
(33, 'Wednesday', 12, 8, 7, 12, 3, 4, 12, 2),
(34, 'Thursday', 11, 8, 7, 10, 3, 4, 3, 2),
(35, 'Friday', 9, 9, 11, 12, 10, 12, 9, 2),
(36, 'Monday', 8, 8, 7, 5, 5, 12, 3, 3),
(37, 'Tueday', 3, 12, 12, 4, 3, 5, 4, 3),
(38, 'Wednesday', 10, 12, 7, 3, 3, 11, 12, 3),
(39, 'Thursday', 4, 3, 12, 9, 10, 4, 3, 3),
(40, 'Friday', 8, 7, 3, 12, 5, 7, 12, 3),
(41, 'Monday', 3, 4, 12, 11, 10, 3, 8, 4),
(42, 'Tueday', 3, 7, 7, 12, 3, 12, 8, 4),
(43, 'Wednesday', 10, 5, 5, 12, 5, 12, 7, 4),
(44, 'Thursday', 12, 12, 9, 4, 8, 4, 3, 4),
(45, 'Friday', 3, 4, 3, 3, 5, 12, 7, 4),
(46, 'Monday', 4, 4, 5, 3, 9, 3, 3, 5),
(47, 'Tueday', 12, 3, 7, 4, 8, 11, 7, 5),
(48, 'Wednesday', 12, 3, 3, 12, 5, 7, 8, 5),
(49, 'Thursday', 5, 12, 7, 10, 3, 12, 1, 5),
(50, 'Friday', 1, 5, 4, 1, 8, 1, 12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_kalam`
--

CREATE TABLE IF NOT EXISTS `timetable_kalam` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `gradeid` int(11) NOT NULL,
  `sectionid` int(11) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `8_9` (`8_9`),
  KEY `9_10` (`9_10`),
  KEY `10_11` (`10_11`),
  KEY `11_12` (`11_12`),
  KEY `1_2` (`1_2`),
  KEY `2_3` (`2_3`),
  KEY `3_4` (`3_4`),
  KEY `gradeid` (`gradeid`),
  KEY `sectionid` (`sectionid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `timetable_kalam`
--

INSERT INTO `timetable_kalam` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `1_2`, `2_3`, `3_4`, `gradeid`, `sectionid`) VALUES
(1, 'Sunday', 9, 0, 0, 0, 0, 0, 0, 1, 1),
(2, 'Monday', 0, 0, 0, 0, 0, 0, 0, 1, 1),
(3, 'Tueday', 0, 0, 0, 0, 8, 9, 0, 1, 1),
(4, 'Wednesday', 0, 0, 0, 0, 0, 9, 0, 1, 1),
(5, 'Thursday', 0, 0, 0, 0, 0, 8, 0, 1, 1),
(6, 'Sunday', 9, 0, 0, 0, 0, 0, 0, 1, 3),
(7, 'Monday', 0, 0, 0, 0, 0, 0, 0, 1, 3),
(8, 'Tueday', 0, 0, 0, 0, 8, 9, 0, 1, 3),
(9, 'Wednesday', 0, 0, 0, 0, 0, 9, 0, 1, 3),
(10, 'Thursday', 0, 0, 0, 0, 0, 8, 0, 1, 3),
(11, 'Sunday', 0, 0, 0, 0, 8, 8, 0, 3, 1),
(12, 'Monday', 8, 0, 0, 0, 0, 0, 0, 3, 1),
(13, 'Tueday', 0, 0, 0, 9, 0, 0, 0, 3, 1),
(14, 'Wednesday', 0, 0, 0, 0, 0, 0, 0, 3, 1),
(15, 'Thursday', 0, 0, 0, 0, 0, 0, 0, 3, 1),
(16, 'Sunday', 0, 0, 0, 0, 8, 8, 0, 3, 3),
(17, 'Monday', 8, 0, 0, 0, 0, 0, 0, 3, 3),
(18, 'Tueday', 0, 0, 0, 9, 0, 0, 0, 3, 3),
(19, 'Wednesday', 0, 0, 0, 0, 0, 0, 0, 3, 3),
(20, 'Thursday', 0, 0, 0, 0, 0, 0, 0, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_kiruba`
--

CREATE TABLE IF NOT EXISTS `timetable_kiruba` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `gradeid` int(11) NOT NULL,
  `sectionid` int(11) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `8_9` (`8_9`),
  KEY `9_10` (`9_10`),
  KEY `10_11` (`10_11`),
  KEY `11_12` (`11_12`),
  KEY `1_2` (`1_2`),
  KEY `2_3` (`2_3`),
  KEY `3_4` (`3_4`),
  KEY `gradeid` (`gradeid`),
  KEY `sectionid` (`sectionid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `timetable_kiruba`
--

INSERT INTO `timetable_kiruba` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `1_2`, `2_3`, `3_4`, `gradeid`, `sectionid`) VALUES
(1, 'Sunday', 0, 0, 0, 0, 0, 10, 0, 1, 1),
(2, 'Monday', 0, 0, 10, 0, 0, 0, 0, 1, 1),
(3, 'Tueday', 0, 0, 11, 0, 0, 0, 0, 1, 1),
(4, 'Wednesday', 0, 11, 0, 11, 0, 0, 0, 1, 1),
(5, 'Thursday', 0, 10, 0, 0, 0, 0, 0, 1, 1),
(6, 'Sunday', 0, 0, 0, 0, 0, 10, 0, 1, 2),
(7, 'Monday', 0, 0, 10, 0, 0, 0, 0, 1, 2),
(8, 'Tueday', 0, 0, 11, 0, 0, 0, 0, 1, 2),
(9, 'Wednesday', 0, 11, 0, 11, 0, 0, 0, 1, 2),
(10, 'Thursday', 0, 10, 0, 0, 0, 0, 0, 1, 2),
(11, 'Sunday', 0, 10, 0, 0, 0, 0, 0, 2, 1),
(12, 'Monday', 0, 0, 0, 0, 0, 0, 0, 2, 1),
(13, 'Tueday', 0, 0, 11, 10, 0, 0, 0, 2, 1),
(14, 'Wednesday', 0, 0, 0, 10, 0, 11, 0, 2, 1),
(15, 'Thursday', 0, 0, 0, 0, 0, 0, 11, 2, 1),
(16, 'Sunday', 0, 10, 0, 0, 0, 0, 0, 2, 2),
(17, 'Monday', 0, 0, 0, 0, 0, 0, 0, 2, 2),
(18, 'Tueday', 0, 0, 11, 10, 0, 0, 0, 2, 2),
(19, 'Wednesday', 0, 0, 0, 10, 0, 11, 0, 2, 2),
(20, 'Thursday', 0, 0, 0, 0, 0, 0, 11, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_n`
--

CREATE TABLE IF NOT EXISTS `timetable_n` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `Grade` int(11) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `8_9` (`8_9`),
  KEY `9_10` (`9_10`),
  KEY `10_11` (`10_11`),
  KEY `11_12` (`11_12`),
  KEY `1_2` (`1_2`),
  KEY `2_3` (`2_3`),
  KEY `3_4` (`3_4`),
  KEY `Grade` (`Grade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `timetable_n`
--

INSERT INTO `timetable_n` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `1_2`, `2_3`, `3_4`, `Grade`) VALUES
(26, 'Monday', 9, 10, 4, 8, 3, 11, 9, 1),
(27, 'Tueday', 12, 12, 7, 3, 3, 12, 4, 1),
(28, 'Wednesday', 12, 11, 4, 12, 7, 3, 8, 1),
(29, 'Thursday', 12, 3, 3, 11, 5, 12, 5, 1),
(30, 'Friday', 12, 9, 5, 10, 3, 3, 10, 1),
(31, 'Monday', 10, 3, 5, 4, 11, 11, 8, 2),
(32, 'Tueday', 12, 3, 4, 5, 9, 12, 3, 2),
(33, 'Wednesday', 10, 11, 9, 12, 8, 3, 3, 2),
(34, 'Thursday', 4, 10, 3, 5, 12, 3, 7, 2),
(35, 'Friday', 9, 7, 12, 12, 12, 12, 3, 2),
(36, 'Monday', 8, 12, 12, 4, 3, 3, 3, 3),
(37, 'Tueday', 8, 12, 5, 12, 4, 5, 7, 3),
(38, 'Wednesday', 4, 7, 12, 9, 12, 12, 3, 3),
(39, 'Thursday', 3, 11, 10, 3, 4, 12, 3, 3),
(40, 'Friday', 10, 7, 3, 7, 5, 8, 5, 3),
(41, 'Monday', 3, 9, 12, 5, 3, 7, 7, 4),
(42, 'Tueday', 4, 7, 12, 11, 12, 3, 5, 4),
(43, 'Wednesday', 7, 12, 8, 12, 4, 3, 10, 4),
(44, 'Thursday', 3, 5, 10, 3, 3, 12, 12, 4),
(45, 'Friday', 4, 12, 8, 8, 5, 4, 3, 4),
(46, 'Monday', 4, 1, 1, 8, 7, 4, 10, 5),
(47, 'Tueday', 3, 9, 4, 7, 3, 3, 7, 5),
(48, 'Wednesday', 5, 3, 3, 5, 1, 1, 12, 5),
(49, 'Thursday', 5, 11, 12, 12, 8, 5, 12, 5),
(50, 'Friday', 8, 12, 3, 7, 4, 3, 12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_q`
--

CREATE TABLE IF NOT EXISTS `timetable_q` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `Grade` int(11) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `8_9` (`8_9`),
  KEY `9_10` (`9_10`),
  KEY `10_11` (`10_11`),
  KEY `11_12` (`11_12`),
  KEY `1_2` (`1_2`),
  KEY `2_3` (`2_3`),
  KEY `3_4` (`3_4`),
  KEY `Grade` (`Grade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `timetable_q`
--

INSERT INTO `timetable_q` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `1_2`, `2_3`, `3_4`, `Grade`) VALUES
(26, 'Monday', 5, 10, 7, 11, 3, 3, 10, 1),
(27, 'Tueday', 12, 8, 3, 12, 12, 12, 9, 1),
(28, 'Wednesday', 3, 4, 11, 9, 12, 3, 12, 1),
(29, 'Thursday', 12, 8, 9, 5, 12, 3, 3, 1),
(30, 'Friday', 7, 10, 3, 4, 11, 4, 5, 1),
(31, 'Monday', 3, 9, 8, 7, 12, 3, 10, 2),
(32, 'Tueday', 12, 11, 4, 3, 5, 12, 10, 2),
(33, 'Wednesday', 10, 12, 3, 3, 5, 9, 4, 2),
(34, 'Thursday', 12, 12, 8, 11, 3, 12, 3, 2),
(35, 'Friday', 9, 12, 4, 7, 5, 3, 11, 2),
(36, 'Monday', 8, 4, 7, 12, 5, 10, 5, 3),
(37, 'Tueday', 3, 7, 3, 4, 12, 12, 3, 3),
(38, 'Wednesday', 11, 7, 3, 12, 4, 8, 8, 3),
(39, 'Thursday', 3, 3, 12, 9, 12, 4, 7, 3),
(40, 'Friday', 5, 12, 10, 3, 12, 5, 3, 3),
(41, 'Monday', 7, 12, 3, 12, 3, 8, 5, 4),
(42, 'Tueday', 3, 12, 4, 5, 4, 12, 10, 4),
(43, 'Wednesday', 12, 12, 7, 5, 7, 11, 10, 4),
(44, 'Thursday', 3, 3, 9, 5, 8, 4, 8, 4),
(45, 'Friday', 7, 3, 4, 12, 3, 12, 3, 4),
(46, 'Monday', 3, 5, 5, 3, 11, 12, 8, 5),
(47, 'Tueday', 7, 7, 7, 1, 9, 3, 4, 5),
(48, 'Wednesday', 12, 1, 8, 3, 4, 7, 1, 5),
(49, 'Thursday', 12, 3, 5, 10, 12, 3, 12, 5),
(50, 'Friday', 3, 4, 8, 5, 4, 1, 12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_s`
--

CREATE TABLE IF NOT EXISTS `timetable_s` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `Grade` int(11) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `8_9` (`8_9`),
  KEY `9_10` (`9_10`),
  KEY `10_11` (`10_11`),
  KEY `11_12` (`11_12`),
  KEY `1_2` (`1_2`),
  KEY `2_3` (`2_3`),
  KEY `3_4` (`3_4`),
  KEY `Grade` (`Grade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `timetable_s`
--

INSERT INTO `timetable_s` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `1_2`, `2_3`, `3_4`, `Grade`) VALUES
(26, 'Monday', 3, 4, 11, 12, 12, 3, 9, 1),
(27, 'Tueday', 3, 12, 3, 3, 10, 12, 11, 1),
(28, 'Wednesday', 11, 8, 8, 5, 7, 5, 4, 1),
(29, 'Thursday', 4, 12, 5, 9, 7, 12, 12, 1),
(30, 'Friday', 12, 3, 9, 3, 3, 10, 10, 1),
(31, 'Monday', 11, 12, 12, 10, 12, 4, 3, 2),
(32, 'Tueday', 7, 12, 4, 3, 9, 3, 11, 2),
(33, 'Wednesday', 3, 8, 9, 4, 3, 7, 10, 2),
(34, 'Thursday', 5, 3, 5, 12, 12, 10, 5, 2),
(35, 'Friday', 3, 11, 3, 9, 12, 12, 8, 2),
(36, 'Monday', 12, 8, 10, 12, 8, 4, 3, 3),
(37, 'Tueday', 3, 3, 3, 12, 10, 4, 12, 3),
(38, 'Wednesday', 3, 11, 3, 12, 3, 7, 5, 3),
(39, 'Thursday', 7, 5, 9, 4, 12, 3, 4, 3),
(40, 'Friday', 12, 8, 7, 5, 7, 12, 5, 3),
(41, 'Monday', 4, 12, 3, 5, 8, 9, 12, 4),
(42, 'Tueday', 4, 3, 12, 12, 4, 12, 3, 4),
(43, 'Wednesday', 10, 5, 8, 12, 5, 7, 10, 4),
(44, 'Thursday', 7, 3, 4, 12, 8, 7, 3, 4),
(45, 'Friday', 7, 3, 11, 12, 5, 3, 3, 4),
(46, 'Monday', 8, 7, 9, 3, 3, 5, 3, 5),
(47, 'Tueday', 12, 8, 1, 5, 4, 1, 3, 5),
(48, 'Wednesday', 7, 5, 12, 5, 1, 1, 10, 5),
(49, 'Thursday', 3, 11, 12, 12, 4, 3, 7, 5),
(50, 'Friday', 7, 4, 12, 8, 12, 3, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_tamil`
--

CREATE TABLE IF NOT EXISTS `timetable_tamil` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `gradeid` int(11) NOT NULL,
  `sectionid` int(11) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `8_9` (`8_9`),
  KEY `9_10` (`9_10`),
  KEY `10_11` (`10_11`),
  KEY `11_12` (`11_12`),
  KEY `1_2` (`1_2`),
  KEY `2_3` (`2_3`),
  KEY `3_4` (`3_4`),
  KEY `gradeid` (`gradeid`),
  KEY `sectionid` (`sectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `timetable_tamil`
--


-- --------------------------------------------------------

--
-- Table structure for table `timetable_w`
--

CREATE TABLE IF NOT EXISTS `timetable_w` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `Grade` int(11) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `8_9` (`8_9`),
  KEY `9_10` (`9_10`),
  KEY `10_11` (`10_11`),
  KEY `11_12` (`11_12`),
  KEY `1_2` (`1_2`),
  KEY `2_3` (`2_3`),
  KEY `3_4` (`3_4`),
  KEY `Grade` (`Grade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `timetable_w`
--

INSERT INTO `timetable_w` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `1_2`, `2_3`, `3_4`, `Grade`) VALUES
(26, 'Monday', 12, 4, 10, 9, 10, 9, 12, 1),
(27, 'Tueday', 12, 7, 8, 3, 7, 11, 4, 1),
(28, 'Wednesday', 12, 5, 3, 12, 3, 12, 3, 1),
(29, 'Thursday', 11, 5, 12, 3, 12, 10, 3, 1),
(30, 'Friday', 11, 4, 3, 9, 5, 8, 3, 1),
(31, 'Monday', 5, 3, 9, 3, 3, 3, 12, 2),
(32, 'Tueday', 5, 12, 10, 11, 12, 5, 12, 2),
(33, 'Wednesday', 10, 10, 9, 4, 9, 12, 7, 2),
(34, 'Thursday', 12, 7, 8, 3, 4, 12, 12, 2),
(35, 'Friday', 11, 3, 4, 3, 11, 3, 8, 2),
(36, 'Monday', 12, 12, 10, 5, 12, 5, 12, 3),
(37, 'Tueday', 10, 4, 8, 8, 12, 8, 5, 3),
(38, 'Wednesday', 3, 7, 5, 11, 7, 3, 4, 3),
(39, 'Thursday', 3, 3, 4, 9, 12, 12, 3, 3),
(40, 'Friday', 4, 3, 7, 12, 7, 3, 3, 3),
(41, 'Monday', 12, 3, 4, 7, 12, 5, 9, 4),
(42, 'Tueday', 5, 3, 12, 3, 12, 5, 4, 4),
(43, 'Wednesday', 8, 4, 3, 3, 8, 3, 8, 4),
(44, 'Thursday', 7, 10, 5, 4, 7, 12, 12, 4),
(45, 'Friday', 3, 3, 12, 10, 7, 12, 11, 4),
(46, 'Monday', 4, 3, 7, 8, 5, 3, 5, 5),
(47, 'Tueday', 12, 5, 1, 11, 1, 3, 10, 5),
(48, 'Wednesday', 4, 4, 1, 1, 4, 3, 3, 5),
(49, 'Thursday', 12, 12, 12, 7, 8, 3, 7, 5),
(50, 'Friday', 9, 3, 7, 8, 5, 12, 12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE IF NOT EXISTS `userinfo` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) NOT NULL,
  `PhoneNo` bigint(20) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Address` text NOT NULL,
  `UserName` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `RecordedDate` date NOT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`UserId`, `Name`, `PhoneNo`, `Email`, `Address`, `UserName`, `Password`, `RecordedDate`) VALUES
(1, 'kiruba', 9043963074, ' kirubakarans2009@gmail.com', 'chennai', 'kiruba', 'kiruba', '2015-07-30'),
(2, 'ganga', 9043963074, 'ganaga2009@gmail.com', 'chennai', 'ganga', 'ganga', '2015-08-05');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `subject_grade`
--
ALTER TABLE `subject_grade`
  ADD CONSTRAINT `subject_grade_ibfk_1` FOREIGN KEY (`subjectid`) REFERENCES `subject` (`subjectid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subject_grade_ibfk_2` FOREIGN KEY (`gradeid`) REFERENCES `grade` (`gradeid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_grades`
--
ALTER TABLE `teacher_grades`
  ADD CONSTRAINT `teacher_grades_ibfk_1` FOREIGN KEY (`teacherid`) REFERENCES `teacherinfo` (`teacherid`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_grades_ibfk_2` FOREIGN KEY (`gradeid`) REFERENCES `grade` (`gradeid`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_sections`
--
ALTER TABLE `teacher_sections`
  ADD CONSTRAINT `teacher_sections_ibfk_1` FOREIGN KEY (`teacherid`) REFERENCES `teacherinfo` (`teacherid`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_sections_ibfk_2` FOREIGN KEY (`sectionid`) REFERENCES `sections` (`sectionid`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD CONSTRAINT `teacher_subjects_ibfk_1` FOREIGN KEY (`teacherid`) REFERENCES `teacherinfo` (`teacherid`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_subjects_ibfk_2` FOREIGN KEY (`subjectid`) REFERENCES `subject` (`subjectid`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
