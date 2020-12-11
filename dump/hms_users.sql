/*
Navicat MySQL Data Transfer

Source Server         : laravel
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : asset_db

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2020-12-11 14:15:17
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `hms_users`
-- ----------------------------
DROP TABLE IF EXISTS `hms_users`;
CREATE TABLE `hms_users` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `userId` varchar(10) DEFAULT NULL COMMENT 'ユーザID',
  `firstName` varchar(100) DEFAULT NULL COMMENT '名',
  `lastName` varchar(100) DEFAULT NULL COMMENT '姓',
  `email` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` int(1) DEFAULT NULL COMMENT '性別',
  `mobileNo` varchar(30) DEFAULT NULL,
  `userType` int(1) DEFAULT NULL,
  `createdBy` varchar(100) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(30) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delFlg` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hms_users
-- ----------------------------
INSERT INTO hms_users VALUES ('1', 'AD0000', 'Admin', '管理者', 'admin@gmail.com', '2001-01-01', '1', '95575755645', '1', 'Admin', '2020-12-11 13:32:50', null, '2020-12-11 13:33:42', '0');
