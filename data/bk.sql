-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 22, 2012 at 07:56 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `zencart`
--
CREATE DATABASE `zencart` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `zencart`;

-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
CREATE TABLE IF NOT EXISTS `address_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `entry_gender` char(1) NOT NULL DEFAULT '',
  `entry_company` varchar(64) DEFAULT NULL,
  `entry_firstname` varchar(32) NOT NULL DEFAULT '',
  `entry_lastname` varchar(32) NOT NULL DEFAULT '',
  `entry_street_address` varchar(64) NOT NULL DEFAULT '',
  `entry_suburb` varchar(32) DEFAULT NULL,
  `entry_postcode` varchar(10) NOT NULL DEFAULT '',
  `entry_city` varchar(32) NOT NULL DEFAULT '',
  `entry_state` varchar(32) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `address_book`
--

INSERT INTO `address_book` (`address_book_id`, `customers_id`, `entry_gender`, `entry_company`, `entry_firstname`, `entry_lastname`, `entry_street_address`, `entry_suburb`, `entry_postcode`, `entry_city`, `entry_state`, `entry_country_id`, `entry_zone_id`) VALUES
(1, 1, 'f', '', 'test', 'test', 'testtesttesttesttest', 'testtesttesttest', '111111', 'testtesttest', 'testtest', 44, 0),
(2, 2, 'm', '', 'johnny', 'ma', 'street No.1 33#', '', '111222', 'New York', '', 223, 43);

-- --------------------------------------------------------

--
-- Table structure for table `address_format`
--

DROP TABLE IF EXISTS `address_format`;
CREATE TABLE IF NOT EXISTS `address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) NOT NULL DEFAULT '',
  `address_summary` varchar(48) NOT NULL DEFAULT '',
  PRIMARY KEY (`address_format_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `address_format`
--

INSERT INTO `address_format` (`address_format_id`, `address_format`, `address_summary`) VALUES
(1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country'),
(2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country'),
(3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country'),
(4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country'),
(5, '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country'),
(6, '$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country', '$postcode / $country');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(32) NOT NULL DEFAULT '',
  `admin_email` varchar(96) NOT NULL DEFAULT '',
  `admin_profile` int(11) NOT NULL DEFAULT '0',
  `admin_pass` varchar(40) NOT NULL DEFAULT '',
  `prev_pass1` varchar(40) NOT NULL DEFAULT '',
  `prev_pass2` varchar(40) NOT NULL DEFAULT '',
  `prev_pass3` varchar(40) NOT NULL DEFAULT '',
  `pwd_last_change_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset_token` varchar(60) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_ip` varchar(45) NOT NULL DEFAULT '',
  `failed_logins` smallint(4) unsigned NOT NULL DEFAULT '0',
  `lockout_expires` int(11) NOT NULL DEFAULT '0',
  `last_failed_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_failed_ip` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`admin_id`),
  KEY `idx_admin_name_zen` (`admin_name`),
  KEY `idx_admin_email_zen` (`admin_email`),
  KEY `idx_admin_profile_zen` (`admin_profile`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_profile`, `admin_pass`, `prev_pass1`, `prev_pass2`, `prev_pass3`, `pwd_last_change_date`, `reset_token`, `last_modified`, `last_login_date`, `last_login_ip`, `failed_logins`, `lockout_expires`, `last_failed_attempt`, `last_failed_ip`) VALUES
(3, 'admin', 'admin@localhost', 1, '34c50e79154bbd28bd237807cdac3c73:50', '351683ea4e19efe34874b501fdbf9792:9b', '', '', '2012-11-19 10:56:36', '', '0000-00-00 00:00:00', '2012-11-22 15:29:50', '127.0.0.1', 0, 0, '2012-11-22 14:50:08', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `admin_activity_log`
--

DROP TABLE IF EXISTS `admin_activity_log`;
CREATE TABLE IF NOT EXISTS `admin_activity_log` (
  `log_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `access_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `page_accessed` varchar(80) NOT NULL DEFAULT '',
  `page_parameters` text,
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `flagged` tinyint(4) NOT NULL DEFAULT '0',
  `attention` varchar(255) NOT NULL DEFAULT '',
  `gzpost` mediumblob,
  PRIMARY KEY (`log_id`),
  KEY `idx_page_accessed_zen` (`page_accessed`),
  KEY `idx_access_date_zen` (`access_date`),
  KEY `idx_flagged_zen` (`flagged`),
  KEY `idx_ip_zen` (`ip_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=398 ;

--
-- Dumping data for table `admin_activity_log`
--

INSERT INTO `admin_activity_log` (`log_id`, `access_date`, `admin_id`, `page_accessed`, `page_parameters`, `ip_address`, `flagged`, `attention`, `gzpost`) VALUES
(1, '2012-11-16 16:09:18', 0, 'Log found to be empty. Logging started.', '', '127.0.0.1', 0, '', ''),
(2, '2012-11-16 16:09:18', 0, 'alert_page.php ', '', '127.0.0.1', 0, '', ''),
(3, '2012-11-16 16:09:47', 0, 'alert_page.php ', '', '127.0.0.1', 0, '', ''),
(4, '2012-11-16 16:10:10', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(5, '2012-11-16 16:10:20', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(6, '2012-11-16 16:10:27', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(7, '2012-11-16 16:18:51', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(8, '2012-11-16 16:19:01', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(9, '2012-11-16 16:21:57', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(10, '2012-11-16 16:22:08', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(11, '2012-11-16 16:22:16', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(12, '2012-11-16 16:25:13', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(13, '2012-11-16 16:25:17', 0, 'password_forgotten.php ', '', '127.0.0.1', 0, '', ''),
(14, '2012-11-16 16:25:26', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(15, '2012-11-16 16:25:37', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(16, '2012-11-16 16:32:51', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(17, '2012-11-16 16:32:59', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(18, '2012-11-16 16:33:07', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(19, '2012-11-16 16:33:13', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(20, '2012-11-16 16:33:41', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(21, '2012-11-16 16:33:55', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(22, '2012-11-16 16:34:10', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(23, '2012-11-16 16:34:32', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(24, '2012-11-16 16:37:02', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(25, '2012-11-16 16:37:08', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(26, '2012-11-16 16:38:17', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(27, '2012-11-16 16:38:23', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(28, '2012-11-16 16:39:36', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(29, '2012-11-16 16:39:37', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(30, '2012-11-16 16:39:54', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(31, '2012-11-16 16:40:01', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(32, '2012-11-16 16:42:51', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(33, '2012-11-16 16:42:59', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(34, '2012-11-16 16:43:03', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(35, '2012-11-16 16:44:12', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(36, '2012-11-16 16:44:23', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(37, '2012-11-16 16:46:42', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(38, '2012-11-16 16:46:48', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(39, '2012-11-16 16:47:04', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(40, '2012-11-16 16:47:06', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(41, '2012-11-16 16:47:07', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(42, '2012-11-16 16:47:10', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(43, '2012-11-16 16:47:11', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(44, '2012-11-16 16:47:11', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(45, '2012-11-16 16:47:11', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(46, '2012-11-16 16:47:11', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(47, '2012-11-16 16:47:11', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(48, '2012-11-16 16:47:11', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(49, '2012-11-16 16:47:13', 0, 'login.php ', '', '127.0.0.1', 0, '', ''),
(50, '2012-11-16 16:47:15', 0, 'login.php ', '', '127.0.0.1', 0, '', ''),
(51, '2012-11-16 16:47:16', 0, 'login.php ', '', '127.0.0.1', 0, '', ''),
(52, '2012-11-16 16:47:16', 0, 'login.php ', '', '127.0.0.1', 0, '', ''),
(53, '2012-11-16 16:47:16', 0, 'login.php ', '', '127.0.0.1', 0, '', ''),
(54, '2012-11-16 16:47:16', 0, 'login.php ', '', '127.0.0.1', 0, '', ''),
(55, '2012-11-16 16:47:17', 0, 'login.php ', '', '127.0.0.1', 0, '', ''),
(56, '2012-11-16 16:47:22', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(57, '2012-11-16 16:47:53', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(58, '2012-11-16 16:48:01', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(59, '2012-11-16 16:48:03', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(60, '2012-11-16 16:48:08', 0, 'login.php Admin', 'camefrom=index.php&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b25272047194749412934b32f3f3800229f926e6c6a666462989c6a9a9a6e669a986a98646a98666a996e6a6c6a916e6a9c94ab500),
(61, '2012-11-16 16:48:32', 0, 'login.php ', '', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4dd53531373635334a49344e4d35354f4b354c35344a35344bb53437354eb5304f4d56b2527204a956d2514a4c2ec9cccf030a141513d4550b00),
(62, '2012-11-16 16:48:41', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(63, '2012-11-16 16:48:42', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(64, '2012-11-16 16:48:55', 2, 'admin_account.php', '', '127.0.0.1', 0, '', ''),
(65, '2012-11-16 16:49:05', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(66, '2012-11-16 16:50:15', 2, 'admin_account.php', '', '127.0.0.1', 0, '', ''),
(67, '2012-11-16 16:50:18', 2, 'alt_nav.php', '', '127.0.0.1', 0, '', ''),
(68, '2012-11-16 16:50:22', 2, 'configuration.php', 'gID=1&', '127.0.0.1', 0, '', ''),
(69, '2012-11-16 16:50:27', 2, 'configuration.php', 'gID=1&cID=2&action=edit&', '127.0.0.1', 0, '', ''),
(70, '2012-11-16 16:50:28', 2, 'configuration.php', 'gID=1&cID=7&action=edit&', '127.0.0.1', 0, '', ''),
(71, '2012-11-16 16:50:29', 2, 'configuration.php', 'gID=1&cID=15&action=edit&', '127.0.0.1', 0, '', ''),
(72, '2012-11-16 16:50:30', 2, 'configuration.php', 'gID=1&cID=16&action=edit&', '127.0.0.1', 0, '', ''),
(73, '2012-11-16 16:50:31', 2, 'configuration.php', 'gID=1&cID=25&action=edit&', '127.0.0.1', 0, '', ''),
(74, '2012-11-16 16:50:32', 2, 'alt_nav.php', '', '127.0.0.1', 0, '', ''),
(75, '2012-11-16 16:50:41', 2, 'alt_nav.php', '', '127.0.0.1', 0, '', ''),
(76, '2012-11-16 16:50:43', 2, 'modules.php', 'set=payment&', '127.0.0.1', 0, '', ''),
(77, '2012-11-16 16:50:49', 2, 'modules.php', 'set=payment&module=freecharger&', '127.0.0.1', 0, '', ''),
(78, '2012-11-16 16:50:51', 2, 'modules.php', 'set=payment&module=freecharger&action=edit&', '127.0.0.1', 0, '', ''),
(79, '2012-11-16 16:50:56', 2, 'modules.php', 'set=payment&module=freecharger&action=save&', '127.0.0.1', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf53b2aa56f2f57709f5718d0f708cf475f50b89770b727575f6700c72770d8a0f0e710c090d56b2520a292a4d55d2c1a734cadfcf15a8d010bf2aff2017b8b1f19e2e400d06f83504fb0785407481d5d6ea28152796a53a959694e4e7c55700c54c400620895502c5cc956a01),
(80, '2012-11-16 16:50:57', 2, 'modules.php', 'set=payment&module=freecharger&', '127.0.0.1', 0, '', ''),
(81, '2012-11-16 16:51:32', 2, 'categories.php', '', '127.0.0.1', 0, '', ''),
(82, '2012-11-16 16:51:34', 2, 'categories.php', 'cPath=&action=new_category&', '127.0.0.1', 0, '', ''),
(83, '2012-11-16 16:51:53', 2, 'categories.php', 'action=insert_category&cPath=&', '127.0.0.1', 0, '', 0x5d8b3b0ac0200c40ef92b9d076f52c85103448a06a89e924debd76ea677d9f069e8c6351e18a9912836bb08203e36ad0a7b70e5cbdca6152f2bf921431880ef2f4db0c9f5d1245c644f9a47d8443d6a2864503dfe302fd02),
(84, '2012-11-16 16:51:53', 2, 'categories.php', 'cPath=&cID=1&', '127.0.0.1', 0, '', ''),
(85, '2012-11-16 16:51:55', 2, 'categories.php', 'cPath=&action=new_category&', '127.0.0.1', 0, '', ''),
(86, '2012-11-16 16:52:10', 2, 'categories.php', 'action=insert_category&cPath=&', '127.0.0.1', 0, '', 0x658c410a80201045ef32eba06ce9590219749081d418a79578f76c55d1f6bff77e038f4ab10853751913816d60c08252d565853ebd8540d50b1fca25ff3d4ed10596b13dc536c3e78013467209f389fb1007ac45d41509748706fa05),
(87, '2012-11-16 16:52:10', 2, 'categories.php', 'cPath=&cID=2&', '127.0.0.1', 0, '', ''),
(88, '2012-11-16 16:52:12', 2, 'categories.php', 'cPath=1&', '127.0.0.1', 0, '', ''),
(89, '2012-11-16 16:52:14', 2, 'categories.php', 'x=38&y=12&product_type=1&cPath=1&action=new_product&', '127.0.0.1', 0, '', ''),
(90, '2012-11-16 16:52:14', 2, 'product.php', 'x=38&y=12&product_type=1&cPath=1&action=new_product&', '127.0.0.1', 0, '', ''),
(91, '2012-11-16 16:53:09', 2, 'product.php', 'cPath=1&product_type=1&action=new_product_preview&', '127.0.0.1', 0, '', 0x9554db6adb4010fd95412f6920526307fa1068a0cda52f0985264f4520d6d2481abada5576676dab21ffde59d94e62b9a1d42023ed9c99397be6f294f4ce56a1645f548ab150558555729ecc4f67f374364b679f9293a4539ed115a5001aeb087d411123965767f2a50d860b1e7a14dbe9bbc6a276b69b227a472516de3ac933b579561cbc9ccef6628e6c978ab45a687cc3f8ec74646c42ad4a0e0edd5fd81ad589cb93443c4f1839fe92e7177b415e4822eea78ca7a5d2faafd4ab6231148ad9d122f0c1fd59ad8b522bbf65323b708f87f3f9a1208db3de1f1a97e438a80993c84fe9951a36e40bdf52df9369a6641e79281676fd8eac8f41192681585749c93b32ff42a8f541867d4430c4efe7e9688d07a254e84b473d9335bb32a14350f278dbc95f681af4d1ec4f40740dc2b381c1862341b8604cfce416414b97784e1d6a541e2b584a3b8817d81a7ea2814be5f83c77b989cf2c8387e0a2ad16c3d8ea035cc6be9524e87b2c49ca3f00d53113b46a298c24836b104ce816e862d8d721c9625095c1974ad8a51797d6d4d4a4177703dcb375985edcb77635cdf4b956da63f45cfca7673aa2e133bc44f8c02d79f0585a53813508f2555b076a0c2b622a39950bad5a91022be2a89af057da36c73b55e6195c918f33360a7af776b0c05385d24b3b492a6b8e180c8ad0c4e3f5b73778b056fbf4e256098ae1ab5da317d6869dd51a5d04a65093b08c29b641d1e71ff7c638ebdb1e509c06a979c4c66211439e7cbfb9c9931de1b30cae8d178f48c901754a5a656c1d2b0dd5d16f61175518ad9e18b32c83b1ba35c5f996e8c10b8b4ede77de11cfadd4d8c8be916ef09a9a9645bab1fa6eb46f9b17fad1e3439e1477d75779b20d71bce1bce9960a59e244955ec3e749a9a9fc056ce58e234c7c6394db1fdff2e4780bcddeaca9d7219a6cb7ce56a82767bdc325d9201b28c6d918a96b6435bbdd879ccbe0697cd95f56a665e588713a9e1b6c2c8e9ae6094eef26768fea0aa3621370dcf79b2531667cfe03),
(92, '2012-11-16 16:53:19', 2, 'product.php', 'cPath=1&product_type=1&action=insert_product&', '127.0.0.1', 0, '', 0x9554df6fd3400cfe57acbcc02412d60ef1308949307ebc6c42029e50a4e89a3889457217cebeb661daff8e2f6dd99a32212ab5ead99fedcff67777970cde55a1142e2a235898aac22ab94c96e78b65ba58a48bd7c98ba4372ce88b52018df3845c50c4a8e72198b874c14a21e380ea3b7fd259d4def573c4e0a9c4829dd73a731f8b91c06a5d1ce59cd8ae0d7566d5e123c617e713631b6a534af0e84fd816c44a02f13865b496a6ebfe4aad2a566361443cad829cf427665b949de17da5c54978342e97a70d37de319f3ad7e425981993c8cf741b33eec817dcd230906de6647eca58acdcf689b1fd0cc60a29c4f94a57da93fd17c26c4f2a1c23822579ba4e4f5bac9ef2ce44d4bb0abb996df0b8261774b4bd6970e7a4be514df9c341ed8506e29fc5b835fa8d27c179dd1d368ac3cceb6c909a5666c628c85d97f31958d36bf63b4d7f99084afc24f78fe5895c7a1a849c3dc0d02318fdb2ebf527340d7274f30b50e504dd4403a30bcf14e183b5f1282d42a73a6749bdf667182bd0d658a3c0d5f01d2d5c1b2f97b9cf6dfc2e32f8167cf4d5ea982eeb08d7f1e66911e4014b52818f4075ac04ad592b23ade01b041bfa15fa98f6e19a6731a9c9e06da5ecd2ab6b676b6ad2abdb11be8af3985e7d6ddd665ee94d6d3ac618b9facfc87442c31bf893e1b9b4c4c0583a5b81b3087aaa9d0733a5d5611ab56a439b56478115499c9af2379d6bce0e535966f09e38be12d3406f1f3f0dc054a1de96c3482a679f0958d441934cedef3bf8e65cc7e9d58d5194c03bb74556d656bceb3af41198424dca3296d82745ce5f1e3d44d9d00e801a34eace23362e8b04f2e4f3c78f7972207c91c107cb1a1129799844cb93749c0aaaa75fca2e4e61f2b2ca3ccb3298b65b537cc1347b6065d1ebff4374c44bab3bb6fa62aa1ab88b72d7d14ddbf7937f2f5e18a688e77952dc7e789f27fb14673bce3bb554289a274ee9217d9e941d953f409cf638c1343666b9f9f2294fcef6d0ece89a04df1daec791fdd1658f6b2de21bb47c7538c57763719edcff06),
(93, '2012-11-16 16:53:40', 2, 'product.php', 'cPath=1&product_type=1&action=new_product_preview&', '127.0.0.1', 0, '', 0x9554db6adb4010fd95412f6920526307fa1068a0cda52f0985264f4520d6d2481abada5576676dab21ffde59d94e62b9a1d42023ed9c99397be6f294f4ce56a1645f548ab150558555729ecc4f67f374364b679f9293a4539ed115a5001aeb087d411123965767f2a50d860b1e7a14dbe9bbc6a276b69b227a472516de3ac933b579561cbc9ccef6628e6c978ab45a687cc3f8ec74646c42ad4a0e0edd5fd81ad589cb93443c4f1839fe92e7177b415e4822eea78ca7a5d2faafd4ab6231148ad9d122f0c1fd59ad8b522bbf65323b708f87f3f9a1208db3de1f1a97e438a80993c84fe9951a36e40bdf52df9369a6641e79281676fd8eac8f41192681585749c93b32ff42a8f541867d4430c4efe7e9688d07a254e84b473d9335bb32a14350f278dbc95f681af4d1ec4f40740dc2b381c1862341b8604cfce416414b97784e1d6a541e2b584a3b8817d81a7ea2814be5f83c77b989cf2c8387e0a2ad16c3d8ea035cc6be9524e87b2c49ca3f00d53113b46a298c24836b104ce816e862d8d721c9625095c1974ad8a51797d6d4d4a4177703dcb375985edcb77635cdf4b956da63f45cfca7673aa2e133bc44f8c02d79f0585a53813508f2555b076a0c2b622a39950bad5a91022be2a89af057da36c73b55e6195c918f33360a7af776b0c05385d24b3b492a6b8e180c8ad0c4e3f5b73778b056fbf4e256098ae1ab5da317d6869dd51a5d04a65093b08c29b641d1e71ff7c638ebdb1e509c06a979c4c66211439e7cbfb9c9931de1b30cae8d178f48c901754a5a656c1d2b0dd5d16f61175518ad9e18b32c83b1ba35c5f996e8c10b8b4ede77de11cfadd4d8c8be916ef09a9a9645bab1fa6eb46f9b17fad1e3439e1477d75779b20d71bce1bce9960a59e244955ec3e749a9a9fc056ce58e234c7c6394db1fdff2e4780bcddeaca9d7219a6cb7ce56a82767bdc325d9201b28c6d918a96b6435bbdd879ccbe0697cd95f56a665e588713a9e1b6c2c8e9ae6094eef26768fea0aa3621370dcf79b2531667cfe03),
(94, '2012-11-16 16:53:42', 2, 'product.php', 'cPath=1&product_type=1&action=insert_product&', '127.0.0.1', 0, '', 0x9554516fd3400cfe2b565e6012096b917898b44930365e9840c0138a145d1327312477e1ec6b1b10ff1d5fdab2356542544a95d89fedcff677f73319bcab42295c5446b03055855572912ccf17cb74b148172f9367496f58d017a5021ae709b9a08851cf7d3071e9829542c601d577fea8b3a8bdebe788c15389053baf75e63e162381d5ba38ca39b15d1beaccaac3078c5f9c4f8c6da84d29c1a33f615b102b09c4e394d15a9aaefb2bb5aa588d8511f1b40a72d29f986d517686f7951627e1d1b85c9e36dc78c77cea5c939760664c223fd36dccb8235f704bc340b69993f92e63b172db47c6f63d182ba410e72b5d694ff65f08b33da9708c0896e4f13a3d6db17acc3b1351ef2aec66b6c1e39a5cd0d1f6a6c19d93fa4635e50f1f6a2f3410ff2cc6add16f3c09ceebeeb0511c665e6783d4b432334641eeba9ccfc09a5eb3ffd4f41789a0c45ff2eba13c914b4f8390b307187a04a30fbb5eff42d32047373f03554ed04d3430baf044113e581b3fa545e854e72ca9d7fe0c6305da1a6b14b81abea0856be3e522f7b98dcf2283cfc1475fad8ee9b08e701d4f9e16411eb02415f80854c74ad09ab532d20abe41b0a15fa18f69ef8f7916939a0c5e55ca2ebdba76b6a626bdba1be193388fe9d5a7d66de6952e6bd331c6c8d57f46a6131a2ee14f86a7d2120363e96c05ce22e857ed3c9829ad0ed3a8551bdab43a0aac48e2d494bfe95c737698ca328337c4f19698067af7f06a00a60af5b41c465239fb44c0a20e9a646a7fdfc167e73a4eafde194509bc765b64656dc5bbae431f8129d4a42c63897d52e4fcf9d145940ded00a841a3ee3c62e3b248204fdedfdee6c981f08b0c6e2c6b44a4e461122d4fd2712aa89e7e28bb3885c9cb2af32ccb60da6e4df106d3ec819545afef87e8889756776cf5c654357017e5aea39bb6ef27ff5ebc304c114ff3a4b8bb799327fb14673bce3bb554289a274ee93e7d9e941d95df409cf638c134366679f7f16d9e9ceda1d9d13109be3b1c8f23fbe1b07f40db04b29c7d1d9ae4d76f),
(95, '2012-11-16 16:53:42', 2, 'categories.php', 'cPath=1&pID=1&', '127.0.0.1', 0, '', ''),
(96, '2012-11-16 16:54:22', 2, 'product.php', 'page=1&product_type=1&cPath=1&pID=1&action=new_product&', '127.0.0.1', 0, '', ''),
(97, '2012-11-16 16:56:06', 2, 'template_select.php', '', '127.0.0.1', 0, '', ''),
(98, '2012-11-16 16:56:18', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(99, '2012-11-16 16:56:18', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(100, '2012-11-16 16:56:19', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(101, '2012-11-16 16:56:21', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(102, '2012-11-16 16:56:22', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(103, '2012-11-16 16:56:58', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(104, '2012-11-16 16:57:01', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(105, '2012-11-16 16:57:05', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(106, '2012-11-16 16:57:09', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(107, '2012-11-16 16:57:10', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(108, '2012-11-16 16:57:11', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(109, '2012-11-16 16:57:11', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(110, '2012-11-16 16:57:12', 2, 'alt_nav.php', '', '127.0.0.1', 0, '', ''),
(111, '2012-11-16 16:57:14', 2, 'template_select.php', '', '127.0.0.1', 0, '', ''),
(112, '2012-11-16 16:57:22', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(113, '2012-11-16 16:57:42', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(114, '2012-11-16 16:57:43', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(115, '2012-11-16 16:57:43', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(116, '2012-11-16 16:57:44', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(117, '2012-11-16 16:57:44', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(118, '2012-11-16 16:57:44', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(119, '2012-11-16 16:57:44', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(120, '2012-11-16 16:57:44', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(121, '2012-11-16 16:57:44', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(122, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(123, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(124, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(125, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(126, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(127, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(128, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(129, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(130, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(131, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(132, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(133, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(134, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(135, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(136, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(137, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(138, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(139, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(140, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(141, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(142, '2012-11-16 16:57:45', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(143, '2012-11-16 16:57:46', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(144, '2012-11-16 16:57:49', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(145, '2012-11-16 16:57:53', 2, 'template_select.php', 'page=1&tID=1&action=save&', '127.0.0.1', 0, '', 0xab56cac953b2524ace492c2ece4c56aa0500),
(146, '2012-11-16 16:58:03', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(147, '2012-11-16 16:58:58', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(148, '2012-11-16 16:58:59', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(149, '2012-11-16 16:58:59', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(150, '2012-11-16 16:58:59', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(151, '2012-11-16 16:59:02', 2, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(152, '2012-11-16 16:59:05', 2, 'template_select.php', 'page=1&tID=1&action=save&', '127.0.0.1', 0, '', 0xab56cac953b2524aca494cce8e2f282d4a8d4f2b4a4d55aa0500),
(153, '2012-11-16 17:04:56', 2, 'categories.php', '', '127.0.0.1', 0, '', ''),
(154, '2012-11-16 17:04:58', 2, 'categories.php', 'cPath=1&', '127.0.0.1', 0, '', ''),
(155, '2012-11-16 17:05:00', 2, 'product.php', 'page=1&product_type=1&cPath=1&pID=1&action=new_product&', '127.0.0.1', 0, '', ''),
(156, '2012-11-16 17:05:19', 2, 'product.php', 'cPath=1&product_type=1&pID=1&action=new_product_preview&page=1&', '127.0.0.1', 0, '', 0x9555db8ed34810fd95925f6024ec4d320b0f91186977b8bc3002014f2b4b56c72edbb5dbee36ddd5490ce2dfa9ee243319cfb0084b8e62d7a9aad3a72efe968dce36a1665f358ab1524d834db6ce568be52a5f2ef3e50b58be583fbf5cffb9ca9e6583f28caeaa05d95947e82b8ae0a598eec290af6d305cf134a218173f3556adb3c31c313aaab1f2d649a2682b16729d033c2b0efe41d6447eab48ab8dc6b3035c2e126f135a557370e88e9ccf9d8d1ac4e59b445c678c1cafecfbadbd222f4c11efa78c6f6ba5f5a3fc9b6a33558ad9d126f0031158edab5a2bff987ac93dbe5cad1e9cfc204de7acf707c4b9714b8e839ad1892495dea9e97082caf7348e64ba39a32f3c551bbbff89b65f82324c02b1ae91ea0f647e8550fb8858fc0f2418e29468f1386aa03d3e6c2df4b5a391c99a53b9d02128b9bd1de427741dfa68f6cf40f40d42b583c986278270c198f8c83d82966ef19c3bd4a83c36b095b6102fb02dfc8306ae95e375e94a13ef65019f838bb6560ca9f127b88e4d2c49d08f5893b4c104d4c64cd0abad30920cae433061d8a08b61ef46a6884155017f35c22ebfbab6a6a52ebfba99e0135b87f9d5a7deeee6995eb64a7b8c9e9bdff4cc131a5ec26d84a7dc93078fb5350d5883204fad75a052581153c95b39d0ae1729b0218eaa097fa56d7771526555c02bf271d692a037e703069e1a94763a49d258f384c1a0084d9c8e7f3cc1676bb5cfafde294131fc6df7e885b56167b546178139b4242c638a6350f4e51ff7c6b918fb11509c26a979c4c662114399bd7ff3a6cc4e842f0b786dbc78444a0e6850d22aa975ac34d4405f855d5421593d31164501a9ba2dc53997e8c10b8b41fe9fbc239e7ba9b191bd23dde035753d8b74a9fa2ed98fcd0b63f2785a66d5cdeb5765760c7171e07ce8960659e24495eec29759ada9fe0fd8ca19134c7c6394771fdf96d9c5115a9cadabbb219a4ff9601bd4b3d5373adc920db28a6220317e40d30532bef877ec044843274bdb1dbc1246a650e3ed52b3323a3b478cf3593d6063a5d43c6770fa34bef778ef30ca37671d3f0587a5912cdf7f00),
(157, '2012-11-16 17:05:22', 2, 'product.php', 'cPath=1&product_type=1&pID=1&action=update_product&page=1&', '127.0.0.1', 0, '', 0x9554516fd3400cfe2b565ed82412da0e78a8c424d880172610f0842245d7c4490cc95db8f3b50d88ff8eefdab236db40544ad5c69f3f7ffeecbb9fc9604de54b7645a5180b55555825cb64319b2fd2f93c9d3f87f9f3e5b38be5d345f238e99563b44529c8c65842575000cf25744b43ae345e73c1e380129c3d182c6a6bfa2962b05462e18c95422196cde4730c70acd8bb3b55a3f8b5a24ead3a3c6ae06216756b5fab92bd45bbd77c9b5c90132588a794e16da9baee5e7d55b11a0bc56c69e5f94e93acb645d929779f3b313dbc5c2cee74b66bbdb1c6b91de238b826cb5e4de40491aadba871d741e15a1a06d2cd54d1771e8b95d93ee0dd77af3493408cad64ba3de97f21d43620667f81784d1c0bcdee47f5b4c5eaa13253f9bda9b03b9959300bd764bc78dcab2638fa0175e349bbecebd00890fa46b6cdeeb222a61012fc332db346bbb1c43815b1c3868d51d39a1ba4a6e5a9bab0abbbaea711ad7aa1ff29fccb8491c327f975bcb4e84a4b0393d107185a04258f33bd7cf9a64117c2ee31c83e79194d03a3f18f0461bdd6e12fb7089d6cbfe3d44a83ca6105d29b932c30357c410d57caf232b7b90ecf3c83cfde86582d81789047b80a87528aa01bb02459fb11a80e95a0556b5124156c83a07dbf421b686faf802c90aa0c5e56a22ebdbc32baa626bdbc19e1131b8be9e5a7d66ca6955ed4aa73183257ff99994634bc803f0c67dc920387a5d115188d20ff6a6341455a3153c95b6968d38a15581107d744bfea4c737e706591c135b9707744436f8e2f0c7054a11c9f832595d18f18348ad1c4b1fd7d079f8de95c7af94e098ae195d9a213d59aade93ab40198424da23294d893a2cb9f9c5c4fd9d00e809234cacc03360c8b18f2e4fd9b377972107c91c16bed242348b210b7d6c5d531b2503dfd1075c1851875b2e75996419c6e4de15e1376ef44452fbf0fd901cfadcc58cb3d2adbe0bab0ef625d9cbe8df1fdf2c21033cef2a4b8797d9d277b8af39de6ddb654c8c2135cbaa5cf93b2a3f21bb0911e234c7203cbbb8f6ff3e47c0fcd4e8e89b7dde1789cbcbff7e4fffa0d),
(158, '2012-11-16 17:05:22', 2, 'categories.php', 'cPath=1&pID=1&page=1&', '127.0.0.1', 0, '', ''),
(159, '2012-11-16 17:05:36', 2, 'product.php', 'page=1&product_type=1&cPath=1&pID=1&action=new_product&', '127.0.0.1', 0, '', ''),
(160, '2012-11-16 17:07:02', 2, 'product.php', 'cPath=1&product_type=1&pID=1&action=new_product_preview&page=1&', '127.0.0.1', 0, '', 0x95555d8fd34a0cfd2b565e602512da2e97874aac04cbc70b2bae2e3ca148d1347112c36426cc78dae622fe3b9e69bbdb6d171095badac4c7f6f1f147bf67a3b34da8d9578d62ac54d360932db3c56cbec8e7f37cfe1ce6cf97ff5c2e9f2db227d9a03ca3ab6a4176d611fa8a22782ea6bb30e46b1b0c573c8d28c6d92f8d55ebec708a181dd55879eb2451b41533f91c033c2b0efe2c6b22bf56a4d54ae3510197b3c4db8456d51c1cba3de76367a30671f92e11971923c74ff6e3d65e9117a678524b7c5b2bad1fe4df54aba952cc8e5681cf4460b5ad6aadfc43ea25f7f872b138ab7c274de7acf73bc4b1714d8e83d2e72495dea8695741e57b1a4732dd29a36f3c552bbbfd85b6df82324c02b1ae91ee0f64fe8450db8898fd06120c714a347b1835d016cf470b7ded6864b2e6d02e74084abede0ef227741dfa68f64f40f40d42b583c986478270c198f8c83d829669f19c3bd4a83c36b096b1102fb02d7c4603d7caf1b274a589df79019f828bb6560c69f027b88e432c49d08f58938cc104d4c64cd0abb530920cae43306158a18b61ef56a6884155012f1b61975f5d5bd352975fdd4cf091adc3fcea636f37a7995eb44a7b8c9eabbff4cc131a5ec06d84c7dc93078fb5350d5883204fad75a052581153c95b2968d38b14d81047d584bfd2b6bb38a8b228e035f9b86b49d09be305034f0dca381d2469ac79c4605084264ee5ef2bf864adf6f9d57b25288657768b5e581b76566b741198434bc232a6d807455f3ebdb7cec5d88f80e23449cf2336368b18caecc3dbb76576207c59c01be3c52352724083925149a36365a006fa5fd8451592d51363511490badb52dc73891ebcb018e4ff8377c4732f3d367277641abca6ae67912e75df25fb7e78614c1e8fcbacba79f3baccf6212e769c77d3d2204b9ca8d25df832ab35d55f81add49860e21ba3bcffef5d995deca1c5d1b9ba5ba2d32d1f6c83fae4f48d0ed764839ca218488cffa2e902195f7c193b01d2d0c9d1763baf84912dd4787bd4acaccec6517abeb7ab3b6cec943acd199c3eacef3dde1b8cf29d5d8ef85bb0bb1a29e78f9f),
(161, '2012-11-16 17:07:04', 2, 'product.php', 'cPath=1&product_type=1&pID=1&action=update_product&page=1&', '127.0.0.1', 0, '', 0x9554db8edb380cfd15c22fed00b537c96cfb10a003ec4e2f2f1db468fbb4306028366d7357965c894ae216fdf7524ad2c965668b0648109b87e4e1e191be65a3b34da8d9578d62ac54d360932db3c56cbec8e7f37cfe02e62f96cfaf977f2eb267d9a03ca3ab6a4176d611fa8a22782ea1fb32e46b1b0c573c8d28c1d9a3c1aa757638478c8e6aacbc75d228c68a997c8e019e15077fd135915f2bd26aa5f16880eb59e26d42ab6a0e0edd9ef37d72455e98e019d7f8b6565a3fc8afa95653a5981dad025f0cc96a5bd55af987d449e9f1e5627131d96ef4ce59ef7788e3e09a1c07a52f492abd51d36e82caf7348e64ba73465f78aa5676fb88765f82324c02b1ae91ed0e647e8550db8898fd0f2418e2d468f6306aa02d368fb539a73fd806f5c9cea258b8261b44e3417551d10f68ba40c617ff8e9d0069e8c46d6e9795309514c19fdbb26b741b47e9f984c40e1b1da3ce7b6e90ba9e2f468f66dd8d7d4edca841ea7f9306cb8c91e327fb7eec5af4b5a391c99a030c1d8292afb783fc84ae431fc3fe1988a182eca683c986278270c198f8c83d8216fb7bce9d4ca83c3620c379c902dbc23f68e056395e96ae34f13b2fe0737031d64a209de4096ee3a99426e847ac497c3f01b5b113f46a2d8ca483eb104c1856e862d9fb3ba0884555017f35c22ebfb9b5a6a52ebfb99be0135b87f9cda7de6ece3bbd6c95f6183357bf99992734bc849f159e724f1e3cd6d634600d823cb5d6814a65454c256f65a04d2f5260431c5513fe4adbeeeaa0caa28057e4e3e59104bd3bbe31c05383727e0e9234d63c6130284213a7f1f7137cb656fbfce69d1214c3df768b5e581b76566b741198434bc232b6d817455ffe71723f15633f024ad2243b8fd8b82c6228b3f76fde94d981f07501af8d978c48c941b2ad4fd6b162a881be0abba8428a7a317a511490b6db52bcd8a47af0c26290ff87ec88e75e766ce4221537781d0d2fd2a5edbb14df9b17c694f1b4ccaabbd7afca6c5fe26ac779e7960659ea4495eecb9759ada9fe0fd8ca8c0926b9b1cabb8f6fcbec6a0f2d4e8e4970fa703c4ede3f78f4bfff00),
(162, '2012-11-16 17:07:04', 2, 'categories.php', 'cPath=1&pID=1&page=1&', '127.0.0.1', 0, '', ''),
(163, '2012-11-16 17:07:20', 2, 'product.php', 'page=1&product_type=1&cPath=1&pID=1&action=new_product&', '127.0.0.1', 0, '', ''),
(164, '2012-11-16 17:07:32', 2, 'product.php', 'cPath=1&product_type=1&pID=1&action=new_product_preview&page=1&', '127.0.0.1', 0, '', 0x9555db6edb480cfd15422f6d804a6b3bbb7d30d000bbe9e5a5418b6d9f160284b144496c4733ea0cc7b65ae4dfcb19db8963275bd4800dcb3c240f0f2ffe918dce36a1665f358ab1524d834db6cc16b3f9229fcff3f94b98bf5cfe75b9fc7391bdc806e5195d550bb2b38ed05714c17331dd87215fdb60b8e2694431ce9e3456adb3c32962745463e5ad934431f46251cce4750cf1ac38f8b3bc89fe5a91562b8d47255cce1273135a557370e8f6ac8f9d8d1ac4e587445c668c1c5fd9ed9dbd222f5cf1a49af86badb47eb482a65a4d956276b40a7c2603ab6d556be51fd32fb93f51f94e9cce59ef778863e39a1c07a5cf492abd51d3ae82caf7348e64ba5346df78aa5676fb84b6df82324c02b1ae91fe0f647e8550db8898fd0f2418e29468f6386aa02d9e0f17fadad1c864cda15de81094bcbd1de423741dfa68f62f40f40d42b583c986678270c198f8c83d829669f19c3bd4a83c36b096b1102fb02dfc8706ae95e365e94a13dff3023e07176dad18d2e84f701dc75892a01fb126198309a88d99a0576b6124195c8760c2b04217c3de2f4d1183aa02fe6e845d7e756d4d4b5d7e7533c127b60ef3ab4fbddd9c667ad52aed317aae7ed3334f68780577119e734f1e3cd6d634600d823cb5d6814a61454c25bf4a419b5ea4c08638aa26fc95b6ddc541954501afc9c75d4b82de1c2f18786a50c6e9204963cd3306832234712a7f5fc1676bb5cfafde2b4131fc63b7e885b56167b546178139b4242c638a7d50f4e51f0fd6b918fb11509c26e979c4c6661143997d78fbb6cc0e842f0b7863bc78444a0e6850322a6974ac0cd440df855d5421593d31164501a9bb2dc53d97e8c10b8b41be1fbc239e7be9b191bb23d3e035753d8b74a9fb2ed9f7c30b63f2785e66d5cd9bd765b60f71b1e3bc9b960659e24495eec39759ada9fe0a6ca5c60413df18e5fdbfefcaec620f2d8eced5fd12c5f5993fdcc2c136a84faedfe8704d36c8358ab1c4f8114d17c8f8e2cbd80990864e2eb7db79258c2ca2c6bbbb66657b368ed2f38375dd6163b3d469cee0f461831f50df6054f0ec78c43f84dde148396f7f02),
(165, '2012-11-16 17:07:34', 2, 'product.php', 'cPath=1&product_type=1&pID=1&action=update_product&page=1&', '127.0.0.1', 0, '', 0x95545d8fd34a0cfd2b565e602512da2e97874aac04cbc70b2bae2e3ca148d1347112c36426cc78dae622fe3b9e69cbb6dd5d10915235e363fbf8d89eefd9e86c136af655a3182bd534d864cb6c319b2ff2f93c9f3f87f9f3e53f97cb678bec493628cfe8aa5a909d7584bea2089e8be9360cf9da06c3154f238a71f6a0b16a9d1dce11a3a31a2b6f9d248aa1178b6226cf31c4b3e2e0efe44df4d78ab45a693c2ae17296989bd0aa9a8343b7677deb5c91172e78c6369ed64aeb7b1936d56aaa14b3a355e03b65b2da56b556fe3e7d92fb0395ed8aef9cf57e873836aec97150fa2e49a5376ada5550f99ec6914c77cee81b4fd5ca6e1fd0ee5b50864920d635d2df81cc9f106a1b11b3df4082214e8966f7a306da62f3509a783e3f0d3fd806f549dba25eb8261b44e6417551d47fd174818c2fbe8c9d0069e864e4dcce2b612a0982bf1a66d7e8368ed2f7098f1d360e8d3acfb941ea7abe537d9cd85de5e7d21b3548fcef92609931727cb21fc7838bbe763432597380a14350f27a3bc84fe83af4d1ec9f80cc5490f67430d9f048102e18133fb947d0b2019e7327152a8f0d48715ebcc0b6f0190d5c2bc7cbd29526bef3023e05176dad18d23a4f701d575392a01fb12619fd09a88d99a0576b6124195c8760c2b04217c3de5e04450caa0a78d908bbfceada9a96bafcea66828f6c1de6571f7bbb39cff4a255da63f45cfda5679ed0f0027e4578cc3d79f0585bd3803508f2d55a072a851531959c4a419b5ea4c08638aa26fc95b6ddc541954501afc9c7fb23097a737c6980a70665850e9234d63c6230284213a7f2f7157cb256fbfceabd1214c32bbb452fac0d3bab35ba08cca125611953ec83a22f9f9e5c51c5d88f80e23449cf2336368b18caecc3dbb76576207c59c01be3c523527290c6d6a7d1b1325003fd2feca20ac9ea65d08ba280d4dd96e2dd26d183171683fc3f78473cf7d2632377a94c83d771e045bad47d97ecfbe18531793c2eb3eae6cdeb32db87b8d871de4d4b832c71a24ab7e1cbacd6547f05b6526382896f8cf2febf776576b18716276b129c3eacc7c9f9bdabffe327),
(166, '2012-11-16 17:07:34', 2, 'categories.php', 'cPath=1&pID=1&page=1&', '127.0.0.1', 0, '', ''),
(167, '2012-11-16 17:25:04', 0, 'login.php ', 'camefrom=product.php&page=1&product_type=1&cPath=1&pID=1&action=new_product&', '127.0.0.1', 0, '', ''),
(168, '2012-11-16 17:25:13', 0, 'login.php Admin', 'camefrom=product.php&page=1&product_type=1&cPath=1&pID=1&action=new_product&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b25272047194749412934b32f3f3800229f9a696698626a616a6960689c61666c9c6a916869689c6a9498906c9a666c696294ab500),
(169, '2012-11-16 17:25:13', 2, 'product.php', 'page=1&product_type=1&cPath=1&pID=1&action=new_product&', '127.0.0.1', 0, '', ''),
(170, '2012-11-16 17:25:24', 2, 'product.php', 'cPath=1&product_type=1&pID=1&action=new_product_preview&page=1&', '127.0.0.1', 0, '', 0x95555d8fd34a0cfd2b565e602512da2e97874aac04cbc70b2bae2e3ca148d1347112c36426cc78dae622fe3b9e69bbdb6d5910955a35f5b17d7cfcd1efd9e86c136af655a3182bd534d864cb6c319b2ff2f93c9f3f87f9f3e53f97cb678bec493628cfe8aa5a909d7584bea2089e8be92e0cf9da06c3154f238a71f6a0b16a9d1d4e11a3a31a2b6f9d248aa1178b6226af638867c5c19fe54df4d78ab45a693c2ae17296989bd0aa9a8343b7677dec6cd4202edf25e23263e4f8ca7edcda2bf2c2154faa89bfd64aeb5f56d054aba952cc8e5681cf6460b5ad6aadfcaff44bee0f54be13a773d6fb1de2d8b826c741e973924a6fd4b4aba0f23d8d2399ee94d1379eaa95dd3ea0edb7a00c9340ac6ba4ff03993f21d4362266bf810443fc70a281b6783e5ae86b472393358766a14350f2f676908fd075e8a3d93f01513708d10e261b1e09c20563e223f7085a66c573ee50a3f2d8c05a8642bcc0b6f0190d5c2bc7cbd29526bee7057c0a2eda5a31a4c19fe03a0eb124413f624d320413501b3341afd6c24832b80ec18461852e86bd5b9922065505bc6c845d7e756d4d4b5d7e7533c147b60ef3ab8fbddd9c667ad12aed317aaefed2334f687801b7111e734f1e3cd6d634600d823cb5d6814a61454c25bf4a419b5ea4c08638aa26fc95b6ddc541954501afc9c74d4b82de1caf17786a5086e9204963cd2306832234712a7f5fc1276bb5cfafde2b4131bcb25bf4c2dab0b35aa38bc01c5a129631c53e28faf2e9bd652ec67e0414a7497a1eb1b159c450661fdebe2db303e1cb02de182f1e9192031a948c4a1a1d2b0335d0ffc22eaa90ac9e188ba280d4dd96e2964bf4e085c520df0fde11cfbdf4d8c8d59169f09aba9e45bad47d97ecfbe18531793c2eb3eae6cdeb32db87b8d871de4d4b832c71a24a77e1cbacd6547f05b6526382896f8cf2febf776576b1871647c7ea6e89e2faccefefe0601bd427b76f74b8261be416c55862fc174d17c8f8e2cbd80990864eeeb6db79258c2ca2c6dbab66657b368ed2f3bd75dd6163b3d469cee0f46183ef51df6054f0ec74c4bf83ddd948397ffc04),
(171, '2012-11-16 17:25:26', 2, 'product.php', 'cPath=1&product_type=1&pID=1&action=update_product&page=1&', '127.0.0.1', 0, '', 0x95544d8fdb380cfd2b842fed00b537c96c7b08d00176a71f970e5ab43d2d0c188a4ddbdc9525579492b845ff7b2925e92499c9160d9020361fc9c7c7277dcb46679b507bae1ae5b1524d834db6cc16b3f9229fcff3f90b98bf583ebf5efeb9c89e6583628faeaa05d95947c81545f05c42f765886b1b8caffc34a20467178355ebec708e181dd558b175d228965e2c8a997c8e21ec950ffca06fa2bf56a4d54ae3d108d7b3c4dc8456d53e38747bd6f7c915b170c133b6f16dadb47e946153ada64a79ef6815fc8331bdda56b556fc983e29fdc264bbe13b67997788e3e09a9c0f4a3f24a9f4464dbb092aee691cc974e78cbef8a95ad9ed05edbe04653c09c4ba46f63b90f915426d2362f63f9060c85f6e34d0169b4bd1f87e7e5a7cb00dea93a545b5704d3688c883eaa2a41fd074810c17ff8e9d0069e8c4706e9795309514c19febb26b741b47e9f984c70e1b2da3ce7b6e90bade3f983dfa7537f7b9f0460d52ff9b3458661e7dfc64df8f6d8b5c3b1a3d597380a14350f2653bc84fe83ae418e667208e0ab29c0e261b9e08c20563e2a3ef11b4f89f7dee6442c5d8800cc79205b6857fd0c0ad727e59bad2c4efbc80cfc1c5582b81749827b88d07539a208f5893187f026a6327e8d55a184907d7219830acd0c5b2f7d740118baa02fe6a845d7e736b4d4b5d7e7337c1276f1de6379f7abb39eff4b2559a3166ae7e33334f6878093f2b3cf53d3130d6d634600d823cb5d6814a65454c256f65a04d2f5260433eaa26fc95b6ddd541954501af88e3ed9104bd3bbe3280a941394007491a6b9e78302842934fe3ef27f86cade6fce69d129487bfed1659581befacd6e82230879684656cb12f8a5cfe71724115633f024ad2243b8fd8b82cf25066efdfbc29b303e1eb025e1b968c48c941b22d27eb5831d4405f855d542145598c5e1405a4edb6146f36a91e58580cf2ff901df1be971d1bb949c50daca3e145bab47d97e27bf3c298329e965975f7fa5599ed4b5ced38efdcd2a0973a51a5fbf265566baaff036f65c60493dc58e5ddc7b76576b5871627c724387d381e27ef1f3dfadf7f00),
(172, '2012-11-16 17:25:26', 2, 'categories.php', 'cPath=1&pID=1&page=1&', '127.0.0.1', 0, '', ''),
(173, '2012-11-19 10:38:25', 0, 'login.php ', 'camefrom=template_select.php&page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(174, '2012-11-19 10:38:31', 0, 'login.php admin', 'camefrom=template_select.php&page=1&tID=1&action=edit&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f96696e606c6c9c9964966c6c986a6298989c629a926e60686e6a6a986696646894ab500),
(175, '2012-11-19 10:38:53', 0, 'login.php admin', 'camefrom=template_select.php&page=1&tID=1&action=edit&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f96696e606c6c9c9964966c6c986a6298989c629a926e60686e6a6a986696646894ab500),
(176, '2012-11-19 10:41:19', 0, 'login.php ', '', '127.0.0.1', 0, '', ''),
(177, '2012-11-19 10:41:33', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(178, '2012-11-19 10:41:40', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(179, '2012-11-19 10:41:49', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(180, '2012-11-19 10:43:13', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(181, '2012-11-19 10:43:20', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(182, '2012-11-19 10:43:36', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(183, '2012-11-19 10:43:45', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(184, '2012-11-19 10:43:57', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(185, '2012-11-19 10:45:31', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(186, '2012-11-19 10:45:42', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(187, '2012-11-19 10:45:51', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(188, '2012-11-19 10:48:02', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(189, '2012-11-19 10:48:44', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(190, '2012-11-19 10:48:52', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(191, '2012-11-19 10:49:55', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(192, '2012-11-19 10:51:01', 0, 'login.php admin', 'camefrom=template_select.php&page=1&tID=1&action=edit&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f96696e606c6c9c9964966c6c986a6298989c629a926e60686e6a6a986696646894ab500),
(193, '2012-11-19 10:51:58', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(194, '2012-11-19 10:52:34', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(195, '2012-11-19 10:52:34', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(196, '2012-11-19 10:52:35', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(197, '2012-11-19 10:52:35', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(198, '2012-11-19 10:53:05', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(199, '2012-11-19 10:53:13', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(200, '2012-11-19 10:53:14', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(201, '2012-11-19 10:53:14', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(202, '2012-11-19 10:53:15', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(203, '2012-11-19 10:53:21', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(204, '2012-11-19 10:55:22', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(205, '2012-11-19 10:55:46', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(206, '2012-11-19 10:55:48', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(207, '2012-11-19 10:56:03', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(208, '2012-11-19 10:56:24', 0, 'login.php admin', 'camefrom=index.php&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9c626898649161606c946c9296649c9c906a6896606e6062949a9c60669c6c9964ab500),
(209, '2012-11-19 10:56:36', 0, 'login.php ', '', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4dd5353649344cb2b03048364a4e314b4a4e36304d3433303748494a353648334eb654b282a856d2514a4c2ec9cccf030a141513d4550b00),
(210, '2012-11-19 11:03:53', 3, 'logoff.php', '', '127.0.0.1', 0, '', ''),
(211, '2012-11-19 11:03:53', 0, 'login.php ', '', '127.0.0.1', 0, '', ''),
(212, '2012-11-19 11:03:59', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(213, '2012-11-19 14:07:11', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(214, '2012-11-19 14:07:17', 0, 'login.php admin', 'camefrom=index.php&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9c6a966c949c669c6a91616c9a9c64666668966269666a9a629896629964949494ab500),
(215, '2012-11-19 14:07:27', 3, 'configuration.php', 'gID=5&', '127.0.0.1', 0, '', ''),
(216, '2012-11-19 14:07:35', 3, 'configuration.php', 'gID=5&cID=130&action=edit&', '127.0.0.1', 0, '', ''),
(217, '2012-11-19 14:07:35', 3, 'configuration.php', 'gID=5&cID=130&action=edit&', '127.0.0.1', 0, '', ''),
(218, '2012-11-19 14:07:37', 3, 'configuration.php', 'gID=5&cID=130&action=edit&', '127.0.0.1', 0, '', ''),
(219, '2012-11-19 14:07:38', 3, 'configuration.php', 'gID=5&cID=130&action=edit&', '127.0.0.1', 0, '', ''),
(220, '2012-11-19 14:07:39', 3, 'configuration.php', 'gID=5&cID=132&action=edit&', '127.0.0.1', 0, '', ''),
(221, '2012-11-19 14:07:40', 3, 'configuration.php', 'gID=5&cID=133&action=edit&', '127.0.0.1', 0, '', ''),
(222, '2012-11-19 14:07:41', 3, 'configuration.php', 'gID=5&cID=137&action=edit&', '127.0.0.1', 0, '', ''),
(223, '2012-11-19 14:07:41', 3, 'configuration.php', 'gID=5&cID=142&action=edit&', '127.0.0.1', 0, '', ''),
(224, '2012-11-19 14:07:42', 3, 'configuration.php', 'gID=5&cID=146&action=edit&', '127.0.0.1', 0, '', ''),
(225, '2012-11-19 14:07:43', 3, 'configuration.php', 'gID=5&cID=137&action=edit&', '127.0.0.1', 0, '', ''),
(226, '2012-11-19 14:07:48', 3, 'configuration.php', 'gID=23&', '127.0.0.1', 0, '', ''),
(227, '2012-11-19 14:07:52', 3, 'categories.php', '', '127.0.0.1', 0, '', ''),
(228, '2012-11-19 14:07:54', 3, 'categories.php', 'cPath=2&', '127.0.0.1', 0, '', ''),
(229, '2012-11-19 14:07:57', 3, 'categories.php', '', '127.0.0.1', 0, '', ''),
(230, '2012-11-19 14:07:58', 3, 'categories.php', 'cPath=1&', '127.0.0.1', 0, '', ''),
(231, '2012-11-19 14:08:00', 3, 'product.php', 'page=1&product_type=1&cPath=1&pID=1&action=new_product&', '127.0.0.1', 0, '', ''),
(232, '2012-11-19 14:08:14', 3, 'product.php', 'cPath=1&product_type=1&pID=1&action=new_product_preview&page=1&', '127.0.0.1', 0, '', 0x95555d8fd34a0cfd2b565e602512da2e97874aac04cbc70b2bae2e3ca148d1347112c364268c67dae622fe3b9e69bbdb6d5910955a35f5b17d7cfcd1efd9e86c136acf55a33c56aa69b0c996d962365fe4f3793e7f0ef3e7cb7f2e97cf16d9936c50ecd155b5203beb08b9a2089e8be92e0c716d83f1959f4614e3ec4163d53a3b9c22464735566c9d248aa1178b6226af63087be5039fe54df4d78ab45a693c2ae17296989bd0aada07876ecffad8d9a8415cbe4bc465c6bdc5ecc7adb12216a278524afcb5565aff927e53ada64a79ef6815fc99065e6dab5a2bfe9578c9fd81b277ca74ce32ef10c7c635391f943e27a9f4464dbb0a2aee691cc974a78cbef9a95ad9ed03c27e0bca781288758d347f20f32784da46c4ec379060c83f9c68a02d9ecf1572ed68f464cda153e81094bcd90ef211ba0e399af90988ba41887630d9f048102e18131f7d8fa06550d8e70e352ac606d63211e205b685cf68e05a39bf2c5d69e27b5ec0a7e0a2ad15439afa09aee3044b12e4116b92219880da98097ab5164692c17508260c2b7431ecddbe1431a82ae06523ecf2ab6b6b5aeaf2ab9b093e7aeb30bffad8dbcd69a617add28cd173f5979e7942c30bb88df0d8f7c4c0585bd3803508f2d45a072a85153195fc2a056d7a91021bf25135e1afb4ed2e0eaa2c0a784d1cd72c097a73bc5bc0d4a00cd34192c69a471e0c8ad0e453f9fb0a3e59ab39bf7aaf04e5e195dd220b6be39dd51a5d04e6d092b08c29f64191cba7f736b918fb11509c26e979c4c666918732fbf0f66d991d085f16f0c6b078444a0e6850322a6974ac0cd440ff0bbba842b232792c8a0252775b8a5b2ed1030b8b41be1fbc23def7d263232747a6813575bd17e952f75db2ef8717c6e4f1b8ccaa9b37afcb6c1fe262c779372d0d7a891355ba0b5f66b5a6fa2b782b352698f8c628efff7b5766177b687174acee9628aecffcfe01196c83fae4f08d0ed76483dca2184b8cffa2e902192ebe8c9d0069e8e468bb9d57c2c8226abcbd6a56b667e3283ddf5bd71d36364b9de60c4e1f36f81ef50d4605cf4e47fc2fd89d8d94f3c74f),
(233, '2012-11-19 14:08:18', 3, 'product.php', 'cPath=1&product_type=1&pID=1&action=update_product&page=1&', '127.0.0.1', 0, '', 0x95544d8fdb380cfd2b842fed00b537c96c7b08d00176a71f970e5ab43d2d0c188a4ddbdc9525579492b845ff7b2925e92499c9160d9020361fc9c7c7277dcb46679b507bae1ae5b1524d834db6cc16b3f9229fcff3f90b98bf583ebf5efeb9c89e6583628faeaa05d95947c81545f05c42f765886b1b8caffc34a20467178355ebec708e181dd558b175d228965e2c8a997c8e21ec950ffca06fa2bf56a4d54ae3d108d7b3c4dc8456d53e38747bd6f7c915b170c133b6f16dadb47e946153ada64a79ef6815fc8331bdda56b556fc983e29fdc264bbe13b67997788e3e09a9c0f4a3f24a9f4464dbb092aee691cc974e78cbef8a95ad9ed05edbe04653c09c4ba46f63b90f915426d2362f63f9060c85f6e34d0169b4bd1f87e7eaacc601bd4274b8b6ae19a6c109107d545493fa0e902192efe1d3b01d2d089e1dc2e2b612a29823fd765d7e8368ed2f3098f1d365a469df7dc2075bd7f307bf4eb6eee73e18d1aa4fe3769b0ccb8b7987d3ff62c72ed68f464cd01830e41c997ed203fa1eb9063989f81d829c8663a986c782208178c898fbe47d0627ef6b993f114630332194b16d816fe4103b7caf965e94a13bff3023e071763ad04d2499ee0369e4a69823c624de2fa09a88d9da0576b61241d5c8760c2b04217cbdedf01452caa0af8ab1176f9cdad352d75f9cddd049fbc7598df7ceaede6bcd3cb5669c698b9facdcc3ca1e125fcacf0d4f7c4c0585bd3803508f2d45a072a95153195bc958136bd48810df9a89af057da765707551605bc228e574712f4eef8be00a606e5f41c2469ac79e2c1a0084d3e8dbf9fe0b3b59af39b774a501efeb65b64616dbcb35aa38bc01c5a1296b1c5be2872f9c7c9ed548cfd08284993ec3c62e3b2c84399bd7ff3a6cc0e84af0b786d5832222507c9b39cac63c550037d1576518514657179511490b6db52bcd6a47a606131c8ff4376c4fb5e766ce41a1537b08e6e17e9d2f65d8aefcd0b63ca785a66d5ddeb5765b62f71b5e3bc734b835eea4495eecb9759ada9fe0fbc9519134c726395771fdf96d9d51e5a9c1c93e0f4e1789cbc7ff4dc7fff01),
(234, '2012-11-19 14:08:18', 3, 'categories.php', 'cPath=1&pID=1&page=1&', '127.0.0.1', 0, '', ''),
(235, '2012-11-19 14:08:23', 3, 'categories.php', 'cID=1&', '127.0.0.1', 0, '', ''),
(236, '2012-11-19 14:08:28', 3, 'categories.php', 'cPath=1&', '127.0.0.1', 0, '', ''),
(237, '2012-11-19 14:08:28', 3, 'categories.php', 'cPath=&cID=1&action=edit_category&', '127.0.0.1', 0, '', ''),
(238, '2012-11-19 14:08:51', 3, 'categories.php', 'action=update_category&cPath=&', '127.0.0.1', 0, '', 0x558e410a02310c45ef92b5a0b3ed598410da50036d33a47121c3dcdd564671b62fefff9f0d22396735e18e9220c002977fd6a832846de000b1a83f603fdd13f768b2ba68fb6acedda7253563129bc19f7fbf9eeba55266acd49e548608333549e2c23e86e136505773544b6c07b0b160121dfdb5f2e7e7fd0d),
(239, '2012-11-19 14:08:52', 3, 'categories.php', 'cPath=&cID=1&', '127.0.0.1', 0, '', ''),
(240, '2012-11-19 14:08:58', 3, 'categories.php', 'cPath=1&', '127.0.0.1', 0, '', ''),
(241, '2012-11-19 14:09:00', 3, 'categories.php', 'cPath=&cID=1&', '127.0.0.1', 0, '', ''),
(242, '2012-11-19 14:10:14', 3, 'define_pages_editor.php', '', '127.0.0.1', 0, '', ''),
(243, '2012-11-19 14:10:21', 3, 'define_pages_editor.php', 'define_it=4&action=new_page&', '127.0.0.1', 0, '', ''),
(244, '2012-11-19 14:10:40', 3, 'define_pages_editor.php', 'lngdir=english&filename=define_main_page.php&action=save&', '127.0.0.1', 0, '', 0xab564acbcc498d4fcecf2b49cd2b2956b252ca4dcccc8b298ac953aa0500),
(245, '2012-11-19 14:10:40', 3, 'define_pages_editor.php', '', '127.0.0.1', 0, '', ''),
(246, '2012-11-19 14:23:57', 3, 'users.php', '', '127.0.0.1', 0, '', ''),
(247, '2012-11-19 14:24:11', 3, 'profiles.php', '', '127.0.0.1', 0, '', ''),
(248, '2012-11-19 14:24:15', 3, 'admin_page_registration.php', '', '127.0.0.1', 0, '', ''),
(249, '2012-11-19 14:24:19', 3, 'admin_activity.php', '', '127.0.0.1', 0, '', ''),
(250, '2012-11-19 14:24:29', 3, 'alt_nav.php', '', '127.0.0.1', 0, '', ''),
(251, '2012-11-19 14:24:34', 3, 'record_artists.php', '', '127.0.0.1', 0, '', ''),
(252, '2012-11-19 14:24:38', 3, 'record_company.php', '', '127.0.0.1', 0, '', ''),
(253, '2012-11-19 14:24:40', 3, 'music_genre.php', '', '127.0.0.1', 0, '', ''),
(254, '2012-11-19 14:24:42', 3, 'media_manager.php', '', '127.0.0.1', 0, '', ''),
(255, '2012-11-19 14:24:44', 3, 'media_types.php', '', '127.0.0.1', 0, '', ''),
(256, '2012-11-19 14:24:48', 3, 'media_types.php', 'page=1&mID=1&action=edit&', '127.0.0.1', 0, '', ''),
(257, '2012-11-19 14:24:50', 3, 'media_types.php', 'page=1&mID=1&action=edit&', '127.0.0.1', 0, '', ''),
(258, '2012-11-19 14:24:51', 3, 'media_types.php', 'page=1&mID=1&action=edit&', '127.0.0.1', 0, '', ''),
(259, '2012-11-19 14:24:51', 3, 'media_types.php', 'page=1&mID=1&action=edit&', '127.0.0.1', 0, '', ''),
(260, '2012-11-19 14:25:06', 3, 'admin_account.php', '', '127.0.0.1', 0, '', ''),
(261, '2012-11-19 14:25:08', 3, 'server_info.php', '', '127.0.0.1', 0, '', ''),
(262, '2012-11-19 14:26:00', 3, 'configuration.php', 'gID=30&', '127.0.0.1', 0, '', ''),
(263, '2012-11-19 14:26:08', 3, 'configuration.php', 'gID=25&', '127.0.0.1', 0, '', ''),
(264, '2012-11-19 14:26:11', 3, 'configuration.php', 'gID=25&cID=513&action=edit&', '127.0.0.1', 0, '', ''),
(265, '2012-11-19 14:26:24', 3, 'configuration.php', 'gID=25&cID=514&action=edit&', '127.0.0.1', 0, '', ''),
(266, '2012-11-19 14:26:26', 3, 'configuration.php', 'gID=25&cID=515&action=edit&', '127.0.0.1', 0, '', ''),
(267, '2012-11-19 14:26:27', 3, 'configuration.php', 'gID=25&cID=516&action=edit&', '127.0.0.1', 0, '', '');
INSERT INTO `admin_activity_log` (`log_id`, `access_date`, `admin_id`, `page_accessed`, `page_parameters`, `ip_address`, `flagged`, `attention`, `gzpost`) VALUES
(268, '2012-11-19 14:26:28', 3, 'configuration.php', 'gID=25&cID=517&action=edit&', '127.0.0.1', 0, '', ''),
(269, '2012-11-19 14:26:29', 3, 'configuration.php', 'gID=25&cID=520&action=edit&', '127.0.0.1', 0, '', ''),
(270, '2012-11-19 14:26:29', 3, 'configuration.php', 'gID=25&cID=523&action=edit&', '127.0.0.1', 0, '', ''),
(271, '2012-11-19 14:26:30', 3, 'configuration.php', 'gID=25&cID=524&action=edit&', '127.0.0.1', 0, '', ''),
(272, '2012-11-19 14:26:33', 3, 'configuration.php', 'gID=24&', '127.0.0.1', 0, '', ''),
(273, '2012-11-19 14:26:38', 3, 'configuration.php', 'gID=22&', '127.0.0.1', 0, '', ''),
(274, '2012-11-19 14:26:41', 3, 'configuration.php', 'gID=20&', '127.0.0.1', 0, '', ''),
(275, '2012-11-19 14:26:46', 3, 'configuration.php', 'gID=16&', '127.0.0.1', 0, '', ''),
(276, '2012-11-19 14:26:48', 3, 'configuration.php', 'gID=15&', '127.0.0.1', 0, '', ''),
(277, '2012-11-19 14:26:52', 3, 'configuration.php', 'gID=5&', '127.0.0.1', 0, '', ''),
(278, '2012-11-19 14:26:56', 3, 'configuration.php', 'gID=12&', '127.0.0.1', 0, '', ''),
(279, '2012-11-19 14:27:03', 3, 'configuration.php', 'gID=12&cID=248&action=edit&', '127.0.0.1', 0, '', ''),
(280, '2012-11-19 14:27:10', 3, 'configuration.php', 'gID=12&cID=248&action=edit&', '127.0.0.1', 0, '', ''),
(281, '2012-11-19 14:27:18', 3, 'specials.php', '', '127.0.0.1', 0, '', ''),
(282, '2012-11-19 14:27:23', 3, 'modules.php', 'set=payment&', '127.0.0.1', 0, '', ''),
(283, '2012-11-19 14:27:28', 3, 'modules.php', 'set=ordertotal&', '127.0.0.1', 0, '', ''),
(284, '2012-11-19 14:27:36', 3, 'modules.php', 'set=ordertotal&action=install&', '127.0.0.1', 0, '', 0xab56cacd4f29cd4955b252ca2f894fce4f894f4b4d55d251cacc2b2e49ccc9712a2d29c9cf8baf004a1b5962085702850d956a01),
(285, '2012-11-19 14:27:37', 3, 'modules.php', 'set=ordertotal&module=ot_cod_fee&action=edit&', '127.0.0.1', 0, '', ''),
(286, '2012-11-19 14:27:54', 3, 'modules.php', 'set=ordertotal&', '127.0.0.1', 0, '', ''),
(287, '2012-11-19 14:27:57', 3, 'modules.php', 'set=payment&', '127.0.0.1', 0, '', ''),
(288, '2012-11-19 14:28:09', 3, 'customers.php', '', '127.0.0.1', 0, '', ''),
(289, '2012-11-19 14:28:12', 3, 'orders.php', '', '127.0.0.1', 0, '', ''),
(290, '2012-11-19 14:28:15', 3, 'orders.php', 'page=1&oID=1&action=edit&', '127.0.0.1', 0, '', ''),
(291, '2012-11-19 14:28:15', 3, 'orders.php', 'page=1&oID=1&action=edit&', '127.0.0.1', 0, '', ''),
(292, '2012-11-19 14:28:31', 3, 'orders.php', 'page=1&oID=1&action=update_order&', '127.0.0.1', 0, '', 0xab564acecfcd4dcd2b2956b25252d2512a2e492c2905b18d819cbcfc92ccb44a20c710ce8947529e9fa7540b00),
(293, '2012-11-19 14:28:32', 3, 'orders.php', 'page=1&oID=1&action=edit&', '127.0.0.1', 0, '', ''),
(294, '2012-11-19 14:28:38', 3, 'orders.php', 'page=1&oID=1&action=update_order&', '127.0.0.1', 0, '', 0xab564acecfcd4dcd2b2956b25252d2512a2e492c2905b14d809cbcfc92ccb44a20c710ce8947529e9fa7540b00),
(295, '2012-11-19 14:28:39', 3, 'orders.php', 'page=1&oID=1&action=edit&', '127.0.0.1', 0, '', ''),
(296, '2012-11-19 14:28:44', 3, 'orders.php', 'page=1&oID=1&action=update_order&', '127.0.0.1', 0, '', 0xab564acecfcd4dcd2b2956b25252d2512a2e492c2905b18d809cbcfc92ccb44a20c710ce8947529e9fa7540b00),
(297, '2012-11-19 14:28:45', 3, 'orders.php', 'page=1&oID=1&action=edit&', '127.0.0.1', 0, '', ''),
(298, '2012-11-19 14:28:59', 3, 'packingslip.php', 'oID=1&', '127.0.0.1', 0, '', ''),
(299, '2012-11-19 14:29:18', 3, 'invoice.php', 'oID=1&', '127.0.0.1', 0, '', ''),
(300, '2012-11-19 14:29:26', 3, 'orders.php', 'page=1&oID=1&', '127.0.0.1', 0, '', ''),
(301, '2012-11-19 14:29:31', 3, 'orders.php', 'page=1&oID=1&action=edit&', '127.0.0.1', 0, '', ''),
(302, '2012-11-19 14:29:48', 3, 'stats_customers.php', '', '127.0.0.1', 0, '', ''),
(303, '2012-11-19 14:29:50', 3, 'customers.php', 'cID=1&', '127.0.0.1', 0, '', ''),
(304, '2012-11-19 14:29:50', 3, 'customers.php', 'cID=1&', '127.0.0.1', 0, '', ''),
(305, '2012-11-19 14:29:55', 3, 'stats_products_purchased.php', '', '127.0.0.1', 0, '', ''),
(306, '2012-11-19 14:29:58', 3, 'stats_products_viewed.php', '', '127.0.0.1', 0, '', ''),
(307, '2012-11-19 14:30:01', 3, 'template_select.php', '', '127.0.0.1', 0, '', ''),
(308, '2012-11-19 14:30:07', 3, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(309, '2012-11-19 14:42:55', 3, 'configuration.php', 'gID=20&', '127.0.0.1', 0, '', ''),
(310, '2012-11-19 14:42:59', 3, 'configuration.php', 'gID=19&', '127.0.0.1', 0, '', ''),
(311, '2012-11-19 14:43:22', 3, 'configuration.php', 'gID=19&cID=424&action=edit&', '127.0.0.1', 0, '', ''),
(312, '2012-11-19 14:43:47', 3, 'configuration.php', 'gID=19&cID=393&action=edit&', '127.0.0.1', 0, '', ''),
(313, '2012-11-19 14:44:09', 3, 'configuration.php', 'gID=19&cID=437&action=edit&', '127.0.0.1', 0, '', ''),
(314, '2012-11-19 14:44:18', 3, 'configuration.php', 'gID=19&cID=437&action=save&', '127.0.0.1', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2528a4c2d56d2512a2e4dcacd2cf1f47574778d0f0d768d770e0e8e770a0d09f1f70b8eaf00aa323625a0a812a8c84ca91600),
(315, '2012-11-19 14:44:18', 3, 'configuration.php', 'gID=19&cID=437&', '127.0.0.1', 0, '', ''),
(316, '2012-11-19 14:44:48', 3, 'configuration.php', 'gID=19&cID=437&action=edit&', '127.0.0.1', 0, '', ''),
(317, '2012-11-19 14:44:50', 3, 'configuration.php', 'gID=19&cID=437&action=save&', '127.0.0.1', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b252f2cb57d2512a2e4dcacd2cf1f47574778d0f0d768d770e0e8e770a0d09f1f70b8eaf002a323621a0a812a8c842a91600),
(318, '2012-11-19 14:44:50', 3, 'configuration.php', 'gID=19&cID=437&', '127.0.0.1', 0, '', ''),
(319, '2012-11-19 14:45:04', 3, 'configuration.php', 'gID=19&cID=424&action=edit&', '127.0.0.1', 0, '', ''),
(320, '2012-11-19 14:45:20', 3, 'configuration.php', 'gID=19&cID=424&action=save&', '127.0.0.1', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b25252d2512a2e4dcacd2c09f6f00f8f7772f4f3730d0a8e770ff20f0d880f760d318baf002a32b120a8ac12a8ccd040a91600),
(321, '2012-11-19 14:45:20', 3, 'configuration.php', 'gID=19&cID=424&', '127.0.0.1', 0, '', ''),
(322, '2012-11-19 15:05:45', 0, 'login.php ', 'camefrom=orders.php&', '127.0.0.1', 0, '', ''),
(323, '2012-11-19 15:05:50', 0, 'login.php admin', 'camefrom=orders.php&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9a946168929266989a9296616e6c646e626e686896926a6698626291629c629164ab500),
(324, '2012-11-19 15:06:00', 0, 'login.php admin', 'camefrom=orders.php&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9a946168929266989a9296616e6c646e626e686896926a6698626291629c629164ab500),
(325, '2012-11-19 15:06:01', 3, 'orders.php', '', '127.0.0.1', 0, '', ''),
(326, '2012-11-19 15:06:04', 3, 'orders.php', 'vcheck=yes&', '127.0.0.1', 0, '', ''),
(327, '2012-11-19 15:06:14', 3, 'orders.php', 'vcheck=yes&page=1&oID=1&', '127.0.0.1', 0, '', ''),
(328, '2012-11-19 15:06:17', 3, 'orders.php', 'vcheck=yes&page=1&oID=2&', '127.0.0.1', 0, '', ''),
(329, '2012-11-19 15:06:19', 3, 'orders.php', 'vcheck=yes&page=1&oID=1&', '127.0.0.1', 0, '', ''),
(330, '2012-11-19 15:06:21', 3, 'invoice.php', 'oID=1&', '127.0.0.1', 0, '', ''),
(331, '2012-11-19 16:04:38', 0, 'login.php ', 'camefrom=template_select.php&', '127.0.0.1', 0, '', ''),
(332, '2012-11-19 16:04:44', 0, 'login.php admin', 'camefrom=template_select.php&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f906262686a6c9c9a6a9c9660606c6a626868986c69616a61666666966964989294ab500),
(333, '2012-11-19 16:04:44', 3, 'template_select.php', '', '127.0.0.1', 0, '', ''),
(334, '2012-11-19 16:04:47', 3, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(335, '2012-11-19 16:04:51', 3, 'template_select.php', 'page=1&tID=1&action=save&', '127.0.0.1', 0, '', 0xab56cac953b2522a282d4a8d4fca294d55aa0500),
(336, '2012-11-19 16:05:32', 3, 'layout_controller.php', '', '127.0.0.1', 0, '', ''),
(337, '2012-11-19 16:05:40', 3, 'layout_controller.php', 'page=&cID=74&action=reset_defaults&', '127.0.0.1', 0, '', ''),
(338, '2012-11-19 16:05:40', 3, 'layout_controller.php', 'page=&', '127.0.0.1', 0, '', ''),
(339, '2012-11-19 16:06:07', 3, 'configuration.php', 'gID=19&', '127.0.0.1', 0, '', ''),
(340, '2012-11-19 16:06:15', 3, 'configuration.php', 'gID=19&cID=437&action=edit&', '127.0.0.1', 0, '', ''),
(341, '2012-11-19 16:06:20', 3, 'configuration.php', 'gID=19&cID=437&action=save&', '127.0.0.1', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2528a4c2d56d2512a2e4dcacd2cf1f47574778d0f0d768d770e0e8e770a0d09f1f70b8eaf00aa323427a0a812a4c848a91600),
(342, '2012-11-19 16:06:20', 3, 'configuration.php', 'gID=19&cID=437&', '127.0.0.1', 0, '', ''),
(343, '2012-11-22 14:49:26', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(344, '2012-11-22 14:49:38', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(345, '2012-11-22 14:49:41', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(346, '2012-11-22 14:50:03', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(347, '2012-11-22 14:50:08', 0, 'login.php admin', 'camefrom=index.php&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f92929c9c9a626960616c66949c9a68629a96646a689c929a696299649291696064ab500),
(348, '2012-11-22 14:50:24', 0, 'login.php admin', 'camefrom=index.php&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f92929c9c9a626960616c66949c9a68629a96646a689c929a696299649291696064ab500),
(349, '2012-11-22 15:06:53', 0, 'login.php ', '', '127.0.0.1', 0, '', ''),
(350, '2012-11-22 15:06:58', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(351, '2012-11-22 15:07:09', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(352, '2012-11-22 15:09:40', 0, 'login.php ', 'camefrom=template_select.php&', '127.0.0.1', 0, '', ''),
(353, '2012-11-22 15:09:45', 0, 'login.php admin', 'camefrom=template_select.php&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9a6a9e686168926490689494969a92969c9c6a92696e6e6a646460646966916164ab500),
(354, '2012-11-22 15:09:46', 3, 'template_select.php', '', '127.0.0.1', 0, '', ''),
(355, '2012-11-22 15:09:57', 3, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(356, '2012-11-22 15:10:00', 3, 'template_select.php', 'page=1&tID=1&action=save&', '127.0.0.1', 0, '', 0xab56cac953b2524a49cdcbcc55aa0500),
(357, '2012-11-22 15:12:47', 3, 'sqlpatch.php', '', '127.0.0.1', 0, '', ''),
(358, '2012-11-22 15:29:44', 0, 'login.php ', 'camefrom=alt_nav.php&', '127.0.0.1', 0, '', ''),
(359, '2012-11-22 15:29:50', 0, 'login.php admin', 'camefrom=alt_nav.php&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9e6a966969626a6669649e689a9a9a6169649064906861669162996061626a9064ab500),
(360, '2012-11-22 15:29:51', 3, 'alt_nav.php', '', '127.0.0.1', 0, '', ''),
(361, '2012-11-22 15:29:53', 3, 'alt_nav.php', '', '127.0.0.1', 0, '', ''),
(362, '2012-11-22 15:29:55', 3, 'categories.php', '', '127.0.0.1', 0, '', ''),
(363, '2012-11-22 15:30:11', 3, 'customers.php', '', '127.0.0.1', 0, '', ''),
(364, '2012-11-22 15:30:34', 3, 'customers.php', 'page=1&cID=2&action=edit&', '127.0.0.1', 0, '', ''),
(365, '2012-11-22 15:30:46', 3, 'customers.php', 'page=1&cID=2&', '127.0.0.1', 0, '', ''),
(366, '2012-11-22 15:30:53', 3, 'categories.php', '', '127.0.0.1', 0, '', ''),
(367, '2012-11-22 15:30:58', 3, 'categories.php', 'cPath=2&', '127.0.0.1', 0, '', ''),
(368, '2012-11-22 15:31:04', 3, 'categories.php', 'cID=2&', '127.0.0.1', 0, '', ''),
(369, '2012-11-22 15:31:13', 3, 'categories.php', 'cPath=&cID=2&action=edit_category&', '127.0.0.1', 0, '', ''),
(370, '2012-11-22 15:31:13', 3, 'categories.php', 'cPath=2&', '127.0.0.1', 0, '', ''),
(371, '2012-11-22 15:31:51', 3, 'categories.php', 'action=update_category&cPath=&', '127.0.0.1', 0, '', 0x55cd310ec3300805d0bb30676832e600bd06b20cb5906213613a5451ee5edaa452b3beff3f6c9093735113ee2804334c30fc5b4b9561de608ce8ae4ab05f62e29e4d56176dbfd6e36c492d486221d78b525361aca93dd3728487102fecf10b6e415dcd518df8b31f038cbb9b64477fadfcb5fd0d),
(372, '2012-11-22 15:31:51', 3, 'categories.php', 'cPath=&cID=2&', '127.0.0.1', 0, '', ''),
(373, '2012-11-22 15:31:54', 3, 'categories.php', 'cPath=&action=new_category&', '127.0.0.1', 0, '', ''),
(374, '2012-11-22 15:32:33', 3, 'categories.php', 'action=insert_category&cPath=&', '127.0.0.1', 0, '', 0x5d8b410a80300c04ff92b3205efb013f2194d0c612308da4f554fa77eb4dbd2d3b330d02564a6a4cc5671402d7600107ebb3fbf4c6914a303e2b6bfe5b2cc947b6f10807d3a27bdd66f8d42c98c80be60b8fe10d58d4aa578bf474d06f),
(375, '2012-11-22 15:32:33', 3, 'categories.php', 'cPath=&cID=3&', '127.0.0.1', 0, '', ''),
(376, '2012-11-22 15:32:37', 3, 'categories.php', 'cPath=1&', '127.0.0.1', 0, '', ''),
(377, '2012-11-22 15:32:37', 3, 'categories.php', 'cPath=&cID=1&action=edit_category&', '127.0.0.1', 0, '', ''),
(378, '2012-11-22 15:32:51', 3, 'categories.php', 'action=update_category&cPath=&', '127.0.0.1', 0, '', 0x55ce410a02310c05d0bb642da8db6ebd865042136aa06d86342e6498bbdb8a23cef6e5ff242b2474ce6ac23d0a41802b9cfead616508ebe000b7a2fe80ed3027eec96471d1b6c7d21e939a23894dfa15eee7e37ea99839566c4f2c2308b33585b8b08fcb7019d4d53caa11db178cbb9b248ffe5af8f3f4f606),
(379, '2012-11-22 15:32:52', 3, 'categories.php', 'cPath=&cID=1&', '127.0.0.1', 0, '', ''),
(380, '2012-11-22 15:32:56', 3, 'categories.php', 'cPath=1&', '127.0.0.1', 0, '', ''),
(381, '2012-11-22 15:32:58', 3, 'categories.php', 'cPath=&cID=1&', '127.0.0.1', 0, '', ''),
(382, '2012-11-22 15:32:59', 3, 'categories.php', 'cPath=3&', '127.0.0.1', 0, '', ''),
(383, '2012-11-22 15:33:02', 3, 'categories.php', 'cPath=3&action=new_category&', '127.0.0.1', 0, '', ''),
(384, '2012-11-22 15:33:05', 3, 'categories.php', 'cPath=3&', '127.0.0.1', 0, '', ''),
(385, '2012-11-22 15:33:07', 3, 'categories.php', 'x=54&y=12&product_type=1&cPath=3&action=new_product&', '127.0.0.1', 0, '', ''),
(386, '2012-11-22 15:33:07', 3, 'product.php', 'x=54&y=12&product_type=1&cPath=3&action=new_product&', '127.0.0.1', 0, '', ''),
(387, '2012-11-22 15:34:28', 3, 'product.php', 'cPath=3&product_type=1&action=new_product_preview&', '127.0.0.1', 0, '', 0x8553d16ec2300cfc973e6f52db8931f816a4c824a6b394369de340ab897f9f0bdb8014b697aabd3bc797b3fb59f41c5cb2128d034103cea12bd6455d56f573553dd775f154b41005d95815348109a3a149a3cca598a20da91323638fca950f49b3e3d0e68a9ec9a28981b54fce45014951d1eae6cc93db3d9087adc72bc72fe5c9719776602531f21db71db45af2a927ae8b4d7a5d956e9396f5eb6a9316ab7aa9485dbde97bb95be8d3bebc15c7df6243516f8078eb67422d787ff75ece6c4703224cdb24b3700406633dc46f9bd5ac7c02eb79580d871867dc9e5812643e2677e00f309ead9bf84e7d4f5d935bf990d16cc3f020f18f049d904a023bdd8696baff14304c8af20f49ea481e376a69c059260ea365ea8542f733c2abf15caab391b7c1a1cfb09e714f2169f22d347826a96d745ff9e74371ede8f1776e618f7c6012cc7d9db5d3e241de27b1bf6bf580d4bc4b269e7e82733aa78ec72f),
(388, '2012-11-22 15:34:33', 3, 'product.php', 'cPath=3&product_type=1&action=insert_product&', '127.0.0.1', 0, '', 0x85525b8ec2300cbc4bbf17a92de27916a4c824a6586a9be2383c84b8fbbab0b090c2ee4f94cc8cedb1e373d6b177d14a300e040d38872e5b66655e94a3a2189565f695351004d95815549e0983a15ea3cc6f3005eb632b464e1d2a977f24cd867d932a3a268b2678d63a2917042406458b979c57b77ba01ad6353e391ee757c76ddc8095c8c803b786829a407c4dd9a316eafaad3567d62703224ceb2883fe048ec6d6107e2a1583f01e2c87fd56ec4318707b628990f8e8dd417d80d3cdba095bea3a6aabd4ca4e4e66ed8f1f86b68bd00aa9c4b3d30f6da8fd4f01c75e91ff21892dc9e7420d1dd17d62931d6abcc33ac13ac63df9a8936da0c21b494da52bc5f787e24603f1f12f7e8f7c60124cebdeb4fd6e405ae780546d2501fb7dbc75998eb98546b39f35fd325bc5e92277ab382ba78b559c2cca99226531d77bbe99e869c7f3ecf2bcba182c5327e4db7b8e173e72fd167f8ce0f20d),
(389, '2012-11-22 15:34:33', 3, 'categories.php', 'cPath=3&pID=2&', '127.0.0.1', 0, '', ''),
(390, '2012-11-22 15:35:49', 3, 'product.php', 'page=1&product_type=1&cPath=3&pID=2&action=new_product&', '127.0.0.1', 0, '', ''),
(391, '2012-11-22 15:36:06', 3, 'product.php', 'cPath=3&product_type=1&pID=2&action=new_product_preview&page=1&', '127.0.0.1', 0, '', 0x8553ed4ec3300c7c15d4df80da9401dbb34c8abcc42b96d2a638ce3e34eddd49d60dba8e417f54adef6c5fcecea1e8d9db6824680b821aac455b2c0a5556eaa9aa9e947aa8668bfa6551d7c563d14210646d12b3f14c18346572867eca50303e76a265df6302cbbba05eb36fa78c9ec9a00e9e53a38c3d97e919138280c490a0eaaaf049fc06c8c1cae1e8007579d2ddc53518898c7cd63c4eeea04d29875471512ce3ebbcb4cbf8a65ee7cb389babb71451d57bfa2ed7b3f436f57b71fc4ed614d23110aff5e4a801e77e3d9cd5abbd0611a655941b870476da38086799d54d7a0eaa1b5706db1af6e1648d1a631b62893011932582dbc27ed0afc307f53d75cd54cfa7ecf5caefeed8fe19a1134a14cf362d464bdd7f0cd86546f907257624f71bb5b4c31b632c06c3d40bf9ee32c7d18c7eb2735e75ddbcf516dd641f7ac60df99846d0428303486d93b6972f3f299eba3afc1ea0df206f9904a7da066ede4098f689ec7e95bb456a3e643a897c27068b4ec8f10b),
(392, '2012-11-22 15:36:07', 3, 'product.php', 'cPath=3&product_type=1&pID=2&action=update_product&page=1&', '127.0.0.1', 0, '', 0x8552db4ec3300cfd15d467406dca80ed5b26455ee2154b6d531c671721fe1d67e5b2760cfa50b53ec7c7c797b762e0e09393683d085af01e7db12a4c5999bbaaba33e6a65aacea87555d17b745075190ad53661398305acae40cfdc8507421f562e538a082e555d06e397473c6c0e4d0c6c05a2863f7a53ee7842820292a544d844fe677402d6c5a3c6ba02e4fbefbb4052789913f3dff245b8aea04712a99a30edaf6577fde6e8e16449836492e9a143858d742fcac545da4e7a0b9686cecbce1104fdd99736c472c096666b24568f7701cfddbf842c3407d33f7f32a47bb09872b937b4dd00b2925b0d7dd76d4ffc7804366947f50524f72bd504707f4d7d01cafa6e25df0d84e569687853b0a4947dc418323485da307c65f3f1ab79a88df0b0a3be43d93e0bcf6c8cd4702f33a7ba4e645e613cde739b63a477ae854fe4df557c53a3d2e4bbf4e4fe671b94e8ba579d288a99ef5bbdc2ef4edeae7e2fdfc88313aa64128f45f1a133c71fb6bfc7b06ef1f),
(393, '2012-11-22 15:36:08', 3, 'categories.php', 'cPath=3&pID=2&page=1&', '127.0.0.1', 0, '', ''),
(394, '2012-11-22 15:36:19', 3, 'product.php', 'page=1&product_type=1&cPath=3&pID=2&action=new_product&', '127.0.0.1', 0, '', ''),
(395, '2012-11-22 15:36:26', 3, 'product.php', 'cPath=3&product_type=1&pID=2&action=new_product_preview&page=1&', '127.0.0.1', 0, '', 0x8553db4ec3300cfd15d467404dca80ed5b26455ee2154b69531c671721fe9d64e5d2750cfa50b53ec7f1f1b1f3560d1c5cb2128d034103cea1ab5695ae95be53ea4eeb1bb558350faba6a96eab0ea2201b9b996d60c268a8900bf4730c451b522f468e0366b0be0a9a2d876ece18982c9a1838172ad87d9d9f29210a488a195267079fc4ef803c6c3c4e1a68ea93ee3e6dc14a62e44fcdd3e41eba9cf2964f5c55ebf4b8acdd3a3de9c7e53a2d96fa2947b47acedff57691dfb679aedebf930dc5dc06e2b99e12b5e0fdafcd39b3391a1061da24b97048e060ac87f829535da497a0be7065b4ade5104fd6e829b623960433314522f83d1c47fd26bed03050dfcef5bccad16cc2e18aedaf097aa14c09ecf26274d4ffc7804361d47f71524f72bd524707bc70c661b44c8350e8bf063919d24f76c953eaacc12e38f4b38518187714529e41072d8e20756d5e5ffefac9f15cd5e3f704c30e79cf2438d73672cb0ac2bc4e62ffabdc3d52fb22f351944b315a7442de3f00),
(396, '2012-11-22 15:36:28', 3, 'product.php', 'cPath=3&product_type=1&pID=2&action=update_product&page=1&', '127.0.0.1', 0, '', 0x8552ed4ec3300c7c15d4df809a9401dbb34c8abcc42b96daa624ce3e34eddd71d60dd68e417f54adef6cdfd93e147df02e598ec601a301e7d0158b42974a3f29f5a4f5839a2daa974555158f450b9131182bccda07c268289333f45386a2f5a963c3fb1e052cef82661d7c3b65f4812c9ae88334cad87329cf352132708a02a951e193f80d5003ab06af0c54e5497797d66039050c67cd3fc986a228411c97cc510b4df3ab3e67567b03cc8156896f4c32ec8c6d209e3ba99bf41cd437c606e775f0f1e44e5f631b0a9c6022264b84660bfb41bf891fd4f7d4d5533d9fbc372bbfbb33b9cf041d93507c70b2db96baff18b0cb8cf22f4eea88ef776a6987ee1e9ae34a8d0cb4de6133da599e166ec82799710b350e20b5b55c58b8fc48dc48227e6fc86f306c03314e7b0fdc7c2530edb345aa3f783ad27c9f83d529d2412be50f527f512cd3ebbc74cbf4a65fe7cb349beb378968f52edfe57a266f5bbd17c7eb2bc66803f54cbebbd418e12934bfc6bf6770fc02),
(397, '2012-11-22 15:36:28', 3, 'categories.php', 'cPath=3&pID=2&page=1&', '127.0.0.1', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menus`
--

DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE IF NOT EXISTS `admin_menus` (
  `menu_key` varchar(32) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `menu_key` (`menu_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_menus`
--

INSERT INTO `admin_menus` (`menu_key`, `language_key`, `sort_order`) VALUES
('configuration', 'BOX_HEADING_CONFIGURATION', 1),
('catalog', 'BOX_HEADING_CATALOG', 2),
('modules', 'BOX_HEADING_MODULES', 3),
('customers', 'BOX_HEADING_CUSTOMERS', 4),
('taxes', 'BOX_HEADING_LOCATION_AND_TAXES', 5),
('localization', 'BOX_HEADING_LOCALIZATION', 6),
('reports', 'BOX_HEADING_REPORTS', 7),
('tools', 'BOX_HEADING_TOOLS', 8),
('gv', 'BOX_HEADING_GV_ADMIN', 9),
('access', 'BOX_HEADING_ADMIN_ACCESS', 10),
('extras', 'BOX_HEADING_EXTRAS', 11);

-- --------------------------------------------------------

--
-- Table structure for table `admin_pages`
--

DROP TABLE IF EXISTS `admin_pages`;
CREATE TABLE IF NOT EXISTS `admin_pages` (
  `page_key` varchar(32) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `main_page` varchar(64) NOT NULL DEFAULT '',
  `page_params` varchar(64) NOT NULL DEFAULT '',
  `menu_key` varchar(32) NOT NULL DEFAULT '',
  `display_on_menu` char(1) NOT NULL DEFAULT 'N',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_pages`
--

INSERT INTO `admin_pages` (`page_key`, `language_key`, `main_page`, `page_params`, `menu_key`, `display_on_menu`, `sort_order`) VALUES
('configMyStore', 'BOX_CONFIGURATION_MY_STORE', 'FILENAME_CONFIGURATION', 'gID=1', 'configuration', 'Y', 1),
('configMinimumValues', 'BOX_CONFIGURATION_MINIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=2', 'configuration', 'Y', 2),
('configMaximumValues', 'BOX_CONFIGURATION_MAXIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=3', 'configuration', 'Y', 3),
('configImages', 'BOX_CONFIGURATION_IMAGES', 'FILENAME_CONFIGURATION', 'gID=4', 'configuration', 'Y', 4),
('configCustomerDetails', 'BOX_CONFIGURATION_CUSTOMER_DETAILS', 'FILENAME_CONFIGURATION', 'gID=5', 'configuration', 'Y', 5),
('configShipping', 'BOX_CONFIGURATION_SHIPPING_PACKAGING', 'FILENAME_CONFIGURATION', 'gID=7', 'configuration', 'Y', 6),
('configProductListing', 'BOX_CONFIGURATION_PRODUCT_LISTING', 'FILENAME_CONFIGURATION', 'gID=8', 'configuration', 'Y', 7),
('configStock', 'BOX_CONFIGURATION_STOCK', 'FILENAME_CONFIGURATION', 'gID=9', 'configuration', 'Y', 8),
('configLogging', 'BOX_CONFIGURATION_LOGGING', 'FILENAME_CONFIGURATION', 'gID=10', 'configuration', 'Y', 9),
('configEmail', 'BOX_CONFIGURATION_EMAIL_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=12', 'configuration', 'Y', 10),
('configAttributes', 'BOX_CONFIGURATION_ATTRIBUTE_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=13', 'configuration', 'Y', 11),
('configGzipCompression', 'BOX_CONFIGURATION_GZIP_COMPRESSION', 'FILENAME_CONFIGURATION', 'gID=14', 'configuration', 'Y', 12),
('configSessions', 'BOX_CONFIGURATION_SESSIONS', 'FILENAME_CONFIGURATION', 'gID=15', 'configuration', 'Y', 13),
('configRegulations', 'BOX_CONFIGURATION_REGULATIONS', 'FILENAME_CONFIGURATION', 'gID=11', 'configuration', 'Y', 14),
('configGvCoupons', 'BOX_CONFIGURATION_GV_COUPONS', 'FILENAME_CONFIGURATION', 'gID=16', 'configuration', 'Y', 15),
('configCreditCards', 'BOX_CONFIGURATION_CREDIT_CARDS', 'FILENAME_CONFIGURATION', 'gID=17', 'configuration', 'Y', 16),
('configProductInfo', 'BOX_CONFIGURATION_PRODUCT_INFO', 'FILENAME_CONFIGURATION', 'gID=18', 'configuration', 'Y', 17),
('configLayoutSettings', 'BOX_CONFIGURATION_LAYOUT_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=19', 'configuration', 'Y', 18),
('configWebsiteMaintenance', 'BOX_CONFIGURATION_WEBSITE_MAINTENANCE', 'FILENAME_CONFIGURATION', 'gID=20', 'configuration', 'Y', 19),
('configNewListing', 'BOX_CONFIGURATION_NEW_LISTING', 'FILENAME_CONFIGURATION', 'gID=21', 'configuration', 'Y', 20),
('configFeaturedListing', 'BOX_CONFIGURATION_FEATURED_LISTING', 'FILENAME_CONFIGURATION', 'gID=22', 'configuration', 'Y', 21),
('configAllListing', 'BOX_CONFIGURATION_ALL_LISTING', 'FILENAME_CONFIGURATION', 'gID=23', 'configuration', 'Y', 22),
('configIndexListing', 'BOX_CONFIGURATION_INDEX_LISTING', 'FILENAME_CONFIGURATION', 'gID=24', 'configuration', 'Y', 23),
('configDefinePageStatus', 'BOX_CONFIGURATION_DEFINE_PAGE_STATUS', 'FILENAME_CONFIGURATION', 'gID=25', 'configuration', 'Y', 24),
('configEzPagesSettings', 'BOX_CONFIGURATION_EZPAGES_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=30', 'configuration', 'Y', 25),
('categories', 'BOX_CATALOG_CATEGORIES_PRODUCTS', 'FILENAME_CATEGORIES', '', 'catalog', 'Y', 1),
('productTypes', 'BOX_CATALOG_PRODUCT_TYPES', 'FILENAME_PRODUCT_TYPES', '', 'catalog', 'Y', 2),
('priceManager', 'BOX_CATALOG_PRODUCTS_PRICE_MANAGER', 'FILENAME_PRODUCTS_PRICE_MANAGER', '', 'catalog', 'Y', 3),
('optionNames', 'BOX_CATALOG_CATEGORIES_OPTIONS_NAME_MANAGER', 'FILENAME_OPTIONS_NAME_MANAGER', '', 'catalog', 'Y', 4),
('optionValues', 'BOX_CATALOG_CATEGORIES_OPTIONS_VALUES_MANAGER', 'FILENAME_OPTIONS_VALUES_MANAGER', '', 'catalog', 'Y', 5),
('attributes', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_CONTROLLER', 'FILENAME_ATTRIBUTES_CONTROLLER', '', 'catalog', 'Y', 6),
('downloads', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_DOWNLOADS_MANAGER', 'FILENAME_DOWNLOADS_MANAGER', '', 'catalog', 'Y', 7),
('optionNameSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_NAME', 'FILENAME_PRODUCTS_OPTIONS_NAME', '', 'catalog', 'Y', 8),
('optionValueSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_VALUES', 'FILENAME_PRODUCTS_OPTIONS_VALUES', '', 'catalog', 'Y', 9),
('manufacturers', 'BOX_CATALOG_MANUFACTURERS', 'FILENAME_MANUFACTURERS', '', 'catalog', 'Y', 10),
('reviews', 'BOX_CATALOG_REVIEWS', 'FILENAME_REVIEWS', '', 'catalog', 'Y', 11),
('specials', 'BOX_CATALOG_SPECIALS', 'FILENAME_SPECIALS', '', 'catalog', 'Y', 12),
('featured', 'BOX_CATALOG_FEATURED', 'FILENAME_FEATURED', '', 'catalog', 'Y', 13),
('salemaker', 'BOX_CATALOG_SALEMAKER', 'FILENAME_SALEMAKER', '', 'catalog', 'Y', 14),
('productsExpected', 'BOX_CATALOG_PRODUCTS_EXPECTED', 'FILENAME_PRODUCTS_EXPECTED', '', 'catalog', 'Y', 15),
('product', 'BOX_CATALOG_PRODUCT', 'FILENAME_PRODUCT', '', 'catalog', 'N', 16),
('productsToCategories', 'BOX_CATALOG_PRODUCTS_TO_CATEGORIES', 'FILENAME_PRODUCTS_TO_CATEGORIES', '', 'catalog', 'N', 17),
('payment', 'BOX_MODULES_PAYMENT', 'FILENAME_MODULES', 'set=payment', 'modules', 'Y', 1),
('shipping', 'BOX_MODULES_SHIPPING', 'FILENAME_MODULES', 'set=shipping', 'modules', 'Y', 2),
('orderTotal', 'BOX_MODULES_ORDER_TOTAL', 'FILENAME_MODULES', 'set=ordertotal', 'modules', 'Y', 3),
('customers', 'BOX_CUSTOMERS_CUSTOMERS', 'FILENAME_CUSTOMERS', '', 'customers', 'Y', 1),
('orders', 'BOX_CUSTOMERS_ORDERS', 'FILENAME_ORDERS', '', 'customers', 'Y', 2),
('groupPricing', 'BOX_CUSTOMERS_GROUP_PRICING', 'FILENAME_GROUP_PRICING', '', 'customers', 'Y', 3),
('paypal', 'BOX_CUSTOMERS_PAYPAL', 'FILENAME_PAYPAL', '', 'customers', 'Y', 4),
('invoice', 'BOX_CUSTOMERS_INVOICE', 'FILENAME_ORDERS_INVOICE', '', 'customers', 'N', 5),
('packingslip', 'BOX_CUSTOMERS_PACKING_SLIP', 'FILENAME_ORDERS_PACKINGSLIP', '', 'customers', 'N', 6),
('linkpointReview', 'BOX_CUSTOMERS_LINKPOINT_REVIEW', 'FILENAME_LINKPOINT_REVIEW', '', 'customers', 'Y', 7),
('countries', 'BOX_TAXES_COUNTRIES', 'FILENAME_COUNTRIES', '', 'taxes', 'Y', 1),
('zones', 'BOX_TAXES_ZONES', 'FILENAME_ZONES', '', 'taxes', 'Y', 2),
('geoZones', 'BOX_TAXES_GEO_ZONES', 'FILENAME_GEO_ZONES', '', 'taxes', 'Y', 3),
('taxClasses', 'BOX_TAXES_TAX_CLASSES', 'FILENAME_TAX_CLASSES', '', 'taxes', 'Y', 4),
('taxRates', 'BOX_TAXES_TAX_RATES', 'FILENAME_TAX_RATES', '', 'taxes', 'Y', 5),
('currencies', 'BOX_LOCALIZATION_CURRENCIES', 'FILENAME_CURRENCIES', '', 'localization', 'Y', 1),
('languages', 'BOX_LOCALIZATION_LANGUAGES', 'FILENAME_LANGUAGES', '', 'localization', 'Y', 2),
('ordersStatus', 'BOX_LOCALIZATION_ORDERS_STATUS', 'FILENAME_ORDERS_STATUS', '', 'localization', 'Y', 3),
('reportCustomers', 'BOX_REPORTS_ORDERS_TOTAL', 'FILENAME_STATS_CUSTOMERS', '', 'reports', 'Y', 1),
('reportReferrals', 'BOX_REPORTS_CUSTOMERS_REFERRALS', 'FILENAME_STATS_CUSTOMERS_REFERRALS', '', 'reports', 'Y', 2),
('reportLowStock', 'BOX_REPORTS_PRODUCTS_LOWSTOCK', 'FILENAME_STATS_PRODUCTS_LOWSTOCK', '', 'reports', 'Y', 3),
('reportProductsSold', 'BOX_REPORTS_PRODUCTS_PURCHASED', 'FILENAME_STATS_PRODUCTS_PURCHASED', '', 'reports', 'Y', 4),
('reportProductsViewed', 'BOX_REPORTS_PRODUCTS_VIEWED', 'FILENAME_STATS_PRODUCTS_VIEWED', '', 'reports', 'Y', 5),
('templateSelect', 'BOX_TOOLS_TEMPLATE_SELECT', 'FILENAME_TEMPLATE_SELECT', '', 'tools', 'Y', 1),
('layoutController', 'BOX_TOOLS_LAYOUT_CONTROLLER', 'FILENAME_LAYOUT_CONTROLLER', '', 'tools', 'Y', 2),
('banners', 'BOX_TOOLS_BANNER_MANAGER', 'FILENAME_BANNER_MANAGER', '', 'tools', 'Y', 3),
('mail', 'BOX_TOOLS_MAIL', 'FILENAME_MAIL', '', 'tools', 'Y', 4),
('newsletters', 'BOX_TOOLS_NEWSLETTER_MANAGER', 'FILENAME_NEWSLETTERS', '', 'tools', 'Y', 5),
('server', 'BOX_TOOLS_SERVER_INFO', 'FILENAME_SERVER_INFO', '', 'tools', 'Y', 6),
('whosOnline', 'BOX_TOOLS_WHOS_ONLINE', 'FILENAME_WHOS_ONLINE', '', 'tools', 'Y', 7),
('storeManager', 'BOX_TOOLS_STORE_MANAGER', 'FILENAME_STORE_MANAGER', '', 'tools', 'Y', 9),
('developersToolKit', 'BOX_TOOLS_DEVELOPERS_TOOL_KIT', 'FILENAME_DEVELOPERS_TOOL_KIT', '', 'tools', 'Y', 10),
('ezpages', 'BOX_TOOLS_EZPAGES', 'FILENAME_EZPAGES_ADMIN', '', 'tools', 'Y', 11),
('definePagesEditor', 'BOX_TOOLS_DEFINE_PAGES_EDITOR', 'FILENAME_DEFINE_PAGES_EDITOR', '', 'tools', 'Y', 12),
('sqlPatch', 'BOX_TOOLS_SQLPATCH', 'FILENAME_SQLPATCH', '', 'tools', 'Y', 13),
('couponAdmin', 'BOX_COUPON_ADMIN', 'FILENAME_COUPON_ADMIN', '', 'gv', 'Y', 1),
('couponRestrict', 'BOX_COUPON_RESTRICT', 'FILENAME_COUPON_RESTRICT', '', 'gv', 'N', 1),
('gvQueue', 'BOX_GV_ADMIN_QUEUE', 'FILENAME_GV_QUEUE', '', 'gv', 'Y', 2),
('gvMail', 'BOX_GV_ADMIN_MAIL', 'FILENAME_GV_MAIL', '', 'gv', 'Y', 3),
('gvSent', 'BOX_GV_ADMIN_SENT', 'FILENAME_GV_SENT', '', 'gv', 'Y', 4),
('profiles', 'BOX_ADMIN_ACCESS_PROFILES', 'FILENAME_PROFILES', '', 'access', 'Y', 1),
('users', 'BOX_ADMIN_ACCESS_USERS', 'FILENAME_USERS', '', 'access', 'Y', 2),
('pageRegistration', 'BOX_ADMIN_ACCESS_PAGE_REGISTRATION', 'FILENAME_ADMIN_PAGE_REGISTRATION', '', 'access', 'Y', 3),
('adminlogs', 'BOX_ADMIN_ACCESS_LOGS', 'FILENAME_ADMIN_ACTIVITY', '', 'access', 'Y', 4),
('recordArtists', 'BOX_CATALOG_RECORD_ARTISTS', 'FILENAME_RECORD_ARTISTS', '', 'extras', 'Y', 1),
('recordCompanies', 'BOX_CATALOG_RECORD_COMPANY', 'FILENAME_RECORD_COMPANY', '', 'extras', 'Y', 2),
('musicGenre', 'BOX_CATALOG_MUSIC_GENRE', 'FILENAME_MUSIC_GENRE', '', 'extras', 'Y', 3),
('mediaManager', 'BOX_CATALOG_MEDIA_MANAGER', 'FILENAME_MEDIA_MANAGER', '', 'extras', 'Y', 4),
('mediaTypes', 'BOX_CATALOG_MEDIA_TYPES', 'FILENAME_MEDIA_TYPES', '', 'extras', 'Y', 5);

-- --------------------------------------------------------

--
-- Table structure for table `admin_pages_to_profiles`
--

DROP TABLE IF EXISTS `admin_pages_to_profiles`;
CREATE TABLE IF NOT EXISTS `admin_pages_to_profiles` (
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `page_key` varchar(32) NOT NULL DEFAULT '',
  UNIQUE KEY `profile_page` (`profile_id`,`page_key`),
  UNIQUE KEY `page_profile` (`page_key`,`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin_profiles`
--

DROP TABLE IF EXISTS `admin_profiles`;
CREATE TABLE IF NOT EXISTS `admin_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_profiles`
--

INSERT INTO `admin_profiles` (`profile_id`, `profile_name`) VALUES
(1, 'Superuser');

-- --------------------------------------------------------

--
-- Table structure for table `authorizenet`
--

DROP TABLE IF EXISTS `authorizenet`;
CREATE TABLE IF NOT EXISTS `authorizenet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `response_code` int(1) NOT NULL DEFAULT '0',
  `response_text` varchar(255) NOT NULL DEFAULT '',
  `authorization_type` varchar(50) NOT NULL DEFAULT '',
  `transaction_id` bigint(20) DEFAULT NULL,
  `sent` longtext NOT NULL,
  `received` longtext NOT NULL,
  `time` varchar(50) NOT NULL DEFAULT '',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) NOT NULL DEFAULT '',
  `banners_url` varchar(255) NOT NULL DEFAULT '',
  `banners_image` varchar(64) NOT NULL DEFAULT '',
  `banners_group` varchar(15) NOT NULL DEFAULT '',
  `banners_html_text` text,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `banners_open_new_windows` int(1) NOT NULL DEFAULT '1',
  `banners_on_ssl` int(1) NOT NULL DEFAULT '1',
  `banners_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banners_id`),
  KEY `idx_status_group_zen` (`status`,`banners_group`),
  KEY `idx_expires_date_zen` (`expires_date`),
  KEY `idx_date_scheduled_zen` (`date_scheduled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`banners_id`, `banners_title`, `banners_url`, `banners_image`, `banners_group`, `banners_html_text`, `expires_impressions`, `expires_date`, `date_scheduled`, `date_added`, `date_status_change`, `status`, `banners_open_new_windows`, `banners_on_ssl`, `banners_sort_order`) VALUES
(1, 'Zen Cart', 'http://www.zen-cart.com', 'banners/zencart_468_60_02.gif', 'Wide-Banners', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0),
(2, 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/125zen_logo.gif', 'SideBox-Banners', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0),
(3, 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/125x125_zen_logo.gif', 'SideBox-Banners', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0),
(4, 'if you have to think ... you haven''t been Zenned!', 'http://www.zen-cart.com', 'banners/think_anim.gif', 'Wide-Banners', '', 0, NULL, NULL, '2004-01-12 20:53:18', NULL, 1, 1, 1, 0),
(5, 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/bw_zen_88wide.gif', 'BannersAll', '', 0, NULL, NULL, '2005-05-13 10:54:38', NULL, 1, 1, 1, 10),
(6, 'Start Accepting Credit Cards For Your Business Today!', 'http://www.zen-cart.com/partners/payment', 'banners/cardsvcs_468x60.gif', 'Wide-Banners', '', 0, NULL, NULL, '2006-03-13 11:02:43', NULL, 1, 1, 1, 0),
(7, 'eStart Your Web Store with Zen Cart(R)', 'http://www.zen-cart.com/book', 'banners/big-book-ad.gif', 'Wide-Banners', '', 0, NULL, NULL, '2007-02-10 00:00:00', NULL, 1, 1, 1, 1),
(8, 'eStart Your Web Store with Zen Cart(R)', 'http://www.zen-cart.com/book', 'banners/tall-book.gif', 'SideBox-Banners', '', 0, NULL, NULL, '2007-02-10 00:00:00', NULL, 1, 1, 1, 1),
(9, 'eStart Your Web Store with Zen Cart(R)', 'http://www.zen-cart.com/book', 'banners/tall-book.gif', 'BannersAll', '', 0, NULL, NULL, '2007-02-10 00:00:00', NULL, 1, 1, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `banners_history`
--

DROP TABLE IF EXISTS `banners_history`;
CREATE TABLE IF NOT EXISTS `banners_history` (
  `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_id` int(11) NOT NULL DEFAULT '0',
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`banners_history_id`),
  KEY `idx_banners_id_zen` (`banners_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `banners_history`
--

INSERT INTO `banners_history` (`banners_history_id`, `banners_id`, `banners_shown`, `banners_clicked`, `banners_history_date`) VALUES
(1, 2, 9, 0, '2012-11-16 15:54:39'),
(2, 5, 8, 0, '2012-11-16 15:54:39'),
(3, 9, 8, 0, '2012-11-16 15:54:39'),
(4, 2, 9, 0, '2012-11-16 15:54:39'),
(5, 1, 21, 0, '2012-11-16 15:54:39'),
(6, 8, 3, 0, '2012-11-16 15:56:32'),
(7, 8, 3, 0, '2012-11-16 15:56:33'),
(8, 4, 19, 0, '2012-11-16 15:56:33'),
(9, 3, 1, 0, '2012-11-16 15:56:43'),
(10, 3, 1, 0, '2012-11-16 15:56:43'),
(11, 7, 22, 0, '2012-11-16 15:56:43'),
(12, 6, 25, 0, '2012-11-16 16:59:29'),
(13, 1, 13, 0, '2012-11-19 09:57:06'),
(14, 6, 20, 0, '2012-11-19 10:03:18'),
(15, 4, 15, 0, '2012-11-19 10:03:32'),
(16, 7, 15, 0, '2012-11-19 10:57:58'),
(17, 2, 7, 0, '2012-11-19 16:06:31'),
(18, 5, 10, 0, '2012-11-19 16:06:31'),
(19, 9, 10, 0, '2012-11-19 16:06:31'),
(20, 2, 7, 0, '2012-11-19 16:06:31'),
(21, 8, 9, 0, '2012-11-19 16:06:36'),
(22, 8, 9, 0, '2012-11-19 16:06:36'),
(23, 3, 1, 0, '2012-11-19 21:45:57'),
(24, 3, 1, 0, '2012-11-19 21:45:57'),
(25, 2, 17, 0, '2012-11-22 14:48:07'),
(26, 5, 32, 0, '2012-11-22 14:48:08'),
(27, 9, 32, 0, '2012-11-22 14:48:08'),
(28, 2, 17, 0, '2012-11-22 14:48:08'),
(29, 8, 21, 0, '2012-11-22 14:48:23'),
(30, 8, 21, 0, '2012-11-22 14:48:24'),
(31, 3, 23, 0, '2012-11-22 14:49:13'),
(32, 3, 23, 0, '2012-11-22 14:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(64) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `categories_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`categories_id`),
  KEY `idx_parent_id_cat_id_zen` (`parent_id`,`categories_id`),
  KEY `idx_status_zen` (`categories_status`),
  KEY `idx_sort_order_zen` (`sort_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_image`, `parent_id`, `sort_order`, `date_added`, `last_modified`, `categories_status`) VALUES
(1, 'categories/test.gif', 0, 0, '2012-11-16 16:51:53', '2012-11-22 15:32:51', 1),
(2, NULL, 0, 1, '2012-11-16 16:52:10', '2012-11-22 15:31:51', 1),
(3, NULL, 0, 0, '2012-11-22 15:32:33', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories_description`
--

DROP TABLE IF EXISTS `categories_description`;
CREATE TABLE IF NOT EXISTS `categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) NOT NULL DEFAULT '',
  `categories_description` text NOT NULL,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name_zen` (`categories_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories_description`
--

INSERT INTO `categories_description` (`categories_id`, `language_id`, `categories_name`, `categories_description`) VALUES
(1, 1, 'Cloth', 'cloth'),
(2, 1, 'Food', 'food'),
(3, 1, 'Game', 'Game');

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
CREATE TABLE IF NOT EXISTS `configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `configuration_group_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_cfg_grp_id_zen` (`configuration_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=556 ;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(1, 'Store Name', 'STORE_NAME', 'test', 'The name of my store', 1, 1, NULL, '2012-11-16 15:52:04', NULL, NULL),
(2, 'Store Owner', 'STORE_OWNER', 'test', 'The name of my store owner', 1, 2, NULL, '2012-11-16 15:52:04', NULL, NULL),
(3, 'Telephone - Customer Service', 'STORE_TELEPHONE_CUSTSERVICE', '', 'Enter a telephone number for customers to reach your Customer Service department. This number may be sent as part of payment transaction details.', 1, 3, NULL, '2012-11-16 15:52:04', NULL, NULL),
(4, 'Country', 'STORE_COUNTRY', '44', 'The country my store is located in <br /><br /><strong>Note: Please remember to update the store zone.</strong>', 1, 6, NULL, '2012-11-16 15:52:04', 'zen_get_country_name', 'zen_cfg_pull_down_country_list('),
(5, 'Zone', 'STORE_ZONE', '21', 'The zone my store is located in', 1, 7, NULL, '2012-11-16 15:52:04', 'zen_cfg_get_zone_name', 'zen_cfg_pull_down_zone_list('),
(6, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''asc'', ''desc''), '),
(7, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''products_name'', ''date_expected''), '),
(8, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language''s currency when it is changed', 1, 10, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(9, 'Language Selector', 'LANGUAGE_DEFAULT_SELECTOR', 'Default', 'Should the default language be based on the Store preferences, or the customer''s browser settings?<br /><br />Default: Store''s default settings', 1, 11, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''Default'', ''Browser''), '),
(10, 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 6, 12, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(11, 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(12, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''and'', ''or''), '),
(13, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\r\n Address\r\n Country\r\n Phone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 7, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_textarea('),
(14, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(15, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2012-11-16 15:52:04', NULL, NULL),
(16, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(17, 'Display Prices with Tax in Admin', 'DISPLAY_PRICE_WITH_TAX_ADMIN', 'false', 'Display prices with tax included (true) or add the tax at the end (false) in Admin(Invoices)', 1, 21, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(18, 'Basis of Product Tax', 'STORE_PRODUCT_TAX_BASIS', 'Shipping', 'On what basis is Product Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 1, 21, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(19, 'Basis of Shipping Tax', 'STORE_SHIPPING_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone - Can be overriden by correctly written Shipping Module', 1, 21, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(20, 'Sales Tax Display Status', 'STORE_TAX_DISPLAY_STATUS', '0', 'Always show Sales Tax even when amount is $0.00?<br />0= Off<br />1= On', 1, 21, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(21, 'Show Split Tax Lines', 'SHOW_SPLIT_TAX_CHECKOUT', 'false', 'If multiple tax rates apply, show each rate as a separate line at checkout', 1, 22, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(22, 'Admin Session Time Out in Seconds', 'SESSION_TIMEOUT_ADMIN', '900', 'Enter the time in seconds.<br />Max allowed is 900 for PCI Compliance Reasons.<br /> Default=900<br />Example: 900= 15 min <br /><br />Note: Too few seconds can result in timeout issues when adding/editing products', 1, 40, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''900'', ''600'', ''300''), '),
(23, 'Admin Set max_execution_time for processes', 'GLOBAL_SET_TIME_LIMIT', '60', 'Enter the time in seconds for how long the max_execution_time of processes should be. Default=60<br />Example: 60= 1 minute<br /><br />Note: Changing the time limit is only needed if you are having problems with the execution time of a process', 1, 42, NULL, '2012-11-16 15:52:04', NULL, NULL),
(24, 'Show if version update available', 'SHOW_VERSION_UPDATE_IN_HEADER', 'true', 'Automatically check to see if a new version of Zen Cart is available. Enabling this can sometimes slow down the loading of Admin pages. (Displayed on main Index page after login, and Server Info page.)', 1, 44, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(25, 'Store Status', 'STORE_STATUS', '0', 'What is your Store Status<br />0= Normal Store<br />1= Showcase no prices<br />2= Showcase with prices', 1, 25, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(26, 'Server Uptime', 'DISPLAY_SERVER_UPTIME', 'true', 'Displaying Server uptime can cause entries in error logs on some servers. (true = Display, false = don''t display)', 1, 46, '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(''true'', ''false''),'),
(27, 'Missing Page Check', 'MISSING_PAGE_CHECK', 'Page Not Found', 'Zen Cart can check for missing pages in the URL and redirect to Index page. For debugging you may want to turn this off. <br /><br /><strong>Default=On</strong><br />On = Send missing pages to ''index''<br />Off = Don''t check for missing pages<br />Page Not Found = display the Page-Not-Found page', 1, 48, '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(''On'', ''Off'', ''Page Not Found''),'),
(28, 'cURL Proxy Status', 'CURL_PROXY_REQUIRED', 'False', 'Does your host require that you use a proxy for cURL communication?', 6, 50, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(29, 'cURL Proxy Address', 'CURL_PROXY_SERVER_DETAILS', '', 'If you have a hosting service that requires use of a proxy to talk to external sites via cURL, enter their proxy address here.<br />format: address:port<br />ie: 127.0.0.1:3128', 6, 51, NULL, '2012-11-16 15:52:04', NULL, NULL),
(30, 'HTML Editor', 'HTML_EDITOR_PREFERENCE', 'NONE', 'Please select the HTML/Rich-Text editor you wish to use for composing Admin-related emails, newsletters, and product descriptions', 1, 110, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_pull_down_htmleditors('),
(31, 'Enable phpBB linkage?', 'PHPBB_LINKS_ENABLED', 'false', 'Should Zen Cart synchronize new account information to your (already-installed) phpBB forum?', 1, 120, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(32, 'Show Category Counts - Admin', 'SHOW_COUNTS_ADMIN', 'true', 'Show Category Counts in Admin?', 1, 19, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(33, 'Currency Conversion Ratio', 'CURRENCY_UPLIFT_RATIO', '1.05', 'When auto-updating currencies, what "uplift" ratio should be used to calculate the exchange rate used by your store?<br />ie: the bank rate is obtained from the currency-exchange servers; how much extra do you want to charge in order to make up the difference between the bank rate and the consumer rate?<br /><br /><strong>Default: 1.05 </strong><br />This will cause the published bank rate to be multiplied by 1.05 to set the currency rates in your store.', 1, 55, NULL, '2012-11-16 15:52:04', NULL, NULL),
(34, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2012-11-16 15:52:04', NULL, NULL),
(35, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2012-11-16 15:52:04', NULL, NULL),
(36, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2012-11-16 15:52:04', NULL, NULL),
(37, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2012-11-16 15:52:04', NULL, NULL),
(38, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2012-11-16 15:52:04', NULL, NULL),
(39, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '0', 'Minimum length of company name', 2, 6, NULL, '2012-11-16 15:52:04', NULL, NULL),
(40, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2012-11-16 15:52:04', NULL, NULL),
(41, 'City', 'ENTRY_CITY_MIN_LENGTH', '2', 'Minimum length of city', 2, 8, NULL, '2012-11-16 15:52:04', NULL, NULL),
(42, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2012-11-16 15:52:04', NULL, NULL),
(43, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2012-11-16 15:52:04', NULL, NULL),
(44, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '7', 'Minimum length of password', 2, 11, NULL, '2012-11-16 15:52:04', NULL, NULL),
(45, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2012-11-16 15:52:04', NULL, NULL),
(46, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2012-11-16 15:52:04', NULL, NULL),
(47, 'Credit Card CVV Number', 'CC_CVV_MIN_LENGTH', '3', 'Minimum length of credit card CVV number', 2, 13, NULL, '2012-11-16 15:52:04', NULL, NULL),
(48, 'Product Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of product review text', 2, 14, NULL, '2012-11-16 15:52:04', NULL, NULL),
(49, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2012-11-16 15:52:04', NULL, NULL),
(50, 'Also Purchased Products', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the ''This Customer Also Purchased'' box', 2, 16, NULL, '2012-11-16 15:52:04', NULL, NULL),
(51, 'Nick Name', 'ENTRY_NICK_MIN_LENGTH', '3', 'Minimum length of Nick Name', 2, 1, NULL, '2012-11-16 15:52:04', NULL, NULL),
(52, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2012-11-16 15:52:04', NULL, NULL),
(53, 'Admin Search Results Per Page', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Number of products to list on an Admin search result page', 3, 2, NULL, '2012-11-16 15:52:04', NULL, NULL),
(54, 'Prev/Next Navigation Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of ''number'' links use for page-sets', 3, 3, NULL, '2012-11-16 15:52:04', NULL, NULL),
(55, 'Products on Special ', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Number of products on special to display', 3, 4, NULL, '2012-11-16 15:52:04', NULL, NULL),
(56, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Number of new products to display in a category', 3, 5, NULL, '2012-11-16 15:52:04', NULL, NULL),
(57, 'Upcoming Products ', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Number of ''upcoming'' products to display', 3, 6, NULL, '2012-11-16 15:52:04', NULL, NULL),
(58, 'Manufacturers List - Scroll Box Size/Style', 'MAX_MANUFACTURERS_LIST', '3', 'Number of manufacturers names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', 3, 7, NULL, '2012-11-16 15:52:04', NULL, NULL),
(59, 'Manufacturers List - Verify Product Exist', 'PRODUCTS_MANUFACTURERS_STATUS', '1', 'Verify that at least 1 product exists and is active for the manufacturer name to show<br /><br />Note: When this feature is ON it can produce slower results on sites with a large number of products and/or manufacturers<br />0= off 1= on', 3, 7, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(60, 'Music Genre List - Scroll Box Size/Style', 'MAX_MUSIC_GENRES_LIST', '3', 'Number of music genre names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', 3, 7, NULL, '2012-11-16 15:52:04', NULL, NULL),
(61, 'Record Company List - Scroll Box Size/Style', 'MAX_RECORD_COMPANY_LIST', '3', 'Number of record company names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', 3, 7, NULL, '2012-11-16 15:52:04', NULL, NULL),
(62, 'Length of Record Company Name', 'MAX_DISPLAY_RECORD_COMPANY_NAME_LEN', '15', 'Used in record companies box; maximum length of record company name to display. Longer names will be truncated.', 3, 8, NULL, '2012-11-16 15:52:04', NULL, NULL),
(63, 'Length of Music Genre Name', 'MAX_DISPLAY_MUSIC_GENRES_NAME_LEN', '15', 'Used in music genres box; maximum length of music genre name to display. Longer names will be truncated.', 3, 8, NULL, '2012-11-16 15:52:04', NULL, NULL),
(64, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display. Longer names will be truncated.', 3, 8, NULL, '2012-11-16 15:52:04', NULL, NULL),
(65, 'New Product Reviews Per Page', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Number of new reviews to display on each page', 3, 9, NULL, '2012-11-16 15:52:04', NULL, NULL),
(66, 'Random Product Reviews for SideBox', 'MAX_RANDOM_SELECT_REVIEWS', '1', 'Number of random product REVIEWS to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 10, NULL, '2012-11-16 15:52:04', NULL, NULL),
(67, 'Random New Products for SideBox', 'MAX_RANDOM_SELECT_NEW', '3', 'Number of random NEW products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 11, NULL, '2012-11-16 15:52:04', NULL, NULL),
(68, 'Random Products On Special for SideBox', 'MAX_RANDOM_SELECT_SPECIALS', '2', 'Number of random products on SPECIAL to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 12, NULL, '2012-11-16 15:52:04', NULL, NULL),
(69, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, NULL, '2012-11-16 15:52:04', NULL, NULL),
(70, 'New Products Listing- Number Per Page', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Number of new products listed per page', 3, 14, NULL, '2012-11-16 15:52:04', NULL, NULL),
(71, 'Best Sellers For Box', 'MAX_DISPLAY_BESTSELLERS', '10', 'Number of best sellers to display in box', 3, 15, NULL, '2012-11-16 15:52:04', NULL, NULL),
(72, 'Also Purchased Products', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Number of products to display in the ''This Customer Also Purchased'' box', 3, 16, NULL, '2012-11-16 15:52:04', NULL, NULL),
(73, 'Recent Purchases Box- NOTE: box is disabled ', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Number of products to display in the recent purchases box', 3, 17, NULL, '2012-11-16 15:52:04', NULL, NULL),
(74, 'Customer Order History List Per Page', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Number of orders to display in the order history list in ''My Account''', 3, 18, NULL, '2012-11-16 15:52:04', NULL, NULL),
(75, 'Maximum Display of Customers on Customers Page', 'MAX_DISPLAY_SEARCH_RESULTS_CUSTOMER', '20', '', 3, 19, NULL, '2012-11-16 15:52:04', NULL, NULL),
(76, 'Maximum Display of Orders on Orders Page', 'MAX_DISPLAY_SEARCH_RESULTS_ORDERS', '20', '', 3, 20, NULL, '2012-11-16 15:52:04', NULL, NULL),
(77, 'Maximum Display of Products on Reports', 'MAX_DISPLAY_SEARCH_RESULTS_REPORTS', '20', '', 3, 21, NULL, '2012-11-16 15:52:04', NULL, NULL),
(78, 'Maximum Categories Products Display List', 'MAX_DISPLAY_RESULTS_CATEGORIES', '10', 'Number of products to list per screen', 3, 22, NULL, '2012-11-16 15:52:04', NULL, NULL),
(79, 'Products Listing- Number Per Page', 'MAX_DISPLAY_PRODUCTS_LISTING', '10', 'Maximum Number of Products to list per page on main page', 3, 30, NULL, '2012-11-16 15:52:04', NULL, NULL),
(80, 'Products Attributes - Option Names and Values Display', 'MAX_ROW_LISTS_OPTIONS', '10', 'Maximum number of option names and values to display in the products attributes page', 3, 24, NULL, '2012-11-16 15:52:04', NULL, NULL),
(81, 'Products Attributes - Attributes Controller Display', 'MAX_ROW_LISTS_ATTRIBUTES_CONTROLLER', '30', 'Maximum number of attributes to display in the Attributes Controller page', 3, 25, NULL, '2012-11-16 15:52:04', NULL, NULL),
(82, 'Products Attributes - Downloads Manager Display', 'MAX_DISPLAY_SEARCH_RESULTS_DOWNLOADS_MANAGER', '30', 'Maximum number of attributes downloads to display in the Downloads Manager page', 3, 26, NULL, '2012-11-16 15:52:04', NULL, NULL),
(83, 'Featured Products - Number to Display Admin', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED_ADMIN', '10', 'Number of featured products to list per screen - Admin', 3, 27, NULL, '2012-11-16 15:52:04', NULL, NULL),
(84, 'Maximum Display of Featured Products - Main Page', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED', '9', 'Number of featured products to list on main page', 3, 28, NULL, '2012-11-16 15:52:04', NULL, NULL),
(85, 'Maximum Display of Featured Products Page', 'MAX_DISPLAY_PRODUCTS_FEATURED_PRODUCTS', '10', 'Number of featured products to list per screen', 3, 29, NULL, '2012-11-16 15:52:04', NULL, NULL),
(86, 'Random Featured Products for SideBox', 'MAX_RANDOM_SELECT_FEATURED_PRODUCTS', '2', 'Number of random FEATURED products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 30, NULL, '2012-11-16 15:52:04', NULL, NULL),
(87, 'Maximum Display of Specials Products - Main Page', 'MAX_DISPLAY_SPECIAL_PRODUCTS_INDEX', '9', 'Number of special products to list on main page', 3, 31, NULL, '2012-11-16 15:52:04', NULL, NULL),
(88, 'New Product Listing - Limited to ...', 'SHOW_NEW_PRODUCTS_LIMIT', '0', 'Limit the New Product Listing to<br />0= All Products<br />1= Current Month<br />7= 7 Days<br />14= 14 Days<br />30= 30 Days<br />60= 60 Days<br />90= 90 Days<br />120= 120 Days', 3, 40, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''7'', ''14'', ''30'', ''60'', ''90'', ''120''), '),
(89, 'Maximum Display of Products All Page', 'MAX_DISPLAY_PRODUCTS_ALL', '10', 'Number of products to list per screen', 3, 45, NULL, '2012-11-16 15:52:04', NULL, NULL),
(90, 'Maximum Display of Language Flags in Language Side Box', 'MAX_LANGUAGE_FLAGS_COLUMNS', '3', 'Number of Language Flags per Row', 3, 50, NULL, '2012-11-16 15:52:04', NULL, NULL),
(91, 'Maximum File Upload Size', 'MAX_FILE_UPLOAD_SIZE', '2048000', 'What is the Maximum file size for uploads?<br />Default= 2048000', 3, 60, NULL, '2012-11-16 15:52:04', NULL, NULL),
(92, 'Allowed Filename Extensions for uploading', 'UPLOAD_FILENAME_EXTENSIONS', 'jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip', 'List the permissible filetypes (filename extensions) to be allowed when files are uploaded to your site by customers. Separate multiple values with commas(,). Do not include the dot(.).<br /><br />Suggested setting: "jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip"', 3, 61, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_textarea('),
(93, 'Maximum Orders Detail Display on Admin Orders Listing', 'MAX_DISPLAY_RESULTS_ORDERS_DETAILS_LISTING', '0', 'Maximum number of Order Details<br />0 = Unlimited', 3, 65, NULL, '2012-11-16 15:52:04', NULL, NULL),
(94, 'Maximum PayPal IPN Display on Admin Listing', 'MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN', '20', 'Maximum number of PayPal IPN Lisings in Admin<br />Default is 20', 3, 66, NULL, '2012-11-16 15:52:04', NULL, NULL),
(95, 'Maximum Display Columns Products to Multiple Categories Manager', 'MAX_DISPLAY_PRODUCTS_TO_CATEGORIES_COLUMNS', '3', 'Maximum Display Columns Products to Multiple Categories Manager<br />3 = Default', 3, 70, NULL, '2012-11-16 15:52:04', NULL, NULL),
(96, 'Maximum Display EZ-Pages', 'MAX_DISPLAY_SEARCH_RESULTS_EZPAGE', '20', 'Maximum Display EZ-Pages<br />20 = Default', 3, 71, NULL, '2012-11-16 15:52:04', NULL, NULL),
(97, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', 4, 1, NULL, '2012-11-16 15:52:04', NULL, NULL),
(98, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', 4, 2, NULL, '2012-11-16 15:52:04', NULL, NULL),
(99, 'Heading Image Width - Admin', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin', 4, 3, NULL, '2012-11-16 15:52:04', NULL, NULL),
(100, 'Heading Image Height - Admin', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin', 4, 4, NULL, '2012-11-16 15:52:04', NULL, NULL),
(101, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2012-11-16 15:52:04', NULL, NULL),
(102, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', 4, 6, NULL, '2012-11-16 15:52:04', NULL, NULL),
(103, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(104, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(105, 'Image - Shopping Cart Status', 'IMAGE_SHOPPING_CART_STATUS', '1', 'Show product image in the shopping cart?<br />0= off 1= on', 4, 9, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(106, 'Image - Shopping Cart Width', 'IMAGE_SHOPPING_CART_WIDTH', '50', 'Default = 50', 4, 10, NULL, '2012-11-16 15:52:04', NULL, NULL),
(107, 'Image - Shopping Cart Height', 'IMAGE_SHOPPING_CART_HEIGHT', '40', 'Default = 40', 4, 11, NULL, '2012-11-16 15:52:04', NULL, NULL),
(108, 'Category Icon Image Width - Product Info Pages', 'CATEGORY_ICON_IMAGE_WIDTH', '57', 'The pixel width of Category Icon heading images for Product Info Pages', 4, 13, NULL, '2012-11-16 15:52:04', NULL, NULL),
(109, 'Category Icon Image Height - Product Info Pages', 'CATEGORY_ICON_IMAGE_HEIGHT', '40', 'The pixel height of Category Icon heading images for Product Info Pages', 4, 14, NULL, '2012-11-16 15:52:04', NULL, NULL),
(110, 'Top Subcategory Image Width', 'SUBCATEGORY_IMAGE_TOP_WIDTH', '150', 'The pixel width of Top subcategory images<br />Top subcategory is when the Category contains subcategories', 4, 15, NULL, '2012-11-16 15:52:04', NULL, NULL),
(111, 'Top Subcategory Image Height', 'SUBCATEGORY_IMAGE_TOP_HEIGHT', '85', 'The pixel height of Top subcategory images<br />Top subcategory is when the Category contains subcategories', 4, 16, NULL, '2012-11-16 15:52:04', NULL, NULL),
(112, 'Product Info - Image Width', 'MEDIUM_IMAGE_WIDTH', '150', 'The pixel width of Product Info images', 4, 20, NULL, '2012-11-16 15:52:04', NULL, NULL),
(113, 'Product Info - Image Height', 'MEDIUM_IMAGE_HEIGHT', '120', 'The pixel height of Product Info images', 4, 21, NULL, '2012-11-16 15:52:04', NULL, NULL),
(114, 'Product Info - Image Medium Suffix', 'IMAGE_SUFFIX_MEDIUM', '_MED', 'Product Info Medium Image Suffix<br />Default = _MED', 4, 22, NULL, '2012-11-16 15:52:04', NULL, NULL),
(115, 'Product Info - Image Large Suffix', 'IMAGE_SUFFIX_LARGE', '_LRG', 'Product Info Large Image Suffix<br />Default = _LRG', 4, 23, NULL, '2012-11-16 15:52:04', NULL, NULL),
(116, 'Product Info - Number of Additional Images per Row', 'IMAGES_AUTO_ADDED', '3', 'Product Info - Enter the number of additional images to display per row<br />Default = 3', 4, 30, NULL, '2012-11-16 15:52:04', NULL, NULL),
(117, 'Image - Product Listing Width', 'IMAGE_PRODUCT_LISTING_WIDTH', '100', 'Default = 100', 4, 40, NULL, '2012-11-16 15:52:04', NULL, NULL),
(118, 'Image - Product Listing Height', 'IMAGE_PRODUCT_LISTING_HEIGHT', '80', 'Default = 80', 4, 41, NULL, '2012-11-16 15:52:04', NULL, NULL),
(119, 'Image - Product New Listing Width', 'IMAGE_PRODUCT_NEW_LISTING_WIDTH', '100', 'Default = 100', 4, 42, NULL, '2012-11-16 15:52:04', NULL, NULL),
(120, 'Image - Product New Listing Height', 'IMAGE_PRODUCT_NEW_LISTING_HEIGHT', '80', 'Default = 80', 4, 43, NULL, '2012-11-16 15:52:04', NULL, NULL),
(121, 'Image - New Products Width', 'IMAGE_PRODUCT_NEW_WIDTH', '100', 'Default = 100', 4, 44, NULL, '2012-11-16 15:52:04', NULL, NULL),
(122, 'Image - New Products Height', 'IMAGE_PRODUCT_NEW_HEIGHT', '80', 'Default = 80', 4, 45, NULL, '2012-11-16 15:52:04', NULL, NULL),
(123, 'Image - Featured Products Width', 'IMAGE_FEATURED_PRODUCTS_LISTING_WIDTH', '100', 'Default = 100', 4, 46, NULL, '2012-11-16 15:52:04', NULL, NULL),
(124, 'Image - Featured Products Height', 'IMAGE_FEATURED_PRODUCTS_LISTING_HEIGHT', '80', 'Default = 80', 4, 47, NULL, '2012-11-16 15:52:04', NULL, NULL),
(125, 'Image - Product All Listing Width', 'IMAGE_PRODUCT_ALL_LISTING_WIDTH', '100', 'Default = 100', 4, 48, NULL, '2012-11-16 15:52:04', NULL, NULL),
(126, 'Image - Product All Listing Height', 'IMAGE_PRODUCT_ALL_LISTING_HEIGHT', '80', 'Default = 80', 4, 49, NULL, '2012-11-16 15:52:04', NULL, NULL),
(127, 'Product Image - No Image Status', 'PRODUCTS_IMAGE_NO_IMAGE_STATUS', '1', 'Use automatic No Image when none is added to product<br />0= off<br />1= On', 4, 60, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(128, 'Product Image - No Image picture', 'PRODUCTS_IMAGE_NO_IMAGE', 'no_picture.gif', 'Use automatic No Image when none is added to product<br />Default = no_picture.gif', 4, 61, NULL, '2012-11-16 15:52:04', NULL, NULL),
(129, 'Image - Use Proportional Images on Products and Categories', 'PROPORTIONAL_IMAGES_STATUS', '1', 'Use Proportional Images on Products and Categories?<br /><br />NOTE: Do not use 0 height or width settings for Proportion Images<br />0= off 1= on', 4, 75, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(130, 'Email Salutation', 'ACCOUNT_GENDER', 'true', 'Display salutation choice during account creation and with account information', 5, 1, NULL, '2012-11-16 15:52:04', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(131, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth field during account creation and with account information<br />NOTE: Set Minimum Value Date of Birth to blank for not required<br />Set Minimum Value Date of Birth > 0 to require', 5, 2, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(132, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company field during account creation and with account information', 5, 3, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(133, 'Address Line 2', 'ACCOUNT_SUBURB', 'true', 'Display address line 2 field during account creation and with account information', 5, 4, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(134, 'State', 'ACCOUNT_STATE', 'true', 'Display state field during account creation and with account information', 5, 5, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(135, 'State - Always display as pulldown?', 'ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN', 'false', 'When state field is displayed, should it always be a pulldown menu?', 5, 5, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(136, 'Create Account Default Country ID', 'SHOW_CREATE_ACCOUNT_DEFAULT_COUNTRY', '223', 'Set Create Account Default Country ID to:<br />Default is 223', 5, 6, NULL, '2012-11-16 15:52:05', 'zen_get_country_name', 'zen_cfg_pull_down_country_list_none('),
(137, 'Fax Number', 'ACCOUNT_FAX_NUMBER', 'true', 'Display fax number field during account creation and with account information', 5, 10, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(138, 'Show Newsletter Checkbox', 'ACCOUNT_NEWSLETTER_STATUS', '1', 'Show Newsletter Checkbox<br />0= off<br />1= Display Unchecked<br />2= Display Checked<br /><strong>Note: Defaulting this to accepted may be in violation of certain regulations for your state or country</strong>', 5, 45, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(139, 'Customer Default Email Preference', 'ACCOUNT_EMAIL_PREFERENCE', '0', 'Set the Default Customer Default Email Preference<br />0= Text<br />1= HTML<br />', 5, 46, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(140, 'Customer Product Notification Status', 'CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS', '1', 'Customer should be asked about product notifications after checkout success and in account preferences<br />0= Never ask<br />1= Ask (ignored on checkout if has already selected global notifications)<br /><br />Note: Sidebox must be turned off separately', 5, 50, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(141, 'Customer Shop Status - View Shop and Prices', 'CUSTOMERS_APPROVAL', '0', 'Customer must be approved to shop<br />0= Not required<br />1= Must login to browse<br />2= May browse but no prices unless logged in<br />3= Showroom Only<br /><br />It is recommended that Option 2 be used for the purposes of Spiders if you wish customers to login to see prices.', 5, 55, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(142, 'Customer Approval Status - Authorization Pending', 'CUSTOMERS_APPROVAL_AUTHORIZATION', '0', 'Customer must be Authorized to shop<br />0= Not required<br />1= Must be Authorized to Browse<br />2= May browse but no prices unless Authorized<br />3= Customer May Browse and May see Prices but Must be Authorized to Buy<br /><br />It is recommended that Option 2 or 3 be used for the purposes of Spiders', 5, 65, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(143, 'Customer Authorization: filename', 'CUSTOMERS_AUTHORIZATION_FILENAME', 'customers_authorization', 'Customer Authorization filename<br />Note: Do not include the extension<br />Default=customers_authorization', 5, 66, NULL, '2012-11-16 15:52:05', NULL, ''),
(144, 'Customer Authorization: Hide Header', 'CUSTOMERS_AUTHORIZATION_HEADER_OFF', 'false', 'Customer Authorization: Hide Header <br />(true=hide false=show)', 5, 67, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(145, 'Customer Authorization: Hide Column Left', 'CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF', 'false', 'Customer Authorization: Hide Column Left <br />(true=hide false=show)', 5, 68, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(146, 'Customer Authorization: Hide Column Right', 'CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF', 'false', 'Customer Authorization: Hide Column Right <br />(true=hide false=show)', 5, 69, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(147, 'Customer Authorization: Hide Footer', 'CUSTOMERS_AUTHORIZATION_FOOTER_OFF', 'false', 'Customer Authorization: Hide Footer <br />(true=hide false=show)', 5, 70, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(148, 'Customer Authorization: Hide Prices', 'CUSTOMERS_AUTHORIZATION_PRICES_OFF', 'false', 'Customer Authorization: Hide Prices <br />(true=hide false=show)', 5, 71, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(149, 'Customers Referral Status', 'CUSTOMERS_REFERRAL_STATUS', '0', 'Customers Referral Code is created from<br />0= Off<br />1= 1st Discount Coupon Code used<br />2= Customer can add during create account or edit if blank<br /><br />NOTE: Once the Customers Referral Code has been set it can only be changed in the Admin Customer', 5, 80, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(150, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'freecharger.php;moneyorder.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: freecharger.php;cod.php;paypal.php)', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(151, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_shipping.php;ot_coupon.php;ot_group_pricing.php;ot_tax.php;ot_loworderfee.php;ot_gv.php;ot_cod_fee.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, '2012-11-19 14:27:37', '2012-11-16 15:52:05', NULL, NULL),
(152, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php;freeshipper.php;item.php;storepickup.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(153, 'Enable Free Shipping', 'MODULE_SHIPPING_FREESHIPPER_STATUS', 'True', 'Do you want to offer Free shipping?', 6, 0, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(154, 'Free Shipping Cost', 'MODULE_SHIPPING_FREESHIPPER_COST', '0.00', 'What is the Shipping cost?', 6, 6, NULL, '2012-11-16 15:52:05', NULL, NULL),
(155, 'Handling Fee', 'MODULE_SHIPPING_FREESHIPPER_HANDLING', '0', 'Handling fee for this shipping method.', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(156, 'Tax Class', 'MODULE_SHIPPING_FREESHIPPER_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2012-11-16 15:52:05', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(157, 'Shipping Zone', 'MODULE_SHIPPING_FREESHIPPER_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2012-11-16 15:52:05', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(158, 'Sort Order', 'MODULE_SHIPPING_FREESHIPPER_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(159, 'Enable Store Pickup Shipping', 'MODULE_SHIPPING_STOREPICKUP_STATUS', 'True', 'Do you want to offer In Store rate shipping?', 6, 0, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(160, 'Shipping Cost', 'MODULE_SHIPPING_STOREPICKUP_COST', '0.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(161, 'Tax Class', 'MODULE_SHIPPING_STOREPICKUP_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2012-11-16 15:52:05', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(162, 'Tax Basis', 'MODULE_SHIPPING_STOREPICKUP_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 6, 0, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing''), '),
(163, 'Shipping Zone', 'MODULE_SHIPPING_STOREPICKUP_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2012-11-16 15:52:05', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(164, 'Sort Order', 'MODULE_SHIPPING_STOREPICKUP_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(165, 'Enable Item Shipping', 'MODULE_SHIPPING_ITEM_STATUS', 'True', 'Do you want to offer per item rate shipping?', 6, 0, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(166, 'Shipping Cost', 'MODULE_SHIPPING_ITEM_COST', '2.50', 'The shipping cost will be multiplied by the number of items in an order that uses this shipping method.', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(167, 'Handling Fee', 'MODULE_SHIPPING_ITEM_HANDLING', '0', 'Handling fee for this shipping method.', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(168, 'Tax Class', 'MODULE_SHIPPING_ITEM_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2012-11-16 15:52:05', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(169, 'Tax Basis', 'MODULE_SHIPPING_ITEM_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 6, 0, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(170, 'Shipping Zone', 'MODULE_SHIPPING_ITEM_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2012-11-16 15:52:05', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(171, 'Sort Order', 'MODULE_SHIPPING_ITEM_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(172, 'Enable Free Charge Module', 'MODULE_PAYMENT_FREECHARGER_STATUS', 'True', 'Do you want to accept Free Charge payments?', 6, 1, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(173, 'Sort order of display.', 'MODULE_PAYMENT_FREECHARGER_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(174, 'Payment Zone', 'MODULE_PAYMENT_FREECHARGER_ZONE', '1', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2012-11-16 15:52:05', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(175, 'Set Order Status', 'MODULE_PAYMENT_FREECHARGER_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2012-11-16 15:52:05', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(176, 'Enable Check/Money Order Module', 'MODULE_PAYMENT_MONEYORDER_STATUS', 'True', 'Do you want to accept Check/Money Order payments?', 6, 1, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(177, 'Make Payable to:', 'MODULE_PAYMENT_MONEYORDER_PAYTO', 'the Store Owner/Website Name', 'Who should payments be made payable to?', 6, 1, NULL, '2012-11-16 15:52:05', NULL, NULL),
(178, 'Sort order of display.', 'MODULE_PAYMENT_MONEYORDER_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(179, 'Payment Zone', 'MODULE_PAYMENT_MONEYORDER_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2012-11-16 15:52:05', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(180, 'Set Order Status', 'MODULE_PAYMENT_MONEYORDER_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2012-11-16 15:52:05', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(181, 'Include Tax', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_TAX', 'false', 'Include Tax value in amount before discount calculation?', 6, 6, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(182, 'This module is installed', 'MODULE_ORDER_TOTAL_GROUP_PRICING_STATUS', 'true', '', 6, 1, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true''), '),
(183, 'Sort Order', 'MODULE_ORDER_TOTAL_GROUP_PRICING_SORT_ORDER', '290', 'Sort order of display.', 6, 2, NULL, '2012-11-16 15:52:05', NULL, NULL),
(184, 'Include Shipping', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_SHIPPING', 'false', 'Include Shipping value in amount before discount calculation?', 6, 5, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(185, 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_GROUP_PRICING_CALC_TAX', 'Standard', 'Re-Calculate Tax', 6, 7, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''), '),
(186, 'Tax Class', 'MODULE_ORDER_TOTAL_GROUP_PRICING_TAX_CLASS', '0', 'Use the following tax class when treating Group Discount as Credit Note.', 6, 0, NULL, '2012-11-16 15:52:05', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(187, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(188, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(189, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2012-11-16 15:52:05', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(190, 'Tax Basis', 'MODULE_SHIPPING_FLAT_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 6, 0, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(191, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2012-11-16 15:52:05', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(192, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(193, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(194, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(195, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(196, 'Admin configuration_key shows', 'ADMIN_CONFIGURATION_KEY_ON', '0', 'Manually switch to value of 1 to see the configuration_key name in configuration displays', 6, 0, NULL, '2012-11-16 15:52:05', NULL, NULL),
(197, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '44', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2012-11-16 15:52:05', 'zen_get_country_name', 'zen_cfg_pull_down_country_list('),
(198, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes. NOTE: For USA zip codes, only use your 5 digit zip code.', 7, 2, NULL, '2012-11-16 15:52:05', NULL, NULL),
(199, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2012-11-16 15:52:05', NULL, NULL),
(200, 'Package Tare Small to Medium - added percentage:weight', 'SHIPPING_BOX_WEIGHT', '0:3', 'What is the weight of typical packaging of small to medium packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0', 7, 4, NULL, '2012-11-16 15:52:05', NULL, NULL),
(201, 'Larger packages - added packaging percentage:weight', 'SHIPPING_BOX_PADDING', '10:0', 'What is the weight of typical packaging for Large packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0', 7, 5, NULL, '2012-11-16 15:52:05', NULL, NULL),
(202, 'Display Number of Boxes and Weight Status', 'SHIPPING_BOX_WEIGHT_DISPLAY', '3', 'Display Shipping Weight and Number of Boxes?<br /><br />0= off<br />1= Boxes Only<br />2= Weight Only<br />3= Both Boxes and Weight', 7, 15, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(203, 'Shipping Estimator Display Settings for Shopping Cart', 'SHOW_SHIPPING_ESTIMATOR_BUTTON', '1', '<br />0= Off<br />1= Display as Button on Shopping Cart<br />2= Display as Listing on Shopping Cart Page', 7, 20, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(204, 'Display Order Comments on Admin Invoice', 'ORDER_COMMENTS_INVOICE', '1', 'Do you want to display the Order Comments on the Admin Invoice?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order', 7, 25, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(205, 'Display Order Comments on Admin Packing Slip', 'ORDER_COMMENTS_PACKING_SLIP', '1', 'Do you want to display the Order Comments on the Admin Packing Slip?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order', 7, 26, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(206, 'Order Free Shipping 0 Weight Status', 'ORDER_WEIGHT_ZERO_STATUS', '0', 'If there is no weight to the order, does the order have Free Shipping?<br />0= no<br />1= yes<br /><br />Note: When using Free Shipping, Enable the Free Shipping Module this will only show when shipping is free.', 7, 15, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(207, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2012-11-16 15:52:05', NULL, NULL),
(208, 'Display Product Manufacturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2012-11-16 15:52:05', NULL, NULL),
(209, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2012-11-16 15:52:05', NULL, NULL),
(210, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2012-11-16 15:52:05', NULL, NULL),
(211, 'Display Product Price/Add to Cart', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price/Add to Cart', 8, 5, NULL, '2012-11-16 15:52:05', NULL, NULL),
(212, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2012-11-16 15:52:05', NULL, NULL),
(213, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2012-11-16 15:52:05', NULL, NULL),
(214, 'Display Product Price/Add to Cart Column Width', 'PRODUCTS_LIST_PRICE_WIDTH', '125', 'Define the width of the Price/Add to Cart column<br />Default= 125', 8, 8, NULL, '2012-11-16 15:52:05', NULL, NULL),
(215, 'Display Category/Manufacturer Filter (0=off; 1=on)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(216, 'Prev/Next Split Page Navigation (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '3', 'Sets the location of the Prev/Next Split Page Navigation', 8, 10, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(217, 'Display Product Listing Default Sort Order', 'PRODUCT_LISTING_DEFAULT_SORT_ORDER', '', 'Product Listing Default sort order?<br />NOTE: Leave Blank for Product Sort Order. Sort the Product Listing in the order you wish for the default display to start in to get the sort order setting. Example: 2a', 8, 15, NULL, '2012-11-16 15:52:05', NULL, NULL),
(218, 'Display Product Add to Cart Button (0=off; 1=on; 2=on with Qty Box per Product)', 'PRODUCT_LIST_PRICE_BUY_NOW', '1', 'Do you want to display the Add to Cart Button?<br /><br /><strong>NOTE:</strong> Turn OFF Display Multiple Products Qty Box Status to use Option 2 on with Qty Box per Product', 8, 20, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), ');
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(219, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 8, 25, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(220, 'Display Product Description', 'PRODUCT_LIST_DESCRIPTION', '150', 'Do you want to display the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 8, 30, NULL, '2012-11-16 15:52:05', NULL, NULL),
(221, 'Product Listing Ascending Sort Order', 'PRODUCT_LIST_SORT_ORDER_ASCENDING', '+', 'What do you want to use to indicate Sort Order Ascending?<br />Default = +', 8, 40, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_textarea_small('),
(222, 'Product Listing Descending Sort Order', 'PRODUCT_LIST_SORT_ORDER_DESCENDING', '-', 'What do you want to use to indicate Sort Order Descending?<br />Default = -', 8, 41, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_textarea_small('),
(223, 'Include Product Listing Alpha Sorter Dropdown', 'PRODUCT_LIST_ALPHA_SORTER', 'true', 'Do you want to include an Alpha Filter dropdown on the Product Listing?', 8, 50, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(224, 'Include Product Listing Sub Categories Image', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS', 'true', 'Do you want to include the Sub Categories Image on the Product Listing?', 8, 52, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(225, 'Include Product Listing Top Categories Image', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP', 'true', 'Do you want to include the Top Categories Image on the Product Listing?', 8, 53, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(226, 'Show SubCategories on Main Page while navigating', 'PRODUCT_LIST_CATEGORY_ROW_STATUS', '1', 'Show Sub-Categories on Main Page while navigating through Categories<br /><br />0= off<br />1= on', 8, 60, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(227, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(228, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(229, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(230, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2012-11-16 15:52:05', NULL, NULL),
(231, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2012-11-16 15:52:05', NULL, NULL),
(232, 'Products status in Catalog when out of stock should be set to', 'SHOW_PRODUCTS_SOLD_OUT', '0', 'Show Products when out of stock<br /><br />0= set product status to OFF<br />1= leave product status ON', 9, 10, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(233, 'Show Sold Out Image in place of Add to Cart', 'SHOW_PRODUCTS_SOLD_OUT_IMAGE', '1', 'Show Sold Out Image instead of Add to Cart Button<br /><br />0= off<br />1= on', 9, 11, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(234, 'Product Quantity Decimals', 'QUANTITY_DECIMALS', '0', 'Allow how many decimals on Quantity<br /><br />0= off', 9, 15, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(235, 'Show Shopping Cart - Delete Checkboxes or Delete Button', 'SHOW_SHOPPING_CART_DELETE', '3', 'Show on Shopping Cart Delete Button and/or Checkboxes<br /><br />1= Delete Button Only<br />2= Checkbox Only<br />3= Both Delete Button and Checkbox', 9, 20, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(236, 'Show Shopping Cart - Update Cart Button Location', 'SHOW_SHOPPING_CART_UPDATE', '3', 'Show on Shopping Cart Update Cart Button Location as:<br /><br />1= Next to each Qty Box<br />2= Below all Products<br />3= Both Next to each Qty Box and Below all Products', 9, 22, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(237, 'Show New Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS', '1', 'Show New Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 30, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(238, 'Show Featured Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS', '2', 'Show Featured Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 31, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(239, 'Show Special Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS', '3', 'Show Special Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 32, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(240, 'Show Upcoming Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_UPCOMING', '4', 'Show Upcoming Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 33, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(241, 'Show Notice of Combining Shopping Cart on Login', 'SHOW_SHOPPING_CART_COMBINED', '1', 'When a customer logs in and has a previously stored shopping cart, the products are combined with the existing shopping cart.<br /><br />Do you wish to display a Notice to the customer?<br /><br />0= OFF, do not display a notice<br />1= Yes show notice and go to shopping cart<br />2= Yes show notice, but do not go to shopping cart', 9, 35, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(242, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(243, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', 'C:/wamp/www/zencart/cache/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2012-11-16 15:52:05', NULL, NULL),
(244, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2012-11-16 15:52:05', NULL, NULL),
(245, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'false', 'Display the page parse time on the bottom of each page<br />You do not need to store the times to display them in the Catalog', 10, 4, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(246, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', 10, 5, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(247, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'PHP', 'Defines the method for sending mail.<br /><strong>PHP</strong> is the default, and uses built-in PHP wrappers for processing.<br />Servers running on Windows and MacOS should change this setting to <strong>SMTP</strong>.<br /><br /><strong>SMTPAUTH</strong> should only be used if your server requires SMTP authorization to send messages. You must also configure your SMTPAUTH settings in the appropriate fields in this admin section.<br /><br /><strong>sendmail</strong> is for linux/unix hosts using the sendmail program on the server<br /><strong>"sendmail-f"</strong> is only for servers which require the use of the -f parameter to send mail. This is a security setting often used to prevent spoofing. Will cause errors if your host mailserver is not configured to use it.<br /><br /><strong>Qmail</strong> is used for linux/unix hosts running Qmail as sendmail wrapper at /var/qmail/bin/sendmail.', 12, 1, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''PHP'', ''sendmail'', ''sendmail-f'', ''smtp'', ''smtpauth'', ''Qmail''),'),
(248, 'SMTP Email Account Mailbox', 'EMAIL_SMTPAUTH_MAILBOX', 'YourEmailAccountNameHere', 'Enter the mailbox account name (me@mydomain.com) supplied by your host. This is the account name that your host requires for SMTP authentication.<br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2012-11-16 15:52:05', NULL, NULL),
(249, 'SMTP Email Account Password', 'EMAIL_SMTPAUTH_PASSWORD', 'YourPasswordHere', 'Enter the password for your SMTP mailbox. <br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2012-11-16 15:52:05', 'zen_cfg_password_display', NULL),
(250, 'SMTP Email Mail Host', 'EMAIL_SMTPAUTH_MAIL_SERVER', 'mail.EnterYourDomain.com', 'Enter the DNS name of your SMTP mail server.<br />ie: mail.mydomain.com<br />or 55.66.77.88<br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2012-11-16 15:52:05', NULL, NULL),
(251, 'SMTP Email Mail Server Port', 'EMAIL_SMTPAUTH_MAIL_SERVER_PORT', '25', 'Enter the IP port number that your SMTP mailserver operates on.<br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2012-11-16 15:52:05', NULL, NULL),
(252, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''LF'', ''CRLF''),'),
(253, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(254, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 6, 6, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(255, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(256, 'Email Archiving Active?', 'EMAIL_ARCHIVE', 'false', 'If you wish to have email messages archived/stored when sent, set this to "true".', 12, 6, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(257, 'E-Mail Friendly-Errors', 'EMAIL_FRIENDLY_ERRORS', 'true', 'Do you want to display friendly errors if emails fail?  Setting this to false will display PHP errors and likely cause the script to fail. Only set to false while troubleshooting, and true for a live shop.', 12, 7, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(258, 'Email Address (Displayed to Contact you)', 'STORE_OWNER_EMAIL_ADDRESS', 'test@test.com', 'Email address of Store Owner.  Used as "display only" when informing customers of how to contact you.', 12, 10, NULL, '2012-11-16 15:52:05', NULL, NULL),
(259, 'Email Address (sent FROM)', 'EMAIL_FROM', 'test@test.com', 'Address from which email messages will be "sent" by default. Can be over-ridden at compose-time in admin modules.', 12, 11, NULL, '2012-11-16 15:52:05', NULL, NULL),
(260, 'Emails must send from known domain?', 'EMAIL_SEND_MUST_BE_STORE', 'Yes', 'Does your mailserver require that all outgoing emails have their "from" address match a known domain that exists on your webserver?<br /><br />This is often required in order to prevent spoofing and spam broadcasts.  If set to Yes, this will cause the email address (sent FROM) to be used as the "from" address on all outgoing mail.', 12, 11, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''No'', ''Yes''), '),
(261, 'Email Admin Format?', 'ADMIN_EXTRA_EMAIL_FORMAT', 'TEXT', 'Please select the Admin extra email format', 12, 12, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''TEXT'', ''HTML''), '),
(262, 'Send Copy of Order Confirmation Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', 'test@test.com', 'Send COPIES of order confirmation emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 12, NULL, '2012-11-16 15:52:05', NULL, NULL),
(263, 'Send Copy of Create Account Emails To - Status', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO_STATUS', '0', 'Send copy of Create Account Status<br />0= off 1= on', 12, 13, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(264, 'Send Copy of Create Account Emails To', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO', 'test@test.com', 'Send copy of Create Account emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 14, NULL, '2012-11-16 15:52:05', NULL, NULL),
(265, 'Send Copy of Customer GV Send Emails To - Status', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO_STATUS', '0', 'Send copy of Customer GV Send Status<br />0= off 1= on', 12, 17, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(266, 'Send Copy of Customer GV Send Emails To', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO', 'test@test.com', 'Send copy of Customer GV Send emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 18, NULL, '2012-11-16 15:52:05', NULL, NULL),
(267, 'Send Copy of Admin GV Mail Emails To - Status', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin GV Mail Status<br />0= off 1= on', 12, 19, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(268, 'Send Copy of Customer Admin GV Mail Emails To', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO', 'test@test.com', 'Send copy of Admin GV Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 20, NULL, '2012-11-16 15:52:05', NULL, NULL),
(269, 'Send Copy of Admin Discount Coupon Mail Emails To - Status', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin Discount Coupon Mail Status<br />0= off 1= on', 12, 21, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(270, 'Send Copy of Customer Admin Discount Coupon Mail Emails To', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO', 'test@test.com', 'Send copy of Admin Discount Coupon Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 22, NULL, '2012-11-16 15:52:05', NULL, NULL),
(271, 'Send Copy of Admin Orders Status Emails To - Status', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin Orders Status Status<br />0= off 1= on', 12, 23, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(272, 'Send Copy of Admin Orders Status Emails To', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO', 'test@test.com', 'Send copy of Admin Orders Status emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 24, NULL, '2012-11-16 15:52:05', NULL, NULL),
(273, 'Send Notice of Pending Reviews Emails To - Status', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO_STATUS', '0', 'Send copy of Pending Reviews Status<br />0= off 1= on', 12, 25, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(274, 'Send Notice of Pending Reviews Emails To', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO', 'test@test.com', 'Send copy of Pending Reviews emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 26, NULL, '2012-11-16 15:52:05', NULL, NULL),
(275, 'Set "Contact Us" Email Dropdown List', 'CONTACT_US_LIST', '', 'On the "Contact Us" Page, set the list of email addresses , in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 40, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_textarea('),
(276, 'Contact Us - Show Store Name and Address', 'CONTACT_US_STORE_NAME_ADDRESS', '1', 'Include Store Name and Address<br />0= off 1= on', 12, 50, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(277, 'Send Low Stock Emails', 'SEND_LOWSTOCK_EMAIL', '0', 'When stock level is at or below low stock level send an email<br />0= off<br />1= on', 12, 60, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(278, 'Send Low Stock Emails To', 'SEND_EXTRA_LOW_STOCK_EMAILS_TO', 'test@test.com', 'When stock level is at or below low stock level send an email to this address, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 61, NULL, '2012-11-16 15:52:05', NULL, NULL),
(279, 'Display "Newsletter Unsubscribe" Link?', 'SHOW_NEWSLETTER_UNSUBSCRIBE_LINK', 'true', 'Show "Newsletter Unsubscribe" link in the "Information" side-box?', 12, 70, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(280, 'Audience-Select Count Display', 'AUDIENCE_SELECT_DISPLAY_COUNTS', 'true', 'When displaying lists of available audiences/recipients, should the recipients-count be included? <br /><em>(This may make things slower if you have a lot of customers or complex audience queries)</em>', 12, 90, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(281, 'Enable Downloads', 'DOWNLOAD_ENABLED', 'true', 'Enable the products download functions.', 13, 1, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(282, 'Download by Redirect', 'DOWNLOAD_BY_REDIRECT', 'true', 'Use browser redirection for download. Disable on non-Unix systems.<br /><br />Note: Set /pub to 777 when redirect is true', 13, 2, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(283, 'Download by streaming', 'DOWNLOAD_IN_CHUNKS', 'false', 'If download-by-redirect is disabled, and your PHP memory_limit setting is under 8 MB, you might need to enable this setting so that files are streamed in smaller segments to the browser.<br /><br />Has no effect if Download By Redirect is enabled.', 13, 2, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(284, 'Download Expiration (Number of Days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2012-11-16 15:52:05', NULL, ''),
(285, 'Number of Downloads Allowed - Per Product', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2012-11-16 15:52:05', NULL, ''),
(286, 'Downloads Controller Update Status Value', 'DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE', '4', 'What orders_status resets the Download days and Max Downloads - Default is 4', 13, 10, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, NULL),
(287, 'Downloads Controller Order Status Value >= lower value', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS', '2', 'Downloads Controller Order Status Value - Default >= 2<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status greater than this value will be available for download. The orders status is set for an order by the Payment Modules. Set the lower range for this range.', 13, 12, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, NULL),
(288, 'Downloads Controller Order Status Value <= upper value', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS_END', '4', 'Downloads Controller Order Status Value - Default <= 4<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status less than this value will be available for download. The orders status is set for an order by the Payment Modules.  Set the upper range for this range.', 13, 13, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, NULL),
(289, 'Enable Price Factor', 'ATTRIBUTES_ENABLED_PRICE_FACTOR', 'true', 'Enable the Attributes Price Factor.', 13, 25, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(290, 'Enable Qty Price Discount', 'ATTRIBUTES_ENABLED_QTY_PRICES', 'true', 'Enable the Attributes Quantity Price Discounts.', 13, 26, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(291, 'Enable Attribute Images', 'ATTRIBUTES_ENABLED_IMAGES', 'true', 'Enable the Attributes Images.', 13, 28, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(292, 'Enable Text Pricing by word or letter', 'ATTRIBUTES_ENABLED_TEXT_PRICES', 'true', 'Enable the Attributes Text Pricing by word or letter.', 13, 35, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(293, 'Text Pricing - Spaces are Free', 'TEXT_SPACES_FREE', '1', 'On Text pricing Spaces are Free<br /><br />0= off 1= on', 13, 36, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(294, 'Read Only option type - Ignore for Add to Cart', 'PRODUCTS_OPTIONS_TYPE_READONLY_IGNORED', '1', 'When a Product only uses READONLY attributes, should the Add to Cart button be On or Off?<br />0= OFF<br />1= ON', 13, 37, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(295, 'Enable GZip Compression', 'GZIP_LEVEL', '0', '0= off 1= on', 14, 1, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(296, 'Session Directory', 'SESSION_WRITE_DIRECTORY', 'C:/wamp/www/zencart/cache', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2012-11-16 15:52:05', NULL, NULL),
(297, 'Cookie Domain', 'SESSION_USE_FQDN', 'True', 'If True the full domain name will be used to store the cookie, e.g. www.mydomain.com. If False only a partial domain name will be used, e.g. mydomain.com. If you are unsure about this, always leave set to true.', 15, 2, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(298, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(299, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(300, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(301, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(302, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'True', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(303, 'Recreate Session', 'SESSION_RECREATE', 'True', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(304, 'IP to Host Conversion Status', 'SESSION_IP_TO_HOST_ADDRESS', 'true', 'Convert IP Address to Host Address<br /><br />Note: on some servers this can slow down the initial start of a session or execution of Emails', 15, 10, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(305, 'Length of the redeem code', 'SECURITY_CODE_LENGTH', '10', 'Enter the length of the redeem code<br />The longer the more secure', 16, 1, NULL, '2012-11-16 15:52:05', NULL, NULL),
(306, 'Default Order Status For Zero Balance Orders', 'DEFAULT_ZERO_BALANCE_ORDERS_STATUS_ID', '2', 'When an order''s balance is zero, this order status will be assigned to it.', 16, 0, NULL, '2012-11-16 15:52:05', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(307, 'New Signup Discount Coupon ID#', 'NEW_SIGNUP_DISCOUNT_COUPON', '', 'Select the coupon<br />', 16, 75, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_coupon_id('),
(308, 'New Signup Gift Voucher Amount', 'NEW_SIGNUP_GIFT_VOUCHER_AMOUNT', '', 'Leave blank for none<br />Or enter an amount ie. 10 for $10.00', 16, 76, NULL, '2012-11-16 15:52:05', NULL, NULL),
(309, 'Maximum Discount Coupons Per Page', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS', '20', 'Number of Discount Coupons to list per Page', 16, 81, NULL, '2012-11-16 15:52:05', NULL, NULL),
(310, 'Maximum Discount Coupon Report Results Per Page', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS_REPORTS', '20', 'Number of Discount Coupons to list on Reports Page', 16, 81, NULL, '2012-11-16 15:52:05', NULL, NULL),
(311, 'Credit Card Enable Status - VISA', 'CC_ENABLED_VISA', '1', 'Accept VISA 0= off 1= on', 17, 1, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(312, 'Credit Card Enable Status - MasterCard', 'CC_ENABLED_MC', '1', 'Accept MasterCard 0= off 1= on', 17, 2, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(313, 'Credit Card Enable Status - AmericanExpress', 'CC_ENABLED_AMEX', '0', 'Accept AmericanExpress 0= off 1= on', 17, 3, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(314, 'Credit Card Enable Status - Diners Club', 'CC_ENABLED_DINERS_CLUB', '0', 'Accept Diners Club 0= off 1= on', 17, 4, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(315, 'Credit Card Enable Status - Discover Card', 'CC_ENABLED_DISCOVER', '0', 'Accept Discover Card 0= off 1= on', 17, 5, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(316, 'Credit Card Enable Status - JCB', 'CC_ENABLED_JCB', '0', 'Accept JCB 0= off 1= on', 17, 6, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(317, 'Credit Card Enable Status - AUSTRALIAN BANKCARD', 'CC_ENABLED_AUSTRALIAN_BANKCARD', '0', 'Accept AUSTRALIAN BANKCARD 0= off 1= on', 17, 7, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(318, 'Credit Card Enable Status - SOLO', 'CC_ENABLED_SOLO', '0', 'Accept SOLO Card 0= off 1= on', 17, 8, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(319, 'Credit Card Enable Status - Switch', 'CC_ENABLED_SWITCH', '0', 'Accept SWITCH Card 0= off 1= on', 17, 9, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(320, 'Credit Card Enable Status - Maestro', 'CC_ENABLED_MAESTRO', '0', 'Accept MAESTRO Card 0= off 1= on', 17, 10, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(321, 'Credit Card Enabled - Show on Payment', 'SHOW_ACCEPTED_CREDIT_CARDS', '0', 'Show accepted credit cards on Payment page?<br />0= off<br />1= As Text<br />2= As Images<br /><br />Note: images and text must be defined in both the database and language file for specific credit card types.', 17, 50, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(322, 'This module is installed', 'MODULE_ORDER_TOTAL_GV_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true''),'),
(323, 'Sort Order', 'MODULE_ORDER_TOTAL_GV_SORT_ORDER', '840', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:40', NULL, NULL),
(324, 'Queue Purchases', 'MODULE_ORDER_TOTAL_GV_QUEUE', 'true', 'Do you want to queue purchases of the Gift Voucher?', 6, 3, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(325, 'Include Shipping', 'MODULE_ORDER_TOTAL_GV_INC_SHIPPING', 'true', 'Include Shipping in calculation', 6, 5, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(326, 'Include Tax', 'MODULE_ORDER_TOTAL_GV_INC_TAX', 'true', 'Include Tax in calculation.', 6, 6, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(327, 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_GV_CALC_TAX', 'None', 'Re-Calculate Tax', 6, 7, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''),'),
(328, 'Tax Class', 'MODULE_ORDER_TOTAL_GV_TAX_CLASS', '0', 'Use the following tax class when treating Gift Voucher as Credit Note.', 6, 0, NULL, '2003-10-30 22:16:40', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(329, 'Credit including Tax', 'MODULE_ORDER_TOTAL_GV_CREDIT_TAX', 'false', 'Add tax to purchased Gift Voucher when crediting to Account', 6, 8, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(330, 'Set Order Status', 'MODULE_ORDER_TOTAL_GV_ORDER_STATUS_ID', '0', 'Set the status of orders made where GV covers full payment', 6, 0, NULL, '2012-11-16 15:52:05', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(331, 'This module is installed', 'MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''true''),'),
(332, 'Sort Order', 'MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER', '400', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:43', NULL, NULL),
(333, 'Allow Low Order Fee', 'MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE', 'false', 'Do you want to allow low order fees?', 6, 3, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(334, 'Order Fee For Orders Under', 'MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER', '50', 'Add the low order fee to orders under this amount.', 6, 4, NULL, '2003-10-30 22:16:43', 'currencies->format', NULL),
(335, 'Order Fee', 'MODULE_ORDER_TOTAL_LOWORDERFEE_FEE', '5', 'For Percentage Calculation - include a % Example: 10%<br />For a flat amount just enter the amount - Example: 5 for $5.00', 6, 5, NULL, '2003-10-30 22:16:43', '', NULL),
(336, 'Attach Low Order Fee On Orders Made', 'MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION', 'both', 'Attach low order fee for orders sent to the set destination.', 6, 6, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''national'', ''international'', ''both''),'),
(337, 'Tax Class', 'MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS', '0', 'Use the following tax class on the low order fee.', 6, 7, NULL, '2003-10-30 22:16:43', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(338, 'No Low Order Fee on Virtual Products', 'MODULE_ORDER_TOTAL_LOWORDERFEE_VIRTUAL', 'false', 'Do not charge Low Order Fee when cart is Virtual Products Only', 6, 8, NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(339, 'No Low Order Fee on Gift Vouchers', 'MODULE_ORDER_TOTAL_LOWORDERFEE_GV', 'false', 'Do not charge Low Order Fee when cart is Gift Vouchers Only', 6, 9, NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(340, 'This module is installed', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''true''),'),
(341, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '200', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:46', NULL, NULL),
(342, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(343, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2003-10-30 22:16:46', 'currencies->format', NULL),
(344, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''national'', ''international'', ''both''),'),
(345, 'This module is installed', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:49', NULL, 'zen_cfg_select_option(array(''true''),'),
(346, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '100', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:49', NULL, NULL),
(347, 'This module is installed', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:52', NULL, 'zen_cfg_select_option(array(''true''),'),
(348, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '300', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:52', NULL, NULL),
(349, 'This module is installed', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:55', NULL, 'zen_cfg_select_option(array(''true''),'),
(350, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '999', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:55', NULL, NULL),
(351, 'Tax Class', 'MODULE_ORDER_TOTAL_COUPON_TAX_CLASS', '0', 'Use the following tax class when treating Discount Coupon as Credit Note.', 6, 0, NULL, '2003-10-30 22:16:36', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(352, 'Include Tax', 'MODULE_ORDER_TOTAL_COUPON_INC_TAX', 'false', 'Include Tax in calculation.', 6, 6, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(353, 'Sort Order', 'MODULE_ORDER_TOTAL_COUPON_SORT_ORDER', '280', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:36', NULL, NULL),
(354, 'Include Shipping', 'MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING', 'false', 'Include Shipping in calculation', 6, 5, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(355, 'This module is installed', 'MODULE_ORDER_TOTAL_COUPON_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true''),'),
(356, 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_COUPON_CALC_TAX', 'Standard', 'Re-Calculate Tax', 6, 7, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''),'),
(357, 'Admin Demo Status', 'ADMIN_DEMO', '0', 'Admin Demo should be on?<br />0= off 1= on', 6, 0, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(358, 'Product option type Select', 'PRODUCTS_OPTIONS_TYPE_SELECT', '0', 'The number representing the Select type of product option.', 0, NULL, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, NULL),
(359, 'Text product option type', 'PRODUCTS_OPTIONS_TYPE_TEXT', '1', 'Numeric value of the text product option type', 6, NULL, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, NULL),
(360, 'Radio button product option type', 'PRODUCTS_OPTIONS_TYPE_RADIO', '2', 'Numeric value of the radio button product option type', 6, NULL, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, NULL),
(361, 'Check box product option type', 'PRODUCTS_OPTIONS_TYPE_CHECKBOX', '3', 'Numeric value of the check box product option type', 6, NULL, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, NULL),
(362, 'File product option type', 'PRODUCTS_OPTIONS_TYPE_FILE', '4', 'Numeric value of the file product option type', 6, NULL, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, NULL),
(363, 'ID for text and file products options values', 'PRODUCTS_OPTIONS_VALUES_TEXT_ID', '0', 'Numeric value of the products_options_values_id used by the text and file attributes.', 6, NULL, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, NULL),
(364, 'Upload prefix', 'UPLOAD_PREFIX', 'upload_', 'Prefix used to differentiate between upload options and other options', 0, NULL, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, NULL),
(365, 'Text prefix', 'TEXT_PREFIX', 'txt_', 'Prefix used to differentiate between text option values and other option values', 0, NULL, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, NULL),
(366, 'Read Only option type', 'PRODUCTS_OPTIONS_TYPE_READONLY', '5', 'Numeric value of the file product option type', 6, NULL, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, NULL),
(367, 'login mode https', 'SSLPWSTATUSCHECK', '', 'System setting. Do not edit.', 6, 99, NULL, '2012-11-16 15:52:05', NULL, NULL),
(368, 'Products Info - Products Option Name Sort Order', 'PRODUCTS_OPTIONS_SORT_ORDER', '0', 'Sort order of Option Names for Products Info<br />0= Sort Order, Option Name<br />1= Option Name', 18, 35, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(369, 'Products Info - Product Option Value of Attributes Sort Order', 'PRODUCTS_OPTIONS_SORT_BY_PRICE', '1', 'Sort order of Product Option Values of Attributes for Products Info<br />0= Sort Order, Price<br />1= Sort Order, Option Value Name', 18, 36, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(370, 'Product Info - Show Option Values Name Below Attributes Image', 'PRODUCT_IMAGES_ATTRIBUTES_NAMES', '1', 'Product Info - Show the name of the Option Value beneath the Attribute Image?<br />0= off 1= on', 18, 41, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(371, 'Product Info - Show Sales Discount Savings Status', 'SHOW_SALE_DISCOUNT_STATUS', '1', 'Product Info - Show the amount of discount savings?<br />0= off 1= on', 18, 45, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(372, 'Product Info - Show Sales Discount Savings Dollars or Percentage', 'SHOW_SALE_DISCOUNT', '1', 'Product Info - Show the amount of discount savings display as:<br />1= % off 2= $amount off', 18, 46, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''1'', ''2''), '),
(373, 'Product Info - Show Sales Discount Savings Percentage Decimals', 'SHOW_SALE_DISCOUNT_DECIMALS', '0', 'Product Info - Show discount savings display as a Percentage with how many decimals?:<br />Default= 0', 18, 47, NULL, '2012-11-16 15:52:05', NULL, NULL),
(374, 'Product Info - Price is Free Image or Text Status', 'OTHER_IMAGE_PRICE_IS_FREE_ON', '1', 'Product Info - Show the Price is Free Image or Text on Displayed Price<br />0= Text<br />1= Image', 18, 50, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(375, 'Product Info - Price is Call for Price Image or Text Status', 'PRODUCTS_PRICE_IS_CALL_IMAGE_ON', '1', 'Product Info - Show the Price is Call for Price Image or Text on Displayed Price<br />0= Text<br />1= Image', 18, 51, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(376, 'Product Quantity Box Status - Adding New Products', 'PRODUCTS_QTY_BOX_STATUS', '1', 'What should the Default Quantity Box Status be set to when adding New Products?<br /><br />0= off<br />1= on<br />NOTE: This will show a Qty Box when ON and default the Add to Cart to 1', 18, 55, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(377, 'Product Reviews Require Approval', 'REVIEWS_APPROVAL', '1', 'Do product reviews require approval?<br /><br />Note: When Review Status is off, it will also not show<br /><br />0= off 1= on', 18, 62, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(378, 'Meta Tags - Include Product Model in Title', 'META_TAG_INCLUDE_MODEL', '1', 'Do you want to include the Product Model in the Meta Tag Title?<br /><br />0= off 1= on', 18, 69, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(379, 'Meta Tags - Include Product Price in Title', 'META_TAG_INCLUDE_PRICE', '1', 'Do you want to include the Product Price in the Meta Tag Title?<br /><br />0= off 1= on', 18, 70, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(380, 'Meta Tags Generated Description Maximum Length?', 'MAX_META_TAG_DESCRIPTION_LENGTH', '50', 'Set Generated Meta Tag Description Maximum Length to (words) Default 50:', 18, 71, NULL, '2012-11-16 15:52:05', '', ''),
(381, 'Also Purchased Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS', '3', 'Also Purchased Products Columns per Row<br />0= off or set the sort order', 18, 72, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(382, 'Previous Next - Navigation Bar Position', 'PRODUCT_INFO_PREVIOUS_NEXT', '1', 'Location of Previous/Next Navigation Bar<br />0= off<br />1= Top of Page<br />2= Bottom of Page<br />3= Both Top and Bottom of Page', 18, 21, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Off''), array(''id''=>''1'', ''text''=>''Top of Page''), array(''id''=>''2'', ''text''=>''Bottom of Page''), array(''id''=>''3'', ''text''=>''Both Top & Bottom of Page'')),'),
(383, 'Previous Next - Sort Order', 'PRODUCT_INFO_PREVIOUS_NEXT_SORT', '1', 'Products Display Order by<br />0= Product ID<br />1= Product Name<br />2= Model<br />3= Price, Product Name<br />4= Price, Model<br />5= Product Name, Model<br />6= Product Sort Order', 18, 22, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Product ID''), array(''id''=>''1'', ''text''=>''Name''), array(''id''=>''2'', ''text''=>''Product Model''), array(''id''=>''3'', ''text''=>''Product Price - Name''), array(''id''=>''4'', ''text''=>''Product Price - Model''), array(''id''=>''5'', ''text''=>''Product Name - Model''), array(''id''=>''6'', ''text''=>''Product Sort Order'')),'),
(384, 'Previous Next - Button and Image Status', 'SHOW_PREVIOUS_NEXT_STATUS', '0', 'Button and Product Image status settings are:<br />0= Off<br />1= On', 18, 20, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Off''), array(''id''=>''1'', ''text''=>''On'')),'),
(385, 'Previous Next - Button and Image Settings', 'SHOW_PREVIOUS_NEXT_IMAGES', '0', 'Show Previous/Next Button and Product Image Settings<br />0= Button Only<br />1= Button and Product Image<br />2= Product Image Only', 18, 21, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Button Only''), array(''id''=>''1'', ''text''=>''Button and Product Image''), array(''id''=>''2'', ''text''=>''Product Image Only'')),'),
(386, 'Previous Next - Image Width?', 'PREVIOUS_NEXT_IMAGE_WIDTH', '50', 'Previous/Next Image Width?', 18, 22, NULL, '2012-11-16 15:52:05', '', ''),
(387, 'Previous Next - Image Height?', 'PREVIOUS_NEXT_IMAGE_HEIGHT', '40', 'Previous/Next Image Height?', 18, 23, NULL, '2012-11-16 15:52:05', '', ''),
(388, 'Previous Next - Navigation Includes Category Position', 'PRODUCT_INFO_CATEGORIES', '1', 'Product''s Category Image and Name Alignment Above Previous/Next Navigation Bar<br />0= off<br />1= Align Left<br />2= Align Center<br />3= Align Right', 18, 20, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Off''), array(''id''=>''1'', ''text''=>''Align Left''), array(''id''=>''2'', ''text''=>''Align Center''), array(''id''=>''3'', ''text''=>''Align Right'')),'),
(389, 'Previous Next - Navigation Includes Category Name and Image Status', 'PRODUCT_INFO_CATEGORIES_IMAGE_STATUS', '2', 'Product''s Category Image and Name Status<br />0= Category Name and Image always shows<br />1= Category Name only<br />2= Category Name and Image when not blank', 18, 20, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Category Name and Image Always''), array(''id''=>''1'', ''text''=>''Category Name only''), array(''id''=>''2'', ''text''=>''Category Name and Image when not blank'')),'),
(390, 'Column Width - Left Boxes', 'BOX_WIDTH_LEFT', '150px', 'Width of the Left Column Boxes<br />px may be included<br />Default = 150px', 19, 1, NULL, '2003-11-21 22:16:36', NULL, NULL),
(391, 'Column Width - Right Boxes', 'BOX_WIDTH_RIGHT', '150px', 'Width of the Right Column Boxes<br />px may be included<br />Default = 150px', 19, 2, NULL, '2003-11-21 22:16:36', NULL, NULL),
(392, 'Bread Crumbs Navigation Separator', 'BREAD_CRUMBS_SEPARATOR', '&nbsp;::&nbsp;', 'Enter the separator symbol to appear between the Navigation Bread Crumb trail<br />Note: Include spaces with the &amp;nbsp; symbol if you want them part of the separator.<br />Default = &amp;nbsp;::&amp;nbsp;', 19, 3, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(393, 'Define Breadcrumb Status', 'DEFINE_BREADCRUMB_STATUS', '1', 'Enable the Breadcrumb Trail Links?<br />0= OFF<br />1= ON<br />2= Off for Home Page Only', 19, 4, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(394, 'Bestsellers - Number Padding', 'BEST_SELLERS_FILLER', '&nbsp;', 'What do you want to Pad the numbers with?<br />Default = &amp;nbsp;', 19, 5, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(395, 'Bestsellers - Truncate Product Names', 'BEST_SELLERS_TRUNCATE', '35', 'What size do you want to truncate the Product Names?<br />Default = 35', 19, 6, NULL, '2003-11-21 22:16:36', NULL, NULL),
(396, 'Bestsellers - Truncate Product Names followed by ...', 'BEST_SELLERS_TRUNCATE_MORE', 'true', 'When truncated Product Names follow with ...<br />Default = true', 19, 7, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(397, 'Categories Box - Show Specials Link', 'SHOW_CATEGORIES_BOX_SPECIALS', 'true', 'Show Specials Link in the Categories Box', 19, 8, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(398, 'Categories Box - Show Products New Link', 'SHOW_CATEGORIES_BOX_PRODUCTS_NEW', 'true', 'Show Products New Link in the Categories Box', 19, 9, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(399, 'Shopping Cart Box Status', 'SHOW_SHOPPING_CART_BOX_STATUS', '1', 'Shopping Cart Shows<br />0= Always<br />1= Only when full<br />2= Only when full but not when viewing the Shopping Cart', 19, 10, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(400, 'Categories Box - Show Featured Products Link', 'SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS', 'true', 'Show Featured Products Link in the Categories Box', 19, 11, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(401, 'Categories Box - Show Products All Link', 'SHOW_CATEGORIES_BOX_PRODUCTS_ALL', 'true', 'Show Products All Link in the Categories Box', 19, 12, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(402, 'Column Left Status - Global', 'COLUMN_LEFT_STATUS', '1', 'Show Column Left, unless page override exists?<br />0= Column Left is always off<br />1= Column Left is on, unless page override', 19, 15, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(403, 'Column Right Status - Global', 'COLUMN_RIGHT_STATUS', '1', 'Show Column Right, unless page override exists?<br />0= Column Right is always off<br />1= Column Right is on, unless page override', 19, 16, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(404, 'Column Width - Left', 'COLUMN_WIDTH_LEFT', '150px', 'Width of the Left Column<br />px may be included<br />Default = 150px', 19, 20, NULL, '2003-11-21 22:16:36', NULL, NULL),
(405, 'Column Width - Right', 'COLUMN_WIDTH_RIGHT', '150px', 'Width of the Right Column<br />px may be included<br />Default = 150px', 19, 21, NULL, '2003-11-21 22:16:36', NULL, NULL),
(406, 'Categories Separator between links Status', 'SHOW_CATEGORIES_SEPARATOR_LINK', '1', 'Show Category Separator between Category Names and Links?<br />0= off<br />1= on', 19, 24, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(407, 'Categories Separator between the Category Name and Count', 'CATEGORIES_SEPARATOR', '-&gt;', 'What separator do you want between the Category name and the count?<br />Default = -&amp;gt;', 19, 25, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(408, 'Categories Separator between the Category Name and Sub Categories', 'CATEGORIES_SEPARATOR_SUBS', '|_&nbsp;', 'What separator do you want between the Category name and Sub Category Name?<br />Default = |_&amp;nbsp;', 19, 26, NULL, '2004-03-25 22:16:36', NULL, 'zen_cfg_textarea_small('),
(409, 'Categories Count Prefix', 'CATEGORIES_COUNT_PREFIX', '&nbsp;(', 'What do you want to Prefix the count with?<br />Default= (', 19, 27, NULL, '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(410, 'Categories Count Suffix', 'CATEGORIES_COUNT_SUFFIX', ')', 'What do you want as a Suffix to the count?<br />Default= )', 19, 28, NULL, '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(411, 'Categories SubCategories Indent', 'CATEGORIES_SUBCATEGORIES_INDENT', '&nbsp;&nbsp;', 'What do you want to use as the subcategories indent?<br />Default= &nbsp;&nbsp;', 19, 29, NULL, '2004-06-24 22:16:36', NULL, 'zen_cfg_textarea_small('),
(412, 'Categories with 0 Products Status', 'CATEGORIES_COUNT_ZERO', '0', 'Show Category Count for 0 Products?<br />0= off<br />1= on', 19, 30, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), ');
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(413, 'Split Categories Box', 'CATEGORIES_SPLIT_DISPLAY', 'True', 'Split the categories box display by product type', 19, 31, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(414, 'Shopping Cart - Show Totals', 'SHOW_TOTALS_IN_CART', '1', 'Show Totals Above Shopping Cart?<br />0= off<br />1= on: Items Weight Amount<br />2= on: Items Weight Amount, but no weight when 0<br />3= on: Items Amount', 19, 31, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(415, 'Customer Greeting - Show on Index Page', 'SHOW_CUSTOMER_GREETING', '1', 'Always Show Customer Greeting on Index?<br />0= off<br />1= on', 19, 40, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(416, 'Categories - Always Show on Main Page', 'SHOW_CATEGORIES_ALWAYS', '0', 'Always Show Categories on Main Page<br />0= off<br />1= on<br />Default category can be set to Top Level or a Specific Top Level', 19, 45, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(417, 'Main Page - Opens with Category', 'CATEGORIES_START_MAIN', '0', '0= Top Level Categories<br />Or enter the Category ID#<br />Note: Sub Categories can also be used Example: 3_10', 19, 46, NULL, '2012-11-16 15:52:05', '', ''),
(418, 'Categories - Always Open to Show SubCategories', 'SHOW_CATEGORIES_SUBCATEGORIES_ALWAYS', '1', 'Always Show Categories and SubCategories<br />0= off, just show Top Categories<br />1= on, Always show Categories and SubCategories when selected', 19, 47, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(419, 'Banner Display Groups - Header Position 1', 'SHOW_BANNERS_GROUP_SET1', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 1?<br />Leave blank for none', 19, 55, NULL, '2012-11-16 15:52:05', '', ''),
(420, 'Banner Display Groups - Header Position 2', 'SHOW_BANNERS_GROUP_SET2', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 2?<br />Leave blank for none', 19, 56, NULL, '2012-11-16 15:52:05', '', ''),
(421, 'Banner Display Groups - Header Position 3', 'SHOW_BANNERS_GROUP_SET3', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 3?<br />Leave blank for none', 19, 57, NULL, '2012-11-16 15:52:05', '', ''),
(422, 'Banner Display Groups - Footer Position 1', 'SHOW_BANNERS_GROUP_SET4', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 1?<br />Leave blank for none', 19, 65, NULL, '2012-11-16 15:52:05', '', ''),
(423, 'Banner Display Groups - Footer Position 2', 'SHOW_BANNERS_GROUP_SET5', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 2?<br />Leave blank for none', 19, 66, NULL, '2012-11-16 15:52:05', '', ''),
(424, 'Banner Display Groups - Footer Position 3', 'SHOW_BANNERS_GROUP_SET6', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />Default Group is Wide-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 3?<br />Leave blank for none', 19, 67, '2012-11-19 14:45:20', '2012-11-16 15:52:05', '', ''),
(425, 'Banner Display Groups - Side Box banner_box', 'SHOW_BANNERS_GROUP_SET7', 'SideBox-Banners', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box?<br />Leave blank for none', 19, 70, NULL, '2012-11-16 15:52:05', '', ''),
(426, 'Banner Display Groups - Side Box banner_box2', 'SHOW_BANNERS_GROUP_SET8', 'SideBox-Banners', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box2?<br />Leave blank for none', 19, 71, NULL, '2012-11-16 15:52:05', '', ''),
(427, 'Banner Display Group - Side Box banner_box_all', 'SHOW_BANNERS_GROUP_SET_ALL', 'BannersAll', 'The Banner Display Group may only be from one (1) Banner Group for the Banner All sidebox<br /><br />Default Group is BannersAll<br /><br />What Banner Group do you want to use in the Side Box - banner_box_all?<br />Leave blank for none', 19, 72, NULL, '2012-11-16 15:52:05', '', ''),
(428, 'Footer - Show IP Address status', 'SHOW_FOOTER_IP', '1', 'Show Customer IP Address in the Footer<br />0= off<br />1= on<br />Should the Customer IP Address show in the footer?', 19, 80, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(429, 'Product Discount Quantities - Add how many blank discounts?', 'DISCOUNT_QTY_ADD', '5', 'How many blank discount quantities should be added for Product Pricing?', 19, 90, NULL, '2012-11-16 15:52:05', '', ''),
(430, 'Product Discount Quantities - Display how many per row?', 'DISCOUNT_QUANTITY_PRICES_COLUMN', '5', 'How many discount quantities should show per row on Product Info Pages?', 19, 95, NULL, '2012-11-16 15:52:05', '', ''),
(431, 'Categories/Products Display Sort Order', 'CATEGORIES_PRODUCTS_SORT_ORDER', '0', 'Categories/Products Display Sort Order<br />0= Categories/Products Sort Order/Name<br />1= Categories/Products Name<br />2= Products Model<br />3= Products Qty+, Products Name<br />4= Products Qty-, Products Name<br />5= Products Price+, Products Name<br />6= Products Price-, Products Name', 19, 100, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4'', ''5'', ''6''), '),
(432, 'Option Names and Values Global Add, Copy and Delete Features Status', 'OPTION_NAMES_VALUES_GLOBAL_STATUS', '1', 'Option Names and Values Global Add, Copy and Delete Features Status<br />0= Hide Features<br />1= Show Features<br />(Default=1)', 19, 110, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(433, 'Categories-Tabs Menu ON/OFF', 'CATEGORIES_TABS_STATUS', '1', 'Categories-Tabs<br />This enables the display of your store''s categories as a menu across the top of your header. There are many potential creative uses for this.<br />0= Hide Categories Tabs<br />1= Show Categories Tabs', 19, 112, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(434, 'Site Map - include My Account Links?', 'SHOW_ACCOUNT_LINKS_ON_SITE_MAP', 'No', 'Should the links to My Account show up on the site-map?<br />Note: Spiders will try to index this page, and likely should not be sent to secure pages, since there is no benefit in indexing a login page.<br /><br />Default: false', 19, 115, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''Yes'', ''No''), '),
(435, 'Skip 1-prod Categories', 'SKIP_SINGLE_PRODUCT_CATEGORIES', 'True', 'Skip single-product categories<br />If this option is set to True, then if the customer clicks on a link to a category which only contains a single item, then Zen Cart will take them directly to that product-page, rather than present them with another link to click in order to see the product.<br />Default: True', 19, 120, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(436, 'Use split-login page', 'USE_SPLIT_LOGIN_MODE', 'False', 'The login page can be displayed in two modes: Split or Vertical.<br />In Split mode, the create-account options are accessed by clicking a button to get to the create-account page.  In Vertical mode, the create-account input fields are all displayed inline, below the login field, making one less click for the customer to create their account.<br />Default: False', 19, 121, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(437, 'CSS Buttons', 'IMAGE_USE_CSS_BUTTONS', 'Yes', 'CSS Buttons<br />Use CSS buttons instead of images (GIF/JPG)?<br />Button styles must be configured in the stylesheet if you enable this option.', 19, 147, '2012-11-19 16:06:20', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''No'', ''Yes''), '),
(438, '<strong>Down for Maintenance: ON/OFF</strong>', 'DOWN_FOR_MAINTENANCE', 'false', 'Down for Maintenance <br />(true=on false=off)', 20, 1, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(439, 'Down for Maintenance: filename', 'DOWN_FOR_MAINTENANCE_FILENAME', 'down_for_maintenance', 'Down for Maintenance filename<br />Note: Do not include the extension<br />Default=down_for_maintenance', 20, 2, NULL, '2012-11-16 15:52:05', NULL, ''),
(440, 'Down for Maintenance: Hide Header', 'DOWN_FOR_MAINTENANCE_HEADER_OFF', 'false', 'Down for Maintenance: Hide Header <br />(true=hide false=show)', 20, 3, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(441, 'Down for Maintenance: Hide Column Left', 'DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF', 'false', 'Down for Maintenance: Hide Column Left <br />(true=hide false=show)', 20, 4, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(442, 'Down for Maintenance: Hide Column Right', 'DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF', 'false', 'Down for Maintenance: Hide Column Right <br />(true=hide false=show)', 20, 5, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(443, 'Down for Maintenance: Hide Footer', 'DOWN_FOR_MAINTENANCE_FOOTER_OFF', 'false', 'Down for Maintenance: Hide Footer <br />(true=hide false=show)', 20, 6, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(444, 'Down for Maintenance: Hide Prices', 'DOWN_FOR_MAINTENANCE_PRICES_OFF', 'false', 'Down for Maintenance: Hide Prices <br />(true=hide false=show)', 20, 7, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(445, 'Down For Maintenance (exclude this IP-Address)', 'EXCLUDE_ADMIN_IP_FOR_MAINTENANCE', 'your IP (ADMIN)', 'This IP Address is able to access the website while it is Down For Maintenance (like webmaster)<br />To enter multiple IP Addresses, separate with a comma. If you do not know your IP Address, check in the Footer of your Shop.', 20, 8, '2003-03-21 13:43:22', '2003-03-21 21:20:07', NULL, NULL),
(446, 'NOTICE PUBLIC Before going Down for Maintenance: ON/OFF', 'WARN_BEFORE_DOWN_FOR_MAINTENANCE', 'false', 'Give a WARNING some time before you put your website Down for Maintenance<br />(true=on false=off)<br />If you set the ''Down For Maintenance: ON/OFF'' to true this will automaticly be updated to false', 20, 9, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(447, 'Date and hours for notice before maintenance', 'PERIOD_BEFORE_DOWN_FOR_MAINTENANCE', '15/05/2003  2-3 PM', 'Date and hours for notice before maintenance website, enter date and hours for maintenance website', 20, 10, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL),
(448, 'Display when webmaster has enabled maintenance', 'DISPLAY_MAINTENANCE_TIME', 'false', 'Display when Webmaster has enabled maintenance <br />(true=on false=off)<br />', 20, 11, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(449, 'Display website maintenance period', 'DISPLAY_MAINTENANCE_PERIOD', 'false', 'Display Website maintenance period <br />(true=on false=off)<br />', 20, 12, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(450, 'Website maintenance period', 'TEXT_MAINTENANCE_PERIOD_TIME', '2h00', 'Enter Website Maintenance period (hh:mm)', 20, 13, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL),
(451, 'Confirm Terms and Conditions During Checkout Procedure', 'DISPLAY_CONDITIONS_ON_CHECKOUT', 'false', 'Show the Terms and Conditions during the checkout procedure which the customer must agree to.', 11, 1, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(452, 'Confirm Privacy Notice During Account Creation Procedure', 'DISPLAY_PRIVACY_CONDITIONS', 'false', 'Show the Privacy Notice during the account creation procedure which the customer must agree to.', 11, 2, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(453, 'Display Product Image', 'PRODUCT_NEW_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 1, NULL, '2012-11-16 15:52:05', NULL, NULL),
(454, 'Display Product Quantity', 'PRODUCT_NEW_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 2, NULL, '2012-11-16 15:52:05', NULL, NULL),
(455, 'Display Product Buy Now Button', 'PRODUCT_NEW_BUY_NOW', '1300', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 3, NULL, '2012-11-16 15:52:05', NULL, NULL),
(456, 'Display Product Name', 'PRODUCT_NEW_LIST_NAME', '2101', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 4, NULL, '2012-11-16 15:52:05', NULL, NULL),
(457, 'Display Product Model', 'PRODUCT_NEW_LIST_MODEL', '2201', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 5, NULL, '2012-11-16 15:52:05', NULL, NULL),
(458, 'Display Product Manufacturer Name', 'PRODUCT_NEW_LIST_MANUFACTURER', '2302', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 6, NULL, '2012-11-16 15:52:05', NULL, NULL),
(459, 'Display Product Price', 'PRODUCT_NEW_LIST_PRICE', '2402', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 7, NULL, '2012-11-16 15:52:05', NULL, NULL),
(460, 'Display Product Weight', 'PRODUCT_NEW_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 8, NULL, '2012-11-16 15:52:05', NULL, NULL),
(461, 'Display Product Date Added', 'PRODUCT_NEW_LIST_DATE_ADDED', '2601', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 9, NULL, '2012-11-16 15:52:05', NULL, NULL),
(462, 'Display Product Description', 'PRODUCT_NEW_LIST_DESCRIPTION', '150', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 21, 10, NULL, '2012-11-16 15:52:05', NULL, NULL),
(463, 'Display Product Display - Default Sort Order', 'PRODUCT_NEW_LIST_SORT_DEFAULT', '6', 'What Sort Order Default should be used for New Products Display?<br />Default= 6 for Date New to Old<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', 21, 11, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(464, 'Default Products New Group ID', 'PRODUCT_NEW_LIST_GROUP_ID', '21', 'Warning: Only change this if your Products New Group ID has changed from the default of 21<br />What is the configuration_group_id for New Products Listings?', 21, 12, NULL, '2012-11-16 15:52:05', NULL, NULL),
(465, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_NEW_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 21, 25, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(466, 'Mask Upcoming Products from being include as New Products', 'SHOW_NEW_PRODUCTS_UPCOMING_MASKED', '0', 'Do you want to mask Upcoming Products from being included as New Products in Listing, Sideboxes and Centerbox?<br />0= off<br />1= on', 21, 30, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(467, 'Display Product Image', 'PRODUCT_FEATURED_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 1, NULL, '2012-11-16 15:52:05', NULL, NULL),
(468, 'Display Product Quantity', 'PRODUCT_FEATURED_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 2, NULL, '2012-11-16 15:52:05', NULL, NULL),
(469, 'Display Product Buy Now Button', 'PRODUCT_FEATURED_BUY_NOW', '1300', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 3, NULL, '2012-11-16 15:52:05', NULL, NULL),
(470, 'Display Product Name', 'PRODUCT_FEATURED_LIST_NAME', '2101', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 4, NULL, '2012-11-16 15:52:05', NULL, NULL),
(471, 'Display Product Model', 'PRODUCT_FEATURED_LIST_MODEL', '2201', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 5, NULL, '2012-11-16 15:52:05', NULL, NULL),
(472, 'Display Product Manufacturer Name', 'PRODUCT_FEATURED_LIST_MANUFACTURER', '2302', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 6, NULL, '2012-11-16 15:52:05', NULL, NULL),
(473, 'Display Product Price', 'PRODUCT_FEATURED_LIST_PRICE', '2402', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 7, NULL, '2012-11-16 15:52:05', NULL, NULL),
(474, 'Display Product Weight', 'PRODUCT_FEATURED_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 8, NULL, '2012-11-16 15:52:05', NULL, NULL),
(475, 'Display Product Date Added', 'PRODUCT_FEATURED_LIST_DATE_ADDED', '2601', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 9, NULL, '2012-11-16 15:52:05', NULL, NULL),
(476, 'Display Product Description', 'PRODUCT_FEATURED_LIST_DESCRIPTION', '150', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 22, 10, NULL, '2012-11-16 15:52:05', NULL, NULL),
(477, 'Display Product Display - Default Sort Order', 'PRODUCT_FEATURED_LIST_SORT_DEFAULT', '1', 'What Sort Order Default should be used for Featured Product Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', 22, 11, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(478, 'Default Featured Products Group ID', 'PRODUCT_FEATURED_LIST_GROUP_ID', '22', 'Warning: Only change this if your Featured Products Group ID has changed from the default of 22<br />What is the configuration_group_id for Featured Products Listings?', 22, 12, NULL, '2012-11-16 15:52:05', NULL, NULL),
(479, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_FEATURED_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 22, 25, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(480, 'Display Product Image', 'PRODUCT_ALL_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 1, NULL, '2012-11-16 15:52:05', NULL, NULL),
(481, 'Display Product Quantity', 'PRODUCT_ALL_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 2, NULL, '2012-11-16 15:52:05', NULL, NULL),
(482, 'Display Product Buy Now Button', 'PRODUCT_ALL_BUY_NOW', '1300', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 3, NULL, '2012-11-16 15:52:05', NULL, NULL),
(483, 'Display Product Name', 'PRODUCT_ALL_LIST_NAME', '2101', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 4, NULL, '2012-11-16 15:52:05', NULL, NULL),
(484, 'Display Product Model', 'PRODUCT_ALL_LIST_MODEL', '2201', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 5, NULL, '2012-11-16 15:52:05', NULL, NULL),
(485, 'Display Product Manufacturer Name', 'PRODUCT_ALL_LIST_MANUFACTURER', '2302', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 6, NULL, '2012-11-16 15:52:05', NULL, NULL),
(486, 'Display Product Price', 'PRODUCT_ALL_LIST_PRICE', '2402', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 7, NULL, '2012-11-16 15:52:05', NULL, NULL),
(487, 'Display Product Weight', 'PRODUCT_ALL_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 8, NULL, '2012-11-16 15:52:05', NULL, NULL),
(488, 'Display Product Date Added', 'PRODUCT_ALL_LIST_DATE_ADDED', '2601', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 9, NULL, '2012-11-16 15:52:05', NULL, NULL),
(489, 'Display Product Description', 'PRODUCT_ALL_LIST_DESCRIPTION', '150', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 23, 10, NULL, '2012-11-16 15:52:05', NULL, NULL),
(490, 'Display Product Display - Default Sort Order', 'PRODUCT_ALL_LIST_SORT_DEFAULT', '1', 'What Sort Order Default should be used for All Products Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', 23, 11, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(491, 'Default Products All Group ID', 'PRODUCT_ALL_LIST_GROUP_ID', '23', 'Warning: Only change this if your Products All Group ID has changed from the default of 23<br />What is the configuration_group_id for Products All Listings?', 23, 12, NULL, '2012-11-16 15:52:05', NULL, NULL),
(492, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_ALL_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 23, 25, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(493, 'Show New Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS', '1', 'Show New Products on Main Page<br />0= off or set the sort order', 24, 65, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(494, 'Show Featured Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS', '2', 'Show Featured Products on Main Page<br />0= off or set the sort order', 24, 66, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(495, 'Show Special Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS', '3', 'Show Special Products on Main Page<br />0= off or set the sort order', 24, 67, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(496, 'Show Upcoming Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_UPCOMING', '4', 'Show Upcoming Products on Main Page<br />0= off or set the sort order', 24, 68, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(497, 'Show New Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS', '1', 'Show New Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 70, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(498, 'Show Featured Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS', '2', 'Show Featured Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 71, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(499, 'Show Special Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS', '3', 'Show Special Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 72, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(500, 'Show Upcoming Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_UPCOMING', '4', 'Show Upcoming Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 73, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(501, 'Show New Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_NEW_PRODUCTS', '1', 'Show New Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 75, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(502, 'Show Featured Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_FEATURED_PRODUCTS', '2', 'Show Featured Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 76, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(503, 'Show Special Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_SPECIALS_PRODUCTS', '3', 'Show Special Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 77, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(504, 'Show Upcoming Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_UPCOMING', '4', 'Show Upcoming Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 78, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(505, 'Show New Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_NEW_PRODUCTS', '1', 'Show New Products below Product Listing<br />0= off or set the sort order', 24, 85, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(506, 'Show Featured Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_FEATURED_PRODUCTS', '2', 'Show Featured Products below Product Listing<br />0= off or set the sort order', 24, 86, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(507, 'Show Special Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_SPECIALS_PRODUCTS', '3', 'Show Special Products below Product Listing<br />0= off or set the sort order', 24, 87, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(508, 'Show Upcoming Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_UPCOMING', '4', 'Show Upcoming Products below Product Listing<br />0= off or set the sort order', 24, 88, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(509, 'New Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS', '3', 'New Products Columns per Row', 24, 95, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(510, 'Featured Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS', '3', 'Featured Products Columns per Row', 24, 96, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(511, 'Special Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS', '3', 'Special Products Columns per Row', 24, 97, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(512, 'Filter Product Listing for Current Top Level Category When Enabled', 'SHOW_PRODUCT_INFO_ALL_PRODUCTS', '1', 'Filter the products when Product Listing is enabled for current Main Category or show products from all categories?<br />0= Filter Off 1=Filter On ', 24, 100, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(513, 'Define Main Page Status', 'DEFINE_MAIN_PAGE_STATUS', '1', 'Enable the Defined Main Page Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 60, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(514, 'Define Contact Us Status', 'DEFINE_CONTACT_US_STATUS', '1', 'Enable the Defined Contact Us Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 61, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(515, 'Define Privacy Status', 'DEFINE_PRIVACY_STATUS', '1', 'Enable the Defined Privacy Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 62, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(516, 'Define Shipping & Returns', 'DEFINE_SHIPPINGINFO_STATUS', '1', 'Enable the Defined Shipping & Returns Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 63, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(517, 'Define Conditions of Use', 'DEFINE_CONDITIONS_STATUS', '1', 'Enable the Defined Conditions of Use Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 64, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(518, 'Define Checkout Success', 'DEFINE_CHECKOUT_SUCCESS_STATUS', '1', 'Enable the Defined Checkout Success Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 65, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(519, 'Define Discount Coupon', 'DEFINE_DISCOUNT_COUPON_STATUS', '1', 'Enable the Defined Discount Coupon Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 66, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(520, 'Define Site Map Status', 'DEFINE_SITE_MAP_STATUS', '1', 'Enable the Defined Site Map Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 67, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(521, 'Define Page-Not-Found Status', 'DEFINE_PAGE_NOT_FOUND_STATUS', '1', 'Enable the Defined Page-Not-Found Text from define-pages?<br />0= Define Text OFF<br />1= Define Text ON', 25, 67, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(522, 'Define Page 2', 'DEFINE_PAGE_2_STATUS', '1', 'Enable the Defined Page 2 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 82, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(523, 'Define Page 3', 'DEFINE_PAGE_3_STATUS', '1', 'Enable the Defined Page 3 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 83, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(524, 'Define Page 4', 'DEFINE_PAGE_4_STATUS', '1', 'Enable the Defined Page 4 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 84, '2012-11-16 15:52:05', '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(525, 'EZ-Pages Display Status - HeaderBar', 'EZPAGES_STATUS_HEADER', '1', 'Display of EZ-Pages content can be Globally enabled/disabled for the Header Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', 30, 10, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(526, 'EZ-Pages Display Status - FooterBar', 'EZPAGES_STATUS_FOOTER', '1', 'Display of EZ-Pages content can be Globally enabled/disabled for the Footer Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', 30, 11, NULL, '2012-11-16 15:52:05', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(527, 'EZ-Pages Display Status - Sidebox', 'EZPAGES_STATUS_SIDEBOX', '1', 'Display of EZ-Pages content can be Globally enabled/disabled for the Sidebox<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', 30, 12, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(528, 'EZ-Pages Header Link Separator', 'EZPAGES_SEPARATOR_HEADER', '&nbsp;::&nbsp;', 'EZ-Pages Header Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;', 30, 20, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_textarea_small('),
(529, 'EZ-Pages Footer Link Separator', 'EZPAGES_SEPARATOR_FOOTER', '&nbsp;::&nbsp;', 'EZ-Pages Footer Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;', 30, 21, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_textarea_small('),
(530, 'EZ-Pages Prev/Next Buttons', 'EZPAGES_SHOW_PREV_NEXT_BUTTONS', '2', 'Display Prev/Continue/Next buttons on EZ-Pages pages?<br />0=OFF (no buttons)<br />1="Continue"<br />2="Prev/Continue/Next"<br /><br />Default setting: 2.', 30, 30, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(531, 'EZ-Pages Table of Contents for Chapters Status', 'EZPAGES_SHOW_TABLE_CONTENTS', '1', 'Enable EZ-Pages Table of Contents for Chapters?<br />0= OFF<br />1= ON', 30, 35, '2012-11-16 15:52:06', '2012-11-16 15:52:06', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(532, 'EZ-Pages Pages to disable headers', 'EZPAGES_DISABLE_HEADER_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "header" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 1,5,2<br />or leave blank.', 30, 40, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_textarea_small('),
(533, 'EZ-Pages Pages to disable footers', 'EZPAGES_DISABLE_FOOTER_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "footer" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,7<br />or leave blank.', 30, 41, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_textarea_small('),
(534, 'EZ-Pages Pages to disable left-column', 'EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "left" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 21<br />or leave blank.', 30, 42, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_textarea_small('),
(535, 'EZ-Pages Pages to disable right-column', 'EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "right" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,82,13<br />or leave blank.', 30, 43, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_textarea_small('),
(536, 'Convert currencies for Text emails', 'CURRENCIES_TRANSLATIONS', '', 'What currency conversions do you need for Text emails?<br />Example = &amp;pound;,&pound;:&amp;euro;,&euro;', 12, 120, NULL, '2003-11-21 00:00:00', NULL, 'zen_cfg_textarea_small('),
(537, 'Use root path for cookie path', 'SESSION_USE_ROOT_COOKIE_PATH', 'False', 'Normally Zen Cart will use the directory that a store resides in as the cookie path. This can cause problems with some servers. This setting allows you to set the cookie path to the root of the server, rather than the store directory. It should only be used if you have problems with sessions. <strong>Default Value = False</strong><br /><br /><strong>Changing this setting may mean you have problems logging into your admin, you should clear your browser cookies to overcome this.</strong>', 15, 999, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(538, 'Add period prefix to cookie domain', 'SESSION_ADD_PERIOD_PREFIX', 'True', 'Normally Zen Cart will add a period prefix to the cookie domain, e.g.  .www.mydomain.com. This can sometimes cause problems with some server configurations. If you are having session problems you may want to try setting this to False. <strong>Default Value = True</strong>', 15, 999, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(539, 'Display COD', 'MODULE_ORDER_TOTAL_COD_STATUS', 'true', 'Do you want this module to display?', 6, 1, NULL, '2012-11-19 14:27:37', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(540, 'Sort Order', 'MODULE_ORDER_TOTAL_COD_SORT_ORDER', '950', 'Sort order of display.', 6, 2, NULL, '2012-11-19 14:27:37', NULL, NULL),
(541, 'COD Fee for FLAT', 'MODULE_ORDER_TOTAL_COD_FEE_FLAT', 'AT:3.00,DE:3.58,00:9.99', 'FLAT: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 3, NULL, '2012-11-19 14:27:37', NULL, NULL),
(542, 'COD Fee for Free Shipping by default', 'MODULE_ORDER_TOTAL_COD_FEE_FREE', 'US:3.00', 'Free by default: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 3, NULL, '2012-11-19 14:27:37', NULL, NULL),
(543, 'COD Fee for Free Shipping Module - (freeshipper)', 'MODULE_ORDER_TOTAL_COD_FEE_FREESHIPPER', 'CA:4.50,US:3.00,00:9.99', 'Free Module: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 3, NULL, '2012-11-19 14:27:37', NULL, NULL),
(544, 'COD Fee for Free-Options Shipping Module - (freeoptions)', 'MODULE_ORDER_TOTAL_COD_FEE_FREEOPTIONS', 'CA:4.50,US:3.00,00:9.99', 'Free+Options: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 3, NULL, '2012-11-19 14:27:37', NULL, NULL),
(545, 'COD Fee for Per Weight Unit Shipping Module - (perweightunit)', 'MODULE_ORDER_TOTAL_COD_FEE_PERWEIGHTUNIT', 'CA:4.50,US:3.00,00:9.99', 'Per Weight Unit: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 3, NULL, '2012-11-19 14:27:37', NULL, NULL),
(546, 'COD Fee for ITEM', 'MODULE_ORDER_TOTAL_COD_FEE_ITEM', 'AT:3.00,DE:3.58,00:9.99', 'ITEM: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 4, NULL, '2012-11-19 14:27:37', NULL, NULL),
(547, 'COD Fee for TABLE', 'MODULE_ORDER_TOTAL_COD_FEE_TABLE', 'AT:3.00,DE:3.58,00:9.99', 'TABLE: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 5, NULL, '2012-11-19 14:27:37', NULL, NULL),
(548, 'COD Fee for UPS', 'MODULE_ORDER_TOTAL_COD_FEE_UPS', 'CA:4.50,US:3.00,00:9.99', 'UPS: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 6, NULL, '2012-11-19 14:27:37', NULL, NULL),
(549, 'COD Fee for USPS', 'MODULE_ORDER_TOTAL_COD_FEE_USPS', 'CA:4.50,US:3.00,00:9.99', 'USPS: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 7, NULL, '2012-11-19 14:27:37', NULL, NULL),
(550, 'COD Fee for ZONES', 'MODULE_ORDER_TOTAL_COD_FEE_ZONES', 'CA:4.50,US:3.00,00:9.99', 'ZONES: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 8, NULL, '2012-11-19 14:27:37', NULL, NULL),
(551, 'COD Fee for Austrian Post', 'MODULE_ORDER_TOTAL_COD_FEE_AP', 'AT:3.63,00:9.99', 'Austrian Post: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 9, NULL, '2012-11-19 14:27:37', NULL, NULL),
(552, 'COD Fee for German Post', 'MODULE_ORDER_TOTAL_COD_FEE_DP', 'DE:3.58,00:9.99', 'German Post: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 10, NULL, '2012-11-19 14:27:37', NULL, NULL),
(553, 'COD Fee for Servicepakke', 'MODULE_ORDER_TOTAL_COD_FEE_SERVICEPAKKE', 'NO:69', 'Servicepakke: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 11, NULL, '2012-11-19 14:27:37', NULL, NULL),
(554, 'COD Fee for FedEx', 'MODULE_ORDER_TOTAL_COD_FEE_FEDEX', 'US:3.00', 'FedEx: &lt;Country code&gt;:&lt;COD price&gt;, .... 00 as country code applies for all countries. If country code is 00, it must be the last statement. If no 00:9.99 appears, COD shipping in foreign countries is not calculated (not possible)', 6, 12, NULL, '2012-11-19 14:27:37', NULL, NULL),
(555, 'Tax Class', 'MODULE_ORDER_TOTAL_COD_TAX_CLASS', '0', 'Use the following tax class on the COD fee.', 6, 25, NULL, '2012-11-19 14:27:37', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');

-- --------------------------------------------------------

--
-- Table structure for table `configuration_group`
--

DROP TABLE IF EXISTS `configuration_group`;
CREATE TABLE IF NOT EXISTS `configuration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) NOT NULL DEFAULT '',
  `configuration_group_description` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`configuration_group_id`),
  KEY `idx_visible_zen` (`visible`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `configuration_group`
--

INSERT INTO `configuration_group` (`configuration_group_id`, `configuration_group_title`, `configuration_group_description`, `sort_order`, `visible`) VALUES
(1, 'My Store', 'General information about my store', 1, 1),
(2, 'Minimum Values', 'The minimum values for functions / data', 2, 1),
(3, 'Maximum Values', 'The maximum values for functions / data', 3, 1),
(4, 'Images', 'Image parameters', 4, 1),
(5, 'Customer Details', 'Customer account configuration', 5, 1),
(6, 'Module Options', 'Hidden from configuration', 6, 0),
(7, 'Shipping/Packaging', 'Shipping options available at my store', 7, 1),
(8, 'Product Listing', 'Product Listing configuration options', 8, 1),
(9, 'Stock', 'Stock configuration options', 9, 1),
(10, 'Logging', 'Logging configuration options', 10, 1),
(11, 'Regulations', 'Regulation options', 16, 1),
(12, 'E-Mail Options', 'General settings for E-Mail transport and HTML E-Mails', 12, 1),
(13, 'Attribute Settings', 'Configure products attributes settings', 13, 1),
(14, 'GZip Compression', 'GZip compression options', 14, 1),
(15, 'Sessions', 'Session options', 15, 1),
(16, 'GV Coupons', 'Gift Vouchers and Coupons', 16, 1),
(17, 'Credit Cards', 'Credit Cards Accepted', 17, 1),
(18, 'Product Info', 'Product Info Display Options', 18, 1),
(19, 'Layout Settings', 'Layout Options', 19, 1),
(20, 'Website Maintenance', 'Website Maintenance Options', 20, 1),
(21, 'New Listing', 'New Products Listing', 21, 1),
(22, 'Featured Listing', 'Featured Products Listing', 22, 1),
(23, 'All Listing', 'All Products Listing', 23, 1),
(24, 'Index Listing', 'Index Products Listing', 24, 1),
(25, 'Define Page Status', 'Define Main Pages and HTMLArea Options', 25, 1),
(30, 'EZ-Pages Settings', 'EZ-Pages Settings', 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
CREATE TABLE IF NOT EXISTS `counter` (
  `startdate` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`startdate`, `counter`) VALUES
('20121116', 346);

-- --------------------------------------------------------

--
-- Table structure for table `counter_history`
--

DROP TABLE IF EXISTS `counter_history`;
CREATE TABLE IF NOT EXISTS `counter_history` (
  `startdate` char(8) NOT NULL DEFAULT '',
  `counter` int(12) DEFAULT NULL,
  `session_counter` int(12) DEFAULT NULL,
  PRIMARY KEY (`startdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter_history`
--

INSERT INTO `counter_history` (`startdate`, `counter`, `session_counter`) VALUES
('20121116', 118, 37),
('20121119', 114, 41),
('20121122', 114, 102);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(64) NOT NULL DEFAULT '',
  `countries_iso_code_2` char(2) NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) NOT NULL DEFAULT '',
  `address_format_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`countries_id`),
  KEY `idx_countries_name_zen` (`countries_name`),
  KEY `idx_address_format_id_zen` (`address_format_id`),
  KEY `idx_iso_2_zen` (`countries_iso_code_2`),
  KEY `idx_iso_3_zen` (`countries_iso_code_3`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=246 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`countries_id`, `countries_name`, `countries_iso_code_2`, `countries_iso_code_3`, `address_format_id`) VALUES
(240, 'Aaland Islands', 'AX', 'ALA', 1),
(1, 'Afghanistan', 'AF', 'AFG', 1),
(2, 'Albania', 'AL', 'ALB', 1),
(3, 'Algeria', 'DZ', 'DZA', 1),
(4, 'American Samoa', 'AS', 'ASM', 1),
(5, 'Andorra', 'AD', 'AND', 1),
(6, 'Angola', 'AO', 'AGO', 1),
(7, 'Anguilla', 'AI', 'AIA', 1),
(8, 'Antarctica', 'AQ', 'ATA', 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 1),
(10, 'Argentina', 'AR', 'ARG', 1),
(11, 'Armenia', 'AM', 'ARM', 1),
(12, 'Aruba', 'AW', 'ABW', 1),
(13, 'Australia', 'AU', 'AUS', 1),
(14, 'Austria', 'AT', 'AUT', 5),
(15, 'Azerbaijan', 'AZ', 'AZE', 1),
(16, 'Bahamas', 'BS', 'BHS', 1),
(17, 'Bahrain', 'BH', 'BHR', 1),
(18, 'Bangladesh', 'BD', 'BGD', 1),
(19, 'Barbados', 'BB', 'BRB', 1),
(20, 'Belarus', 'BY', 'BLR', 1),
(21, 'Belgium', 'BE', 'BEL', 1),
(22, 'Belize', 'BZ', 'BLZ', 1),
(23, 'Benin', 'BJ', 'BEN', 1),
(24, 'Bermuda', 'BM', 'BMU', 1),
(25, 'Bhutan', 'BT', 'BTN', 1),
(26, 'Bolivia', 'BO', 'BOL', 1),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', 1),
(28, 'Botswana', 'BW', 'BWA', 1),
(29, 'Bouvet Island', 'BV', 'BVT', 1),
(30, 'Brazil', 'BR', 'BRA', 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', 1),
(33, 'Bulgaria', 'BG', 'BGR', 1),
(34, 'Burkina Faso', 'BF', 'BFA', 1),
(35, 'Burundi', 'BI', 'BDI', 1),
(36, 'Cambodia', 'KH', 'KHM', 1),
(37, 'Cameroon', 'CM', 'CMR', 1),
(38, 'Canada', 'CA', 'CAN', 2),
(39, 'Cape Verde', 'CV', 'CPV', 1),
(40, 'Cayman Islands', 'KY', 'CYM', 1),
(41, 'Central African Republic', 'CF', 'CAF', 1),
(42, 'Chad', 'TD', 'TCD', 1),
(43, 'Chile', 'CL', 'CHL', 1),
(44, 'China', 'CN', 'CHN', 1),
(45, 'Christmas Island', 'CX', 'CXR', 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', 1),
(47, 'Colombia', 'CO', 'COL', 1),
(48, 'Comoros', 'KM', 'COM', 1),
(49, 'Congo', 'CG', 'COG', 1),
(50, 'Cook Islands', 'CK', 'COK', 1),
(51, 'Costa Rica', 'CR', 'CRI', 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', 1),
(53, 'Croatia', 'HR', 'HRV', 1),
(54, 'Cuba', 'CU', 'CUB', 1),
(55, 'Cyprus', 'CY', 'CYP', 1),
(56, 'Czech Republic', 'CZ', 'CZE', 1),
(57, 'Denmark', 'DK', 'DNK', 1),
(58, 'Djibouti', 'DJ', 'DJI', 1),
(59, 'Dominica', 'DM', 'DMA', 1),
(60, 'Dominican Republic', 'DO', 'DOM', 1),
(61, 'Timor-Leste', 'TL', 'TLS', 1),
(62, 'Ecuador', 'EC', 'ECU', 1),
(63, 'Egypt', 'EG', 'EGY', 1),
(64, 'El Salvador', 'SV', 'SLV', 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', 1),
(66, 'Eritrea', 'ER', 'ERI', 1),
(67, 'Estonia', 'EE', 'EST', 1),
(68, 'Ethiopia', 'ET', 'ETH', 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 1),
(70, 'Faroe Islands', 'FO', 'FRO', 1),
(71, 'Fiji', 'FJ', 'FJI', 1),
(72, 'Finland', 'FI', 'FIN', 1),
(73, 'France', 'FR', 'FRA', 1),
(75, 'French Guiana', 'GF', 'GUF', 1),
(76, 'French Polynesia', 'PF', 'PYF', 1),
(77, 'French Southern Territories', 'TF', 'ATF', 1),
(78, 'Gabon', 'GA', 'GAB', 1),
(79, 'Gambia', 'GM', 'GMB', 1),
(80, 'Georgia', 'GE', 'GEO', 1),
(81, 'Germany', 'DE', 'DEU', 5),
(82, 'Ghana', 'GH', 'GHA', 1),
(83, 'Gibraltar', 'GI', 'GIB', 1),
(84, 'Greece', 'GR', 'GRC', 1),
(85, 'Greenland', 'GL', 'GRL', 1),
(86, 'Grenada', 'GD', 'GRD', 1),
(87, 'Guadeloupe', 'GP', 'GLP', 1),
(88, 'Guam', 'GU', 'GUM', 1),
(89, 'Guatemala', 'GT', 'GTM', 1),
(90, 'Guinea', 'GN', 'GIN', 1),
(91, 'Guinea-bissau', 'GW', 'GNB', 1),
(92, 'Guyana', 'GY', 'GUY', 1),
(93, 'Haiti', 'HT', 'HTI', 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', 1),
(95, 'Honduras', 'HN', 'HND', 1),
(96, 'Hong Kong', 'HK', 'HKG', 1),
(97, 'Hungary', 'HU', 'HUN', 1),
(98, 'Iceland', 'IS', 'ISL', 1),
(99, 'India', 'IN', 'IND', 1),
(100, 'Indonesia', 'ID', 'IDN', 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', 1),
(102, 'Iraq', 'IQ', 'IRQ', 1),
(103, 'Ireland', 'IE', 'IRL', 1),
(104, 'Israel', 'IL', 'ISR', 1),
(105, 'Italy', 'IT', 'ITA', 1),
(106, 'Jamaica', 'JM', 'JAM', 1),
(107, 'Japan', 'JP', 'JPN', 1),
(108, 'Jordan', 'JO', 'JOR', 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', 1),
(110, 'Kenya', 'KE', 'KEN', 1),
(111, 'Kiribati', 'KI', 'KIR', 1),
(112, 'Korea, Democratic People''s Republic of', 'KP', 'PRK', 1),
(113, 'Korea, Republic of', 'KR', 'KOR', 1),
(114, 'Kuwait', 'KW', 'KWT', 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', 1),
(117, 'Latvia', 'LV', 'LVA', 1),
(118, 'Lebanon', 'LB', 'LBN', 1),
(119, 'Lesotho', 'LS', 'LSO', 1),
(120, 'Liberia', 'LR', 'LBR', 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 1),
(122, 'Liechtenstein', 'LI', 'LIE', 1),
(123, 'Lithuania', 'LT', 'LTU', 1),
(124, 'Luxembourg', 'LU', 'LUX', 1),
(125, 'Macao', 'MO', 'MAC', 1),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', 1),
(127, 'Madagascar', 'MG', 'MDG', 1),
(128, 'Malawi', 'MW', 'MWI', 1),
(129, 'Malaysia', 'MY', 'MYS', 1),
(130, 'Maldives', 'MV', 'MDV', 1),
(131, 'Mali', 'ML', 'MLI', 1),
(132, 'Malta', 'MT', 'MLT', 1),
(133, 'Marshall Islands', 'MH', 'MHL', 1),
(134, 'Martinique', 'MQ', 'MTQ', 1),
(135, 'Mauritania', 'MR', 'MRT', 1),
(136, 'Mauritius', 'MU', 'MUS', 1),
(137, 'Mayotte', 'YT', 'MYT', 1),
(138, 'Mexico', 'MX', 'MEX', 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', 1),
(140, 'Moldova', 'MD', 'MDA', 1),
(141, 'Monaco', 'MC', 'MCO', 1),
(142, 'Mongolia', 'MN', 'MNG', 1),
(143, 'Montserrat', 'MS', 'MSR', 1),
(144, 'Morocco', 'MA', 'MAR', 1),
(145, 'Mozambique', 'MZ', 'MOZ', 1),
(146, 'Myanmar', 'MM', 'MMR', 1),
(147, 'Namibia', 'NA', 'NAM', 1),
(148, 'Nauru', 'NR', 'NRU', 1),
(149, 'Nepal', 'NP', 'NPL', 1),
(150, 'Netherlands', 'NL', 'NLD', 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', 1),
(152, 'New Caledonia', 'NC', 'NCL', 1),
(153, 'New Zealand', 'NZ', 'NZL', 1),
(154, 'Nicaragua', 'NI', 'NIC', 1),
(155, 'Niger', 'NE', 'NER', 1),
(156, 'Nigeria', 'NG', 'NGA', 1),
(157, 'Niue', 'NU', 'NIU', 1),
(158, 'Norfolk Island', 'NF', 'NFK', 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', 1),
(160, 'Norway', 'NO', 'NOR', 1),
(161, 'Oman', 'OM', 'OMN', 1),
(162, 'Pakistan', 'PK', 'PAK', 1),
(163, 'Palau', 'PW', 'PLW', 1),
(164, 'Panama', 'PA', 'PAN', 1),
(165, 'Papua New Guinea', 'PG', 'PNG', 1),
(166, 'Paraguay', 'PY', 'PRY', 1),
(167, 'Peru', 'PE', 'PER', 1),
(168, 'Philippines', 'PH', 'PHL', 1),
(169, 'Pitcairn', 'PN', 'PCN', 1),
(170, 'Poland', 'PL', 'POL', 1),
(171, 'Portugal', 'PT', 'PRT', 1),
(172, 'Puerto Rico', 'PR', 'PRI', 1),
(173, 'Qatar', 'QA', 'QAT', 1),
(174, 'Reunion', 'RE', 'REU', 1),
(175, 'Romania', 'RO', 'ROU', 1),
(176, 'Russian Federation', 'RU', 'RUS', 1),
(177, 'Rwanda', 'RW', 'RWA', 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', 1),
(179, 'Saint Lucia', 'LC', 'LCA', 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 1),
(181, 'Samoa', 'WS', 'WSM', 1),
(182, 'San Marino', 'SM', 'SMR', 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', 1),
(184, 'Saudi Arabia', 'SA', 'SAU', 1),
(185, 'Senegal', 'SN', 'SEN', 1),
(186, 'Seychelles', 'SC', 'SYC', 1),
(187, 'Sierra Leone', 'SL', 'SLE', 1),
(188, 'Singapore', 'SG', 'SGP', 4),
(189, 'Slovakia (Slovak Republic)', 'SK', 'SVK', 1),
(190, 'Slovenia', 'SI', 'SVN', 1),
(191, 'Solomon Islands', 'SB', 'SLB', 1),
(192, 'Somalia', 'SO', 'SOM', 1),
(193, 'South Africa', 'ZA', 'ZAF', 1),
(194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 1),
(195, 'Spain', 'ES', 'ESP', 3),
(196, 'Sri Lanka', 'LK', 'LKA', 1),
(197, 'St. Helena', 'SH', 'SHN', 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', 1),
(199, 'Sudan', 'SD', 'SDN', 1),
(200, 'Suriname', 'SR', 'SUR', 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', 1),
(202, 'Swaziland', 'SZ', 'SWZ', 1),
(203, 'Sweden', 'SE', 'SWE', 1),
(204, 'Switzerland', 'CH', 'CHE', 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', 1),
(206, 'Taiwan', 'TW', 'TWN', 1),
(207, 'Tajikistan', 'TJ', 'TJK', 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', 1),
(209, 'Thailand', 'TH', 'THA', 1),
(210, 'Togo', 'TG', 'TGO', 1),
(211, 'Tokelau', 'TK', 'TKL', 1),
(212, 'Tonga', 'TO', 'TON', 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', 1),
(214, 'Tunisia', 'TN', 'TUN', 1),
(215, 'Turkey', 'TR', 'TUR', 1),
(216, 'Turkmenistan', 'TM', 'TKM', 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', 1),
(218, 'Tuvalu', 'TV', 'TUV', 1),
(219, 'Uganda', 'UG', 'UGA', 1),
(220, 'Ukraine', 'UA', 'UKR', 1),
(221, 'United Arab Emirates', 'AE', 'ARE', 1),
(222, 'United Kingdom', 'GB', 'GBR', 6),
(223, 'United States', 'US', 'USA', 2),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', 1),
(225, 'Uruguay', 'UY', 'URY', 1),
(226, 'Uzbekistan', 'UZ', 'UZB', 1),
(227, 'Vanuatu', 'VU', 'VUT', 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', 1),
(229, 'Venezuela', 'VE', 'VEN', 1),
(230, 'Viet Nam', 'VN', 'VNM', 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', 1),
(234, 'Western Sahara', 'EH', 'ESH', 1),
(235, 'Yemen', 'YE', 'YEM', 1),
(236, 'Serbia', 'RS', 'SRB', 1),
(238, 'Zambia', 'ZM', 'ZMB', 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', 1),
(241, 'Palestinian Territory', 'PS', 'PSE', 1),
(242, 'Montenegro', 'ME', 'MNE', 1),
(243, 'Guernsey', 'GG', 'GGY', 1),
(244, 'Isle of Man', 'IM', 'IMN', 1),
(245, 'Jersey', 'JE', 'JEY', 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_email_track`
--

DROP TABLE IF EXISTS `coupon_email_track`;
CREATE TABLE IF NOT EXISTS `coupon_email_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id_sent` int(11) NOT NULL DEFAULT '0',
  `sent_firstname` varchar(32) DEFAULT NULL,
  `sent_lastname` varchar(32) DEFAULT NULL,
  `emailed_to` varchar(32) DEFAULT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_gv_customer`
--

DROP TABLE IF EXISTS `coupon_gv_customer`;
CREATE TABLE IF NOT EXISTS `coupon_gv_customer` (
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_gv_queue`
--

DROP TABLE IF EXISTS `coupon_gv_queue`;
CREATE TABLE IF NOT EXISTS `coupon_gv_queue` (
  `unique_id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `ipaddr` varchar(45) NOT NULL DEFAULT '',
  `release_flag` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`unique_id`),
  KEY `idx_cust_id_order_id_zen` (`customer_id`,`order_id`),
  KEY `idx_release_flag_zen` (`release_flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_redeem_track`
--

DROP TABLE IF EXISTS `coupon_redeem_track`;
CREATE TABLE IF NOT EXISTS `coupon_redeem_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `redeem_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `redeem_ip` varchar(45) NOT NULL DEFAULT '',
  `order_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_restrict`
--

DROP TABLE IF EXISTS `coupon_restrict`;
CREATE TABLE IF NOT EXISTS `coupon_restrict` (
  `restrict_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `coupon_restrict` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`restrict_id`),
  KEY `idx_coup_id_prod_id_zen` (`coupon_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type` char(1) NOT NULL DEFAULT 'F',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_minimum_order` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_start_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_expire_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `uses_per_coupon` int(5) NOT NULL DEFAULT '1',
  `uses_per_user` int(5) NOT NULL DEFAULT '0',
  `restrict_to_products` varchar(255) DEFAULT NULL,
  `restrict_to_categories` varchar(255) DEFAULT NULL,
  `restrict_to_customers` text,
  `coupon_active` char(1) NOT NULL DEFAULT 'Y',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_zone_restriction` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`),
  KEY `idx_active_type_zen` (`coupon_active`,`coupon_type`),
  KEY `idx_coupon_code_zen` (`coupon_code`),
  KEY `idx_coupon_type_zen` (`coupon_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `coupons_description`
--

DROP TABLE IF EXISTS `coupons_description`;
CREATE TABLE IF NOT EXISTS `coupons_description` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(32) NOT NULL DEFAULT '',
  `coupon_description` text,
  PRIMARY KEY (`coupon_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `code` char(3) NOT NULL DEFAULT '',
  `symbol_left` varchar(24) DEFAULT NULL,
  `symbol_right` varchar(24) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`currencies_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_point`, `thousands_point`, `decimal_places`, `value`, `last_updated`) VALUES
(1, 'US Dollar', 'USD', '$', '', '.', ',', '2', 1.00000000, '2012-11-16 15:52:06'),
(2, 'Euro', 'EUR', '&euro;', '', '.', ',', '2', 0.77300000, '2012-11-16 15:52:06'),
(3, 'GB Pound', 'GBP', '&pound;', '', '.', ',', '2', 0.67259997, '2012-11-16 15:52:06'),
(4, 'Canadian Dollar', 'CAD', '$', '', '.', ',', '2', 1.10420001, '2012-11-16 15:52:06'),
(5, 'Australian Dollar', 'AUD', '$', '', '.', ',', '2', 1.17890000, '2012-11-16 15:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(1) NOT NULL DEFAULT '',
  `customers_firstname` varchar(32) NOT NULL DEFAULT '',
  `customers_lastname` varchar(32) NOT NULL DEFAULT '',
  `customers_dob` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_nick` varchar(96) NOT NULL DEFAULT '',
  `customers_default_address_id` int(11) NOT NULL DEFAULT '0',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_fax` varchar(32) DEFAULT NULL,
  `customers_password` varchar(40) NOT NULL DEFAULT '',
  `customers_newsletter` char(1) DEFAULT NULL,
  `customers_group_pricing` int(11) NOT NULL DEFAULT '0',
  `customers_email_format` varchar(4) NOT NULL DEFAULT 'TEXT',
  `customers_authorization` int(1) NOT NULL DEFAULT '0',
  `customers_referral` varchar(32) NOT NULL DEFAULT '',
  `customers_paypal_payerid` varchar(20) NOT NULL DEFAULT '',
  `customers_paypal_ec` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`customers_id`),
  KEY `idx_email_address_zen` (`customers_email_address`),
  KEY `idx_referral_zen` (`customers_referral`(10)),
  KEY `idx_grp_pricing_zen` (`customers_group_pricing`),
  KEY `idx_nick_zen` (`customers_nick`),
  KEY `idx_newsletter_zen` (`customers_newsletter`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customers_id`, `customers_gender`, `customers_firstname`, `customers_lastname`, `customers_dob`, `customers_email_address`, `customers_nick`, `customers_default_address_id`, `customers_telephone`, `customers_fax`, `customers_password`, `customers_newsletter`, `customers_group_pricing`, `customers_email_format`, `customers_authorization`, `customers_referral`, `customers_paypal_payerid`, `customers_paypal_ec`) VALUES
(1, 'f', 'test', 'test', '1990-01-01 00:00:00', 'test@test.com', '', 1, '11111111', '', '81912da82e9561b0a74be4e2815c686e:7a', '0', 0, 'TEXT', 0, '', '', 0),
(2, 'm', 'johnny', 'ma', '1970-05-21 00:00:00', 'johnny@test.com', '', 2, '15912342234', '', 'c00bd431e1fa8ff2cfa27f55c0ad178e:ef', '0', 0, 'TEXT', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket`
--

DROP TABLE IF EXISTS `customers_basket`;
CREATE TABLE IF NOT EXISTS `customers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` float NOT NULL DEFAULT '0',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `customers_basket_date_added` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket_attributes`
--

DROP TABLE IF EXISTS `customers_basket_attributes`;
CREATE TABLE IF NOT EXISTS `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `products_options_id` varchar(64) NOT NULL DEFAULT '0',
  `products_options_value_id` int(11) NOT NULL DEFAULT '0',
  `products_options_value_text` blob,
  `products_options_sort_order` text NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_cust_id_prod_id_zen` (`customers_id`,`products_id`(36))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customers_info`
--

DROP TABLE IF EXISTS `customers_info`;
CREATE TABLE IF NOT EXISTS `customers_info` (
  `customers_info_id` int(11) NOT NULL DEFAULT '0',
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0',
  PRIMARY KEY (`customers_info_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers_info`
--

INSERT INTO `customers_info` (`customers_info_id`, `customers_info_date_of_last_logon`, `customers_info_number_of_logons`, `customers_info_date_account_created`, `customers_info_date_account_last_modified`, `global_product_notifications`) VALUES
(1, '2012-11-22 15:39:26', 4, '2012-11-16 17:21:06', '2012-11-19 11:06:08', 0),
(2, '2012-11-19 15:09:07', 1, '2012-11-19 15:09:07', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `db_cache`
--

DROP TABLE IF EXISTS `db_cache`;
CREATE TABLE IF NOT EXISTS `db_cache` (
  `cache_entry_name` varchar(64) NOT NULL DEFAULT '',
  `cache_data` mediumblob,
  `cache_entry_created` int(15) DEFAULT NULL,
  PRIMARY KEY (`cache_entry_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_archive`
--

DROP TABLE IF EXISTS `email_archive`;
CREATE TABLE IF NOT EXISTS `email_archive` (
  `archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_to_name` varchar(96) NOT NULL DEFAULT '',
  `email_to_address` varchar(96) NOT NULL DEFAULT '',
  `email_from_name` varchar(96) NOT NULL DEFAULT '',
  `email_from_address` varchar(96) NOT NULL DEFAULT '',
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_html` text NOT NULL,
  `email_text` text NOT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `module` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`archive_id`),
  KEY `idx_email_to_address_zen` (`email_to_address`),
  KEY `idx_module_zen` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ezpages`
--

DROP TABLE IF EXISTS `ezpages`;
CREATE TABLE IF NOT EXISTS `ezpages` (
  `pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) NOT NULL DEFAULT '',
  `alt_url` varchar(255) NOT NULL DEFAULT '',
  `alt_url_external` varchar(255) NOT NULL DEFAULT '',
  `pages_html_text` mediumtext,
  `status_header` int(1) NOT NULL DEFAULT '1',
  `status_sidebox` int(1) NOT NULL DEFAULT '1',
  `status_footer` int(1) NOT NULL DEFAULT '1',
  `status_toc` int(1) NOT NULL DEFAULT '1',
  `header_sort_order` int(3) NOT NULL DEFAULT '0',
  `sidebox_sort_order` int(3) NOT NULL DEFAULT '0',
  `footer_sort_order` int(3) NOT NULL DEFAULT '0',
  `toc_sort_order` int(3) NOT NULL DEFAULT '0',
  `page_open_new_window` int(1) NOT NULL DEFAULT '0',
  `page_is_ssl` int(1) NOT NULL DEFAULT '0',
  `toc_chapter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `idx_lang_id_zen` (`languages_id`),
  KEY `idx_ezp_status_header_zen` (`status_header`),
  KEY `idx_ezp_status_sidebox_zen` (`status_sidebox`),
  KEY `idx_ezp_status_footer_zen` (`status_footer`),
  KEY `idx_ezp_status_toc_zen` (`status_toc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `featured`
--

DROP TABLE IF EXISTS `featured`;
CREATE TABLE IF NOT EXISTS `featured` (
  `featured_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `featured_date_added` datetime DEFAULT NULL,
  `featured_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `featured_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`featured_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`featured_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `files_uploaded`
--

DROP TABLE IF EXISTS `files_uploaded`;
CREATE TABLE IF NOT EXISTS `files_uploaded` (
  `files_uploaded_id` int(11) NOT NULL AUTO_INCREMENT,
  `sesskey` varchar(32) DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `files_uploaded_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`files_uploaded_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Must always have either a sesskey or customers_id' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `geo_zones`
--

DROP TABLE IF EXISTS `geo_zones`;
CREATE TABLE IF NOT EXISTS `geo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) NOT NULL DEFAULT '',
  `geo_zone_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `geo_zones`
--

INSERT INTO `geo_zones` (`geo_zone_id`, `geo_zone_name`, `geo_zone_description`, `last_modified`, `date_added`) VALUES
(1, 'Florida', 'Florida local sales tax zone', NULL, '2012-11-16 15:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `get_terms_to_filter`
--

DROP TABLE IF EXISTS `get_terms_to_filter`;
CREATE TABLE IF NOT EXISTS `get_terms_to_filter` (
  `get_term_name` varchar(255) NOT NULL DEFAULT '',
  `get_term_table` varchar(64) NOT NULL,
  `get_term_name_field` varchar(64) NOT NULL,
  PRIMARY KEY (`get_term_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `get_terms_to_filter`
--

INSERT INTO `get_terms_to_filter` (`get_term_name`, `get_term_table`, `get_term_name_field`) VALUES
('manufacturers_id', 'TABLE_MANUFACTURERS', 'manufacturers_name'),
('music_genre_id', 'TABLE_MUSIC_GENRE', 'music_genre_name'),
('record_company_id', 'TABLE_RECORD_COMPANY', 'record_company_name');

-- --------------------------------------------------------

--
-- Table structure for table `group_pricing`
--

DROP TABLE IF EXISTS `group_pricing`;
CREATE TABLE IF NOT EXISTS `group_pricing` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `group_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `code` char(2) NOT NULL DEFAULT '',
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `idx_languages_name_zen` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`languages_id`, `name`, `code`, `image`, `directory`, `sort_order`) VALUES
(1, 'English', 'en', 'icon.gif', 'english', 1);

-- --------------------------------------------------------

--
-- Table structure for table `layout_boxes`
--

DROP TABLE IF EXISTS `layout_boxes`;
CREATE TABLE IF NOT EXISTS `layout_boxes` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_template` varchar(64) NOT NULL DEFAULT '',
  `layout_box_name` varchar(64) NOT NULL DEFAULT '',
  `layout_box_status` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_location` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_sort_order` int(11) NOT NULL DEFAULT '0',
  `layout_box_sort_order_single` int(11) NOT NULL DEFAULT '0',
  `layout_box_status_single` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_id`),
  KEY `idx_name_template_zen` (`layout_template`,`layout_box_name`),
  KEY `idx_layout_box_status_zen` (`layout_box_status`),
  KEY `idx_layout_box_sort_order_zen` (`layout_box_sort_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=99 ;

--
-- Dumping data for table `layout_boxes`
--

INSERT INTO `layout_boxes` (`layout_id`, `layout_template`, `layout_box_name`, `layout_box_status`, `layout_box_location`, `layout_box_sort_order`, `layout_box_sort_order_single`, `layout_box_status_single`) VALUES
(1, 'default_template_settings', 'banner_box_all.php', 1, 1, 5, 0, 0),
(2, 'default_template_settings', 'banner_box.php', 1, 0, 300, 1, 127),
(3, 'default_template_settings', 'banner_box2.php', 1, 1, 15, 1, 15),
(4, 'default_template_settings', 'best_sellers.php', 1, 1, 30, 70, 1),
(5, 'default_template_settings', 'categories.php', 1, 0, 10, 10, 1),
(6, 'default_template_settings', 'currencies.php', 0, 1, 80, 60, 0),
(7, 'default_template_settings', 'document_categories.php', 1, 0, 0, 0, 0),
(8, 'default_template_settings', 'ezpages.php', 1, 1, -1, 2, 1),
(9, 'default_template_settings', 'featured.php', 1, 0, 45, 0, 0),
(10, 'default_template_settings', 'information.php', 1, 0, 50, 40, 1),
(11, 'default_template_settings', 'languages.php', 0, 1, 70, 50, 0),
(12, 'default_template_settings', 'manufacturers.php', 1, 0, 30, 20, 1),
(13, 'default_template_settings', 'manufacturer_info.php', 1, 1, 35, 95, 1),
(14, 'default_template_settings', 'more_information.php', 1, 0, 200, 200, 1),
(15, 'default_template_settings', 'music_genres.php', 1, 1, 0, 0, 0),
(16, 'default_template_settings', 'order_history.php', 1, 1, 0, 0, 0),
(17, 'default_template_settings', 'product_notifications.php', 1, 1, 55, 85, 1),
(18, 'default_template_settings', 'record_companies.php', 1, 1, 0, 0, 0),
(19, 'default_template_settings', 'reviews.php', 1, 0, 40, 0, 0),
(20, 'default_template_settings', 'search.php', 1, 1, 10, 0, 0),
(21, 'default_template_settings', 'search_header.php', 0, 0, 0, 0, 1),
(22, 'default_template_settings', 'shopping_cart.php', 1, 1, 20, 30, 1),
(23, 'default_template_settings', 'specials.php', 1, 1, 45, 0, 0),
(24, 'default_template_settings', 'whats_new.php', 1, 0, 20, 0, 0),
(25, 'default_template_settings', 'whos_online.php', 1, 1, 200, 200, 1),
(26, 'template_default', 'banner_box_all.php', 1, 1, 5, 0, 0),
(27, 'template_default', 'banner_box.php', 1, 0, 300, 1, 127),
(28, 'template_default', 'banner_box2.php', 1, 1, 15, 1, 15),
(29, 'template_default', 'best_sellers.php', 1, 1, 30, 70, 1),
(30, 'template_default', 'categories.php', 1, 0, 10, 10, 1),
(31, 'template_default', 'currencies.php', 0, 1, 80, 60, 0),
(32, 'template_default', 'ezpages.php', 1, 1, -1, 2, 1),
(33, 'template_default', 'featured.php', 1, 0, 45, 0, 0),
(34, 'template_default', 'information.php', 1, 0, 50, 40, 1),
(35, 'template_default', 'languages.php', 0, 1, 70, 50, 0),
(36, 'template_default', 'manufacturers.php', 1, 0, 30, 20, 1),
(37, 'template_default', 'manufacturer_info.php', 1, 1, 35, 95, 1),
(38, 'template_default', 'more_information.php', 1, 0, 200, 200, 1),
(39, 'template_default', 'my_broken_box.php', 1, 0, 0, 0, 0),
(40, 'template_default', 'order_history.php', 1, 1, 0, 0, 0),
(41, 'template_default', 'product_notifications.php', 1, 1, 55, 85, 1),
(42, 'template_default', 'reviews.php', 1, 0, 40, 0, 0),
(43, 'template_default', 'search.php', 1, 1, 10, 0, 0),
(44, 'template_default', 'search_header.php', 0, 0, 0, 0, 1),
(45, 'template_default', 'shopping_cart.php', 1, 1, 20, 30, 1),
(46, 'template_default', 'specials.php', 1, 1, 45, 0, 0),
(47, 'template_default', 'whats_new.php', 1, 0, 20, 0, 0),
(48, 'template_default', 'whos_online.php', 1, 1, 200, 200, 1),
(49, 'classic', 'banner_box.php', 1, 0, 300, 1, 127),
(50, 'classic', 'banner_box2.php', 1, 1, 15, 1, 15),
(51, 'classic', 'banner_box_all.php', 1, 1, 5, 0, 0),
(52, 'classic', 'best_sellers.php', 1, 1, 30, 70, 1),
(53, 'classic', 'categories.php', 1, 0, 10, 10, 1),
(54, 'classic', 'currencies.php', 0, 1, 80, 60, 0),
(55, 'classic', 'document_categories.php', 1, 0, 0, 0, 0),
(56, 'classic', 'ezpages.php', 1, 1, -1, 2, 1),
(57, 'classic', 'featured.php', 1, 0, 45, 0, 0),
(58, 'classic', 'information.php', 1, 0, 50, 40, 1),
(59, 'classic', 'languages.php', 0, 1, 70, 50, 0),
(60, 'classic', 'manufacturers.php', 1, 0, 30, 20, 1),
(61, 'classic', 'manufacturer_info.php', 1, 1, 35, 95, 1),
(62, 'classic', 'more_information.php', 1, 0, 200, 200, 1),
(63, 'classic', 'music_genres.php', 1, 1, 0, 0, 0),
(64, 'classic', 'order_history.php', 1, 1, 0, 0, 0),
(65, 'classic', 'product_notifications.php', 1, 1, 55, 85, 1),
(66, 'classic', 'record_companies.php', 1, 1, 0, 0, 0),
(67, 'classic', 'reviews.php', 1, 0, 40, 0, 0),
(68, 'classic', 'search.php', 1, 1, 10, 0, 0),
(69, 'classic', 'search_header.php', 0, 0, 0, 0, 1),
(70, 'classic', 'shopping_cart.php', 1, 1, 20, 30, 1),
(71, 'classic', 'specials.php', 1, 1, 45, 0, 0),
(72, 'classic', 'whats_new.php', 1, 0, 20, 0, 0),
(73, 'classic', 'whos_online.php', 1, 1, 200, 200, 1),
(74, 'pure_blue', 'banner_box.php', 1, 0, 300, 1, 127),
(75, 'pure_blue', 'banner_box2.php', 1, 1, 15, 1, 15),
(76, 'pure_blue', 'banner_box_all.php', 1, 1, 5, 0, 0),
(77, 'pure_blue', 'best_sellers.php', 1, 1, 30, 70, 1),
(78, 'pure_blue', 'categories.php', 1, 0, 10, 10, 1),
(79, 'pure_blue', 'currencies.php', 0, 1, 80, 60, 0),
(80, 'pure_blue', 'document_categories.php', 1, 0, 0, 0, 0),
(81, 'pure_blue', 'ezpages.php', 1, 1, -1, 2, 1),
(82, 'pure_blue', 'featured.php', 1, 0, 45, 0, 0),
(83, 'pure_blue', 'information.php', 1, 0, 50, 40, 1),
(84, 'pure_blue', 'languages.php', 0, 1, 70, 50, 0),
(85, 'pure_blue', 'manufacturer_info.php', 1, 1, 35, 95, 1),
(86, 'pure_blue', 'manufacturers.php', 1, 0, 30, 20, 1),
(87, 'pure_blue', 'more_information.php', 1, 0, 200, 200, 1),
(88, 'pure_blue', 'music_genres.php', 1, 1, 0, 0, 0),
(89, 'pure_blue', 'order_history.php', 1, 1, 0, 0, 0),
(90, 'pure_blue', 'product_notifications.php', 1, 1, 55, 85, 1),
(91, 'pure_blue', 'record_companies.php', 1, 1, 0, 0, 0),
(92, 'pure_blue', 'reviews.php', 1, 0, 40, 0, 0),
(93, 'pure_blue', 'search.php', 1, 1, 10, 0, 0),
(94, 'pure_blue', 'search_header.php', 0, 0, 0, 0, 1),
(95, 'pure_blue', 'shopping_cart.php', 1, 1, 20, 30, 1),
(96, 'pure_blue', 'specials.php', 1, 1, 45, 0, 0),
(97, 'pure_blue', 'whats_new.php', 1, 0, 20, 0, 0),
(98, 'pure_blue', 'whos_online.php', 1, 1, 200, 200, 1);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE IF NOT EXISTS `manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) NOT NULL DEFAULT '',
  `manufacturers_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `idx_mfg_name_zen` (`manufacturers_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers_info`
--

DROP TABLE IF EXISTS `manufacturers_info`;
CREATE TABLE IF NOT EXISTS `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `media_clips`
--

DROP TABLE IF EXISTS `media_clips`;
CREATE TABLE IF NOT EXISTS `media_clips` (
  `clip_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL DEFAULT '0',
  `clip_type` smallint(6) NOT NULL DEFAULT '0',
  `clip_filename` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`clip_id`),
  KEY `idx_media_id_zen` (`media_id`),
  KEY `idx_clip_type_zen` (`clip_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `media_manager`
--

DROP TABLE IF EXISTS `media_manager`;
CREATE TABLE IF NOT EXISTS `media_manager` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_name` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`media_id`),
  KEY `idx_media_name_zen` (`media_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `media_to_products`
--

DROP TABLE IF EXISTS `media_to_products`;
CREATE TABLE IF NOT EXISTS `media_to_products` (
  `media_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_media_product_zen` (`media_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
CREATE TABLE IF NOT EXISTS `media_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(64) NOT NULL DEFAULT '',
  `type_ext` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_name_zen` (`type_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `media_types`
--

INSERT INTO `media_types` (`type_id`, `type_name`, `type_ext`) VALUES
(1, 'MP3', '.mp3');

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags_categories_description`
--

DROP TABLE IF EXISTS `meta_tags_categories_description`;
CREATE TABLE IF NOT EXISTS `meta_tags_categories_description` (
  `categories_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`categories_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags_products_description`
--

DROP TABLE IF EXISTS `meta_tags_products_description`;
CREATE TABLE IF NOT EXISTS `meta_tags_products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`products_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `music_genre`
--

DROP TABLE IF EXISTS `music_genre`;
CREATE TABLE IF NOT EXISTS `music_genre` (
  `music_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_genre_name` varchar(32) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`music_genre_id`),
  KEY `idx_music_genre_name_zen` (`music_genre_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE IF NOT EXISTS `newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  `module` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `customers_company` varchar(64) DEFAULT NULL,
  `customers_street_address` varchar(64) NOT NULL DEFAULT '',
  `customers_suburb` varchar(32) DEFAULT NULL,
  `customers_city` varchar(32) NOT NULL DEFAULT '',
  `customers_postcode` varchar(10) NOT NULL DEFAULT '',
  `customers_state` varchar(32) DEFAULT NULL,
  `customers_country` varchar(32) NOT NULL DEFAULT '',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_address_format_id` int(5) NOT NULL DEFAULT '0',
  `delivery_name` varchar(64) NOT NULL DEFAULT '',
  `delivery_company` varchar(64) DEFAULT NULL,
  `delivery_street_address` varchar(64) NOT NULL DEFAULT '',
  `delivery_suburb` varchar(32) DEFAULT NULL,
  `delivery_city` varchar(32) NOT NULL DEFAULT '',
  `delivery_postcode` varchar(10) NOT NULL DEFAULT '',
  `delivery_state` varchar(32) DEFAULT NULL,
  `delivery_country` varchar(32) NOT NULL DEFAULT '',
  `delivery_address_format_id` int(5) NOT NULL DEFAULT '0',
  `billing_name` varchar(64) NOT NULL DEFAULT '',
  `billing_company` varchar(64) DEFAULT NULL,
  `billing_street_address` varchar(64) NOT NULL DEFAULT '',
  `billing_suburb` varchar(32) DEFAULT NULL,
  `billing_city` varchar(32) NOT NULL DEFAULT '',
  `billing_postcode` varchar(10) NOT NULL DEFAULT '',
  `billing_state` varchar(32) DEFAULT NULL,
  `billing_country` varchar(32) NOT NULL DEFAULT '',
  `billing_address_format_id` int(5) NOT NULL DEFAULT '0',
  `payment_method` varchar(128) NOT NULL DEFAULT '',
  `payment_module_code` varchar(32) NOT NULL DEFAULT '',
  `shipping_method` varchar(128) NOT NULL DEFAULT '',
  `shipping_module_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(64) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `cc_cvv` blob,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL DEFAULT '0',
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  `order_total` decimal(14,2) DEFAULT NULL,
  `order_tax` decimal(14,2) DEFAULT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(96) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_id`),
  KEY `idx_status_orders_cust_zen` (`orders_status`,`orders_id`,`customers_id`),
  KEY `idx_date_purchased_zen` (`date_purchased`),
  KEY `idx_cust_id_orders_id_zen` (`customers_id`,`orders_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `customers_id`, `customers_name`, `customers_company`, `customers_street_address`, `customers_suburb`, `customers_city`, `customers_postcode`, `customers_state`, `customers_country`, `customers_telephone`, `customers_email_address`, `customers_address_format_id`, `delivery_name`, `delivery_company`, `delivery_street_address`, `delivery_suburb`, `delivery_city`, `delivery_postcode`, `delivery_state`, `delivery_country`, `delivery_address_format_id`, `billing_name`, `billing_company`, `billing_street_address`, `billing_suburb`, `billing_city`, `billing_postcode`, `billing_state`, `billing_country`, `billing_address_format_id`, `payment_method`, `payment_module_code`, `shipping_method`, `shipping_module_code`, `coupon_code`, `cc_type`, `cc_owner`, `cc_number`, `cc_expires`, `cc_cvv`, `last_modified`, `date_purchased`, `orders_status`, `orders_date_finished`, `currency`, `currency_value`, `order_total`, `order_tax`, `paypal_ipn_id`, `ip_address`) VALUES
(1, 1, 'test test', '', 'testtesttesttesttest', 'testtesttesttest', 'testtesttest', '111111', 'testtest', 'China', '11111111', 'test@test.com', 1, 'test test', '', 'testtesttesttesttest', 'testtesttesttest', 'testtesttest', '111111', 'testtest', 'China', 1, 'test test', '', 'testtesttesttesttest', 'testtesttesttest', 'testtesttest', '111111', 'testtest', 'China', 1, 'Check/Money Order', 'moneyorder', 'Store Pickup (Walk In)', 'storepickup', '', '', '', '', '', NULL, '2012-11-19 14:28:44', '2012-11-16 17:25:51', 2, NULL, 'USD', '1.000000', '1220.00', '0.00', 0, '127.0.0.1 - 127.0.0.1'),
(2, 1, 'test test', '', 'testtesttesttesttest', 'testtesttesttest', 'testtesttest', '111111', 'testtest', 'China', '11111111', 'test@test.com', 1, 'test test', '', 'testtesttesttesttest', 'testtesttesttest', 'testtesttest', '111111', 'testtest', 'China', 1, 'test test', '', 'testtesttesttesttest', 'testtesttesttest', 'testtesttest', '111111', 'testtest', 'China', 1, 'Check/Money Order', 'moneyorder', 'Store Pickup (Walk In)', 'storepickup', '', '', '', '', '', NULL, NULL, '2012-11-19 15:05:22', 1, NULL, 'USD', '1.000000', '1220.00', '0.00', 0, '127.0.0.1 - 127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
CREATE TABLE IF NOT EXISTS `orders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_tax` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `products_quantity` float NOT NULL DEFAULT '0',
  `onetime_charges` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`products_id`),
  KEY `idx_prod_id_orders_id_zen` (`products_id`,`orders_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `orders_products`
--

INSERT INTO `orders_products` (`orders_products_id`, `orders_id`, `products_id`, `products_model`, `products_name`, `products_price`, `final_price`, `products_tax`, `products_quantity`, `onetime_charges`, `products_priced_by_attribute`, `product_is_free`, `products_discount_type`, `products_discount_type_from`, `products_prid`) VALUES
(1, 1, 1, '', 'tettttt', '122.0000', '122.0000', '0.0000', 10, '0.0000', 0, 0, 0, 0, '1'),
(2, 2, 1, '', 'shoe', '122.0000', '122.0000', '0.0000', 10, '0.0000', 0, 0, 0, 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `orders_products_attributes`
--

DROP TABLE IF EXISTS `orders_products_attributes`;
CREATE TABLE IF NOT EXISTS `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `products_options` varchar(32) NOT NULL DEFAULT '',
  `products_options_values` text NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`orders_products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products_download`
--

DROP TABLE IF EXISTS `orders_products_download`;
CREATE TABLE IF NOT EXISTS `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_id_zen` (`orders_id`),
  KEY `idx_orders_products_id_zen` (`orders_products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders_status`
--

DROP TABLE IF EXISTS `orders_status`;
CREATE TABLE IF NOT EXISTS `orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name_zen` (`orders_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_status`
--

INSERT INTO `orders_status` (`orders_status_id`, `language_id`, `orders_status_name`) VALUES
(1, 1, 'Pending'),
(2, 1, 'Processing'),
(3, 1, 'Delivered'),
(4, 1, 'Update');

-- --------------------------------------------------------

--
-- Table structure for table `orders_status_history`
--

DROP TABLE IF EXISTS `orders_status_history`;
CREATE TABLE IF NOT EXISTS `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_status_id` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customer_notified` int(1) DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_id_status_id_zen` (`orders_id`,`orders_status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `orders_status_history`
--

INSERT INTO `orders_status_history` (`orders_status_history_id`, `orders_id`, `orders_status_id`, `date_added`, `customer_notified`, `comments`) VALUES
(1, 1, 1, '2012-11-16 17:25:51', 1, 'vfszdgfdsg'),
(2, 1, 3, '2012-11-19 14:28:32', 1, ''),
(3, 1, 4, '2012-11-19 14:28:39', 1, ''),
(4, 1, 2, '2012-11-19 14:28:45', 1, ''),
(5, 2, 1, '2012-11-19 15:05:22', 1, 'qwqwdasdsad');

-- --------------------------------------------------------

--
-- Table structure for table `orders_total`
--

DROP TABLE IF EXISTS `orders_total`;
CREATE TABLE IF NOT EXISTS `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `class` varchar(32) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_ot_orders_id_zen` (`orders_id`),
  KEY `idx_ot_class_zen` (`class`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `orders_total`
--

INSERT INTO `orders_total` (`orders_total_id`, `orders_id`, `title`, `text`, `value`, `class`, `sort_order`) VALUES
(1, 1, 'Sub-Total:', '$1,220.00', '1220.0000', 'ot_subtotal', 100),
(2, 1, 'Store Pickup (Walk In):', '$0.00', '0.0000', 'ot_shipping', 200),
(3, 1, 'Total:', '$1,220.00', '1220.0000', 'ot_total', 999),
(4, 2, 'Sub-Total:', '$1,220.00', '1220.0000', 'ot_subtotal', 100),
(5, 2, 'Store Pickup (Walk In):', '$0.00', '0.0000', 'ot_shipping', 200),
(6, 2, 'Total:', '$1,220.00', '1220.0000', 'ot_total', 999);

-- --------------------------------------------------------

--
-- Table structure for table `paypal`
--

DROP TABLE IF EXISTS `paypal`;
CREATE TABLE IF NOT EXISTS `paypal` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` varchar(6) NOT NULL DEFAULT '',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payment_status`
--

DROP TABLE IF EXISTS `paypal_payment_status`;
CREATE TABLE IF NOT EXISTS `paypal_payment_status` (
  `payment_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_status_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`payment_status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `paypal_payment_status`
--

INSERT INTO `paypal_payment_status` (`payment_status_id`, `payment_status_name`) VALUES
(1, 'Completed'),
(2, 'Pending'),
(3, 'Failed'),
(4, 'Denied'),
(5, 'Refunded'),
(6, 'Canceled_Reversal'),
(7, 'Reversed');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payment_status_history`
--

DROP TABLE IF EXISTS `paypal_payment_status_history`;
CREATE TABLE IF NOT EXISTS `paypal_payment_status_history` (
  `payment_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `txn_id` varchar(64) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(64) NOT NULL DEFAULT '',
  `payment_status` varchar(17) NOT NULL DEFAULT '',
  `pending_reason` varchar(14) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`payment_status_history_id`),
  KEY `idx_paypal_ipn_id_zen` (`paypal_ipn_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_session`
--

DROP TABLE IF EXISTS `paypal_session`;
CREATE TABLE IF NOT EXISTS `paypal_session` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` text NOT NULL,
  `saved_session` mediumblob NOT NULL,
  `expiry` int(17) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_session_id_zen` (`session_id`(36))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_testing`
--

DROP TABLE IF EXISTS `paypal_testing`;
CREATE TABLE IF NOT EXISTS `paypal_testing` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `custom` varchar(255) NOT NULL DEFAULT '',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` decimal(2,1) NOT NULL DEFAULT '0.0',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_music_extra`
--

DROP TABLE IF EXISTS `product_music_extra`;
CREATE TABLE IF NOT EXISTS `product_music_extra` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `music_genre_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_music_genre_id_zen` (`music_genre_id`),
  KEY `idx_artists_id_zen` (`artists_id`),
  KEY `idx_record_company_id_zen` (`record_company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_type_layout`
--

DROP TABLE IF EXISTS `product_type_layout`;
CREATE TABLE IF NOT EXISTS `product_type_layout` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_type_id_sort_order_zen` (`product_type_id`,`sort_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=139 ;

--
-- Dumping data for table `product_type_layout`
--

INSERT INTO `product_type_layout` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `product_type_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(1, 'Show Model Number', 'SHOW_PRODUCT_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 1, 1, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(2, 'Show Weight', 'SHOW_PRODUCT_INFO_WEIGHT', '1', 'Display Weight on Product Info 0= off 1= on', 1, 2, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(3, 'Show Attribute Weight', 'SHOW_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 1, 3, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(4, 'Show Manufacturer', 'SHOW_PRODUCT_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', 1, 4, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(5, 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 1, 5, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(6, 'Show Quantity in Stock', 'SHOW_PRODUCT_INFO_QUANTITY', '1', 'Display Quantity in Stock on Product Info 0= off 1= on', 1, 6, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(7, 'Show Product Reviews Count', 'SHOW_PRODUCT_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 1, 7, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(8, 'Show Product Reviews Button', 'SHOW_PRODUCT_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 1, 8, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(9, 'Show Date Available', 'SHOW_PRODUCT_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 1, 9, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(10, 'Show Date Added', 'SHOW_PRODUCT_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 1, 10, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(11, 'Show Product URL', 'SHOW_PRODUCT_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 1, 11, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(12, 'Show Product Additional Images', 'SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 1, 13, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(13, 'Show Starting At text on Price', 'SHOW_PRODUCT_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 1, 12, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(14, 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', 1, 16, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(15, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 1, 100, NULL, '2012-11-16 15:52:06', '', ''),
(16, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 1, 101, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(17, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 1, 102, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(18, 'Show Model Number', 'SHOW_PRODUCT_MUSIC_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 2, 1, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(19, 'Show Weight', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', 2, 2, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(20, 'Show Attribute Weight', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 2, 3, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(21, 'Show Artist', 'SHOW_PRODUCT_MUSIC_INFO_ARTIST', '1', 'Display Artists Name on Product Info 0= off 1= on', 2, 4, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(22, 'Show Music Genre', 'SHOW_PRODUCT_MUSIC_INFO_GENRE', '1', 'Display Music Genre on Product Info 0= off 1= on', 2, 4, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(23, 'Show Record Company', 'SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY', '1', 'Display Record Company on Product Info 0= off 1= on', 2, 4, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(24, 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_MUSIC_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 2, 5, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(25, 'Show Quantity in Stock', 'SHOW_PRODUCT_MUSIC_INFO_QUANTITY', '0', 'Display Quantity in Stock on Product Info 0= off 1= on', 2, 6, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(26, 'Show Product Reviews Count', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 2, 7, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(27, 'Show Product Reviews Button', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 2, 8, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(28, 'Show Date Available', 'SHOW_PRODUCT_MUSIC_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 2, 9, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(29, 'Show Date Added', 'SHOW_PRODUCT_MUSIC_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 2, 10, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(30, 'Show Starting At text on Price', 'SHOW_PRODUCT_MUSIC_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 2, 12, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(31, 'Show Product Additional Images', 'SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 2, 13, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(32, 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_MUSIC_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', 2, 16, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(33, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 2, 100, NULL, '2012-11-16 15:52:06', '', ''),
(34, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 2, 101, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(35, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 2, 102, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(36, 'Show Product Reviews Count', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 3, 7, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(37, 'Show Product Reviews Button', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 3, 8, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(38, 'Show Date Available', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 3, 9, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(39, 'Show Date Added', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 3, 10, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(40, 'Show Product URL', 'SHOW_DOCUMENT_GENERAL_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 3, 11, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(41, 'Show Product Additional Images', 'SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 3, 13, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(42, 'Show Model Number', 'SHOW_DOCUMENT_PRODUCT_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 4, 1, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(43, 'Show Weight', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', 4, 2, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(44, 'Show Attribute Weight', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 4, 3, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(45, 'Show Manufacturer', 'SHOW_DOCUMENT_PRODUCT_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', 4, 4, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(46, 'Show Quantity in Shopping Cart', 'SHOW_DOCUMENT_PRODUCT_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 4, 5, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(47, 'Show Quantity in Stock', 'SHOW_DOCUMENT_PRODUCT_INFO_QUANTITY', '0', 'Display Quantity in Stock on Product Info 0= off 1= on', 4, 6, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(48, 'Show Product Reviews Count', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 4, 7, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(49, 'Show Product Reviews Button', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 4, 8, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(50, 'Show Date Available', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 4, 9, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(51, 'Show Date Added', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 4, 10, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(52, 'Show Product URL', 'SHOW_DOCUMENT_PRODUCT_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 4, 11, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(53, 'Show Product Additional Images', 'SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 4, 13, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(54, 'Show Starting At text on Price', 'SHOW_DOCUMENT_PRODUCT_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 4, 12, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(55, 'Product Free Shipping Image Status - Catalog', 'SHOW_DOCUMENT_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', 4, 16, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(56, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 4, 100, NULL, '2012-11-16 15:52:06', '', ''),
(57, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 4, 101, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(58, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 4, 102, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(59, 'Show Model Number', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 5, 1, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(60, 'Show Weight', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', 5, 2, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(61, 'Show Attribute Weight', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 5, 3, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(62, 'Show Manufacturer', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', 5, 4, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(63, 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 5, 5, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(64, 'Show Quantity in Stock', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_QUANTITY', '1', 'Display Quantity in Stock on Product Info 0= off 1= on', 5, 6, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(65, 'Show Product Reviews Count', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 5, 7, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(66, 'Show Product Reviews Button', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 5, 8, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(67, 'Show Date Available', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_AVAILABLE', '0', 'Display Date Available on Product Info 0= off 1= on', 5, 9, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(68, 'Show Date Added', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 5, 10, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(69, 'Show Product URL', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 5, 11, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(70, 'Show Product Additional Images', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 5, 13, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(71, 'Show Starting At text on Price', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 5, 12, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(72, 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '1', 'Show the Free Shipping image/text in the catalog?', 5, 16, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(73, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 5, 100, NULL, '2012-11-16 15:52:06', '', ''),
(74, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 5, 101, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(75, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '1', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 5, 102, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(76, 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', 1, 50, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(77, 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', 1, 51, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(78, 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', 1, 52, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(79, 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', 1, 53, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(80, 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', 1, 54, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(81, 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', 2, 50, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(82, 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', 2, 51, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(83, 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', 2, 52, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(84, 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', 2, 53, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(85, 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', 2, 54, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(86, 'Show Metatags Title Default - Document Title', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_STATUS', '1', 'Display Document Title in Meta Tags Title 0= off 1= on', 3, 50, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(87, 'Show Metatags Title Default - Document Name', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Document Name in Meta Tags Title 0= off 1= on', 3, 51, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(88, 'Show Metatags Title Default - Document Tagline', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Document Tagline in Meta Tags Title 0= off 1= on', 3, 54, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(89, 'Show Metatags Title Default - Document Title', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', 'Display Document Title in Meta Tags Title 0= off 1= on', 4, 50, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(90, 'Show Metatags Title Default - Document Name', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Document Name in Meta Tags Title 0= off 1= on', 4, 51, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(91, 'Show Metatags Title Default - Document Model', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', 'Display Document Model in Meta Tags Title 0= off 1= on', 4, 52, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(92, 'Show Metatags Title Default - Document Price', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', 'Display Document Price in Meta Tags Title 0= off 1= on', 4, 53, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(93, 'Show Metatags Title Default - Document Tagline', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Document Tagline in Meta Tags Title 0= off 1= on', 4, 54, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(94, 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', 5, 50, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(95, 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', 5, 51, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(96, 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', 5, 52, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(97, 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', 5, 53, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(98, 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', 5, 54, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(99, 'PRODUCT Attribute is Display Only - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', 'PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 1, 200, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(100, 'PRODUCT Attribute is Free - Default', 'DEFAULT_PRODUCT_ATTRIBUTE_IS_FREE', '1', 'PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 1, 201, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(101, 'PRODUCT Attribute is Default - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DEFAULT', '0', 'PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 1, 202, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(102, 'PRODUCT Attribute is Discounted - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', 'PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 1, 203, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(103, 'PRODUCT Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 1, 204, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(104, 'PRODUCT Attribute is Required - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_REQUIRED', '0', 'PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 1, 205, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(105, 'PRODUCT Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_PRICE_PREFIX', '1', 'PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 1, 206, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(106, 'PRODUCT Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 1, 207, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(107, 'MUSIC Attribute is Display Only - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISPLAY_ONLY', '0', 'MUSIC Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 2, 200, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(108, 'MUSIC Attribute is Free - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTE_IS_FREE', '1', 'MUSIC Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 2, 201, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(109, 'MUSIC Attribute is Default - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DEFAULT', '0', 'MUSIC Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 2, 202, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(110, 'MUSIC Attribute is Discounted - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISCOUNTED', '1', 'MUSIC Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 2, 203, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(111, 'MUSIC Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'MUSIC Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 2, 204, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(112, 'MUSIC Attribute is Required - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_REQUIRED', '0', 'MUSIC Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 2, 205, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(113, 'MUSIC Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_MUSIC_PRICE_PREFIX', '1', 'MUSIC Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 2, 206, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(114, 'MUSIC Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'MUSIC Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 2, 207, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(115, 'DOCUMENT GENERAL Attribute is Display Only - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISPLAY_ONLY', '0', 'DOCUMENT GENERAL Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 3, 200, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(116, 'DOCUMENT GENERAL Attribute is Free - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTE_IS_FREE', '1', 'DOCUMENT GENERAL Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 3, 201, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(117, 'DOCUMENT GENERAL Attribute is Default - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DEFAULT', '0', 'DOCUMENT GENERAL Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 3, 202, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(118, 'DOCUMENT GENERAL Attribute is Discounted - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISCOUNTED', '1', 'DOCUMENT GENERAL Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 3, 203, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(119, 'DOCUMENT GENERAL Attribute is Included in Base Price - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'DOCUMENT GENERAL Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 3, 204, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(120, 'DOCUMENT GENERAL Attribute is Required - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_REQUIRED', '0', 'DOCUMENT GENERAL Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 3, 205, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(121, 'DOCUMENT GENERAL Attribute Price Prefix - Default', 'DEFAULT_DOCUMENT_GENERAL_PRICE_PREFIX', '1', 'DOCUMENT GENERAL Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 3, 206, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(122, 'DOCUMENT GENERAL Attribute Weight Prefix - Default', 'DEFAULT_DOCUMENT_GENERAL_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'DOCUMENT GENERAL Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 3, 207, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(123, 'DOCUMENT PRODUCT Attribute is Display Only - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', 'DOCUMENT PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 4, 200, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(124, 'DOCUMENT PRODUCT Attribute is Free - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTE_IS_FREE', '1', 'DOCUMENT PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 4, 201, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(125, 'DOCUMENT PRODUCT Attribute is Default - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DEFAULT', '0', 'DOCUMENT PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 4, 202, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(126, 'DOCUMENT PRODUCT Attribute is Discounted - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', 'DOCUMENT PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 4, 203, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(127, 'DOCUMENT PRODUCT Attribute is Included in Base Price - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'DOCUMENT PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 4, 204, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(128, 'DOCUMENT PRODUCT Attribute is Required - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_REQUIRED', '0', 'DOCUMENT PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 4, 205, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(129, 'DOCUMENT PRODUCT Attribute Price Prefix - Default', 'DEFAULT_DOCUMENT_PRODUCT_PRICE_PREFIX', '1', 'DOCUMENT PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 4, 206, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(130, 'DOCUMENT PRODUCT Attribute Weight Prefix - Default', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'DOCUMENT PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 4, 207, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(131, 'PRODUCT FREE SHIPPING Attribute is Display Only - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISPLAY_ONLY', '0', 'PRODUCT FREE SHIPPING Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 5, 201, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(132, 'PRODUCT FREE SHIPPING Attribute is Free - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTE_IS_FREE', '1', 'PRODUCT FREE SHIPPING Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 5, 201, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(133, 'PRODUCT FREE SHIPPING Attribute is Default - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DEFAULT', '0', 'PRODUCT FREE SHIPPING Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 5, 202, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(134, 'PRODUCT FREE SHIPPING Attribute is Discounted - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISCOUNTED', '1', 'PRODUCT FREE SHIPPING Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 5, 203, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(135, 'PRODUCT FREE SHIPPING Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'PRODUCT FREE SHIPPING Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 5, 204, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(136, 'PRODUCT FREE SHIPPING Attribute is Required - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_REQUIRED', '0', 'PRODUCT FREE SHIPPING Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 5, 205, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(137, 'PRODUCT FREE SHIPPING Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRICE_PREFIX', '1', 'PRODUCT FREE SHIPPING Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 5, 206, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(138, 'PRODUCT FREE SHIPPING Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'PRODUCT FREE SHIPPING Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 5, 207, NULL, '2012-11-16 15:52:06', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), ');

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

DROP TABLE IF EXISTS `product_types`;
CREATE TABLE IF NOT EXISTS `product_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL DEFAULT '',
  `type_handler` varchar(255) NOT NULL DEFAULT '',
  `type_master_type` int(11) NOT NULL DEFAULT '1',
  `allow_add_to_cart` char(1) NOT NULL DEFAULT 'Y',
  `default_image` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_master_type_zen` (`type_master_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`type_id`, `type_name`, `type_handler`, `type_master_type`, `allow_add_to_cart`, `default_image`, `date_added`, `last_modified`) VALUES
(1, 'Product - General', 'product', 1, 'Y', '', '2012-11-16 15:52:06', '2012-11-16 15:52:06'),
(2, 'Product - Music', 'product_music', 1, 'Y', '', '2012-11-16 15:52:06', '2012-11-16 15:52:06'),
(3, 'Document - General', 'document_general', 3, 'N', '', '2012-11-16 15:52:06', '2012-11-16 15:52:06'),
(4, 'Document - Product', 'document_product', 3, 'Y', '', '2012-11-16 15:52:06', '2012-11-16 15:52:06'),
(5, 'Product - Free Shipping', 'product_free_shipping', 1, 'Y', '', '2012-11-16 15:52:06', '2012-11-16 15:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `product_types_to_category`
--

DROP TABLE IF EXISTS `product_types_to_category`;
CREATE TABLE IF NOT EXISTS `product_types_to_category` (
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_category_id_zen` (`category_id`),
  KEY `idx_product_type_id_zen` (`product_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_type` int(11) NOT NULL DEFAULT '1',
  `products_quantity` float NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_image` varchar(64) DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `products_date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` float NOT NULL DEFAULT '0',
  `products_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_tax_class_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` float NOT NULL DEFAULT '0',
  `products_quantity_order_min` float NOT NULL DEFAULT '1',
  `products_quantity_order_units` float NOT NULL DEFAULT '1',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_call` tinyint(1) NOT NULL DEFAULT '0',
  `products_quantity_mixed` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_always_free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `products_qty_box_status` tinyint(1) NOT NULL DEFAULT '1',
  `products_quantity_order_max` float NOT NULL DEFAULT '0',
  `products_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_price_sorter` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `master_categories_id` int(11) NOT NULL DEFAULT '0',
  `products_mixed_discount_quantity` tinyint(1) NOT NULL DEFAULT '1',
  `metatags_title_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_products_name_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_model_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_price_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_title_tagline_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_products_date_added_zen` (`products_date_added`),
  KEY `idx_products_status_zen` (`products_status`),
  KEY `idx_products_date_available_zen` (`products_date_available`),
  KEY `idx_products_ordered_zen` (`products_ordered`),
  KEY `idx_products_model_zen` (`products_model`),
  KEY `idx_products_price_sorter_zen` (`products_price_sorter`),
  KEY `idx_master_categories_id_zen` (`master_categories_id`),
  KEY `idx_products_sort_order_zen` (`products_sort_order`),
  KEY `idx_manufacturers_id_zen` (`manufacturers_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`products_id`, `products_type`, `products_quantity`, `products_model`, `products_image`, `products_price`, `products_virtual`, `products_date_added`, `products_last_modified`, `products_date_available`, `products_weight`, `products_status`, `products_tax_class_id`, `manufacturers_id`, `products_ordered`, `products_quantity_order_min`, `products_quantity_order_units`, `products_priced_by_attribute`, `product_is_free`, `product_is_call`, `products_quantity_mixed`, `product_is_always_free_shipping`, `products_qty_box_status`, `products_quantity_order_max`, `products_sort_order`, `products_discount_type`, `products_discount_type_from`, `products_price_sorter`, `master_categories_id`, `products_mixed_discount_quantity`, `metatags_title_status`, `metatags_products_name_status`, `metatags_model_status`, `metatags_price_status`, `metatags_title_tagline_status`) VALUES
(1, 1, 1090, '', 'Penguins.jpg', '122.0000', 0, '2012-11-16 16:53:42', '2012-11-19 14:08:18', '2012-11-30 00:00:00', 10, 1, 1, 0, 20, 1, 1, 0, 0, 0, 1, 0, 1, 10, 0, 0, 0, '122.0000', 1, 1, 0, 0, 0, 0, 0),
(2, 1, 1110, '', '', '12.0000', 0, '2012-11-22 15:34:33', '2012-11-22 15:36:28', '2012-11-30 00:00:00', 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 101, 0, 0, 0, '0.0000', 3, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

DROP TABLE IF EXISTS `products_attributes`;
CREATE TABLE IF NOT EXISTS `products_attributes` (
  `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `options_id` int(11) NOT NULL DEFAULT '0',
  `options_values_id` int(11) NOT NULL DEFAULT '0',
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_display_only` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_default` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_image` varchar(64) DEFAULT NULL,
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `attributes_required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`),
  KEY `idx_id_options_id_values_zen` (`products_id`,`options_id`,`options_values_id`),
  KEY `idx_opt_sort_order_zen` (`products_options_sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes_download`
--

DROP TABLE IF EXISTS `products_attributes_download`;
CREATE TABLE IF NOT EXISTS `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL DEFAULT '0',
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products_description`
--

DROP TABLE IF EXISTS `products_description`;
CREATE TABLE IF NOT EXISTS `products_description` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_description` text,
  `products_url` varchar(255) DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `idx_products_name_zen` (`products_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `products_description`
--

INSERT INTO `products_description` (`products_id`, `language_id`, `products_name`, `products_description`, `products_url`, `products_viewed`) VALUES
(1, 1, 'shoe', 'ere are some suggestions, assuming you''re running the latest-released version of Zen Cart:\r\n\r\n1. Turn off Category Counts, especially if you have a large number of categories.\r\na. Admin->Config->My Store->Show Category Counts=false\r\nb. Admin->Config->My Store->Show Category Counts-Admin = false\r\n(this second one is for admin-area only when editing catalog)\r\n\r\n2. Disable the Manufacturers sidebox if you don''t need it.\r\nAdmin->Tools->Layout Boxes Controller\r\n- find the sideboxes/manufacturers.php entry, and turn it "OFF"\r\n\r\n3. Ensure your images are optimized for your site... specifically, use small images for thumbnails, slightly larger for product pages ("_MED" images), and large detailed images for "click to enlarge" ("_LRG") images.', '', 22),
(2, 1, '植物大战僵尸', '', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `products_discount_quantity`
--

DROP TABLE IF EXISTS `products_discount_quantity`;
CREATE TABLE IF NOT EXISTS `products_discount_quantity` (
  `discount_id` int(4) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `discount_qty` float NOT NULL DEFAULT '0',
  `discount_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  KEY `idx_id_qty_zen` (`products_id`,`discount_qty`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products_notifications`
--

DROP TABLE IF EXISTS `products_notifications`;
CREATE TABLE IF NOT EXISTS `products_notifications` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_notifications`
--

INSERT INTO `products_notifications` (`products_id`, `customers_id`, `date_added`) VALUES
(1, 1, '2012-11-16 17:25:58');

-- --------------------------------------------------------

--
-- Table structure for table `products_options`
--

DROP TABLE IF EXISTS `products_options`;
CREATE TABLE IF NOT EXISTS `products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_options_type` int(5) NOT NULL DEFAULT '0',
  `products_options_length` smallint(2) NOT NULL DEFAULT '32',
  `products_options_comment` varchar(64) DEFAULT NULL,
  `products_options_size` smallint(2) NOT NULL DEFAULT '32',
  `products_options_images_per_row` int(2) DEFAULT '5',
  `products_options_images_style` int(1) DEFAULT '0',
  `products_options_rows` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`products_options_id`,`language_id`),
  KEY `idx_lang_id_zen` (`language_id`),
  KEY `idx_products_options_sort_order_zen` (`products_options_sort_order`),
  KEY `idx_products_options_name_zen` (`products_options_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products_options_types`
--

DROP TABLE IF EXISTS `products_options_types`;
CREATE TABLE IF NOT EXISTS `products_options_types` (
  `products_options_types_id` int(11) NOT NULL DEFAULT '0',
  `products_options_types_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`products_options_types_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Track products_options_types';

--
-- Dumping data for table `products_options_types`
--

INSERT INTO `products_options_types` (`products_options_types_id`, `products_options_types_name`) VALUES
(0, 'Dropdown'),
(1, 'Text'),
(2, 'Radio'),
(3, 'Checkbox'),
(4, 'File'),
(5, 'Read Only');

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values`
--

DROP TABLE IF EXISTS `products_options_values`;
CREATE TABLE IF NOT EXISTS `products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) NOT NULL DEFAULT '',
  `products_options_values_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_id`,`language_id`),
  KEY `idx_products_options_values_name_zen` (`products_options_values_name`),
  KEY `idx_products_options_values_sort_order_zen` (`products_options_values_sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_options_values`
--

INSERT INTO `products_options_values` (`products_options_values_id`, `language_id`, `products_options_values_name`, `products_options_values_sort_order`) VALUES
(0, 1, 'TEXT', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values_to_products_options`
--

DROP TABLE IF EXISTS `products_options_values_to_products_options`;
CREATE TABLE IF NOT EXISTS `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_to_products_options_id`),
  KEY `idx_products_options_id_zen` (`products_options_id`),
  KEY `idx_products_options_values_id_zen` (`products_options_values_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products_to_categories`
--

DROP TABLE IF EXISTS `products_to_categories`;
CREATE TABLE IF NOT EXISTS `products_to_categories` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `categories_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`,`categories_id`),
  KEY `idx_cat_prod_id_zen` (`categories_id`,`products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_to_categories`
--

INSERT INTO `products_to_categories` (`products_id`, `categories_id`) VALUES
(1, 1),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `project_version`
--

DROP TABLE IF EXISTS `project_version`;
CREATE TABLE IF NOT EXISTS `project_version` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`),
  UNIQUE KEY `idx_project_version_key_zen` (`project_version_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `project_version`
--

INSERT INTO `project_version` (`project_version_id`, `project_version_key`, `project_version_major`, `project_version_minor`, `project_version_patch1`, `project_version_patch2`, `project_version_patch1_source`, `project_version_patch2_source`, `project_version_comment`, `project_version_date_applied`) VALUES
(1, 'Zen-Cart Main', '1', '5.1', '', '', '', '', 'New Installation', '2012-11-16 15:52:06'),
(2, 'Zen-Cart Database', '1', '5.1', '', '', '', '', 'New Installation', '2012-11-16 15:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `project_version_history`
--

DROP TABLE IF EXISTS `project_version_history`;
CREATE TABLE IF NOT EXISTS `project_version_history` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking History' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `project_version_history`
--

INSERT INTO `project_version_history` (`project_version_id`, `project_version_key`, `project_version_major`, `project_version_minor`, `project_version_patch`, `project_version_comment`, `project_version_date_applied`) VALUES
(1, 'Zen-Cart Main', '1', '5.1', '', 'New Installation', '2012-11-16 15:52:06'),
(2, 'Zen-Cart Database', '1', '5.1', '', 'New Installation', '2012-11-16 15:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `query_builder`
--

DROP TABLE IF EXISTS `query_builder`;
CREATE TABLE IF NOT EXISTS `query_builder` (
  `query_id` int(11) NOT NULL AUTO_INCREMENT,
  `query_category` varchar(40) NOT NULL DEFAULT '',
  `query_name` varchar(80) NOT NULL DEFAULT '',
  `query_description` text NOT NULL,
  `query_string` text NOT NULL,
  `query_keys_list` text NOT NULL,
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `query_name` (`query_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores queries for re-use in Admin email and report modules' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `query_builder`
--

INSERT INTO `query_builder` (`query_id`, `query_category`, `query_name`, `query_description`, `query_string`, `query_keys_list`) VALUES
(1, 'email', 'All Customers', 'Returns all customers name and email address for sending mass emails (ie: for newsletters, coupons, GVs, messages, etc).', 'select customers_email_address, customers_firstname, customers_lastname from TABLE_CUSTOMERS order by customers_lastname, customers_firstname, customers_email_address', ''),
(2, 'email,newsletters', 'All Newsletter Subscribers', 'Returns name and email address of newsletter subscribers', 'select customers_firstname, customers_lastname, customers_email_address from TABLE_CUSTOMERS where customers_newsletter = ''1''', ''),
(3, 'email,newsletters', 'Dormant Customers (>3months) (Subscribers)', 'Subscribers who HAVE purchased something, but have NOT purchased for at least three months.', 'select o.date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC', ''),
(4, 'email,newsletters', 'Active customers in past 3 months (Subscribers)', 'Newsletter subscribers who are also active customers (purchased something) in last 3 months.', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o where c.customers_newsletter = ''1'' AND c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', ''),
(5, 'email,newsletters', 'Active customers in past 3 months (Regardless of subscription status)', 'All active customers (purchased something) in last 3 months, ignoring newsletter-subscription status.', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', ''),
(6, 'email,newsletters', 'Administrator', 'Just the email account of the current administrator', 'select ''ADMIN'' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id', ''),
(7, 'email,newsletters', 'Customers who have never completed a purchase', 'For sending newsletter to all customers who registered but have never completed a purchase', 'SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL', '');

-- --------------------------------------------------------

--
-- Table structure for table `record_artists`
--

DROP TABLE IF EXISTS `record_artists`;
CREATE TABLE IF NOT EXISTS `record_artists` (
  `artists_id` int(11) NOT NULL AUTO_INCREMENT,
  `artists_name` varchar(32) NOT NULL DEFAULT '',
  `artists_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`),
  KEY `idx_rec_artists_name_zen` (`artists_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `record_artists_info`
--

DROP TABLE IF EXISTS `record_artists_info`;
CREATE TABLE IF NOT EXISTS `record_artists_info` (
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `artists_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `record_company`
--

DROP TABLE IF EXISTS `record_company`;
CREATE TABLE IF NOT EXISTS `record_company` (
  `record_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_company_name` varchar(32) NOT NULL DEFAULT '',
  `record_company_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`),
  KEY `idx_rec_company_name_zen` (`record_company_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `record_company_info`
--

DROP TABLE IF EXISTS `record_company_info`;
CREATE TABLE IF NOT EXISTS `record_company_info` (
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `record_company_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_customers_id_zen` (`customers_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_date_added_zen` (`date_added`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reviews_description`
--

DROP TABLE IF EXISTS `reviews_description`;
CREATE TABLE IF NOT EXISTS `reviews_description` (
  `reviews_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `reviews_text` text NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salemaker_sales`
--

DROP TABLE IF EXISTS `salemaker_sales`;
CREATE TABLE IF NOT EXISTS `salemaker_sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_status` tinyint(4) NOT NULL DEFAULT '0',
  `sale_name` varchar(30) NOT NULL DEFAULT '',
  `sale_deduction_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_deduction_type` tinyint(4) NOT NULL DEFAULT '0',
  `sale_pricerange_from` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_pricerange_to` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_specials_condition` tinyint(4) NOT NULL DEFAULT '0',
  `sale_categories_selected` text,
  `sale_categories_all` text,
  `sale_date_start` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_end` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_added` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_last_modified` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_status_change` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`sale_id`),
  KEY `idx_sale_status_zen` (`sale_status`),
  KEY `idx_sale_date_start_zen` (`sale_date_start`),
  KEY `idx_sale_date_end_zen` (`sale_date_end`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `sesskey` varchar(64) NOT NULL DEFAULT '',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `value` mediumblob NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('j3jg28afm03hg07etd0da0l402', 1353571281, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a6a4f4445784f4759784d446b324e7a686d59325a6b4e7a41774f4751785954426b4e6d51344d4746694e5349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a41366533317a4f6a6736496e4e755958427a61473930496a74684f6a413665333139),
('2830gi9ehnknqiur8hv3a3ehv3', 1353571254, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949324d7a6b785a44566b4e4467785a6d49345a446b354e4463314f5755314e446b305a544a684f54426d597949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a41366533317a4f6a6736496e4e755958427a61473930496a74684f6a413665333139),
('r1mdjof4cigq4ffhh9fnfjpa52', 1353571254, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f69493359324a6a4e7a6b344d4468684d5452684d4467354e6d55774d6d466a4d57566b5a474a684e444a695a6949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f344f694a306157316c5832393164434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f3245364d547037637a6f314f694a365a5735705a434937637a6f794e6a6f694d6a677a4d4764704f57566f626d747563576c31636a686f646a4e684d32566f646a4d694f33317a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('jutn1c3sq6corn2c643d5qac65', 1353571257, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a6a5a6a5934595755314e6a526b4e444e684e7a68694d6a4d305954597a4f47457a4f5441354f5749774e6949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('qvv1n7cfta0705rtoa8ddtsb42', 1353571271, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a6859574a6c4e5759784e3256694e546469595759334d324d31597a686a596a4d795a4759315954566a4d6949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f784d6a6f6963484a765a48566a64484e66626d5633496a747a4f6a5136496d31765a4755694f334d364e6a6f69546b394f55314e4d496a747a4f6a4d36496d646c64434937637a6f774f6949694f334d364e446f696347397a6443493759546f774f6e74396658317a4f6a6736496e4e755958427a61473930496a74684f6a4136653331395932686c59327466646d467361575238637a6f304f694a30636e566c496a74735957356e6457466e5a58787a4f6a6336496d56755a327870633267694f327868626d64315957646c633139705a48787a4f6a4536496a45694f327868626d64315957646c6331396a6232526c66484d364d6a6f695a5734694f324e31636e4a6c626d4e3566484d364d7a6f6956564e45496a743062325268655639706333787a4f6a45774f6949794d4445794c5445784c544979496a7431634752686447564665484270636d463061573975633378694f6a45376332567a63326c76626c396a6233567564475679664749364d54746a64584e306232316c636e4e66615842665957526b636d567a6333787a4f6a6b36496a45794e7934774c6a41754d534937),
('jesmajdh6cska1v7287qjcfkj1', 1353571129, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949784d5463784f444d774e6a63784e4463354f54686c4d574d314e544e6d596a59344e6a426b4e54646b5a4349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f784d6a6f6963484a765a48566a64463970626d5a76496a747a4f6a5136496d31765a4755694f334d364e6a6f69546b394f55314e4d496a747a4f6a4d36496d646c6443493759546f7a4f6e747a4f6a5536496d4e515958526f496a747a4f6a4536496a45694f334d364d544536496e4279623252315933527a58326c6b496a747a4f6a4536496a45694f334d364e546f69656d5675615751694f334d364d6a5936496d787a61445675626e56774d48466c4d4856694d574a725a47316f63574e754e477733496a7439637a6f304f694a7762334e30496a74684f6a41366533313966584d364f446f696332356863484e6f623351694f3245364e447037637a6f304f694a775957646c496a747a4f6a45794f694a77636d396b64574e3058326c755a6d38694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a74684f6a4d3665334d364e546f6959314268644767694f334d364d546f694d534937637a6f784d546f6963484a765a48566a64484e66615751694f334d364d546f694d534937637a6f314f694a365a5735705a434937637a6f794e6a6f6962484e6f4e573575645841776357557764574978596d746b6257687859323430624463694f33317a4f6a5136496e4276633351694f3245364d447037665831395932686c59327466646d467361575238637a6f304f694a30636e566c496a74735957356e6457466e5a58787a4f6a6336496d56755a327870633267694f327868626d64315957646c633139705a48787a4f6a4536496a45694f327868626d64315957646c6331396a6232526c66484d364d6a6f695a5734694f324e31636e4a6c626d4e3566484d364d7a6f6956564e45496a743062325268655639706333787a4f6a45774f6949794d4445794c5445784c544979496a7431634752686447564665484270636d463061573975633378694f6a45376332567a63326c76626c396a6233567564475679664749364d54746a64584e306232316c636e4e66615842665957526b636d567a6333787a4f6a6b36496a45794e7934774c6a41754d534937),
('nt6qq7ooapmfgqkhrbtd2a61d5', 1353571132, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949314e444d304f5445784f544d774e446c6d593249345a6a466c596d4d794d5449335a4467774e5451334d7949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('olf692cpk57cdh5d27hstn64g5', 1353571284, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a6d59574d774d6a63795a6d526c4d6d4932597a457a5a6a466c4f4759304e6a6b354d5463774f574d774e6949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f784d6a6f6963484a765a48566a64484e66626d5633496a747a4f6a5136496d31765a4755694f334d364e6a6f69546b394f55314e4d496a747a4f6a4d36496d646c64434937637a6f774f6949694f334d364e446f696347397a6443493759546f774f6e74396658317a4f6a6736496e4e755958427a61473930496a74684f6a4136653331395932686c59327466646d467361575238637a6f304f694a30636e566c496a74735957356e6457466e5a58787a4f6a6336496d56755a327870633267694f327868626d64315957646c633139705a48787a4f6a4536496a45694f327868626d64315957646c6331396a6232526c66484d364d6a6f695a5734694f324e31636e4a6c626d4e3566484d364d7a6f6956564e45496a743062325268655639706333787a4f6a45774f6949794d4445794c5445784c544979496a7431634752686447564665484270636d463061573975633378694f6a45376332567a63326c76626c396a6233567564475679664749364d54746a64584e306232316c636e4e66615842665957526b636d567a6333787a4f6a6b36496a45794e7934774c6a41754d534937),
('8j1h3fe92ik218sdki8oqljjr4', 1353570866, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949795a6a59785a4445794d7a64694d444268596d5668596d4e6b4e544e695a5759334e6a49314d5749304e5349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f344f694a306157316c5832393164434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f3245364d547037637a6f314f694a365a5735705a434937637a6f794e6a6f6961574e78645778774d334d775a32396e5a3235734d585271636e4930645767354d7a45694f33317a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('852ac1i7ptpj2im3h0983i3p16', 1353571183, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a694d7a55324f4449344d6a5a694f4751334d574a6c4d7a4a6c5a544978596a45775a545669596d4d335a4349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('icqulp3s0goggnl1tjrr4uh931', 1353570866, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a684e6a5a6c4d6a6b314e3255325954526c4d5459774f474d314d6d55304e4441304f47457a5a4755795a6949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a41366533317a4f6a6736496e4e755958427a61473930496a74684f6a413665333139),
('ohg7oufqvfivtnpnq5uu2uk7m6', 1353571172, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a6d4d3259304f4467314e7a41344d546c6b596d51324f474e6b5a544a6c4d6a566b5a6d4a694d6d5a6a597949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('upecirdb4g6nf8bgpojguhcor0', 1353571174, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a684e444e6d4d6d59354f54526a4e6a593459544669596d59324e5755355a6a59354d44557a596a59334e7949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('htmk7hs840t1jop567u52rcch2', 1353571175, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f69493459324d7a4d474e695a57526c4e6d49305a6a55795a5756684d6d566b5a5749794e6d45335a6a4e6b4d5349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('n072lfc5tij3i1rjuph485o6q6', 1353571177, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949774e474e685a4449345a4451314e5759794d7a4a6d4d5441334d574e6b4f444178596a4d345a444d324e7949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f784d6a6f6963484a765a48566a64463970626d5a76496a747a4f6a5136496d31765a4755694f334d364e6a6f69546b394f55314e4d496a747a4f6a4d36496d646c6443493759546f7a4f6e747a4f6a5536496d4e515958526f496a747a4f6a4536496a4d694f334d364d544536496e4279623252315933527a58326c6b496a747a4f6a4536496a49694f334d364e546f69656d5675615751694f334d364d6a5936496d68306257733361484d344e4442304d577076634455324e3355314d6e4a6a59326779496a7439637a6f304f694a7762334e30496a74684f6a41366533313966584d364f446f696332356863484e6f623351694f3245364e447037637a6f304f694a775957646c496a747a4f6a45794f694a77636d396b64574e3058326c755a6d38694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a74684f6a4d3665334d364e546f6959314268644767694f334d364d546f694d794937637a6f784d546f6963484a765a48566a64484e66615751694f334d364d546f694d694937637a6f314f694a365a5735705a434937637a6f794e6a6f6961485274617a646f637a67304d485178616d39774e54593364545579636d4e6a614449694f33317a4f6a5136496e4276633351694f3245364d447037665831395932686c59327466646d467361575238637a6f304f694a30636e566c496a74735957356e6457466e5a58787a4f6a6336496d56755a327870633267694f327868626d64315957646c633139705a48787a4f6a4536496a45694f327868626d64315957646c6331396a6232526c66484d364d6a6f695a5734694f324e31636e4a6c626d4e3566484d364d7a6f6956564e45496a743062325268655639706333787a4f6a45774f6949794d4445794c5445784c544979496a7431634752686447564665484270636d463061573975633378694f6a45376332567a63326c76626c396a6233567564475679664749364d54746a64584e306232316c636e4e66615842665957526b636d567a6333787a4f6a6b36496a45794e7934774c6a41754d534937),
('k1mdgj8r8n4b0gv4f9brs9sqa5', 1353571281, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949775a6a63314f57517a4d574d334e7a45784f5441334d5463794f574e6c4d5459795a5745794e3251794f5349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f344f694a306157316c5832393164434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f3245364d547037637a6f314f694a365a5735705a434937637a6f794e6a6f69616a4e715a7a493459575a744d444e6f5a7a41335a58526b4d4752684d4777304d4449694f33317a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('lsh5nnup0qe0ub1bkdmhqcn4l7', 1353571128, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694933596a646c596d4d7a4f474e68597a67794d6d517a4e6a41324d54646d4f444d334e5463344e44426c4e4349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('fq222sjegrj9k4gv6nhc11jsr0', 1353571125, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a6a4d574d79596d5a694e6a59794f544d345a6a4178596d4d784e4445354d5463785a6a6b314e325a6c5a4349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f784d6a6f6963484a765a48566a64463970626d5a76496a747a4f6a5136496d31765a4755694f334d364e6a6f69546b394f55314e4d496a747a4f6a4d36496d646c6443493759546f7a4f6e747a4f6a5536496d4e515958526f496a747a4f6a4536496a4d694f334d364d544536496e4279623252315933527a58326c6b496a747a4f6a4536496a49694f334d364e546f69656d5675615751694f334d364d6a5936496e5532614442314d57746d62476b344d6a646a5a6a6b774e476f315a7a6878616e4930496a7439637a6f304f694a7762334e30496a74684f6a41366533313966584d364f446f696332356863484e6f623351694f3245364e447037637a6f304f694a775957646c496a747a4f6a45794f694a77636d396b64574e3058326c755a6d38694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a74684f6a4d3665334d364e546f6959314268644767694f334d364d546f694d794937637a6f784d546f6963484a765a48566a64484e66615751694f334d364d546f694d694937637a6f314f694a365a5735705a434937637a6f794e6a6f6964545a6f4d48557861325a73615467794e324e6d4f544130616a566e4f484671636a51694f33317a4f6a5136496e4276633351694f3245364d447037665831395932686c59327466646d467361575238637a6f304f694a30636e566c496a74735957356e6457466e5a58787a4f6a6336496d56755a327870633267694f327868626d64315957646c633139705a48787a4f6a4536496a45694f327868626d64315957646c6331396a6232526c66484d364d6a6f695a5734694f324e31636e4a6c626d4e3566484d364d7a6f6956564e45496a743062325268655639706333787a4f6a45774f6949794d4445794c5445784c544979496a7431634752686447564665484270636d463061573975633378694f6a45376332567a63326c76626c396a6233567564475679664749364d54746a64584e306232316c636e4e66615842665957526b636d567a6333787a4f6a6b36496a45794e7934774c6a41754d534937),
('avokvc0fspdfokelucsd4tgub0', 1353571118, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949774e7a63334f446733593251784e545579597a686b4e7a4133597a55784f474d784e6d55774d6a49354e7949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f344f694a306157316c5832393164434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f3245364d547037637a6f314f694a365a5735705a434937637a6f794e6a6f6961574e78645778774d334d775a32396e5a3235734d585271636e4930645767354d7a45694f33317a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('u6h0u1kfli827cf904j5g8qjr4', 1353571121, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f69497a4d6d526d596a6b335a6a566b4d54646d4e6a4a6c5a6a67304d5445774d4445784e47526c4d4445324d4349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('7n18i7790uo9lc39g935diu485', 1353571240, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949304d3245354d4759784d6a4d784e475a6d4e445530595446694d574e694f544e694e44466a5a6d4e6c4d7949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a41366533317a4f6a6736496e4e755958427a61473930496a74684f6a413665333139),
('6i4dgh7bp1gstb1qunda3hnh96', 1353571240, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949774f44637a4d546b304d6d4e694e5455794d324d324d5467784e3259314d325935596a59305954457a4d4349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f344f694a306157316c5832393164434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f3245364d547037637a6f314f694a365a5735705a434937637a6f794e6a6f694e3234784f476b334e7a6b776457383562474d7a4f5763354d7a566b615855304f4455694f33317a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('r948acvk6qtkak555oel7jl075', 1353571237, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949305a5749324d324d344d6a4d324f544d314d47566d4e54426c5a6d526c596d497759324d774d44566c4e5349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f784d6a6f6963484a765a48566a64463970626d5a76496a747a4f6a5136496d31765a4755694f334d364e6a6f69546b394f55314e4d496a747a4f6a4d36496d646c6443493759546f7a4f6e747a4f6a5536496d4e515958526f496a747a4f6a4536496a4d694f334d364d544536496e4279623252315933527a58326c6b496a747a4f6a4536496a49694f334d364e546f69656d5675615751694f334d364d6a5936496e4e764e5851784d6d4a776354643259326c734e7a417962326b35596e4a724e7a4178496a7439637a6f304f694a7762334e30496a74684f6a41366533313966584d364f446f696332356863484e6f623351694f3245364e447037637a6f304f694a775957646c496a747a4f6a45794f694a77636d396b64574e3058326c755a6d38694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a74684f6a4d3665334d364e546f6959314268644767694f334d364d546f694d794937637a6f784d546f6963484a765a48566a64484e66615751694f334d364d546f694d694937637a6f314f694a365a5735705a434937637a6f794e6a6f696332383164444579596e42784e335a6a615777334d444a7661546c69636d73334d4445694f33317a4f6a5136496e4276633351694f3245364d447037665831395932686c59327466646d467361575238637a6f304f694a30636e566c496a74735957356e6457466e5a58787a4f6a6336496d56755a327870633267694f327868626d64315957646c633139705a48787a4f6a4536496a45694f327868626d64315957646c6331396a6232526c66484d364d6a6f695a5734694f324e31636e4a6c626d4e3566484d364d7a6f6956564e45496a743062325268655639706333787a4f6a45774f6949794d4445794c5445784c544979496a7431634752686447564665484270636d463061573975633378694f6a45376332567a63326c76626c396a6233567564475679664749364d54746a64584e306232316c636e4e66615842665957526b636d567a6333787a4f6a6b36496a45794e7934774c6a41754d534937),
('k9lptbvij4vjtkebrmj6n7s556', 1353571234, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a6b5a445a6a4d7a6b7a596d4a684e6a493259574d774e7a51334d4441314d6a4d304d47566b4d6a51304d6949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f784d6a6f6963484a765a48566a64463970626d5a76496a747a4f6a5136496d31765a4755694f334d364e6a6f69546b394f55314e4d496a747a4f6a4d36496d646c6443493759546f7a4f6e747a4f6a5536496d4e515958526f496a747a4f6a4536496a4d694f334d364d544536496e4279623252315933527a58326c6b496a747a4f6a4536496a49694f334d364e546f69656d5675615751694f334d364d6a5936496e4e764e5851784d6d4a776354643259326c734e7a417962326b35596e4a724e7a4178496a7439637a6f304f694a7762334e30496a74684f6a41366533313966584d364f446f696332356863484e6f623351694f3245364e447037637a6f304f694a775957646c496a747a4f6a45794f694a77636d396b64574e3058326c755a6d38694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a74684f6a4d3665334d364e546f6959314268644767694f334d364d546f694d794937637a6f784d546f6963484a765a48566a64484e66615751694f334d364d546f694d694937637a6f314f694a365a5735705a434937637a6f794e6a6f696332383164444579596e42784e335a6a615777334d444a7661546c69636d73334d4445694f33317a4f6a5136496e4276633351694f3245364d447037665831395932686c59327466646d467361575238637a6f304f694a30636e566c496a74735957356e6457466e5a58787a4f6a6336496d56755a327870633267694f327868626d64315957646c633139705a48787a4f6a4536496a45694f327868626d64315957646c6331396a6232526c66484d364d6a6f695a5734694f324e31636e4a6c626d4e3566484d364d7a6f6956564e45496a743062325268655639706333787a4f6a45774f6949794d4445794c5445784c544979496a7431634752686447564665484270636d463061573975633378694f6a45376332567a63326c76626c396a6233567564475679664749364d54746a64584e306232316c636e4e66615842665957526b636d567a6333787a4f6a6b36496a45794e7934774c6a41754d534937),
('28nb9fklfcn3kpkr7dp9a22dc4', 1353571214, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949774e32466c5a444d305a475a6c4d7a49354d324d784d7a51355957553559544a695a6d4e6b4f575a69595349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f784d6a6f6963484a765a48566a64463970626d5a76496a747a4f6a5136496d31765a4755694f334d364e6a6f69546b394f55314e4d496a747a4f6a4d36496d646c6443493759546f7a4f6e747a4f6a5536496d4e515958526f496a747a4f6a4536496a4d694f334d364d544536496e4279623252315933527a58326c6b496a747a4f6a4536496a49694f334d364e546f69656d5675615751694f334d364d6a5936496e4e764e5851784d6d4a776354643259326c734e7a417962326b35596e4a724e7a4178496a7439637a6f304f694a7762334e30496a74684f6a41366533313966584d364f446f696332356863484e6f623351694f3245364e447037637a6f304f694a775957646c496a747a4f6a45794f694a77636d396b64574e3058326c755a6d38694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a74684f6a4d3665334d364e546f6959314268644767694f334d364d546f694d794937637a6f784d546f6963484a765a48566a64484e66615751694f334d364d546f694d694937637a6f314f694a365a5735705a434937637a6f794e6a6f696332383164444579596e42784e335a6a615777334d444a7661546c69636d73334d4445694f33317a4f6a5136496e4276633351694f3245364d447037665831395932686c59327466646d467361575238637a6f304f694a30636e566c496a74735957356e6457466e5a58787a4f6a6336496d56755a327870633267694f327868626d64315957646c633139705a48787a4f6a4536496a45694f327868626d64315957646c6331396a6232526c66484d364d6a6f695a5734694f324e31636e4a6c626d4e3566484d364d7a6f6956564e45496a743062325268655639706333787a4f6a45774f6949794d4445794c5445784c544979496a7431634752686447564665484270636d463061573975633378694f6a45376332567a63326c76626c396a6233567564475679664749364d54746a64584e306232316c636e4e66615842665957526b636d567a6333787a4f6a6b36496a45794e7934774c6a41754d534937);
INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('e7c6picmndrnihh1qcmbsvnfh0', 1353571210, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f69497a4e4468684e7a4d7a4d47457a4e5745335a6a41794f54677a596a56684e47453459574579596d52684e6949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('so5t12bpq7vcil702oi9brk701', 1353571212, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a6d5a57466b4e4455324e7a63335932466a5a5456694e4451794e44413259575a684f446c6a4f4751344e6949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('hgdjnrh25pe08t5a2h9vbhe534', 1353571718, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949324d4441314d4749304e546331597a566d4f4751324f54526c5a575530595441784e7a466c4f5441784d4349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('qkfr154o08v62mpn0rr50804e1', 1353571716, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949314d6d4a695a4467304e44686d597a46684d6a526b5a6d566a4d47566b5a57457a4d6a526b5a6d4a684d4349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('crn19vdqkk94b4o79p2qdkmou5', 1353571717, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949315a54457a4e5468694d7a41344e5755774d6a59784d4751344f5755785a5455795932466b5a4452694f5349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('malcoi42c634fsjen1e5jn3170', 1353572270, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949354e7a426d5a44633059575578596a4e6c5a6d55344e474d334f4749785a6d55345a544535596d49774e5349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d),
('o53gau7jin29co855qe7ik6nm7', 1353571397, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949304d324d784d5759344d6d4a6a4e44426c596a67794d4445324f5752695a6a45304d7a51784d5463794d4349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f344f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a5936496d4e68636e524a52434937546a747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a493665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d447037665831704f6a453759546f304f6e747a4f6a5136496e42685a3255694f334d364e546f696247396e615734694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a74684f6a453665334d364e546f69656d5675615751694f334d364d6a5936496d38314d32646864546471615734794f574e764f4455316357553361577332626d3033496a7439637a6f304f694a7762334e30496a74684f6a41366533313966584d364f446f696332356863484e6f623351694f3245364d4470376658316a6147566a61313932595778705a48787a4f6a5136496e5279645755694f327868626d64315957646c66484d364e7a6f695a57356e62476c7a61434937624746755a3356685a32567a58326c6b66484d364d546f694d534937624746755a3356685a32567a58324e765a475638637a6f794f694a6c6269493759335679636d567559336c38637a6f7a4f694a56553051694f3352765a47463558326c7a66484d364d544136496a49774d5449744d5445744d6a49694f3356775a4746305a55563463476c79595852706232357a664749364d54747a5a584e7a6157397558324e76645735305a584a38596a6f784f324e31633352766257567963313970634639685a4752795a584e7a66484d364f546f694d5449334c6a41754d433478496a733d),
('rh09s8drk08ltlld04tbqetsa5', 1353571483, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949304d324d784d5759344d6d4a6a4e44426c596a67794d4445324f5752695a6a45304d7a51784d5463794d4349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f344f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a5936496d4e68636e524a52434937637a6f314f69497a4f5451344d534937637a6f784d6a6f695932397564475675644639306558426c496a74694f6a4137637a6f784f446f695a6e4a6c5a56397a61476c7763476c755a31397064475674496a74704f6a4137637a6f794d446f695a6e4a6c5a56397a61476c7763476c755a3139335a576c6e614851694f326b364d44747a4f6a45354f694a6d636d566c58334e6f615842776157356e5833427961574e6c496a74704f6a413766573568646d6c6e5958527062323538547a6f784e7a6f69626d46326157646864476c76626b687063335276636e6b694f6a493665334d364e446f69634746306143493759546f784f6e74704f6a413759546f304f6e747a4f6a5136496e42685a3255694f334d364e546f696157356b5a5867694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a747a4f6a413649694937637a6f304f694a7762334e30496a74684f6a41366533313966584d364f446f696332356863484e6f623351694f3245364d4470376658316a6147566a61313932595778705a48787a4f6a5136496e5279645755694f327868626d64315957646c66484d364e7a6f695a57356e62476c7a61434937624746755a3356685a32567a58326c6b66484d364d546f694d534937624746755a3356685a32567a58324e765a475638637a6f794f694a6c6269493759335679636d567559336c38637a6f7a4f694a56553051694f3352765a47463558326c7a66484d364d544136496a49774d5449744d5445744d6a49694f3356775a4746305a55563463476c79595852706232357a664749364d54747a5a584e7a6157397558324e76645735305a584a38596a6f784f324e31633352766257567963313970634639685a4752795a584e7a66484d364f546f694d5449334c6a41754d433478496a746a64584e306232316c636c39705a48787a4f6a4536496a45694f324e3163335276625756795832526c5a6d4631624852665957526b636d567a633139705a48787a4f6a4536496a45694f324e316333527662575679633139686458526f62334a70656d46306157397566484d364d546f694d4349375933567a644739745a584a665a6d6c7963335266626d46745a58787a4f6a5136496e526c633351694f324e3163335276625756795832786863335266626d46745a58787a4f6a5136496e526c633351694f324e31633352766257567958324e7664573530636e6c6661575238637a6f794f6949304e4349375933567a644739745a584a66656d39755a5639705a48787a4f6a4536496a41694f773d3d),
('d0epd880ud6e6ehuhsooij70s3', 1353571675, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a6a5a5464684d3245335a5745355a4445784d544d785a57466d4d7a6b344d474d314e3245324e4467334e7949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a457a4f694a51566b644f4e5441344d6a497a4f544242496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f334f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41784d6930784d5330794d6949376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f354f6949784d6a63754d4334774c6a45694f773d3d);

-- --------------------------------------------------------

--
-- Table structure for table `specials`
--

DROP TABLE IF EXISTS `specials`;
CREATE TABLE IF NOT EXISTS `specials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `specials_new_products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `specials_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`specials_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`specials_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
CREATE TABLE IF NOT EXISTS `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) NOT NULL DEFAULT '',
  `tax_class_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`tax_class_id`, `tax_class_title`, `tax_class_description`, `last_modified`, `date_added`) VALUES
(1, 'Taxable Goods', 'The following types of products are included: non-food, services, etc', NULL, '2012-11-16 15:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE IF NOT EXISTS `tax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL DEFAULT '0',
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `tax_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_rates_id`),
  KEY `idx_tax_zone_id_zen` (`tax_zone_id`),
  KEY `idx_tax_class_id_zen` (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`tax_rates_id`, `tax_zone_id`, `tax_class_id`, `tax_priority`, `tax_rate`, `tax_description`, `last_modified`, `date_added`) VALUES
(1, 1, 1, 1, '7.0000', 'FL TAX 7.0%', '2012-11-16 15:52:06', '2012-11-16 15:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `template_select`
--

DROP TABLE IF EXISTS `template_select`;
CREATE TABLE IF NOT EXISTS `template_select` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_dir` varchar(64) NOT NULL DEFAULT '',
  `template_language` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `idx_tpl_lang_zen` (`template_language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `template_select`
--

INSERT INTO `template_select` (`template_id`, `template_dir`, `template_language`) VALUES
(1, 'denim', '0');

-- --------------------------------------------------------

--
-- Table structure for table `upgrade_exceptions`
--

DROP TABLE IF EXISTS `upgrade_exceptions`;
CREATE TABLE IF NOT EXISTS `upgrade_exceptions` (
  `upgrade_exception_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `sql_file` varchar(50) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `errordate` datetime DEFAULT '0001-01-01 00:00:00',
  `sqlstatement` text,
  PRIMARY KEY (`upgrade_exception_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `whos_online`
--

DROP TABLE IF EXISTS `whos_online`;
CREATE TABLE IF NOT EXISTS `whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(64) NOT NULL DEFAULT '',
  `session_id` varchar(128) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `time_entry` varchar(14) NOT NULL DEFAULT '',
  `time_last_click` varchar(14) NOT NULL DEFAULT '',
  `last_page_url` varchar(255) NOT NULL DEFAULT '',
  `host_address` text NOT NULL,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  KEY `idx_ip_address_zen` (`ip_address`),
  KEY `idx_session_id_zen` (`session_id`),
  KEY `idx_customer_id_zen` (`customer_id`),
  KEY `idx_time_entry_zen` (`time_entry`),
  KEY `idx_time_last_click_zen` (`time_last_click`),
  KEY `idx_last_page_url_zen` (`last_page_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `whos_online`
--

INSERT INTO `whos_online` (`customer_id`, `full_name`, `session_id`, `ip_address`, `time_entry`, `time_last_click`, `last_page_url`, `host_address`, `user_agent`) VALUES
(1, 'test, test', 'rh09s8drk08ltlld04tbqetsa5', '127.0.0.1', '1353569954', '1353570043', '/zencart/', 'PVGN50822390A', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.3)'),
(0, '&yen;Guest', 'qkfr154o08v62mpn0rr50804e1', '127.0.0.1', '1353570276', '1353570276', '/zencart/', 'PVGN50822390A', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11'),
(0, '&yen;Guest', 'crn19vdqkk94b4o79p2qdkmou5', '127.0.0.1', '1353570277', '1353570277', '/zencart/', 'PVGN50822390A', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11'),
(0, '&yen;Guest', 'hgdjnrh25pe08t5a2h9vbhe534', '127.0.0.1', '1353570278', '1353570278', '/zencart/', 'PVGN50822390A', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11'),
(0, '&yen;Guest', 'd0epd880ud6e6ehuhsooij70s3', '127.0.0.1', '1353570235', '1353570235', '/zencart/', 'PVGN50822390A', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11'),
(0, '&yen;Guest', 'malcoi42c634fsjen1e5jn3170', '127.0.0.1', '1353570829', '1353570829', '/zencart/', 'PVGN50822390A', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
CREATE TABLE IF NOT EXISTS `zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_code` varchar(32) NOT NULL DEFAULT '',
  `zone_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`zone_id`),
  KEY `idx_zone_country_id_zen` (`zone_country_id`),
  KEY `idx_zone_code_zen` (`zone_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=300 ;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `zone_country_id`, `zone_code`, `zone_name`) VALUES
(1, 223, 'AL', 'Alabama'),
(2, 223, 'AK', 'Alaska'),
(3, 223, 'AS', 'American Samoa'),
(4, 223, 'AZ', 'Arizona'),
(5, 223, 'AR', 'Arkansas'),
(7, 223, 'AA', 'Armed Forces Americas'),
(9, 223, 'AE', 'Armed Forces Europe'),
(11, 223, 'AP', 'Armed Forces Pacific'),
(12, 223, 'CA', 'California'),
(13, 223, 'CO', 'Colorado'),
(14, 223, 'CT', 'Connecticut'),
(15, 223, 'DE', 'Delaware'),
(16, 223, 'DC', 'District of Columbia'),
(17, 223, 'FM', 'Federated States Of Micronesia'),
(18, 223, 'FL', 'Florida'),
(19, 223, 'GA', 'Georgia'),
(20, 223, 'GU', 'Guam'),
(21, 223, 'HI', 'Hawaii'),
(22, 223, 'ID', 'Idaho'),
(23, 223, 'IL', 'Illinois'),
(24, 223, 'IN', 'Indiana'),
(25, 223, 'IA', 'Iowa'),
(26, 223, 'KS', 'Kansas'),
(27, 223, 'KY', 'Kentucky'),
(28, 223, 'LA', 'Louisiana'),
(29, 223, 'ME', 'Maine'),
(30, 223, 'MH', 'Marshall Islands'),
(31, 223, 'MD', 'Maryland'),
(32, 223, 'MA', 'Massachusetts'),
(33, 223, 'MI', 'Michigan'),
(34, 223, 'MN', 'Minnesota'),
(35, 223, 'MS', 'Mississippi'),
(36, 223, 'MO', 'Missouri'),
(37, 223, 'MT', 'Montana'),
(38, 223, 'NE', 'Nebraska'),
(39, 223, 'NV', 'Nevada'),
(40, 223, 'NH', 'New Hampshire'),
(41, 223, 'NJ', 'New Jersey'),
(42, 223, 'NM', 'New Mexico'),
(43, 223, 'NY', 'New York'),
(44, 223, 'NC', 'North Carolina'),
(45, 223, 'ND', 'North Dakota'),
(46, 223, 'MP', 'Northern Mariana Islands'),
(47, 223, 'OH', 'Ohio'),
(48, 223, 'OK', 'Oklahoma'),
(49, 223, 'OR', 'Oregon'),
(50, 163, 'PW', 'Palau'),
(51, 223, 'PA', 'Pennsylvania'),
(52, 223, 'PR', 'Puerto Rico'),
(53, 223, 'RI', 'Rhode Island'),
(54, 223, 'SC', 'South Carolina'),
(55, 223, 'SD', 'South Dakota'),
(56, 223, 'TN', 'Tennessee'),
(57, 223, 'TX', 'Texas'),
(58, 223, 'UT', 'Utah'),
(59, 223, 'VT', 'Vermont'),
(60, 223, 'VI', 'Virgin Islands'),
(61, 223, 'VA', 'Virginia'),
(62, 223, 'WA', 'Washington'),
(63, 223, 'WV', 'West Virginia'),
(64, 223, 'WI', 'Wisconsin'),
(65, 223, 'WY', 'Wyoming'),
(66, 38, 'AB', 'Alberta'),
(67, 38, 'BC', 'British Columbia'),
(68, 38, 'MB', 'Manitoba'),
(69, 38, 'NL', 'Newfoundland'),
(70, 38, 'NB', 'New Brunswick'),
(71, 38, 'NS', 'Nova Scotia'),
(72, 38, 'NT', 'Northwest Territories'),
(73, 38, 'NU', 'Nunavut'),
(74, 38, 'ON', 'Ontario'),
(75, 38, 'PE', 'Prince Edward Island'),
(76, 38, 'QC', 'Quebec'),
(77, 38, 'SK', 'Saskatchewan'),
(78, 38, 'YT', 'Yukon Territory'),
(79, 81, 'NDS', 'Niedersachsen'),
(80, 81, 'BAW', 'Baden-Württemberg'),
(81, 81, 'BAY', 'Bayern'),
(82, 81, 'BER', 'Berlin'),
(83, 81, 'BRG', 'Brandenburg'),
(84, 81, 'BRE', 'Bremen'),
(85, 81, 'HAM', 'Hamburg'),
(86, 81, 'HES', 'Hessen'),
(87, 81, 'MEC', 'Mecklenburg-Vorpommern'),
(88, 81, 'NRW', 'Nordrhein-Westfalen'),
(89, 81, 'RHE', 'Rheinland-Pfalz'),
(90, 81, 'SAR', 'Saarland'),
(91, 81, 'SAS', 'Sachsen'),
(92, 81, 'SAC', 'Sachsen-Anhalt'),
(93, 81, 'SCN', 'Schleswig-Holstein'),
(94, 81, 'THE', 'Thüringen'),
(95, 14, 'WI', 'Wien'),
(96, 14, 'NO', 'Niederösterreich'),
(97, 14, 'OO', 'Oberösterreich'),
(98, 14, 'SB', 'Salzburg'),
(99, 14, 'KN', 'Kärnten'),
(100, 14, 'ST', 'Steiermark'),
(101, 14, 'TI', 'Tirol'),
(102, 14, 'BL', 'Burgenland'),
(103, 14, 'VB', 'Voralberg'),
(104, 204, 'AG', 'Aargau'),
(105, 204, 'AI', 'Appenzell Innerrhoden'),
(106, 204, 'AR', 'Appenzell Ausserrhoden'),
(107, 204, 'BE', 'Bern'),
(108, 204, 'BL', 'Basel-Landschaft'),
(109, 204, 'BS', 'Basel-Stadt'),
(110, 204, 'FR', 'Freiburg'),
(111, 204, 'GE', 'Genf'),
(112, 204, 'GL', 'Glarus'),
(113, 204, 'JU', 'Graubnden'),
(114, 204, 'JU', 'Jura'),
(115, 204, 'LU', 'Luzern'),
(116, 204, 'NE', 'Neuenburg'),
(117, 204, 'NW', 'Nidwalden'),
(118, 204, 'OW', 'Obwalden'),
(119, 204, 'SG', 'St. Gallen'),
(120, 204, 'SH', 'Schaffhausen'),
(121, 204, 'SO', 'Solothurn'),
(122, 204, 'SZ', 'Schwyz'),
(123, 204, 'TG', 'Thurgau'),
(124, 204, 'TI', 'Tessin'),
(125, 204, 'UR', 'Uri'),
(126, 204, 'VD', 'Waadt'),
(127, 204, 'VS', 'Wallis'),
(128, 204, 'ZG', 'Zug'),
(129, 204, 'ZH', 'Zürich'),
(130, 195, 'A Coruña', 'A Coruña'),
(131, 195, 'Álava', 'Álava'),
(132, 195, 'Albacete', 'Albacete'),
(133, 195, 'Alicante', 'Alicante'),
(134, 195, 'Almería', 'Almería'),
(135, 195, 'Asturias', 'Asturias'),
(136, 195, 'Ávila', 'Ávila'),
(137, 195, 'Badajoz', 'Badajoz'),
(138, 195, 'Baleares', 'Baleares'),
(139, 195, 'Barcelona', 'Barcelona'),
(140, 195, 'Burgos', 'Burgos'),
(141, 195, 'Cáceres', 'Cáceres'),
(142, 195, 'Cádiz', 'Cádiz'),
(143, 195, 'Cantabria', 'Cantabria'),
(144, 195, 'Castellón', 'Castellón'),
(145, 195, 'Ceuta', 'Ceuta'),
(146, 195, 'Ciudad Real', 'Ciudad Real'),
(147, 195, 'Córdoba', 'Córdoba'),
(148, 195, 'Cuenca', 'Cuenca'),
(149, 195, 'Girona', 'Girona'),
(150, 195, 'Granada', 'Granada'),
(151, 195, 'Guadalajara', 'Guadalajara'),
(152, 195, 'Guipúzcoa', 'Guipúzcoa'),
(153, 195, 'Huelva', 'Huelva'),
(154, 195, 'Huesca', 'Huesca'),
(155, 195, 'Jaén', 'Jaén'),
(156, 195, 'La Rioja', 'La Rioja'),
(157, 195, 'Las Palmas', 'Las Palmas'),
(158, 195, 'León', 'León'),
(159, 195, 'Lérida', 'Lérida'),
(160, 195, 'Lugo', 'Lugo'),
(161, 195, 'Madrid', 'Madrid'),
(162, 195, 'Málaga', 'Málaga'),
(163, 195, 'Melilla', 'Melilla'),
(164, 195, 'Murcia', 'Murcia'),
(165, 195, 'Navarra', 'Navarra'),
(166, 195, 'Ourense', 'Ourense'),
(167, 195, 'Palencia', 'Palencia'),
(168, 195, 'Pontevedra', 'Pontevedra'),
(169, 195, 'Salamanca', 'Salamanca'),
(170, 195, 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 195, 'Segovia', 'Segovia'),
(172, 195, 'Sevilla', 'Sevilla'),
(173, 195, 'Soria', 'Soria'),
(174, 195, 'Tarragona', 'Tarragona'),
(175, 195, 'Teruel', 'Teruel'),
(176, 195, 'Toledo', 'Toledo'),
(177, 195, 'Valencia', 'Valencia'),
(178, 195, 'Valladolid', 'Valladolid'),
(179, 195, 'Vizcaya', 'Vizcaya'),
(180, 195, 'Zamora', 'Zamora'),
(181, 195, 'Zaragoza', 'Zaragoza'),
(182, 13, 'ACT', 'Australian Capital Territory'),
(183, 13, 'NSW', 'New South Wales'),
(184, 13, 'NT', 'Northern Territory'),
(185, 13, 'QLD', 'Queensland'),
(186, 13, 'SA', 'South Australia'),
(187, 13, 'TAS', 'Tasmania'),
(188, 13, 'VIC', 'Victoria'),
(189, 13, 'WA', 'Western Australia'),
(190, 105, 'AG', 'Agrigento'),
(191, 105, 'AL', 'Alessandria'),
(192, 105, 'AN', 'Ancona'),
(193, 105, 'AO', 'Aosta'),
(194, 105, 'AR', 'Arezzo'),
(195, 105, 'AP', 'Ascoli Piceno'),
(196, 105, 'AT', 'Asti'),
(197, 105, 'AV', 'Avellino'),
(198, 105, 'BA', 'Bari'),
(199, 105, 'BT', 'Barletta Andria Trani'),
(200, 105, 'BL', 'Belluno'),
(201, 105, 'BN', 'Benevento'),
(202, 105, 'BG', 'Bergamo'),
(203, 105, 'BI', 'Biella'),
(204, 105, 'BO', 'Bologna'),
(205, 105, 'BZ', 'Bolzano'),
(206, 105, 'BS', 'Brescia'),
(207, 105, 'BR', 'Brindisi'),
(208, 105, 'CA', 'Cagliari'),
(209, 105, 'CL', 'Caltanissetta'),
(210, 105, 'CB', 'Campobasso'),
(211, 105, 'CI', 'Carbonia-Iglesias'),
(212, 105, 'CE', 'Caserta'),
(213, 105, 'CT', 'Catania'),
(214, 105, 'CZ', 'Catanzaro'),
(215, 105, 'CH', 'Chieti'),
(216, 105, 'CO', 'Como'),
(217, 105, 'CS', 'Cosenza'),
(218, 105, 'CR', 'Cremona'),
(219, 105, 'KR', 'Crotone'),
(220, 105, 'CN', 'Cuneo'),
(221, 105, 'EN', 'Enna'),
(222, 105, 'FM', 'Fermo'),
(223, 105, 'FE', 'Ferrara'),
(224, 105, 'FI', 'Firenze'),
(225, 105, 'FG', 'Foggia'),
(226, 105, 'FC', 'Forlì Cesena'),
(227, 105, 'FR', 'Frosinone'),
(228, 105, 'GE', 'Genova'),
(229, 105, 'GO', 'Gorizia'),
(230, 105, 'GR', 'Grosseto'),
(231, 105, 'IM', 'Imperia'),
(232, 105, 'IS', 'Isernia'),
(233, 105, 'AQ', 'Aquila'),
(234, 105, 'SP', 'La Spezia'),
(235, 105, 'LT', 'Latina'),
(236, 105, 'LE', 'Lecce'),
(237, 105, 'LC', 'Lecco'),
(238, 105, 'LI', 'Livorno'),
(239, 105, 'LO', 'Lodi'),
(240, 105, 'LU', 'Lucca'),
(241, 105, 'MC', 'Macerata'),
(242, 105, 'MN', 'Mantova'),
(243, 105, 'MS', 'Massa Carrara'),
(244, 105, 'MT', 'Matera'),
(245, 105, 'VS', 'Medio Campidano'),
(246, 105, 'ME', 'Messina'),
(247, 105, 'MI', 'Milano'),
(248, 105, 'MO', 'Modena'),
(249, 105, 'MB', 'Monza e Brianza'),
(250, 105, 'NA', 'Napoli'),
(251, 105, 'NO', 'Novara'),
(252, 105, 'NU', 'Nuoro'),
(253, 105, 'OG', 'Ogliastra'),
(254, 105, 'OT', 'Olbia-Tempio'),
(255, 105, 'OR', 'Oristano'),
(256, 105, 'PD', 'Padova'),
(257, 105, 'PA', 'Palermo'),
(258, 105, 'PR', 'Parma'),
(259, 105, 'PG', 'Perugia'),
(260, 105, 'PV', 'Pavia'),
(261, 105, 'PU', 'Pesaro Urbino'),
(262, 105, 'PE', 'Pescara'),
(263, 105, 'PC', 'Piacenza'),
(264, 105, 'PI', 'Pisa'),
(265, 105, 'PT', 'Pistoia'),
(266, 105, 'PN', 'Pordenone'),
(267, 105, 'PZ', 'Potenza'),
(268, 105, 'PO', 'Prato'),
(269, 105, 'RG', 'Ragusa'),
(270, 105, 'RA', 'Ravenna'),
(271, 105, 'RC', 'Reggio Calabria'),
(272, 105, 'RE', 'Reggio Emilia'),
(273, 105, 'RI', 'Rieti'),
(274, 105, 'RN', 'Rimini'),
(275, 105, 'RM', 'Roma'),
(276, 105, 'RO', 'Rovigo'),
(277, 105, 'SA', 'Salerno'),
(278, 105, 'SS', 'Sassari'),
(279, 105, 'SV', 'Savona'),
(280, 105, 'SI', 'Siena'),
(281, 105, 'SR', 'Siracusa'),
(282, 105, 'SO', 'Sondrio'),
(283, 105, 'TA', 'Taranto'),
(284, 105, 'TE', 'Teramo'),
(285, 105, 'TR', 'Terni'),
(286, 105, 'TO', 'Torino'),
(287, 105, 'TP', 'Trapani'),
(288, 105, 'TN', 'Trento'),
(289, 105, 'TV', 'Treviso'),
(290, 105, 'TS', 'Trieste'),
(291, 105, 'UD', 'Udine'),
(292, 105, 'VA', 'Varese'),
(293, 105, 'VE', 'Venezia'),
(294, 105, 'VB', 'Verbania'),
(295, 105, 'VC', 'Vercelli'),
(296, 105, 'VR', 'Verona'),
(297, 105, 'VV', 'Vibo Valentia'),
(298, 105, 'VI', 'Vicenza'),
(299, 105, 'VT', 'Viterbo');

-- --------------------------------------------------------

--
-- Table structure for table `zones_to_geo_zones`
--

DROP TABLE IF EXISTS `zones_to_geo_zones`;
CREATE TABLE IF NOT EXISTS `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_zen` (`geo_zone_id`,`zone_country_id`,`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zones_to_geo_zones`
--

INSERT INTO `zones_to_geo_zones` (`association_id`, `zone_country_id`, `zone_id`, `geo_zone_id`, `last_modified`, `date_added`) VALUES
(1, 223, 18, 1, NULL, '2012-11-16 15:52:06');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
