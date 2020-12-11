/*
Navicat MySQL Data Transfer

Source Server         : laravel
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : asset_db

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2020-12-11 14:14:59
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `hms_mailcontent`
-- ----------------------------
DROP TABLE IF EXISTS `hms_mailcontent`;
CREATE TABLE `hms_mailcontent` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `mailId` varchar(10) DEFAULT NULL,
  `mailName` varchar(100) DEFAULT NULL,
  `mailType` int(1) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `header` varchar(50) DEFAULT NULL,
  `content` text,
  `defaultMail` int(1) DEFAULT '0',
  `createdBy` varchar(200) DEFAULT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(200) DEFAULT NULL,
  `updatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delFlg` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hms_mailcontent
-- ----------------------------
INSERT INTO hms_mailcontent VALUES ('1', 'MAIL0001', 'User Register', '1', 'Registration Successfully', 'Dear', 'Welcome to Microbit Pvt Ltd..! \r\n\r\n        Your User Details has been Successfully Registered.   \r\n  Now you can Login by using the details given below. \r\n\r\nLoginId   : LLLLL\r\nPassword  : PPPPP\r\nMobile    : MMMMM', '0', 'Admin', '2017-04-13 09:42:39', 'Admin', '2020-08-27 07:25:09', '0');
