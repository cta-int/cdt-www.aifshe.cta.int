-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 28, 2015 at 08:03 AM
-- Server version: 5.1.66
-- PHP Version: 5.3.27-1~dotdeb.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cta_aishe_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `certification`
--

CREATE TABLE IF NOT EXISTS `certification` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6C3C6D75DE12AB56` (`created_by`),
  KEY `IDX_6C3C6D7525F94802` (`modified_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `certification`
--

INSERT INTO `certification` (`id`, `created_by`, `modified_by`, `status`, `created_at`, `modified_at`, `name`) VALUES
(1, 1, NULL, 9, '2013-09-01 00:00:00', NULL, 'certification.1'),
(2, 1, NULL, 9, '2013-09-01 00:00:00', NULL, 'certification.2'),
(3, 1, NULL, 9, '2013-09-01 00:00:00', NULL, 'certification.3'),
(4, 1, NULL, 9, '2013-09-01 00:00:00', NULL, 'certification.4');

-- --------------------------------------------------------

--
-- Table structure for table `certification_requirement`
--

CREATE TABLE IF NOT EXISTS `certification_requirement` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `certification_requirement_id` smallint(6) DEFAULT NULL,
  `criterion_item_id` smallint(6) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `stage` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6AB3DA73DE12AB56` (`created_by`),
  KEY `IDX_6AB3DA7325F94802` (`modified_by`),
  KEY `IDX_6AB3DA731949DCF0` (`certification_requirement_id`),
  KEY `IDX_6AB3DA7331A5B285` (`criterion_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=101 ;

--
-- Dumping data for table `certification_requirement`
--

