/*
Navicat MySQL Data Transfer

Source Server         : laravel
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : asset_db

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2020-12-11 14:15:08
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `hms_mailstatus`
-- ----------------------------
DROP TABLE IF EXISTS `hms_mailstatus`;
CREATE TABLE `hms_mailstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Autoincrement id',
  `userId` text,
  `toMail` text,
  `subject` varchar(200) DEFAULT NULL,
  `content` text,
  `sendFlg` int(1) DEFAULT NULL,
  `createdBy` varchar(200) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(200) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `delFlg` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hms_mailstatus
-- ----------------------------
