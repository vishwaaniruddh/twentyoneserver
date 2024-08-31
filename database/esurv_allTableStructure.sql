-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 31, 2024 at 03:43 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esurv`
--

-- --------------------------------------------------------

--
-- Table structure for table `ac_1`
--

DROP TABLE IF EXISTS `ac_1`;
CREATE TABLE IF NOT EXISTS `ac_1` (
  `record_no` int(50) NOT NULL,
  `TdateTime` datetime NOT NULL,
  `VL` varchar(250) NOT NULL,
  `IL` varchar(250) NOT NULL,
  `KW` varchar(250) NOT NULL,
  `PF` varchar(250) NOT NULL,
  `VLL` varchar(250) NOT NULL,
  `KWHDEL` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ai_alerts`
--

DROP TABLE IF EXISTS `ai_alerts`;
CREATE TABLE IF NOT EXISTS `ai_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panelid` varchar(10) NOT NULL,
  `seqno` varchar(100) DEFAULT NULL,
  `zone` varchar(3) DEFAULT NULL,
  `alarm` varchar(3) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `receivedtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'O',
  `sendtoclient` char(1) DEFAULT NULL,
  `closedBy` varchar(20) DEFAULT NULL,
  `closedtime` datetime DEFAULT NULL,
  `sendip` varchar(15) DEFAULT NULL,
  `alerttype` varchar(50) DEFAULT NULL,
  `location` char(1) DEFAULT NULL,
  `priority` char(1) DEFAULT NULL,
  `AlertUserStatus` varchar(50) DEFAULT NULL,
  `ATMCode` varchar(50) DEFAULT NULL,
  `File_loc` mediumtext,
  `cms_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receivedtime` (`receivedtime`),
  KEY `status` (`status`),
  KEY `closedBy` (`closedBy`),
  KEY `createtime` (`createtime`),
  KEY `sendip` (`sendip`),
  KEY `alerttype` (`alerttype`),
  KEY `ATMCode` (`ATMCode`)
) ENGINE=MyISAM AUTO_INCREMENT=3233282 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ai_alerts_alive`
--

DROP TABLE IF EXISTS `ai_alerts_alive`;
CREATE TABLE IF NOT EXISTS `ai_alerts_alive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panelid` varchar(10) NOT NULL,
  `seqno` varchar(100) DEFAULT NULL,
  `zone` varchar(3) DEFAULT NULL,
  `alarm` varchar(3) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `receivedtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'O',
  `sendtoclient` char(1) DEFAULT NULL,
  `closedBy` varchar(20) DEFAULT NULL,
  `closedtime` datetime DEFAULT NULL,
  `sendip` varchar(15) DEFAULT NULL,
  `alerttype` varchar(50) DEFAULT NULL,
  `location` char(1) DEFAULT NULL,
  `priority` char(1) DEFAULT NULL,
  `AlertUserStatus` varchar(50) DEFAULT NULL,
  `ATMCode` varchar(50) DEFAULT NULL,
  `File_loc` mediumtext,
  PRIMARY KEY (`id`),
  KEY `receivedtime` (`receivedtime`),
  KEY `status` (`status`),
  KEY `closedBy` (`closedBy`),
  KEY `createtime` (`createtime`),
  KEY `sendip` (`sendip`),
  KEY `alerttype` (`alerttype`),
  KEY `ATMCode` (`ATMCode`)
) ENGINE=MyISAM AUTO_INCREMENT=172628 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ai_sites`
--

DROP TABLE IF EXISTS `ai_sites`;
CREATE TABLE IF NOT EXISTS `ai_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Project` varchar(22) DEFAULT NULL,
  `Customer` varchar(25) DEFAULT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `ATMID` varchar(40) DEFAULT NULL,
  `Location` varchar(150) DEFAULT NULL,
  `SiteAddress` text,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Zone` varchar(15) DEFAULT NULL,
  `NewPanelID` varchar(6) DEFAULT NULL,
  `DVRIP` varchar(20) DEFAULT NULL,
  `DVRName` varchar(15) DEFAULT NULL,
  `UserName` varchar(5) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `live` char(1) NOT NULL DEFAULT 'N',
  `rtsp_stream` varchar(50) DEFAULT NULL,
  `pie_username` varchar(50) DEFAULT NULL,
  `pie_pwd` varchar(50) DEFAULT NULL,
  `PanelIP` varchar(25) DEFAULT NULL,
  `AlertType` varchar(50) NOT NULL DEFAULT 'C',
  `SN` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn_unique` (`SN`)
) ENGINE=MyISAM AUTO_INCREMENT=1248 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alarms`
--

DROP TABLE IF EXISTS `alarms`;
CREATE TABLE IF NOT EXISTS `alarms` (
  `ZoneNo` int(2) DEFAULT NULL,
  `Start Time 1` int(4) DEFAULT NULL,
  `End Time 1` int(4) DEFAULT NULL,
  `Start Time 2` int(4) DEFAULT NULL,
  `End Time 2` int(4) DEFAULT NULL,
  `Debounce Delay` int(1) DEFAULT NULL,
  `Skip Delay` int(1) DEFAULT NULL,
  `Initiating type` varchar(7) DEFAULT NULL,
  `Alarmcode` varchar(2) DEFAULT NULL,
  `Restoralcode` varchar(2) DEFAULT NULL,
  `InputNo` int(2) DEFAULT NULL,
  `Softzone No. on arming` int(1) DEFAULT NULL,
  `Softzone no. on disarming` int(1) DEFAULT NULL,
  `Siren Delayed` int(1) DEFAULT NULL,
  `Sounding type 1` varchar(3) DEFAULT NULL,
  `Sounding type 2` varchar(2) DEFAULT NULL,
  `Siren Type` varchar(10) DEFAULT NULL,
  `InactiveReporting` varchar(2) DEFAULT NULL,
  `ArmZone` varchar(9) DEFAULT NULL,
  `Restoral Allowed` varchar(3) DEFAULT NULL,
  `Contact Type` varchar(15) DEFAULT NULL,
  `CRA zone` varchar(3) DEFAULT NULL,
  `Descriptor` varchar(16) DEFAULT NULL,
  `User 0` varchar(2) DEFAULT NULL,
  `User 1` varchar(3) DEFAULT NULL,
  `User 2` varchar(3) DEFAULT NULL,
  `User 3` varchar(3) DEFAULT NULL,
  `User 4` varchar(3) DEFAULT NULL,
  `User 5` varchar(2) DEFAULT NULL,
  `User 6` varchar(2) DEFAULT NULL,
  `User 7` varchar(2) DEFAULT NULL,
  `User 8` varchar(2) DEFAULT NULL,
  `User 9` varchar(2) DEFAULT NULL,
  `User 10` varchar(2) DEFAULT NULL,
  `User 11` varchar(2) DEFAULT NULL,
  `User 12` varchar(2) DEFAULT NULL,
  `User 13` varchar(2) DEFAULT NULL,
  `User 14` varchar(2) DEFAULT NULL,
  `User 15` varchar(2) DEFAULT NULL,
  `User 16` varchar(2) DEFAULT NULL,
  `User 17` varchar(2) DEFAULT NULL,
  `User 18` varchar(2) DEFAULT NULL,
  `User 19` varchar(2) DEFAULT NULL,
  `Camera` varchar(30) NOT NULL DEFAULT 'Lobby',
  `SH` char(1) NOT NULL DEFAULT 'S',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alertimages`
--

DROP TABLE IF EXISTS `alertimages`;
CREATE TABLE IF NOT EXISTS `alertimages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` varchar(20) NOT NULL,
  `image` mediumblob NOT NULL,
  `imagesize` int(11) NOT NULL,
  `itime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=15905 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
CREATE TABLE IF NOT EXISTS `alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panelid` varchar(10) NOT NULL,
  `seqno` varchar(100) NOT NULL,
  `zone` varchar(3) NOT NULL,
  `alarm` varchar(3) NOT NULL,
  `createtime` datetime NOT NULL,
  `receivedtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'O',
  `sendtoclient` char(1) DEFAULT NULL,
  `closedBy` varchar(20) DEFAULT NULL,
  `closedtime` datetime DEFAULT NULL,
  `sendip` varchar(15) DEFAULT NULL,
  `alerttype` varchar(50) DEFAULT NULL,
  `location` char(1) DEFAULT NULL,
  `priority` char(1) DEFAULT NULL,
  `AlertUserStatus` varchar(50) DEFAULT NULL,
  `level` int(5) NOT NULL DEFAULT '0',
  `sip2` varchar(15) DEFAULT NULL,
  `c_status` char(1) NOT NULL DEFAULT 'C',
  `auto_alert` int(5) NOT NULL DEFAULT '0',
  `critical_alerts` varchar(5) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`),
  KEY `receivedtime` (`receivedtime`),
  KEY `panelid` (`panelid`),
  KEY `status` (`status`),
  KEY `closedBy` (`closedBy`),
  KEY `createtime` (`createtime`),
  KEY `sendip` (`sendip`),
  KEY `sendtoclient` (`sendtoclient`),
  KEY `zone` (`zone`),
  KEY `alarm` (`alarm`),
  KEY `level` (`level`),
  KEY `sip2` (`sip2`),
  KEY `auto_alert` (`auto_alert`),
  KEY `critical_alerts` (`critical_alerts`),
  KEY `idx_alerts_critical_1` (`status`,`sendtoclient`,`sendip`,`alerttype`,`receivedtime`,`critical_alerts`),
  KEY `idx_alerts_critical_2` (`status`,`sendtoclient`,`sip2`,`alerttype`,`receivedtime`,`critical_alerts`)
) ENGINE=InnoDB AUTO_INCREMENT=2204549 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alertscount`
--