INSERT INTO `certification_requirement` (`id`, `created_by`, `modified_by`, `certification_requirement_id`, `criterion_item_id`, `status`, `created_at`, `modified_at`, `stage`) VALUES
(1, 1, NULL, 1, 1, 9, '2013-09-01 00:00:00', NULL, 1),
(2, 1, NULL, 1, 2, 9, '2013-09-01 00:00:00', NULL, 1),
(3, 1, NULL, 1, 3, 9, '2013-09-01 00:00:00', NULL, 1),
(4, 1, NULL, 1, 4, 9, '2013-09-01 00:00:00', NULL, 1),
(5, 1, NULL, 1, 5, 9, '2013-09-01 00:00:00', NULL, 0),
(6, 1, NULL, 1, 6, 9, '2013-09-01 00:00:00', NULL, 0),
(7, 1, NULL, 1, 7, 9, '2013-09-01 00:00:00', NULL, 1),
(8, 1, NULL, 1, 8, 9, '2013-09-01 00:00:00', NULL, 0),
(9, 1, NULL, 1, 9, 9, '2013-09-01 00:00:00', NULL, 1),
(10, 1, NULL, 1, 10, 9, '2013-09-01 00:00:00', NULL, 1),
(11, 1, NULL, 1, 11, 9, '2013-09-01 00:00:00', NULL, 0),
(12, 1, NULL, 1, 12, 9, '2013-09-01 00:00:00', NULL, 1),
(13, 1, NULL, 1, 13, 9, '2013-09-01 00:00:00', NULL, 1),
(14, 1, NULL, 1, 14, 9, '2013-09-01 00:00:00', NULL, 1),
(15, 1, NULL, 1, 15, 9, '2013-09-01 00:00:00', NULL, 1),
(16, 1, NULL, 1, 16, 9, '2013-09-01 00:00:00', NULL, 0),
(17, 1, NULL, 1, 17, 9, '2013-09-01 00:00:00', NULL, 0),
(18, 1, NULL, 1, 18, 9, '2013-09-01 00:00:00', NULL, 0),
(19, 1, NULL, 1, 19, 9, '2013-09-01 00:00:00', NULL, 0),
(20, 1, NULL, 1, 20, 9, '2013-09-01 00:00:00', NULL, 0),
(21, 1, NULL, 2, 1, 9, '2013-09-01 00:00:00', NULL, 2),
(22, 1, NULL, 2, 2, 9, '2013-09-01 00:00:00', NULL, 2),
(23, 1, NULL, 2, 3, 9, '2013-09-01 00:00:00', NULL, 2),
(24, 1, NULL, 2, 4, 9, '2013-09-01 00:00:00', NULL, 2),
(25, 1, NULL, 2, 5, 9, '2013-09-01 00:00:00', NULL, 1),
(26, 1, NULL, 2, 6, 9, '2013-09-01 00:00:00', NULL, 1),
(27, 1, NULL, 2, 7, 9, '2013-09-01 00:00:00', NULL, 2),
(28, 1, NULL, 2, 8, 9, '2013-09-01 00:00:00', NULL, 0),
(29, 1, NULL, 2, 9, 9, '2013-09-01 00:00:00', NULL, 2),
(30, 1, NULL, 2, 10, 9, '2013-09-01 00:00:00', NULL, 2),
(31, 1, NULL, 2, 11, 9, '2013-09-01 00:00:00', NULL, 1),
(32, 1, NULL, 2, 12, 9, '2013-09-01 00:00:00', NULL, 2),
(33, 1, NULL, 2, 13, 9, '2013-09-01 00:00:00', NULL, 2),
(34, 1, NULL, 2, 14, 9, '2013-09-01 00:00:00', NULL, 2),
(35, 1, NULL, 2, 15, 9, '2013-09-01 00:00:00', NULL, 2),
(36, 1, NULL, 2, 16, 9, '2013-09-01 00:00:00', NULL, 0),
(37, 1, NULL, 2, 17, 9, '2013-09-01 00:00:00', NULL, 1),
(38, 1, NULL, 2, 18, 9, '2013-09-01 00:00:00', NULL, 1),
(39, 1, NULL, 2, 19, 9, '2013-09-01 00:00:00', NULL, 1),
(40, 1, NULL, 2, 20, 9, '2013-09-01 00:00:00', NULL, 0),
(41, 1, NULL, 3, 1, 9, '2013-09-01 00:00:00', NULL, 3),
(42, 1, NULL, 3, 2, 9, '2013-09-01 00:00:00', NULL, 3),
(43, 1, NULL, 3, 3, 9, '2013-09-01 00:00:00', NULL, 3),
(44, 1, NULL, 3, 4, 9, '2013-09-01 00:00:00', NULL, 3),
(45, 1, NULL, 3, 5, 9, '2013-09-01 00:00:00', NULL, 2),
(46, 1, NULL, 3, 6, 9, '2013-09-01 00:00:00', NULL, 2),
(47, 1, NULL, 3, 7, 9, '2013-09-01 00:00:00', NULL, 3),
(48, 1, NULL, 3, 8, 9, '2013-09-01 00:00:00', NULL, 1),
(49, 1, NULL, 3, 9, 9, '2013-09-01 00:00:00', NULL, 3),
(50, 1, NULL, 3, 10, 9, '2013-09-01 00:00:00', NULL, 3),
(51, 1, NULL, 3, 11, 9, '2013-09-01 00:00:00', NULL, 2),
(52, 1, NULL, 3, 12, 9, '2013-09-01 00:00:00', NULL, 3),
(53, 1, NULL, 3, 13, 9, '2013-09-01 00:00:00', NULL, 3),
(54, 1, NULL, 3, 14, 9, '2013-09-01 00:00:00', NULL, 3),
(55, 1, NULL, 3, 15, 9, '2013-09-01 00:00:00', NULL, 3),
(56, 1, NULL, 3, 16, 9, '2013-09-01 00:00:00', NULL, 1),
(57, 1, NULL, 3, 17, 9, '2013-09-01 00:00:00', NULL, 2),
(58, 1, NULL, 3, 18, 9, '2013-09-01 00:00:00', NULL, 2),
(59, 1, NULL, 3, 19, 9, '2013-09-01 00:00:00', NULL, 2),
(60, 1, NULL, 3, 20, 9, '2013-09-01 00:00:00', NULL, 1),
(61, 1, NULL, 4, 1, 9, '2013-09-01 00:00:00', NULL, 4),
(62, 1, NULL, 4, 2, 9, '2013-09-01 00:00:00', NULL, 4),
(63, 1, NULL, 4, 3, 9, '2013-09-01 00:00:00', NULL, 4),
(64, 1, NULL, 4, 4, 9, '2013-09-01 00:00:00', NULL, 4),
(65, 1, NULL, 4, 5, 9, '2013-09-01 00:00:00', NULL, 3),
(66, 1, NULL, 4, 6, 9, '2013-09-01 00:00:00', NULL, 3),
(67, 1, NULL, 4, 7, 9, '2013-09-01 00:00:00', NULL, 4),
(68, 1, NULL, 4, 8, 9, '2013-09-01 00:00:00', NULL, 3),
(69, 1, NULL, 4, 9, 9, '2013-09-01 00:00:00', NULL, 4),
(70, 1, NULL, 4, 10, 9, '2013-09-01 00:00:00', NULL, 4),
(71, 1, NULL, 4, 11, 9, '2013-09-01 00:00:00', NULL, 3),
(72, 1, NULL, 4, 12, 9, '2013-09-01 00:00:00', NULL, 4),
(73, 1, NULL, 4, 13, 9, '2013-09-01 00:00:00', NULL, 4),
(74, 1, NULL, 4, 14, 9, '2013-09-01 00:00:00', NULL, 4),
(75, 1, NULL, 4, 15, 9, '2013-09-01 00:00:00', NULL, 4),
(76, 1, NULL, 4, 16, 9, '2013-09-01 00:00:00', NULL, 3),
(77, 1, NULL, 4, 17, 9, '2013-09-01 00:00:00', NULL, 3),
(78, 1, NULL, 4, 18, 9, '2013-09-01 00:00:00', NULL, 3),
(79, 1, NULL, 4, 19, 9, '2013-09-01 00:00:00', NULL, 3),
(80, 1, NULL, 4, 20, 9, '2013-09-01 00:00:00', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `chart`
--

CREATE TABLE IF NOT EXISTS `chart` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `report_id` smallint(6) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `show_criterion1` tinyint(1) NOT NULL,
  `show_criterion2` tinyint(1) NOT NULL,
  `show_criterion3` tinyint(1) NOT NULL,
  `show_criterion4` tinyint(1) NOT NULL,
  `type` smallint(6) NOT NULL,
  `show_current_situation` tinyint(1) NOT NULL,
  `show_desired_situation` tinyint(1) NOT NULL,
  `show_high_priority` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E5562A2A4BD2A4C0` (`report_id`),
  KEY `IDX_E5562A2ADE12AB56` (`created_by`),
  KEY `IDX_E5562A2A25F94802` (`modified_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `chart`
--

INSERT INTO `chart` (`id`, `created_by`, `modified_by`, `report_id`, `status`, `created_at`, `modified_at`, `show_criterion1`, `show_criterion2`, `show_criterion3`, `show_criterion4`, `type`, `show_current_situation`, `show_desired_situation`, `show_high_priority`) VALUES
(1, 4, 3, 1, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', 1, 1, 1, 1, 2, 1, 1, 1),
(2, 4, 3, 2, 0, '2013-09-23 00:00:00', '2014-07-09 16:12:28', 1, 1, 1, 1, 2, 1, 1, 1),
(3, 4, 3, 3, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', 1, 1, 1, 1, 2, 1, 1, 1),
(4, 4, 3, 4, 0, '2013-09-23 00:00:00', '2014-07-09 16:12:02', 1, 1, 1, 1, 2, 1, 1, 1),
(5, 4, 3, 5, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', 1, 1, 1, 1, 2, 1, 1, 1),
(6, 4, 3, 6, 9, '2013-09-23 00:00:00', '2013-09-27 00:00:00', 1, 1, 1, 1, 2, 1, 0, 1),
(7, 4, 3, 7, 9, '2013-09-20 00:00:00', '2013-09-27 00:00:00', 1, 1, 1, 1, 2, 1, 1, 1),
(8, 4, 4, 8, 9, '2013-09-23 00:00:00', '2013-09-24 00:00:00', 1, 1, 1, 1, 2, 1, 1, 1),
(9, 3, 3, 9, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', 1, 1, 1, 1, 2, 1, 1, 1),
(10, 3, 3, 10, 0, '2013-09-27 00:00:00', '2013-09-27 00:00:00', 1, 1, 1, 1, 2, 1, 1, 1),
(11, 3, 3, 11, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', 1, 1, 1, 1, 1, 1, 1, 1),
(12, 4, 4, 12, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', 1, 1, 1, 1, 2, 1, 1, 1),
(13, 3, 3, 13, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', 1, 1, 1, 1, 2, 1, 1, 1),
(14, 3, 3, 14, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', 1, 1, 1, 1, 2, 1, 1, 1),
(15, 3, 3, 15, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', 1, 1, 1, 1, 2, 1, 1, 1),
(16, 3, 3, 16, 9, '2013-09-27 00:00:00', '2013-10-01 00:00:00', 1, 1, 1, 1, 2, 1, 1, 1),
(17, 3, 3, 17, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:16', 1, 1, 1, 1, 2, 1, 1, 1),
(18, 3, 3, 18, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', 1, 1, 1, 1, 2, 1, 1, 1),
(19, 3, 3, 19, 0, '2013-09-27 00:00:00', '2014-07-20 06:44:24', 1, 1, 1, 1, 2, 1, 1, 1),
(20, 3, 3, 20, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:05', 1, 1, 1, 1, 2, 1, 1, 1),
(21, 3, 3, 21, 9, '2013-09-29 00:00:00', '2013-09-29 00:00:00', 1, 1, 1, 1, 2, 1, 1, 1),
(22, 3, 3, 22, 9, '2013-10-28 00:00:00', '2013-10-28 00:00:00', 1, 1, 1, 1, 2, 1, 1, 1),
(23, 3, 3, 23, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', 1, 1, 1, 1, 2, 1, 1, 1),
(24, 3, 3, 24, 0, '2014-01-06 11:38:00', '2014-01-06 11:41:07', 1, 1, 1, 1, 2, 1, 1, 1),
(25, 3, 3, 25, 0, '2014-01-06 11:40:45', '2014-01-06 11:41:01', 1, 1, 1, 1, 2, 1, 1, 1),
(26, 3, 3, 26, 9, '2014-01-06 11:41:32', '2014-01-06 11:41:31', 1, 1, 1, 1, 2, 1, 1, 1),
(27, 3, 3, 27, 0, '2014-01-06 11:49:28', '2014-07-20 06:43:23', 1, 1, 1, 1, 2, 1, 1, 1),
(28, 3, 3, 28, 0, '2014-01-06 11:49:47', '2014-07-20 06:43:11', 1, 1, 1, 1, 2, 1, 1, 1),
(29, 3, 3, 29, 0, '2014-01-06 11:50:33', '2014-07-20 06:43:00', 1, 1, 1, 1, 2, 1, 1, 1),
(30, 3, 3, 30, 9, '2014-07-20 06:18:08', '2014-07-20 06:18:08', 1, 1, 1, 1, 2, 1, 1, 1),
(31, 3, 3, 31, 9, '2014-07-20 15:25:57', '2014-07-20 15:25:57', 1, 1, 1, 1, 2, 1, 1, 1),
(32, 3, 3, 32, 9, '2014-07-20 15:51:43', '2014-07-20 15:51:43', 1, 1, 1, 1, 2, 1, 1, 1),
(33, 3, 3, 33, 0, '2014-10-05 20:11:12', '2014-10-07 13:11:49', 1, 1, 1, 1, 2, 1, 1, 1),
(34, 3, 3, 34, 0, '2014-10-05 20:13:37', '2014-10-05 20:14:40', 1, 1, 1, 1, 2, 1, 1, 1),
(35, 3, 3, 35, 0, '2014-10-05 20:20:07', '2014-10-07 13:11:19', 1, 1, 1, 1, 2, 1, 1, 1),
(36, 3, 3, 36, 9, '2014-10-07 14:01:33', '2014-10-07 14:01:33', 1, 1, 1, 1, 2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `criterion`
--

CREATE TABLE IF NOT EXISTS `criterion` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `chapter_nr` smallint(6) NOT NULL,
  `type` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7C822271DE12AB56` (`created_by`),
  KEY `IDX_7C82227125F94802` (`modified_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `criterion`
--

INSERT INTO `criterion` (`id`, `created_by`, `modified_by`, `status`, `created_at`, `modified_at`, `chapter_nr`, `type`) VALUES
(1, 1, NULL, 9, '2013-09-01 00:00:00', NULL, 1, 1),
(2, 1, NULL, 9, '2013-09-01 00:00:00', NULL, 2, 1),
(3, 1, NULL, 9, '2013-09-01 00:00:00', NULL, 3, 2),
(4, 1, NULL, 9, '2013-09-01 00:00:00', NULL, 4, 2),
(5, 1, NULL, 9, '2013-09-01 00:00:00', NULL, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `criterion_item`
--

CREATE TABLE IF NOT EXISTS `criterion_item` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `criterion_id` smallint(6) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `paragraph_nr` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ED8C02DBDE12AB56` (`created_by`),
  KEY `IDX_ED8C02DB25F94802` (`modified_by`),
  KEY `IDX_ED8C02DB97766307` (`criterion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `criterion_item`
--

INSERT INTO `criterion_item` (`id`, `created_by`, `modified_by`, `criterion_id`, `status`, `created_at`, `modified_at`, `paragraph_nr`) VALUES
(1, 1, NULL, 1, 9, '2013-09-01 00:00:00', NULL, 1),
(2, 1, NULL, 1, 9, '2013-09-01 00:00:00', NULL, 2),
(3, 1, NULL, 1, 9, '2013-09-01 00:00:00', NULL, 3),
(4, 1, NULL, 1, 9, '2013-09-01 00:00:00', NULL, 4),
(5, 1, NULL, 2, 9, '2013-09-01 00:00:00', NULL, 1),
(6, 1, NULL, 2, 9, '2013-09-01 00:00:00', NULL, 2),
(7, 1, NULL, 2, 9, '2013-09-01 00:00:00', NULL, 3),
(8, 1, NULL, 2, 9, '2013-09-01 00:00:00', NULL, 4),
(9, 1, NULL, 3, 9, '2013-09-01 00:00:00', NULL, 1),
(10, 1, NULL, 3, 9, '2013-09-01 00:00:00', NULL, 2),
(11, 1, NULL, 3, 9, '2013-09-01 00:00:00', NULL, 3),
(12, 1, NULL, 3, 9, '2013-09-01 00:00:00', NULL, 4),
(13, 1, NULL, 4, 9, '2013-09-01 00:00:00', NULL, 1),
(14, 1, NULL, 4, 9, '2013-09-01 00:00:00', NULL, 2),
(15, 1, NULL, 4, 9, '2013-09-01 00:00:00', NULL, 3),
(16, 1, NULL, 4, 9, '2013-09-01 00:00:00', NULL, 4),
(17, 1, NULL, 5, 9, '2013-09-01 00:00:00', NULL, 1),
(18, 1, NULL, 5, 9, '2013-09-01 00:00:00', NULL, 2),
(19, 1, NULL, 5, 9, '2013-09-01 00:00:00', NULL, 3),
(20, 1, NULL, 5, 9, '2013-09-01 00:00:00', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `criterion_item_translation`
--

CREATE TABLE IF NOT EXISTS `criterion_item_translation` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `criterion_item_id` smallint(6) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `lang` smallint(6) NOT NULL,
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `info_stage1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `info_stage2` longtext COLLATE utf8_unicode_ci NOT NULL,
  `info_stage3` longtext COLLATE utf8_unicode_ci NOT NULL,
  `info_stage4` longtext COLLATE utf8_unicode_ci NOT NULL,
  `info_stage5` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A8D65081DE12AB56` (`created_by`),
  KEY `IDX_A8D6508125F94802` (`modified_by`),
  KEY `IDX_A8D6508131A5B285` (`criterion_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=61 ;

--
-- Dumping data for table `criterion_item_translation`
--

INSERT INTO `criterion_item_translation` (`id`, `created_by`, `modified_by`, `criterion_item_id`, `status`, `created_at`, `modified_at`, `lang`, `value`, `info_stage1`, `info_stage2`, `info_stage3`, `info_stage4`, `info_stage5`) VALUES
(1, 1, NULL, 1, 9, '2013-09-01 00:00:00', NULL, 1, 'Vision', 'The management has a vision on sustainable development and education.  - This vision is only implicit.', 'The management vision on sustainability has been formulated in documents.  - The management offers opportunities and facilities to work out the vision as concrete consequences for the organisation and the education.', 'The organisation vision on sustainable development and education has been expressed in the mission statement, and is translated in a concrete policy.  - The results of the policy are evaluated regularly, using these goals.  - Staff and students are involved in the vision development.', 'The vision development about sustainability and the translation of it in a concrete policy takes place in interaction with the professional field and with the secondary education.', 'The organisation vision on sustainable development and education is integrated with the vision on long term development of society and the role therein of the organisation.  - The vision is constantly kept up to date in interaction with many actors in society.'),
(2, 1, NULL, 2, 9, '2013-09-01 00:00:00', NULL, 1, 'Policy', 'The policy with respect to sustainability is developed mainly top-down by the management.  - Much of this policy is only implicit.  - This policy development is usually motivated by incidental situations or events.', 'Staff members have a visible role in the development of a policy with respect to  sustainability.  - The sustainability policy is made explicit in documents.  - The policy plans are related to short term developments. ', 'Staff members and students are involved systematically in the development of the policy with respect to  sustainability.  - This policy is translated in assessable goals, and evaluated and (if necessary) adjusted.  - The sustainability policy is middle long term related.', 'Also, external organisations (secundary education and the professional field, e.g. via graduates) are involved in the development of the policy with respect to  sustainability.  - Activities related to this policy are developed and performed together with these external parties on a regular basis.  - The sustainability policy is  long term related.', 'The sustainability policy is developed and carried out in close cooperation with many actors in society, and contributes explicitly to the policy realisation of these actors.  - In these contacts, the organisation has an active, anticipatory role, based on a deep expertise and  experience.'),
(3, 1, NULL, 3, 9, '2013-09-01 00:00:00', NULL, 1, 'Communication', 'Efforts of individual members of the staff or of parts of the organisation to enlarge the attention for sustainability take place.', 'Sustainable development in education, research and operations is a regularly appearing subject in meetings and in internal and external publications.', 'The management has a knowledge of the opinions about sustainability and education of staff members and students.  - This information is used to shape the communication about sustainability.', 'Secondary education and the professional field are involved actively in the communication about sustainability: the communication is in both directions.  - The communication is about sustainability in a "broad sense": not only referring to the own subjects but in a transdisciplinary way.', 'A wide variety of societal actors are involved in the communication about sustainability: the communication is in both directions.  - Publications by the organisation, by staff members and/or students, are leading.'),
(4, 1, NULL, 4, 9, '2013-09-01 00:00:00', NULL, 1, 'Internal environmental management', 'Individual staff members and/or students look after certain aspects of the internal environmental management.', 'Environmental management is a part of the policy and the management of the organisation.  - Certain aspects of the internal environmental management are managed (rather) effectively:  = Material flows  = Catering  = Energy efficiency  = Waste prevention and separation    - The students are involved in some way in the environmental management.', 'There is a functioning environmental management system.  - Annually an environmental report is published.  - The environmental management is used intentionally for the education, e.g. as an example of good practice and as an object for exercises.', 'The environmental management system includes demands for suppliers, a traffic plan for the personnel, and a long-term vision on the buildings and the surroundings.  - The environmental management system is certified.  - Students have an active role in the continuous improvement and the performing of the environmental management plan.', 'The environmental management system is an integral part of the total quality management of the organisation.  - There is an optimal embedding in the surroundings and the natural environment.  - In the development of this, the organisation, represented in part by students, had an active role.'),
(5, 1, NULL, 5, 9, '2013-09-01 00:00:00', NULL, 1, 'Network', 'Individual staff members have contacts with companies and/or centres of expertise in the professional field, and so enlarge their knowledge and experience about sustainability.', 'The organisation has contacts within the professional field.  - The education benefits from the expertise about sustainability that is present there: directly, e.g. through appearances of guest teachers, and indirectly, through enlargement of the knowledge of the teaching staff.', 'From the perspective of the curriculum contents, regularly the need is investigated for expertise about sustainability.   Based on the results, a network of external relations is maintained.  - The expertise in this network is transferred to the organisation and the education.', 'Regularly, exchange takes place between staff members of the organisation, of secondary education, and of the professional field.  - This happens e.g. as a secondment, in which the role of sustainability has been made explicit: together, practical projects are done, education is developed, and guest colleges are given.', 'The network of expertise is international and interdisciplinary. - Societal organisations are a part of it.  - The organisation itself has a clear role in it as a centre of expertise with respect to sustainability.'),
(6, 1, NULL, 6, 9, '2013-09-01 00:00:00', NULL, 1, 'Expert group', 'One or some members of the staff, with a special interest in developments around sustainability within their own course, take initiatives to integrate elements of it in the curriculum.', 'There is a group of staff members who, facilitated by the organisation, keep their knowledge about sustainability within their own and related fields up to date and exchange it among them.  - The group is involved with education development.', 'An institute (or a department, a group etc.) forms a permanent centre of expertise within the organisation.  - This institute participates in the educational development, and has a direct relation with the management.', 'The institute has an integral vision on sustainable development and the consequences for education.  - It forms a permanent connection with the professional field and with centres of expertise, and it sees to it that knowledge from them reaches the management and the staff, everywhere where it is needed.', 'Members of the institute are (inter)nationally leading with respect to sustainable development and the way this is integrated in education.  - The organisation propagates this expertise actively, nationally and internationally.'),
(7, 1, NULL, 7, 9, '2013-09-01 00:00:00', NULL, 1, 'Staff development plan', 'Staff development in sustainability depends on individual initiatives.', 'There is a staff development plan in sustainability.  - This plan is mainly short term related.  - For the execution of the plan, facilities are made available by the management.', 'The need of the organisation for expertise in sustainability is known.  - The development plan is based on a match between this need and the individual wishes of the staff members for supplementary training and refresher courses.  - The plan is mainly middle long-term related.', 'The sustainability staff development plan is long term related.  - It includes a policy towards appointments and resignations, retraining, introduction of new staff members.  - An explicit relation exists with the strategic policy of the organisation in general.', 'The organisation policy on sustainability is based on societal and technological developments.  - There is a systematic feedback to society.'),
(8, 1, NULL, 8, 9, '2013-09-01 00:00:00', NULL, 1, 'Research, external services', 'In research and external services by the organisation, aspects of sustainability are present.  - Incidentally the teachers and/or the education profits from the expertise acquired in this way.', 'The organisation is working on the development of a range of researches and external services in which sustainability is expressly important.  - There is a policy enabling  the teachers and/or the education to profit from the expertise acquired in this way.', 'Based on its policy, the organisation sees to it that in a large percentage of its research and external services sustainability is a main aspect.  - In a systematic way, the staff and the education profit from the expertise that is gained with it.', 'With respect to research and external services, an intensive co-operation exists with external institutes having special expertise concerning sustainability, aiming at acquiring new knowledge on both sides.  - Teachers and students are involved directly in this co-operation.', 'With respect to research and external services concerning sustainability, the organisation belongs (inter)nationally to the best institutes.'),
(9, 1, NULL, 9, 9, '2013-09-01 00:00:00', NULL, 1, 'Profile of the graduate', 'The profile of the graduate contains some visible aspects of sustainable development.', 'Sustainable development is mentioned explicitly in the profile of the graduate.  - The staff is actively involved in the determination of the sustainable elements in the profile.  - Within the own professional fields, the profile contains a fairly complete image of knowledge and skills with respect to sustainability, according to the organisation itself.', 'The students are also actively involved in the determination of the sustainable elements in the profile of the graduate.  - Sustainability in a broad, multidisciplinary sense is recognisable in the profile.  - Regelar evaluations and adjustments of the profile take place.', 'The professional field is also actively involved in the determination, evaluation and improvement of the sustainable elements in the profile of the graduate.  - The profile contains all or most of the aspects of sustainability in a broad, interdisciplinary sense, in a balanced way.', 'Many actors in society are also actively involved in the determination, evaluation and improvement of the sustainable elements in the profile of the graduate: a transdisciplinary approach.  - Compared with sister-institutions the organisation fulfils a leading role with respect to the determination of the profile.'),
(10, 1, NULL, 10, 9, '2013-09-01 00:00:00', NULL, 1, 'Educational methodology', 'Now and then the student meets situations in which reflective skills can be practised.', 'The curriculum contains on planned places parts in which the student is stimulated to develop a reflective attitude.', 'The education methodology and the learning setting are designed in such a way that the student regularly meets realistic situations in which a reflective attitude is demanded.  - The teachers provide the student feedback on this on a regular basis.', 'In the process of this feedback to the individual student, regularly the relation is discussed between choices and behaviour of the student and the consequences of this for sustainable development on the short and the long term.', 'In the course of the educational process the student receives this kind of feedback from a variety of actors in society .'),
(11, 1, NULL, 11, 9, '2013-09-01 00:00:00', NULL, 1, 'Role of the teacher', 'Some of the teachers emphasise in front of the students a sustainable attitude through their attitude and behaviour.', 'The organisation encourages that all staff members underline the importance of a sustainable attitude through their own education, attitude and behaviour.  - The teachers receive feedback on this.', 'In the staff policy plan, a sustainable attitude and a consequent behaviour is formulated explicitly.', 'Systematically, the organisation asks co-operation of companies where the students do their traineeships or graduation projects, in order to show consistently that sustainable thinking and acting should be a necessary part of daily practice.', 'A regular exchange of opinions takes place between teachers, students and relevant actors in society about the question, what a sustainable attitude means and what characterises sustainable behaviour as a professional and a citizen.'),
(12, 1, NULL, 12, 9, '2013-09-01 00:00:00', NULL, 1, 'Student examination', 'In the examination of certain curriculum parts, aspects of sustainability are present implicitly or explicitly.', 'All relevant aspects of sustainable development are examined in some way somewhere during the course.', 'The systematic examination of sustainable subjects is spread over the curriculum in a carefully considered way, taking into account an increasing complexity, study- and examination methods, etc.  - This is formulated explicitly in the examination regulations.', 'The systematic examination of sustainability is evaluated and improved regularly, with the aid of external experts. These are also involved in the actual judging the student achievements on crucial moments.', 'The examination of sustainability is integrated with other, possibly conflicting societal or business-related interests. This appeals to the decision capacity and the responsibility of the student as a future professional.'),
(13, 1, NULL, 13, 9, '2013-09-01 00:00:00', NULL, 1, 'Curriculum', 'Certain education modules contain relevant elements of sustainable development.', 'Basic knowledge of sustainable development  has its own position in the curriculum.  - The rest of the curriculum contains elements of sustainability, building on this basic knowledge.  - The whole of basic knowledge and later sustainability subjects is related in a well-considered way to the profile of the graduate.', 'Sustainability is implemented systematically in the entire curriculum, in accordance with the profile of the graduate.  - The relation between all education units with respect to sustainability has been made explicit.  - The educational modules have, wherever possible, been placed in a sustainable framework.', 'The systematic structure of sustainability in the curriculum is evaluated and adjusted regularly with the aid of experts in the various professional fields. - In the education, using realistic practical situations, the relevance of sustainability for the professional practice is shown and exercised.', 'Besides, in the education, using realistic practical situations, the relevance of sustainability in its full complexity for society as a whole is shown and exercised.'),
(14, 1, NULL, 14, 9, '2013-09-01 00:00:00', NULL, 1, 'Integrated Problem Handling', 'Based on initiatives of individual teachers, integration of some elements takes place on a subject level.', 'The curriculum is designed in such a way that repeatedly subjects are related with each other during the course.', 'The curriculum is designed systematically so that students practice in a growing complexity with relating with each other varying aspects within and without the own field of study.  - Catchwords:  = multidisciplinary  = product innovation  = functional orientation', 'Catchwords:  = chain management  = interdisciplinary  = natural constraints  = middle long term', 'Catchwords:  =transdisciplinary  = international  = intercultural  = societal constraints   = long term'),
(15, 1, NULL, 15, 9, '2013-09-01 00:00:00', NULL, 1, 'Traineeships, graduation', 'Incidentally, practical student projects include elements of sustainable development.', 'If possible, in practical student projects attention is given to sustainability aspects.  - All students are informed that this is expected from them.', 'In at least one traineeship-, graduation or other practical student project sustainability is one of the main aspects.  - This is written in the examination regulations.  - This demand is a part of the systematic integration of sustainability in the curriculum.', 'At least one practical student project with sustainability as a main aspect has to be performed as a member of an interdisciplinary team.  - This is written in the examination regulations.', 'The interdisciplinary team consists of members coming from other sectors of education or businesses.  - The project includes ethical aspects, in which the personal responsibility of the student as a (future) professional is expressed.'),
(16, 1, NULL, 16, 9, '2013-09-01 00:00:00', NULL, 1, 'Speciality', 'Students have the opportunity to select an optional subject related to sustainability, if necessary in another educational institution.', 'The organisation makes available a series of optional subjects in which sustainability is a main aspect.  - Students are enabled to obtain a special certificate or an annotation on the diploma.', 'Students have the opportunity to become a specialist on the area of sustainable development.', 'Starting from a specialism, students have the opportunity to follow a wide, interdisciplinary course in which in which sustainable development plays a main role, and so graduate as a generalist with respect to sustainability.', 'This wide, interdisciplinary course is (inter)nationally known as a top level education programme.'),
(17, 1, NULL, 17, 9, '2013-09-01 00:00:00', NULL, 1, 'Appreciation by staff', 'Data are available about the level of appreciation of the staff about sustainability in the organisation.', 'Trend data about this appreciation are available.  - These data are analysed and  documented.', 'These trend data have been compared with the policy targets.  - The conclusions of this comparison are used for the policy determination.', 'These trend data have been compared with those from colleague-organisations.  - The conclusions of this comparison are used for the policy determination.', 'These trend data have been compared with those from excellent organisations in within and outside of the country.  - The conclusions of this comparison are used for the policy determination.'),
(18, 1, NULL, 18, 9, '2013-09-01 00:00:00', NULL, 1, 'Appreciation by students', 'Data are available about the level of appreciation of the students about sustainability in the organisation.', 'Trend data about this appreciation are available.  - These data are analysed and  documented.', 'These trend data have been compared with the policy targets.  - The conclusions of this comparison are used for the policy determination.', 'These trend data have been compared with those from colleague-organisations.  - The conclusions of this comparison are used for the policy determination.', 'These trend data have been compared with those from excellent organisations in within and outside of the country.  - The conclusions of this comparison are used for the policy determination.'),
(19, 1, NULL, 19, 9, '2013-09-01 00:00:00', NULL, 1, 'Appreciation by professional field', 'Data are available about the level of appreciation of the companies in the professional field about sustainability in the organisation.', 'Trend data about this appreciation are available.  - These data are analysed and  documented.', 'These trend data have been compared with the policy targets.  - The conclusions of this comparison are used for the policy determination.', 'These trend data have been compared with those from colleague-organisations.  - The conclusions of this comparison are used for the policy determination.', 'These trend data have been compared with those from excellent organisations in within and outside of the country.  - The conclusions of this comparison are used for the policy determination.'),
(20, 1, NULL, 20, 9, '2013-09-01 00:00:00', NULL, 1, 'Appreciation by society', 'Data are available about the level of appreciation of relevant societal organisations about sustainability in the organisation.', 'Trend data about this appreciation are available.  - These data are analysed and  documented.', 'These trend data have been compared with the policy targets.  - The conclusions of this comparison are used for the policy determination.', 'These trend data have been compared with those from colleague-organisations.  - The conclusions of this comparison are used for the policy determination.', 'These trend data have been compared with those from excellent organisations in within and outside of the country.  - The conclusions of this comparison are used for the policy determination.'),
(21, 1, NULL, 1, 9, '2013-09-01 00:00:00', NULL, 2, 'Visie', 'Het management heeft een visie op duurzame ontwikkeling en onderwijs. - Deze visie is slechts impliciet.', 'De visie op duurzaamheid van het management is geformuleerd in de documenten. - Het management biedt mogelijkheden en faciliteiten om te werken vanuit deze visie met gevolgen voor de organisatie en het onderwijs.', 'De visie van de organisatie op duurzame ontwikkeling en onderwijs is uitgedrukt in de mission statement, en wordt vertaald in een concreet beleid. - De resultaten van het beleid worden regelmatig geëvalueerd, met behulp van deze doelen. - Medewerkers en studenten zijn betrokken bij de ontwikkeling van visie.', 'De visie over duurzaamheid, ontwikkelen en de vertaling ervan in een concreet beleid vindt plaats in interactie met het werkveld en met het voortgezet onderwijs.', 'De organisatie zijn visie op duurzame ontwikkeling en onderwijs is geïntegreerd met de visie op de lange termijn ontwikkeling van de samenleving en de rol daarin van de organisatie. - De visie wordt constant up-to-date gehouden in wisselwerking met vele organisaties in de samenleving.'),
(22, 1, NULL, 2, 9, '2013-09-01 00:00:00', NULL, 2, 'Beleid', 'Het beleid met betrekking tot duurzaamheid is vooral top-down ontwikkeld door het management. - Een groot deel van dit beleid is alleen impliciet. - Deze beleidsontwikkeling wordt meestal ingegeven door incidentele situaties of gebeurtenissen.', 'Medewerkers hebben een zichtbare rol in de ontwikkeling van een beleid met betrekking tot duurzaamheid. - Het duurzaamheidsbeleid is expliciet in de documenten gemaakt. - De beleidsplannen hebben betrekking op korte termijn ontwikkelingen.', 'Medewerkers en studenten worden systematisch betrokken bij de ontwikkeling van het beleid met betrekking tot duurzaamheid. - Dit beleid wordt vertaald in meetbare doelen en geëvalueerd en (indien nodig) aangepast. - Het duurzaamheidsbeleid heeft betrekking op middellange termijn.', 'Ook zijn externe organisaties (secundair onderwijs en het werkveld, bijvoorbeeld via afgestudeerden) die betrokken zijn bij de ontwikkeling van het beleid met betrekking tot duurzaamheid. - Activiteiten in verband met dit beleid worden ontwikkeld en uitgevoerd samen met deze externe partijen op een regelmatige basis. - Het duurzaamheidsbeleid is op lange termijn verbonden.', 'Het duurzaamheidsbeleid wordt ontwikkeld en uitgevoerd in nauwe samenwerking met vele maatschappelijke spelers, en draagt ​​expliciet bij het ​​beleid realisatie van deze spelers. - Met deze contacten, heeft de organisatie een actieve, anticiperende rol, gebaseerd op een diepgaande expertise en ervaring.'),
(23, 1, NULL, 3, 9, '2013-09-01 00:00:00', NULL, 2, 'Communicatie', 'De inspanningen van de individuele leden van het personeel of van delen van de organisatie om de aandacht voor duurzaamheid te vergroten.', 'Duurzame ontwikkeling in onderwijs, onderzoek en operaties is een regelmatig verschenen onderwerp in vergaderingen en in de interne en externe publicaties.', 'Het management is op de hoogte van de adviezen over duurzaamheid en educatie van medewerkers en studenten. - Deze informatie wordt gebruikt om de communicatie over duurzaamheid vorm te geven.', 'Voortgezet onderwijs en het beroepenveld zijn actief betrokken bij de communicatie over duurzaamheid: de communicatie is in beide richtingen. - De communicatie over duurzaamheid is in een "brede zin": niet alleen te verwijzen naar de eigen medewerkers, maar in een interdisciplinaire manier.', 'Een breed scala van sociale partijen zijn betrokken bij de communicatie over duurzaamheid: de communicatie is in beide richtingen. - Publicaties van de organisatie, door medewerkers en / of studenten, zijn toonaangevend.'),
(24, 1, NULL, 4, 9, '2013-09-01 00:00:00', NULL, 2, 'Interne milieuzorg', 'Individuele medewerkers en / of studenten kijken na een aantal aspecten van de interne milieuzorg.', 'Milieumanagement is een onderdeel van het beleid en het beheer van de organisatie. - Bepaalde aspecten van de interne milieuzorg worden beheerd (eerder) effectief: = Goederenstromen = Catering = Energie-efficiëntie = preventie en scheiding van afval - De studenten zijn op een of andere manier  betrokken in het milieumanagementsysteem.', 'Er is een functionerend milieumanagementsysteem. - Er wordt jaarlijks een milieurapport gepubliceerd. - Het milieubeheersysteem bewust wordt gebruikt voor het onderwijs, bijvoorbeeld als een voorbeeld van goede praktijk en als een object voor oefeningen.', 'Het milieubeheersysteem omvat eisen voor leveranciers, een verkeersplan voor het personeel, en een lange termijn visie op de gebouwen en de omgeving. - Het milieumanagementsysteem is gecertificeerd. - Studenten hebben een actieve rol in de continue verbetering en de uitvoering van het milieu-beheersplan.', 'Het milieumanagementsysteem is een integraal onderdeel van de integrale kwaliteitszorg van de organisatie. - Er is een optimale inbedding in de omgeving en de natuurlijke omgeving. - Bij de ontwikkeling hiervan had de organisatie, evenals de meewerkende studenten, een actieve rol.'),
(25, 1, NULL, 5, 9, '2013-09-01 00:00:00', NULL, 2, 'Netwerk', 'Individuele medewerkers hebben contacten met bedrijven en / of kennisinstellingen in het werkveld, en dus vergroting van hun kennis en ervaring over duurzaamheid.', 'De organisatie heeft contacten binnen het werkveld. - Het onderwijs profiteert van de kennis over duurzaamheid, dat aanwezig is: direct, bijv. door middel van optredens van gastdocenten, en indirect, door uitbreiding van de kennis van het onderwijzend personeel.', 'Vanuit het perspectief van de inhoud van het curriculum, wordt regelmatig de noodzaak onderzocht voor deskundigheid over duurzaamheid. Op basis van de resultaten wordt een netwerk van externe relaties onderhouden. - De expertise op dit netwerk wordt overgedragen aan de organisatie en het onderwijs.', 'Regelmatig, vindt er uitwisseling plaats tussen de medewerkers van de organisatie, van het secundair onderwijs, en van het werkveld. - Dit gebeurt bijvoorbeeld als een detachering, waarbij de rol van duurzaamheid uitdrukkelijk vermeld is: samen zijn concrete projecten uitgevoerd, wordt het onderwijs ontwikkeld, en worden er gastcolleges gegeven.', 'Het expertisenetwerk is internationaal en interdisciplinair. - Maatschappelijke organisaties zijn een onderdeel hiervan. - De organisatie zelf heeft een duidelijke rol in deze als een kenniscentrum met betrekking tot duurzaamheid.'),
(26, 1, NULL, 6, 9, '2013-09-01 00:00:00', NULL, 2, 'Expertisegroep', 'Een of meerdere leden van het personeel, met een bijzondere interesse in de ontwikkelingen rond duurzaamheid binnen hun eigen koers, nemen initiatieven om elementen ervan te integreren in het curriculum.', 'Er is een groep medewerkers die, gefaciliteerd door de organisatie, hun kennis,  over duurzaamheid binnen hun eigen en aanverwante gebieden, op de hoogte houden en onderling uitwisselen. - De groep is betrokken bij onderwijsontwikkeling.\r\n', 'Een instituut (of een afdeling, een groep etc.) vormt een permanent centrum van expertise binnen de organisatie. - Dit instituut neemt deel aan de educatieve ontwikkeling, en heeft een directe relatie met het management.', 'Het instituut heeft een integrale visie op duurzame ontwikkeling en de gevolgen daarvan voor het onderwijs. - Het vormt een permanente verbinding met het werkveld en het expertisecentra, het zorgt ervoor dat de kennis de directie, het personeel, overal waar het nodig is, bereikt.', 'Leden van het instituut zijn (inter) nationaal toonaangevend met betrekking tot duurzame ontwikkeling en de manier waarop deze is geïntegreerd in het onderwijs. - De organisatie propageert deze expertise actief, nationaal en internationaal.'),
(27, 1, NULL, 7, 9, '2013-09-01 00:00:00', NULL, 2, 'Personeel ontwikkelingsplan', 'Personeel ontwikkeling op het gebied van duurzaamheid hangt af van afzonderlijke initiatieven.', 'Er is een staf ontwikkelingsplan op het gebied van duurzaamheid. - Dit plan is voornamelijk op korte termijn verbonden. - Voor de uitvoering van het plan, worden faciliteiten, door de directie, ter beschikking gesteld.', 'De behoefte van de organisatie voor de expertise in duurzaamheid is bekend. - Het ontwikkelingsplan is gebaseerd op een match tussen deze behoefte en de individuele wensen van de medewerkers voor aanvullende opleidingen en bijscholingen. - Het plan is vooral op middenlange termijn gerelateerd.', 'De duurzaamheid van het personeel ontwikkelingsplan is op lange termijn verbonden. - Het omvat een beleid ten aanzien van benoemingen en ontslag, omscholing, en introductie van nieuwe medewerkers. - Een expliciete relatie bestaat met het strategisch beleid van de organisatie.', 'De organisatie tav duurzaamheid is gebaseerd op maatschappelijke en technologische ontwikkelingen. - Er is een systematische terugkoppeling naar de samenleving.'),
(28, 1, NULL, 8, 9, '2013-09-01 00:00:00', NULL, 2, 'Onderzoek, externe diensten', 'In onderzoek en externe dienstverlening door de organisatie, wordt gekeken welke aspecten van duurzaamheid aanwezig zijn. - De leerkrachten en / of het onderwijs profiteert op deze manier van de opgedane expertise.', 'De organisatie werkt aan de ontwikkeling van een reeks van onderzoeken en externe dienstverlening waarin duurzaamheid nadrukkelijk van belang is. - Er is een beleid waarmee de leerkrachten en / of het onderwijs profiteren van de aldus verworven kennis.', 'Op basis van haar beleid, zorgt de organisatie ervoor dat in een groot percentage van zijn onderzoek en dienstverlening externe duurzaamheid een belangrijke aspect is. - Het personeel en de opleiding profiteren,op een systematische manier, van de expertise die hiermee is opgedaan.', 'Ten opzichte van onderzoek en externe diensten, bestaat er een intensieve samenwerking met externe instituten met bijzondere deskundigheid inzake duurzaamheid. Deze samenwerking is gericht op het verwerven van nieuwe kennis aan beide kanten. - Docenten en studenten zijn direct betrokken bij deze samenwerking.', 'Ten opzichte van onderzoek en externe diensten met betrekking tot duurzaamheid behoort de organisatie (inter) nationaal tot de beste instituten.'),
(29, 1, NULL, 9, 9, '2013-09-01 00:00:00', NULL, 2, 'Profiel van van de gediplomeerde', 'Het profiel van van de gediplomeerde bevat enkele zichtbare aspecten van duurzame ontwikkeling.', 'Duurzame ontwikkeling wordt expliciet genoemd in het profiel van de gediplomeerde. - Het personeel is actief betrokken bij het ​​bepalen van de duurzame elementen in het profiel. - Binnen de eigen vakgebieden, bevat het profiel een vrij compleet beeld van de kennis en vaardigheden met betrekking tot duurzaamheid, volgens de organisatie zelf.', 'De studenten zijn ook actief betrokken bij het ​​bepalen van de duurzame elementen in het profiel van de gediplomeerde. - Duurzaamheid in brede, multidisciplinaire zin is herkenbaar in het profiel. - Er zullen regelmatige evaluaties en aanpassingen van het profiel plaatsvinden.', 'Het werkveld is ook actief betrokken bij de vaststelling, evaluatie en verbetering van de duurzame elementen in het profiel van de gediplomeerde. - Het profiel bevat alle of de meeste van de aspecten van duurzaamheid in een brede, interdisciplinaire zin, op een evenwichtige manier.', 'Veel partijen in de samenleving zijn ook actief betrokken bij de vaststelling, evaluatie en verbetering van de duurzame elementen in het profiel van de gediplomeerde: een transdisciplinaire aanpak. - In vergelijking met zuster-instellingen vervult de organisatie een leidende rol met betrekking tot de vaststelling van het profiel.'),
(30, 1, NULL, 10, 9, '2013-09-01 00:00:00', NULL, 2, 'Educatieve methodologie', 'Nu en dan komen de studenten in situaties terecht waarin reflectieve vaardigheden kunnen worden geoefend.', 'Het curriculum bevat op geplande plaatsen onderdelen waarin de student wordt gestimuleerd om een reflectieve houding te ontwikkelen.', 'De onderwijs methodiek en de leeromgeving zijn ontworpen op een zodanige wijze dat de student voldoet aan regelmatig realistische situaties waarin een reflectieve houding wordt geëist. - De leraren geven de student op een regelmatige basis feedback over deze situaties.', 'In het proces van deze feedback voor de individuele student, wordt regelmatig de relatie besproken tussen de keuzes en het gedrag van de student en de gevolgen hiervan voor duurzame ontwikkeling op de korte en de lange termijn.', 'Tijdens het leerproces ontvangt de student deze vorm van feedback van verschillende maatschappelijke spelers.'),
(31, 1, NULL, 11, 9, '2013-09-01 00:00:00', NULL, 2, 'De rol van de leerkracht', 'Een deel van de leraren benadrukken tegenover de studenten een duurzame houding door middel van hun houding en gedrag.', 'De organisatie stimuleert dat alle medewerkers het belang van een duurzame houding onderstrepen door hun eigen onderwijs, houding en gedrag. - De leerkrachten krijgen feedback over deze houding.', 'In het personeelsbeleidsplan, wordt een duurzame instelling en het daaruit voortvloeiende gedrag expliciet geformuleerd.', 'Systematisch, vraagt de organisatie ​​samenwerking van bedrijven waar de studenten hun stage en afstudeerprojecten uitvoeren, om consequent laten zien dat duurzaam denken en handelen een noodzakelijk onderdeel van de dagelijkse praktijk moeten zijn.', 'Een regelmatige uitwisseling van meningen vindt plaats tussen docenten, studenten en betrokken partijen in de samenleving over de vraag, wat een duurzame houding betekent en wat duurzaam gedrag kenmerkt als een professional en een burger.'),
(32, 1, NULL, 12, 9, '2013-09-01 00:00:00', NULL, 2, 'Student onderzoek', 'In het onderzoek van bepaalde curriculum delen, zijn aspecten van duurzaamheid aanwezig zowel impliciet of expliciet.', 'Alle relevante aspecten van duurzame ontwikkeling worden onderzocht op een bepaalde manier tijdens het verloop van de opleiding.', 'Een systematisch onderzoek van duurzame onderwerpen is, op een weloverwogen manier, verdeeld over het curriculum, rekening houdend met een toenemende complexiteit, studie-en onderzoeksmethoden, etc. - Dit wordt expliciet in het examenreglement geformuleerd.', 'Een systematisch onderzoek van duurzaamheid wordt geëvalueerd en regelmatig verbeterd, met de hulp van externe deskundigen. Deze worden ook betrokken bij de daadwerkelijke beoordeling,op cruciale momenten, van de door de student behaalde resultaten.', 'Het onderzoek van duurzaamheid is geïntegreerd met andere, mogelijk conflicterende maatschappelijke of zakelijke belangen. Dit spreekt tot de beslissing, capaciteit en de verantwoordelijkheid van de student als toekomstige professional.'),
(33, 1, NULL, 13, 9, '2013-09-01 00:00:00', NULL, 2, 'Curriculum', 'Bepaalde onderwijs modules bevatten relevante elementen van duurzame ontwikkeling.', 'Basiskennis van duurzame ontwikkeling heeft zijn eigen plaats in het curriculum. - De rest van het curriculum bevat elementen van duurzaamheid, voortbouwend op deze basiskennis. - Het geheel van basiskennis en later duurzaamheid wordt verteld in een weloverwogen manier voor het profiel van de afgestudeerde.', 'Duurzaamheid wordt systematisch geïmplementeerd in het gehele curriculum, in overeenstemming met het profiel van de afgestudeerde. - De relatie tussen alle onderwijs-eenheden met betrekking tot duurzaamheid is expliciet gemaakt. - De educatieve modules zijn, zoveel mogelijk, ingedeeld in een duurzaam kader.', 'De systematische structuur van duurzaamheid in het curriculum wordt geëvalueerd en regelmatig aangepast met behulp van experts op de verschillende vakgebieden. - In het onderwijs wordt, met behulp van realistische praktijksituaties, de relevantie van duurzame ontwikkeling voor de beroepspraktijk getoond en uitgeoefend.', 'Daarnaast,wordt in het onderwijs, met behulp van realistische praktijksituaties, de relevantie van duurzaamheid in zijn volle complexiteit voor de samenleving als geheel getoond en uitgeoefend.'),
(34, 1, NULL, 14, 9, '2013-09-01 00:00:00', NULL, 2, 'Geïntegreerde Probleemaanpak', 'Gebaseerd op initiatieven van individuele leerkrachten, vindt integratie van sommige elementen plaats op een onderworpen niveau.', 'Het programma is ontworpen op een zodanige wijze dat herhaaldelijk onderwerpen met elkaar verbonden worden in de loop van de opleiding.', 'Het curriculum is systematisch ontworpen zodat studenten oefenen in een groeiende complexiteit met betrekking op de verschillende aspecten binnen en buiten het eigen vakgebied. - Kernwoorden: = multidisciplinair = productinnovatie = functionele oriëntatie', 'Steekwoorden: = ketenbeheer = interdisciplinair = natuurlijke beperkingen = middellange termijn', 'Steekwoorden: = transdisciplinair = internationale = interculturele = maatschappelijke randvoorwaarden = lange termijn'),
(35, 1, NULL, 15, 9, '2013-09-01 00:00:00', NULL, 2, 'Stages, afstuderen', 'Praktische studentenprojecten bevatten elementen van duurzame ontwikkeling.', 'Indien mogelijk, in de praktijk wordt in studentenprojecten aandacht besteed aan duurzaamheidsaspecten. - Alle studenten worden geïnformeerd dat dit van hen wordt verwacht.', 'In ten minste een stage-, afstuderen of ander praktisch project is duurzaamheid een van de belangrijkste aspecten. - Dit is geschreven in het examenreglement. - Deze vraag is een onderdeel van de systematische integratie van duurzaamheid in het curriculum.', 'Ten minste een praktisch studentenproject, met duurzaamheid als belangrijkste aspect, dient te worden uitgevoerd als lid van een interdisciplinair team. - Dit is geschreven in het examenreglement.', 'Het interdisciplinaire team bestaat uit leden afkomstig uit andere onderwijssectoren of bedrijven. - Het project omvat ethische aspecten, waarin de persoonlijke verantwoordelijkheid van de student als een (toekomstige) professional wordt uitgedrukt.'),
(36, 1, NULL, 16, 9, '2013-09-01 00:00:00', NULL, 2, 'Specialiteit', 'Studenten hebben de mogelijkheid om een keuzevak met betrekking tot duurzaamheid te selecteren, eventueel in een andere onderwijsinstelling.', 'De organisatie stelt een reeks van keuzevakken ter beschikking waarin duurzaamheid een belangrijke aspect. - Studenten worden ingeschakeld om een speciaal certificaat of een aantekening op het diploma te behalen.', 'Studenten hebben de mogelijkheid om een specialist op het gebied van duurzame ontwikkeling te worden.', 'Uitgaande van een specialisme, hebben de studenten de mogelijkheid om een ​​breed, interdisciplinair vak te volgen waarin duurzame ontwikkeling een belangrijke rol speelt, en dus kunnen afstuderen als een generalist met betrekking tot duurzaamheid.', 'Deze brede, interdisciplinaire cursus is (inter) nationaal bekend als een top-level opleiding.'),
(37, 1, NULL, 17, 9, '2013-09-01 00:00:00', NULL, 2, 'Waardering door personeel', 'Gegevens beschikbaar zijn over de mate van waardering van de medewerkers over duurzaamheid binnen de organisatie.', 'Trendgegevens over deze waardering zijn beschikbaar. - Deze gegevens worden geanalyseerd en gedocumenteerd.', 'Deze trendgegevens zijn vergeleken met de beleidsdoelen. - De conclusies van deze vergelijking zijn gebruikt om het beleid te bepalen.', 'Deze trendgegevens zijn vergeleken met die van collega-organisaties. - De conclusies van deze vergelijking zijn gebruikt om het beleid te bepalen.', 'Deze trendgegevens zijn vergeleken met die van excellente organisaties in binnen- en buiten- land. - De conclusies van deze vergelijking zijn gebruikt om het beleid te bepalen.'),
(38, 1, NULL, 18, 9, '2013-09-01 00:00:00', NULL, 2, 'Waardering door studenten', 'Er zijn gegevens beschikbaar over de mate van waardering van de studenten binnen de organisatie.', 'Trendgegevens over deze waardering zijn beschikbaar. - Deze gegevens worden geanalyseerd en gedocumenteerd.', 'Deze trendgegevens zijn vergeleken met de beleidsdoelen. - De conclusies van deze vergelijking zijn gebruikt om het beleid te bepalen.', 'Deze trendgegevens zijn vergeleken met die van collega-organisaties. - De conclusies van deze vergelijking zijn gebruikt om het beleid te bepalen.', 'Deze trendgegevens zijn vergeleken met die van excellente organisaties in binnen- en buiten- land. - De conclusies van deze vergelijking zijn gebruikt om het beleid te bepalen.'),
(39, 1, NULL, 19, 9, '2013-09-01 00:00:00', NULL, 2, 'Waardering door professionals', 'Er zijn gegevens beschikbaar over de mate van waardering van de duurzaamheid binnen de organisatie.', 'Trendgegevens over deze waardering zijn beschikbaar. - Deze gegevens worden geanalyseerd en gedocumenteerd.', 'Deze trendgegevens zijn vergeleken met de beleidsdoelen. - De conclusies van deze vergelijking zijn gebruikt om het beleid te bepalen.', 'Deze trendgegevens zijn vergeleken met die van collega-organisaties. - De conclusies van deze vergelijking zijn gebruikt om het beleid te bepalen.', 'Deze trendgegevens zijn vergeleken met die van excellente organisaties in binnen- en buiten- land. - De conclusies van deze vergelijking zijn gebruikt om het beleid te bepalen.'),
(40, 1, NULL, 20, 9, '2013-09-01 00:00:00', NULL, 2, 'Waardering door de maatschappij', 'Er zijn gegevens beschikbaar over de mate van waardering van de relevante maatschappelijke organisaties over duurzaamheid in de organisatie.', 'Trendgegevens over deze waardering zijn beschikbaar. - Deze gegevens worden geanalyseerd en gedocumenteerd.', 'Deze trendgegevens zijn vergeleken met de beleidsdoelen. - De conclusies van deze vergelijking zijn gebruikt om het beleid te bepalen.', 'Deze trendgegevens zijn vergeleken met die van collega-organisaties. - De conclusies van deze vergelijking zijn gebruikt voor het beleid te bepalen.', 'Deze trendgegevens zijn vergeleken met die van excellente organisaties in binnen- en buiten- land. - De conclusies van deze vergelijking zijn gebruikt om het beleid te bepalen.'),
(41, NULL, NULL, 1, 9, '2013-09-17 00:00:00', NULL, 3, 'Vision', 'La direction a une vision du développement durable et l''éducation. - Ce point de vue est seulement implicite.', 'La vision de la gestion de la durabilité est formulée dans les documents. - La direction offre des possibilités et des facilités pour travailler à partir de cette vision touchant l''organisation et de l''éducation.', 'La vision de l''organisation sur le développement durable et l''éducation est exprimé dans la déclaration de mission, et traduit en politiques concrètes. - Les résultats de la politique sont régulièrement évaluées à l''aide de ces objectifs. - Le personnel et les élèves sont impliqués dans le développement de la vision.', 'La vision de la durabilité, et de développer leur traduction en politiques concrètes se déroule en interaction avec le champ et de l''enseignement secondaire.', 'La vision de l''organisation de développement durable et l''éducation est intégrée à la vision de développement à long terme de la société et le rôle de l''organisation. - La vision est constamment mise à jour interagit avec de nombreuses organisations dans la société.'),
(42, NULL, NULL, 2, 9, '2013-09-17 00:00:00', NULL, 3, 'Politique', 'La politique à l''égard de la durabilité est principalement top-down développée par la direction. - Une grande partie de cette politique n''est qu''implicite. - Élaboration de cette politique est habituellement dicté par des situations ou des événements ponctuels.', 'Les employés ont un rôle visible dans le développement d''une politique de développement durable. - La politique de développement durable est rendue explicite dans les documents. - La politique traite de l''évolution à court terme.', 'Le personnel et les étudiants sont systématiquement impliqués dans l''élaboration des politiques liées à la durabilité. - Cette politique se traduit par des objectifs mesurables et évalués et (si nécessaire) réglée. - La politique de développement durable concerne moyen terme.', 'En outre, les organisations externes (étudiants et entrepreneurs secondaires, par exemple par les diplômés) qui sont impliqués dans l''élaboration des politiques liées à la durabilité. - Les activités liées à cette politique seront élaborés et mis en œuvre en collaboration avec ces partis sur une base régulière. - La politique de développement durable est lié à long terme.', 'La politique de développement durable est élaboré et mis en œuvre en étroite collaboration avec de nombreux acteurs sociaux, et contribue explicitement politiques réalisation de ces joueurs. - Grâce à ces contacts, l''organisation a un rôle d''anticipation active, basée sur une expertise et une expérience profonde.'),
(43, NULL, NULL, 3, 9, '2013-09-17 00:00:00', NULL, 3, 'Communication', 'Les efforts des membres du personnel ou des parties de l''organisation pour accroître la sensibilisation. Sustainability', 'Le développement durable dans l''enseignement, la recherche et l''exploitation est un sujet régulièrement apparu dans les réunions et dans les publications internes et externes.', 'La direction est consciente des opinions sur le développement durable et l''éducation du personnel et des étudiants. - Cette information est utilisée pour fournir une communication sur la forme de la durabilité.', 'L''enseignement secondaire et le professionnel sont activement impliqués dans la communication de la communication sur le développement durable dans les deux sens. - Communication sur la durabilité dans un "sens large" non seulement se référer à ses propres employés, mais d''une manière interdisciplinaire.', 'Un large éventail de partis sociaux impliqués dans la communication sur le développement durable: la communication dans les deux sens. - Publications de l''organisation par les salariés et / ou des étudiants, sont en tête.'),
(44, NULL, NULL, 4, 9, '2013-09-17 00:00:00', NULL, 3, 'L''environnement interne', 'Employés individuels et / ou des étudiants s''occupent de certains aspects de l''environnement interne.', 'La gestion environnementale est une partie de la politique et de la gestion de l''organisation. - Certains aspects de l''environnement interne sont gérés (plus tôt) efficace: = flux de marchandises = Catering = efficacité énergétique = prévention et la séparation des déchets - Les étudiants sont en quelque sorte impliqués dans la gestion de l''environnement.', 'Il existe un système de management environnemental de fonctionnement. - Il est publié un rapport environnemental annuel. - Le système de management environnemental est intentionnellement utilisé pour l''éducation, par exemple, comme un exemple de bonne pratique et comme un objet d''exercices.', 'Le système de gestion de l''environnement comprend des exigences pour les fournisseurs, un plan de circulation pour le personnel et une vision à long terme des bâtiments et de l''environnement. - Le système de management environnemental a été certifié. - Les étudiants ont un rôle actif dans l''amélioration continue et la mise en œuvre du plan de gestion environnementale.', 'Le système de gestion de l''environnement est une partie intégrante de la qualité globale de l''organisme. - Il existe un plongement optimal dans l''environnement et le milieu naturel. - Dans le développement de cette organisation, ainsi que les étudiants assistent eu un rôle actif.');
INSERT INTO `criterion_item_translation` (`id`, `created_by`, `modified_by`, `criterion_item_id`, `status`, `created_at`, `modified_at`, `lang`, `value`, `info_stage1`, `info_stage2`, `info_stage3`, `info_stage4`, `info_stage5`) VALUES
(45, NULL, NULL, 5, 9, '2013-09-17 00:00:00', NULL, 3, 'Réseau', 'Employés individuels ont des contacts avec les entreprises et / ou des institutions de recherche dans le domaine, et donc d''améliorer leurs connaissances et expériences sur le développement durable.', 'L''organisation a des contacts dans le domaine. - Les avantages éducatifs de la connaissance au sujet de la durabilité, qui est présent: directement, par exemple au moyen de représentations par des conférenciers invités, et indirectement, par l''élargissement des connaissances du personnel enseignant.', 'Du point de vue du contenu du programme est examiné régulièrement la nécessité d''une expertise sur le développement durable. Selon les résultats, un réseau de relations externes. - L''expertise dans ce réseau est transférée à l''organisation et à l''éducation.', 'Régulièrement, il sera échangé entre les employés de l''organisation de l''enseignement secondaire et du champ. - Cela arrive comme un détachement, où le rôle de la durabilité est explicitement identifié: ensemble réalisé des projets concrets, l''éducation est développé, et il ya des conférences d''invités.', 'Le réseau d''expertise est international et interdisciplinaire. - Les organisations de la société civile font partie de cela. - L''organisation elle-même a un rôle clair dans ce que la connaissance en ce qui concerne la durabilité.'),
(46, NULL, NULL, 6, 9, '2013-09-17 00:00:00', NULL, 3, 'Groupe d''Expertise', 'Un ou plusieurs membres du personnel, avec un intérêt particulier pour le développement de la durabilité au sein de leur propre cours, prendre des initiatives pour intégrer dans le programme scolaire. Leurs éléments', 'Il ya un groupe d''employés, facilitée par l''organisation, leurs connaissances, garder sur la durabilité au sein de leurs propres et dans des domaines connexes, éclairé et à échanger. - Le groupe est impliqué dans le développement éducatif.', 'Une institution (ou un département, groupe, etc) est un centre d''expertise permanent au sein de l''organisation. - L''Institut participe au développement de l''éducation, et a une relation directe avec la direction.', 'L''institut a une vision globale du développement durable et ses implications pour l''éducation. - Il établit une connexion permanente sur le terrain et les centres, il s''assure que la connaissance des administrateurs, le personnel, partout où elle est nécessaire, atteint.', 'Les membres de l''Institut sont (inter) chef de file national en matière de développement durable et comment elle est intégrée dans l''éducation. - L''organisation promeut activement cette expertise, national et international.'),
(47, NULL, NULL, 7, 9, '2013-09-17 00:00:00', NULL, 3, 'Perfectionnement du personnel', 'Le développement du personnel dans le domaine de la durabilité dépend des initiatives individuelles.', 'Il s''agit d''un plan de développement du personnel dans le domaine de la durabilité. - Ce plan est principalement associée à court terme. - Mettre en œuvre le plan, les installations sont mises à disposition par la direction.', 'La nécessité de l''expertise de l''organisation en matière de durabilité est connue. - Le plan de développement est basé sur une correspondance entre les besoins et les besoins individuels des employés en matière de formation supplémentaires et des cours de perfectionnement. - Le plan est principalement liée à moyen terme.', 'La durabilité du développement du personnel est lié à long terme. - Il comprend une politique sur les nominations et révocations, le recyclage et l''introduction de nouveaux employés. - Une relation explicite à l''orientation stratégique de l''organisation.', 'L''organisation sur le développement durable repose sur l''évolution sociale et technologique. - Il ya un retour systématique à la société.'),
(48, NULL, NULL, 8, 9, '2013-09-17 00:00:00', NULL, 3, 'Recherche, les services externes', 'Dans la recherche et les services externes offerts par l''organisme, qui examine les aspects du développement durable sont présents. - Les enseignants et / ou de l''éducation bénéficieront de cette façon à partir de l''expertise acquise.', 'L''organisation développe une série d''enquêtes et de services externes qui le développement durable est explicitement importante. - Il existe une politique qui permet aux enseignants et / ou des prestations de formation de la connaissance ainsi acquise.', 'Sur la base de sa politique, l''organisme doit s''assurer qu''un grand pourcentage de sa recherche et de service viabilité extérieure est un aspect important. - Le personnel et la prestation de la formation, de manière systématique, l''expertise qui a été acquis.', 'Par rapport à la recherche et les services externes, il ya une coopération intensive avec les institutions externes ayant une expertise particulière en matière de durabilité. Visant à acquérir de nouvelles connaissances sur les deux côtés. Cette coopération est - Les enseignants et les élèves sont directement impliqués dans cette coopération.', 'Par rapport à la recherche et les services extérieurs liés à la durabilité, l''organisation (inter) national pour les meilleurs instituts.'),
(49, NULL, NULL, 9, 9, '2013-09-17 00:00:00', NULL, 3, 'Profil des diplômés', 'Le profil du diplômé contient certains aspects visibles du développement durable.', 'Le développement durable est explicitement mentionné dans le profil du diplômé. - Le personnel est activement impliqué dans la détermination des éléments durables dans le profil. - Dans nos propres champs, le profil contient un tableau assez complet des connaissances et des compétences liées à la durabilité, selon l''organisation elle-même.', 'Les étudiants sont également activement impliqués dans la détermination des éléments durables dans le profil du diplômé. - Le développement durable dans un sens large et multidisciplinaire est apparent dans le profil. - Il y aura des examens réguliers et des ajustements à l''endroit de profil.', 'Le domaine est aussi activement impliquée dans l''identification, l''évaluation et l''amélioration des éléments durables dans le profil du diplômé. - Le profil contient tous ou la plupart des aspects de la durabilité dans un sens large et interdisciplinaire, d''une manière équilibrée.', 'De nombreux acteurs de la société sont également activement impliqués dans l''identification, l''évaluation et l''amélioration des éléments durables dans le profil du diplômé: une approche transdisciplinaire. - Par rapport à des institutions sœurs de l''organisation joue un rôle de premier plan en ce qui concerne la détermination du profil.'),
(50, NULL, NULL, 10, 9, '2013-09-17 00:00:00', NULL, 3, 'Méthodologie éducative', 'Maintenant, et puis les élèves dans des situations où les compétences réfléchissantes peuvent être pratiqués.', 'Le programme comprend à programmés lieux composants dans lequel l''étudiant est encouragé à se développer. Une attitude réflexive', 'Les méthodes d''enseignement et l''environnement d''apprentissage sont conçus de telle sorte que l''élève rencontre régulièrement des situations réalistes dans lesquelles une attitude réflexive est nécessaire. - Les enseignants donnent aux élèves les informations sur une base régulière au sujet de ces situations.', 'Dans le cadre de cette rétroaction pour chaque élève, est régulièrement discuté de la relation entre les choix et les comportements de l''élève et les implications pour le développement durable à court et à long terme.', 'Pendant le processus d''apprentissage, l''étudiant recevra ce genre de réactions des différents acteurs sociaux.'),
(51, NULL, NULL, 12, 9, '2013-09-17 00:00:00', NULL, 3, 'Recherche des étudiants', 'Dans l''étude de certaines parties du programme d''études, sont des aspects de la durabilité présenter à la fois implicitement ou explicitement.', 'Tous les aspects pertinents du développement durable sont examinés en quelque sorte au cours de la formation.', 'Une étude systématique des enjeux du développement durable est, de manière délibérée, à travers le programme, en tenant compte d''une complexité croissante, d''étude et de recherche, etc - Cela est explicitement formulée dans les règlements d''examen.', 'Une étude systématique de la durabilité est évaluée et régulièrement améliorée avec l''aide d''experts externes. Ils sont également impliqués dans l''évaluation réelle, à des moments cruciaux, les résultats obtenus par l''étudiant.', 'L''étude de durabilité est intégrée à d''autres intérêts sociaux ou d''affaires potentiellement contradictoires. Cela témoigne de la décision, la capacité et la responsabilité de l''étudiant en tant que futur professionnel.'),
(52, NULL, NULL, 11, 9, '2013-09-17 00:00:00', NULL, 3, 'Le rôle de l''enseignant', 'Certains professeurs mettent l''accent sur l''attitude durable vers les élèves à travers leur attitude et leur comportement.', 'L''organisation encourage tous ses employés l''importance d''une attitude durable soulignent leur propre éducation, l''attitude et le comportement. - Les enseignants reçoivent une rétroaction sur cette attitude.', 'Dans le plan des ressources humaines, une institution durable et formulé le comportement qui en résulte explicitement.', 'Systématiquement, l''organisation demande la coopération des entreprises où les étudiants font leurs stages et des projets de remise des diplômes de montrer constamment que durable penser et d''agir d''une partie nécessaire de la pratique quotidienne devrait être.', 'Un échange de vues régulier a lieu entre enseignants, étudiants et acteurs de la société sur la question de ce que signifie une attitude durable et ce comportement durable se caractérise par un professionnel et un citoyen.'),
(53, NULL, NULL, 13, 9, '2013-09-17 00:00:00', NULL, 3, 'Curriculum', 'Certains modules de formation contiennent des éléments pertinents du développement durable.', 'Une connaissance de base du développement durable a sa propre place dans le programme. - Le reste du programme contient des éléments de développement durable, en s''appuyant sur cette connaissance. - L''ensemble des connaissances et plus tard la durabilité est racontée de façon éclairée pour le profil du diplômé.', 'La durabilité est systématiquement mis en œuvre tout au long du programme, en fonction du profil du diplômé. - La relation entre toutes les unités d''enseignement liés à la durabilité est explicite. - Les modules de formation sont, autant que possible, classées dans un contexte durable.', 'La structure systématique du développement durable dans le programme est revu et mis à jour régulièrement appel à des experts dans les différents domaines. - Dans l''enseignement, à partir de situations réalistes et pratiques, la pertinence du développement durable pour le professionnel affiché et exercé.', 'En outre, dans l''éducation, à partir de situations réalistes et pratiques, la pertinence du développement durable dans toute sa complexité pour la société dans son ensemble affiché et exercé.'),
(54, NULL, NULL, 14, 9, '2013-09-17 00:00:00', NULL, 3, 'Approche intégrée du problème', 'Basé sur des initiatives individuelles des enseignants, intégrera certains éléments lieu au niveau objet.', 'Le programme est conçu de telle sorte que les questions de façon répétée sont reliés les uns aux autres au cours de la formation.', 'Le programme est conçu de telle sorte que les élèves de la pratique systématique d''une complexité croissante à l''égard des divers aspects intérieur et à l''extérieur de leur propre domaine. - Mots-clés: = multidisciplinaire = produit = orientation fonctionnelle', 'Mots clés: = chaîne = interdisciplinaires = contraintes naturelles = moyen terme', 'Mots clés: = transdisciplinaire = international = interculturel = contraintes sociales = long terme'),
(55, NULL, NULL, 15, 9, '2013-09-17 00:00:00', NULL, 3, 'Stages, obtention du diplôme', 'Les projets des élèves pratiques contiennent des éléments de développement durable.', 'Si possible, dans la pratique, dans des projets d''étudiants se concentrer sur les questions de durabilité. - Tous les étudiants sont informés que ce qu''on attend d''eux.', 'Dans au moins un stage, diplôme ou autre viabilité pratique du projet est l''un des aspects les plus importants. - Ce qui est écrit dans le règlement des examens. - Cette question s''inscrit dans le cadre de l''intégration systématique de la durabilité dans le programme.', 'Au moins un projet pratique de l''étudiant, avec la durabilité comme un aspect essentiel, doit être effectuée dans le cadre d''une équipe interdisciplinaire. - Ce qui est écrit dans le règlement des examens.', 'L''équipe interdisciplinaire composée de membres provenant d''autres secteurs ou d''entreprises éducatives. - Le projet comporte des aspects éthiques, dont la responsabilité personnelle de l''étudiant comme un (futur) professionnel est exprimée.'),
(56, NULL, NULL, 16, 9, '2013-09-17 00:00:00', NULL, 3, 'Spécialité', 'Les étudiants ont la possibilité de choisir, peut-être dans un autre établissement d''enseignement. Un élective liés à la durabilité.', 'L''organisation dispose d''un éventail de choix disponibles qui durabilité est un aspect important. - Les étudiants ont la possibilité d''obtenir un certificat spécial ou une mention sur le diplôme.', 'Les étudiants ont la possibilité d''être un spécialiste dans le domaine du développement durable de l''être.', 'En supposant une spécialisation, les étudiants ont la possibilité de suivre le développement durable joue un rôle important, et donc ne peut passer en tant que généraliste en matière de durabilité. Broad, cours interdisciplinaire.', 'Cette large, cours interdisciplinaire (inter) nationalement connu comme une formation de haut niveau.'),
(57, NULL, NULL, 17, 9, '2013-09-17 00:00:00', NULL, 3, 'Valeur la par le personnel', 'Les données sur le degré de satisfaction des employés en matière de durabilité au sein de l''organisation.', 'Les données de tendance sur cette évaluation sont disponibles. - Ces données sont analysées et documentées.', 'Ces données sur les tendances sont comparés avec les objectifs de la politique. - Les conclusions de cette comparaison sont utilisés pour déterminer la politique.', 'Ces données sur les tendances sont comparés à ceux d''autres organisations. - Les conclusions de cette comparaison sont utilisés pour déterminer la politique.', 'Ces données sur les tendances sont comparés avec ceux d''excellentes organisations à la maison et à l''étranger. - Les conclusions de cette comparaison sont utilisés pour déterminer la politique.'),
(58, NULL, NULL, 18, 9, '2013-09-17 00:00:00', NULL, 3, 'Élèves des clients', 'Il existe des données sur le degré de satisfaction des étudiants au sein de l''organisation.', 'Les données de tendance sur cette évaluation sont disponibles. - Ces données sont analysées et documentées.', 'Ces données sur les tendances sont comparés avec les objectifs de la politique. - Les conclusions de cette comparaison sont utilisés pour déterminer la politique.', 'Ces données sur les tendances sont comparés à ceux d''autres organisations. - Les conclusions de cette comparaison sont utilisés pour déterminer la politique.', 'Ces données sur les tendances sont comparés avec ceux d''excellentes organisations à la maison et à l''étranger. - Les conclusions de cette comparaison sont utilisés pour déterminer la politique.'),
(59, NULL, NULL, 19, 9, '2013-09-17 00:00:00', NULL, 3, 'Valeur la par des professionnels', 'Il existe des données sur le degré d''appréciation de la durabilité au sein de l''organisation.', 'Les données de tendance sur cette évaluation sont disponibles. - Ces données sont analysées et documentées.', 'Ces données sur les tendances sont comparés avec les objectifs de la politique. - Les conclusions de cette comparaison sont utilisés pour déterminer la politique.', 'Ces données sur les tendances sont comparés à ceux d''autres organisations. - Les conclusions de cette comparaison sont utilisés pour déterminer la politique.', 'Ces données sur les tendances sont comparés avec ceux d''excellentes organisations à la maison et à l''étranger. - Les conclusions de cette comparaison sont utilisés pour déterminer la politique.'),
(60, NULL, NULL, 20, 9, '2013-09-17 00:00:00', NULL, 3, 'Valeur la de la société', 'Il existe des données sur le degré de satisfaction des organisations de la société civile sur la viabilité de l''organisation.', 'Les données de tendance sur cette évaluation sont disponibles. - Ces données sont analysées et documentées.', 'Ces données sur les tendances sont comparés avec les objectifs de la politique. - Les conclusions de cette comparaison sont utilisés pour déterminer la politique.', 'Ces données sur les tendances sont comparés à ceux d''autres organisations. - Les conclusions de cette comparaison sont utilisés pour déterminer la politique.', 'Ces données sur les tendances sont comparés avec ceux d''excellentes organisations à la maison et à l''étranger. - Les conclusions de cette comparaison sont utilisés pour déterminer la politique.');

-- --------------------------------------------------------

--
-- Table structure for table `criterion_translation`
--

CREATE TABLE IF NOT EXISTS `criterion_translation` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `criterion_id` smallint(6) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `lang` smallint(6) NOT NULL,
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7FACE5E1DE12AB56` (`created_by`),
  KEY `IDX_7FACE5E125F94802` (`modified_by`),
  KEY `IDX_7FACE5E197766307` (`criterion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `criterion_translation`
--

INSERT INTO `criterion_translation` (`id`, `created_by`, `modified_by`, `criterion_id`, `status`, `created_at`, `modified_at`, `lang`, `value`) VALUES
(1, 1, NULL, 1, 9, '2013-09-01 00:00:00', NULL, 1, 'Vision and policy'),
(2, 1, NULL, 2, 9, '2013-09-01 00:00:00', NULL, 1, 'Expertise'),
(3, 1, NULL, 3, 9, '2013-09-01 00:00:00', NULL, 1, 'Education goals'),
(4, 1, NULL, 4, 9, '2013-09-01 00:00:00', NULL, 1, 'Education contents'),
(5, 1, NULL, 5, 9, '2013-09-01 00:00:00', NULL, 1, 'Result assessment'),
(6, 1, NULL, 1, 9, '2013-09-01 00:00:00', NULL, 2, 'Visie en beleid'),
(7, 1, NULL, 2, 9, '2013-09-01 00:00:00', NULL, 2, 'Expertise'),
(8, 1, NULL, 3, 9, '2013-09-01 00:00:00', NULL, 2, 'Onderwijs doelen'),
(9, 1, NULL, 4, 9, '2013-09-01 00:00:00', NULL, 2, 'Onderwijsinhoud'),
(10, 1, NULL, 5, 9, '2013-09-01 00:00:00', NULL, 2, 'Resultaatmeting'),
(11, NULL, NULL, 1, 9, '2013-09-17 00:00:00', NULL, 3, 'Vision et stratégie'),
(12, NULL, NULL, 2, 9, '2013-09-17 00:00:00', NULL, 3, 'Compétence'),
(13, NULL, NULL, 3, 9, '2013-09-17 00:00:00', NULL, 3, 'Objectifs de l''éducation'),
(14, NULL, NULL, 4, 9, '2013-09-17 00:00:00', NULL, 3, 'Contenu pédagogique'),
(15, NULL, NULL, 5, 9, '2013-09-17 00:00:00', NULL, 3, 'Mesure des résultats');

-- --------------------------------------------------------

--
-- Table structure for table `fos_group`
--

CREATE TABLE IF NOT EXISTS `fos_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4B019DDB5E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `fos_group`
--

INSERT INTO `fos_group` (`id`, `name`, `roles`) VALUES
(1, 'DEVART', 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}'),
(2, 'ADMIN', 'a:1:{i:0;s:10:"ROLE_ADMIN";}'),
(3, 'AUDITOR', 'a:1:{i:0;s:12:"ROLE_AUDITOR";}'),
(4, 'USER', 'a:1:{i:0;s:9:"ROLE_USER";}');

-- --------------------------------------------------------

--
-- Table structure for table `fos_user`
--

CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution_id` smallint(6) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `request_auditor` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  KEY `IDX_957A647910405986` (`institution_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `fos_user`
--

INSERT INTO `fos_user` (`id`, `institution_id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `request_auditor`) VALUES
(1, 1, 'devart', 'devart', 'roy@devart.be', 'roy@devart.be', 1, 't8av8kcoha80c084scwgwwco0cowg0g', 'bvN3MwEW1XCy0YZzswjLd9rX4BD+kXCiA/2707wFkRLedxWapJ5i5chpz+La1Pmgu+8S6VpynT5TxsFnoMj41Q==', '2014-05-06 09:42:20', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 0),
(2, 1, 'admin', 'admin', 'admin@devart.be', 'admin@devart.be', 1, 'erux7627lvk04gwgo04w0s4wcs4kkck', 'SSxHtBKXe2RFs10r/WynpUgdKixTB2FkC44rvljUmFeSust7Qjzp9RDN29/nHcLKyCbknN0VuRa/bobFRZI73w==', '2014-10-04 19:43:54', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 0),
(3, 2, 'auditor', 'auditor', 'auditor@devart.be', 'auditor@devart.be', 1, 'qwy01tbzdb4gkwo48gws0co4kssccg4', 'pGKcO9WIpmKbN+4SV/ZETGSgLni7B5kLE2vjlKvN1QvsYyPbabl1owqCVYonQaxR63nHku+Z02ukwRRtkAwjMw==', '2014-12-23 16:35:48', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 0),
(4, 2, 'user', 'user', 'user@devart.be', 'user@devart.be', 1, 'pyrfx6aukwgckksosoc8o84c0c0o8gw', '7XM+dVtRPepyEm3BljggyVx5ZSfDlQPtgJ0zue5kWLWappuTAU4xbKDwkS6VF7CnP28LNBH/P95PArmlap2DEw==', '2014-12-03 10:07:34', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fos_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_583D1F3EA76ED395` (`user_id`),
  KEY `IDX_583D1F3EFE54D947` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fos_user_group`
--

INSERT INTO `fos_user_group` (`user_id`, `group_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `fos_user_institution`
--

CREATE TABLE IF NOT EXISTS `fos_user_institution` (
  `user_id` int(11) NOT NULL,
  `institution_id` smallint(6) NOT NULL,
  PRIMARY KEY (`user_id`,`institution_id`),
  KEY `IDX_5CA566E4A76ED395` (`user_id`),
  KEY `IDX_5CA566E410405986` (`institution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fos_user_institution`
--

INSERT INTO `fos_user_institution` (`user_id`, `institution_id`) VALUES
(1, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `fos_user_report`
--

CREATE TABLE IF NOT EXISTS `fos_user_report` (
  `user_id` smallint(6) NOT NULL,
  `report_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`report_id`),
  KEY `IDX_EE75A14BA76ED395` (`user_id`),
  KEY `IDX_EE75A14B4BD2A4C0` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fos_user_report`
--

INSERT INTO `fos_user_report` (`user_id`, `report_id`) VALUES
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `institution`
--

CREATE TABLE IF NOT EXISTS `institution` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3A9F98E5DE12AB56` (`created_by`),
  KEY `IDX_3A9F98E525F94802` (`modified_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `institution`
--

INSERT INTO `institution` (`id`, `created_by`, `modified_by`, `status`, `created_at`, `modified_at`, `name`) VALUES
(1, 1, NULL, 8, '2013-09-01 00:00:00', NULL, 'ADMIN'),
(2, 1, 3, 0, '2013-09-20 00:00:00', '2014-07-09 16:04:25', 'Wageningen University'),
(3, 3, NULL, 9, '2013-09-29 00:00:00', NULL, 'University of Ouagadougou, Burkina Faso'),
(4, 3, NULL, 9, '2014-07-09 16:04:40', NULL, 'Wageningen University'),
(5, 3, NULL, 9, '2014-07-17 12:54:14', NULL, 'University of Abomey-Calavi, Republic of Benin'),
(6, 3, NULL, 9, '2014-07-17 12:54:48', NULL, 'Polytechnic University of Bobo Dioulasso, Burkina Faso'),
(7, 3, NULL, 9, '2014-07-17 12:55:20', NULL, 'University of the South Pacific, Fiji'),
(8, 3, NULL, 9, '2014-07-17 12:55:38', NULL, 'Kenyatta University, Kenya'),
(9, 3, NULL, 9, '2014-07-17 12:56:06', NULL, 'University of Maradi, Niger'),
(10, 3, NULL, 9, '2014-07-17 12:56:22', NULL, 'Abdou Moumouni University, Niamey, Niger'),
(11, 3, NULL, 9, '2014-07-17 12:56:46', NULL, 'Thiès University, Senegal'),
(12, 3, NULL, 9, '2014-07-17 12:57:07', NULL, 'Sokoine University, Tanzania'),
(13, 3, NULL, 9, '2014-07-17 12:57:24', NULL, 'University of the West Indies, St Augustine, Trinidad and Tobago'),
(14, 3, NULL, 9, '2014-07-20 15:18:25', NULL, 'Makerere University, Uganda'),
(15, 3, NULL, 9, '2014-07-20 15:18:25', NULL, 'University of Namibia, Namibia'),
(16, 3, NULL, 9, '2014-07-20 15:46:04', NULL, 'University of Antananarivo, Madagascar'),
(17, 3, 3, 0, '2014-10-05 20:08:37', '2014-10-07 22:04:17', 'Anton de Kom Universiteit 2014'),
(18, 3, 3, 0, '2014-10-05 20:08:43', '2014-10-05 20:09:03', 'adekus'),
(19, 3, NULL, 9, '2014-10-05 20:09:10', NULL, 'Anton De Kom University of Suriname'),
(20, 3, NULL, 9, '2014-10-06 13:14:51', NULL, 'Test Institution Suriname Workshop');

-- --------------------------------------------------------

--
-- Table structure for table `offline_tool`
--

CREATE TABLE IF NOT EXISTS `offline_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `FileName` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `FileToken` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `latestVersion` tinyint(1) NOT NULL,
  `outdated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_83CC4FCDE12AB56` (`created_by`),
  KEY `IDX_83CC4FC25F94802` (`modified_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `offline_tool`
--

INSERT INTO `offline_tool` (`id`, `created_by`, `modified_by`, `status`, `created_at`, `modified_at`, `FileName`, `FileToken`, `latestVersion`, `outdated`) VALUES
(1, 2, 2, 9, '2014-01-06 09:29:37', '2014-01-06 09:29:37', 'Aifshe Offline Tool', '52ca69713f9fa_06_01_2014_09_29', 1, 0),
(2, 2, 2, 9, '2014-01-06 09:30:19', '2014-01-06 09:30:19', 'Aifshe Offline Tool', '52ca699b9cdb5_06_01_2014_09_30', 1, 0),
(3, 2, 2, 9, '2014-01-06 09:43:27', '2014-01-06 09:43:27', 'Aifshe Offline Tool', '52ca6cafe6dde_06_01_2014_09_43', 1, 0),
(4, 2, 2, 9, '2014-01-06 09:45:01', '2014-01-06 09:45:01', 'Aifshe Offline Tool', '52ca6d0d0ea4b_06_01_2014_09_45', 1, 0),
(5, 2, 2, 9, '2014-01-06 11:09:54', '2014-01-06 11:09:54', 'Aifshe Offline Tool', '52ca80f227343_06_01_2014_11_09', 1, 0),
(6, 2, 2, 9, '2014-01-06 11:25:10', '2014-01-06 11:25:10', 'Aifshe Offline Tool', '52ca84868505b_06_01_2014_11_25', 1, 0),
(7, 2, 2, 9, '2014-01-06 11:36:01', '2014-01-06 11:36:01', 'Aifshe Offline Tool', '52ca871129915_06_01_2014_11_36', 1, 0),
(8, 2, 2, 9, '2014-01-06 11:45:44', '2014-01-06 11:45:44', 'Aifshe Offline Tool', '52ca8958b43f9_06_01_2014_11_45', 1, 0),
(9, 2, 2, 9, '2014-01-06 11:46:56', '2014-01-06 11:46:56', 'Aifshe Offline Tool', '52ca89a02df06_06_01_2014_11_46', 1, 0),
(10, 2, 2, 9, '2014-07-15 16:22:23', '2014-07-15 16:22:23', 'Aifshe Offline Tool', '53c5391fa6f48_15_07_2014_16_22', 1, 0),
(11, 2, 2, 9, '2014-07-15 17:38:09', '2014-07-15 17:38:09', 'Aifshe Offline Tool.zip', '53c54ae197dc7_15_07_2014_17_38', 1, 0),
(12, 2, 2, 9, '2014-08-18 15:22:32', '2014-08-18 15:22:32', 'Aifshe Offline Tool', '53f1fe18c86ab_18_08_2014_15_22', 1, 0),
(13, 2, 2, 9, '2014-08-18 15:36:49', '2014-08-18 15:36:49', 'Aifshe Offline Tool', '53f20171a0801_18_08_2014_15_36', 1, 0),
(14, 2, 2, 9, '2014-09-03 12:32:58', '2014-09-03 12:32:58', 'Aifshe Offline Tool', '5406ee5a32185_03_09_2014_12_32', 1, 0),
(15, 2, 2, 9, '2014-09-03 12:41:04', '2014-09-03 12:41:04', 'Aifshe Offline Tool', '5406f040d6b3b_03_09_2014_12_41', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `identifier` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `javascript` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_140AB620DE12AB56` (`created_by`),
  KEY `IDX_140AB62025F94802` (`modified_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `created_by`, `modified_by`, `status`, `created_at`, `modified_at`, `identifier`, `javascript`) VALUES
(1, 1, NULL, 9, '2013-09-01 00:00:00', NULL, 'info', ''),
(2, 1, NULL, 9, '2013-09-01 00:00:00', NULL, 'help', '$( document ).ready(function() { $( "#accordion" ).accordion(); });'),
(3, 1, NULL, 9, '2013-09-01 00:00:00', NULL, 'report_info', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_translation`
--

CREATE TABLE IF NOT EXISTS `page_translation` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `page_id` smallint(6) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `lang` smallint(6) NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A3D51B1DDE12AB56` (`created_by`),
  KEY `IDX_A3D51B1D25F94802` (`modified_by`),
  KEY `IDX_A3D51B1DC4663E4` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `page_translation`
--

INSERT INTO `page_translation` (`id`, `created_by`, `modified_by`, `page_id`, `status`, `created_at`, `modified_at`, `lang`, `value`) VALUES
(1, 1, NULL, 1, 9, '2013-09-01 00:00:00', NULL, 1, '<h1>More information</h1>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus erat nunc, scelerisque non ultricies in, semper vel mi. Fusce vel nunc id leo dignissim mollis in non dui. Vestibulum mattis lorem nisi. Nam auctor, leo id laoreet mattis, est leo ultrices nisi, at bibendum lectus dolor nec tortor. Pellentesque a congue felis, at volutpat lectus. Morbi eu eleifend orci. Curabitur at luctus metus, nec condimentum augue. Duis mattis dolor orci, sed vehicula enim suscipit vitae.</p>\r\n<p>Aliquam nec risus scelerisque, bibendum mauris ac, ornare est. Praesent leo turpis, bibendum vitae vestibulum nec, venenatis at justo. Phasellus ac tincidunt leo. Ut pretium ultricies nunc, eget scelerisque tortor vehicula in. Proin id tincidunt sem. Morbi molestie libero ut luctus scelerisque. Aliquam aliquam posuere est non gravida. Aenean eleifend diam luctus dapibus posuere. Curabitur fringilla congue diam, et egestas lectus venenatis nec. Etiam fermentum aliquet nisl, vitae sodales enim accumsan nec. Duis ac dignissim massa. Morbi nibh metus, aliquam sit amet turpis id, fringilla molestie lectus. Sed eleifend, risus quis dictum porttitor, felis ante fermentum urna, at rhoncus lorem nisl vitae purus. Nullam sed velit commodo, hendrerit nulla a, cursus nunc. Donec vel lacus sapien. Aliquam ut posuere tellus, ut aliquam velit.</p>'),
(2, 1, NULL, 2, 9, '2013-09-01 00:00:00', NULL, 1, '<h1>Help</h1>\r\n    <div id="accordion" class="ui-accordion ui-widget ui-helper-reset" role="tablist">\r\n        <h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-accordion-header-active ui-state-active ui-corner-top ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-0" aria-controls="ui-accordion-accordion-panel-0" aria-selected="true" tabindex="0"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>1. Lorem ipsum dolor sit amet?</h3>\r\n        <p class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active" id="ui-accordion-accordion-panel-0" aria-labelledby="ui-accordion-accordion-header-0" role="tabpanel" style="display: block; height: 84px;" aria-expanded="true" aria-hidden="false">\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus erat nunc, scelerisque non ultricies in, semper vel mi.\r\n            Fusce vel nunc id leo dignissim mollis in non dui. Vestibulum mattis lorem nisi. Nam auctor, leo id laoreet mattis, est\r\n            leo ultrices nisi, at bibendum lectus dolor nec tortor. Pellentesque a congue felis, at volutpat lectus. Morbi eu\r\n            eleifend orci. Curabitur at luctus metus, nec condimentum augue. Duis mattis dolor orci, sed vehicula enim suscipit\r\n            vitae.\r\n        </p>\r\n\r\n        <h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-1" aria-controls="ui-accordion-accordion-panel-1" aria-selected="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>2. Consectetur adipiscing elit?</h3>\r\n        <p class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-1" aria-labelledby="ui-accordion-accordion-header-1" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 84px;">\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus erat nunc, scelerisque non ultricies in, semper vel mi.\r\n            Fusce vel nunc id leo dignissim mollis in non dui. Vestibulum mattis lorem nisi. Nam auctor, leo id laoreet mattis, est\r\n            leo ultrices nisi, at bibendum lectus dolor nec tortor. Pellentesque a congue felis, at volutpat lectus. Morbi eu\r\n            eleifend orci. Curabitur at luctus metus, nec condimentum augue. Duis mattis dolor orci, sed vehicula enim suscipit\r\n            vitae.\r\n        </p>\r\n        <h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-2" aria-controls="ui-accordion-accordion-panel-2" aria-selected="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>3. Phasellus erat nunc?</h3>\r\n        <p class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-2" aria-labelledby="ui-accordion-accordion-header-2" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 84px;">\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus erat nunc, scelerisque non ultricies in, semper vel mi.\r\n            Fusce vel nunc id leo dignissim mollis in non dui. Vestibulum mattis lorem nisi. Nam auctor, leo id laoreet mattis, est\r\n            leo ultrices nisi, at bibendum lectus dolor nec tortor. Pellentesque a congue felis, at volutpat lectus. Morbi eu\r\n            eleifend orci. Curabitur at luctus metus, nec condimentum augue. Duis mattis dolor orci, sed vehicula enim suscipit\r\n            vitae.\r\n        </p>\r\n        <h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-3" aria-controls="ui-accordion-accordion-panel-3" aria-selected="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>4. Semper vel mi?</h3>\r\n        <p class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-3" aria-labelledby="ui-accordion-accordion-header-3" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 84px;">\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus erat nunc, scelerisque non ultricies in, semper vel mi.\r\n            Fusce vel nunc id leo dignissim mollis in non dui. Vestibulum mattis lorem nisi. Nam auctor, leo id laoreet mattis, est\r\n            leo ultrices nisi, at bibendum lectus dolor nec tortor. Pellentesque a congue felis, at volutpat lectus. Morbi eu\r\n            eleifend orci. Curabitur at luctus metus, nec condimentum augue. Duis mattis dolor orci, sed vehicula enim suscipit\r\n            vitae.\r\n        </p>\r\n        <h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-4" aria-controls="ui-accordion-accordion-panel-4" aria-selected="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>5. Vestibulum mattis lorem?</h3>\r\n        <p class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-4" aria-labelledby="ui-accordion-accordion-header-4" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 84px;">\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus erat nunc, scelerisque non ultricies in, semper vel mi.\r\n            Fusce vel nunc id leo dignissim mollis in non dui. Vestibulum mattis lorem nisi. Nam auctor, leo id laoreet mattis, est\r\n            leo ultrices nisi, at bibendum lectus dolor nec tortor. Pellentesque a congue felis, at volutpat lectus. Morbi eu\r\n            eleifend orci. Curabitur at luctus metus, nec condimentum augue. Duis mattis dolor orci, sed vehicula enim suscipit\r\n            vitae.\r\n        </p>\r\n    </div>'),
(3, 1, NULL, 1, 9, '2013-09-01 00:00:00', NULL, 2, '<h1>Meer informatie111111</h1>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus erat nunc, scelerisque non ultricies in, semper vel mi. Fusce vel nunc id leo dignissim mollis in non dui. Vestibulum mattis lorem nisi. Nam auctor, leo id laoreet mattis, est leo ultrices nisi, at bibendum lectus dolor nec tortor. Pellentesque a congue felis, at volutpat lectus. Morbi eu eleifend orci. Curabitur at luctus metus, nec condimentum augue. Duis mattis dolor orci, sed vehicula enim suscipit vitae.</p>\r\n<p>Aliquam nec risus scelerisque, bibendum mauris ac, ornare est. Praesent leo turpis, bibendum vitae vestibulum nec, venenatis at justo. Phasellus ac tincidunt leo. Ut pretium ultricies nunc, eget scelerisque tortor vehicula in. Proin id tincidunt sem. Morbi molestie libero ut luctus scelerisque. Aliquam aliquam posuere est non gravida. Aenean eleifend diam luctus dapibus posuere. Curabitur fringilla congue diam, et egestas lectus venenatis nec. Etiam fermentum aliquet nisl, vitae sodales enim accumsan nec. Duis ac dignissim massa. Morbi nibh metus, aliquam sit amet turpis id, fringilla molestie lectus. Sed eleifend, risus quis dictum porttitor, felis ante fermentum urna, at rhoncus lorem nisl vitae purus. Nullam sed velit commodo, hendrerit nulla a, cursus nunc. Donec vel lacus sapien. Aliquam ut posuere tellus, ut aliquam velit.</p>'),
(4, 1, NULL, 2, 9, '2013-09-01 00:00:00', NULL, 2, '<h1>Help</h1>\r\n    <div id="accordion" class="ui-accordion ui-widget ui-helper-reset" role="tablist">\r\n        <h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-accordion-header-active ui-state-active ui-corner-top ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-0" aria-controls="ui-accordion-accordion-panel-0" aria-selected="true" tabindex="0"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>1. Lorem ipsum dolor sit amet?</h3>\r\n        <p class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active" id="ui-accordion-accordion-panel-0" aria-labelledby="ui-accordion-accordion-header-0" role="tabpanel" style="display: block; height: 84px;" aria-expanded="true" aria-hidden="false">\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus erat nunc, scelerisque non ultricies in, semper vel mi.\r\n            Fusce vel nunc id leo dignissim mollis in non dui. Vestibulum mattis lorem nisi. Nam auctor, leo id laoreet mattis, est\r\n            leo ultrices nisi, at bibendum lectus dolor nec tortor. Pellentesque a congue felis, at volutpat lectus. Morbi eu\r\n            eleifend orci. Curabitur at luctus metus, nec condimentum augue. Duis mattis dolor orci, sed vehicula enim suscipit\r\n            vitae.\r\n        </p>\r\n\r\n        <h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-1" aria-controls="ui-accordion-accordion-panel-1" aria-selected="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>2. Consectetur adipiscing elit?</h3>\r\n        <p class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-1" aria-labelledby="ui-accordion-accordion-header-1" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 84px;">\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus erat nunc, scelerisque non ultricies in, semper vel mi.\r\n            Fusce vel nunc id leo dignissim mollis in non dui. Vestibulum mattis lorem nisi. Nam auctor, leo id laoreet mattis, est\r\n            leo ultrices nisi, at bibendum lectus dolor nec tortor. Pellentesque a congue felis, at volutpat lectus. Morbi eu\r\n            eleifend orci. Curabitur at luctus metus, nec condimentum augue. Duis mattis dolor orci, sed vehicula enim suscipit\r\n            vitae.\r\n        </p>\r\n        <h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-2" aria-controls="ui-accordion-accordion-panel-2" aria-selected="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>3. Phasellus erat nunc?</h3>\r\n        <p class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-2" aria-labelledby="ui-accordion-accordion-header-2" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 84px;">\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus erat nunc, scelerisque non ultricies in, semper vel mi.\r\n            Fusce vel nunc id leo dignissim mollis in non dui. Vestibulum mattis lorem nisi. Nam auctor, leo id laoreet mattis, est\r\n            leo ultrices nisi, at bibendum lectus dolor nec tortor. Pellentesque a congue felis, at volutpat lectus. Morbi eu\r\n            eleifend orci. Curabitur at luctus metus, nec condimentum augue. Duis mattis dolor orci, sed vehicula enim suscipit\r\n            vitae.\r\n        </p>\r\n        <h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-3" aria-controls="ui-accordion-accordion-panel-3" aria-selected="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>4. Semper vel mi?</h3>\r\n        <p class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-3" aria-labelledby="ui-accordion-accordion-header-3" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 84px;">\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus erat nunc, scelerisque non ultricies in, semper vel mi.\r\n            Fusce vel nunc id leo dignissim mollis in non dui. Vestibulum mattis lorem nisi. Nam auctor, leo id laoreet mattis, est\r\n            leo ultrices nisi, at bibendum lectus dolor nec tortor. Pellentesque a congue felis, at volutpat lectus. Morbi eu\r\n            eleifend orci. Curabitur at luctus metus, nec condimentum augue. Duis mattis dolor orci, sed vehicula enim suscipit\r\n            vitae.\r\n        </p>\r\n        <h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-4" aria-controls="ui-accordion-accordion-panel-4" aria-selected="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>5. Vestibulum mattis lorem?</h3>\r\n        <p class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-4" aria-labelledby="ui-accordion-accordion-header-4" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 84px;">\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus erat nunc, scelerisque non ultricies in, semper vel mi.\r\n            Fusce vel nunc id leo dignissim mollis in non dui. Vestibulum mattis lorem nisi. Nam auctor, leo id laoreet mattis, est\r\n            leo ultrices nisi, at bibendum lectus dolor nec tortor. Pellentesque a congue felis, at volutpat lectus. Morbi eu\r\n            eleifend orci. Curabitur at luctus metus, nec condimentum augue. Duis mattis dolor orci, sed vehicula enim suscipit\r\n            vitae.\r\n        </p>\r\n    </div>'),
(5, 1, NULL, 3, 9, '2013-09-01 00:00:00', NULL, 1, 'The five stages of AISHE are:\r\n<ul>\r\n       <li>Stage 1:  Activity oriented</li>\r\n       <li>Stage 2:  Process oriented</li>\r\n       <li>Stage 3:  System oriented</li>\r\n       <li>Stage 4:  Chain oriented</li>\r\n       <li>Stage 5:  Society oriented</li>\r\n</ul>\r\nFor more information: see the website  www.dho.nl  or mail to Niko Roorda,  nroorda@planet.nl .'),
(6, 1, NULL, 3, 9, '2013-09-01 00:00:00', NULL, 2, 'De vijf fasen van AISHE zijn:\r\n<ul>\r\n       <li>Fase 1:  Activiteiten georiënteerd</li>\r\n       <li>Fase 2:  Proces georiënteerd</li>\r\n       <li>Fase 3:  Systeem georiënteerd</li>\r\n       <li>Fase 4:  Keten georiënteerd</li>\r\n       <li>Fase 5:  Maatschappij georiënteerd</li>\r\n</ul>\r\nVoor meer informatie: zie de website  www.dho.nl  of stuur een e-mail naar Niko Roorda,  nroorda@planet.nl .');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE IF NOT EXISTS `report` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `institution_id` smallint(6) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coordinator` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nr_of_participants` smallint(6) DEFAULT NULL,
  `secretary` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_assessment` date NOT NULL,
  `date_latest_assessment` date DEFAULT NULL,
  `date_desired_situation` date DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `is_official` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C42F7784DE12AB56` (`created_by`),
  KEY `IDX_C42F778425F94802` (`modified_by`),
  KEY `IDX_C42F778410405986` (`institution_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `created_by`, `modified_by`, `institution_id`, `status`, `created_at`, `modified_at`, `name`, `department`, `coordinator`, `nr_of_participants`, `secretary`, `date_assessment`, `date_latest_assessment`, `date_desired_situation`, `comment`, `is_official`) VALUES
(1, 3, 3, 2, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', 'Hogeschool XX', 'Opleiding "X"', NULL, 0, 'Niko Roorda', '2001-10-22', NULL, '2003-01-01', NULL, 1),
(2, 3, 3, 2, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', 'Hogeschool XXX', 'Opleiding "X"', NULL, 0, 'Niko Roorda', '2001-10-22', NULL, '2003-01-01', NULL, 1),
(3, 3, 3, 2, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', 'Hogeschool X', 'Opleiding "X"', NULL, 0, 'Niko Roorda', '2001-10-22', NULL, '2003-01-01', NULL, 1),
(4, 3, 3, 2, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', 'Hogeschool XXXX', 'Opleiding "X"', NULL, 0, 'Niko Roorda', '2001-10-22', NULL, '2003-01-01', NULL, 1),
(5, 3, 3, 2, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', 'Hogeschool XXXXX', 'Opleiding "X"', NULL, 0, 'Niko Roorda', '2001-10-22', NULL, '2003-01-01', NULL, 1),
(6, 3, 3, 13, 8, '2013-09-20 00:00:00', '2014-10-05 20:55:26', 'report UWI 2013', 'Faculty of Food & Agriculture', 'Dr. Patterson-Andrews/Prof. Rekhi', 16, 'Ms. Melony John', '2013-02-28', NULL, NULL, NULL, 1),
(7, 3, 3, 5, 8, '2013-09-20 00:00:00', '2014-07-17 13:04:07', 'report UAC 2013', 'EPAC-FAST-FSA', 'ACHIGAN-DAKO Enoch', 24, 'YETONGNON Imelda', '2013-04-23', NULL, NULL, NULL, 1),
(8, 4, 4, 2, 9, '2013-09-24 00:00:00', '2013-09-24 00:00:00', 'Niamey', 'Facult', 'Pr Balla Abdourahamane', 13, 'Oumarou Diadi', '2013-09-24', NULL, NULL, 'test', 0),
(9, 3, 3, 2, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', 'AIFSHE CTA', 'Wageningen', 'J. Francis', 16, '27-09-13', '2013-09-03', NULL, NULL, NULL, 1),
(10, 3, 3, 2, 0, '2013-09-27 00:00:00', '2013-09-27 00:00:00', 'SU', 'Human Nutrition', 'Milla', 5, '27 September', '2013-09-27', NULL, '2015-09-30', NULL, 1),
(11, 3, 3, 8, 8, '2013-09-27 00:00:00', '2014-07-20 15:48:24', 'Kenyatta University', 'Agribusiness Management and Trade', 'Newton Nyairo', 22, '5/2/2013', '2013-02-05', NULL, '2015-02-05', NULL, 1),
(12, 4, 4, 2, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', 'SOKOINE UNIVERSITY OF AGRICULTURE', 'FACULTY OF AGRICULTURE', 'ABEL KAAYA', 13, '27 SEPTEMBER 2013', '2013-02-07', '2013-02-08', '2013-12-31', NULL, 0),
(13, 3, 3, 2, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', 'BJ-BF-ECOWAS sept2013', NULL, NULL, 5, NULL, '2013-09-27', NULL, NULL, 'Trial working group session', 1),
(14, 3, 3, 11, 8, '2013-09-27 00:00:00', '2014-07-17 13:01:27', 'Audit Universite de Thies', 'Ecole Nationale Supérieure d''Agriculture (ENSA)', 'Tala Gueye', 17, '17 avril 2013', '2003-04-01', NULL, NULL, 'Atelier avec le pole agronomique de l''Université de Thiès avec la présence des autorité sous la coordination de Olivier Bello; expert du CTA', 1),
(15, 3, 3, 10, 8, '2013-09-27 00:00:00', '2014-10-06 13:12:41', 'aishe/fa/uam/', 'CRESA', 'Balla', 13, '19/04/13', '2013-04-19', NULL, '2016-04-19', NULL, 1),
(16, 3, 3, 7, 8, '2013-09-27 00:00:00', '2014-07-17 13:02:15', 'The University of the South Pacific', NULL, 'Dr Jimaima Lako and Dr David Rohindra', 20, '12/03/13', '2013-03-12', NULL, '2016-03-12', 'The audit was conducted at the University of the South Pacific, Laucala campus in Fiji whereby 15 participants took part and teleconferenced with 5 participants at the Agricultural school in Alafua campus, Samoa. Prof. Arjen Wals from WUR-ECS facilitated the the audit.', 1),
(17, 3, 3, 2, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:16', 'AIFSHE Report', 'Faculty of Food and Agriculture', 'Hazel Patterson-Andrews', 26, '28th February 2012', '2013-02-28', NULL, '2015-02-28', 'This audit was designed to show the current position, with respect to Food Security, of the Faculty of Food and Agriculture at the University of the West Indies', 1),
(18, 3, 3, 9, 8, '2013-09-27 00:00:00', '2014-10-06 13:12:12', 'AIFSHE FASE MARADI', 'Faculté d''Agronomie et des Sciences de l''Environnement (FASE)', 'Dr Mahamadou ELHADJI GOUNGA', 22, '24 August 2013', '2013-04-18', '2013-08-24', '2016-08-23', 'L''audit initialement fait à Niamey a été repris à Maradi en impliquant la majorité des membres des composantes universitaires. Le recteur était présent, le Vice recteur Pi, le Doyen de la FASE et le Doyen Pi de FST. Le SG, LA SP et le Chef service scolarité étaient également présents. Plusieurs chefs de département, leurs adjoint, quelques enseignants chercheurs et des étudiants étaient au RDV.', 1),
(19, 3, 3, 13, 0, '2013-09-27 00:00:00', '2014-07-20 06:44:24', 'uwi', 'Faculty of Food and Agriculture', 'Hazel Andrews', 16, NULL, '2013-09-01', NULL, '2015-05-04', 'Mcgill University assesusing Tool sment', 1),
(20, 3, 3, 2, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:05', 'uwi', 'Faculty of Food and Agriculture', 'Hazel Andrews', 16, NULL, '2013-09-01', NULL, '2015-05-04', 'Mcgill University assesusing Tool sment', 1),
(21, 3, 3, 3, 8, '2013-09-29 00:00:00', '2014-07-17 13:00:30', 'Audit University of Ouagadougou', 'Biochemistry and Microbiology', 'Pr Mamoudou H. DICKO, PhD', 16, '26 April 2013', '2013-05-26', NULL, '2014-06-30', 'Université	Ouagadougou\r\nDépartement	UFR/SVT, Département de Biochimie/Microbiologie\r\nAuditeur	BELLO Olivier\r\nCoordinateur interne	DICKO Mamoudou Hama\r\nNombre de participants	16\r\nSecrétaire	DIBALA I. Crépin\r\nDate évaluation	26 avril 2013\r\nDate dernière évaluation	Néant\r\nDate situation désirée	Juin 2014', 1),
(22, 3, 3, 6, 8, '2013-10-28 00:00:00', '2014-07-17 12:59:48', 'Universite Polytechnique de Bobo-Dioulasso, Burkina Faso', 'Institut du Developpement Rural', 'Salimata SONDE POUSGA', 13, 'M.  Dao Begue', '2013-04-26', NULL, '2016-04-26', 'Rapport d''audit sur l''implication du theme sécurité alimentaire dans la formation des ingénieurs du développement rural, option agronomie et élevage, à l’université Polytechnique de Bobo-Dioulasso, Burkina Faso.', 1),
(23, 3, 3, NULL, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', 'offline test report:2014-01-06', 'DEVart', 'Dndy', 4, 'Piet', '2014-01-06', NULL, NULL, '', 1),
(24, 3, 3, 1, 0, '2014-01-06 11:38:00', '2014-01-06 11:41:07', 'Report:2014-01-06', 'Devart', 'Piet', 5, 'Bart', '2014-01-06', NULL, NULL, 'Dit is een rapport', 1),
(25, 3, 3, NULL, 0, '2014-01-06 11:40:45', '2014-01-06 11:41:01', 'Report:2014-01-06', 'Devart', 'Piet', 5, 'Bart', '2014-01-06', NULL, NULL, 'Dit is een rapport', 1),
(26, 3, 2, NULL, 9, '2014-01-06 11:41:32', '2014-08-08 14:07:59', 'offline test report:2014-01-06', 'DEVart', 'Dndy', 4, 'Piet', '2014-01-06', NULL, NULL, '', 1),
(27, 3, 3, NULL, 0, '2014-01-06 11:49:28', '2014-07-20 06:43:23', 'Report:2014-01-06', 'Devart', 'Piet', 5, 'Bart', '2014-01-06', NULL, NULL, 'Dit is een rapport', 1),
(28, 3, 3, NULL, 0, '2014-01-06 11:49:47', '2014-07-20 06:43:11', 'Report:2014-01-06', 'Devart', 'Piet', 5, 'Bart', '2014-01-06', NULL, NULL, 'Dit is een rapport', 1),
(29, 3, 3, NULL, 0, '2014-01-06 11:50:33', '2014-07-20 06:43:00', 'Report:2014-01-06', 'Devart', 'Piet', 5, 'Bart', '2014-01-06', NULL, NULL, 'Dit is een rapport', 1),
(30, 3, 3, 4, 8, '2014-07-20 06:18:08', '2014-10-06 20:27:47', 'DEANS WORKSHOP_1', 'Agriculture', NULL, NULL, NULL, '2014-10-06', '2014-10-06', '2016-10-06', 'Test exercice for the groups on Sunday, the 20th', 1),
(31, 3, 3, 14, 9, '2014-07-20 15:25:57', '2014-10-06 20:22:09', 'Test_Dean workshop', 'Food Technology and Nutrition', 'Agnes Namutebi, Abel Atukwase', NULL, NULL, '2014-07-20', NULL, '2015-07-20', 'Initial trial of an audit case study for Makerere University with respect to food and nutrition security.', 1),
(32, 3, NULL, 10, 9, '2014-07-20 15:51:43', NULL, 'Test - draft report for Madagascar', 'Food Science and Technology', 'Fanjaniaina Fawbush-Razafimbelo', 15, 'Rina IAA', '2014-07-20', NULL, '2015-01-02', 'let''s start!!!', 1),
(33, 3, 3, 17, 0, '2014-10-05 20:11:12', '2014-10-07 13:11:49', 'AIFHSE 2014-10-05', NULL, NULL, NULL, NULL, '2014-10-05', '2014-10-05', '2015-10-05', NULL, 1),
(34, 3, 3, 17, 0, '2014-10-05 20:13:37', '2014-10-05 20:14:40', 'test', 'MERSD', 'F.ILahi', 1, 'foxtrot', '2014-10-05', '2000-10-01', '2020-01-01', 'twenty twenty vision', 1),
(35, 3, 3, 10, 0, '2014-10-05 20:20:07', '2014-10-07 13:11:19', 'dummy', 'CTA and S&T', 'JA Francis', 25, 'E Mulder', '2014-10-05', NULL, '2020-10-05', 'This is the begin', 1),
(36, 3, 3, 19, 9, '2014-10-07 14:01:33', '2014-10-08 14:29:02', 'Preliminary Audit Suriname', 'Department of Agriculture Production', 'Dr. lydia Ori', 6, 'Sandhya Maniram', '2014-10-07', NULL, '2016-10-07', 'Deze audit is een ondeel van het al gestarte proces naar een accreditatie. Met dit extra instrument AIFSHE willen we ten eerste een SWOT analysis doen van onze performances in Food Security binne onze programma''s.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_item`
--

CREATE TABLE IF NOT EXISTS `report_item` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `report_id` smallint(6) DEFAULT NULL,
  `criterion_item_id` smallint(6) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `current_situation_rating` decimal(10,1) DEFAULT NULL,
  `desired_situation_rating` decimal(10,1) DEFAULT NULL,
  `current_situation_comment` longtext COLLATE utf8_unicode_ci,
  `desired_situation_comment` longtext COLLATE utf8_unicode_ci,
  `has_high_priority` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6C37C8E5DE12AB56` (`created_by`),
  KEY `IDX_6C37C8E525F94802` (`modified_by`),
  KEY `IDX_6C37C8E54BD2A4C0` (`report_id`),
  KEY `IDX_6C37C8E531A5B285` (`criterion_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=439 ;

--
-- Dumping data for table `report_item`
--

INSERT INTO `report_item` (`id`, `created_by`, `modified_by`, `report_id`, `criterion_item_id`, `status`, `created_at`, `modified_at`, `current_situation_rating`, `desired_situation_rating`, `current_situation_comment`, `desired_situation_comment`, `has_high_priority`) VALUES
(1, 4, 3, 1, 1, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '2.0', '3.5', 'Het Handvest is ondertekend, voor de gehele Hogeschool.\n', 'Expliciete visie, vastleggen.\n', 0),
(2, 4, 3, 1, 2, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.0', '2.0', 'De visie is nog niet sterk uitgewerkt. Het begin is er.\n', 'Expliciete visie, vastleggen. Niet te hard willen lopen, dus nog niet vertalen in meetbare doelen.\n', 1),
(3, 4, 3, 1, 3, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.0', '2.0', '', 'Handvest bekender maken.\nHet AISHE-onderzoek draagt bij aan het opwekken van de discussies. Concrete doelen stellen over inpassen in onderwijs: project duurzaamheid formuleren, als item voor de projectleider curriculumontwikkeling.\n', 1),
(4, 4, 3, 1, 4, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '3.5', '2.0', 'Wetgeving voor chemicalien wordt uitgevoerd (door de practicumassistent). Afvalscheiding, milieumokken.\n', '', 0),
(5, 4, 3, 1, 5, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.0', '2.0', '', '', 0),
(6, 4, 3, 1, 6, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.0', '2.0', 'Enkele medewerkers doen wel eens iets aan duurzaamheid in curriculumontwikkeling. B.v. in het vak ethiek.\n', 'Om een expertisecentrum met veel meer diepgang te realiseren, moet er flink wat tijd beschikbaar gesteld worden.Ontwikkelingsplan om die expertise te verkrijgen.\n', 0),
(7, 4, 3, 1, 7, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.0', '3.0', 'Rond ketenbeheer is er vorig jaar gewerkt aan vergroting van kennis bij het personeel. Dat is beleid, maar nog incidenteel.\nEr zijn wel enkele medewerkers met redelijke of zelfs uitstekende kennis m.b.t. duurzaamheid, maar men weet dat te weinig van elkaar.\n', 'Systematiek in het scholingsbeleid m.b.t. duurzaamheid. Gebaseerd op duurzaamheidsvisie.\nAlle medewerkers zijn goed op de hoogte, binnen hun vakgebied. Geldt voor alle vakgebieden.\n', 1),
(8, 4, 3, 1, 8, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '0.0', '1.0', 'Er zijn geen commerciele projecten met duurzaamheid als element.\n', 'Voorlopig geen wens om dat te veranderen.\n', 0),
(9, 4, 3, 1, 9, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.0', '2.0', 'Er zit iets van milieu in de eindtermen, zoiets als "Zorgvuldig omgaan met..."\n', 'De huidige eindtermen gaan, in samenhang met curriculumontwikkeling, onderzocht worden en waar nodig bijgesteld m.b.t. duurzaamheid.\n', 0),
(10, 4, 3, 1, 10, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '2.0', '4.0', 'Het nieuwe curriculum is ontworpen t.b.v. zelfverantwoordelijk leren (fase 3): bijv. propedeuseprojecten. In de praktijk is dat nog niet overal gerealiseerd.Studenten maken deel uit van de onderwijscommissie.\n', 'Zichtbaar maken hoe eigen keuzen van studenten samenhangen met de beroepspraktijk. Verschillen in eindprofielen en in beginsituaties van individuele studenten moeten duidelijk worden. Methode: portfolio, coaching van individuele studenten. Plus: heel praktisch, bijv. roosterproblemen bij individuele leerroutes oplossen.\n', 1),
(11, 4, 3, 1, 11, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.0', '1.0', '', 'Afzonderlijke docenten doen dit wel. De organisatie bevordert dat niet sterk. De organisatie bevordert duurzaam gedrag. Waar mogelijk gaat elke docent dit doen. Men krijgt feedback, bijv. doordat duurzaamheid een gesprekspunt wordt van functioneringsgesprekken. Vier keer per jaar komt het als onderwerp in discussiegroepen.\n', 0),
(12, 4, 3, 1, 12, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.0', '2.0', 'Binnenkort komt de toetsing van de themaweken. Ook de globale LCA wordt getoetst.\n', 'Bij het formuleren van leerdoelen m.b.t. duurzaamheid wordt ook een toetsingssysteem ontworpen.\n', 0),
(13, 4, 3, 1, 13, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.5', '2.5', 'In het eerste jaar zit een module van 80 uur over basiskennis duurzaamheid ("themaweken duurzaamheid"), verplicht voor iedereen.\nVerderop in het curriculum zit milieuwetgeving; globale LCA; milieuzorgsystemen bij kwaliteitsmanagement; ketenbeheer bij een van de profielen.\n', 'De resultaten van de module zijn vervlochten in het verdere curriculum.\nVoor de rest: Onderzoek doen.\n', 0),
(14, 4, 3, 1, 14, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '2.0', '3.0', 'Propedeuseprojecten en 2e jaars projecten, 1 thema per periode, geintegreerde benadering.\n', 'Eerst verder perfectioneren.\n', 0),
(15, 4, 3, 1, 15, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.0', '2.0', 'Er zijn stage-opdrachten waar duurzaamheid in zit, bijv. milieuzorgsystemen. Nog weinig keten-onderwerpen.\n', 'Duurzaamheid inbrengen in een lijst van verplichte aandachtspunten bij stages enz.\n', 0),
(16, 4, 3, 1, 16, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.0', '3.0', 'Een dergelijk keuzevak is te kiezen.\n', 'Geen wens om zo''n specialiteit aan te bieden.\n', 0),
(17, 4, 3, 1, 17, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.0', '2.0', '', '', 0),
(18, 4, 3, 1, 18, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.0', '2.0', '', '', 0),
(19, 4, 3, 1, 19, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '1.0', '2.0', '', '', 0),
(20, 4, 3, 1, 20, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:37', '0.0', '1.0', '', '', 0),
(21, 4, 3, 2, 1, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.5', '3.0', 'Het Handvest is ondertekend, voor de gehele Hogeschool.', 'Expliciete visie, vastleggen.', 1),
(22, 4, 3, 2, 2, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '2.0', 'De visie is nog niet sterk uitgewerkt. Het begin is er.\n', 'Expliciete visie, vastleggen. Niet te hard willen lopen, dus nog niet vertalen in meetbare doelen.\n', 1),
(23, 4, 3, 2, 3, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '4.0', '', 'Handvest bekender maken.\nHet AISHE-onderzoek draagt bij aan het opwekken van de discussies. Concrete doelen stellen over inpassen in onderwijs: project duurzaamheid formuleren, als item voor de projectleider curriculumontwikkeling.\n', 1),
(24, 4, 3, 2, 4, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '2.0', 'Wetgeving voor chemicalien wordt uitgevoerd (door de practicumassistent). Afvalscheiding, milieumokken.\n', '', 0),
(25, 4, 3, 2, 5, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '2.0', '', '', 0),
(26, 4, 3, 2, 6, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '2.0', 'Enkele medewerkers doen wel eens iets aan duurzaamheid in curriculumontwikkeling. B.v. in het vak ethiek.\n', 'Om een expertisecentrum met veel meer diepgang te realiseren, moet er flink wat tijd beschikbaar gesteld worden.Ontwikkelingsplan om die expertise te verkrijgen.\n', 0),
(27, 4, 3, 2, 7, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '3.0', 'Rond ketenbeheer is er vorig jaar gewerkt aan vergroting van kennis bij het personeel. Dat is beleid, maar nog incidenteel.\nEr zijn wel enkele medewerkers met redelijke of zelfs uitstekende kennis m.b.t. duurzaamheid, maar men weet dat te weinig van elkaar.\n', 'Systematiek in het scholingsbeleid m.b.t. duurzaamheid. Gebaseerd op duurzaamheidsvisie.\nAlle medewerkers zijn goed op de hoogte, binnen hun vakgebied. Geldt voor alle vakgebieden.\n', 1),
(28, 4, 3, 2, 8, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.5', '3.0', 'Er zijn geen commerciele projecten met duurzaamheid als element.', 'Voorlopig geen wens om dat te veranderen.', 0),
(29, 4, 3, 2, 9, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '2.0', 'Er zit iets van milieu in de eindtermen, zoiets als "Zorgvuldig omgaan met..."\n', 'De huidige eindtermen gaan, in samenhang met curriculumontwikkeling, onderzocht worden en waar nodig bijgesteld m.b.t. duurzaamheid.\n', 0),
(30, 4, 3, 2, 10, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '2.0', '4.0', 'Het nieuwe curriculum is ontworpen t.b.v. zelfverantwoordelijk leren (fase 3): bijv. propedeuseprojecten. In de praktijk is dat nog niet overal gerealiseerd.Studenten maken deel uit van de onderwijscommissie.\n', 'Zichtbaar maken hoe eigen keuzen van studenten samenhangen met de beroepspraktijk. Verschillen in eindprofielen en in beginsituaties van individuele studenten moeten duidelijk worden. Methode: portfolio, coaching van individuele studenten. Plus: heel praktisch, bijv. roosterproblemen bij individuele leerroutes oplossen.\n', 1),
(31, 4, 3, 2, 11, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '1.0', '', 'Afzonderlijke docenten doen dit wel. De organisatie bevordert dat niet sterk. De organisatie bevordert duurzaam gedrag. Waar mogelijk gaat elke docent dit doen. Men krijgt feedback, bijv. doordat duurzaamheid een gesprekspunt wordt van functioneringsgesprekken. Vier keer per jaar komt het als onderwerp in discussiegroepen.\n', 0),
(32, 4, 3, 2, 12, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '2.0', 'Binnenkort komt de toetsing van de themaweken. Ook de globale LCA wordt getoetst.\n', 'Bij het formuleren van leerdoelen m.b.t. duurzaamheid wordt ook een toetsingssysteem ontworpen.\n', 0),
(33, 4, 3, 2, 13, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.5', '2.5', 'In het eerste jaar zit een module van 80 uur over basiskennis duurzaamheid ("themaweken duurzaamheid"), verplicht voor iedereen.\nVerderop in het curriculum zit milieuwetgeving; globale LCA; milieuzorgsystemen bij kwaliteitsmanagement; ketenbeheer bij een van de profielen.\n', 'De resultaten van de module zijn vervlochten in het verdere curriculum.\nVoor de rest: Onderzoek doen.\n', 0),
(34, 4, 3, 2, 14, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '2.0', '3.0', 'Propedeuseprojecten en 2e jaars projecten, 1 thema per periode, geintegreerde benadering.\n', 'Eerst verder perfectioneren.\n', 0),
(35, 4, 3, 2, 15, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '2.0', 'Er zijn stage-opdrachten waar duurzaamheid in zit, bijv. milieuzorgsystemen. Nog weinig keten-onderwerpen.\n', 'Duurzaamheid inbrengen in een lijst van verplichte aandachtspunten bij stages enz.\n', 0),
(36, 4, 3, 2, 16, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '1.0', 'Een dergelijk keuzevak is te kiezen.\n', 'Geen wens om zo''n specialiteit aan te bieden.\n', 0),
(37, 4, 3, 2, 17, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '2.0', '', '', 0),
(38, 4, 3, 2, 18, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '2.0', '', '', 0),
(39, 4, 3, 2, 19, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '1.0', '2.0', '', '', 0),
(40, 4, 3, 2, 20, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:28', '0.0', '1.0', '', '', 0),
(41, 4, 3, 3, 1, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '2.0', 'Het Handvest is ondertekend, voor de gehele Hogeschool.\n', 'Expliciete visie, vastleggen.\n', 1),
(42, 4, 3, 3, 2, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '2.0', 'De visie is nog niet sterk uitgewerkt. Het begin is er.\n', 'Expliciete visie, vastleggen. Niet te hard willen lopen, dus nog niet vertalen in meetbare doelen.\n', 1),
(43, 4, 3, 3, 3, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '1.0', '', 'Handvest bekender maken.\nHet AISHE-onderzoek draagt bij aan het opwekken van de discussies. Concrete doelen stellen over inpassen in onderwijs: project duurzaamheid formuleren, als item voor de projectleider curriculumontwikkeling.\n', 1),
(44, 4, 3, 3, 4, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '2.0', 'Wetgeving voor chemicalien wordt uitgevoerd (door de practicumassistent). Afvalscheiding, milieumokken.\n', '', 0),
(45, 4, 3, 3, 5, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '2.0', '', '', 0),
(46, 4, 3, 3, 6, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '2.0', 'Enkele medewerkers doen wel eens iets aan duurzaamheid in curriculumontwikkeling. B.v. in het vak ethiek.\n', 'Om een expertisecentrum met veel meer diepgang te realiseren, moet er flink wat tijd beschikbaar gesteld worden.Ontwikkelingsplan om die expertise te verkrijgen.\n', 0),
(47, 4, 3, 3, 7, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '3.0', 'Rond ketenbeheer is er vorig jaar gewerkt aan vergroting van kennis bij het personeel. Dat is beleid, maar nog incidenteel.\nEr zijn wel enkele medewerkers met redelijke of zelfs uitstekende kennis m.b.t. duurzaamheid, maar men weet dat te weinig van elkaar.\n', 'Systematiek in het scholingsbeleid m.b.t. duurzaamheid. Gebaseerd op duurzaamheidsvisie.\nAlle medewerkers zijn goed op de hoogte, binnen hun vakgebied. Geldt voor alle vakgebieden.\n', 1),
(48, 4, 3, 3, 8, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '0.0', '0.0', 'Er zijn geen commerciele projecten met duurzaamheid als element.\n', 'Voorlopig geen wens om dat te veranderen.\n', 0),
(49, 4, 3, 3, 9, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '2.0', 'Er zit iets van milieu in de eindtermen, zoiets als "Zorgvuldig omgaan met..."\n', 'De huidige eindtermen gaan, in samenhang met curriculumontwikkeling, onderzocht worden en waar nodig bijgesteld m.b.t. duurzaamheid.\n', 0),
(50, 4, 3, 3, 10, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '2.0', '4.0', 'Het nieuwe curriculum is ontworpen t.b.v. zelfverantwoordelijk leren (fase 3): bijv. propedeuseprojecten. In de praktijk is dat nog niet overal gerealiseerd.Studenten maken deel uit van de onderwijscommissie.\n', 'Zichtbaar maken hoe eigen keuzen van studenten samenhangen met de beroepspraktijk. Verschillen in eindprofielen en in beginsituaties van individuele studenten moeten duidelijk worden. Methode: portfolio, coaching van individuele studenten. Plus: heel praktisch, bijv. roosterproblemen bij individuele leerroutes oplossen.\n', 1),
(51, 4, 3, 3, 11, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '1.0', '', 'Afzonderlijke docenten doen dit wel. De organisatie bevordert dat niet sterk. De organisatie bevordert duurzaam gedrag. Waar mogelijk gaat elke docent dit doen. Men krijgt feedback, bijv. doordat duurzaamheid een gesprekspunt wordt van functioneringsgesprekken. Vier keer per jaar komt het als onderwerp in discussiegroepen.\n', 0),
(52, 4, 3, 3, 12, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '2.0', 'Binnenkort komt de toetsing van de themaweken. Ook de globale LCA wordt getoetst.\n', 'Bij het formuleren van leerdoelen m.b.t. duurzaamheid wordt ook een toetsingssysteem ontworpen.\n', 0),
(53, 4, 3, 3, 13, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.5', '2.5', 'In het eerste jaar zit een module van 80 uur over basiskennis duurzaamheid ("themaweken duurzaamheid"), verplicht voor iedereen.\nVerderop in het curriculum zit milieuwetgeving; globale LCA; milieuzorgsystemen bij kwaliteitsmanagement; ketenbeheer bij een van de profielen.\n', 'De resultaten van de module zijn vervlochten in het verdere curriculum.\nVoor de rest: Onderzoek doen.\n', 0),
(54, 4, 3, 3, 14, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '2.0', '3.0', 'Propedeuseprojecten en 2e jaars projecten, 1 thema per periode, geintegreerde benadering.\n', 'Eerst verder perfectioneren.\n', 0),
(55, 4, 3, 3, 15, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '2.0', 'Er zijn stage-opdrachten waar duurzaamheid in zit, bijv. milieuzorgsystemen. Nog weinig keten-onderwerpen.\n', 'Duurzaamheid inbrengen in een lijst van verplichte aandachtspunten bij stages enz.\n', 0),
(56, 4, 3, 3, 16, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '1.0', 'Een dergelijk keuzevak is te kiezen.\n', 'Geen wens om zo''n specialiteit aan te bieden.\n', 0),
(57, 4, 3, 3, 17, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '2.0', '', '', 0),
(58, 4, 3, 3, 18, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '2.0', '', '', 0),
(59, 4, 3, 3, 19, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '1.0', '2.0', '', '', 0),
(60, 4, 3, 3, 20, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:19', '0.0', '1.0', '', '', 0),
(61, 4, 3, 4, 1, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '2.0', 'Het Handvest is ondertekend, voor de gehele Hogeschool.\n', 'Expliciete visie, vastleggen.\n', 1),
(62, 4, 3, 4, 2, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '2.0', 'De visie is nog niet sterk uitgewerkt. Het begin is er.\n', 'Expliciete visie, vastleggen. Niet te hard willen lopen, dus nog niet vertalen in meetbare doelen.\n', 1),
(63, 4, 3, 4, 3, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '1.0', '', 'Handvest bekender maken.\nHet AISHE-onderzoek draagt bij aan het opwekken van de discussies. Concrete doelen stellen over inpassen in onderwijs: project duurzaamheid formuleren, als item voor de projectleider curriculumontwikkeling.\n', 1),
(64, 4, 3, 4, 4, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '2.0', 'Wetgeving voor chemicalien wordt uitgevoerd (door de practicumassistent). Afvalscheiding, milieumokken.\n', '', 0),
(65, 4, 3, 4, 5, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '2.0', '', '', 0),
(66, 4, 3, 4, 6, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '2.0', 'Enkele medewerkers doen wel eens iets aan duurzaamheid in curriculumontwikkeling. B.v. in het vak ethiek.\n', 'Om een expertisecentrum met veel meer diepgang te realiseren, moet er flink wat tijd beschikbaar gesteld worden.Ontwikkelingsplan om die expertise te verkrijgen.\n', 0),
(67, 4, 3, 4, 7, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '3.0', 'Rond ketenbeheer is er vorig jaar gewerkt aan vergroting van kennis bij het personeel. Dat is beleid, maar nog incidenteel.\nEr zijn wel enkele medewerkers met redelijke of zelfs uitstekende kennis m.b.t. duurzaamheid, maar men weet dat te weinig van elkaar.\n', 'Systematiek in het scholingsbeleid m.b.t. duurzaamheid. Gebaseerd op duurzaamheidsvisie.\nAlle medewerkers zijn goed op de hoogte, binnen hun vakgebied. Geldt voor alle vakgebieden.\n', 1),
(68, 4, 3, 4, 8, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '0.0', '0.0', 'Er zijn geen commerciele projecten met duurzaamheid als element.\n', 'Voorlopig geen wens om dat te veranderen.\n', 0),
(69, 4, 3, 4, 9, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '2.0', 'Er zit iets van milieu in de eindtermen, zoiets als "Zorgvuldig omgaan met..."\n', 'De huidige eindtermen gaan, in samenhang met curriculumontwikkeling, onderzocht worden en waar nodig bijgesteld m.b.t. duurzaamheid.\n', 0),
(70, 4, 3, 4, 10, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '2.0', '4.0', 'Het nieuwe curriculum is ontworpen t.b.v. zelfverantwoordelijk leren (fase 3): bijv. propedeuseprojecten. In de praktijk is dat nog niet overal gerealiseerd.Studenten maken deel uit van de onderwijscommissie.\n', 'Zichtbaar maken hoe eigen keuzen van studenten samenhangen met de beroepspraktijk. Verschillen in eindprofielen en in beginsituaties van individuele studenten moeten duidelijk worden. Methode: portfolio, coaching van individuele studenten. Plus: heel praktisch, bijv. roosterproblemen bij individuele leerroutes oplossen.\n', 1),
(71, 4, 3, 4, 11, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '1.0', '', 'Afzonderlijke docenten doen dit wel. De organisatie bevordert dat niet sterk. De organisatie bevordert duurzaam gedrag. Waar mogelijk gaat elke docent dit doen. Men krijgt feedback, bijv. doordat duurzaamheid een gesprekspunt wordt van functioneringsgesprekken. Vier keer per jaar komt het als onderwerp in discussiegroepen.\n', 0),
(72, 4, 3, 4, 12, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '2.0', 'Binnenkort komt de toetsing van de themaweken. Ook de globale LCA wordt getoetst.\n', 'Bij het formuleren van leerdoelen m.b.t. duurzaamheid wordt ook een toetsingssysteem ontworpen.\n', 0),
(73, 4, 3, 4, 13, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.5', '2.5', 'In het eerste jaar zit een module van 80 uur over basiskennis duurzaamheid ("themaweken duurzaamheid"), verplicht voor iedereen.\nVerderop in het curriculum zit milieuwetgeving; globale LCA; milieuzorgsystemen bij kwaliteitsmanagement; ketenbeheer bij een van de profielen.\n', 'De resultaten van de module zijn vervlochten in het verdere curriculum.\nVoor de rest: Onderzoek doen.\n', 0),
(74, 4, 3, 4, 14, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '2.0', '3.0', 'Propedeuseprojecten en 2e jaars projecten, 1 thema per periode, geintegreerde benadering.\n', 'Eerst verder perfectioneren.\n', 0),
(75, 4, 3, 4, 15, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '2.0', 'Er zijn stage-opdrachten waar duurzaamheid in zit, bijv. milieuzorgsystemen. Nog weinig keten-onderwerpen.\n', 'Duurzaamheid inbrengen in een lijst van verplichte aandachtspunten bij stages enz.\n', 0),
(76, 4, 3, 4, 16, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '1.0', 'Een dergelijk keuzevak is te kiezen.\n', 'Geen wens om zo''n specialiteit aan te bieden.\n', 0),
(77, 4, 3, 4, 17, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '2.0', '', '', 0),
(78, 4, 3, 4, 18, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '2.0', '', '', 0),
(79, 4, 3, 4, 19, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '1.0', '2.0', '', '', 0),
(80, 4, 3, 4, 20, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:02', '0.0', '1.0', '', '', 0),
(81, 4, 3, 5, 1, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '2.0', 'Het Handvest is ondertekend, voor de gehele Hogeschool.\n', 'Expliciete visie, vastleggen.\n', 1),
(82, 4, 3, 5, 2, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '2.0', 'De visie is nog niet sterk uitgewerkt. Het begin is er.\n', 'Expliciete visie, vastleggen. Niet te hard willen lopen, dus nog niet vertalen in meetbare doelen.\n', 1),
(83, 4, 3, 5, 3, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '1.0', '', 'Handvest bekender maken.\nHet AISHE-onderzoek draagt bij aan het opwekken van de discussies. Concrete doelen stellen over inpassen in onderwijs: project duurzaamheid formuleren, als item voor de projectleider curriculumontwikkeling.\n', 1),
(84, 4, 3, 5, 4, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '2.0', 'Wetgeving voor chemicalien wordt uitgevoerd (door de practicumassistent). Afvalscheiding, milieumokken.\n', '', 0),
(85, 4, 3, 5, 5, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '2.0', '', '', 0),
(86, 4, 3, 5, 6, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '2.0', 'Enkele medewerkers doen wel eens iets aan duurzaamheid in curriculumontwikkeling. B.v. in het vak ethiek.\n', 'Om een expertisecentrum met veel meer diepgang te realiseren, moet er flink wat tijd beschikbaar gesteld worden.Ontwikkelingsplan om die expertise te verkrijgen.\n', 0),
(87, 4, 3, 5, 7, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '3.0', 'Rond ketenbeheer is er vorig jaar gewerkt aan vergroting van kennis bij het personeel. Dat is beleid, maar nog incidenteel.\nEr zijn wel enkele medewerkers met redelijke of zelfs uitstekende kennis m.b.t. duurzaamheid, maar men weet dat te weinig van elkaar.\n', 'Systematiek in het scholingsbeleid m.b.t. duurzaamheid. Gebaseerd op duurzaamheidsvisie.\nAlle medewerkers zijn goed op de hoogte, binnen hun vakgebied. Geldt voor alle vakgebieden.\n', 1),
(88, 4, 3, 5, 8, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '0.0', '0.0', 'Er zijn geen commerciele projecten met duurzaamheid als element.\n', 'Voorlopig geen wens om dat te veranderen.\n', 0),
(89, 4, 3, 5, 9, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '2.0', 'Er zit iets van milieu in de eindtermen, zoiets als "Zorgvuldig omgaan met..."\n', 'De huidige eindtermen gaan, in samenhang met curriculumontwikkeling, onderzocht worden en waar nodig bijgesteld m.b.t. duurzaamheid.\n', 0),
(90, 4, 3, 5, 10, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '2.0', '4.0', 'Het nieuwe curriculum is ontworpen t.b.v. zelfverantwoordelijk leren (fase 3): bijv. propedeuseprojecten. In de praktijk is dat nog niet overal gerealiseerd.Studenten maken deel uit van de onderwijscommissie.\n', 'Zichtbaar maken hoe eigen keuzen van studenten samenhangen met de beroepspraktijk. Verschillen in eindprofielen en in beginsituaties van individuele studenten moeten duidelijk worden. Methode: portfolio, coaching van individuele studenten. Plus: heel praktisch, bijv. roosterproblemen bij individuele leerroutes oplossen.\n', 1),
(91, 4, 3, 5, 11, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '1.0', '', 'Afzonderlijke docenten doen dit wel. De organisatie bevordert dat niet sterk. De organisatie bevordert duurzaam gedrag. Waar mogelijk gaat elke docent dit doen. Men krijgt feedback, bijv. doordat duurzaamheid een gesprekspunt wordt van functioneringsgesprekken. Vier keer per jaar komt het als onderwerp in discussiegroepen.\n', 0),
(92, 4, 3, 5, 12, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '2.0', 'Binnenkort komt de toetsing van de themaweken. Ook de globale LCA wordt getoetst.\n', 'Bij het formuleren van leerdoelen m.b.t. duurzaamheid wordt ook een toetsingssysteem ontworpen.\n', 0),
(93, 4, 3, 5, 13, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.5', '2.5', 'In het eerste jaar zit een module van 80 uur over basiskennis duurzaamheid ("themaweken duurzaamheid"), verplicht voor iedereen.\nVerderop in het curriculum zit milieuwetgeving; globale LCA; milieuzorgsystemen bij kwaliteitsmanagement; ketenbeheer bij een van de profielen.\n', 'De resultaten van de module zijn vervlochten in het verdere curriculum.\nVoor de rest: Onderzoek doen.\n', 0),
(94, 4, 3, 5, 14, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '2.0', '3.0', 'Propedeuseprojecten en 2e jaars projecten, 1 thema per periode, geintegreerde benadering.\n', 'Eerst verder perfectioneren.\n', 0),
(95, 4, 3, 5, 15, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '2.0', 'Er zijn stage-opdrachten waar duurzaamheid in zit, bijv. milieuzorgsystemen. Nog weinig keten-onderwerpen.\n', 'Duurzaamheid inbrengen in een lijst van verplichte aandachtspunten bij stages enz.\n', 0),
(96, 4, 3, 5, 16, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '1.0', 'Een dergelijk keuzevak is te kiezen.\n', 'Geen wens om zo''n specialiteit aan te bieden.\n', 0),
(97, 4, 3, 5, 17, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '2.0', '', '', 0),
(98, 4, 3, 5, 18, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '2.0', '', '', 0),
(99, 4, 3, 5, 19, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '1.0', '2.0', '', '', 0),
(100, 4, 3, 5, 20, 0, '2013-09-20 00:00:00', '2014-07-09 16:12:11', '0.0', '1.0', '', '', 0),
(101, 4, 3, 6, 1, 9, '2013-09-20 00:00:00', '2014-10-05 20:14:32', '2.5', '4.0', 'student view is  that they expect (high)  uwi to have a policy and vision in place. \r\nthere are documents that contain vision on food security, when the faculty was formed. a docuement by chelston braithwaite.the document was at the center at forming the faculty. \r\nthe question is whether or not the document was adopted? was it approved? however the the vision was not articulated however it was used to be the center of the document in forming the faculty. has it been implemented? however it is written in documents, however the question is really whether or not it was adopted and being used currently. hence it has not reached stage 3, since it is not part of a vision (written). students are involved in the decision making in all area of the boards, eg academic board, faculty board. students are represented on every level. hence for stage 3 the last part is achieved already. students are willing to engaged in making decisions wrt food security.  there is also student-staff liasion meeting, that student voice their complaints. we are involved in CARICOM (Caribbean Community), they have defined roles, and policy on food security. we dont want to carry our faculty policy too much out of the CARICOM policy.', 'we would like to get at stage four if we can. that is ideal for us. however there are some linkages with professional buddies part of 4. not necessairly no existent, but it is weak. alot of persons ae invovled in secondary school examination. its partially there, but not completed. but we are interested in getting to that stage. however the pg should me more involved with preparing a mission statement more than the ug (pg). ambition to achieve stage 3 in two years, stage 4 three to four years however stage 5 not more that 6 years. stage three can be achieved in the short term.to assess the critier on the present situation. the last condition for stage three have been already achieved. however the other parts should be worked on. the consensus is 2 to 3 years to achieve stage 4.', 1),
(102, 4, 3, 6, 2, 9, '2013-09-20 00:00:00', '2013-09-27 00:00:00', '2.0', '3.0', 'there are student representatives on different boards. there isnt a single document, there are fragmented documents.initiative came from Barbados to systemize a document. there is a insitutional contraints wrt to policy. with the strategic plan there was a discussion on food security. there is one  university strategic plan. it is more diffuclty for the faculty to influence the policy quickly within the university.', 'short term is two years. we could say that the inovlement of student and staff are at a high level. implmenting the poilcy is more difficult. achieving stage 3 is more attainable, since we want to avoid overlooking the parts that we do not currently have.', 0),
(103, 4, 3, 6, 3, 9, '2013-09-20 00:00:00', '2014-10-05 20:14:34', '2.0', '3.0', 'everything we in this faculty is food security oriented however it is not labled as food security. it is mentioned in faculty board, projects, board meeting. the minister recently visisted wrt national security. put a label on it is really the issue. better communication to all staff. every single course is geared to food security. however the faculty has not made it that visible. there is more of an internal communication issues. however there should be more emphasis on linking the different subject areas for eg. in economics, using a example to link food security. it part of each department''s programme. it is a regular topic within the faculty. the dean is aware how the staff memeber feel about security. there are fomal meetings, projects (IDRC).external partners are not aware and not too clear of what food secuity is. other faculty have a vision of us as primary production. there is still a stigma wrt agriculture. need new metholdogies students are stil being shown old methods in their practical internship. we can only change our image if we change what we show to them externally.  weak comunication with extension officers (between research, extension officer, and the farmer). student do many research projects but the output is not reported to extension officers of farmers. we need more feedback mechanism.', 'it should be avaiable externally (communication). more explicit for other faculties. faculty should use marketing and communications so that it can be seen. to make what we are doing more visible to other faculties and other stakeholders. exchange in communication with external stakeholder should be improved. the external communication should be improved. the second condition of stage 3 is not solid.we are close to stage three so we can  accomplish this in a few months.  get to stage three in two to three years.', 1),
(104, 4, 3, 6, 4, 9, '2013-09-20 00:00:00', '2013-09-27 00:00:00', '1.0', '2.0', 'we dont walk the talk. we have said we want local produce in our meetings , more fruits.  we have some initiatives to re-cycle. more adhoc, not intergrated in the policy. we are definitly at stage 1 but stage 1 plus.', 'department should influence the food court within the faculty to have more balanced meals. he principal stated in academic board meeting to have a new fod court on top the bank in three years', 0),
(105, 4, 3, 6, 5, 9, '2013-09-20 00:00:00', '2013-09-27 00:00:00', '3.0', '5.0', 'there are mo signs. staff have individual ties to locally, internally, and regionally contacts. we have not systematically sat down and said what we dont have and to fill in the gaps, there is alot of knowledge out there. however we are struggling to focus and develop what we alaready have. there is pressure from outside to focus on aspects of food security but it might not necessarily be what we want to focus on. there are networks establised (individal  networks) through projects. our curriculum are sent to stakeholders and we recieve feedback. we do have conferences and concious on global part. we bring back projects, workshops etc. we have exchange with some stakeholders. there is the opportunity to influence the secondary school curriculum.', 'stage 4 has started, we do speak to both sides, but not completely. they expect us to get to stage five without giving us the resources.', 0),
(106, 4, 3, 6, 6, 9, '2013-09-20 00:00:00', '2013-09-27 00:00:00', '1.0', '3.0', 'stage one is obvious within our faculty. there is no dedicated group of people. however there are dedicated programmes for eg. BSc. Human Nutrition and Dietetics students go to hospitals for internship. we dont synthesize.  two years ago it was documents and dicussed at the faculty level to have a group of people to seek grants etc. for food security. however is CFNI (Caribbean Food and Nutrition Insititue) on the campus, but it was difficult to form a food security forum, however they are now closed down so the field is now open for us to implement food security. persons accross the faculty have a wealth of knowledge and expertise/strengths.', NULL, 0),
(107, 4, 3, 6, 7, 9, '2013-09-20 00:00:00', '2013-10-28 00:00:00', NULL, NULL, NULL, NULL, 0),
(108, 4, 3, 6, 8, 9, '2013-09-20 00:00:00', '2013-09-27 00:00:00', '2.0', '4.0', 'Major Research project IDRC. More of a benefit than profit for stage 2 and 3. public services are recognized. there are MOUs with quadoms, embrappa.the first condition of stage four is there, however the volume, we should be doing more to be in this stage. then it is a question of time.', 'stage four is more long term.', 0),
(109, 4, 3, 6, 9, 9, '2013-09-20 00:00:00', '2013-09-27 00:00:00', '1.0', '3.0', 'within the marketing and agribusiness, human nutrition programme it is visible in some courses but not all courses.', 'making it more explicit, more career options. to accomplish this in 2 to 3 years', 0),
(110, 4, 3, 6, 10, 9, '2013-09-20 00:00:00', '2013-09-27 00:00:00', '2.0', '4.0', 'developing critical thinkers through IDU. we have not planned this reflective methodology. is it adhoc or systematic? there is no fomal structure to show reflection. in some courses it design for reflective methods. the strategic plan states that reflective part must be part of courses, however it is not necessairly done. in our course outline it is stated in the learning outcomes, but how they are implemented in courses every day is the issues. final exmaination would not reflect this.', 'wrt long term. suitable of feedback system. time is a factor and time to get that individual feed back . the size of the classes are crucial. need to design the courses based on competencies, wrt staffing.', 0),
(111, 4, 3, 6, 11, 9, '2013-09-20 00:00:00', '2013-10-28 00:00:00', NULL, NULL, NULL, NULL, 0),
(112, 4, 3, 6, 12, 9, '2013-09-20 00:00:00', '2013-09-27 00:00:00', '2.0', '3.0', 'it more than casusally mentioned. it is part of examination of core courses.', 'indentify one course that should be a core course that students are required to do such as Island Food Systems to be used as food security guide to measure and implement food security .stage 3. two to 3yrs. however the ambition in stage 5.', 0),
(113, 4, 3, 6, 13, 9, '2013-09-20 00:00:00', '2014-10-05 20:03:45', '3.5', '4.0', NULL, 'short term is stage 3. medium term 4.', 0),
(114, 4, 3, 6, 14, 9, '2013-09-20 00:00:00', '2013-09-27 00:00:00', '1.0', '3.0', NULL, 'to eventually go to stage 3 short term.', 0),
(115, 4, 3, 6, 15, 9, '2013-09-20 00:00:00', '2013-09-27 00:00:00', '1.0', '3.0', 'we are not quite there at stage 2.', NULL, 0),
(116, 4, 3, 6, 16, 9, '2013-09-20 00:00:00', '2013-09-27 00:00:00', '1.0', '2.0', 'sub group members had no disagreement in choosing stage 1. there electives students can choose eg island food systems.department is now trying to introduce food security option for the msc. marketing and agribusiness for the upcoming academic year 2013/2014. we currently have a programme in Food Safety and Food Quality. although the programme do courses that have food security content, it is not necessarily a degree in food security. again the issues here is labeling.  bsc general agriculture allows student to touch in alot of disciplines. however lecturers are teaching elements of food security in every course.', 'realisticallly we can achieve stage 2 in the short term.to make it more attractive could be general agriculture and food securitty. or develop a certificate in food security, post graduate certificate. all students , agribusiness, envriomental, human ecology, bascially every student within the faculty should be exposed to a food security course. however planning is crucial. the faculty have to decide on a proper food production degrree that would allow for specialization in food security. however we should not move to far away and loose the food producion aspect, if that happens we would loose the faculty. how to communicate and intergrate must be carefully done.', 0),
(117, 4, 3, 6, 17, 9, '2013-09-20 00:00:00', '2013-10-28 00:00:00', '0.0', '4.0', '', '', 0),
(118, 4, 3, 6, 18, 9, '2013-09-20 00:00:00', '2013-10-28 00:00:00', '0.0', '3.0', '', '', 0),
(119, 4, 3, 6, 19, 9, '2013-09-20 00:00:00', '2013-10-28 00:00:00', '0.0', '3.0', '', '', 0),
(120, 4, 3, 6, 20, 9, '2013-09-20 00:00:00', '2013-10-28 00:00:00', '0.0', '2.0', '', '', 0),
(121, 4, 3, 7, 1, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '1.0', '3.0', 'Existence of an implied vision through activities carried out in various departments of the three faculties by several projects, workshops, meetings, and guidance documents among the Faculty of Agricultural Sciences (FAS) as well as the Polytechnic School of Abomey-Calavi (EPAC) and of the School of Engineering (FAST).\r\nThe participants unanimously concluded that no document explicitly mentions food security.', 'With the existence of an implied vision within the organisation, the participants have committed themselves to clarifying this vision.\r\nThe aim, focused on Stage 3, is to consolidate the application of existing texts through meetings between the lecturers and the administrative staff and to explore the possibility of including students in the decision-making process.', 0),
(122, 4, 3, 7, 2, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '1.0', '4.0', 'In terms of food security, the vision is implicit and the strategy of implementing this vision do not exist which means the current situation does not match Stage 1.\r\nThe decision to implement the strategies is solely up to the management and is subject to financial resources. In order to move forward, these strategies need to be clearly defined regardless of the funds which determine their implementation.', 'Stage 4 could be possible, but for this to happen, the strategy needs to be clarified and consultations between lecturers, administrative staff, professionals and students must occur. The question is to know what structures are appropriate. Many conditions are ready in order to achieve this requirement.', 0),
(123, 4, 3, 7, 3, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '2.0', '2.0', 'Students in specific departments acquire food security knowledge most often outside of the courses they attend. This raises a communication problem between the learners and the lecturers.\r\nIn terms of the faculty, these questions are recurring in the sense that the food security aspect is indirectly addressed in the courses given. Furthermore, we note the existence of a shared Master program among the three entities FSA-EPAC-FAST.', 'The topic of food security comes out regularly at FAS, but at FAST it is much less the case; the learners here do not link food security with what they study.\r\nIn the strategy we therefore can define a communication plan so that people are better informed on food security.\r\nIf the three entities are involved, we can make it to Stage 2 and consolidate this level within FAST.\r\nIn order to consolidate this level, we must set up an action plan.', 0),
(124, 4, 3, 7, 4, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '1.0', '2.0', 'There is the possibility to create internal structures.\r\nThe current situation is therefore at Stage 1 and depends on the ability of the faculties to meet the expectations of the students.', 'From the moment restaurants are available to the students we would be able to move into Stage 2.\r\nThere must be an impact in terms of volume and the structures must be in place.', 0),
(125, 4, 3, 7, 5, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '3.0', '3.0', 'Stage 1 has been met because lecturers maintain contact with individuals outside of the University.\r\nAt Stage 2, the first and second requirements are met because contracts with partners and individuals of the professional world exist.\r\nThey however do not insert the elements of these in the courses offered.\r\nWe are working towards the second requirement of Stage 3, which requires consolidation.', 'There is no further aim to reach a higher level because the feedback gained from the network should be consolidated, in order to apply the expertise of the network towards teaching and networking.', 0),
(126, 4, 3, 7, 6, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '2.0', '4.0', 'Stage 1 is taken as starting point as long as the expertise of FAST, FSA and EPAC are solicited.\r\nCommissioners often go through laboratory managers and faculty managers in order to assess the efficiency of the laboratories and to identify individuals who meet the skills they are looking for.\r\nLecturers play the expert role.\r\nThere are human resources which can be defined as a group of experts.\r\nWe are therefore currently in Stage 2 because presently, when someone requires an expert, we can look for people in the faculties to do the work.', 'To be in Stage 3, there are several challenges as follows:  \r\n•	gather experts in one centre; \r\n•	link up the people of this centre through clearly-defined requirements; \r\n•	equally split the work in order to avoid expropriation of all tasks by one single person and to avoid organisational and administrative issues.\r\n\r\nStage 4 requires visibility of the establishment and time to think about the students. The second criterion could include the creation of a centre to practically implement research. Stage 4 is the ambition.\r\nIf the “bottleneck” is removed, one can go a long way with this centre.\r\nEveryone in Benin is aware that we lack the statistics and specialised training in food security to showcase the centre and to make it indispensable in Benin and even in the sub-region.\r\nThere isn’t a forum where we can go to when we want to talk about a strategy and discuss other topics related to food security. It is an opportunity to value skills within the institutions. The role of the institution consists of training and the creation of a database (the institution can for instance take markets and based on human resources gather a group of experts). The idea behind the centre is to serve as a one-stop shop for expertise on food security.', 0),
(127, 4, 3, 7, 7, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '0.0', '0.0', NULL, NULL, 0),
(128, 4, 3, 7, 8, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '1.0', '3.0', 'The NSA department of the FSA is a model of excellence for Stage 4.\r\nStages 2 and 3 have not yet been achieved, although the criteria for Stage 4 are more highly developed.\r\nIn terms of food in relation to the pastoral field, the presence of external services has been noted to see up to which level the idea of food security is implemented.', 'If Stage 1 is the present situation, the wish is to reach Stage 3.', 0),
(129, 4, 3, 7, 9, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '1.0', '4.0', 'The requirements of Stage 2 have not been met; however conditions are favourable to reach higher levels.', 'We aspire to go reach Stage 4 because the conditions are favourable with the BMD.\r\nProfessionals participate in the support of the students, in particular during internships.\r\nProfessionals offer teaching which is an integral part of the curriculum and they help evaluate students and grade their work.', 0),
(130, 4, 3, 7, 10, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '3.0', '4.0', 'Stages 1 and 2 have been accomplished. The present situation is Stage 3, as some personal tasks have been given to students, referred to as TPE.\r\nDuring the TPE, students conduct presentations, which are then released to other students and lecturers.\r\nThese presentation sessions are a way to exchange information between students and lecturers.', 'We aspire to reach Stage 4.\r\nThe idea of reaching Stage 5 can be considered when the difficulties related to interdepartmental mobility are resolved.', 0),
(131, 4, 3, 7, 11, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '0.0', '0.0', NULL, NULL, 0),
(132, 4, 3, 7, 12, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '1.0', '1.0', 'Some programme evaluations take aspects of food security into account.', 'We are not aiming to reach Stage 2 because of specific issues that arise.\r\nIt is not seen as relevant to evaluate the four aspects of food security during the courses because they are specialised on specific fields.', 0),
(133, 4, 3, 7, 13, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '1.0', '3.0', 'Stage 1 has been achieved because there are courses linked to food security.\r\nStage 2 has not been achieved because there is no module related to food security.', 'For the next three years, Stage 3 is the target, and in the long run, Stage 4.', 0),
(134, 4, 3, 7, 14, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '3.0', '4.0', 'Stage 1 is achieved through training obtained with the help of lecturers, who can support practical aspects of the courses provided. \r\nStage 2 is achieved because courses are inter-related. \r\nStage 3 is achieved because in the first year of training, cross-curricular courses are offered to students. This gives students the opportunity to become specialized in other areas. Nevertheless, this stage needs to be consolidated.', 'We aim for Stage 4 for better performance.', 0),
(135, 4, 3, 7, 15, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '2.0', '3.0', 'Stage 1 is achieved.\r\nStage 2 is the current situation given that training related to food security has been organised for the students. However, there is a necessity to strengthen this stage because the students do not realise that their work is linked to food security.', 'Stage 3 is the aim because the theme of food security is not always one of the main activities raised in the training sessions or practical work.\r\nFood security is not pointed out in the examination regulations and should systematically be implemented in the curriculum.', 0),
(136, 4, 3, 7, 16, 9, '2013-09-20 00:00:00', '2013-11-13 00:00:00', '3.0', '4.0', 'With BMD system, the students have the option to choose an optional module linked to food security in another institution, thus achieving Stage 1 within the organisation.\r\nWith the existence of the Master’s on nutrition and food security at FAST and at the International Training in Nutrition and Food Security (FINSA) at the FAS, students receive classes on optional modules related mainly to food security. This training offers a special certificate to students and enables them to become specialised in food security. Moreover, there is a need to consolidate Stage 2 at EPAC through the possibility of the issuance of a special certificate or an annotation on the diploma of the students.', 'The aim is Stage 4 because the inter-disciplinarity dedicated mainly to food security is not yet effective and can be achievable.', 0),
(137, 4, NULL, 7, 17, 9, '2013-09-20 00:00:00', NULL, '0.0', '0.0', '', '', 0),
(138, 4, NULL, 7, 18, 9, '2013-09-20 00:00:00', NULL, '0.0', '0.0', '', '', 0),
(139, 4, NULL, 7, 19, 9, '2013-09-20 00:00:00', NULL, '0.0', '0.0', '', '', 0),
(140, 4, NULL, 7, 20, 9, '2013-09-20 00:00:00', NULL, '0.0', '0.0', '', '', 0),
(141, 4, 4, 8, 1, 9, '2013-09-24 00:00:00', '2013-09-24 00:00:00', NULL, NULL, 'l''aspect s', 'l''audit sert d''outil d''', 0),
(142, 4, NULL, 8, 2, 9, '2013-09-24 00:00:00', NULL, '1.0', '3.0', 'd', 'mise en oeuvre d''activit', 0),
(143, 4, NULL, 8, 3, 9, '2013-09-24 00:00:00', NULL, '2.0', '3.0', 'la 1', 'la d', 0),
(144, 4, NULL, 8, 4, 9, '2013-09-24 00:00:00', NULL, '1.0', '2.0', 'Des discussions peuvent ', 'il y a des exemples au nigeria ou la faculte d'' agro vend ses produits aux resto universitaires et de ce fait contribue a la securite alimentaire de l'' institution. les questions de faisabilites en terme de legalite, concurrence sur le march', 0),
(145, 4, NULL, 8, 5, 9, '2013-09-24 00:00:00', NULL, '2.0', '3.0', 'formation en divsers outils sur la s', 'Des pr', 0),
(146, 4, NULL, 8, 6, 9, '2013-09-24 00:00:00', NULL, '3.0', '4.0', 'Existence d''un centre permanant (CRESA) qui ex', 'definir clairement le lien dans le plan strat', 0),
(147, 4, NULL, 8, 7, 9, '2013-09-24 00:00:00', NULL, '0.0', '0.0', '', '', 0),
(148, 4, NULL, 8, 8, 9, '2013-09-24 00:00:00', NULL, '4.0', '5.0', '', 'consolider les acquis et avancer en phase 5\n', 0),
(149, 4, NULL, 8, 9, 9, '2013-09-24 00:00:00', NULL, '1.0', '2.0', 'aspects de la s', 'le 3e pt \n', 0),
(150, 4, NULL, 8, 10, 9, '2013-09-24 00:00:00', NULL, '3.0', '4.0', 'la 2', '', 0),
(151, 4, NULL, 8, 11, 9, '2013-09-24 00:00:00', NULL, '0.0', '0.0', '', '', 0),
(152, 4, NULL, 8, 12, 9, '2013-09-24 00:00:00', NULL, '0.0', '1.0', '', '', 0),
(153, 4, NULL, 8, 13, 9, '2013-09-24 00:00:00', NULL, '2.0', '3.0', '', 'niveau ', 0);
INSERT INTO `report_item` (`id`, `created_by`, `modified_by`, `report_id`, `criterion_item_id`, `status`, `created_at`, `modified_at`, `current_situation_rating`, `desired_situation_rating`, `current_situation_comment`, `desired_situation_comment`, `has_high_priority`) VALUES
(154, 4, NULL, 8, 14, 9, '2013-09-24 00:00:00', NULL, '3.0', '4.0', 'la relation entre les diff', 'consolider la phase 3 avant d''aborder la phase 4\n', 0),
(155, 4, NULL, 8, 15, 9, '2013-09-24 00:00:00', NULL, '2.0', '3.0', '', 'la s', 0),
(156, 4, NULL, 8, 16, 9, '2013-09-24 00:00:00', NULL, '0.0', '1.0', '', '', 0),
(157, 4, NULL, 8, 17, 9, '2013-09-24 00:00:00', NULL, '0.0', '0.0', '', '', 0),
(158, 4, NULL, 8, 18, 9, '2013-09-24 00:00:00', NULL, '0.0', '0.0', '', '', 0),
(159, 4, NULL, 8, 19, 9, '2013-09-24 00:00:00', NULL, '0.0', '0.0', '', '', 0),
(160, 4, NULL, 8, 20, 9, '2013-09-24 00:00:00', NULL, '0.0', '0.0', '', '', 0),
(161, 3, 3, 9, 1, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '2.0', NULL, NULL, NULL, NULL),
(162, 3, 3, 9, 2, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '3.0', NULL, NULL, NULL, NULL),
(163, 3, 3, 9, 3, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '1.0', NULL, NULL, NULL, NULL),
(164, 3, 3, 9, 4, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '2.0', NULL, NULL, NULL, NULL),
(165, 3, 3, 9, 5, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '0.0', NULL, NULL, NULL, NULL),
(166, 3, 3, 9, 6, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '2.0', NULL, NULL, NULL, NULL),
(167, 3, 3, 9, 7, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '1.0', NULL, NULL, NULL, NULL),
(168, 3, 3, 9, 8, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '2.0', NULL, NULL, NULL, NULL),
(169, 3, 3, 9, 10, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '1.0', NULL, NULL, NULL, NULL),
(170, 3, 3, 9, 9, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '0.0', NULL, NULL, NULL, NULL),
(171, 3, 3, 9, 11, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '2.0', NULL, NULL, NULL, NULL),
(172, 3, 3, 9, 12, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '3.0', NULL, NULL, NULL, NULL),
(173, 3, 3, 9, 13, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '0.0', NULL, NULL, NULL, NULL),
(174, 3, 3, 9, 14, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '1.0', NULL, NULL, NULL, NULL),
(175, 3, 3, 9, 15, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '2.0', '3.0', NULL, NULL, NULL),
(176, 3, 3, 9, 17, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '0.0', '1.5', NULL, NULL, NULL),
(177, 3, 3, 9, 19, 0, '2013-09-27 00:00:00', '2014-07-09 16:13:53', '0.0', NULL, NULL, NULL, NULL),
(178, 3, 3, 10, 1, 0, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '2.0', '4.0', NULL, NULL, 0),
(179, 3, 3, 10, 2, 0, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '3.0', '4.0', NULL, NULL, 0),
(180, 3, 3, 10, 3, 0, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '3.0', '5.0', NULL, NULL, 0),
(181, 3, 3, 11, 1, 9, '2013-09-27 00:00:00', '2014-07-20 15:47:24', '2.0', '3.0', NULL, NULL, 0),
(182, 3, 3, 11, 2, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '2.0', '3.0', NULL, NULL, 0),
(183, 3, 3, 11, 3, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '2.0', '3.0', NULL, NULL, 0),
(184, 3, 3, 11, 4, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '1.0', '2.0', NULL, NULL, 0),
(185, 4, 4, 12, 1, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '2.0', '3.0', 'A vision on food security and its relationship with a specific subject is presented at the beginning of most of the courses offered at SUA. Also the presence of this group to attend the AIFSHE audit is an evidence of the second condition for Stage 2', 'This stage is a desired situation, which is still to realize. However, there is a need to have a mission statement related explicitly to food security.', 1),
(186, 3, 3, 11, 5, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '2.0', '2.0', NULL, NULL, 0),
(187, 3, 3, 11, 6, 9, '2013-09-27 00:00:00', '2014-07-20 15:47:44', '1.5', '2.0', NULL, NULL, 0),
(188, 3, 3, 11, 8, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '3.0', '4.0', NULL, NULL, 0),
(189, 3, 3, 11, 9, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '1.0', '3.0', NULL, NULL, 0),
(190, 3, 3, 11, 10, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '3.0', '4.0', NULL, NULL, 0),
(191, 3, 3, 11, 11, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', NULL, NULL, NULL, NULL, 0),
(192, 3, 3, 11, 12, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '1.0', '1.0', NULL, NULL, 0),
(193, 3, 3, 15, 1, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '2.0', '3.0', 'Situation présente: Niveau 2\r\nDans le contexte sahélien et particulièrement au Niger, un accent est mis sur l''aspect sécurité alimentaire pour le bétail. Bien qu’il soit implicitement pris en compte dans l’expression de la sécurité alimentaire, Il convient de préciser ce point dans la définition globale de la sécurité alimentaire. Il est suggeré au titre de la présente Faculté, l’élaboration d’un document qui spécifie clairement la vision sécurité alimentaire. La phase 2 est acquise et pour aborder la phase 3, ce document qui décrit la vision sur la sécurité alimentaire de la faculté est une condition sine quo none.', 'L’outil AIFSHE servira de base d''évaluation pour la précision de la vision sécurité alimentaire dans la mission officielle de la Faculté. \r\nAussi, la 3ème condition de ce niveau 3, à savoir la participation effective des étudiants et du personnel au processus, est remplie.\r\nLa vision sera partagée avec la Faculté d’Agronomie de Maradi.', 0),
(194, 3, 3, 11, 13, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '3.0', '3.0', NULL, NULL, 0),
(195, 3, 3, 11, 14, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '3.0', '4.0', NULL, NULL, 0),
(196, 3, NULL, 14, 1, 9, '2013-09-27 00:00:00', NULL, '1.0', '3.0', 'La phase 1 est la phase actuelle car la vision du pôle agronomique est déclarée concrètement dans la stratégie de la sécurité alimentaire', 'Au niveau institutionnel, les structures sont déjà présentes pour l’intégration du personnel et des étudiants dans la formulation de la vision. Les étudiants ont déjà pris des initiatives allant dans ce sens en organisant des conférences sur le thème de la sécurité alimentaire.\r\nL’ambition est que les membres du personnel puissent travailler avec les étudiants pour mettre en place une telle stratégie.', 0),
(197, 3, 3, 11, 15, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '0.0', '0.0', NULL, NULL, 0),
(198, 3, 3, 11, 16, 9, '2013-09-27 00:00:00', '2014-07-20 15:48:24', '0.0', NULL, NULL, NULL, 0),
(199, 3, NULL, 13, 1, 9, '2013-09-27 00:00:00', NULL, '1.0', '3.0', 'Les participants ont reconnu l’existence d’une vision implicite à travers les activités menées dans les différents départements des trois facultés. Ceci se traduit par l’existence de plusieurs projets, ateliers, réunions, documents d''orientation aussi bien au sein de la Faculté des sciences Agronomiques (FSA) qu’au niveau de l’Ecole Polytechnique d’Abomey-Calavi (EPAC) et de la Faculté des Sciences et Techniques (FAST). On note au niveau de ces facultés respectives la présence de la spécialité Nutrition Humaine et Sécurité Alimentaire, la présence du département de Génie de Technologie Alimentaire (GTA) et enfin celle du département de génétique, biotechnologie et ressources biologiques (GBRB).\r\nA l’unanimité, les participants ont conclu qu’aucun document ne mentionne explicitement la sécurité alimentaire', 'Avec l’existence de vision implicite au sein de l’organisation que constituent les trois facultés, les participants ont assuré la facilité de passer la deuxième phase d’autant plus qu’au niveau politique, rien ne les empêcherait d’expliciter cette vision dans les documents. De plus, il n''est pas exclu qu''il y ait une vision partagée par les trois facultés.\r\nL’ambition est portée sur la phase 3 dans la perspective de consolider réellement l’application des textes existants en matière de rencontre entre les professeurs et le personnel administratif et d’étudier la possibilité d’associer les étudiants aux prises de décisions.', 0),
(200, 3, 3, 15, 2, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '1.0', '3.0', 'Il sera développé un plan stratégique pour la Faculté en termes de sécurité alimentaire.', 'La mise en œuvre d''activités (séances de travail) participatives sera privilégiée pour l''élaboration du document stratégique.', 0),
(201, 3, 3, 15, 3, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '2.0', '3.0', 'La 1ère condition de la phase 3 (à savoir l’opinion du personnel et des étudiants sur la sécurité alimentaire et l’enseignement) est remplie. Une consolidation des acquis demeure nécessaire.', 'La définition du plan de communication devra être inclue dans l''atelier stratégique.', 0),
(202, 3, 3, 15, 4, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '1.0', '2.0', 'Des discussions peuvent être menées pour la prise en compte effective de la gestion interne de la sécurité alimentaire.\r\nAu cours de ces dernières années, les thèmes développés aux journées scientifiques de l’étudiant en Agronomie traitaient respectivement de sécurité alimentaire et production animale, sécurité alimentaire et gestion de l’eau d’irrigation. Cette année le slogan était “un étudiant, une parcelle de culture”. Les produits récoltés sont vendus à l’interne.', 'Il existe des exemples au Nigeria où la Faculté d'' Agronomie vend ses produits aux restaurants universitaires et de ce fait contribue à la sécurité alimentaire de l''institution. Les questions de faisabilité en terme de l’égalité, de concurrence sur le marché et de mandat par rapport au gouvernement sont soulevées par des participants. La décision de poursuivre les efforts de la phase 1 vers 2 dépendra d''une discussion interne sur ses points qu''il faut organiser.', 0),
(203, 3, NULL, 13, 2, 9, '2013-09-27 00:00:00', NULL, '1.5', '4.0', 'En matière de sécurité alimentaire, la vision existe de façon implicite mais les stratégies de mise en œuvre de cette vision n’existent pas ce qui fait que la situation actuelle correspond à la phase1. Par exemple, la création des différents départements de la FSA constituent des stratégies indirectes mises en œuvre.\r\nLes décisions de mise en œuvre des stratégies se font uniquement au niveau de la direction et elles dépendent des ressources financières.\r\nPour avancer, il faudra que les stratégies soient clairement définies indépendamment des financements qui eux déterminent leur mise en œuvre.', 'La phase 4 pourrait être envisageable et il faudra pour cela expliciter la stratégie, rendre systématique les consultations entre enseignants, personnels administratifs, professionnels et étudiants. La question est de savoir quelles structures sont appropriées. Beaucoup de conditions sont prêtes pour atteindre ce critère', 0),
(204, 3, 3, 15, 5, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '2.0', '3.0', 'Déjà, d’importantes séances de formation en divers outils d’évaluation de la sécurité alimentaire (HEA, etc.) ont été effectuées.', 'Des précautions à prendre pour consolider la phase 3. L''analyse des expertises nécessaires dépend en effet en premier lieu de l''atelier interne sur la stratégie (critère 1.2) qui les définira sur la base des aspects pertinents tels que les voit la Faculté d''Agronomie.', 0),
(205, 3, 3, 15, 6, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '3.0', '4.0', 'Existence d''un centre permanant (CRESA) qui exécute des contrats de travail à travers des experts internes qui ne constituent nullement pas un groupe.', 'Il faut définir clairement le lien dans le plan stratégique pour remplir en particulier la première condition de la phase 4.', 0),
(206, 3, NULL, 14, 2, 9, '2013-09-27 00:00:00', NULL, '1.0', '2.0', 'La subjectivité dans la phase 1 n’est pas critique ; il y a un processus de mûrissement. La phase 1 est concrète cependant la phase 2 n’est pas encore réalisable et mais reste une ambition dans une durée de 3 ans mais pour ce faire il faut que les conditions s’y prêtent.', 'Le contexte politique actuel au Sénégal est favorable à une ambition stratégique de niveau 2, dans le sens où the thème de la sécurité alimentaire connaît un essor dans la prise de conscience politique du problème. (Voir cependant les remarques du point 3.1)', 0),
(207, 3, 3, 15, 8, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '4.0', '5.0', NULL, NULL, NULL),
(208, 3, 3, 15, 9, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '1.0', '2.0', NULL, NULL, NULL),
(209, 3, 3, 15, 10, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '3.0', '4.0', NULL, NULL, NULL),
(210, 3, NULL, 13, 3, 9, '2013-09-27 00:00:00', NULL, '2.0', '2.5', 'Dans un département spécifique, selon les apprenants ils acquièrent les connaissances relatives à la sécurité alimentaire le plus souvent en dehors des cours donnés. Mais d’après les enseignants quelque soit la spécialité choisie (production végétale et animale), elle aborde le problème de la sécurité alimentaire. Là se soulève le problème de communication entre les apprenants et les enseignants. Mais en termes de faculté ces questions sont récurrentes en ce sens que l’aspect de sécurité alimentaire est abordé indirectement dans les cours dispensés. De plus, on note l’existence d’un master norme entre les trois entités FSA-EPAC-FAST', 'D’une part à la FSA, le terme de sécurité alimentaire revient souvent, à la FAST c’est moins le cas; les apprenants ne font pas le lien entre ce qu’ils étudient et la sécurité alimentaire. Dans la stratégie nous pouvons définir donc un plan de communication pour que les gens soient mieux informés sur la sécurité alimentaire. Les trois entités sont impliquées, nous pouvons donc le mettre au niveau 2 et consolider ce niveau la FAST qui se retrouve à un niveau plus faible.\r\nPour consolider ce niveau, nous devrons mettre en place un plan d''action de la stratégie.', 1),
(211, 3, NULL, 13, 4, 9, '2013-09-27 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(212, 3, 3, 15, 11, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', NULL, NULL, NULL, NULL, 0),
(213, 3, NULL, 14, 3, 9, '2013-09-27 00:00:00', NULL, '2.0', '3.0', 'Le pôle agronomique dispose d’une communication interne et externe. La direction est, d’une part proche du personnel, et les opinions sont partagé, d’autre part, il s’agit d’utiliser ces informations non encore opérationnelles. Pour une bonne politique de communication, des étudiants sur la sécurité alimentaire, lors des manifestations il faut faire des brochures.\r\nIl n’existe pas de manière formelle un partenariat entre le pôle agronomique et secteur privé ; leur collaboration est très variable. Les directeurs peuvent cependant chercher des partenariats avec par exemple des ONG et autres et des protocoles d''accord signés mais cela reste dans la cadre de partenariat entre l’institut et le privé', 'Afin de rendre la phase 3 possible, il est en particulièrement nécessaire de créer un protocole de partage de l’information de sorte à formuler un plan cohérent de communication vers l’extérieur quant à la sécurité alimentaire', 0),
(214, 3, 3, 15, 12, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '0.0', '1.0', NULL, NULL, NULL),
(215, 3, 3, 15, 13, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '2.0', '3.0', NULL, NULL, NULL),
(216, 3, 3, 16, 1, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '1.0', '3.0', 'Food security is embedded in the "sustainable development" part of the university’s vision. This is evident within the university wide research clusters for climate change and human security research clusters respectively. This means that this vision is only implicit.', 'A holistic view of food security need to be expressed in the mission statement and translated into a concrete policy. Perhaps USP needs to find a niche in terms of food security that is relevant and unique for each of the 14 countries it serves.', 1),
(217, 3, 3, 15, 14, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '2.0', '3.0', NULL, NULL, NULL),
(218, 3, 3, 15, 15, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '1.0', '2.0', NULL, NULL, NULL),
(219, 3, NULL, 13, 9, 9, '2013-09-27 00:00:00', NULL, '1.0', '4.0', 'Ils n’ont pas encore remplis les critères de la phase 2 mais les conditions sont favorables pour ambitionner cette phase', 'Nous ambitionons aller jusqu’à la phase 4 parce que les conditions sont favorables avec le LMD. De plus, les professionnels participent à l’encadrement des étudiants surtout lors des stages. Les professionnels dispensent des enseignements faisant partie intégrante des curricula et sont membres des jurys d’évaluation des mémoires de fin de cycle.', 1),
(220, 3, NULL, 14, 4, 9, '2013-09-27 00:00:00', NULL, '1.0', '2.0', 'Le problème de l’agriculture au Sénégal pause souvent problème. Au sein de l''université même, la restauration est en sous traitance; il est assuré par le COUD. L''Etat négocie les prestations de services pour la restauration des étudiants cependant, la qualité du service laisse à désirer car l’effectif énorme des étudiants influences sur le service de la restauration. Par exemple à l’ISFAR, avant l’arrivé du COUD, il y’avait une bonne qualité dans la restauration des étudiants mais depuis que ce dernier a pris les choses en mains la qualité n y ait plus. Il faut aussi préciser que c’est l’Etat qui négocie les contrats et non l’université car le COUD c’est l’Etat', 'Les gens aspirent à revenir à la situation précédente, c’est à dire que le pôle agronomique reprend en main la gestion de l’alimentation au sein de l’université. Les étudiants mettent en place des productions de légumes pour les vendre au repreneur.', 0),
(221, 3, 3, 15, 16, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '0.0', '1.0', NULL, NULL, NULL),
(222, 3, 3, 16, 2, 9, '2013-09-27 00:00:00', '2013-10-01 00:00:00', '1.0', '1.5', 'There is no policy on Food Security', 'The University needs to develop a top-down policy on Food Security with a clear mandate from all stakeholders.', 0),
(223, 3, 3, 16, 3, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '1.5', '3.5', 'Very limited communication takes place between individuals or within the groups/centres or organisations.', 'The management needs to know about the four element of food security, the education of staff and students, and use this information to shape communication in a broader sense through a wider discipline.', 1),
(224, 3, NULL, 14, 5, 9, '2013-09-27 00:00:00', NULL, '2.0', '3.0', 'Les recherches se font en partenariat avec le secteur privé. Il est rare de voir des étudiants faire leur mémoire de fin d’études en interne. Donc on peut dire que la situation actuelle est dans la phase 3 mais de manière systématique', 'L’ambition est de consolider les expertises vers l’enseignement. Le transfert de l’expertise acquise au sein du réseau de contacts externes vers l’enseignement doit être systématisé pour que le pôle Agronomie se retrouve en phase 3.', 0),
(225, 3, 3, 16, 4, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '0.0', '2.0', 'No staff/student looks after the food related issues on campus. The cafeteria/catering is leased to outside vendors.', 'If food security is taken seriously at USP, food related issues will be included as part of the policy and management where certain aspects of internal catering are managed by staff and students within their area of expertise. By rethinking of food security management, the university can set an example to the community i.e. as an educational institution the university should "walk the talk".', 0),
(226, 3, 3, 16, 5, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '2.0', '4.0', 'There is contact established by the university with companies and other professionals at individual level who are invited as guest lectures in some of the classes but more stakeholder engagement is required.', 'Regular engagement and recognition need to take place between USP and the food security professional field where secondament or attachments are recognized as part of staff development exercise or as part of the project implementation within the Pacific island countries. This is to bring knowledge and experience from outside directly to students.', 0),
(227, 3, NULL, 14, 6, 9, '2013-09-27 00:00:00', NULL, '2.0', '3.0', 'Il s’agit de savoir dans quel mesure le pôle agronomie a l’intention de créer un centre qui sera l’interface entre l’université et l’extérieur.\r\nL’embryon est présent au sein de l’université de Thiès. C’est l’exemple du BESS (Bureau d’Etude et de Service à la Société) qui est une structure accès pas seulement sur la sécurité alimentaire, mais aussi d’autre type d’expertise. La mission du BESS couvre toute l''université avec des représentants dans toutes les structures de l’université. Le programme de la banque mondiale.\r\nUn groupe d’expert était déjà présent au pôle agronomie. C’est l’exemple de la DCFD implanté à l’ISFAR de Bambey et le CEGEA à l’ENSA qui sont toujours actif. Cependant, avec le BESS l’université est entrain de recruter des experts avec la banque mondiale sur les CDP (contrat de performance) à l''université de Thiès.', 'L’ambition est de réactivé les centres du pôle sous la tutelle du BESS', 0),
(228, 3, 3, 16, 6, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '2.5', '3.5', 'There are certain staff members who teach food security in their respective programmes and there is also a specialized group within the university research clusters that conduct research and community outreach in the area. The PACE-SD looks after climate change research where food security is one of the components.', 'There is a lot of interest in having an integral vision on food security where the formation of a food security expert group at university level is identified. This group could participate more actively in the educational development and to interact directly with stakeholders when required.', 0),
(229, 3, NULL, 14, 8, 9, '2013-09-27 00:00:00', NULL, '1.0', '4.0', 'La phase 1 est déjà acquise. Des projets de recherche ont été financés par l''UE (Union Européenne) et l''UA (Union Africaine) sur la sécurité alimentaire pour le pôle agronomie de l’université de Thiès.', 'L’ambition est une coopération intensive entre l’université et les services externes dans le but de facilité le partage des connaissances.\r\nDe même que pour le critère 2.2, il faut ‘exhumer les cendres’ des précédents centres d’expertise de l’ISFAR et de l’ENSA afin de délivrer de plus grands services externes. Alors l’ambition de niveau 4 sera réalisable.', 0),
(230, 3, 3, 16, 8, 9, '2013-09-27 00:00:00', '2013-10-01 00:00:00', '1.0', '2.0', 'Aspects of food security are present in education both at tertiary and secondary school levels. Research and external services are present within the Ministry of Agriculture where individuals or groups are able to access funds and benefit.', 'The University needs to develop a range of research areas and external services in which food security is expressed clearly as part of the policy. This will enable lecturers and the educational programmes to bridge the gap and work towards to a common goal.', 0),
(231, 3, 3, 16, 9, 9, '2013-09-27 00:00:00', '2013-10-01 00:00:00', '1.0', '2.5', 'The profile of the graduates in certain areas such as food and nutrition and agriculture contain some visible aspects of the major elements of food security but very limited.', 'Food security is to be mentioned explicitly or recognized in the profile of the graduate and that both staff and students should be actively involved in the determination of such food security profile. In this case, a review of programmes such as agriculture, agribusiness and the development of the new food science programme need to be in place to fulfill the four elements of food security. It is also important that regular evaluations and adjustments of the profile need to take place to ensure relevance.', 1),
(232, 3, NULL, 14, 9, 9, '2013-09-27 00:00:00', NULL, '1.0', '2.0', 'Le profil est la liste de compétence que les étudiants peuvent promouvoir dans le marché du travail. Un exemple est donné à l’ISFAR à savoir la maquette pédagogique instaurée au sein même de l’ISFAR permet d’orienter les visions sur les compétences de l’étudiant.', 'Pour décider de la réalisation – ou pas - de l’ambition de niveau 2, un atelier interne sur la définition et les tenants et les aboutissants de la sécurité alimentaire devra être initié. Voir aussi les critères 3.2, 3.4 4.1 et 4.3 ;\r\nLe groupe indique aussi un retard flagrant de la réflexion et de la vision sur la sécurité alimentaire de la part des politiques, alors que le fait de mettre l’accent sur ce problème national est une discussion d’ordre étatique. En effet, une adaptation du profil des étudiants dépendra aussi du contexte national qui éventuellement pourra imposer sa révision.', 0),
(233, 3, 3, 16, 10, 9, '2013-09-27 00:00:00', '2013-10-01 00:00:00', '2.5', '3.0', 'Learning outcomes of certain courses in different disciplines such as geography, food science, biology and agriculture do allow development of reflective attitude in food security but are limited.', 'The education methodology and the learning setting are to be designed in such a way that the student meets realistic situations in which a reflective attitude is recognized. This may also help lecturers to provide feedback to student on a regular basis.', 1),
(234, 3, 3, 16, 11, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', NULL, NULL, NULL, NULL, 0),
(235, 3, 3, 16, 12, 9, '2013-09-27 00:00:00', '2013-10-01 00:00:00', '2.0', '3.0', 'Only those courses that have food security elements in the curriculum do examine relevant aspects of food security in some way somewhere during the course.', 'The University needs to clearly identify programmes and courses that contribute to the fulfillment of the four elements of food security and to ensure a systematic examination of food security subjects are spread over the curriculum in a carefully considered way, taking into account an increasing complexity, study- and examination methods, etc.- This is to be formulated explicitly in the examination regulations', 0),
(236, 3, 3, 16, 13, 9, '2013-09-27 00:00:00', '2013-10-01 00:00:00', '1.5', '3.0', 'Certain progammes and courses contain some aspects of food security but are limited and also taught in isolation.', 'There is a great need to do scoping in order to identify food security gaps in the different disciplines. This will then give way for food security to be implemented systematically in the entire curriculum, in accordance with the profile of the graduate.  The relationship between all education units with respect to food security will be made explicit.- The educational modules containing the knowledge on food security can be organized and placed in an appropriate framework.', 1),
(237, 3, 3, 16, 14, 9, '2013-09-27 00:00:00', '2013-10-01 00:00:00', '2.0', '3.0', 'Curriculum in certain progammes and courses have some elements of food security and that student is gesticulated to develop a reflective attitude however limited i.e. Agriculture, Agribusiness and Food Science. There are opportunities to develop all the four elements of food security.', 'There is a need for a systematic design in the curriculum and have compulsory units from different disciplines to produce an integrated curriculum to address food security. The STAR (strategic total academic review) project should be able to address this deficiency in food security elements within the university.', 0),
(238, 3, NULL, 14, 10, 9, '2013-09-27 00:00:00', NULL, '2.0', '3.0', 'Les spécialisations participent à égalité à la sécurité alimentaire. Les enseignants ont un aperçu pour la demande avant le cours et la fin, puis faire une évaluation pour voir si le but est atteint.Donc une transition entre les modules et les unités d’enseignement doivent se faire ressentir.\r\nCependant, les écoles d’ingénieur sont retissant part rapport au système LMD', 'Il faudra, pour atteindre le niveau de la phase 3, que la mise en place du système LMD intègre les principes de la réflexion des étudiants sur leur apprentissage. Point à aborder lors de l’atelier interne (point 3.1)', 0),
(239, 3, 3, 16, 15, 9, '2013-09-27 00:00:00', '2013-10-01 00:00:00', '1.0', '2.0', 'Some programmes and courses do have practical projects that address some elements of food security but limited.', 'Internships for students need to be mandatory which means creating a food security system for the university and to liaise with the industrial stakeholders to enable the system.', 0),
(240, 3, 3, 16, 16, 9, '2013-09-27 00:00:00', '2013-10-01 00:00:00', '2.0', '4.0', 'The university has Bachelor of Agriculture and Bachelor of Science in Food and Nutrition but specialisation in food security is absent.', 'There is an opportunity to develop food security major or emphasis where relevant courses from various disciplines are combined. This provides a multidisciplinary approach of addressing the four elements of food security within a programme and that provides a unique South Pacific flavour of addressing food security.', 0),
(241, 3, NULL, 14, 12, 9, '2013-09-27 00:00:00', NULL, '1.0', '2.0', 'La condition minimum de la phase 1 est remplie.', 'L’ambition n’est pas forcément d’aller en phase 2, mais ce critère devra être abordé lors de l’atelier interne (point 3.1) pour rendre la sécurité alimentaire ex', 0),
(242, 4, NULL, 12, 2, 9, '2013-09-27 00:00:00', NULL, '2.0', '2.0', 'Food security is included in the University Research policy and in curricula. However, it may not be explicit on certain pillars of food security.\r\nPolicy formulation involves several stages of consultation and negotiations.', 'The consolidation of present situation is the ambition expressed by the group.', 0),
(243, 4, NULL, 12, 3, 9, '2013-09-27 00:00:00', NULL, '3.0', '4.0', 'Internal communication on food security occurs on quite regular basis, as it is the core business of SUA. External communication occurs through exhibitions, however, it might be improved when it comes to outreach towards businesses.', 'It is a desired situation because the promotion of SUA in the chain is a priority of the institution.', 1),
(244, 3, NULL, 14, 13, 9, '2013-09-27 00:00:00', NULL, '2.0', '3.0', 'Les connaissances de base ne sont pas encore intégrées dans le curriculum. Cependant, on peut noter que la phase est liée avec la phase 1 dans le sens où la sécurité alimentaire est intégrée dans le programme.', 'La revision du curriculum intègre bien les questions de sécurité alimentaire.\r\nLa mise en place d''un diplôme sur la sécurité alimentaire est une perspective fortement envisagée', 0),
(245, 3, NULL, 11, 7, 9, '2013-09-27 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(246, 3, NULL, 14, 14, 9, '2013-09-27 00:00:00', NULL, '3.0', '4.0', 'La phase 1 est une évidence car elle est déjà présente dans le pôle agronomie. Les modules sont conçus de telles sortes qu’ils sont liés les uns aux autres. La polyvalence existe déjà dans l''enseignement supérieur et l’éducation est devenue universelle avec le système LMD (Licence, Master, Doctorat).', 'L’ambition dans ce point est la phase 4 avec l’interdisciplinarité à moyen et long terme.', 0),
(247, 3, NULL, 14, 15, 9, '2013-09-27 00:00:00', NULL, '2.0', NULL, 'Ce critère devra être abordé lors de l’atelier interne (point 3.1), en particulier pour ce qui est de\r\n￼￼￼￼￼\r\nAIFSHE / Rapport de l’Université de Thiès – Pôle agronomie (Senegal) : ‐ 7 ‐\r\nla définition précises des aspects de la sécurité alimentaire a prendre en compte dans\r\nl’examination des étudiants.', NULL, 0),
(248, 3, 3, 14, 16, 9, '2013-09-27 00:00:00', '2013-09-27 00:00:00', '0.0', '3.0', 'La sécurité alimentaire est liée à un problème de communication. Avec la certification iso 26000 des écoles privés forment en sécurité alimentaire car il faut noté qu’il ya une très forte développement de l’école supérieur privé au Sénégal.\r\nLa demande dans les entreprises agro- alimentaires est présente. Le MEDS (Mouvement des Entreprises du SENEGAL) participe à améliorer le déphase des étudiants à améliorer la phase école-entreprise.', 'L’ambition dans ce point est que les étudiants parviennent à se spécialiser sur la sécurité alimentaire dans le pôle agronomie de l’université de Thiès.', 0),
(249, 4, NULL, 12, 4, 9, '2013-09-27 00:00:00', NULL, '1.0', '2.0', NULL, 'Internal food management and a situation where students are able to manage some aspect of food provision (cafeteria).\r\nWaste prevention and separation', 1),
(250, 3, NULL, 11, 17, 9, '2013-09-27 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(251, 3, NULL, 14, 17, 9, '2013-09-27 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(252, 4, NULL, 12, 5, 9, '2013-09-27 00:00:00', NULL, '3.0', '3.0', 'In the present situation, we have a good collaboration with research partners in NARIs or Ministry of Agriculture to write research proposals and research articles. Students are also sent on field practical attachments to some companies.\r\nBACAS in the FOA handles consultancies for some companies with bidirectional learning, such as analyses of soil and food samples for companies in DSS & DFS.\r\nProfessional visits from guest lectures are incidental but always invited on the request of SUA. Variations exist between programmes.\r\nFeedback on shortcomings in curriculum are viewed thru lecturers'' visits to companies when they are supervising students in the field.\r\nSUA collaborates with food security CoE under SADC support to address food security including assessment of food security vulnerability and short courses on food security.', 'consolidation of present situation is the ambition', 1),
(253, 4, NULL, 12, 6, 9, '2013-09-27 00:00:00', NULL, '1.0', '2.0', 'Soil water management research programme in existence for over 20 years at the Department of agricultural engineering, \r\nThere is a food security expert team that works with government i.e. the ministry of Agriculture in food security surveillance', 'SUA Centre for Sustainable Rural Development can be contacted to integrate food security component in their work/activities', 1),
(254, 4, NULL, 12, 7, 9, '2013-09-27 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(255, 4, NULL, 12, 8, 9, '2013-09-27 00:00:00', NULL, '2.0', '3.0', NULL, NULL, 0),
(256, 4, NULL, 12, 9, 9, '2013-09-27 00:00:00', NULL, '3.0', '4.0', NULL, NULL, 0),
(257, 4, NULL, 12, 10, 9, '2013-09-27 00:00:00', NULL, '1.0', '3.0', NULL, NULL, 0),
(258, 4, NULL, 12, 12, 9, '2013-09-27 00:00:00', NULL, '4.0', '4.0', NULL, NULL, 0),
(259, 4, NULL, 12, 13, 9, '2013-09-27 00:00:00', NULL, '2.0', '3.0', NULL, NULL, 0),
(260, 4, NULL, 12, 14, 9, '2013-09-27 00:00:00', NULL, '3.0', '3.0', NULL, NULL, 0),
(261, 4, NULL, 12, 15, 9, '2013-09-27 00:00:00', NULL, '3.0', '4.0', NULL, NULL, 0),
(262, 4, NULL, 12, 16, 9, '2013-09-27 00:00:00', NULL, '2.0', '2.0', NULL, NULL, 0),
(263, 3, 3, 21, 1, 9, '2013-09-29 00:00:00', '2013-09-29 00:00:00', '1.0', '3.0', 'Aucun document définissant clairement la sécurité alimentaire n’existe au sein de l''Unité de Formation et de Recherche en Sciences de la Vie et de la Terre (UFR/SVT). Les laboratoires mènent parallèlement leurs activités de façon séparée sans aucune vision définie préalablement par la direction. \r\n   Situation désirée : Niveau 3', 'Le Conseil Scientifique de l''université de Ouagadougou doit proposer un document portant sur la vision de la sécurité alimentaire à l''autorité compétente. \r\nIl faudra dans un proche avenir :\r\n-faire une déclaration de mission au niveau de l’UFR/SVT.\r\n-définir une vision commune pour la sécurité alimentaire. \r\n-mobiliser et galvaniser les intervenants dans le domaine de la sécurité alimentaire au niveau de l’UFR/SVT.', 0),
(264, 3, NULL, 21, 2, 9, '2013-09-29 00:00:00', NULL, '1.0', '3.0', 'La stratégie est implicite; dans les faits, elle est vécue par chacun des acteurs, ce qui ne pourrait pas justifier la phase 2. La différence réside au niveau de la conception des termes employés dans le cadre de projet afin d’attirer l’attention des partenaires. L’Université joue un rôle de leader dans le cadre de la sécurité alimentaire.', 'Le groupe suggère du moment où le Ministère de l''agriculture et de la sécurité alimentaire est créé spécifiquement au Burkina Faso depuis le mois de Janvier 2013, il y a une politique claire au niveau pour se pencher sur la sécurité alimentaire à l’échelle nationale. Ce ministère est l’employeur majeur des étudiants de niveau ingénieur ou Master issus de nos universités. La création de ce ministère est une aubaine, les enseignant de l’UFR/SVT doivent donc prendre la décision d''intégrer clairement la stratégie en matière de sécurité alimentaire dans le contenu des programmes de formation. \r\nIl faudra demander l''appui des institutions, pour atteindre la phase 3. Les enseignants et étudiants doivent participer également au processus; d''où un fond doit être mis à la disposition des intervenants dans un délai de 3 à 4 ans pour atteindre, la phase 3.\r\nTout comme pour la vision que pour la stratégie, le groupe est favorable à la dénomination du ministère de l''agriculture et de la sécurité alimentaire. Cependant, les inquiétudes sont posées par rapport à la mise en œuvre de cette stratégie.', 0),
(265, 3, NULL, 21, 3, 9, '2013-09-29 00:00:00', NULL, '2.0', '3.0', 'Le constat est que les universitaires ne communiquent pas assez sur leurs travaux portant particulièrement sur la sécurité alimentaire. Il y a eu depuis 1999 au moins quatre ateliers internationaux portant sur les sciences alimentaires qui ont été organisés à l’Université, dans le département de Biochimie-Microbiologie. Ces ateliers sans avoir évoqué clairement dans les titres notion de sécurité alimentaire ont été profondément pensés sur la sécurité alimentaire. Cependant, il faut noter que l’atelier organisé du 9 au 11 Avril 2007 avait clairement pour thème : « Application de la chimie en sciences alimentaires et en nutrition pour l’amélioration de la sécurité alimentaire et notionnelle en Afrique ». Cependant, les responsables dudit département ne communiquent pas suffisamment sur la vision de la sécurité alimentaire mais seul le contenu des programmes de formation, et les thématiques de différents laboratoires semblent être les seules formes de communication.', 'Il faudra réaliser encore plus d’efforts dans la communication malgré que l''Université de Ouagadougou soit en réseau sur la vision de la sécurité alimentaire avec certaines Universités Ouest-Africaines.\r\nIl faudra aussi augmenter la visibilité sur le terme "sécurité alimentaire" dans les Emails pour faire passer le message à d''autres intervenants.', 0),
(266, 3, NULL, 21, 4, 9, '2013-09-29 00:00:00', NULL, '0.0', '2.0', 'Le lien n''existe pas. Le groupe note certaines réticences de la part des responsables.', 'Le groupe recommande l’instauration du système de "contrôle qualité" sur les aliments préparés par les restaurants universitaires. Les enseignants et les autorités académiques et celles en charges des œuvres sociales doivent prendre leur responsabilité vis-à-vis de cette situation.', 0),
(267, 3, NULL, 21, 5, 9, '2013-09-29 00:00:00', NULL, '3.0', '4.0', 'Un module de formation sur la sécurité alimentaire existe au sein du département de Biochimie/Microbiologie.\r\nLes experts émanant des directions de la nutrition au niveau du Ministère de la Santé ainsi que ceux de la direction de la sécurité alimentaire au niveau du Ministère de l’Agriculture et de la Sécurité Alimentaire interviennent dans le cadre des enseignements au sein du département de Biochimie/Microbiologie.\r\nDans le programme de Master MAGPA, la sécurité alimentaire est bien mentionnée dans le contenu du programme de formation; ce programme est également appuyé par un projet portant sur la valorisation des huiles locales ainsi que la transformation des produits agroalimentaires.', 'Introduire les notions de sécurité  dans les curricula de l''enseignement secondaire.', 0),
(268, 3, NULL, 21, 6, 9, '2013-09-29 00:00:00', NULL, '1.5', '2.5', 'La structure d''expertise existe au sein de l''université de Ouagadougou. La structure existante relève de la vice-présidence, mais elle n''est pas fonctionnelle certainement pour des contraintes budgétaires et de communication. La compétence existe donc au sein de nos universités. Mais elle est mal exploitée par manque de communication entre l’Université et les différentes entreprises de la place.', 'Il faudra consolider la structure existante au sein de l''université pour la rendre plus opérationnelle et la faire mieux connaître par les partenaires extérieurs désireux de l’expertise des universitaires dans le domaine de la sécurité alimentaire', 0),
(269, 3, NULL, 21, 7, 9, '2013-09-29 00:00:00', NULL, '2.0', '3.0', 'Il existe un plan de carrière régit par le CAMES', 'Plan de carrière en adéquation avec les besoins de l''université', 0),
(270, 3, NULL, 21, 9, 9, '2013-09-29 00:00:00', NULL, '2.0', '4.0', 'Le profil de formation des étudiants comporte des aspects portant sur la sécurité alimentaire. Il est élaboré par les enseignants. Cependant le groupe note que tous éléments de la phase 1 ne sont atteints.', 'Il faudra impliquer les étudiants dans l''élaboration du contenu de programme de formation.', 0),
(271, 3, NULL, 21, 10, 9, '2013-09-29 00:00:00', NULL, '3.5', '4.5', 'Les étudiants ont la possibilité de développer ou de travailler sur les sujets faisant appel à une attitude réflexive. Dans le contenu du programme de formation, le volet heures personnelles de l’étudiant existe, y compris les stages de formations.', 'Il faudra prendre en compte les acquis de la formation et de stage dans l’élaboration des sujets d’évaluation. En d’autres termes, il faut capitaliser tous les acquis.', 0),
(272, 3, NULL, 21, 11, 9, '2013-09-29 00:00:00', NULL, '3.0', '3.0', 'Le rôle de l''enseignant est clairement défini.', NULL, 0),
(273, 3, NULL, 21, 12, 9, '2013-09-29 00:00:00', NULL, '1.5', '2.5', 'L’évaluation tient compte explicitement sur les 4 aspects principaux de la sécurité alimentaire. La disponibilité, l''accessibilité, l''utilisation et la stabilité du processus dans une vision globale.', 'Il faudra tenir compte de la détermination et des définitions de tous les aspects de la sécurité alimentaire.', 0),
(274, 3, NULL, 21, 13, 9, '2013-09-29 00:00:00', NULL, '2.0', '4.5', 'Les connaissances de bases sont intégrées dans le curriculum.', 'Il faudra régulièrement faire recours à l’expertise professionnelle pour améliorer le curriculum.', 0),
(275, 3, NULL, 21, 14, 9, '2013-09-29 00:00:00', NULL, '1.5', '2.5', 'Les initiatives mises en place par les enseignants pour ajuster le contenu de programme, attirent l’attention sur quelques aspects pratiques.', 'Il faudra que le curriculum soit conçu de telle sorte qu’il y ait une cohésion dans l’élaboration des sujets d’évaluation.', 0),
(276, 3, NULL, 21, 15, 9, '2013-09-29 00:00:00', NULL, '1.5', '3.5', 'Il y a une prise en compte de certains aspects de la sécurité alimentaire dans le contenu de programme.', 'Il faudra que la sécurité alimentaire soit principalement traitée de manière exhaustive dans l''élaboration de thème de stages.', 0),
(277, 3, 3, 21, 16, 9, '2013-09-29 00:00:00', '2013-09-29 00:00:00', '1.5', '2.5', 'Les étudiants peuvent choisir un module optionnel lié à la sécurité alimentaire.', 'Il faudra proposer une série de modules traitant spécifiquement de la sécurité alimentaire.\r\nL’université devrait proposer une série de modules optionnels traitant de la sécurité alimentaire sous plusieurs aspects en terme de production alimentaire, qualité nutritionnelle, qualité hygiénique et d’éthique. Les étudiants devraient pouvoir obtenir des diplôme ou certificats spécifiques en matière de sécurité alimentaire. diplôme.', 1),
(278, 3, 3, 21, 17, 9, '2013-09-29 00:00:00', '2013-09-29 00:00:00', '1.0', '1.0', 'Pas encore effectué', NULL, 0),
(279, 3, NULL, 21, 18, 9, '2013-09-29 00:00:00', NULL, '1.0', '1.0', 'Pas encore effectué', 'Pas encore effectué', 0),
(280, 3, NULL, 21, 19, 9, '2013-09-29 00:00:00', NULL, '1.0', '1.0', 'Pas encore effectué', 'Pas encore effectué', 0),
(281, 3, NULL, 21, 20, 9, '2013-09-29 00:00:00', NULL, '1.0', '1.0', 'Pas encore effectué', 'Pas encore effectué', 0),
(282, 3, NULL, 16, 7, 9, '2013-10-01 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(283, 3, NULL, 16, 17, 9, '2013-10-01 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(284, 3, NULL, 16, 18, 9, '2013-10-01 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(285, 3, NULL, 16, 19, 9, '2013-10-01 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(286, 3, NULL, 16, 20, 9, '2013-10-01 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(287, 3, 3, 18, 1, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '2.0', '3.0', 'Dans le contexte sahélien et particulièrement au Niger, un accent est mis sur l''aspect sécurité alimentaire pour le bétail. Bien qu’il soit implicitement pris en compte dans l’expression de la sécurité alimentaire. Il convient de préciser ce point dans la définition globale de la sécurité alimentaire. Il est suggéré au titre de ladite Faculté, l’élaboration d’un document qui spécifie clairement la vision sécurité alimentaire. La phase 2 est acquise et pour aborder la phase 3, ce document qui décrit la vision sur la sécurité alimentaire de la faculté est une condition sine qua non.', 'L’outil AIFSHE servira de base d''évaluation pour la précision de la vision sécurité alimentaire dans la mission officielle de la Faculté. \r\nAussi, la 3ème condition de ce niveau 3, à savoir la participation effective des étudiants et du personnel au processus, est remplie.\r\nLa vision sera partagée avec la Faculté d’Agronomie de l’Université Abdou Moumouni de Niamey.', 1),
(288, 3, 3, 18, 2, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '1.0', '2.0', 'Il sera développé un plan stratégique pour la FASE en termes de sécurité alimentaire.', 'La mise en œuvre d''activités (séances de travail) participatives sera privilégiée pour l''élaboration du document stratégique.', 0),
(289, 3, 3, 18, 3, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '0.0', '1.0', 'Une consolidation des acquis demeure nécessaire.', 'La définition du plan de communication devra être inclue dans l''atelier stratégique.', 0),
(290, 3, 3, 18, 4, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '0.0', '1.0', 'une consolidation des acquis demeure nécessaire.\r\nDes discussions peuvent être menées pour la prise en compte effective de la gestion interne de la sécurité alimentaire.\r\nAu cours de ces dernières années, les thèmes développés aux journées scientifiques de l’étudiant en Agronomie traitaient respectivement de sécurité alimentaire et production animale, sécurité alimentaire et gestion de l’eau d’irrigation. Cette année le slogan était “un étudiant, une parcelle de culture”. Les produits récoltés sont vendus à l’interne.', 'Un début de participation à la gestion de la sécurité alimentaire, mais des discussions peuvent être menées pour la prise en compte effective de la gestion interne de la sécurité alimentaire.\r\nIl existe des exemples au Nigeria où la Faculté d'' Agronomie de l''UAM vend ses produits aux restaurants universitaires et de ce fait contribue à la sécurité alimentaire de l''institution. Les questions de faisabilité en termes de l’égalité, de concurrence sur le marché et de mandat par rapport au gouvernement sont soulevées par des participants. La décision de poursuivre les efforts de la phase 1 vers 2 dépendra d''une discussion interne sur ses points qu''il faut organiser.', 0),
(291, 3, 3, 18, 5, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '2.0', '3.0', 'Déjà, d’importantes séances de formation en divers outils d’évaluation de la sécurité alimentaire (HEA, etc.) ont été effectuées.', 'Des précautions sont à prendre pour consolider la phase 3. L''analyse des expertises nécessaires dépend en effet en premier lieu de l''atelier interne sur la stratégie (critère 1.2) qui les définira sur la base des aspects pertinents tels que les voit la FASE.', 0),
(292, 3, 3, 18, 6, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '2.0', '3.0', 'Possibilité de mettre en place l’équivalent du centre permanent et spécialisé en Agronomie comme le CRESA de l’UAM de Niamey à Maradi ?', 'Il faudra définir clairement le rôle et mode de fonctionnement d’un tel centre dans le plan stratégique.', 1),
(293, 3, 3, 18, 8, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '4.0', '5.0', 'Il s’avère nécessaire de consolider les acquis d’abord  avant de continuer en phase 5.', 'Il s’avère nécessaire de consolider les acquis d’abord  avant de continuer en phase 5.', 0),
(294, 3, 3, 18, 9, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '1.0', '2.0', 'Les aspects de la sécurité alimentaire existent de manière implicite dans les différents profils des diplômés de la Faculté.', 'Le  3ème point de la phase 2 (critère 3.1) sera pris en compte lors de l’atelier sur le plan stratégique.', 0);
INSERT INTO `report_item` (`id`, `created_by`, `modified_by`, `report_id`, `criterion_item_id`, `status`, `created_at`, `modified_at`, `current_situation_rating`, `desired_situation_rating`, `current_situation_comment`, `desired_situation_comment`, `has_high_priority`) VALUES
(295, 3, 3, 18, 10, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '3.0', '4.0', 'La  2ème condition de cette phase 3 (critère 3.2) se fait implicitement à travers surtout les travaux personnels.', NULL, 1),
(296, 3, 3, 18, 12, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '0.0', '1.0', NULL, NULL, 0),
(297, 3, 3, 18, 13, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '2.0', '3.0', NULL, 'Ce niveau sera amélioré avec le plan stratégique', 0),
(298, 3, 3, 18, 14, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '3.0', '3.0', 'La relation entre les différents modules est mise en exergue à travers le planning des interventions.\r\nles cours ne sont pas compartimentés', 'La phase 3 est à consolider; il y a des cas où, dans le curriculum, les conditions de cette phase ne sont pas remplies.', 1),
(299, 3, 3, 18, 15, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '2.0', '3.0', NULL, 'Les objectifs des stages ne sont pas encore écrits; les etudiants déduisent les liens avec la SA plutôt que  de voir le point de départ de toute l’approche pédagogique.', 0),
(300, 3, 3, 18, 16, 9, '2013-10-27 00:00:00', '2013-10-27 00:00:00', '0.0', '1.0', NULL, NULL, 1),
(301, 3, NULL, 18, 7, 9, '2013-10-27 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(302, 3, NULL, 18, 11, 9, '2013-10-27 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(303, 3, NULL, 18, 17, 9, '2013-10-27 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(304, 3, 3, 22, 1, 9, '2013-10-28 00:00:00', '2013-10-28 00:00:00', '1.0', '3.0', 'L’ensemble des participants est d’avis que la direction de l’Institut du Développement Rural a une vision de la sécurité alimentaire mais que cette vision est implicite. Dans le fond, la vision n''est pas explicitée dans la déclaration de mission de l’IDR. Toutefois, la direction offre l''opportunité et des facilités à son personnel de travailler à la réalisation de cette vision de la sécurité alimentaire.', 'Il faut une déclaration de mission au niveau de l''institut qui inclut explicitement la sécurité alimentaire dans les programmes de formation. Le conseil scientifique doit revoir les programmes de formation à l’IDR de façon à  introduire explicitement des formations en matière de sécurité alimentaire.', 1),
(305, 3, NULL, 22, 2, 9, '2013-10-28 00:00:00', NULL, '1.0', '3.0', 'La stratégie mise en place par la direction pour  l’atteinte de la sécurité alimentaire est exclusivement descendante, mais cette stratégie est en grande partie implicite. La collaboration avec certaines ONG est clairement définie sur la base de la vision sécurité alimentaire. Cette vision n’apparaît clairement dans le cadre de la formation classique. Dans ce dernier cas, l’objectif visé pour la sécurité alimentaire est souvent énoncé en termes de production quantitative et qualitative.', 'Rendre explicite la stratégie pour la sécurité alimentaire permettrait de passer en phase 2 où les membres du personnel vont participer activement au processus d’élaboration d’une politique d’intégration de la sécurité alimentaire. La stratégie en matière de sécurité alimentaire sera explicitée dans les documents. \r\nLes plans stratégiques sont liés aux développements à court terme. De ce fait, il est important que nos institutions prennent les décisions explicites dans le processus d''élaboration des stratégies liées à la sécurité alimentaire, et ces décisions devront être validées par le conseil scientifique. Il faut se donner les moyens, notamment financiers pour cela. Le délai pour cette phase ne devrait pas excéder 3 ou 4 ans. \r\nPour la vision comme pour la stratégie, le groupe de travail est favorable compte tenu de la nouvelle dénomination du ministère de l''agriculture qui devient de ce fait Ministère de l’Agriculture et de la Sécurité Alimentaire (MASA).  Toutefois des inquiétudes subsistent réellement quant à la mise en œuvre de la stratégie. Il s’agit le plus souvent du volume financier faible accordé à nos institutions pour leur fonctionnement.', 0),
(306, 3, NULL, 22, 3, 9, '2013-10-28 00:00:00', NULL, '0.0', '2.0', 'La communication sur la sécurité alimentaire au sein de l’institut reste embryonnaire. Toutefois, il faut noter qu’au niveau de l’Institut du Développement Rural, des efforts sont faits pour renforcer l''attention sur la sécurité alimentaire. Les activités de recherche de certains enseignants de l’institut sont centrées sur la sécurité alimentaire. Ces activités font l’objet de rapports d’activités qui sont régulièrement mis à la disposition de la hiérarchie.', 'Le groupe de travail instruit à la direction de l’IDR va adresser des questionnaires aux membres de l’université (enseignants, étudiants, personnel administratif) pour connaître les opinions sur la sécurité alimentaire afin de construire un plan de communication. Toute chose qui devra faciliter l’intégration de la sécurité alimentaire dans l’enseignement, la recherche et les activités opérationnelles.', 1),
(307, 3, NULL, 22, 4, 9, '2013-10-28 00:00:00', NULL, '0.0', '2.0', 'Le groupe audité  a  noté que l''implication n''est pas visible. Certaines réticences sont notées. La difficulté se situé généralement entre la structure qui gère l''alimentation (le CENOU) et les étudiants. Toute tentative d’implication dans la gestion interne de la sécurité alimentaire est perçue comme un contrôle sur la qualité des aliments produits.', 'Le souhait est que la gestion interne de la sécurité alimentaire fasse partie intégrante de la politique de l’organisation. Les étudiants, d’une certaine manière, doivent être impliqués dans la gestion de la sécurité alimentaire. Pour atteindre ce niveau, l’institution doit impliquer le politique.', 0),
(308, 3, NULL, 22, 5, 9, '2013-10-28 00:00:00', NULL, '2.0', '4.0', 'Les participants au compte de l’IDR sont  unanimes que  les enseignants et certains membres du personnel maintiennent des contacts avec les entreprises et/ou les centres d’expertise dans le domaine professionnel, et renforcent ainsi leurs connaissances et leur expérience en matière de sécurité alimentaire. Mais il est à noter que tous les aspects de la sécurité alimentaires ne sont pas pris en compte dans les contacts. Le groupe a toutefois appuyé que chaque enseignant est en lui-même un spécialiste de la sécurité alimentaire d’une certaine façon.', 'Il faut travailler maintenant à développer des échanges réguliers entre  les enseignants tout en impliquant l’enseignement secondaire et le domaine professionnel. Par exemple  dans le cadre d’une mission, pour laquelle le rôle de la sécurité alimentaire  a été explicité : des activités pratiques ont été mises en place et l’enseignement est dispensé.', 0),
(309, 3, NULL, 22, 6, 9, '2013-10-28 00:00:00', NULL, '1.0', '2.0', 'Il est reconnu que les enseignants mènent des activités dans le domaine de la sécurité alimentaire. La cellule de formation continue a appuyé un moment donné les enseignants dans ce sens. Mais aujourd’hui elle est en veille suite à un manque de volume financier. Cette situation est souvent récurrente et entrave le fonctionnement des structures.', 'Il faut travailler à valoriser et à consolider les structures existantes. Il a été recommandé d’être vigilant sur les autres thèmes d’actualité comme les changements climatiques qui sont aussi important et qui peuvent compromettre la sécurité alimentaire.', 0),
(310, 3, NULL, 22, 7, 9, '2013-10-28 00:00:00', NULL, '2.0', '4.0', 'Il a été noté que certains aspects de la sécurité alimentaire sont perçus des diplômés et que les enseignants sont fortement impliqués dans l''élaboration du programme de formation.', 'Il reste à impliquer les anciens étudiants (qui sont dans le monde de l’emploi) dans l''élaboration des curricula', 0),
(311, 3, 3, 22, 8, 9, '2013-10-28 00:00:00', '2013-10-28 00:00:00', '3.0', '4.0', NULL, NULL, 0),
(312, 3, NULL, 22, 9, 9, '2013-10-28 00:00:00', NULL, '2.0', '4.0', 'Il a été noté que certains aspects de la sécurité alimentaire sont perçus des diplômés et que les enseignants sont fortement impliqués dans l''élaboration du programme de formation.', 'Il reste à impliquer les anciens étudiants (qui sont dans le monde de l’emploi) dans l''élaboration des curricula.', 1),
(313, 3, NULL, 22, 10, 9, '2013-10-28 00:00:00', NULL, '3.0', '4.0', 'Le groupe a noté que l''étudiant a la possibilité de développer des réflexions personnelles au cours de sa formation. Cela est senti au niveau des activités pratiques notamment par les stages de terrain.', 'Selon le groupe il faut arriver à prendre en compte toutes les évaluations des étudiants en vu d''améliorer les programmes.', 0),
(314, 3, NULL, 22, 11, 9, '2013-10-28 00:00:00', NULL, NULL, NULL, NULL, NULL, 0),
(315, 3, NULL, 22, 12, 9, '2013-10-28 00:00:00', NULL, '1.0', '2.0', 'Le groupe a noté que les évaluations des étudiants tiennent compte explicitement des quatre aspects de la sécurité alimentaire.', 'Il faudrait définir tous les aspects de la sécurité alimentaire et les prendre en compte dans les évaluations', 0),
(316, 3, NULL, 22, 13, 9, '2013-10-28 00:00:00', NULL, '1.5', '3.0', 'Le  groupe reconnait que les connaissances de base sur la sécurité alimentaire sont intégrées dans la partie introductive du curriculum. Le reste du curriculum contient des éléments relatifs à la sécurité alimentaire, qui s’appuient sur les connaissances de base. Les connaissances de base et les sujets liés à la sécurité alimentaire sont adaptés au profil des étudiants.', 'Il serait souhaitable de prendre en compte systématiquement tous les aspects de la sécurité alimentaire dans les programmes de formation.', 0),
(317, 3, NULL, 22, 14, 9, '2013-10-28 00:00:00', NULL, '1.0', '3.0', 'Des Initiatives personnelles sont prises par des enseignants et permettent d''attirer l''attention sur la sécurité alimentaire.', 'Il serait souhaitable d’établir une suite logique entre les différents cours. Les Curricula devront être spécialement conçus pour permettre aux étudiants de s''impliquer entièrement dans la sécurité alimentaire.', 0),
(318, 3, NULL, 22, 15, 9, '2013-10-28 00:00:00', NULL, '1.0', '3.0', 'Certains aspects de la Sécurité alimentaire sont pris en compte dans le contenu des programmes', 'La sécurité alimentaire devra être un des aspects principaux dans l''élaboration des thèmes de stage.', 0),
(319, 3, 3, 22, 16, 9, '2013-10-28 00:00:00', '2013-10-28 00:00:00', '0.0', '2.0', 'Le groupe retient que le niveau actuel des programmes de formation ne permet pas aux étudiants de choisir un module optionnel lié à la sécurité alimentaire', 'Il faut travailler à proposer une série de modules traitant spécialement de la sécurité alimentaire', 0),
(320, 3, 3, 19, 1, 0, '2013-10-28 00:00:00', '2014-07-20 06:44:24', '2.0', '4.0', NULL, NULL, NULL),
(321, 3, 3, 19, 2, 0, '2013-10-28 00:00:00', '2014-07-20 06:44:24', '2.0', '3.0', NULL, NULL, NULL),
(322, 3, 3, 19, 3, 0, '2013-10-28 00:00:00', '2014-07-20 06:44:24', '2.0', '3.0', NULL, NULL, NULL),
(323, 3, 3, 19, 5, 0, '2013-10-28 00:00:00', '2014-07-20 06:44:24', '3.0', '5.0', NULL, NULL, NULL),
(324, 3, 3, 19, 6, 0, '2013-10-28 00:00:00', '2014-07-20 06:44:24', '2.0', '3.0', NULL, NULL, NULL),
(325, 3, 3, 19, 8, 0, '2013-10-28 00:00:00', '2014-07-20 06:44:24', '2.0', '3.0', NULL, NULL, NULL),
(326, 3, 3, 19, 9, 0, '2013-10-28 00:00:00', '2014-07-20 06:44:24', '1.0', '3.0', NULL, NULL, NULL),
(327, 3, 3, 19, 10, 0, '2013-10-28 00:00:00', '2014-07-20 06:44:24', '2.0', '4.0', NULL, NULL, 1),
(328, 3, 3, 19, 12, 0, '2013-10-28 00:00:00', '2014-07-20 06:44:24', '2.0', '3.0', NULL, NULL, NULL),
(329, 3, 3, 19, 13, 0, '2013-10-28 00:00:00', '2014-07-20 06:44:24', '1.0', '4.0', NULL, NULL, 1),
(330, 3, 3, 19, 14, 0, '2013-10-28 00:00:00', '2014-07-20 06:44:24', '1.0', '3.0', NULL, NULL, NULL),
(331, 3, 3, 19, 15, 0, '2013-10-28 00:00:00', '2014-07-20 06:44:24', '1.0', '3.0', NULL, NULL, NULL),
(332, 3, 3, 19, 16, 0, '2013-10-28 00:00:00', '2014-07-20 06:44:24', '1.0', '2.0', NULL, NULL, NULL),
(333, 3, 3, 20, 1, 0, '2013-10-28 00:00:00', '2014-07-09 16:13:05', NULL, NULL, NULL, NULL, 0),
(334, 3, 3, 23, 1, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', '1.0', '1', '1', NULL),
(335, 3, 3, 23, 2, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', '1.0', '1', '1', NULL),
(336, 3, 3, 23, 4, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', '1.0', NULL, NULL, NULL),
(337, 3, 3, 23, 3, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', '1.0', NULL, NULL, 1),
(338, 3, 3, 23, 6, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', '1.0', NULL, NULL, 1),
(339, 3, 3, 23, 8, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', NULL, NULL, NULL, NULL),
(340, 3, 3, 23, 5, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', '1.0', NULL, NULL, NULL),
(341, 3, 3, 23, 7, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', '1.0', NULL, NULL, NULL),
(342, 3, 3, 23, 9, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', NULL, NULL, NULL, 1),
(343, 3, 3, 23, 11, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', NULL, NULL, NULL, NULL),
(344, 3, 3, 23, 10, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', '1.0', NULL, NULL, NULL),
(345, 3, 3, 23, 12, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', '1.0', NULL, NULL, NULL),
(346, 3, 3, 23, 13, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', NULL, NULL, NULL, 1),
(347, 3, 3, 23, 14, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', NULL, NULL, NULL, NULL),
(348, 3, 3, 23, 15, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', NULL, NULL, NULL, 1),
(349, 3, 3, 23, 16, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', '1.0', NULL, NULL, NULL),
(350, 3, 3, 23, 17, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', '1.0', NULL, NULL, 1),
(351, 3, 3, 23, 18, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', NULL, NULL, NULL, NULL),
(352, 3, 3, 23, 20, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', '1.0', NULL, NULL, NULL),
(353, 3, 3, 23, 19, 0, '2014-01-06 11:32:50', '2014-01-06 11:40:46', '1.0', NULL, NULL, NULL, NULL),
(354, 3, 3, 24, 1, 0, '2014-01-06 11:38:00', '2014-01-06 11:41:07', '1.0', '1.0', NULL, NULL, NULL),
(355, 3, 3, 24, 2, 0, '2014-01-06 11:38:00', '2014-01-06 11:41:07', '1.0', '1.0', NULL, NULL, NULL),
(356, 3, 3, 24, 3, 0, '2014-01-06 11:38:00', '2014-01-06 11:41:07', '1.0', '1.0', NULL, NULL, NULL),
(357, 3, 3, 24, 4, 0, '2014-01-06 11:38:00', '2014-01-06 11:41:07', '1.0', '1.0', NULL, NULL, NULL),
(358, 3, 3, 24, 5, 0, '2014-01-06 11:38:00', '2014-01-06 11:41:07', '1.0', '1.0', NULL, NULL, NULL),
(359, 3, 3, 25, 1, 0, '2014-01-06 11:40:45', '2014-01-06 11:41:01', '2.0', '4.0', NULL, NULL, NULL),
(360, 3, 3, 25, 2, 0, '2014-01-06 11:40:45', '2014-01-06 11:41:01', '2.0', '4.0', NULL, NULL, NULL),
(361, 3, 3, 25, 3, 0, '2014-01-06 11:40:45', '2014-01-06 11:41:01', '2.0', '3.5', NULL, NULL, NULL),
(362, 3, 3, 25, 4, 0, '2014-01-06 11:40:45', '2014-01-06 11:41:01', '2.5', '3.5', NULL, NULL, NULL),
(363, 3, 3, 25, 5, 0, '2014-01-06 11:40:45', '2014-01-06 11:41:01', '1.5', '2.5', NULL, NULL, NULL),
(364, 3, NULL, 26, 1, 9, '2014-01-06 11:41:32', NULL, '1.0', '4.0', 'test info', 'some more test info', NULL),
(365, 3, NULL, 26, 2, 9, '2014-01-06 11:41:32', NULL, '4.0', '5.0', 'little more testing', 'and even more testing!', NULL),
(366, 3, NULL, 26, 4, 9, '2014-01-06 11:41:32', NULL, '3.0', '4.5', NULL, NULL, NULL),
(367, 3, 2, 26, 3, 9, '2014-01-06 11:41:32', '2014-08-08 14:07:59', '0.0', '4.5', NULL, NULL, 1),
(368, 3, NULL, 26, 6, 9, '2014-01-06 11:41:32', NULL, '3.0', '4.0', NULL, NULL, 1),
(369, 3, NULL, 26, 8, 9, '2014-01-06 11:41:32', NULL, '3.0', NULL, NULL, NULL, NULL),
(370, 3, NULL, 26, 5, 9, '2014-01-06 11:41:32', NULL, '3.0', '4.0', NULL, NULL, NULL),
(371, 3, NULL, 26, 7, 9, '2014-01-06 11:41:32', NULL, '0.0', '2.0', NULL, NULL, NULL),
(372, 3, NULL, 26, 9, 9, '2014-01-06 11:41:32', NULL, '1.0', NULL, NULL, NULL, 1),
(373, 3, NULL, 26, 11, 9, '2014-01-06 11:41:32', NULL, '1.5', NULL, NULL, NULL, NULL),
(374, 3, NULL, 26, 10, 9, '2014-01-06 11:41:32', NULL, '3.0', '4.0', NULL, NULL, NULL),
(375, 3, NULL, 26, 12, 9, '2014-01-06 11:41:32', NULL, '1.0', '3.0', NULL, NULL, NULL),
(376, 3, NULL, 26, 13, 9, '2014-01-06 11:41:32', NULL, '2.5', NULL, NULL, NULL, 1),
(377, 3, NULL, 26, 14, 9, '2014-01-06 11:41:32', NULL, '3.0', NULL, NULL, NULL, NULL),
(378, 3, NULL, 26, 15, 9, '2014-01-06 11:41:32', NULL, '3.0', NULL, NULL, NULL, 1),
(379, 3, NULL, 26, 16, 9, '2014-01-06 11:41:32', NULL, '1.0', '4.0', NULL, NULL, NULL),
(380, 3, NULL, 26, 17, 9, '2014-01-06 11:41:32', NULL, '1.5', '3.0', NULL, NULL, 1),
(381, 3, NULL, 26, 18, 9, '2014-01-06 11:41:32', NULL, '3.0', NULL, NULL, NULL, NULL),
(382, 3, NULL, 26, 20, 9, '2014-01-06 11:41:32', NULL, '0.0', '3.0', NULL, NULL, NULL),
(383, 3, NULL, 26, 19, 9, '2014-01-06 11:41:32', NULL, '2.0', NULL, NULL, NULL, NULL),
(384, 3, 3, 27, 1, 0, '2014-01-06 11:49:28', '2014-07-20 06:43:23', '2.0', '4.0', NULL, NULL, NULL),
(385, 3, 3, 27, 2, 0, '2014-01-06 11:49:28', '2014-07-20 06:43:23', '2.0', '4.0', NULL, NULL, NULL),
(386, 3, 3, 27, 3, 0, '2014-01-06 11:49:28', '2014-07-20 06:43:23', '2.0', '3.5', NULL, NULL, NULL),
(387, 3, 3, 27, 4, 0, '2014-01-06 11:49:28', '2014-07-20 06:43:23', '2.5', '3.5', NULL, NULL, NULL),
(388, 3, 3, 27, 5, 0, '2014-01-06 11:49:28', '2014-07-20 06:43:23', '1.5', '2.5', NULL, NULL, NULL),
(389, 3, 3, 28, 1, 0, '2014-01-06 11:49:47', '2014-07-20 06:43:11', '2.0', '4.0', NULL, NULL, NULL),
(390, 3, 3, 28, 2, 0, '2014-01-06 11:49:47', '2014-07-20 06:43:11', '2.0', '4.0', NULL, NULL, NULL),
(391, 3, 3, 28, 3, 0, '2014-01-06 11:49:47', '2014-07-20 06:43:11', '2.0', '3.5', NULL, NULL, NULL),
(392, 3, 3, 28, 4, 0, '2014-01-06 11:49:47', '2014-07-20 06:43:11', '2.5', '3.5', NULL, NULL, NULL),
(393, 3, 3, 28, 5, 0, '2014-01-06 11:49:47', '2014-07-20 06:43:11', '1.5', '2.5', NULL, NULL, NULL),
(394, 3, 3, 29, 1, 0, '2014-01-06 11:50:33', '2014-07-20 06:43:00', '2.0', '4.0', NULL, NULL, NULL),
(395, 3, 3, 29, 2, 0, '2014-01-06 11:50:33', '2014-07-20 06:43:00', '2.0', '4.0', NULL, NULL, NULL),
(396, 3, 3, 29, 3, 0, '2014-01-06 11:50:33', '2014-07-20 06:43:00', '2.0', '3.5', NULL, NULL, NULL),
(397, 3, 3, 29, 4, 0, '2014-01-06 11:50:33', '2014-07-20 06:43:00', '2.5', '3.5', NULL, NULL, NULL),
(398, 3, 3, 29, 5, 0, '2014-01-06 11:50:33', '2014-07-20 06:43:00', '1.5', '2.5', NULL, NULL, NULL),
(399, 3, 3, 30, 1, 9, '2014-07-20 06:18:56', '2014-10-06 20:18:10', '1.0', '3.0', 'It was confirmed from the self-assessment that vision of the institution was not clear and readily accessible by the students. Further, it was agreed that students were not fully involved in the development of the vision.The lecturers in attendance agreed to revisit the vision, to involve students and make it more conspicuous for all. \r\nA discussion still have to be initiated in order to decide whether the actual vision of the university states as ‘mission statement’ too, en whether it fully captures the concept of food security.', 'To have a clear explicit vision by stakeholder involvement', 1),
(400, 3, 3, 30, 2, 9, '2014-07-20 06:19:22', '2014-10-06 20:25:15', '1.0', '2.0', 'It was determined from the self-assessment that there are policies in place, but there are not fully consolidated to enhance the realization of the institution’s goals. It was determined important to involve students in the policy making and it was agreed that in charting the way forward the inclusion of students in the making of policies will be emphasized.', NULL, 0),
(401, 3, 3, 30, 3, 9, '2014-07-20 06:20:03', '2014-10-06 20:26:14', '1.0', '2.0', 'Communication between the university and the rest of the community was considered important for the growth of the university. Availing relevant documents and materials regularly to students was encouraged and students were also encouraged to be actively involved in issues related to food security by being active during career weeks, or in similar events held in the university or outside. Meaningful contact with the community and the business world was strongly encouraged as a means of reaching such target. However, improving delivery of information from the university to the other stakeholders is an important way that the university should embark on.', NULL, 1),
(402, 3, 3, 30, 4, 9, '2014-07-20 06:20:41', '2014-10-06 20:26:49', '1.5', '3.0', 'Under this criterion, individual staff members or students look after the internal environmental management. From the self-assessmentit was clear that people, especially students, get food but they do not know where it comes from and they do not seem to care or question the environmental effects of producing that food. Certain internal environmental management policies are not effectively managed in spite of the existence of some environmental management policy at the institutional level. \r\nHowever, one of the students initiative called Centre for Sustainable Rural Development provides catering based on boiled food instead of fried, and awareness is emerging slowly about food quality among lecturers and students.', NULL, 0),
(403, 3, 3, 30, 5, 9, '2014-07-20 06:21:05', '2014-10-06 20:27:06', '1.0', '2.0', 'The university has not made a lot of meaningful progress and it was suggested that inviting more guest speakers to the university was encouraged. Some of these activities are normally not covered in the university budget and this is the argument behind the low number of guest speakers coming to the university. When these events are held in the institution, students are strongly encouraged to attend such seminars. Lecturers were also encouraged to create awareness among the university community as a way of raising attendance.', NULL, 0),
(404, 3, 3, 30, 6, 9, '2014-07-20 06:21:41', '2014-10-06 20:27:47', '1.0', '2.0', 'Within this criterion, it is presumed that there exist a permanent group of staff members that possesses large and deeply integrated knowledge and expertise on sustainable development. Of the five stages, the University was ranked to be on stage 2 implying that much more needs to be done to strengthen such groups in order to ensure that it fulfills its role on food security. Lecturers were commended for keeping up with knowledge and bringing it to the classroom in their fields of focus. Creating new knowledge or creating a food security center was considered important in creating greater awareness in the area of food security. Support from the institution is an important way of nurturing the expert groups.', NULL, 0),
(405, 3, 3, 30, 7, 9, '2014-07-20 06:21:49', '2014-10-06 20:07:33', '2.0', '3.0', NULL, NULL, 0),
(406, 3, 3, 30, 8, 9, '2014-07-20 06:22:12', '2014-10-06 20:18:34', '1.0', '2.0', 'Lecturers come together in teams to offer consultancy services. Projects with funding support from NORAD (Norway’s Agency for Development Cooperation) have addressed food security.\r\nAchievement of this desired situation will strongly depend on the results of criterion 1.3 in terms of external communication.', NULL, 0),
(407, 3, 3, 30, 9, 9, '2014-07-20 06:22:47', '2014-10-06 20:20:10', '1.0', '2.0', 'This criterion entails the education program goals, professional profile, as well as professional competencies. It was concluded that food security is incorporated in the profile of the graduate though not explicitly. The goal ofUniversity is to produce graduates capable of broadly adapting to the labor market; as opposed to narrowing down on to just food security as a program. The institution’s assessment of the job market is that it requires a broadly knowledgeable graduate. However, it was suggested that the food security should be clearly integrated in the graduate’s profile. Overall, theself-assessmentrated the institution to be on stage 3, meaning that the graduate profile contains most of the aspects of food security.\r\nPeer review: Food security is not explicitly mentioned as the criteria at stage 2 demands therefore we audited the profile of the graduate between 1 and 2.', NULL, 0),
(408, 3, 3, 30, 10, 9, '2014-07-20 06:23:29', '2014-10-04 10:08:04', '3.0', NULL, NULL, NULL, 0),
(409, 3, 3, 30, 11, 9, '2014-07-20 06:23:36', '2014-10-04 10:08:05', '2.0', NULL, NULL, NULL, 0),
(410, 3, 3, 30, 12, 9, '2014-07-20 06:23:44', '2014-10-04 10:08:06', '2.0', NULL, NULL, NULL, 0),
(411, 3, 3, 30, 13, 9, '2014-07-20 06:24:13', '2014-10-06 20:14:39', '1.0', '3.0', 'On this criterion the institution was ranked to be on stage 3. This implies that educational trips, classes, attachments and  research have been availed to students. It was however recommended that intensifying the situation will be necessary. In terms of the curriculum, there is a clear, explicit linkage between the different units studied to food security, for example topics on environmental management, food industry, disease control and farming systems. This implies that the institution is at a fairly advance stage, but still improvements are necessary.\r\nPeer review: FS is not set by management, but rather certain modules contain relevant aspects. Therefore we have audited this criteria at 1.', NULL, 0),
(412, 3, NULL, 30, 14, 9, '2014-07-20 06:24:40', NULL, '3.0', '3.0', 'Lecturers systematicallyintegrate the components of food security in the daily teaching practice. MSc and PhD studies are already at Stage 3, where courses explicitly integrate food security. We need now to consider multi-disciplinarity; for example, water management and engineering have to work together with economics.', NULL, 0),
(413, 3, NULL, 30, 15, 9, '2014-07-20 06:25:05', NULL, '0.0', '0.0', 'It was clear that there is no specialization to food security in the school. For instance the degree content does not have majors or minors in food security. The institution has chosen this approach on purpose in order to avoid limiting the students once they graduate to the job market. However, the consensus was that in terms of traineeships in the area of food security, the institution has a lot of room to improve in order to include food security explicitly in its training.', NULL, 0),
(414, 3, NULL, 30, 16, 9, '2014-07-20 06:25:16', NULL, NULL, NULL, NULL, NULL, 0),
(415, 3, 3, 31, 1, 9, '2014-07-20 15:35:03', '2014-07-20 15:39:47', '3.0', '4.0', NULL, NULL, 1),
(416, 3, 3, 31, 6, 9, '2014-07-20 15:37:45', '2014-10-06 20:19:21', '1.0', '2.0', NULL, NULL, 0),
(417, 3, NULL, 31, 14, 9, '2014-07-20 15:46:03', NULL, NULL, NULL, NULL, NULL, 1),
(418, 3, 3, 33, 1, 0, '2014-10-05 20:16:07', '2014-10-07 13:11:49', '3.0', NULL, 'lorem ipsum', NULL, 0),
(419, 3, 3, 31, 3, 9, '2014-10-06 20:17:29', '2014-10-06 20:18:12', '1.0', '2.0', NULL, NULL, 0),
(420, 3, 3, 31, 4, 9, '2014-10-06 20:18:38', '2014-10-06 20:21:52', '1.5', '3.0', NULL, NULL, 0),
(421, 3, NULL, 31, 5, 9, '2014-10-06 20:18:58', NULL, '1.0', '1.5', NULL, NULL, 0),
(422, 3, 3, 31, 7, 9, '2014-10-06 20:22:01', '2014-10-06 20:22:09', '1.5', '3.5', NULL, NULL, NULL),
(423, 3, 3, 36, 1, 9, '2014-10-07 15:39:00', '2014-10-08 14:11:51', '2.0', '3.0', 'In de missie en visie komt food security wel tot uiting. De studenten hebben wel de skills en vaardigheden. Het doel is om goed opgeleide krachten te leveren in alle perspectieven wat de markt vraagt. \r\nStage 1: Wel het geval. \r\nStage 2: Wel het geval. Er is een eigen visie die wel past in food security. Tweede voorwaarde wel het geval, want er is bijeengekomen voor FNS.', 'Stage 3: Food security is niet gedocumenteerd in de visie. Het doel is om een lab op te zetten. Mensen zijn aangetrokken. Grootste orientatie binnen agrarische productie is agro processing. De studenten worden niet aangetrokken in het schrijven van de visie. Bij de evaluatie van de vakken wordt wel de cohort meegenoment.', 1),
(424, 3, 3, 36, 2, 9, '2014-10-07 15:39:25', '2014-10-08 14:13:19', '1.0', '3.0', 'Heeft te maken met beleid, doelstellingen (studenten, regering, personeel). Het belangrijkste hierbij is de studiegids, waarin alle vakken beschreven zijn. Er vindt zelf evaluatie plaats en rapporten zoals jaarrapport zijn aanwezig. Er worden trainingen verzorgd in fyto-sanitaire maatregelen, waarbij externe docenten worden betrokken bijv. Dr. Ansari van Guyana. Speerpunten, swot analyse etc zijn samengesteld door management en docenten. \r\nVoorbij stage 1, want er zijn geen losse eilandjes.', 'Stage 2: Alle actoren aanwezig, behalve studenten. \r\nTweede punt: Niet. \r\nHuidige situatie is 1.8, als er gewerkt wordt eraan, kan het makkelijk binnen een jaar in stage 3 veranderen.', 1),
(425, 3, 3, 36, 3, 9, '2014-10-07 15:39:42', '2014-10-08 14:14:10', '2.5', '4.0', 'Interne en externe communicatie.\r\nInterne communicatie: management tot studenten, studenten vereniging, staff hoek, social media. \r\nStage 1: Wel het geval, zonder problemen. \r\nStage 2: Regelmatig? FNS komt wel tevoorschijn tijdens afstudeer, seminars. Er zijn hier en daar wel een paar documenten maar er is niet echt focused erop.', 'Stage 3: Onder indruk van de video''s. De studenten zijn wel gemotiveerd. \r\nNiet expliciet. \r\nAmbitie richting 4.', 1),
(426, 3, 3, 36, 4, 9, '2014-10-07 15:40:00', '2014-10-08 14:14:52', '1.0', '2.0', 'De voedesel die op de universiteit wordt verkocht voldoet niet aan de normen van FNS (junkfood).', 'Ambitie is om te gaan naar stage 2 door intern proberen te lobbien. Een toekomstplan van de richtings coordinator is om een systeem te hebben waarbij studenten zelf planten op ADEK en deze in de kantine verkopen.', 0),
(427, 3, 3, 36, 5, 9, '2014-10-07 17:42:30', '2014-10-08 14:15:32', '2.5', '3.0', 'Stage 1 en 2 wel. \r\nVakinhoud is jarenlang niet update. Er is wel een semester planning, in de studiegids staat er aangegeven welk object de docent zal behandelen. Als de docent zich niet daaraan houdt kunnen de studenten dat wel doorgeven. De universiteit is bezig met het professionalisering van de staff. Dit hangt ook af van de staff zelf.', 'De ambitie is om richting 3 te gaan.', 0),
(428, 3, 3, 36, 6, 9, '2014-10-07 17:42:49', '2014-10-08 13:29:48', '2.0', '3.0', 'Hierbij gaat het erom als de departement de ambitie heeft om een groep mensen op te richten als consultancy.', 'Doel is om een stichting op te richten met een logo.', 0),
(429, 3, NULL, 36, 7, 9, '2014-10-07 17:43:02', NULL, NULL, NULL, NULL, NULL, 0),
(430, 3, 3, 36, 8, 9, '2014-10-07 17:43:19', '2014-10-08 13:46:13', '1.0', NULL, 'Stage 1: Er vindt vaker onderzoek plaats, maar de informatie wordt niet doorgespeeld. Het punt is in hoeverre partijen betalen buiten de universiteit.', 'Er is voorlopig geen ambitie naar stage 2, afhankelijk van fase 2.1., 2.4 kan eerder ontwikkeld worden.', 0),
(431, 3, 3, 36, 9, 9, '2014-10-07 17:43:39', '2014-10-08 13:51:12', '1.0', '3.0', 'Stage 1: Alle aspecten aanwezig.', 'Stage 2: Niet expliciet aanwezig. Wordt wel op verschillende plekken gebruikt. \r\nEerste conditie niet voldaan, maar er wordt gewerkt eraan. Uit de 4 voorwaarden komt stability niet helemaal tot uiting. \r\nLaatste voorwaarde van stage 2: Profiel van afgestudeerde komt wel aan de orde, dus er wordt gestreefd naar stage 2 of meer.', 0),
(432, 3, 3, 36, 10, 9, '2014-10-07 17:43:55', '2014-10-08 14:17:31', '3.0', '4.0', 'Dit is de enigste stap waarbij food security niet aan de orde komt. In de programma momenten opgebouwd waarbij studenten zijn.', 'Stage 3 met ambitie naar stage 4.', 0),
(433, 3, NULL, 36, 11, 9, '2014-10-07 17:44:08', NULL, NULL, NULL, NULL, NULL, 0),
(434, 3, 3, 36, 12, 9, '2014-10-07 17:44:21', '2014-10-08 14:00:56', '1.0', '4.0', 'Stage 1: Wel. De 4  elementen (acces, availability, food quality & stability) komen wel voor in vakken die verzorgd worden.', 'Stage 2: niet alle 4 elementen expliciet aanwezig (met de nadruk op stability). \r\nFase 1 al bereikt, ambitie naar fase 2-3-4\r\nEr moet gekeken worden wat de doelstelling van de ministerie van LVV is, dan een afstudeer kiezen die hiermee te maken heeft. \r\nZaken die er al zijn formuleren en bestaande processen documenteren.', 0),
(435, 3, 3, 36, 13, 9, '2014-10-07 17:46:26', '2014-10-08 14:02:16', '1.5', '2.0', '1.5-2', NULL, 0),
(436, 3, 3, 36, 14, 9, '2014-10-07 18:23:37', '2014-10-08 14:04:28', '2.0', '4.0', 'Fase 2: Stap 2: Wat er plaatsvindt bij sustainability moet ook plaatsvinden bij food security.', NULL, 0),
(437, 3, NULL, 36, 15, 9, '2014-10-07 18:23:51', NULL, '2.0', '3.0', NULL, NULL, 0),
(438, 3, 3, 36, 16, 9, '2014-10-07 18:24:03', '2014-10-08 14:29:02', '0.0', NULL, 'De bedoeling is om food security te intergreren in alle orientaties van de richting. Er komt niet een aparte studie richting of orientatie ''Food Security''. Er moet gekeken worden naar de profielen van de vakken en gekozen worden waar dit wel integreerd kan worden.', 'Er moet niets aangetrokken worden van de lengte van de peilen, soms hoe korter de peil hoe ambitieuzer. Clusteren voor implementeren. Samenwerken binnen het netwerk met externe stakeholders. Deeltijds docenten moeten niet beschouwd worden als contact persoon van de bedrijven. Een kleine boer kan ook beschouwd worden als een bedrijf. Uit de uitspraken en meningen van hun kan info meegenomen worden. \r\nOrganiseren van interne studenten + docenten en externe workshops, wat wel gewerkt heeft in Trinidad. Alumnis oogpunt ook meenemen. door deze programma is de onderbouwing veel beter als geldschieters willen investeren.', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certification`
--
ALTER TABLE `certification`
  ADD CONSTRAINT `FK_6C3C6D7525F94802` FOREIGN KEY (`modified_by`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_6C3C6D75DE12AB56` FOREIGN KEY (`created_by`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `certification_requirement`
--
ALTER TABLE `certification_requirement`
  ADD CONSTRAINT `FK_6AB3DA731949DCF0` FOREIGN KEY (`certification_requirement_id`) REFERENCES `certification` (`id`),
  ADD CONSTRAINT `FK_6AB3DA7325F94802` FOREIGN KEY (`modified_by`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_6AB3DA7331A5B285` FOREIGN KEY (`criterion_item_id`) REFERENCES `criterion_item` (`id`),
  ADD CONSTRAINT `FK_6AB3DA73DE12AB56` FOREIGN KEY (`created_by`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `chart`
--
ALTER TABLE `chart`
  ADD CONSTRAINT `FK_E5562A2A25F94802` FOREIGN KEY (`modified_by`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_E5562A2A4BD2A4C0` FOREIGN KEY (`report_id`) REFERENCES `report` (`id`),
  ADD CONSTRAINT `FK_E5562A2ADE12AB56` FOREIGN KEY (`created_by`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `criterion`
--
ALTER TABLE `criterion`
  ADD CONSTRAINT `FK_7C82227125F94802` FOREIGN KEY (`modified_by`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_7C822271DE12AB56` FOREIGN KEY (`created_by`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `criterion_item`
--
ALTER TABLE `criterion_item`
  ADD CONSTRAINT `FK_ED8C02DB25F94802` FOREIGN KEY (`modified_by`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_ED8C02DB97766307` FOREIGN KEY (`criterion_id`) REFERENCES `criterion` (`id`),
  ADD CONSTRAINT `FK_ED8C02DBDE12AB56` FOREIGN KEY (`created_by`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `criterion_item_translation`
--
ALTER TABLE `criterion_item_translation`
  ADD CONSTRAINT `FK_A8D6508125F94802` FOREIGN KEY (`modified_by`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_A8D6508131A5B285` FOREIGN KEY (`criterion_item_id`) REFERENCES `criterion_item` (`id`),
  ADD CONSTRAINT `FK_A8D65081DE12AB56` FOREIGN KEY (`created_by`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `criterion_translation`
--
ALTER TABLE `criterion_translation`
  ADD CONSTRAINT `FK_7FACE5E125F94802` FOREIGN KEY (`modified_by`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_7FACE5E197766307` FOREIGN KEY (`criterion_id`) REFERENCES `criterion` (`id`),
  ADD CONSTRAINT `FK_7FACE5E1DE12AB56` FOREIGN KEY (`created_by`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `fos_user`
--
ALTER TABLE `fos_user`
  ADD CONSTRAINT `FK_957A647910405986` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`);

--
-- Constraints for table `fos_user_group`
--
ALTER TABLE `fos_user_group`
  ADD CONSTRAINT `FK_583D1F3EFE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_group` (`id`),
  ADD CONSTRAINT `FK_583D1F3EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `fos_user_institution`
--
ALTER TABLE `fos_user_institution`
  ADD CONSTRAINT `FK_5CA566E410405986` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`),
  ADD CONSTRAINT `FK_5CA566E4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `fos_user_report`
--
ALTER TABLE `fos_user_report`
  ADD CONSTRAINT `FK_EE75A14B4BD2A4C0` FOREIGN KEY (`report_id`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_EE75A14BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `report` (`id`);

--
-- Constraints for table `institution`
--
ALTER TABLE `institution`
  ADD CONSTRAINT `FK_3A9F98E525F94802` FOREIGN KEY (`modified_by`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_3A9F98E5DE12AB56` FOREIGN KEY (`created_by`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `offline_tool`
--
ALTER TABLE `offline_tool`
  ADD CONSTRAINT `FK_83CC4FC25F94802` FOREIGN KEY (`modified_by`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_83CC4FCDE12AB56` FOREIGN KEY (`created_by`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `page`
--
ALTER TABLE `page`
  ADD CONSTRAINT `FK_140AB62025F94802` FOREIGN KEY (`modified_by`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_140AB620DE12AB56` FOREIGN KEY (`created_by`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `page_translation`
--
ALTER TABLE `page_translation`
  ADD CONSTRAINT `FK_A3D51B1D25F94802` FOREIGN KEY (`modified_by`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_A3D51B1DC4663E4` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`),
  ADD CONSTRAINT `FK_A3D51B1DDE12AB56` FOREIGN KEY (`created_by`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `FK_C42F778410405986` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`),
  ADD CONSTRAINT `FK_C42F778425F94802` FOREIGN KEY (`modified_by`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_C42F7784DE12AB56` FOREIGN KEY (`created_by`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `report_item`
--
ALTER TABLE `report_item`
  ADD CONSTRAINT `FK_6C37C8E525F94802` FOREIGN KEY (`modified_by`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_6C37C8E531A5B285` FOREIGN KEY (`criterion_item_id`) REFERENCES `criterion_item` (`id`),
  ADD CONSTRAINT `FK_6C37C8E54BD2A4C0` FOREIGN KEY (`report_id`) REFERENCES `report` (`id`),
  ADD CONSTRAINT `FK_6C37C8E5DE12AB56` FOREIGN KEY (`created_by`) REFERENCES `fos_user` (`id`);
