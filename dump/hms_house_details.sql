/*
Navicat MySQL Data Transfer

Source Server         : laravel
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : asset_db

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2020-12-11 18:31:35
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `hms_house_details`
-- ----------------------------
DROP TABLE IF EXISTS `hms_house_details`;
CREATE TABLE `hms_house_details` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userId` varchar(10) NOT NULL,
  `houseId` varchar(10) DEFAULT NULL,
  `belongsTo` varchar(30) DEFAULT NULL,
  `purchaseDate` date NOT NULL,
  `purchaseAmount` varchar(30) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `buildingName` varchar(50) DEFAULT NULL,
  `houseNo` varchar(10) DEFAULT NULL,
  `houseName` varchar(100) DEFAULT NULL,
  `image1` varchar(30) DEFAULT NULL,
  `houseSize` varchar(30) DEFAULT NULL,
  `houseType` varchar(30) DEFAULT NULL,
  `balaconySize` varchar(30) DEFAULT NULL,
  `houseBuildOn` varchar(12) DEFAULT NULL,
  `maintFees` varchar(20) DEFAULT NULL,
  `currentValue` varchar(30) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `bankId` int(3) DEFAULT NULL,
  `loanFlg` int(3) NOT NULL DEFAULT '0',
  `soldFlg` int(5) NOT NULL DEFAULT '0',
  `soldDate` varchar(15) DEFAULT NULL,
  `soldAmount` varchar(30) DEFAULT NULL,
  `memoContent` text,
  `createdBy` varchar(30) NOT NULL,
  `createdDateTime` datetime NOT NULL,
  `updatedBy` varchar(30) DEFAULT NULL,
  `updatedDateTime` datetime DEFAULT NULL,
  `delFlg` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hms_house_details
-- ----------------------------
