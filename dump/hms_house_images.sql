/*
Navicat MySQL Data Transfer

Source Server         : laravel
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : asset_db

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2020-12-14 13:17:21
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `hms_house_images`
-- ----------------------------
DROP TABLE IF EXISTS `hms_house_images`;
CREATE TABLE `hms_house_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(30) DEFAULT NULL,
  `houseId` varchar(30) DEFAULT NULL,
  `mainCategory` varchar(100) DEFAULT NULL,
  `subCategory` varchar(100) DEFAULT NULL,
  `fileName` text,
  `createdBy` varchar(30) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Record Inserted DateTime',
  `updatedBy` varchar(30) DEFAULT NULL COMMENT 'Login UserName',
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Record Update DateTime',
  `delFlg` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hms_house_images
-- ----------------------------