DROP TABLE IF EXISTS `alertscount`;
CREATE TABLE IF NOT EXISTS `alertscount` (
  `ip` varchar(15) NOT NULL,
  `userid` varchar(15) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0-logout,1-login',
  `count` int(11) NOT NULL,
  `dvrtype` varchar(10) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `critical` varchar(5) NOT NULL,
  `BANK` varchar(10) DEFAULT NULL,
  `Customer` varchar(30) DEFAULT 'NA',
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alerts_acup`
--

DROP TABLE IF EXISTS `alerts_acup`;
CREATE TABLE IF NOT EXISTS `alerts_acup` (
  `id` int(11) NOT NULL DEFAULT '0',
  `panelid` varchar(10) NOT NULL,
  `seqno` varchar(100) NOT NULL,
  `zone` varchar(3) NOT NULL,
  `alarm` varchar(3) NOT NULL,
  `createtime` datetime NOT NULL,
  `receivedtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'O',
  `sendtoclient` char(1) DEFAULT NULL,
  `closedBy` varchar(20) DEFAULT NULL,
  `closedtime` datetime DEFAULT NULL,
  `sendip` varchar(15) DEFAULT NULL,
  `alerttype` varchar(50) DEFAULT NULL,
  `location` char(1) DEFAULT NULL,
  `priority` char(1) DEFAULT NULL,
  `AlertUserStatus` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alert_assign`
--

DROP TABLE IF EXISTS `alert_assign`;
CREATE TABLE IF NOT EXISTS `alert_assign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alertid` varchar(200) NOT NULL,
  `userAssign` varchar(200) NOT NULL,
  `DataRead` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2438214 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alert_ticket_raise`
--

DROP TABLE IF EXISTS `alert_ticket_raise`;
CREATE TABLE IF NOT EXISTS `alert_ticket_raise` (
  `id` int(11) NOT NULL,
  `ticket_id` varchar(50) DEFAULT NULL,
  `client` varchar(100) DEFAULT NULL,
  `portal` varchar(155) DEFAULT NULL,
  `ticket_status` int(11) DEFAULT NULL COMMENT '0=close, 1=active',
  `created_date` datetime DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `close_date` datetime DEFAULT NULL,
  `location` varchar(155) DEFAULT NULL,
  `atmid` varchar(155) DEFAULT NULL,
  `alert_type` varchar(255) DEFAULT NULL,
  `dvr_ip` varchar(155) DEFAULT NULL,
  `alarm_type` varchar(70) DEFAULT NULL,
  `remarks` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `alert_ticket_raise_history`
--

DROP TABLE IF EXISTS `alert_ticket_raise_history`;
CREATE TABLE IF NOT EXISTS `alert_ticket_raise_history` (
  `id` int(11) NOT NULL,
  `ticket_raise_id` int(11) DEFAULT NULL,
  `ticket_id` varchar(50) DEFAULT NULL,
  `client` varchar(100) DEFAULT NULL,
  `created_by` varchar(155) DEFAULT NULL,
  `ticket_status` int(11) DEFAULT NULL COMMENT '0=close, 1=active',
  `created_date` datetime DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `close_date` datetime DEFAULT NULL,
  `location` varchar(155) DEFAULT NULL,
  `atmid` varchar(155) DEFAULT NULL,
  `alert_type` varchar(255) DEFAULT NULL,
  `dvr_ip` varchar(155) DEFAULT NULL,
  `alarm_type` varchar(70) DEFAULT NULL,
  `remarks` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `allmonitorsites`
--

DROP TABLE IF EXISTS `allmonitorsites`;
CREATE TABLE IF NOT EXISTS `allmonitorsites` (
  `ESN` int(11) NOT NULL AUTO_INCREMENT,
  `DVRIP` varchar(14) CHARACTER SET utf8 NOT NULL,
  `DVRName` varchar(9) CHARACTER SET utf8 NOT NULL,
  `Channel` char(20) CHARACTER SET utf8 NOT NULL,
  `UserName` varchar(5) CHARACTER SET utf8 NOT NULL,
  `Password` varchar(8) CHARACTER SET utf8 NOT NULL,
  `ATMID` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `ATMShortName` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  PRIMARY KEY (`ESN`),
  UNIQUE KEY `ESN` (`ESN`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `archive_alert`
--

DROP TABLE IF EXISTS `archive_alert`;
CREATE TABLE IF NOT EXISTS `archive_alert` (
  `tableid` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` text NOT NULL,
  PRIMARY KEY (`tableid`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `atmdata`
--

DROP TABLE IF EXISTS `atmdata`;
CREATE TABLE IF NOT EXISTS `atmdata` (
  `ATM` varchar(30) NOT NULL,
  `Date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `atm_power`
--

DROP TABLE IF EXISTS `atm_power`;
CREATE TABLE IF NOT EXISTS `atm_power` (
  `record_no` int(50) NOT NULL,
  `TdateTime` datetime NOT NULL,
  `VL` int(11) NOT NULL,
  `IL` int(11) NOT NULL,
  `KW` int(11) NOT NULL,
  `PF` int(11) NOT NULL,
  `VLL` int(11) NOT NULL,
  `KWHDEL` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `atm_upload_images`
--

DROP TABLE IF EXISTS `atm_upload_images`;
CREATE TABLE IF NOT EXISTS `atm_upload_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atmid` varchar(100) NOT NULL,
  `link` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38976 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `atm_upload_images_test`
--

DROP TABLE IF EXISTS `atm_upload_images_test`;
CREATE TABLE IF NOT EXISTS `atm_upload_images_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atmid` varchar(100) NOT NULL,
  `link` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28086 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aws_bucket_upload`
--

DROP TABLE IF EXISTS `aws_bucket_upload`;
CREATE TABLE IF NOT EXISTS `aws_bucket_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atmid` varchar(20) NOT NULL,
  `video_date` date NOT NULL,
  `video_time` varchar(5) NOT NULL,
  `uploaded_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `file_key` text NOT NULL,
  `bucket_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `backalerts`
--

DROP TABLE IF EXISTS `backalerts`;
CREATE TABLE IF NOT EXISTS `backalerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panelid` varchar(10) NOT NULL,
  `seqno` varchar(100) NOT NULL,
  `zone` varchar(3) NOT NULL,
  `alarm` varchar(3) NOT NULL,
  `createtime` datetime NOT NULL,
  `receivedtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'O',
  `sendtoclient` char(1) DEFAULT NULL,
  `closedBy` varchar(20) DEFAULT NULL,
  `closedtime` datetime DEFAULT NULL,
  `sendip` varchar(15) DEFAULT NULL,
  `alerttype` varchar(50) DEFAULT NULL,
  `location` char(1) DEFAULT NULL,
  `priority` char(1) DEFAULT NULL,
  `AlertUserStatus` varchar(50) DEFAULT NULL,
  `level` int(5) NOT NULL DEFAULT '0',
  `sip2` varchar(15) DEFAULT NULL,
  `c_status` char(1) NOT NULL DEFAULT 'C',
  `auto_alert` int(5) NOT NULL DEFAULT '0',
  `critical_alerts` varchar(5) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`),
  KEY `receivedtime` (`receivedtime`),
  KEY `panelid` (`panelid`),
  KEY `status` (`status`),
  KEY `closedBy` (`closedBy`),
  KEY `createtime` (`createtime`),
  KEY `sendip` (`sendip`),
  KEY `sendtoclient` (`sendtoclient`),
  KEY `zone` (`zone`),
  KEY `alarm` (`alarm`),
  KEY `level` (`level`),
  KEY `sip2` (`sip2`),
  KEY `auto_alert` (`auto_alert`),
  KEY `critical_alerts` (`critical_alerts`),
  KEY `idx_alerts_critical_1` (`status`,`sendtoclient`,`sendip`,`alerttype`,`receivedtime`,`critical_alerts`),
  KEY `idx_alerts_critical_2` (`status`,`sendtoclient`,`sip2`,`alerttype`,`receivedtime`,`critical_alerts`)
) ENGINE=InnoDB AUTO_INCREMENT=13843178 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `back_room_light`
--

DROP TABLE IF EXISTS `back_room_light`;
CREATE TABLE IF NOT EXISTS `back_room_light` (
  `record_no` int(50) NOT NULL,
  `TdateTime` datetime NOT NULL,
  `VL` varchar(250) NOT NULL,
  `IL` varchar(250) NOT NULL,
  `KW` varchar(250) NOT NULL,
  `PF` varchar(250) NOT NULL,
  `VLL` varchar(250) NOT NULL,
  `KWHDEL` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bajajdvronline`
--

DROP TABLE IF EXISTS `bajajdvronline`;
CREATE TABLE IF NOT EXISTS `bajajdvronline` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `ATMID` varchar(100) NOT NULL,
  `Address` varchar(600) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `IPAddress` varchar(50) NOT NULL,
  `Rourt ID` varchar(100) NOT NULL,
  `Live Date` datetime NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Status` varchar(5) NOT NULL,
  `dvrname` varchar(10) NOT NULL,
  `customer` varchar(15) NOT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
CREATE TABLE IF NOT EXISTS `bank` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
CREATE TABLE IF NOT EXISTS `branches` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch` varchar(200) NOT NULL,
  `city_id` int(11) NOT NULL,
  `branch_address` varchar(225) DEFAULT NULL,
  `branchmanager_name` varchar(22) NOT NULL,
  `branchmanager_number` varchar(22) NOT NULL,
  `headsupervisor_name` varchar(22) DEFAULT NULL,
  `headsupervisor_number` varchar(22) DEFAULT NULL,
  `supervisor_name` varchar(22) DEFAULT NULL,
  `supervisor_number` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `broadbanddetails`
--

DROP TABLE IF EXISTS `broadbanddetails`;
CREATE TABLE IF NOT EXISTS `broadbanddetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `NetworkType` varchar(60) NOT NULL,
  `ProviderName` varchar(60) NOT NULL,
  `ProviderEmail` varchar(40) NOT NULL,
  `ProviderMobile` varchar(11) NOT NULL,
  `InternetPlans` varchar(40) NOT NULL,
  `BroadbandAmount` int(11) NOT NULL,
  `BroadbandAddress` varchar(100) NOT NULL,
  `RouterIp` varchar(100) NOT NULL,
  `MonthPlans` int(11) NOT NULL,
  `StartInternetDate` date NOT NULL,
  `atmid` varchar(40) NOT NULL,
  `FreeMonthPlans` varchar(100) NOT NULL,
  `ExpiryDate` date DEFAULT '1000-01-01',
  `Status` varchar(8) DEFAULT NULL COMMENT '1 -means expiry Due month, 2- means Expire, 0- means renew',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `buffer_alerts`
--

DROP TABLE IF EXISTS `buffer_alerts`;
CREATE TABLE IF NOT EXISTS `buffer_alerts` (
  `atmid` varchar(20) NOT NULL,
  `sendip` varchar(15) NOT NULL,
  `sendtime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `buffer_alerts_crt`
--

DROP TABLE IF EXISTS `buffer_alerts_crt`;
CREATE TABLE IF NOT EXISTS `buffer_alerts_crt` (
  `atmid` varchar(20) NOT NULL,
  `sendip` varchar(15) NOT NULL,
  `sendtime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `buttonaction`
--

DROP TABLE IF EXISTS `buttonaction`;
CREATE TABLE IF NOT EXISTS `buttonaction` (
  `id` int(11) NOT NULL,
  `sound` int(2) NOT NULL,
  `ac1` int(2) NOT NULL,
  `ac2` int(2) NOT NULL,
  `ATM` int(2) NOT NULL,
  `LIGHT` int(2) NOT NULL,
  `SHUTTER` int(2) NOT NULL,
  `ARM` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bypassatmdetails`
--

DROP TABLE IF EXISTS `bypassatmdetails`;
CREATE TABLE IF NOT EXISTS `bypassatmdetails` (
  `ByPassID` int(11) NOT NULL AUTO_INCREMENT,
  `DVRIP` varchar(50) NOT NULL,
  `ATMID` varchar(50) NOT NULL,
  `SiteAddress` text NOT NULL,
  `PanelName` varchar(50) NOT NULL,
  `PanelID` varchar(50) NOT NULL,
  `LogUserID` int(11) NOT NULL,
  `ByPassDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LogSysIP` varchar(50) NOT NULL,
  `bypasszone` varchar(50) DEFAULT NULL,
  `AlertType` varchar(50) DEFAULT NULL,
  `AlertNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`ByPassID`)
) ENGINE=MyISAM AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bypass_sites`
--

DROP TABLE IF EXISTS `bypass_sites`;
CREATE TABLE IF NOT EXISTS `bypass_sites` (
  `atmid` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `UserName` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `DVRName` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `dvrip` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `bypassed` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bypass_sites1`
--

DROP TABLE IF EXISTS `bypass_sites1`;
CREATE TABLE IF NOT EXISTS `bypass_sites1` (
  `atmid` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `UserName` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `DVRName` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `dvrip` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `bypassed` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `by_pass_sites`
--

DROP TABLE IF EXISTS `by_pass_sites`;
CREATE TABLE IF NOT EXISTS `by_pass_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Customer` varchar(25) DEFAULT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `TrackerNo` varchar(40) DEFAULT NULL,
  `ATMID` varchar(40) DEFAULT NULL,
  `SiteAddress` text,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Zone` varchar(15) DEFAULT NULL,
  `by_pass` varchar(150) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `dvrname` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `change_password_details`
--

DROP TABLE IF EXISTS `change_password_details`;
CREATE TABLE IF NOT EXISTS `change_password_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `old_pwd` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `circle_master`
--

DROP TABLE IF EXISTS `circle_master`;
CREATE TABLE IF NOT EXISTS `circle_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Circle` varchar(150) NOT NULL,
  `Zonal` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3281 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(100) NOT NULL,
  `state_id` int(11) NOT NULL,
  `state` varchar(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`city_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1779 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clouddvr_health`
--

DROP TABLE IF EXISTS `clouddvr_health`;
CREATE TABLE IF NOT EXISTS `clouddvr_health` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) CHARACTER SET utf8 NOT NULL,
  `status` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '0 - no , 1 - ok',
  `cam1` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `latency` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cdate` datetime NOT NULL,
  `last_communication` datetime NOT NULL,
  `atmid` varchar(15) NOT NULL,
  `dvrtype` varchar(10) NOT NULL,
  `live` char(1) NOT NULL,
  `LastFile` varchar(200) NOT NULL,
  `ip2` varchar(20) DEFAULT NULL,
  `ip3` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comfort`
--

DROP TABLE IF EXISTS `comfort`;
CREATE TABLE IF NOT EXISTS `comfort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SensorName` varchar(35) DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `VTASMain` varchar(3) DEFAULT NULL,
  `ZONE` varchar(4) DEFAULT NULL,
  `SCODE` varchar(3) DEFAULT NULL,
  `PRIORITY` varchar(1) DEFAULT NULL,
  `SIACode` varchar(12) DEFAULT NULL,
  `Camera` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ZONE` (`ZONE`,`SCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comfort_hdfc`
--

DROP TABLE IF EXISTS `comfort_hdfc`;
CREATE TABLE IF NOT EXISTS `comfort_hdfc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SensorName` varchar(35) DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `VTASMain` varchar(3) DEFAULT NULL,
  `ZONE` varchar(4) DEFAULT NULL,
  `SCODE` varchar(3) DEFAULT NULL,
  `PRIORITY` varchar(1) DEFAULT NULL,
  `SIACode` varchar(12) DEFAULT NULL,
  `Camera` varchar(30) NOT NULL,
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ZONE` (`ZONE`,`SCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commands1`
--

DROP TABLE IF EXISTS `commands1`;
CREATE TABLE IF NOT EXISTS `commands1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Panelid` varchar(15) NOT NULL,
  `cdesc` varchar(20) NOT NULL,
  `ctime` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `common_customer_email`
--

DROP TABLE IF EXISTS `common_customer_email`;
CREATE TABLE IF NOT EXISTS `common_customer_email` (
  `CCEID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(250) NOT NULL,
  `EmailAddress` varchar(500) NOT NULL,
  `Status` char(1) NOT NULL,
  PRIMARY KEY (`CCEID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `common_region_email`
--

DROP TABLE IF EXISTS `common_region_email`;
CREATE TABLE IF NOT EXISTS `common_region_email` (
  `CREID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailAddress` varchar(500) NOT NULL,
  `Status` char(1) NOT NULL,
  PRIMARY KEY (`CREID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cts_branch`
--

DROP TABLE IF EXISTS `cts_branch`;
CREATE TABLE IF NOT EXISTS `cts_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currentalerts`
--

DROP TABLE IF EXISTS `currentalerts`;
CREATE TABLE IF NOT EXISTS `currentalerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(15) NOT NULL,
  `IP` varchar(15) NOT NULL,
  `dvr` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custdatamaintainremark`
--

DROP TABLE IF EXISTS `custdatamaintainremark`;
CREATE TABLE IF NOT EXISTS `custdatamaintainremark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_Id` varchar(40) NOT NULL,
  `remark` text NOT NULL,
  `entrydate` datetime NOT NULL,
  `updateby` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_remrk` (`cust_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='CustDataMaintainRemark';

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customerdatamaintain`
--

DROP TABLE IF EXISTS `customerdatamaintain`;
CREATE TABLE IF NOT EXISTS `customerdatamaintain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Date_of_Call` date DEFAULT NULL,
  `Bank` varchar(50) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `CallReceivedFrom` varchar(50) NOT NULL,
  `ATMID_TrackerID` varchar(50) NOT NULL,
  `Address` varchar(250) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Zone` varchar(50) NOT NULL,
  `MaterialStatus` varchar(50) NOT NULL,
  `BranchManager` varchar(50) NOT NULL,
  `POD_Details` varchar(50) NOT NULL,
  `RequiredMaterial` varchar(50) NOT NULL,
  `MatetialDispatchDate` date DEFAULT NULL,
  `MaterialDeliveredDate` date DEFAULT NULL,
  `FundRequiredAmount` varchar(50) NOT NULL,
  `FundTransferDate` date DEFAULT NULL,
  `FundStatus` varchar(50) NOT NULL,
  `FundTransferTo` varchar(50) NOT NULL,
  `Remarks` varchar(256) NOT NULL,
  `PartiallySiteMaterialDetails` varchar(50) NOT NULL,
  `PartiallySitePOD_Details` varchar(50) NOT NULL,
  `PartiallyLiveSiteSchedule` varchar(50) NOT NULL,
  `PartiallySiteLiveStatus` varchar(50) NOT NULL,
  `Aging` varchar(50) NOT NULL,
  `live` varchar(50) NOT NULL,
  `Entrydate` date DEFAULT NULL,
  `custStatus` varchar(250) NOT NULL,
  `editDate` datetime DEFAULT NULL,
  `editby` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_atm_email`
--

DROP TABLE IF EXISTS `customer_atm_email`;
CREATE TABLE IF NOT EXISTS `customer_atm_email` (
  `EmailID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailAddress` text NOT NULL,
  `ATMId` varchar(15) NOT NULL,
  `Status` char(1) NOT NULL,
  PRIMARY KEY (`EmailID`)
) ENGINE=MyISAM AUTO_INCREMENT=3069 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

DROP TABLE IF EXISTS `demo`;
CREATE TABLE IF NOT EXISTS `demo` (
  `id` int(11) NOT NULL DEFAULT '0',
  `panelid` varchar(10) NOT NULL,
  `seqno` varchar(100) NOT NULL,
  `zone` varchar(3) NOT NULL,
  `alarm` varchar(3) NOT NULL,
  `createtime` datetime NOT NULL,
  `receivedtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'O',
  `sendtoclient` char(1) DEFAULT NULL,
  `closedBy` varchar(20) DEFAULT NULL,
  `closedtime` datetime DEFAULT NULL,
  `sendip` varchar(15) DEFAULT NULL,
  `alerttype` varchar(50) DEFAULT NULL,
  `location` char(1) DEFAULT NULL,
  `priority` char(1) DEFAULT NULL,
  `AlertUserStatus` varchar(50) DEFAULT NULL,
  `level` int(5) NOT NULL DEFAULT '0',
  `sip2` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `demo_testing`
--

DROP TABLE IF EXISTS `demo_testing`;
CREATE TABLE IF NOT EXISTS `demo_testing` (
  `SensorName` varchar(200) DEFAULT NULL,
  `alarm_description` varchar(209) DEFAULT NULL,
  `Customer` varchar(25) DEFAULT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `ATMID` varchar(40) DEFAULT NULL,
  `ATMShortName` varchar(255) DEFAULT NULL,
  `SiteAddress` text,
  `DVRIP` varchar(20) DEFAULT NULL,
  `Panel_make` varchar(20) DEFAULT NULL,
  `zon` varchar(15) DEFAULT NULL,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `id` int(11) NOT NULL DEFAULT '0',
  `panelid` varchar(10) NOT NULL,
  `createtime` datetime NOT NULL,
  `receivedtime` datetime DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `zone` varchar(3) NOT NULL,
  `alarm` varchar(3) NOT NULL,
  `closedBy` varchar(20) DEFAULT NULL,
  `closedtime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `download_zip_excel`
--

DROP TABLE IF EXISTS `download_zip_excel`;
CREATE TABLE IF NOT EXISTS `download_zip_excel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atmid` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=746 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dvrcommunicationdetails`
--

DROP TABLE IF EXISTS `dvrcommunicationdetails`;
CREATE TABLE IF NOT EXISTS `dvrcommunicationdetails` (
  `DVRLRID` int(11) NOT NULL AUTO_INCREMENT,
  `DVRIP` varchar(20) NOT NULL,
  `DVRConnectDatetime` datetime DEFAULT NULL,
  `DVRLastCommunication` datetime DEFAULT NULL,
  PRIMARY KEY (`DVRLRID`)
) ENGINE=MyISAM AUTO_INCREMENT=1110 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvrcommunicationdetailsdvr`
--

DROP TABLE IF EXISTS `dvrcommunicationdetailsdvr`;
CREATE TABLE IF NOT EXISTS `dvrcommunicationdetailsdvr` (
  `DVRLRID` int(11) NOT NULL AUTO_INCREMENT,
  `DVRIP` varchar(20) NOT NULL,
  `DVRConnectDatetime` datetime DEFAULT NULL,
  `DVRLastCommunication` datetime DEFAULT NULL,
  PRIMARY KEY (`DVRLRID`)
) ENGINE=MyISAM AUTO_INCREMENT=1110 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvrcommunicationdetails_test`
--

DROP TABLE IF EXISTS `dvrcommunicationdetails_test`;
CREATE TABLE IF NOT EXISTS `dvrcommunicationdetails_test` (
  `DVRLRID` int(11) NOT NULL AUTO_INCREMENT,
  `DVRIP` varchar(20) NOT NULL,
  `DVRConnectDatetime` datetime DEFAULT NULL,
  `DVRLastCommunication` datetime DEFAULT NULL,
  PRIMARY KEY (`DVRLRID`)
) ENGINE=MyISAM AUTO_INCREMENT=1165 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvronline`
--

DROP TABLE IF EXISTS `dvronline`;
CREATE TABLE IF NOT EXISTS `dvronline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ATMID` varchar(100) NOT NULL,
  `Address` varchar(600) NOT NULL,
  `Location` text NOT NULL,
  `State` varchar(100) NOT NULL,
  `IPAddress` varchar(50) NOT NULL,
  `Rourt ID` varchar(100) NOT NULL,
  `LiveDate` varchar(40) DEFAULT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Status` varchar(5) NOT NULL,
  `dvrname` varchar(10) NOT NULL,
  `customer` varchar(15) NOT NULL,
  `Bank` varchar(10) NOT NULL,
  `ATMID2` varchar(60) NOT NULL,
  `remark` text NOT NULL,
  `zone` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `old_atm` varchar(20) NOT NULL,
  `installationDate` varchar(40) DEFAULT NULL,
  `project` varchar(20) NOT NULL DEFAULT 'Cloud',
  `sn` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1403 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dvronline09`
--

DROP TABLE IF EXISTS `dvronline09`;
CREATE TABLE IF NOT EXISTS `dvronline09` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ATMID` varchar(100) NOT NULL,
  `Address` varchar(600) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `IPAddress` varchar(50) NOT NULL,
  `Rourt ID` varchar(100) NOT NULL,
  `Live Date` datetime NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Status` varchar(5) NOT NULL,
  `dvrname` varchar(10) NOT NULL,
  `customer` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dvronlinedrop`
--

DROP TABLE IF EXISTS `dvronlinedrop`;
CREATE TABLE IF NOT EXISTS `dvronlinedrop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ATMID` varchar(100) NOT NULL,
  `Address` varchar(600) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `IP Address` varchar(50) NOT NULL,
  `Rourt ID` varchar(100) NOT NULL,
  `Live Date` datetime NOT NULL,
  `User Name` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Status` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dvronlinenew`
--

DROP TABLE IF EXISTS `dvronlinenew`;
CREATE TABLE IF NOT EXISTS `dvronlinenew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ATMID` varchar(100) NOT NULL,
  `Address` varchar(600) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `IPAddress` varchar(50) NOT NULL,
  `Rourt ID` varchar(100) NOT NULL,
  `Live Date` datetime NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Status` varchar(5) NOT NULL,
  `dvrname` varchar(10) NOT NULL,
  `customer` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dvronline_1`
--

DROP TABLE IF EXISTS `dvronline_1`;
CREATE TABLE IF NOT EXISTS `dvronline_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ATMID` varchar(100) NOT NULL,
  `Address` varchar(600) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `IPAddress` varchar(50) NOT NULL,
  `Rourt ID` varchar(100) NOT NULL,
  `Live Date` datetime NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Status` varchar(5) NOT NULL,
  `dvrname` varchar(10) NOT NULL,
  `customer` varchar(15) NOT NULL,
  `modify` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=275 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dvronline_details`
--

DROP TABLE IF EXISTS `dvronline_details`;
CREATE TABLE IF NOT EXISTS `dvronline_details` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `dvrid` int(6) DEFAULT NULL,
  `tracker` varchar(25) DEFAULT NULL,
  `bmName` varchar(100) DEFAULT NULL,
  `engineerName` varchar(100) DEFAULT NULL,
  `snapshots` text,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=859 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dvrsite`
--

DROP TABLE IF EXISTS `dvrsite`;
CREATE TABLE IF NOT EXISTS `dvrsite` (
  `SN` int(3) NOT NULL AUTO_INCREMENT,
  `Status` varchar(22) DEFAULT NULL,
  `Phase` varchar(7) DEFAULT NULL,
  `Customer` varchar(50) DEFAULT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `ATMID` varchar(25) DEFAULT NULL,
  `ATMID_2` varchar(10) DEFAULT NULL,
  `ATMID_3` varchar(8) DEFAULT NULL,
  `ATMID_4` varchar(8) DEFAULT NULL,
  `TrackerNo` varchar(15) DEFAULT NULL,
  `ATMShortName` varchar(150) DEFAULT NULL,
  `SiteAddress` text,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Zone` varchar(15) DEFAULT NULL,
  `DVRIP` varchar(20) DEFAULT NULL,
  `DVRName` varchar(9) DEFAULT NULL,
  `DVR_Model_num` varchar(250) NOT NULL,
  `DVR_Serial_num` varchar(100) NOT NULL,
  `CTSLocalBranch` varchar(200) NOT NULL,
  `CTS_BM_Name` varchar(100) NOT NULL,
  `CTS_BM_Number` varchar(100) NOT NULL,
  `HDD` varchar(100) NOT NULL,
  `Camera1` varchar(100) NOT NULL,
  `Camera2` varchar(100) NOT NULL,
  `Camera3` varchar(100) NOT NULL,
  `Attachment1` varchar(100) NOT NULL,
  `Attachment2` varchar(100) NOT NULL,
  `liveDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `install_Status` varchar(100) NOT NULL,
  `UserName` varchar(5) DEFAULT NULL,
  `Password` varchar(15) DEFAULT NULL,
  `live` char(1) NOT NULL DEFAULT 'N',
  `current_dt` datetime DEFAULT NULL,
  `mailreceive_dt` datetime DEFAULT NULL,
  `addedby` varchar(50) DEFAULT NULL,
  `editby` varchar(50) DEFAULT NULL,
  `site_remark` varchar(1000) NOT NULL,
  `PanelIP` varchar(25) DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `old_atmid` varchar(40) NOT NULL,
  `installationDate` datetime DEFAULT NULL,
  `project` varchar(20) NOT NULL DEFAULT 'DVR',
  PRIMARY KEY (`SN`),
  KEY `live` (`live`),
  KEY `DVRIP` (`DVRIP`)
) ENGINE=MyISAM AUTO_INCREMENT=1035 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dvrsite2`
--

DROP TABLE IF EXISTS `dvrsite2`;
CREATE TABLE IF NOT EXISTS `dvrsite2` (
  `SN` int(3) NOT NULL AUTO_INCREMENT,
  `Status` varchar(22) DEFAULT NULL,
  `Phase` varchar(7) DEFAULT NULL,
  `Customer` varchar(50) DEFAULT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `ATMID` varchar(25) DEFAULT NULL,
  `ATMID_2` varchar(8) DEFAULT NULL,
  `ATMID_3` varchar(8) DEFAULT NULL,
  `ATMID_4` varchar(8) DEFAULT NULL,
  `TrackerNo` varchar(15) DEFAULT NULL,
  `ATMShortName` varchar(150) DEFAULT NULL,
  `SiteAddress` text,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Zone` varchar(15) DEFAULT NULL,
  `DVRIP` varchar(20) DEFAULT NULL,
  `DVRName` varchar(9) DEFAULT NULL,
  `DVR_Model_num` varchar(250) NOT NULL,
  `DVR_Serial_num` varchar(100) NOT NULL,
  `CTSLocalBranch` varchar(200) NOT NULL,
  `CTS_BM_Name` varchar(100) NOT NULL,
  `CTS_BM_Number` varchar(100) NOT NULL,
  `HDD` varchar(100) NOT NULL,
  `Camera1` varchar(100) NOT NULL,
  `Camera2` varchar(100) NOT NULL,
  `Camera3` varchar(100) NOT NULL,
  `Attachment1` varchar(100) NOT NULL,
  `Attachment2` varchar(100) NOT NULL,
  `liveDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `install_Status` varchar(100) NOT NULL,
  `UserName` varchar(5) DEFAULT NULL,
  `Password` varchar(15) DEFAULT NULL,
  `live` char(1) NOT NULL DEFAULT 'N',
  `current_dt` datetime DEFAULT NULL,
  `mailreceive_dt` datetime DEFAULT NULL,
  `addedby` varchar(50) DEFAULT NULL,
  `editby` varchar(50) DEFAULT NULL,
  `site_remark` varchar(1000) NOT NULL,
  `PanelIP` varchar(25) DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SN`),
  KEY `live` (`live`),
  KEY `DVRIP` (`DVRIP`)
) ENGINE=MyISAM AUTO_INCREMENT=368 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dvr_health`
--

DROP TABLE IF EXISTS `dvr_health`;
CREATE TABLE IF NOT EXISTS `dvr_health` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) CHARACTER SET utf8 NOT NULL,
  `status` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '0 - no , 1 - ok',
  `cam1` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam2` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam3` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam4` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `hdd` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `latency` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `login_status` int(11) DEFAULT NULL COMMENT '0- ok , 1 - no',
  `last_communication` datetime DEFAULT NULL,
  `atmid` varchar(40) DEFAULT NULL,
  `capacity` varchar(25) DEFAULT NULL,
  `freespace` varchar(25) DEFAULT NULL,
  `recording_from` varchar(30) DEFAULT NULL,
  `recording_to` varchar(30) DEFAULT NULL,
  `dvrtype` varchar(15) NOT NULL,
  `live` char(1) DEFAULT NULL,
  `SN` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5423 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvr_health2`
--

DROP TABLE IF EXISTS `dvr_health2`;
CREATE TABLE IF NOT EXISTS `dvr_health2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) CHARACTER SET utf8 NOT NULL,
  `status` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '0 - no , 1 - ok',
  `cam1` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam2` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam3` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam4` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `hdd` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `latency` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `login_status` int(11) DEFAULT NULL COMMENT '0- ok , 1 - no',
  `last_communication` datetime DEFAULT NULL,
  `atmid` varchar(40) DEFAULT NULL,
  `capacity` varchar(25) DEFAULT NULL,
  `freespace` varchar(25) DEFAULT NULL,
  `recording_from` varchar(30) DEFAULT NULL,
  `recording_to` varchar(30) DEFAULT NULL,
  `dvrtype` varchar(15) NOT NULL,
  `live` char(1) DEFAULT NULL,
  `SN` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3556 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvr_health_backup_26aug2022`
--

DROP TABLE IF EXISTS `dvr_health_backup_26aug2022`;
CREATE TABLE IF NOT EXISTS `dvr_health_backup_26aug2022` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) CHARACTER SET utf8 NOT NULL,
  `status` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '0 - no , 1 - ok',
  `cam1` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam2` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam3` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam4` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `hdd` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `latency` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `login_status` int(11) DEFAULT NULL COMMENT '0- ok , 1 - no',
  `last_communication` datetime DEFAULT NULL,
  `atmid` varchar(40) DEFAULT NULL,
  `capacity` varchar(25) DEFAULT NULL,
  `freespace` varchar(25) DEFAULT NULL,
  `recording_from` varchar(30) DEFAULT NULL,
  `recording_to` varchar(30) DEFAULT NULL,
  `dvrtype` varchar(15) NOT NULL,
  `live` char(1) DEFAULT NULL,
  `SN` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4519 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvr_health_comfort`
--

DROP TABLE IF EXISTS `dvr_health_comfort`;
CREATE TABLE IF NOT EXISTS `dvr_health_comfort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) CHARACTER SET utf8 NOT NULL,
  `status` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '0 - no , 1 - ok',
  `cam1` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam2` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam3` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam4` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `hdd` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `latency` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `login_status` int(11) DEFAULT NULL COMMENT '0- ok , 1 - no',
  `last_communication` datetime DEFAULT NULL,
  `atmid` varchar(40) DEFAULT NULL,
  `capacity` varchar(25) DEFAULT NULL,
  `freespace` varchar(25) DEFAULT NULL,
  `recording_from` varchar(30) DEFAULT NULL,
  `recording_to` varchar(30) DEFAULT NULL,
  `dvrtype` varchar(15) NOT NULL,
  `live` char(1) DEFAULT NULL,
  `SN` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4911 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvr_health_site_datewise`
--

DROP TABLE IF EXISTS `dvr_health_site_datewise`;
CREATE TABLE IF NOT EXISTS `dvr_health_site_datewise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SN` int(11) NOT NULL,
  `month_date_details` text,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4634 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvr_health_site_monthwise`
--

DROP TABLE IF EXISTS `dvr_health_site_monthwise`;
CREATE TABLE IF NOT EXISTS `dvr_health_site_monthwise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SN` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` bigint(20) NOT NULL,
  `online_status_count` bigint(20) NOT NULL,
  `offline_status_count` bigint(20) NOT NULL,
  `online_percent` float NOT NULL,
  `offline_percent` float NOT NULL,
  `site_address` text,
  `total_down_time` int(11) DEFAULT NULL,
  `down_time_history` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7546 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvr_health_site_monthwise_hour`
--

DROP TABLE IF EXISTS `dvr_health_site_monthwise_hour`;
CREATE TABLE IF NOT EXISTS `dvr_health_site_monthwise_hour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SN` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` bigint(20) NOT NULL,
  `online_status_count` bigint(20) NOT NULL,
  `offline_status_count` bigint(20) NOT NULL,
  `online_percent` float NOT NULL,
  `offline_percent` float NOT NULL,
  `site_address` text,
  `total_down_time` int(11) DEFAULT NULL,
  `down_time_history` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `live_date` date NOT NULL,
  `is_checked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1162 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvr_health_site_monthwise_hour_new`
--

DROP TABLE IF EXISTS `dvr_health_site_monthwise_hour_new`;
CREATE TABLE IF NOT EXISTS `dvr_health_site_monthwise_hour_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SN` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` bigint(20) NOT NULL,
  `online_status_count` bigint(20) NOT NULL,
  `offline_status_count` bigint(20) NOT NULL,
  `online_percent` float NOT NULL,
  `offline_percent` float NOT NULL,
  `site_address` text,
  `total_down_time` int(11) DEFAULT NULL,
  `down_time_history` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `live_date` date DEFAULT NULL,
  `is_checked` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29376 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvr_health_site_monthwise_new`
--

DROP TABLE IF EXISTS `dvr_health_site_monthwise_new`;
CREATE TABLE IF NOT EXISTS `dvr_health_site_monthwise_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SN` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` bigint(20) NOT NULL,
  `online_status_count` bigint(20) NOT NULL,
  `offline_status_count` bigint(20) NOT NULL,
  `online_percent` float NOT NULL,
  `offline_percent` float NOT NULL,
  `site_address` text,
  `total_down_time` int(11) DEFAULT NULL,
  `down_time_history` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `live_date` date DEFAULT NULL,
  `is_checked` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18697 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvr_health_test`
--

DROP TABLE IF EXISTS `dvr_health_test`;
CREATE TABLE IF NOT EXISTS `dvr_health_test` (
  `dvrip` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `atmid` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `dvrname` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `live` char(1) CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `sn` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dvr_history`
--

DROP TABLE IF EXISTS `dvr_history`;
CREATE TABLE IF NOT EXISTS `dvr_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) CHARACTER SET utf8 NOT NULL,
  `status` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam1` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam2` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam3` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cam4` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `hdd` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `latency` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `cdate` datetime NOT NULL,
  `login_status` int(11) NOT NULL COMMENT '0- ok , 1 - no',
  `last_communication` datetime NOT NULL,
  `atmid` varchar(15) NOT NULL,
  `capacity` varchar(25) NOT NULL,
  `freespace` varchar(25) NOT NULL,
  `recording_from` varchar(30) NOT NULL,
  `recording_to` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71666 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvr_image_upload_event`
--

DROP TABLE IF EXISTS `dvr_image_upload_event`;
CREATE TABLE IF NOT EXISTS `dvr_image_upload_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atmid` varchar(50) CHARACTER SET utf8 NOT NULL,
  `folder_date` date NOT NULL,
  `folder_time` varchar(10) NOT NULL,
  `url_link` text,
  `upload_status` tinyint(4) NOT NULL COMMENT '0=not uploaded, 1=uploaded',
  `uploaded_response` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dvr_name`
--

DROP TABLE IF EXISTS `dvr_name`;
CREATE TABLE IF NOT EXISTS `dvr_name` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `bankwise_show` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `eazyinfra_login_access`
--

DROP TABLE IF EXISTS `eazyinfra_login_access`;
CREATE TABLE IF NOT EXISTS `eazyinfra_login_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `org_id` int(11) NOT NULL,
  `group_ids` longtext,
  `refresh_token` text NOT NULL,
  `access_token` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `email_id`
--

DROP TABLE IF EXISTS `email_id`;
CREATE TABLE IF NOT EXISTS `email_id` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `customer` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `father` varchar(100) NOT NULL,
  `Mother` varchar(100) NOT NULL,
  `Address` text NOT NULL,
  `State` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `pincode` int(50) NOT NULL,
  `mob1` varchar(12) NOT NULL,
  `mob2` varchar(12) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `dob` varchar(250) NOT NULL,
  `marriage` varchar(50) NOT NULL,
  `Department` varchar(50) NOT NULL,
  `Employeeid` varchar(250) NOT NULL,
  `Work` varchar(250) NOT NULL,
  `Joining` varchar(250) NOT NULL,
  `parent_name` varchar(250) NOT NULL,
  `parent_lastname` varchar(250) NOT NULL,
  `parent_Address` text NOT NULL,
  `patent_State` varchar(50) NOT NULL,
  `parent_City` varchar(50) NOT NULL,
  `parent_pincode` varchar(10) NOT NULL,
  `parent_mob1` varchar(15) NOT NULL,
  `parent_mob2` varchar(15) NOT NULL,
  `Relationship` varchar(250) NOT NULL,
  `entry_date` datetime NOT NULL,
  `addby` varchar(50) NOT NULL,
  `attachment` varchar(250) NOT NULL,
  `img` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ems_login_access`
--

DROP TABLE IF EXISTS `ems_login_access`;
CREATE TABLE IF NOT EXISTS `ems_login_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `org_id` int(11) NOT NULL,
  `group_ids` varchar(30) DEFAULT NULL,
  `refresh_token` text NOT NULL,
  `access_token` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `escalate`
--

DROP TABLE IF EXISTS `escalate`;
CREATE TABLE IF NOT EXISTS `escalate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `sip` varchar(15) NOT NULL,
  `user` varchar(20) NOT NULL,
  `etime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `aid` (`aid`),
  KEY `level` (`level`),
  KEY `sip` (`sip`),
  KEY `user` (`user`),
  KEY `etime` (`etime`)
) ENGINE=MyISAM AUTO_INCREMENT=914237 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `escalation_matrix`
--

DROP TABLE IF EXISTS `escalation_matrix`;
CREATE TABLE IF NOT EXISTS `escalation_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) NOT NULL,
  `atmid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `priority` varchar(155) DEFAULT NULL,
  `once_interval` varchar(100) DEFAULT NULL,
  `repeat_interval` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `esurveillance_penalty_master`
--

DROP TABLE IF EXISTS `esurveillance_penalty_master`;
CREATE TABLE IF NOT EXISTS `esurveillance_penalty_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minimum_hour` int(11) NOT NULL,
  `maximum_hour` int(11) NOT NULL,
  `penalty_percentage` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `esurvsites`
--

DROP TABLE IF EXISTS `esurvsites`;
CREATE TABLE IF NOT EXISTS `esurvsites` (
  `SN` varchar(5) DEFAULT NULL,
  `Customer` varchar(50) DEFAULT NULL,
  `Bank` varchar(20) DEFAULT NULL,
  `ATM_ID` varchar(50) DEFAULT NULL,
  `ATM_ID2` varchar(50) DEFAULT NULL,
  `ATM_ID3` varchar(50) DEFAULT NULL,
  `ATM_ID4` varchar(50) DEFAULT NULL,
  `ATMShortName` text,
  `SiteAddress` text,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `DVRIP` varchar(20) DEFAULT NULL,
  `Network` varchar(17) DEFAULT NULL,
  `DVRName` varchar(20) DEFAULT NULL,
  `DVRPort` varchar(50) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `CSSBM` varchar(30) DEFAULT NULL,
  `CSSBMNumber` varchar(25) DEFAULT NULL,
  `EMail_ID` varchar(50) DEFAULT NULL,
  `BackofficerName` varchar(30) DEFAULT NULL,
  `BackofficerNumber` varchar(25) DEFAULT NULL,
  `HeadSupervisorName` varchar(22) DEFAULT NULL,
  `HeadSupervisorNumber` varchar(25) DEFAULT NULL,
  `SupervisorName` varchar(22) DEFAULT NULL,
  `Supervisornumber` varchar(25) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Policestation` text,
  `Polstnname` text,
  `atm_officer_name` text,
  `atm_officer_number` text,
  `RA_QRT_NAME` text,
  `RA_QRT_NUMBER` text,
  `TwoWayNumber` text,
  `Site_SN` int(11) NOT NULL,
  `modify` int(11) NOT NULL DEFAULT '0',
  `bank_officer_name` varchar(100) NOT NULL,
  `bank_officer_number` varchar(20) NOT NULL,
  `CSSBM_Email` varchar(60) NOT NULL,
  `atm_officer_email` varchar(100) NOT NULL,
  `zonal_co_ordinator_name` varchar(100) NOT NULL,
  `zonal_co_ordinator_number` varchar(100) NOT NULL,
  `zonal_co_ordinator_email` varchar(100) NOT NULL,
  `Bank_Officer_Email_ID` varchar(100) NOT NULL,
  `CO_Owner_Name` varchar(100) NOT NULL,
  `CO_Owner_Number` varchar(100) NOT NULL,
  `CO_Owner_Email_ID` varchar(100) NOT NULL,
  `Zonal_Name` varchar(100) NOT NULL,
  `Zonal_Number` varchar(100) NOT NULL,
  `Zonal_Email_ID` varchar(100) NOT NULL,
  `firestation_name` varchar(100) NOT NULL,
  `firestation_number` varchar(100) NOT NULL,
  `CTS_LocalBranch` varchar(100) DEFAULT NULL,
  `CTS_Engineer_Name` varchar(100) DEFAULT NULL,
  `CTS_Engineer_Number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5022 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `esurvsites2`
--

DROP TABLE IF EXISTS `esurvsites2`;
CREATE TABLE IF NOT EXISTS `esurvsites2` (
  `ATM_ID` varchar(9) DEFAULT NULL,
  `ATM_ID2` varchar(8) DEFAULT NULL,
  `ATM_ID3` varchar(8) DEFAULT NULL,
  `ATM_ID4` varchar(8) DEFAULT NULL,
  `CSSBM` varchar(30) DEFAULT NULL,
  `CSSBMNumber` varchar(25) DEFAULT NULL,
  `EMail_ID` varchar(50) DEFAULT NULL,
  `BackofficerName` varchar(30) DEFAULT NULL,
  `BackofficerNumber` varchar(25) DEFAULT NULL,
  `HeadSupervisorName` varchar(22) DEFAULT NULL,
  `HeadSupervisorNumber` varchar(25) DEFAULT NULL,
  `SupervisorName` varchar(22) DEFAULT NULL,
  `Supervisornumber` varchar(25) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Policestation` varchar(100) NOT NULL,
  `Polstnname` text NOT NULL,
  `Network` varchar(500) NOT NULL,
  `DVRPort` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=877 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `esurvsitesold`
--

DROP TABLE IF EXISTS `esurvsitesold`;
CREATE TABLE IF NOT EXISTS `esurvsitesold` (
  `SN` int(5) DEFAULT NULL,
  `Customer` varchar(50) DEFAULT NULL,
  `Bank` varchar(20) DEFAULT NULL,
  `ATM_ID` varchar(50) DEFAULT NULL,
  `ATM_ID2` varchar(50) DEFAULT NULL,
  `ATM_ID3` varchar(50) DEFAULT NULL,
  `ATM_ID4` varchar(50) DEFAULT NULL,
  `ATMShortName` varchar(250) DEFAULT NULL,
  `SiteAddress` varchar(500) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `DVRIP` varchar(20) DEFAULT NULL,
  `Network` varchar(17) DEFAULT NULL,
  `DVRName` varchar(20) DEFAULT NULL,
  `DVRPort` varchar(50) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `CSSBM` varchar(30) DEFAULT NULL,
  `CSSBMNumber` varchar(25) DEFAULT NULL,
  `EMail_ID` varchar(50) DEFAULT NULL,
  `BackofficerName` varchar(30) DEFAULT NULL,
  `BackofficerNumber` varchar(25) DEFAULT NULL,
  `HeadSupervisorName` varchar(22) DEFAULT NULL,
  `HeadSupervisorNumber` varchar(25) DEFAULT NULL,
  `SupervisorName` varchar(22) DEFAULT NULL,
  `Supervisornumber` varchar(25) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Policestation` varchar(100) NOT NULL,
  `Polstnname` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=913 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `footage_request`
--

DROP TABLE IF EXISTS `footage_request`;
CREATE TABLE IF NOT EXISTS `footage_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atmid` varchar(128) NOT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `date_of_TXN` date NOT NULL,
  `time_of_TXN` time NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `nature_of_TXN` varchar(128) DEFAULT NULL,
  `amount_of_TXN` varchar(50) DEFAULT NULL,
  `txn_no` varchar(50) DEFAULT NULL,
  `complaint_no` varchar(50) DEFAULT NULL,
  `complaint_date` varchar(50) DEFAULT NULL,
  `claim_date` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `footage_avail` varchar(20) DEFAULT NULL,
  `footage_filename` varchar(128) DEFAULT NULL,
  `footage_date` date DEFAULT NULL,
  `footage_start_time` time DEFAULT NULL,
  `footage_end_time` time DEFAULT NULL,
  `date_of_presrv` date DEFAULT NULL,
  `downlink` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `footage_receive_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_checked` tinyint(4) NOT NULL DEFAULT '0',
  `is_available` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16562 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `footage_request_1`
--

DROP TABLE IF EXISTS `footage_request_1`;
CREATE TABLE IF NOT EXISTS `footage_request_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atmid` varchar(128) NOT NULL,
  `card_no` int(11) NOT NULL,
  `date_of_TXN` date NOT NULL,
  `time_of_TXN` time NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `nature_of_TXN` varchar(128) NOT NULL,
  `amount_of_TXN` float NOT NULL,
  `txn_no` int(11) NOT NULL,
  `complaint_no` int(11) NOT NULL,
  `complaint_date` date NOT NULL,
  `claim_date` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `footage_avail` varchar(20) DEFAULT NULL,
  `footage_filename` varchar(128) DEFAULT NULL,
  `footage_date` date DEFAULT NULL,
  `footage_start_time` time DEFAULT NULL,
  `footage_end_time` time DEFAULT NULL,
  `date_of_presrv` date DEFAULT NULL,
  `downlink` text,
  `created_at` datetime NOT NULL,
  `footage_receive_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_checked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `footage_request_logic`
--

DROP TABLE IF EXISTS `footage_request_logic`;
CREATE TABLE IF NOT EXISTS `footage_request_logic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atmid` varchar(128) NOT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `date_of_TXN` date NOT NULL,
  `time_of_TXN` time NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `nature_of_TXN` varchar(128) DEFAULT NULL,
  `amount_of_TXN` varchar(50) DEFAULT NULL,
  `txn_no` varchar(50) DEFAULT NULL,
  `complaint_no` varchar(50) DEFAULT NULL,
  `complaint_date` varchar(50) DEFAULT NULL,
  `claim_date` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `footage_avail` varchar(20) DEFAULT NULL,
  `footage_filename` varchar(128) DEFAULT NULL,
  `footage_date` date DEFAULT NULL,
  `footage_start_time` time DEFAULT NULL,
  `footage_end_time` time DEFAULT NULL,
  `date_of_presrv` date DEFAULT NULL,
  `downlink` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `footage_receive_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_checked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2478 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gpssites`
--

DROP TABLE IF EXISTS `gpssites`;
CREATE TABLE IF NOT EXISTS `gpssites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ATMID` varchar(100) NOT NULL,
  `Address` varchar(600) NOT NULL,
  `Location` text NOT NULL,
  `State` varchar(100) NOT NULL,
  `IPAddress` varchar(50) NOT NULL,
  `Rourt ID` varchar(100) NOT NULL,
  `LiveDate` varchar(40) DEFAULT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Status` varchar(5) NOT NULL,
  `dvrname` varchar(10) NOT NULL,
  `customer` varchar(15) NOT NULL,
  `Bank` varchar(10) NOT NULL,
  `ATMID2` varchar(60) NOT NULL,
  `remark` text NOT NULL,
  `zone` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `old_atm` varchar(20) NOT NULL,
  `installationDate` varchar(40) DEFAULT NULL,
  `project` varchar(20) NOT NULL DEFAULT 'GPS',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gpssites_details`
--

DROP TABLE IF EXISTS `gpssites_details`;
CREATE TABLE IF NOT EXISTS `gpssites_details` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `dvrid` int(6) DEFAULT NULL,
  `tracker` varchar(25) DEFAULT NULL,
  `bmName` varchar(100) DEFAULT NULL,
  `engineerName` varchar(100) DEFAULT NULL,
  `snapshots` text,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `healthstatus_menu`
--

DROP TABLE IF EXISTS `healthstatus_menu`;
CREATE TABLE IF NOT EXISTS `healthstatus_menu` (
  `HSMID` int(11) NOT NULL AUTO_INCREMENT,
  `Menu` varchar(50) NOT NULL,
  `MenuLevel` int(1) NOT NULL,
  `ParentID` int(11) NOT NULL,
  PRIMARY KEY (`HSMID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `healthstatus_roll`
--

DROP TABLE IF EXISTS `healthstatus_roll`;
CREATE TABLE IF NOT EXISTS `healthstatus_roll` (
  `HSRID` int(11) NOT NULL AUTO_INCREMENT,
  `Roll` varchar(50) NOT NULL,
  PRIMARY KEY (`HSRID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `healthstatus_sites`
--

DROP TABLE IF EXISTS `healthstatus_sites`;
CREATE TABLE IF NOT EXISTS `healthstatus_sites` (
  `HSSID` int(11) NOT NULL AUTO_INCREMENT,
  `ATMID` varchar(15) NOT NULL,
  `UserName` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `DVRIP` varchar(14) NOT NULL,
  `PortNumber` int(10) NOT NULL,
  `SiteAddress` varchar(500) NOT NULL,
  PRIMARY KEY (`HSSID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `historybroadbanddetails`
--

DROP TABLE IF EXISTS `historybroadbanddetails`;
CREATE TABLE IF NOT EXISTS `historybroadbanddetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `NetworkType` varchar(60) NOT NULL,
  `ProviderName` varchar(60) NOT NULL,
  `ProviderEmail` varchar(40) NOT NULL,
  `ProviderMobile` varchar(11) NOT NULL,
  `InternetPlans` varchar(40) NOT NULL,
  `BroadbandAmount` int(11) NOT NULL,
  `BroadbandAddress` varchar(100) NOT NULL,
  `MonthPlans` int(11) NOT NULL,
  `StartInternetDate` date NOT NULL,
  `atmid` varchar(40) NOT NULL,
  `FreeMonthPlans` varchar(100) NOT NULL,
  `ExpiryDate` date DEFAULT '1000-01-01',
  `Status` varchar(8) DEFAULT NULL COMMENT '1 -means expiry Due month, 2- means Expire, 0- means renew',
  `RenewalBy` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `live_info_details`
--

DROP TABLE IF EXISTS `live_info_details`;
CREATE TABLE IF NOT EXISTS `live_info_details` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `site_id` varchar(40) DEFAULT NULL,
  `ctable` varchar(40) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3722 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `live_talk`
--

DROP TABLE IF EXISTS `live_talk`;
CREATE TABLE IF NOT EXISTS `live_talk` (
  `atmid` varchar(25) NOT NULL,
  `startdatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_latlong`
--

DROP TABLE IF EXISTS `location_latlong`;
CREATE TABLE IF NOT EXISTS `location_latlong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atmid` varchar(50) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=986 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `location_latlong_1`
--

DROP TABLE IF EXISTS `location_latlong_1`;
CREATE TABLE IF NOT EXISTS `location_latlong_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atmid` varchar(50) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loginaudit`
--

DROP TABLE IF EXISTS `loginaudit`;
CREATE TABLE IF NOT EXISTS `loginaudit` (
  `LogAuditID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `UserLoginIP` varchar(20) DEFAULT NULL,
  `LoginStatus` varchar(20) NOT NULL,
  `LogInDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LogOutDateTime` datetime DEFAULT NULL,
  `ExitReason` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LogAuditID`),
  KEY `UserId` (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=153691 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logindata`
--

DROP TABLE IF EXISTS `logindata`;
CREATE TABLE IF NOT EXISTS `logindata` (
  `atmid` varchar(9) DEFAULT NULL,
  `cam_type` varchar(9) DEFAULT NULL,
  `uname` varchar(5) DEFAULT NULL,
  `pwd` varchar(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `loginusers`
--

DROP TABLE IF EXISTS `loginusers`;
CREATE TABLE IF NOT EXISTS `loginusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `pwd` varchar(150) NOT NULL,
  `permission` varchar(200) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `level` varchar(191) NOT NULL,
  `cust_id` text NOT NULL,
  `bank_id` text NOT NULL,
  `currentstatus` int(11) NOT NULL DEFAULT '0' COMMENT '0-logout,1-login',
  `alerts` int(11) NOT NULL DEFAULT '0',
  `branch` varchar(200) NOT NULL,
  `zone` varchar(200) NOT NULL,
  `mac_id` text,
  `zonal` text,
  `circle_id` text,
  `is_change_pwd` int(11) NOT NULL DEFAULT '0',
  `RMS` varchar(10) DEFAULT NULL,
  `DVR` varchar(10) DEFAULT NULL,
  `Cloud` varchar(10) DEFAULT NULL,
  `GPS` varchar(10) DEFAULT NULL,
  `Micro RMS` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`),
  KEY `id` (`id`),
  KEY `designation` (`designation`)
) ENGINE=MyISAM AUTO_INCREMENT=785 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_user_otp`
--

DROP TABLE IF EXISTS `login_user_otp`;
CREATE TABLE IF NOT EXISTS `login_user_otp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_otp` mediumint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `otp_attempt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log_audit_mail`
--

DROP TABLE IF EXISTS `log_audit_mail`;
CREATE TABLE IF NOT EXISTS `log_audit_mail` (
  `CREID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailAddress` varchar(500) NOT NULL,
  `Status` char(1) NOT NULL,
  PRIMARY KEY (`CREID`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mailsentaudit`
--

DROP TABLE IF EXISTS `mailsentaudit`;
CREATE TABLE IF NOT EXISTS `mailsentaudit` (
  `MailSentAuditID` int(11) NOT NULL AUTO_INCREMENT,
  `Loguser_id` int(11) DEFAULT NULL,
  `MailSentDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `alert_name` text,
  `CustomerName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MailSentAuditID`)
) ENGINE=MyISAM AUTO_INCREMENT=75029 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `main_incomer`
--

DROP TABLE IF EXISTS `main_incomer`;
CREATE TABLE IF NOT EXISTS `main_incomer` (
  `record_no` int(50) NOT NULL AUTO_INCREMENT,
  `TdateTime` datetime NOT NULL,
  `VL` varchar(250) NOT NULL,
  `IL` varchar(250) NOT NULL,
  `KW` varchar(250) NOT NULL,
  `PF` varchar(250) NOT NULL,
  `VLL` varchar(250) NOT NULL,
  `KWHDEL` varchar(50) NOT NULL,
  PRIMARY KEY (`record_no`)
) ENGINE=MyISAM AUTO_INCREMENT=41455 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `main_menu`
--

DROP TABLE IF EXISTS `main_menu`;
CREATE TABLE IF NOT EXISTS `main_menu` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `menu_icon` varchar(30) NOT NULL DEFAULT 'fa-home',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mis_details`
--

DROP TABLE IF EXISTS `mis_details`;
CREATE TABLE IF NOT EXISTS `mis_details` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `mis_id` int(6) DEFAULT NULL,
  `atmid` varchar(20) DEFAULT NULL,
  `component` varchar(50) DEFAULT NULL,
  `subcomponent` varchar(60) DEFAULT NULL,
  `engineer` varchar(40) DEFAULT NULL,
  `docket_no` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `ticket_id` varchar(20) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `close_date` date NOT NULL,
  `mis_city` int(11) NOT NULL,
  `zone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3097 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `monitorsites`
--

DROP TABLE IF EXISTS `monitorsites`;
CREATE TABLE IF NOT EXISTS `monitorsites` (
  `ESN` int(11) NOT NULL AUTO_INCREMENT,
  `DVRIP` varchar(14) NOT NULL,
  `DVRName` varchar(9) NOT NULL,
  `Channel` char(20) NOT NULL,
  `UserName` varchar(5) NOT NULL,
  `Password` varchar(8) NOT NULL,
  `ATMID` varchar(25) DEFAULT NULL,
  `ATMShortName` varchar(200) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  PRIMARY KEY (`ESN`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `multiple_footage_download`
--

DROP TABLE IF EXISTS `multiple_footage_download`;
CREATE TABLE IF NOT EXISTS `multiple_footage_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) CHARACTER SET utf8 NOT NULL,
  `cam_no` int(11) NOT NULL,
  `from_datetime` datetime NOT NULL,
  `to_datetime` datetime NOT NULL,
  `pc_no` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `remarks` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `multiple_footage_download_test`
--

DROP TABLE IF EXISTS `multiple_footage_download_test`;
CREATE TABLE IF NOT EXISTS `multiple_footage_download_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) CHARACTER SET utf8 NOT NULL,
  `cam_no` int(11) NOT NULL,
  `from_datetime` datetime NOT NULL,
  `to_datetime` datetime NOT NULL,
  `pc_no` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `remarks` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `network_history`
--

DROP TABLE IF EXISTS `network_history`;
CREATE TABLE IF NOT EXISTS `network_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` char(1) NOT NULL,
  `rectime` datetime NOT NULL,
  `status` char(2) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4936848 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `network_historynew`
--

DROP TABLE IF EXISTS `network_historynew`;
CREATE TABLE IF NOT EXISTS `network_historynew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` char(1) NOT NULL,
  `rectime` datetime NOT NULL,
  `status` char(2) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14031633 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `network_history_june`
--

DROP TABLE IF EXISTS `network_history_june`;
CREATE TABLE IF NOT EXISTS `network_history_june` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` char(1) NOT NULL,
  `rectime` datetime NOT NULL,
  `status` char(2) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3304725 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `network_history_may`
--

DROP TABLE IF EXISTS `network_history_may`;
CREATE TABLE IF NOT EXISTS `network_history_may` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` char(1) NOT NULL,
  `rectime` datetime NOT NULL,
  `status` char(2) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3407682 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `network_report`
--

DROP TABLE IF EXISTS `network_report`;
CREATE TABLE IF NOT EXISTS `network_report` (
  `SN` int(11) NOT NULL,
  `router` datetime DEFAULT NULL,
  `dvr` datetime DEFAULT NULL,
  `panel` datetime DEFAULT NULL,
  `latency` varchar(20) NOT NULL,
  PRIMARY KEY (`SN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `network_report_comfort`
--

DROP TABLE IF EXISTS `network_report_comfort`;
CREATE TABLE IF NOT EXISTS `network_report_comfort` (
  `SN` int(11) NOT NULL,
  `router` datetime DEFAULT NULL,
  `dvr` datetime DEFAULT NULL,
  `panel` datetime DEFAULT NULL,
  `latency` varchar(20) NOT NULL,
  PRIMARY KEY (`SN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `network_report_list`
--

DROP TABLE IF EXISTS `network_report_list`;
CREATE TABLE IF NOT EXISTS `network_report_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SN` int(11) NOT NULL,
  `ATMID` varchar(40) NOT NULL,
  `SiteAddress` text,
  `router_status` varchar(20) DEFAULT NULL,
  `router_ip` varchar(50) DEFAULT NULL,
  `router_lastcommunication` varchar(120) DEFAULT NULL,
  `router_online_count` int(11) NOT NULL DEFAULT '0',
  `router_offline_count` int(11) NOT NULL DEFAULT '0',
  `router_tot_count` int(11) NOT NULL DEFAULT '0',
  `router_online_percent` float DEFAULT NULL,
  `dvr_status` varchar(20) DEFAULT NULL,
  `dvr_ip` varchar(50) DEFAULT NULL,
  `dvr_lastcommunication` varchar(120) DEFAULT NULL,
  `dvr_online_count` int(11) NOT NULL DEFAULT '0',
  `dvr_offline_count` int(11) NOT NULL DEFAULT '0',
  `dvr_tot_count` int(11) NOT NULL DEFAULT '0',
  `dvr_online_percent` float DEFAULT NULL,
  `panel_status` varchar(20) DEFAULT NULL,
  `panel_ip` varchar(50) DEFAULT NULL,
  `panel_lastcommunication` varchar(120) DEFAULT NULL,
  `panel_online_count` int(11) NOT NULL DEFAULT '0',
  `panel_offline_count` int(11) NOT NULL DEFAULT '0',
  `panel_tot_count` int(11) NOT NULL DEFAULT '0',
  `panel_online_percent` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_action_date` date NOT NULL DEFAULT '2022-07-25',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4670 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `network_report_site_status`
--

DROP TABLE IF EXISTS `network_report_site_status`;
CREATE TABLE IF NOT EXISTS `network_report_site_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SN` int(11) NOT NULL,
  `ATMID` varchar(40) NOT NULL,
  `SiteAddress` text,
  `router_status` varchar(20) DEFAULT NULL,
  `router_ip` varchar(50) DEFAULT NULL,
  `router_lastcommunication` varchar(120) DEFAULT NULL,
  `router_online_percent` float DEFAULT NULL,
  `dvr_status` varchar(20) DEFAULT NULL,
  `dvr_ip` varchar(50) DEFAULT NULL,
  `dvr_lastcommunication` varchar(120) DEFAULT NULL,
  `dvr_online_percent` float DEFAULT NULL,
  `panel_status` varchar(20) DEFAULT NULL,
  `panel_ip` varchar(50) DEFAULT NULL,
  `panel_lastcommunication` varchar(120) DEFAULT NULL,
  `panel_online_percent` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `newalerttesting`
--

DROP TABLE IF EXISTS `newalerttesting`;
CREATE TABLE IF NOT EXISTS `newalerttesting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panelid` varchar(10) NOT NULL,
  `seqno` varchar(100) NOT NULL,
  `zone` varchar(3) NOT NULL,
  `alarm` varchar(3) NOT NULL,
  `createtime` datetime NOT NULL,
  `receivedtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'O',
  `sendtoclient` char(1) DEFAULT NULL,
  `closedBy` varchar(20) DEFAULT NULL,
  `closedtime` datetime DEFAULT NULL,
  `sendip` varchar(15) DEFAULT NULL,
  `alerttype` varchar(50) DEFAULT NULL,
  `location` char(1) DEFAULT NULL,
  `priority` char(1) DEFAULT NULL,
  `AlertUserStatus` varchar(50) DEFAULT NULL,
  `level` int(5) NOT NULL DEFAULT '0',
  `sip2` varchar(15) DEFAULT NULL,
  `c_status` char(1) NOT NULL DEFAULT 'C',
  `auto_alert` int(5) NOT NULL DEFAULT '0',
  `critical_alerts` varchar(5) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`,`receivedtime`),
  KEY `receivedtime` (`receivedtime`),
  KEY `panelid` (`panelid`),
  KEY `status` (`status`),
  KEY `closedBy` (`closedBy`),
  KEY `createtime` (`createtime`),
  KEY `sendip` (`sendip`),
  KEY `sendtoclient` (`sendtoclient`),
  KEY `zone` (`zone`),
  KEY `alarm` (`alarm`),
  KEY `level` (`level`),
  KEY `sip2` (`sip2`),
  KEY `auto_alert` (`auto_alert`),
  KEY `critical_alerts` (`critical_alerts`),
  KEY `idx_alerts_critical_1` (`status`,`sendtoclient`,`sendip`,`alerttype`,`receivedtime`,`critical_alerts`),
  KEY `idx_alerts_critical_2` (`status`,`sendtoclient`,`sip2`,`alerttype`,`receivedtime`,`critical_alerts`)
) ENGINE=InnoDB AUTO_INCREMENT=1043189 DEFAULT CHARSET=utf8
PARTITION BY RANGE (TO_DAYS(receivedtime))
(
PARTITION p20240816 VALUES LESS THAN (739479) ENGINE=InnoDB,
PARTITION p20240817 VALUES LESS THAN (739480) ENGINE=InnoDB,
PARTITION p20240818 VALUES LESS THAN (739481) ENGINE=InnoDB,
PARTITION pMax VALUES LESS THAN MAXVALUE ENGINE=InnoDB
);

-- --------------------------------------------------------

--
-- Table structure for table `newcommands1`
--

DROP TABLE IF EXISTS `newcommands1`;
CREATE TABLE IF NOT EXISTS `newcommands1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Panelid` varchar(15) NOT NULL,
  `cdesc` varchar(20) NOT NULL,
  `ctime` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `north_alerts`
--

DROP TABLE IF EXISTS `north_alerts`;
CREATE TABLE IF NOT EXISTS `north_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panelid` varchar(10) NOT NULL,
  `seqno` varchar(100) NOT NULL,
  `zone` varchar(3) NOT NULL,
  `alarm` varchar(3) NOT NULL,
  `createtime` datetime NOT NULL,
  `receivedtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'O',
  `sendtoclient` char(1) DEFAULT NULL,
  `closedBy` varchar(20) DEFAULT NULL,
  `closedtime` datetime DEFAULT NULL,
  `sendip` varchar(15) DEFAULT NULL,
  `alerttype` varchar(50) DEFAULT NULL,
  `location` char(1) DEFAULT NULL,
  `priority` char(1) DEFAULT NULL,
  `AlertUserStatus` varchar(50) DEFAULT NULL,
  `level` int(5) NOT NULL DEFAULT '0',
  `sip2` varchar(15) DEFAULT NULL,
  `c_status` char(1) NOT NULL DEFAULT 'C',
  `auto_alert` int(5) NOT NULL DEFAULT '0',
  `critical_alerts` varchar(5) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`),
  KEY `receivedtime` (`receivedtime`),
  KEY `panelid` (`panelid`),
  KEY `status` (`status`),
  KEY `closedBy` (`closedBy`),
  KEY `createtime` (`createtime`),
  KEY `sendip` (`sendip`),
  KEY `sendtoclient` (`sendtoclient`),
  KEY `zone` (`zone`),
  KEY `alarm` (`alarm`),
  KEY `level` (`level`),
  KEY `sip2` (`sip2`),
  KEY `auto_alert` (`auto_alert`),
  KEY `critical_alerts` (`critical_alerts`),
  KEY `idx_alerts_critical_1` (`status`,`sendtoclient`,`sendip`,`alerttype`,`receivedtime`,`critical_alerts`),
  KEY `idx_alerts_critical_2` (`status`,`sendtoclient`,`sip2`,`alerttype`,`receivedtime`,`critical_alerts`)
) ENGINE=InnoDB AUTO_INCREMENT=3830 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `panel_health`
--

DROP TABLE IF EXISTS `panel_health`;
CREATE TABLE IF NOT EXISTS `panel_health` (
  `date` datetime DEFAULT NULL,
  `panelName` varchar(100) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `panelid` varchar(100) DEFAULT NULL,
  `zon1` varchar(100) DEFAULT NULL,
  `zon2` varchar(100) DEFAULT NULL,
  `zon3` varchar(100) DEFAULT NULL,
  `zon4` varchar(100) DEFAULT NULL,
  `zon5` varchar(100) DEFAULT NULL,
  `zon6` varchar(100) DEFAULT NULL,
  `zon7` varchar(100) DEFAULT NULL,
  `zon8` varchar(100) DEFAULT NULL,
  `zon9` varchar(100) DEFAULT NULL,
  `zon10` varchar(100) DEFAULT NULL,
  `zon11` varchar(100) DEFAULT NULL,
  `zon12` varchar(100) DEFAULT NULL,
  `zon13` varchar(100) DEFAULT NULL,
  `zon14` varchar(100) DEFAULT NULL,
  `zon15` varchar(100) DEFAULT NULL,
  `zon16` varchar(100) DEFAULT NULL,
  `zon17` varchar(100) DEFAULT NULL,
  `zon18` varchar(100) DEFAULT NULL,
  `zon19` varchar(100) DEFAULT NULL,
  `zon20` varchar(100) DEFAULT NULL,
  `zon21` varchar(100) DEFAULT NULL,
  `zon22` varchar(100) DEFAULT NULL,
  `zon23` varchar(100) DEFAULT NULL,
  `zon24` varchar(100) DEFAULT NULL,
  `zon25` varchar(100) DEFAULT NULL,
  `zon26` varchar(100) DEFAULT NULL,
  `zon27` varchar(100) DEFAULT NULL,
  `zon28` varchar(100) DEFAULT NULL,
  `zon29` varchar(100) DEFAULT NULL,
  `zon30` varchar(100) DEFAULT NULL,
  `zon31` varchar(100) DEFAULT NULL,
  `zon32` varchar(100) DEFAULT NULL,
  `zon33` varchar(100) DEFAULT NULL,
  `zon34` varchar(100) DEFAULT NULL,
  `zon35` varchar(100) DEFAULT NULL,
  `zon36` varchar(100) DEFAULT NULL,
  `zon37` varchar(100) DEFAULT NULL,
  `zon38` varchar(100) DEFAULT NULL,
  `zon39` varchar(100) DEFAULT NULL,
  `zon40` varchar(100) DEFAULT NULL,
  `zon41` varchar(100) DEFAULT NULL,
  `zon42` varchar(100) DEFAULT NULL,
  `zon43` varchar(100) DEFAULT NULL,
  `zon44` varchar(100) DEFAULT NULL,
  `zon45` varchar(100) DEFAULT NULL,
  `zon46` varchar(100) DEFAULT NULL,
  `zon47` varchar(100) DEFAULT NULL,
  `zon48` varchar(100) DEFAULT NULL,
  `zon49` varchar(100) DEFAULT NULL,
  `zon50` varchar(100) DEFAULT NULL,
  `zon51` varchar(100) DEFAULT NULL,
  `zon52` varchar(100) DEFAULT NULL,
  `zon53` varchar(100) DEFAULT NULL,
  `zon54` varchar(100) DEFAULT NULL,
  `zon55` varchar(100) DEFAULT NULL,
  `zon56` varchar(100) DEFAULT NULL,
  `zon57` varchar(100) DEFAULT NULL,
  `zon58` varchar(100) DEFAULT NULL,
  `zon59` varchar(100) DEFAULT NULL,
  `zon60` varchar(100) DEFAULT NULL,
  `zon998` varchar(100) DEFAULT NULL,
  `zon997` varchar(100) DEFAULT NULL,
  `zon996` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0 ok, 1 not connecting',
  `atmid` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `panel_history`
--

DROP TABLE IF EXISTS `panel_history`;
CREATE TABLE IF NOT EXISTS `panel_history` (
  `date` datetime NOT NULL,
  `panelName` varchar(100) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `panelid` varchar(100) NOT NULL,
  `zon1` varchar(100) NOT NULL,
  `zon2` varchar(100) NOT NULL,
  `zon3` varchar(100) NOT NULL,
  `zon4` varchar(100) NOT NULL,
  `zon5` varchar(100) NOT NULL,
  `zon6` varchar(100) NOT NULL,
  `zon7` varchar(100) NOT NULL,
  `zon8` varchar(100) NOT NULL,
  `zon9` varchar(100) NOT NULL,
  `zon10` varchar(100) NOT NULL,
  `zon11` varchar(100) NOT NULL,
  `zon12` varchar(100) NOT NULL,
  `zon13` varchar(100) NOT NULL,
  `zon14` varchar(100) NOT NULL,
  `zon15` varchar(100) NOT NULL,
  `zon16` varchar(100) NOT NULL,
  `zon17` varchar(100) NOT NULL,
  `zon18` varchar(100) NOT NULL,
  `zon19` varchar(100) NOT NULL,
  `zon20` varchar(100) NOT NULL,
  `zon21` varchar(100) NOT NULL,
  `zon22` varchar(100) NOT NULL,
  `zon23` varchar(100) NOT NULL,
  `zon24` varchar(100) NOT NULL,
  `zon25` varchar(100) NOT NULL,
  `zon26` varchar(100) NOT NULL,
  `zon27` varchar(100) NOT NULL,
  `zon28` varchar(100) NOT NULL,
  `zon29` varchar(100) NOT NULL,
  `zon30` varchar(100) NOT NULL,
  `zon31` varchar(100) NOT NULL,
  `zon32` varchar(100) NOT NULL,
  `zon33` varchar(100) NOT NULL,
  `zon34` varchar(100) NOT NULL,
  `zon35` varchar(100) NOT NULL,
  `zon36` varchar(100) NOT NULL,
  `zon37` varchar(100) NOT NULL,
  `zon38` varchar(100) NOT NULL,
  `zon39` varchar(100) NOT NULL,
  `zon40` varchar(100) NOT NULL,
  `zon41` varchar(100) NOT NULL,
  `zon42` varchar(100) NOT NULL,
  `zon43` varchar(100) NOT NULL,
  `zon44` varchar(100) NOT NULL,
  `zon45` varchar(100) NOT NULL,
  `zon46` varchar(100) NOT NULL,
  `zon47` varchar(100) NOT NULL,
  `zon48` varchar(100) NOT NULL,
  `zon49` varchar(100) NOT NULL,
  `zon50` varchar(100) NOT NULL,
  `zon51` varchar(100) NOT NULL,
  `zon52` varchar(100) NOT NULL,
  `zon53` varchar(100) NOT NULL,
  `zon54` varchar(100) NOT NULL,
  `zon55` varchar(100) NOT NULL,
  `zon56` varchar(100) NOT NULL,
  `zon57` varchar(100) NOT NULL,
  `zon58` varchar(100) NOT NULL,
  `zon59` varchar(100) NOT NULL,
  `zon60` varchar(100) NOT NULL,
  `zon998` varchar(100) NOT NULL,
  `zon997` varchar(100) NOT NULL,
  `zon996` varchar(100) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 ok, 1 not connecting',
  UNIQUE KEY `date` (`date`,`ip`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `panel_make_tbl`
--

DROP TABLE IF EXISTS `panel_make_tbl`;
CREATE TABLE IF NOT EXISTS `panel_make_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Panel_Make` varchar(100) NOT NULL,
  `tbl_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Panel_Make_Unique` (`Panel_Make`,`tbl_name`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `passwordbuffer`
--

DROP TABLE IF EXISTS `passwordbuffer`;
CREATE TABLE IF NOT EXISTS `passwordbuffer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atmid` varchar(50) CHARACTER SET utf8 NOT NULL,
  `panelid` varchar(10) CHARACTER SET utf8 NOT NULL,
  `userid` varchar(20) CHARACTER SET utf8 NOT NULL,
  `password` varchar(15) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4636 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pnb_wall`
--

DROP TABLE IF EXISTS `pnb_wall`;
CREATE TABLE IF NOT EXISTS `pnb_wall` (
  `atmid` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `UserName` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `DVRName` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `dvrip` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `bypassed` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pnb_wall1`
--

DROP TABLE IF EXISTS `pnb_wall1`;
CREATE TABLE IF NOT EXISTS `pnb_wall1` (
  `atmid` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `UserName` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `DVRName` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `dvrip` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `bypassed` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pnb_wall2`
--

DROP TABLE IF EXISTS `pnb_wall2`;
CREATE TABLE IF NOT EXISTS `pnb_wall2` (
  `atmid` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `UserName` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `DVRName` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `dvrip` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `bypassed` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pnb_wall3`
--

DROP TABLE IF EXISTS `pnb_wall3`;
CREATE TABLE IF NOT EXISTS `pnb_wall3` (
  `atmid` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `UserName` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `DVRName` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `dvrip` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `bypassed` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pnb_wall4`
--

DROP TABLE IF EXISTS `pnb_wall4`;
CREATE TABLE IF NOT EXISTS `pnb_wall4` (
  `atmid` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `UserName` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `DVRName` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `dvrip` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `bypassed` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `projectsites`
--

DROP TABLE IF EXISTS `projectsites`;
CREATE TABLE IF NOT EXISTS `projectsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qrt_arrange`
--

DROP TABLE IF EXISTS `qrt_arrange`;
CREATE TABLE IF NOT EXISTS `qrt_arrange` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) NOT NULL,
  `qrt_arrangetime` datetime NOT NULL,
  `alert_id` text NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '1 wip 2 close',
  `QRT_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=94217 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qrt_update`
--

DROP TABLE IF EXISTS `qrt_update`;
CREATE TABLE IF NOT EXISTS `qrt_update` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `qid` int(10) NOT NULL,
  `close_comment` varchar(250) DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `status` int(5) NOT NULL,
  `closeby` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7685 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rass`
--

DROP TABLE IF EXISTS `rass`;
CREATE TABLE IF NOT EXISTS `rass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SensorName` varchar(35) DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `VTASMain` varchar(3) DEFAULT NULL,
  `ZONE` varchar(4) DEFAULT NULL,
  `SCODE` varchar(3) DEFAULT NULL,
  `PRIORITY` varchar(1) DEFAULT NULL,
  `SIACode` varchar(12) DEFAULT NULL,
  `Camera` varchar(30) NOT NULL,
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ZONE` (`ZONE`,`SCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rass_boi`
--

DROP TABLE IF EXISTS `rass_boi`;
CREATE TABLE IF NOT EXISTS `rass_boi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SensorName` varchar(35) DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `VTASMain` varchar(3) DEFAULT NULL,
  `ZONE` varchar(4) DEFAULT NULL,
  `SCODE` varchar(3) DEFAULT NULL,
  `PRIORITY` varchar(1) DEFAULT NULL,
  `SIACode` varchar(12) DEFAULT NULL,
  `Camera` varchar(30) NOT NULL,
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ZONE` (`ZONE`,`SCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rass_cloud`
--

DROP TABLE IF EXISTS `rass_cloud`;
CREATE TABLE IF NOT EXISTS `rass_cloud` (
  `id` int(11) NOT NULL DEFAULT '0',
  `SensorName` varchar(35) DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `VTASMain` varchar(3) DEFAULT NULL,
  `ZONE` varchar(4) DEFAULT NULL,
  `SCODE` varchar(3) DEFAULT NULL,
  `PRIORITY` varchar(1) DEFAULT NULL,
  `SIACode` varchar(12) DEFAULT NULL,
  `Camera` varchar(30) NOT NULL,
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rass_pnb`
--

DROP TABLE IF EXISTS `rass_pnb`;
CREATE TABLE IF NOT EXISTS `rass_pnb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SensorName` varchar(35) DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `VTASMain` varchar(3) DEFAULT NULL,
  `ZONE` varchar(4) DEFAULT NULL,
  `SCODE` varchar(3) DEFAULT NULL,
  `PRIORITY` varchar(1) DEFAULT NULL,
  `SIACode` varchar(12) DEFAULT NULL,
  `Camera` varchar(30) NOT NULL,
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ZONE` (`ZONE`,`SCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rass_sbi`
--

DROP TABLE IF EXISTS `rass_sbi`;
CREATE TABLE IF NOT EXISTS `rass_sbi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SensorName` varchar(35) DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `VTASMain` varchar(3) DEFAULT NULL,
  `ZONE` varchar(4) DEFAULT NULL,
  `SCODE` varchar(3) DEFAULT NULL,
  `PRIORITY` varchar(1) DEFAULT NULL,
  `SIACode` varchar(12) DEFAULT NULL,
  `Camera` varchar(30) NOT NULL,
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ZONE` (`ZONE`,`SCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `raxx`
--

DROP TABLE IF EXISTS `raxx`;
CREATE TABLE IF NOT EXISTS `raxx` (
  `PortNo` int(2) DEFAULT NULL,
  `SensorsName` varchar(35) DEFAULT NULL,
  `AlertCode` varchar(3) DEFAULT NULL,
  `NormalCode` varchar(4) DEFAULT NULL,
  `ZoneNumber` varchar(4) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Camera` varchar(30) NOT NULL DEFAULT 'Lobby',
  `SH` char(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `region_email`
--

DROP TABLE IF EXISTS `region_email`;
CREATE TABLE IF NOT EXISTS `region_email` (
  `EmailID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailAddress` varchar(500) NOT NULL,
  `region` varchar(50) NOT NULL,
  `Status` char(1) NOT NULL,
  PRIMARY KEY (`EmailID`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rms_update`
--

DROP TABLE IF EXISTS `rms_update`;
CREATE TABLE IF NOT EXISTS `rms_update` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `rms_id` int(6) DEFAULT NULL,
  `panel_install` varchar(20) DEFAULT NULL,
  `panel_alert` varchar(30) DEFAULT NULL,
  `panel_serial` varchar(30) DEFAULT NULL,
  `panel_remark` text,
  `relay_install` varchar(20) DEFAULT NULL,
  `relay_alert` varchar(30) DEFAULT NULL,
  `relay_serial` varchar(30) DEFAULT NULL,
  `relay_remark` text,
  `panic_install` varchar(20) DEFAULT NULL,
  `panic_alert` varchar(30) DEFAULT NULL,
  `panic_serial` varchar(30) DEFAULT NULL,
  `panic_remark` text,
  `glass_install` varchar(20) DEFAULT NULL,
  `glass_alert` varchar(30) DEFAULT NULL,
  `glass_serial` varchar(30) DEFAULT NULL,
  `glass_remark` text,
  `backroom_install` varchar(20) DEFAULT NULL,
  `backroom_alert` varchar(30) DEFAULT NULL,
  `backroom_serial` varchar(30) DEFAULT NULL,
  `backroom_remark` text,
  `keypad_install` varchar(20) DEFAULT NULL,
  `keypad_alert` varchar(30) DEFAULT NULL,
  `keypad_serial` varchar(30) DEFAULT NULL,
  `keypad_remark` text,
  `cctv_install` varchar(20) DEFAULT NULL,
  `cctv_alert` varchar(30) DEFAULT NULL,
  `cctv_serial` varchar(30) DEFAULT NULL,
  `cctv_remark` text,
  `spk_install` varchar(20) DEFAULT NULL,
  `spk_alert` varchar(30) DEFAULT NULL,
  `spk_serial` varchar(30) DEFAULT NULL,
  `spk_remark` text,
  `ac_install` varchar(20) DEFAULT NULL,
  `ac_alert` varchar(30) DEFAULT NULL,
  `ac_serial` varchar(30) DEFAULT NULL,
  `ac_remark` text,
  `smoke_install` varchar(20) DEFAULT NULL,
  `smoke_alert` varchar(30) DEFAULT NULL,
  `smoke_serial` varchar(30) DEFAULT NULL,
  `smoke_remark` text,
  `tamper_swith_install` varchar(20) DEFAULT NULL,
  `tamper_swith_alert` varchar(30) DEFAULT NULL,
  `tamper_swith_serial` varchar(30) DEFAULT NULL,
  `tamper_swith_remark` text,
  `upsAlert_install` varchar(20) DEFAULT NULL,
  `upsAlert_alert` varchar(30) DEFAULT NULL,
  `upsAlert_serial` varchar(30) DEFAULT NULL,
  `upsAlert_remark` text,
  `acmain_install` varchar(20) DEFAULT NULL,
  `acmain_alert` varchar(30) DEFAULT NULL,
  `acmain_serial` varchar(30) DEFAULT NULL,
  `acmain_remark` text,
  `siren_install` varchar(20) DEFAULT NULL,
  `siren_alert` varchar(30) DEFAULT NULL,
  `siren_serial` varchar(30) DEFAULT NULL,
  `siren_remark` text,
  `lobbypir_install` varchar(20) DEFAULT NULL,
  `lobbypir_alert` varchar(30) DEFAULT NULL,
  `lobbypir_serial` varchar(30) DEFAULT NULL,
  `lobbypir_remark` text,
  `atmdoor_install` varchar(20) DEFAULT NULL,
  `atmdoor_alert` varchar(30) DEFAULT NULL,
  `atmdoor_serial` varchar(30) DEFAULT NULL,
  `atmdoor_remark` text,
  `lobbytemp_install` varchar(20) DEFAULT NULL,
  `lobbytemp_alert` varchar(30) DEFAULT NULL,
  `lobbytemp_serial` varchar(30) DEFAULT NULL,
  `lobbytemp_remark` text,
  `router_install` varchar(20) DEFAULT NULL,
  `router_alert` varchar(30) DEFAULT NULL,
  `router_serial` varchar(30) DEFAULT NULL,
  `router_remark` text,
  `sim_install` varchar(20) DEFAULT NULL,
  `sim_alert` varchar(30) DEFAULT NULL,
  `sim_serial` varchar(30) DEFAULT NULL,
  `sim_remark` text,
  `battery_install` varchar(20) DEFAULT NULL,
  `battery_alert` varchar(30) DEFAULT NULL,
  `battery_serial` varchar(30) DEFAULT NULL,
  `battery_remark` text,
  `atmChest_install` varchar(20) DEFAULT NULL,
  `atmChest_alert` varchar(30) DEFAULT NULL,
  `atmChest_serial` varchar(30) DEFAULT NULL,
  `atmChest_remark` text,
  `atmHood_install` varchar(20) DEFAULT NULL,
  `atmHood_alert` varchar(30) DEFAULT NULL,
  `atmHood_serial` varchar(30) DEFAULT NULL,
  `atmHood_remark` text,
  `atmRemoval_install` varchar(20) DEFAULT NULL,
  `atmRemoval_alert` varchar(30) DEFAULT NULL,
  `atmRemoval_serial` varchar(30) DEFAULT NULL,
  `atmRemoval_remark` text,
  `atmVibration_install` varchar(20) DEFAULT NULL,
  `atmVibration_alert` varchar(30) DEFAULT NULL,
  `atmVibration_serial` varchar(30) DEFAULT NULL,
  `atmVibration_remark` text,
  `atmThermal_install` varchar(20) DEFAULT NULL,
  `atmThermal_alert` varchar(30) DEFAULT NULL,
  `atmThermal_serial` varchar(30) DEFAULT NULL,
  `atmThermal_remark` text,
  `check_install` varchar(20) DEFAULT NULL,
  `cdb_alert` varchar(30) DEFAULT NULL,
  `cdb_serial` varchar(30) DEFAULT NULL,
  `cdb_remark` text,
  `lobbyCamera_install` varchar(20) DEFAULT NULL,
  `lobbyCamera_alert` varchar(30) DEFAULT NULL,
  `lobbyCamera_serial` varchar(30) DEFAULT NULL,
  `lobbyCamera_remark` text,
  `backRoomcam_install` varchar(20) DEFAULT NULL,
  `backRoomcam_alert` varchar(30) DEFAULT NULL,
  `backRoomcam_serial` varchar(30) DEFAULT NULL,
  `backRoomcam_remark` text,
  `outdoor_install` varchar(20) DEFAULT NULL,
  `outdoor_alert` varchar(30) DEFAULT NULL,
  `outdoor_serial` varchar(30) DEFAULT NULL,
  `outdoor_remark` text,
  `dvr_install` varchar(20) DEFAULT NULL,
  `dvr_alert` varchar(30) DEFAULT NULL,
  `dvr_serial` varchar(30) DEFAULT NULL,
  `dvr_remark` text,
  `hdd_install` varchar(20) DEFAULT NULL,
  `hdd_alert` varchar(30) DEFAULT NULL,
  `hdd_serial` varchar(30) DEFAULT NULL,
  `hdd_remark` text,
  `panel_img` varchar(100) DEFAULT NULL,
  `relay_img` varchar(100) DEFAULT NULL,
  `panic_img` varchar(100) DEFAULT NULL,
  `glass_img` varchar(100) DEFAULT NULL,
  `backroomeml_img` varchar(100) DEFAULT NULL,
  `keypad_img` varchar(100) DEFAULT NULL,
  `cctv_img` varchar(100) DEFAULT NULL,
  `spk_img` varchar(100) DEFAULT NULL,
  `ac_img` varchar(100) DEFAULT NULL,
  `smoke_img` varchar(100) DEFAULT NULL,
  `tamper_swith_img` varchar(100) DEFAULT NULL,
  `upsAlert_img` varchar(100) DEFAULT NULL,
  `acmain_img` varchar(100) DEFAULT NULL,
  `siren_img` varchar(100) DEFAULT NULL,
  `lobbypir_img` varchar(100) DEFAULT NULL,
  `atmdoor_img` varchar(100) DEFAULT NULL,
  `lobbytemp_img` varchar(100) DEFAULT NULL,
  `router_img` varchar(100) DEFAULT NULL,
  `sim_img` varchar(100) DEFAULT NULL,
  `battery_img` varchar(100) DEFAULT NULL,
  `atmChest_img` varchar(100) DEFAULT NULL,
  `atmHood_img` varchar(100) DEFAULT NULL,
  `atmRemoval_img` varchar(100) DEFAULT NULL,
  `atmVibration_img` varchar(100) DEFAULT NULL,
  `atmThermal_img` varchar(100) DEFAULT NULL,
  `cdb_img` varchar(100) DEFAULT NULL,
  `lobbyCamera_img` varchar(100) DEFAULT NULL,
  `backroomcam_img` varchar(100) DEFAULT NULL,
  `outdoor_img` varchar(100) DEFAULT NULL,
  `dvr_img` varchar(100) DEFAULT NULL,
  `hdd_img` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rnmcalls`
--

DROP TABLE IF EXISTS `rnmcalls`;
CREATE TABLE IF NOT EXISTS `rnmcalls` (
  `RNMID` int(11) NOT NULL AUTO_INCREMENT,
  `AlterID` int(11) NOT NULL,
  `ATMID` varchar(15) NOT NULL,
  `IssueType` varchar(50) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`RNMID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securico`
--

DROP TABLE IF EXISTS `securico`;
CREATE TABLE IF NOT EXISTS `securico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(22) DEFAULT NULL,
  `sensorname` varchar(59) DEFAULT NULL,
  `code` varchar(14) DEFAULT NULL,
  `COL 5` varchar(17) DEFAULT NULL,
  `COL 6` varchar(18) DEFAULT NULL,
  `COL 7` varchar(20) DEFAULT NULL,
  `COL 8` varchar(14) DEFAULT NULL,
  `COL 9` varchar(20) DEFAULT NULL,
  `COL 10` varchar(22) DEFAULT NULL,
  `priority` char(1) NOT NULL,
  `camera` varchar(20) NOT NULL,
  `scode` char(2) NOT NULL DEFAULT 'BA',
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securico_gx4816`
--

DROP TABLE IF EXISTS `securico_gx4816`;
CREATE TABLE IF NOT EXISTS `securico_gx4816` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(22) DEFAULT NULL,
  `sensorname` varchar(59) DEFAULT NULL,
  `code` varchar(14) DEFAULT NULL,
  `COL 5` varchar(17) DEFAULT NULL,
  `COL 6` varchar(18) DEFAULT NULL,
  `COL 7` varchar(20) DEFAULT NULL,
  `COL 8` varchar(14) DEFAULT NULL,
  `COL 9` varchar(20) DEFAULT NULL,
  `COL 10` varchar(22) DEFAULT NULL,
  `priority` char(1) NOT NULL,
  `camera` varchar(20) NOT NULL,
  `scode` char(2) NOT NULL DEFAULT 'BA',
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sec_sbi`
--

DROP TABLE IF EXISTS `sec_sbi`;
CREATE TABLE IF NOT EXISTS `sec_sbi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(22) DEFAULT NULL,
  `sensorname` varchar(59) DEFAULT NULL,
  `code` varchar(14) DEFAULT NULL,
  `COL 5` varchar(17) DEFAULT NULL,
  `COL 6` varchar(18) DEFAULT NULL,
  `COL 7` varchar(20) DEFAULT NULL,
  `COL 8` varchar(14) DEFAULT NULL,
  `COL 9` varchar(20) DEFAULT NULL,
  `COL 10` varchar(22) DEFAULT NULL,
  `priority` char(1) NOT NULL,
  `camera` varchar(20) NOT NULL,
  `scode` char(2) NOT NULL DEFAULT 'BA',
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scode` (`scode`),
  KEY `zone` (`zone`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settimeoutid`
--

DROP TABLE IF EXISTS `settimeoutid`;
CREATE TABLE IF NOT EXISTS `settimeoutid` (
  `Last_id` int(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sheet1`
--

DROP TABLE IF EXISTS `sheet1`;
CREATE TABLE IF NOT EXISTS `sheet1` (
  `A` varchar(4) DEFAULT NULL,
  `B` varchar(6) DEFAULT NULL,
  `C` varchar(5) DEFAULT NULL,
  `D` varchar(8) DEFAULT NULL,
  `E` varchar(4) DEFAULT NULL,
  `F` varchar(10) DEFAULT NULL,
  `G` varchar(7) DEFAULT NULL,
  `H` varchar(7) DEFAULT NULL,
  `I` varchar(7) DEFAULT NULL,
  `J` varchar(9) DEFAULT NULL,
  `K` varchar(12) DEFAULT NULL,
  `L` varchar(158) DEFAULT NULL,
  `M` varchar(4) DEFAULT NULL,
  `N` varchar(5) DEFAULT NULL,
  `O` varchar(4) DEFAULT NULL,
  `P` varchar(10) DEFAULT NULL,
  `Q` varchar(10) DEFAULT NULL,
  `R` varchar(10) DEFAULT NULL,
  `S` varchar(11) DEFAULT NULL,
  `T` varchar(9) DEFAULT NULL,
  `U` varchar(13) DEFAULT NULL,
  `V` varchar(16) DEFAULT NULL,
  `W` varchar(8) DEFAULT NULL,
  `X` varchar(8) DEFAULT NULL,
  `Y` varchar(4) DEFAULT NULL,
  `Z` varchar(10) DEFAULT NULL,
  `AA` varchar(14) DEFAULT NULL,
  `AB` varchar(8) DEFAULT NULL,
  `AC` varchar(7) DEFAULT NULL,
  `AD` varchar(6) DEFAULT NULL,
  `AE` varchar(11) DEFAULT NULL,
  `AF` varchar(7) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `signage_board`
--

DROP TABLE IF EXISTS `signage_board`;
CREATE TABLE IF NOT EXISTS `signage_board` (
  `record_no` int(50) NOT NULL AUTO_INCREMENT,
  `TdateTime` datetime NOT NULL,
  `VL` varchar(250) NOT NULL,
  `IL` varchar(250) NOT NULL,
  `KW` varchar(250) NOT NULL,
  `PF` varchar(250) NOT NULL,
  `VLL` varchar(250) NOT NULL,
  `KWHDEL` varchar(50) NOT NULL,
  PRIMARY KEY (`record_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
CREATE TABLE IF NOT EXISTS `sites` (
  `SN` int(3) NOT NULL AUTO_INCREMENT,
  `Status` varchar(22) DEFAULT NULL,
  `Phase` varchar(7) DEFAULT NULL,
  `Customer` varchar(25) DEFAULT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `ATMID` varchar(40) DEFAULT NULL,
  `ATMID_2` varchar(40) DEFAULT NULL,
  `ATMID_3` varchar(8) DEFAULT NULL,
  `ATMID_4` varchar(8) DEFAULT NULL,
  `TrackerNo` varchar(40) DEFAULT NULL,
  `ATMShortName` varchar(255) DEFAULT NULL,
  `SiteAddress` text,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Zone` varchar(15) DEFAULT NULL,
  `Panel_Make` varchar(20) DEFAULT NULL,
  `OldPanelID` varchar(6) DEFAULT NULL,
  `NewPanelID` varchar(10) DEFAULT NULL,
  `DVRIP` varchar(20) DEFAULT NULL,
  `DVRName` varchar(15) DEFAULT NULL,
  `DVR_Model_num` varchar(250) DEFAULT NULL,
  `Router_Model_num` varchar(250) DEFAULT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `live` char(10) NOT NULL DEFAULT 'N',
  `current_dt` datetime DEFAULT NULL,
  `mailreceive_dt` datetime DEFAULT NULL,
  `eng_name` varchar(50) DEFAULT NULL,
  `addedby` varchar(50) DEFAULT NULL,
  `editby` varchar(50) DEFAULT NULL,
  `site_remark` varchar(1000) DEFAULT NULL,
  `PanelIP` varchar(25) DEFAULT NULL,
  `AlertType` varchar(10) NOT NULL DEFAULT 'C',
  `live_date` date DEFAULT NULL,
  `RouterIp` varchar(50) DEFAULT NULL,
  `last_modified` int(11) NOT NULL DEFAULT '0',
  `partial_live` int(6) NOT NULL DEFAULT '0',
  `CTS_LocalBranch` varchar(200) DEFAULT NULL,
  `installationDate` datetime DEFAULT NULL,
  `old_atmid` varchar(60) DEFAULT NULL,
  `auto_alert` int(5) NOT NULL DEFAULT '0',
  `project` varchar(20) NOT NULL DEFAULT 'RMS',
  `comfortID` varchar(20) DEFAULT NULL,
  `panel_power_connection` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`SN`),
  KEY `live` (`live`),
  KEY `OldPanelID` (`OldPanelID`),
  KEY `DVRIP` (`DVRIP`),
  KEY `NewPanelID` (`NewPanelID`),
  KEY `Panel_Make` (`Panel_Make`),
  KEY `live_date` (`live_date`),
  KEY `Panel_Make_2` (`Panel_Make`),
  KEY `PanelIP` (`PanelIP`),
  KEY `auto_alert` (`auto_alert`),
  KEY `idx_sites` (`NewPanelID`,`ATMID`)
) ENGINE=MyISAM AUTO_INCREMENT=6969 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sites12112013`
--

DROP TABLE IF EXISTS `sites12112013`;
CREATE TABLE IF NOT EXISTS `sites12112013` (
  `SN` int(3) NOT NULL AUTO_INCREMENT,
  `Status` varchar(22) DEFAULT NULL,
  `Phase` varchar(7) DEFAULT NULL,
  `Customer` varchar(25) DEFAULT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `ATMID` varchar(40) DEFAULT NULL,
  `ATMID_2` varchar(40) DEFAULT NULL,
  `ATMID_3` varchar(8) DEFAULT NULL,
  `ATMID_4` varchar(8) DEFAULT NULL,
  `TrackerNo` varchar(40) DEFAULT NULL,
  `ATMShortName` varchar(255) DEFAULT NULL,
  `SiteAddress` text,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Zone` varchar(15) DEFAULT NULL,
  `Panel_Make` varchar(20) DEFAULT NULL,
  `OldPanelID` varchar(6) DEFAULT NULL,
  `NewPanelID` varchar(10) DEFAULT NULL,
  `DVRIP` varchar(20) DEFAULT NULL,
  `DVRName` varchar(15) DEFAULT NULL,
  `DVR_Model_num` varchar(250) DEFAULT NULL,
  `Router_Model_num` varchar(250) DEFAULT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `live` char(10) NOT NULL DEFAULT 'N',
  `current_dt` datetime DEFAULT NULL,
  `mailreceive_dt` datetime DEFAULT NULL,
  `eng_name` varchar(50) DEFAULT NULL,
  `addedby` varchar(50) DEFAULT NULL,
  `editby` varchar(50) DEFAULT NULL,
  `site_remark` varchar(1000) DEFAULT NULL,
  `PanelIP` varchar(25) DEFAULT NULL,
  `AlertType` varchar(10) NOT NULL DEFAULT 'C',
  `live_date` date DEFAULT NULL,
  `RouterIp` varchar(50) DEFAULT NULL,
  `last_modified` int(11) NOT NULL DEFAULT '0',
  `partial_live` int(6) NOT NULL DEFAULT '0',
  `CTS_LocalBranch` varchar(200) DEFAULT NULL,
  `installationDate` datetime DEFAULT NULL,
  `old_atmid` varchar(60) DEFAULT NULL,
  `auto_alert` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SN`),
  KEY `live` (`live`),
  KEY `OldPanelID` (`OldPanelID`),
  KEY `DVRIP` (`DVRIP`),
  KEY `NewPanelID` (`NewPanelID`),
  KEY `Panel_Make` (`Panel_Make`),
  KEY `live_date` (`live_date`),
  KEY `Panel_Make_2` (`Panel_Make`),
  KEY `PanelIP` (`PanelIP`),
  KEY `auto_alert` (`auto_alert`)
) ENGINE=MyISAM AUTO_INCREMENT=6691 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitesd`
--

DROP TABLE IF EXISTS `sitesd`;
CREATE TABLE IF NOT EXISTS `sitesd` (
  `SN` int(3) NOT NULL AUTO_INCREMENT,
  `Status` varchar(22) DEFAULT NULL,
  `Phase` varchar(7) DEFAULT NULL,
  `Customer` varchar(25) DEFAULT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `ATMID` varchar(40) DEFAULT NULL,
  `ATMID_2` varchar(8) DEFAULT NULL,
  `ATMID_3` varchar(8) DEFAULT NULL,
  `ATMID_4` varchar(8) DEFAULT NULL,
  `TrackerNo` varchar(40) DEFAULT NULL,
  `ATMShortName` varchar(150) DEFAULT NULL,
  `SiteAddress` text,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Zone` varchar(15) DEFAULT NULL,
  `Panel_Make` varchar(15) DEFAULT NULL,
  `OldPanelID` varchar(6) DEFAULT NULL,
  `NewPanelID` varchar(6) DEFAULT NULL,
  `DVRIP` varchar(20) DEFAULT NULL,
  `DVRName` varchar(15) DEFAULT NULL,
  `DVR_Model_num` varchar(250) DEFAULT NULL,
  `Router_Model_num` varchar(250) DEFAULT NULL,
  `UserName` varchar(5) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `live` char(1) NOT NULL DEFAULT 'N',
  `current_dt` datetime DEFAULT NULL,
  `mailreceive_dt` datetime DEFAULT NULL,
  `eng_name` varchar(50) DEFAULT NULL,
  `addedby` varchar(50) DEFAULT NULL,
  `editby` varchar(50) DEFAULT NULL,
  `site_remark` varchar(1000) DEFAULT NULL,
  `PanelIP` varchar(25) DEFAULT NULL,
  `DVR_Serial_num` varchar(200) DEFAULT NULL,
  `CTSLocalBranch` varchar(200) DEFAULT NULL,
  `CTS_BM_Name` varchar(200) DEFAULT NULL,
  `CTS_BM_Number` varchar(200) DEFAULT NULL,
  `HDD` varchar(200) DEFAULT NULL,
  `Camera1` varchar(200) DEFAULT NULL,
  `Camera2` varchar(200) DEFAULT NULL,
  `Camera3` varchar(200) DEFAULT NULL,
  `Attachment1` varchar(200) DEFAULT NULL,
  `Attachment2` varchar(200) DEFAULT NULL,
  `liveDate` datetime DEFAULT NULL,
  `install_Status` varchar(200) DEFAULT NULL,
  `Project_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`SN`),
  KEY `live` (`live`),
  KEY `OldPanelID` (`OldPanelID`),
  KEY `DVRIP` (`DVRIP`),
  KEY `NewPanelID` (`NewPanelID`),
  KEY `Panel_Make` (`Panel_Make`)
) ENGINE=MyISAM AUTO_INCREMENT=2373 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sites_11_05_2024`
--

DROP TABLE IF EXISTS `sites_11_05_2024`;
CREATE TABLE IF NOT EXISTS `sites_11_05_2024` (
  `SN` int(3) NOT NULL AUTO_INCREMENT,
  `Status` varchar(22) DEFAULT NULL,
  `Phase` varchar(7) DEFAULT NULL,
  `Customer` varchar(25) DEFAULT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `ATMID` varchar(40) DEFAULT NULL,
  `ATMID_2` varchar(40) DEFAULT NULL,
  `ATMID_3` varchar(8) DEFAULT NULL,
  `ATMID_4` varchar(8) DEFAULT NULL,
  `TrackerNo` varchar(40) DEFAULT NULL,
  `ATMShortName` varchar(255) DEFAULT NULL,
  `SiteAddress` text,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Zone` varchar(15) DEFAULT NULL,
  `Panel_Make` varchar(20) DEFAULT NULL,
  `OldPanelID` varchar(6) DEFAULT NULL,
  `NewPanelID` varchar(10) DEFAULT NULL,
  `DVRIP` varchar(20) DEFAULT NULL,
  `DVRName` varchar(15) DEFAULT NULL,
  `DVR_Model_num` varchar(250) DEFAULT NULL,
  `Router_Model_num` varchar(250) DEFAULT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `live` char(10) NOT NULL DEFAULT 'N',
  `current_dt` datetime DEFAULT NULL,
  `mailreceive_dt` datetime DEFAULT NULL,
  `eng_name` varchar(50) DEFAULT NULL,
  `addedby` varchar(50) DEFAULT NULL,
  `editby` varchar(50) DEFAULT NULL,
  `site_remark` varchar(1000) DEFAULT NULL,
  `PanelIP` varchar(25) DEFAULT NULL,
  `AlertType` varchar(10) NOT NULL DEFAULT 'C',
  `live_date` date DEFAULT NULL,
  `RouterIp` varchar(50) DEFAULT NULL,
  `last_modified` int(11) NOT NULL DEFAULT '0',
  `partial_live` int(6) NOT NULL DEFAULT '0',
  `CTS_LocalBranch` varchar(200) DEFAULT NULL,
  `installationDate` datetime DEFAULT NULL,
  `old_atmid` varchar(60) DEFAULT NULL,
  `auto_alert` int(5) NOT NULL DEFAULT '0',
  `project` varchar(20) NOT NULL DEFAULT 'RMS',
  PRIMARY KEY (`SN`),
  KEY `live` (`live`),
  KEY `OldPanelID` (`OldPanelID`),
  KEY `DVRIP` (`DVRIP`),
  KEY `NewPanelID` (`NewPanelID`),
  KEY `Panel_Make` (`Panel_Make`),
  KEY `live_date` (`live_date`),
  KEY `Panel_Make_2` (`Panel_Make`),
  KEY `PanelIP` (`PanelIP`),
  KEY `auto_alert` (`auto_alert`),
  KEY `idx_sites_11_05_2024` (`NewPanelID`,`ATMID`)
) ENGINE=MyISAM AUTO_INCREMENT=6877 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sites_24_07_2024`
--

DROP TABLE IF EXISTS `sites_24_07_2024`;
CREATE TABLE IF NOT EXISTS `sites_24_07_2024` (
  `SN` int(3) NOT NULL AUTO_INCREMENT,
  `Status` varchar(22) DEFAULT NULL,
  `Phase` varchar(7) DEFAULT NULL,
  `Customer` varchar(25) DEFAULT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `ATMID` varchar(40) DEFAULT NULL,
  `ATMID_2` varchar(40) DEFAULT NULL,
  `ATMID_3` varchar(8) DEFAULT NULL,
  `ATMID_4` varchar(8) DEFAULT NULL,
  `TrackerNo` varchar(40) DEFAULT NULL,
  `ATMShortName` varchar(255) DEFAULT NULL,
  `SiteAddress` text,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Zone` varchar(15) DEFAULT NULL,
  `Panel_Make` varchar(20) DEFAULT NULL,
  `OldPanelID` varchar(6) DEFAULT NULL,
  `NewPanelID` varchar(10) DEFAULT NULL,
  `DVRIP` varchar(20) DEFAULT NULL,
  `DVRName` varchar(15) DEFAULT NULL,
  `DVR_Model_num` varchar(250) DEFAULT NULL,
  `Router_Model_num` varchar(250) DEFAULT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `live` char(10) NOT NULL DEFAULT 'N',
  `current_dt` datetime DEFAULT NULL,
  `mailreceive_dt` datetime DEFAULT NULL,
  `eng_name` varchar(50) DEFAULT NULL,
  `addedby` varchar(50) DEFAULT NULL,
  `editby` varchar(50) DEFAULT NULL,
  `site_remark` varchar(1000) DEFAULT NULL,
  `PanelIP` varchar(25) DEFAULT NULL,
  `AlertType` varchar(10) NOT NULL DEFAULT 'C',
  `live_date` date DEFAULT NULL,
  `RouterIp` varchar(50) DEFAULT NULL,
  `last_modified` int(11) NOT NULL DEFAULT '0',
  `partial_live` int(6) NOT NULL DEFAULT '0',
  `CTS_LocalBranch` varchar(200) DEFAULT NULL,
  `installationDate` datetime DEFAULT NULL,
  `old_atmid` varchar(60) DEFAULT NULL,
  `auto_alert` int(5) NOT NULL DEFAULT '0',
  `project` varchar(20) NOT NULL DEFAULT 'RMS',
  `comfortID` varchar(20) DEFAULT NULL,
  `router_port` int(5) NOT NULL DEFAULT '0',
  `dvr_nvr_port` int(5) NOT NULL DEFAULT '0',
  `panel_port` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SN`),
  KEY `live` (`live`),
  KEY `OldPanelID` (`OldPanelID`),
  KEY `DVRIP` (`DVRIP`),
  KEY `NewPanelID` (`NewPanelID`),
  KEY `Panel_Make` (`Panel_Make`),
  KEY `live_date` (`live_date`),
  KEY `Panel_Make_2` (`Panel_Make`),
  KEY `PanelIP` (`PanelIP`),
  KEY `auto_alert` (`auto_alert`),
  KEY `idx_sites_24_07_2024` (`NewPanelID`,`ATMID`)
) ENGINE=MyISAM AUTO_INCREMENT=6930 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sites_backup`
--

DROP TABLE IF EXISTS `sites_backup`;
CREATE TABLE IF NOT EXISTS `sites_backup` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `Status` varchar(22) DEFAULT NULL,
  `Phase` varchar(7) DEFAULT NULL,
  `Customer` varchar(25) DEFAULT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `ATMID` varchar(40) DEFAULT NULL,
  `ATMID_2` varchar(8) DEFAULT NULL,
  `ATMID_3` varchar(8) DEFAULT NULL,
  `ATMID_4` varchar(8) DEFAULT NULL,
  `TrackerNo` varchar(40) DEFAULT NULL,
  `ATMShortName` varchar(150) DEFAULT NULL,
  `SiteAddress` text,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Zone` varchar(15) DEFAULT NULL,
  `Panel_Make` varchar(20) DEFAULT NULL,
  `OldPanelID` varchar(6) DEFAULT NULL,
  `NewPanelID` varchar(6) DEFAULT NULL,
  `DVRIP` varchar(20) DEFAULT NULL,
  `DVRName` varchar(15) DEFAULT NULL,
  `DVR_Model_num` varchar(250) DEFAULT NULL,
  `Router_Model_num` varchar(250) DEFAULT NULL,
  `UserName` varchar(5) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `live` char(1) NOT NULL DEFAULT 'N',
  `current_dt` datetime DEFAULT NULL,
  `mailreceive_dt` datetime DEFAULT NULL,
  `eng_name` varchar(50) DEFAULT NULL,
  `addedby` varchar(50) DEFAULT NULL,
  `editby` varchar(50) DEFAULT NULL,
  `site_remark` varchar(1000) DEFAULT NULL,
  `PanelIP` varchar(25) DEFAULT NULL,
  `AlertType` varchar(10) NOT NULL DEFAULT 'C',
  `live_date` date DEFAULT NULL,
  `CTS_LocalBranch` varchar(50) DEFAULT NULL,
  `RouterIp` varchar(50) DEFAULT NULL,
  `last_modified` int(11) NOT NULL DEFAULT '0',
  `partial_live` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `live` (`live`),
  KEY `OldPanelID` (`OldPanelID`),
  KEY `DVRIP` (`DVRIP`),
  KEY `NewPanelID` (`NewPanelID`),
  KEY `Panel_Make` (`Panel_Make`),
  KEY `live_date` (`live_date`)
) ENGINE=MyISAM AUTO_INCREMENT=3028 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sites_details`
--

DROP TABLE IF EXISTS `sites_details`;
CREATE TABLE IF NOT EXISTS `sites_details` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `site_id` int(10) DEFAULT NULL,
  `project` int(10) DEFAULT NULL,
  `routebrand` varchar(50) DEFAULT NULL,
  `router_id` varchar(50) DEFAULT NULL,
  `simnumber` varchar(50) DEFAULT NULL,
  `simowner` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` varchar(20) NOT NULL,
  `closedDate` varchar(60) DEFAULT NULL,
  `statusType` varchar(15) NOT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2854 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sites_info`
--

DROP TABLE IF EXISTS `sites_info`;
CREATE TABLE IF NOT EXISTS `sites_info` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `site_id` int(6) DEFAULT NULL,
  `atmid` varchar(40) DEFAULT NULL,
  `cam_ip` varchar(40) DEFAULT NULL,
  `port` varchar(40) DEFAULT NULL,
  `cam_name` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4460 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sites_log`
--

DROP TABLE IF EXISTS `sites_log`;
CREATE TABLE IF NOT EXISTS `sites_log` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `Status` varchar(22) DEFAULT NULL,
  `Phase` varchar(7) DEFAULT NULL,
  `Customer` varchar(7) DEFAULT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `ATMID` varchar(15) DEFAULT NULL,
  `ATMID_2` varchar(8) DEFAULT NULL,
  `ATMID_3` varchar(8) DEFAULT NULL,
  `ATMID_4` varchar(8) DEFAULT NULL,
  `TrackerNo` varchar(15) DEFAULT NULL,
  `ATMShortName` varchar(150) DEFAULT NULL,
  `SiteAddress` text,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Zone` varchar(15) DEFAULT NULL,
  `Panel_Make` varchar(20) DEFAULT NULL,
  `OldPanelID` varchar(6) DEFAULT NULL,
  `NewPanelID` varchar(6) DEFAULT NULL,
  `DVRIP` varchar(14) DEFAULT NULL,
  `DVRName` varchar(15) DEFAULT NULL,
  `UserName` varchar(5) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `live` char(1) NOT NULL DEFAULT 'N',
  `current_dt` datetime DEFAULT NULL,
  `mailreceive_dt` datetime DEFAULT NULL,
  `eng_name` varchar(50) DEFAULT NULL,
  `addedby` varchar(50) DEFAULT NULL,
  `editby` varchar(50) DEFAULT NULL,
  `site_remark` varchar(1000) NOT NULL,
  `site_id` varchar(10) NOT NULL,
  `old_atmid` varchar(40) NOT NULL,
  `live_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `live` (`live`),
  KEY `OldPanelID` (`OldPanelID`),
  KEY `DVRIP` (`DVRIP`),
  KEY `NewPanelID` (`NewPanelID`),
  KEY `ATMID` (`ATMID`)
) ENGINE=MyISAM AUTO_INCREMENT=17009 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sites_server_wise1`
--

DROP TABLE IF EXISTS `sites_server_wise1`;
CREATE TABLE IF NOT EXISTS `sites_server_wise1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ATMID` varchar(120) NOT NULL,
  `server_name` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sites_server_wise1` (`ATMID`,`server_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5228 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sites_siminfo`
--

DROP TABLE IF EXISTS `sites_siminfo`;
CREATE TABLE IF NOT EXISTS `sites_siminfo` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `atmid` varchar(20) DEFAULT NULL,
  `simnnumber` varchar(20) DEFAULT NULL,
  `simowner` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3293 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `site_attachment`
--

DROP TABLE IF EXISTS `site_attachment`;
CREATE TABLE IF NOT EXISTS `site_attachment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(50) DEFAULT NULL,
  `mail_attachment` varchar(250) DEFAULT NULL,
  `files` varchar(250) DEFAULT NULL,
  `installation_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6114 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `site_circle`
--

DROP TABLE IF EXISTS `site_circle`;
CREATE TABLE IF NOT EXISTS `site_circle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ATMID` varchar(128) DEFAULT NULL,
  `site_type` varchar(120) DEFAULT NULL,
  `Bank` varchar(128) DEFAULT NULL,
  `Zonal` varchar(25) DEFAULT NULL,
  `Circle` text,
  `sn` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3456 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `site_circle_19_07_2024`
--

DROP TABLE IF EXISTS `site_circle_19_07_2024`;
CREATE TABLE IF NOT EXISTS `site_circle_19_07_2024` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ATMID` varchar(128) DEFAULT NULL,
  `site_type` varchar(120) DEFAULT NULL,
  `Bank` varchar(128) DEFAULT NULL,
  `Zonal` varchar(25) DEFAULT NULL,
  `Circle` text,
  `sn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3461 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `site_circle_28_06_2024`
--

DROP TABLE IF EXISTS `site_circle_28_06_2024`;
CREATE TABLE IF NOT EXISTS `site_circle_28_06_2024` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ATMID` varchar(128) DEFAULT NULL,
  `site_type` varchar(120) DEFAULT NULL,
  `Bank` varchar(128) DEFAULT NULL,
  `Zonal` varchar(25) DEFAULT NULL,
  `Circle` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3375 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `site_circle_zonal`
--

DROP TABLE IF EXISTS `site_circle_zonal`;
CREATE TABLE IF NOT EXISTS `site_circle_zonal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Zonal` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `site_testing_log`
--

DROP TABLE IF EXISTS `site_testing_log`;
CREATE TABLE IF NOT EXISTS `site_testing_log` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `backroom` varchar(50) NOT NULL,
  `rebackroom` text NOT NULL,
  `panic` varchar(50) NOT NULL,
  `repanic` text NOT NULL,
  `twoway` varchar(50) NOT NULL,
  `retwoway` text NOT NULL,
  `glass` varchar(50) NOT NULL,
  `reglass` text NOT NULL,
  `Camara` varchar(50) NOT NULL,
  `reCamara` text NOT NULL,
  `bCamara` varchar(50) NOT NULL,
  `rebCamara` text NOT NULL,
  `oCamara` varchar(50) NOT NULL,
  `reobCamara` text NOT NULL,
  `HDD` varchar(50) NOT NULL,
  `reHDD` text NOT NULL,
  `entrydt` datetime NOT NULL,
  `eng_name` varchar(50) NOT NULL,
  `testby` varchar(50) NOT NULL,
  `dvrip` varchar(50) NOT NULL,
  `panel` varchar(50) NOT NULL,
  `repanel` text NOT NULL,
  `paneltemper` varchar(50) NOT NULL,
  `repaneltemper` text NOT NULL,
  `dvrstatus` varchar(50) NOT NULL,
  `redvrstatus` text NOT NULL,
  `dvrvol` varchar(50) NOT NULL,
  `redvrvol` text NOT NULL,
  `eml` varchar(50) NOT NULL,
  `reeml` text NOT NULL,
  `upscable` varchar(50) NOT NULL,
  `reupscable` text NOT NULL,
  `keypad` varchar(50) NOT NULL,
  `rekeypad` text NOT NULL,
  `Antenna` varchar(50) NOT NULL,
  `reAntenna` text NOT NULL,
  `pirsensor` varchar(50) NOT NULL,
  `repirsensor` text NOT NULL,
  `Smoke` varchar(50) NOT NULL,
  `reSmoke` text NOT NULL,
  `Shutter` varchar(50) NOT NULL,
  `reShutter` text NOT NULL,
  `Hooter` varchar(50) NOT NULL,
  `reHooter` text NOT NULL,
  `AC1` varchar(50) NOT NULL,
  `reAC1` text NOT NULL,
  `AC2` varchar(50) NOT NULL,
  `reAC2` text NOT NULL,
  `enableloby` varchar(50) NOT NULL,
  `reenableloby` text NOT NULL,
  `enableback` varchar(50) NOT NULL,
  `reenableback` text NOT NULL,
  `enableOut` varchar(50) NOT NULL,
  `reenableOut` text NOT NULL,
  `dvrtime` varchar(50) NOT NULL,
  `redvrtime` text NOT NULL,
  `recording_scheduling` varchar(50) NOT NULL,
  `rerecording_scheduling` text NOT NULL,
  `Light` varchar(50) NOT NULL,
  `reLight` text NOT NULL,
  `CRAsensor1` varchar(50) NOT NULL,
  `reCRAsensor1` text NOT NULL,
  `CRAsensor2` varchar(50) NOT NULL,
  `reCRAsensor2` text NOT NULL,
  `CRAsensor3` varchar(50) NOT NULL,
  `reCRAsensor3` text NOT NULL,
  `hddfoot` varchar(50) NOT NULL,
  `fromdt` varchar(250) DEFAULT NULL,
  `todate` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `site_test_log_details`
--

DROP TABLE IF EXISTS `site_test_log_details`;
CREATE TABLE IF NOT EXISTS `site_test_log_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testcountid` int(11) NOT NULL,
  `atmid` varchar(40) NOT NULL,
  `remark` varchar(250) NOT NULL,
  `Added_By` varchar(100) NOT NULL,
  `entrydate` datetime NOT NULL,
  `engiName` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3030 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smarti`
--

DROP TABLE IF EXISTS `smarti`;
CREATE TABLE IF NOT EXISTS `smarti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SensorName` varchar(41) DEFAULT NULL,
  `Code` varchar(6) DEFAULT NULL,
  `RestoreCode` varchar(8) DEFAULT NULL,
  `ZONE` varchar(4) DEFAULT NULL,
  `SCODE` varchar(2) DEFAULT NULL,
  `PRIORITY` char(1) DEFAULT NULL,
  `Camera` varchar(30) NOT NULL,
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ZONE` (`ZONE`,`SCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smartialarms`
--

DROP TABLE IF EXISTS `smartialarms`;
CREATE TABLE IF NOT EXISTS `smartialarms` (
  `Zone` varchar(3) DEFAULT NULL,
  `Type of Sensor` varchar(27) DEFAULT NULL,
  `Description` varchar(64) DEFAULT NULL,
  `SH` varchar(1) DEFAULT NULL,
  `Code` varchar(6) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Camera` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Zone` (`Zone`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smartinew`
--

DROP TABLE IF EXISTS `smartinew`;
CREATE TABLE IF NOT EXISTS `smartinew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SensorName` varchar(200) DEFAULT NULL,
  `Code` varchar(200) DEFAULT NULL,
  `RestoreCode` varchar(200) DEFAULT NULL,
  `ZONE` varchar(200) DEFAULT NULL,
  `SCODE` varchar(200) DEFAULT NULL,
  `PRIORITY` varchar(200) DEFAULT NULL,
  `Camera` varchar(200) DEFAULT NULL,
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smarti_boi`
--

DROP TABLE IF EXISTS `smarti_boi`;
CREATE TABLE IF NOT EXISTS `smarti_boi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SensorName` varchar(41) DEFAULT NULL,
  `Code` varchar(6) DEFAULT NULL,
  `RestoreCode` varchar(8) DEFAULT NULL,
  `ZONE` varchar(4) DEFAULT NULL,
  `SCODE` varchar(2) DEFAULT NULL,
  `PRIORITY` char(1) DEFAULT NULL,
  `Camera` varchar(30) NOT NULL,
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ZONE` (`ZONE`,`SCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smarti_hdfc32`
--

DROP TABLE IF EXISTS `smarti_hdfc32`;
CREATE TABLE IF NOT EXISTS `smarti_hdfc32` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SensorName` varchar(41) DEFAULT NULL,
  `Code` varchar(6) DEFAULT NULL,
  `RestoreCode` varchar(8) DEFAULT NULL,
  `ZONE` varchar(4) DEFAULT NULL,
  `SCODE` varchar(2) DEFAULT NULL,
  `PRIORITY` char(1) DEFAULT NULL,
  `Camera` varchar(30) NOT NULL,
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ZONE` (`ZONE`,`SCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smarti_pnb`
--

DROP TABLE IF EXISTS `smarti_pnb`;
CREATE TABLE IF NOT EXISTS `smarti_pnb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SensorName` varchar(41) DEFAULT NULL,
  `Code` varchar(6) DEFAULT NULL,
  `RestoreCode` varchar(8) DEFAULT NULL,
  `ZONE` varchar(4) DEFAULT NULL,
  `SCODE` varchar(2) DEFAULT NULL,
  `PRIORITY` char(1) DEFAULT NULL,
  `Camera` varchar(30) NOT NULL,
  `comfort_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ZONE` (`ZONE`,`SCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(50) NOT NULL,
  `emailid` text NOT NULL,
  `branch_id` varchar(11) NOT NULL,
  PRIMARY KEY (`state_id`),
  UNIQUE KEY `state` (`state`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_menu`
--

DROP TABLE IF EXISTS `sub_menu`;
CREATE TABLE IF NOT EXISTS `sub_menu` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `main_menu` int(10) DEFAULT NULL,
  `sub_menu` varchar(60) DEFAULT NULL,
  `page` varchar(500) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page` (`page`),
  UNIQUE KEY `sub_menu` (`sub_menu`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table 68`
--

DROP TABLE IF EXISTS `table 68`;
CREATE TABLE IF NOT EXISTS `table 68` (
  `COL 1` varchar(2) DEFAULT NULL,
  `COL 2` varchar(8) DEFAULT NULL,
  `COL 3` varchar(8) DEFAULT NULL,
  `COL 4` varchar(11) DEFAULT NULL,
  `COL 5` varchar(9) DEFAULT NULL,
  `COL 6` varchar(10) DEFAULT NULL,
  `COL 7` varchar(9) DEFAULT NULL,
  `COL 8` varchar(12) DEFAULT NULL,
  `COL 9` varchar(11) DEFAULT NULL,
  `COL 10` varchar(4) DEFAULT NULL,
  `COL 11` varchar(5) DEFAULT NULL,
  `COL 12` varchar(5) DEFAULT NULL,
  `COL 13` varchar(7) DEFAULT NULL,
  `COL 14` varchar(7) DEFAULT NULL,
  `COL 15` varchar(7) DEFAULT NULL,
  `COL 16` varchar(8) DEFAULT NULL,
  `COL 17` varchar(8) DEFAULT NULL,
  `COL 18` varchar(21) DEFAULT NULL,
  `COL 19` varchar(21) DEFAULT NULL,
  `COL 20` varchar(8) DEFAULT NULL,
  `COL 21` varchar(27) DEFAULT NULL,
  `COL 22` varchar(21) DEFAULT NULL,
  `COL 23` varchar(26) DEFAULT NULL,
  `COL 24` varchar(21) DEFAULT NULL,
  `COL 25` varchar(26) DEFAULT NULL,
  `COL 26` varchar(32) DEFAULT NULL,
  `COL 27` varchar(61) DEFAULT NULL,
  `COL 28` varchar(39) DEFAULT NULL,
  `COL 29` varchar(18) DEFAULT NULL,
  `COL 30` varchar(22) DEFAULT NULL,
  `COL 31` varchar(30) DEFAULT NULL,
  `COL 32` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `table 94`
--

DROP TABLE IF EXISTS `table 94`;
CREATE TABLE IF NOT EXISTS `table 94` (
  `ATM ID` varchar(25) DEFAULT NULL,
  `E-Surveillance Live Date` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `table 95`
--

DROP TABLE IF EXISTS `table 95`;
CREATE TABLE IF NOT EXISTS `table 95` (
  `ATM ID` varchar(25) DEFAULT NULL,
  `E-Surveillance Live Date` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `table 105`
--

DROP TABLE IF EXISTS `table 105`;
CREATE TABLE IF NOT EXISTS `table 105` (
  `COL 1` varchar(20) DEFAULT NULL,
  `COL 2` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `table 112`
--

DROP TABLE IF EXISTS `table 112`;
CREATE TABLE IF NOT EXISTS `table 112` (
  `COL 1` varchar(4) DEFAULT NULL,
  `COL 2` varchar(10) DEFAULT NULL,
  `COL 3` varchar(218) DEFAULT NULL,
  `COL 4` varchar(13) DEFAULT NULL,
  `COL 5` varchar(14) DEFAULT NULL,
  `COL 6` varchar(10) DEFAULT NULL,
  `COL 7` varchar(20) DEFAULT NULL,
  `COL 8` varchar(21) DEFAULT NULL,
  `COL 9` varchar(40) DEFAULT NULL,
  `COL 10` varchar(6) DEFAULT NULL,
  `COL 11` varchar(12) DEFAULT NULL,
  `COL 12` varchar(16) DEFAULT NULL,
  `COL 13` varchar(6) DEFAULT NULL,
  `COL 14` varchar(11) DEFAULT NULL,
  `COL 15` varchar(18) DEFAULT NULL,
  `COL 16` varchar(8) DEFAULT NULL,
  `COL 17` varchar(8) DEFAULT NULL,
  `COL 18` varchar(3) DEFAULT NULL,
  `COL 19` varchar(10) DEFAULT NULL,
  `COL 20` varchar(15) DEFAULT NULL,
  `COL 21` varchar(18) DEFAULT NULL,
  `COL 22` varchar(27) DEFAULT NULL,
  `COL 23` varchar(28) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `table 166`
--

DROP TABLE IF EXISTS `table 166`;
CREATE TABLE IF NOT EXISTS `table 166` (
  `COL 1` varchar(1194) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `table 167`
--

DROP TABLE IF EXISTS `table 167`;
CREATE TABLE IF NOT EXISTS `table 167` (
  `COL 1` varchar(1194) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `table 168`
--

DROP TABLE IF EXISTS `table 168`;
CREATE TABLE IF NOT EXISTS `table 168` (
  `COL 1` varchar(5) DEFAULT NULL,
  `COL 2` varchar(8) DEFAULT NULL,
  `COL 3` varchar(8) DEFAULT NULL,
  `COL 4` varchar(21) DEFAULT NULL,
  `COL 5` varchar(13) DEFAULT NULL,
  `COL 6` varchar(223) DEFAULT NULL,
  `COL 7` varchar(105) DEFAULT NULL,
  `COL 8` varchar(17) DEFAULT NULL,
  `COL 9` varchar(5) DEFAULT NULL,
  `COL 10` varchar(134) DEFAULT NULL,
  `COL 11` varchar(14) DEFAULT NULL,
  `COL 12` varchar(13) DEFAULT NULL,
  `COL 13` varchar(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `table 238`
--

DROP TABLE IF EXISTS `table 238`;
CREATE TABLE IF NOT EXISTS `table 238` (
  `COL 1` varchar(1073) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tanishqsites`
--

DROP TABLE IF EXISTS `tanishqsites`;
CREATE TABLE IF NOT EXISTS `tanishqsites` (
  `TSN` int(11) NOT NULL AUTO_INCREMENT,
  `BranchID` int(11) NOT NULL,
  `DVRIP` varchar(14) NOT NULL,
  `DVRName` varchar(9) NOT NULL,
  `Channel` char(20) NOT NULL,
  `UserName` varchar(5) NOT NULL,
  `Password` varchar(8) NOT NULL,
  PRIMARY KEY (`TSN`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tani_common_region_email`
--

DROP TABLE IF EXISTS `tani_common_region_email`;
CREATE TABLE IF NOT EXISTS `tani_common_region_email` (
  `CREID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailAddress` varchar(500) NOT NULL,
  `Status` char(1) NOT NULL,
  PRIMARY KEY (`CREID`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tani_region_email`
--

DROP TABLE IF EXISTS `tani_region_email`;
CREATE TABLE IF NOT EXISTS `tani_region_email` (
  `EmailID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailAddress` varchar(500) NOT NULL,
  `region` varchar(50) NOT NULL,
  `Status` char(1) NOT NULL,
  PRIMARY KEY (`EmailID`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temperature`
--

DROP TABLE IF EXISTS `temperature`;
CREATE TABLE IF NOT EXISTS `temperature` (
  `record_no` int(10) NOT NULL AUTO_INCREMENT,
  `tdatetime` datetime NOT NULL,
  `tmpr` varchar(20) NOT NULL,
  `hum` varchar(20) NOT NULL,
  `minoftime` varchar(50) NOT NULL,
  PRIMARY KEY (`record_no`)
) ENGINE=MyISAM AUTO_INCREMENT=34819 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `temp_20221123061038`
--

DROP TABLE IF EXISTS `temp_20221123061038`;
CREATE TABLE IF NOT EXISTS `temp_20221123061038` (
  `Client Name` varchar(25) DEFAULT NULL,
  `Incident Number` int(11) NOT NULL DEFAULT '0',
  `Region` varchar(3) NOT NULL,
  `ATMID` varchar(40) DEFAULT NULL,
  `Address` text,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Incident Date Time` datetime NOT NULL,
  `Alarm Received Date Time` datetime DEFAULT CURRENT_TIMESTAMP,
  `Close Date Time` datetime DEFAULT CURRENT_TIMESTAMP,
  `DVRIP` varchar(20) DEFAULT NULL,
  `panelid` varchar(10) NOT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `Reactive` char(0) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `Closed By` varchar(20) DEFAULT NULL,
  `Closed Date` datetime DEFAULT NULL,
  `Remark` char(0) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `zone` varchar(3) NOT NULL,
  `alarm` varchar(3) NOT NULL,
  `Panel_Make` varchar(20) DEFAULT NULL,
  `Incident Category` char(0) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `Alarm Message` varchar(8) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temp_saa`
--

DROP TABLE IF EXISTS `temp_saa`;
CREATE TABLE IF NOT EXISTS `temp_saa` (
  `Client Name` varchar(25) DEFAULT NULL,
  `Incident Number` int(11) NOT NULL DEFAULT '0',
  `Region` varchar(15) DEFAULT NULL,
  `ATMID` varchar(40) DEFAULT NULL,
  `City` varchar(17) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Incident Date Time` datetime NOT NULL,
  `Alarm Received Date Time` datetime DEFAULT CURRENT_TIMESTAMP,
  `Close Date Time` datetime DEFAULT CURRENT_TIMESTAMP,
  `DVRIP` varchar(20) DEFAULT NULL,
  `panelid` varchar(10) NOT NULL,
  `Bank` varchar(13) DEFAULT NULL,
  `Reactive` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Closed By` varchar(20) DEFAULT NULL,
  `Closed Date` datetime DEFAULT NULL,
  `Remark` text,
  `zone` varchar(3) NOT NULL,
  `alarm` varchar(3) NOT NULL,
  `Panel_Make` varchar(20) DEFAULT NULL,
  `Incident Category` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Alarm Message` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testemail`
--

DROP TABLE IF EXISTS `testemail`;
CREATE TABLE IF NOT EXISTS `testemail` (
  `TEID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailAddress` varchar(500) NOT NULL,
  `ATMID` varchar(15) NOT NULL,
  PRIMARY KEY (`TEID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testingcount`
--

DROP TABLE IF EXISTS `testingcount`;
CREATE TABLE IF NOT EXISTS `testingcount` (
  `Test_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Atmid` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `entrydate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Action` varchar(250) NOT NULL,
  `engiName` varchar(100) NOT NULL,
  PRIMARY KEY (`Test_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=14122 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testingsites`
--

DROP TABLE IF EXISTS `testingsites`;
CREATE TABLE IF NOT EXISTS `testingsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atmid` varchar(250) NOT NULL,
  `status` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6918 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testing_alertdetails`
--

DROP TABLE IF EXISTS `testing_alertdetails`;
CREATE TABLE IF NOT EXISTS `testing_alertdetails` (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `incident_id` int(11) NOT NULL,
  `TestingByService` varchar(100) NOT NULL,
  `remark` text NOT NULL,
  `entrydate` datetime NOT NULL,
  `engiName` varchar(100) NOT NULL,
  PRIMARY KEY (`alert_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34726 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_cron`
--

DROP TABLE IF EXISTS `test_cron`;
CREATE TABLE IF NOT EXISTS `test_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_query`
--

DROP TABLE IF EXISTS `test_query`;
CREATE TABLE IF NOT EXISTS `test_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qry` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `theft_ticket_raise`
--

DROP TABLE IF EXISTS `theft_ticket_raise`;
CREATE TABLE IF NOT EXISTS `theft_ticket_raise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` varchar(100) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `atmid` varchar(100) NOT NULL,
  `incident` text NOT NULL,
  `file` text,
  `remarks` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_raise`
--

DROP TABLE IF EXISTS `ticket_raise`;
CREATE TABLE IF NOT EXISTS `ticket_raise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(50) DEFAULT NULL,
  `client` varchar(100) DEFAULT NULL,
  `portal` varchar(155) DEFAULT NULL,
  `ticket_status` int(11) DEFAULT NULL COMMENT '0=close, 1=active',
  `created_date` datetime DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `close_date` datetime DEFAULT NULL,
  `location` varchar(155) DEFAULT NULL,
  `atmid` varchar(155) DEFAULT NULL,
  `alert_type` varchar(255) DEFAULT NULL,
  `dvr_ip` varchar(155) DEFAULT NULL,
  `alarm_type` varchar(70) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_raise_history`
--

DROP TABLE IF EXISTS `ticket_raise_history`;
CREATE TABLE IF NOT EXISTS `ticket_raise_history` (
  `id` int(11) NOT NULL,
  `ticket_raise_id` int(11) DEFAULT NULL,
  `ticket_id` varchar(50) DEFAULT NULL,
  `client` varchar(100) DEFAULT NULL,
  `created_by` varchar(155) DEFAULT NULL,
  `ticket_status` int(11) DEFAULT NULL COMMENT '0=close, 1=active',
  `created_date` datetime DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `close_date` datetime DEFAULT NULL,
  `location` varchar(155) DEFAULT NULL,
  `atmid` varchar(155) DEFAULT NULL,
  `alert_type` varchar(255) DEFAULT NULL,
  `dvr_ip` varchar(155) DEFAULT NULL,
  `alarm_type` varchar(70) DEFAULT NULL,
  `remarks` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `uname` varchar(15) NOT NULL,
  `pwd` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `videodownloadiplist`
--

DROP TABLE IF EXISTS `videodownloadiplist`;
CREATE TABLE IF NOT EXISTS `videodownloadiplist` (
  `VDIPID` int(11) NOT NULL AUTO_INCREMENT,
  `DVRIP` varchar(20) DEFAULT NULL,
  `DVRName` varchar(15) DEFAULT NULL,
  `UserName` varchar(15) DEFAULT NULL,
  `Password` varchar(15) DEFAULT NULL,
  `CameraNo` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `FromTime` time DEFAULT NULL,
  `ToTime` time DEFAULT NULL,
  `Progress` int(11) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`VDIPID`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `viewsitesmenu`
--

DROP TABLE IF EXISTS `viewsitesmenu`;
CREATE TABLE IF NOT EXISTS `viewsitesmenu` (
  `MenuID` int(11) NOT NULL AUTO_INCREMENT,
  `MenuName` text NOT NULL,
  `IsChild` int(11) DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `ParentViewLevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wsites`
--

DROP TABLE IF EXISTS `wsites`;
CREATE TABLE IF NOT EXISTS `wsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `wdata` text NOT NULL,
  `rtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `panelid` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rtime` (`rtime`),
  KEY `ip` (`ip`),
  KEY `panelid` (`panelid`),
  KEY `idx_wsites` (`panelid`,`rtime`)
) ENGINE=MyISAM AUTO_INCREMENT=82928083 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wsites1`
--

DROP TABLE IF EXISTS `wsites1`;
CREATE TABLE IF NOT EXISTS `wsites1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `wdata` text NOT NULL,
  `rtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `panelid` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rtime` (`rtime`),
  KEY `ip` (`ip`),
  KEY `panelid` (`panelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wsites3`
--

DROP TABLE IF EXISTS `wsites3`;
CREATE TABLE IF NOT EXISTS `wsites3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `wdata` text NOT NULL,
  `rtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `panelid` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rtime` (`rtime`),
  KEY `ip` (`ip`),
  KEY `panelid` (`panelid`),
  KEY `idx_wsites` (`panelid`,`rtime`)
) ENGINE=MyISAM AUTO_INCREMENT=77021212 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wsites5`
--

DROP TABLE IF EXISTS `wsites5`;
CREATE TABLE IF NOT EXISTS `wsites5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `wdata` text NOT NULL,
  `rtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `panelid` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rtime` (`rtime`),
  KEY `ip` (`ip`),
  KEY `panelid` (`panelid`),
  KEY `idx_wsites` (`panelid`,`rtime`)
) ENGINE=MyISAM AUTO_INCREMENT=536004 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `zonebypass_mail`
--

DROP TABLE IF EXISTS `zonebypass_mail`;
CREATE TABLE IF NOT EXISTS `zonebypass_mail` (
  `CREID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailAddress` varchar(500) NOT NULL,
  `Status` char(1) NOT NULL,
  PRIMARY KEY (`CREID`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `zonecameras`
--

DROP TABLE IF EXISTS `zonecameras`;
CREATE TABLE IF NOT EXISTS `zonecameras` (
  `ZoneNo` varchar(3) DEFAULT NULL,
  `ConnectorNos` varchar(2) DEFAULT NULL,
  `Description` varchar(62) DEFAULT NULL,
  `SH` varchar(1) DEFAULT NULL,
  `Camera` varchar(25) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `ZoneNo` (`ZoneNo`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
CREATE TABLE IF NOT EXISTS `zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
