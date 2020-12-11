/*
Navicat MySQL Data Transfer

Source Server         : laravel
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : asset_db

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2020-12-11 18:08:58
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `hms_master_houseimg_main`
-- ----------------------------
DROP TABLE IF EXISTS `hms_master_houseimg_main`;
CREATE TABLE `hms_master_houseimg_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `imageName` varchar(100) DEFAULT NULL,
  `createdBy` varchar(10) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL COMMENT 'Record Inserted DateTime',
  `updatedBy` varchar(10) DEFAULT NULL COMMENT 'Login UserName',
  `updatedDateTime` datetime DEFAULT NULL COMMENT 'Record Update DateTime',
  `delFlg` int(1) DEFAULT '0' COMMENT '0 - Use , 1 - Not In Use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hms_master_houseimg_main
-- ----------------------------
