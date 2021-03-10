/*
Navicat MySQL Data Transfer

Source Server         : laravel
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : asset_db

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2020-10-05 12:00:21
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ams_address`
-- ----------------------------
DROP TABLE IF EXISTS `ams_address`;
CREATE TABLE `ams_address` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `userId` varchar(10) NOT NULL,
  `houseId` varchar(10) DEFAULT NULL,
  `pincode` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `buildingName` varchar(100) NOT NULL,
  `houseName` varchar(100) DEFAULT NULL,
  `houseNo` varchar(10) DEFAULT NULL,
  `createdBy` varchar(30) NOT NULL,
  `createdDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(30) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delFlg` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_address
-- ----------------------------
INSERT INTO ams_address VALUES ('1', 'AD0000', 'HOUSE001', '532-0011', '西中島南方', '5', 'チサンマンション第２新大阪 - 305 号', '305 ', 'Admin', '2020-09-22 20:35:41', 'Admin', '2020-09-22 20:35:41', '0');
INSERT INTO ams_address VALUES ('2', 'AD0000', 'HOUSE002', '532-0011', '大阪市淀川区西中島5-6-3', '1', '大京ビルマンション - 904号', '904', 'Admin', '2020-09-11 07:57:43', 'Admin', '2020-09-11 07:57:43', '0');
INSERT INTO ams_address VALUES ('3', 'AD0000', 'HOUSE003', '532-0011', '大阪市西中島東淀川９－７－１４　２０７号', '3', '大文マンション - 1008号', '1008', 'Admin', '2020-09-11 08:11:23', 'Admin', '2020-09-11 08:11:23', '0');
INSERT INTO ams_address VALUES ('4', 'AD0000', 'HOUSE004', '532-0023', '西淡路東淀川９－４－１９　１０５', '4', 'Osaka Mansion - 608号', '608', 'Admin', '2020-09-11 07:59:55', 'Admin', '2020-09-11 07:59:55', '0');
INSERT INTO ams_address VALUES ('5', 'AD0000', 'HOUSE005', '532-0011', '淀川区西中島, 2-12-8', '2', 'チサンマンション - 207号', '207', 'Admin', '2020-09-11 07:59:29', 'Admin', '2020-09-11 07:59:29', '0');
INSERT INTO ams_address VALUES ('6', 'AD0000', 'HOUSE006', '532-0011', '西中島南方', '4', 'Osaka Mansion - 601号', '601', 'Admin', '2020-10-02 09:18:10', 'Admin', '2020-10-02 09:18:10', '0');

-- ----------------------------
-- Table structure for `ams_assetgoal_details`
-- ----------------------------
DROP TABLE IF EXISTS `ams_assetgoal_details`;
CREATE TABLE `ams_assetgoal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(10) DEFAULT NULL,
  `simulation` int(5) DEFAULT NULL,
  `startDate` varchar(15) DEFAULT NULL,
  `assetGoalAmount` varchar(30) DEFAULT NULL,
  `period` int(5) DEFAULT NULL,
  `years` int(5) DEFAULT NULL,
  `createdBy` varchar(30) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(30) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delFlg` int(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_assetgoal_details
-- ----------------------------
INSERT INTO ams_assetgoal_details VALUES ('1', 'AD0000', '1', '2020-10-01', '1000', '6', '2', 'Admin', '2020-10-01 15:04:27', null, '2020-10-01 15:04:27', '0');
INSERT INTO ams_assetgoal_details VALUES ('2', 'AD0000', '2', '2020-01-09', '1500', '15', '2', 'Admin', '2020-10-01 15:07:39', null, '2020-10-01 15:07:39', '0');

-- ----------------------------
-- Table structure for `ams_assetgoal_per_details`
-- ----------------------------
DROP TABLE IF EXISTS `ams_assetgoal_per_details`;
CREATE TABLE `ams_assetgoal_per_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(10) DEFAULT NULL,
  `assetGoal_Id` int(5) DEFAULT NULL,
  `periodDate` varchar(15) DEFAULT NULL,
  `percentage` varchar(15) DEFAULT NULL,
  `createdBy` varchar(30) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(30) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `editFlg` int(5) DEFAULT '0',
  `delFlg` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_assetgoal_per_details
-- ----------------------------
INSERT INTO ams_assetgoal_per_details VALUES ('1', 'AD0000', '1', '2020-10-01', '10.1', 'Admin', '2020-10-01 15:04:27', null, '2020-10-01 15:04:27', '0', '0');
INSERT INTO ams_assetgoal_per_details VALUES ('2', 'AD0000', '1', '2022-10-01', '9.2', 'Admin', '2020-10-01 15:04:27', null, '2020-10-01 15:04:27', '0', '0');
INSERT INTO ams_assetgoal_per_details VALUES ('3', 'AD0000', '1', '2024-10-01', '8.3', 'Admin', '2020-10-01 15:04:27', null, '2020-10-01 15:04:27', '0', '0');
INSERT INTO ams_assetgoal_per_details VALUES ('4', 'AD0000', '2', '2020-01-09', '10.1', 'Admin', '2020-10-01 15:07:40', null, '2020-10-01 15:07:40', '0', '0');
INSERT INTO ams_assetgoal_per_details VALUES ('5', 'AD0000', '2', '2022-01-09', '9.2', 'Admin', '2020-10-01 15:07:40', null, '2020-10-01 15:07:40', '0', '0');
INSERT INTO ams_assetgoal_per_details VALUES ('6', 'AD0000', '2', '2024-01-09', '8.3', 'Admin', '2020-10-01 15:07:40', null, '2020-10-01 15:07:40', '0', '0');
INSERT INTO ams_assetgoal_per_details VALUES ('7', 'AD0000', '2', '2026-01-09', '7.4', 'Admin', '2020-10-01 15:07:40', null, '2020-10-01 15:07:40', '0', '0');
INSERT INTO ams_assetgoal_per_details VALUES ('8', 'AD0000', '2', '2028-01-09', '6.5', 'Admin', '2020-10-01 15:07:40', null, '2020-10-01 15:07:40', '0', '0');
INSERT INTO ams_assetgoal_per_details VALUES ('9', 'AD0000', '2', '2030-01-09', '5.6', 'Admin', '2020-10-01 15:07:40', null, '2020-10-01 15:07:40', '0', '0');
INSERT INTO ams_assetgoal_per_details VALUES ('10', 'AD0000', '2', '2032-01-09', '4.7', 'Admin', '2020-10-01 15:07:40', null, '2020-10-01 15:07:40', '0', '0');
INSERT INTO ams_assetgoal_per_details VALUES ('11', 'AD0000', '2', '2034-01-09', '3.8', 'Admin', '2020-10-01 15:07:40', null, '2020-10-01 15:07:40', '0', '0');

-- ----------------------------
-- Table structure for `ams_assets_details`
-- ----------------------------
DROP TABLE IF EXISTS `ams_assets_details`;
CREATE TABLE `ams_assets_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) DEFAULT NULL,
  `houseId` varchar(20) DEFAULT NULL,
  `belongsTo` varchar(50) DEFAULT '0',
  `Date` varchar(20) DEFAULT NULL,
  `Month` varchar(20) DEFAULT NULL,
  `Year` varchar(20) DEFAULT NULL,
  `assetsAmount` varchar(30) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `fixFlg` int(5) NOT NULL DEFAULT '0',
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `delFlg` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_assets_details
-- ----------------------------
INSERT INTO ams_assets_details VALUES ('1', 'AD0000', 'HOUSE004', '3', '1', '9', '2020', '1200', 'House', '0', '2020-09-18 15:27:27', 'Admin', '2020-10-01 17:44:22', null, '0');
INSERT INTO ams_assets_details VALUES ('2', 'AD0000', 'HOUSE004', '3', '1', '10', '2020', '1350', 'House', '0', '2020-09-18 15:27:27', 'Admin', '2020-10-01 17:44:33', null, '0');
INSERT INTO ams_assets_details VALUES ('3', 'AD0000', 'HOUSE005', '2', '1', '9', '2020', '1500', '', '0', '2020-09-18 15:28:57', 'Admin', '2020-10-01 17:48:44', null, '0');
INSERT INTO ams_assets_details VALUES ('4', 'AD0000', 'HOUSE005', '2', '1', '10', '2020', '1500', '', '0', '2020-09-18 15:28:57', 'Admin', '2020-10-01 17:49:16', null, '0');
INSERT INTO ams_assets_details VALUES ('5', 'AD0000', 'HOUSE004', '3', '1', '6', '2020', '1300', 'House', '0', '2020-09-18 15:29:27', 'Admin', '2020-10-01 17:45:03', null, '0');
INSERT INTO ams_assets_details VALUES ('6', 'AD0000', 'HOUSE004', '3', '1', '11', '2020', '1000', 'House amount', '0', '2020-09-18 17:40:05', 'Admin', '2020-10-01 17:45:24', null, '0');
INSERT INTO ams_assets_details VALUES ('7', 'AD0000', 'HOUSE001', '1', '2', '4', '2020', '1000', '', '0', '2020-09-18 18:30:15', 'Admin', '2020-09-18 18:30:15', null, '0');
INSERT INTO ams_assets_details VALUES ('8', 'AD0000', 'HOUSE001', '1', '2', '5', '2020', '1000', '', '0', '2020-09-18 18:30:15', 'Admin', '2020-09-18 18:30:15', null, '0');
INSERT INTO ams_assets_details VALUES ('9', 'AD0000', 'HOUSE001', '1', '2', '6', '2020', '1000', '', '0', '2020-09-18 18:30:15', 'Admin', '2020-09-18 18:30:15', null, '0');
INSERT INTO ams_assets_details VALUES ('10', 'AD0000', 'HOUSE001', '1', '2', '7', '2020', '1000', '', '0', '2020-09-18 18:30:15', 'Admin', '2020-09-18 18:30:15', null, '0');
INSERT INTO ams_assets_details VALUES ('11', 'AD0000', 'HOUSE001', '1', '2', '8', '2020', '1000', '', '0', '2020-09-18 18:30:15', 'Admin', '2020-09-18 18:30:15', null, '0');
INSERT INTO ams_assets_details VALUES ('12', 'AD0000', 'HOUSE001', '1', '2', '9', '2020', '1000', '', '0', '2020-09-18 18:30:15', 'Admin', '2020-09-18 18:30:15', null, '0');
INSERT INTO ams_assets_details VALUES ('13', 'AD0000', 'HOUSE001', '1', '2', '10', '2020', '2000', '', '0', '2020-09-18 18:30:15', 'Admin', '2020-10-02 20:34:13', null, '0');
INSERT INTO ams_assets_details VALUES ('14', 'AD0000', 'HOUSE001', '1', '2', '11', '2020', '1000', '', '0', '2020-09-18 18:30:15', 'Admin', '2020-09-18 18:30:15', null, '0');
INSERT INTO ams_assets_details VALUES ('15', 'AD0000', 'HOUSE001', '1', '2', '12', '2020', '1000', '', '0', '2020-09-18 18:30:15', 'Admin', '2020-09-18 18:30:15', null, '0');
INSERT INTO ams_assets_details VALUES ('16', 'AD0000', 'HOUSE001', '1', '2', '1', '2020', '1000', '', '0', '2020-09-30 14:39:27', 'Admin', '2020-09-30 14:39:27', null, '0');
INSERT INTO ams_assets_details VALUES ('17', 'AD0000', 'HOUSE004', '3', '1', '8', '2020', '1300', 'House', '0', '2020-10-01 17:38:33', 'Admin', '2020-10-01 17:38:33', null, '0');
INSERT INTO ams_assets_details VALUES ('18', 'AD0000', 'HOUSE001', '1', '2', '3', '2020', '1000', '', '1', '2020-10-02 20:31:45', 'Admin', '2020-10-02 20:31:56', 'Admin', '0');
INSERT INTO ams_assets_details VALUES ('19', 'AD0000', 'HOUSE001', '1', '7', '2', '2020', '2000', '', '0', '2020-10-02 20:33:19', 'Admin', '2020-10-02 20:33:19', null, '0');
INSERT INTO ams_assets_details VALUES ('20', 'AD0000', 'HOUSE005', '2', '8', '1', '2020', '2000', '', '0', '2020-10-02 20:35:06', 'Admin', '2020-10-02 20:35:06', null, '0');
INSERT INTO ams_assets_details VALUES ('21', 'AD0000', 'HOUSE005', '2', '8', '2', '2020', '2000', '', '0', '2020-10-02 20:35:06', 'Admin', '2020-10-02 20:35:06', null, '0');
INSERT INTO ams_assets_details VALUES ('22', 'AD0000', 'HOUSE005', '2', '8', '4', '2020', '2000', '', '0', '2020-10-02 20:35:06', 'Admin', '2020-10-02 20:35:06', null, '0');
INSERT INTO ams_assets_details VALUES ('23', 'AD0000', 'HOUSE005', '2', '8', '5', '2020', '2000', '', '0', '2020-10-02 20:35:06', 'Admin', '2020-10-02 20:35:06', null, '0');
INSERT INTO ams_assets_details VALUES ('24', 'AD0000', 'HOUSE005', '2', '8', '6', '2020', '2000', '', '0', '2020-10-02 20:35:06', 'Admin', '2020-10-02 20:35:06', null, '0');
INSERT INTO ams_assets_details VALUES ('25', 'AD0000', 'HOUSE005', '2', '8', '7', '2020', '2000', '', '0', '2020-10-02 20:35:06', 'Admin', '2020-10-02 20:35:06', null, '0');
INSERT INTO ams_assets_details VALUES ('26', 'AD0000', 'HOUSE005', '2', '8', '8', '2020', '2000', '', '0', '2020-10-02 20:35:06', 'Admin', '2020-10-02 20:35:06', null, '0');
INSERT INTO ams_assets_details VALUES ('27', 'AD0000', 'HOUSE005', '2', '8', '11', '2020', '2000', '', '0', '2020-10-02 20:35:06', 'Admin', '2020-10-02 20:35:06', null, '0');
INSERT INTO ams_assets_details VALUES ('28', 'AD0000', 'HOUSE005', '2', '8', '12', '2020', '2000', '', '0', '2020-10-02 20:35:06', 'Admin', '2020-10-02 20:35:06', null, '0');

-- ----------------------------
-- Table structure for `ams_balsheet_details`
-- ----------------------------
DROP TABLE IF EXISTS `ams_balsheet_details`;
CREATE TABLE `ams_balsheet_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` varchar(10) NOT NULL,
  `totalAsset` varchar(30) DEFAULT NULL,
  `totalLiability` varchar(30) DEFAULT NULL,
  `netAsset` varchar(30) DEFAULT NULL,
  `increasedAsset` varchar(30) DEFAULT NULL,
  `increasedPercent` varchar(10) DEFAULT NULL,
  `year` int(5) DEFAULT NULL,
  `month` int(5) DEFAULT NULL,
  `createdBy` varchar(30) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(30) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delFlg` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_balsheet_details
-- ----------------------------
INSERT INTO ams_balsheet_details VALUES ('1', 'AD0000', '2600', '2627', '-27', '2622', '-99', '2020', '8', 'Admin', '2020-09-18 15:30:15', null, '2020-09-18 19:06:00', '0');
INSERT INTO ams_balsheet_details VALUES ('2', 'AD0000', '0', '2649', '-2649', '0', '0', '2020', '7', 'Admin', '2020-09-18 16:10:37', null, null, '0');
INSERT INTO ams_balsheet_details VALUES ('3', 'AD0000', '5717', '6709', '-992', '-965', '3575.87111', '2020', '9', 'Admin', '2020-09-18 16:12:28', null, '2020-09-28 15:08:55', '0');
INSERT INTO ams_balsheet_details VALUES ('4', 'AD0000', '5867', '4584', '1283', '382', '42.4128634', '2020', '10', 'Admin', '2020-09-18 18:07:47', null, '2020-09-24 06:22:05', '0');
INSERT INTO ams_balsheet_details VALUES ('5', 'AD0000', '3617', '4562', '-945', '543', '-36', '2020', '11', 'Admin', '2020-09-23 16:18:17', null, null, '0');
INSERT INTO ams_balsheet_details VALUES ('6', 'AD0000', '1400', '1443', '-43', '0', '0', '2020', '5', 'Admin', '2020-09-25 18:09:33', null, null, '0');

-- ----------------------------
-- Table structure for `ams_bankname_master`
-- ----------------------------
DROP TABLE IF EXISTS `ams_bankname_master`;
CREATE TABLE `ams_bankname_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `bankName` varchar(100) DEFAULT NULL,
  `nickName` varchar(100) DEFAULT NULL,
  `createdBy` varchar(10) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL COMMENT 'Record Inserted DateTime',
  `updatedBy` varchar(10) DEFAULT NULL COMMENT 'Login UserName',
  `updatedDateTime` datetime DEFAULT NULL COMMENT 'Record Update DateTime',
  `delFlg` int(1) DEFAULT '0' COMMENT '0 - Use , 1 - Not In Use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_bankname_master
-- ----------------------------
INSERT INTO ams_bankname_master VALUES ('1', '3', '東京UFJ銀行', 'UFJ', 'Admin', '2020-08-27 14:48:38', 'Admin', '2020-08-27 14:48:46', '0');
INSERT INTO ams_bankname_master VALUES ('2', '4', '北おおさか信用金庫', '北おおさか', 'Admin', '2020-08-27 14:52:21', 'Admin', '2020-08-27 14:52:26', '0');
INSERT INTO ams_bankname_master VALUES ('3', '1', '大阪信用金庫', '大阪信用金庫', 'Admin', '2020-08-27 14:53:06', 'Admin', '2020-08-27 14:53:12', '0');
INSERT INTO ams_bankname_master VALUES ('4', '2', '大阪三菱UFJ銀行', 'UFJJ', 'Admin', '2020-09-23 12:50:54', 'Admin', '2020-09-23 12:50:54', '0');

-- ----------------------------
-- Table structure for `ams_bank_details`
-- ----------------------------
DROP TABLE IF EXISTS `ams_bank_details`;
CREATE TABLE `ams_bank_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(50) DEFAULT NULL,
  `bankUserName` varchar(50) DEFAULT NULL,
  `kanaName` varchar(50) DEFAULT NULL,
  `accountNo` int(10) DEFAULT NULL,
  `bankName` int(10) DEFAULT NULL,
  `bankNickName` int(10) DEFAULT NULL,
  `branchName` varchar(50) DEFAULT NULL,
  `branchNo` int(10) DEFAULT NULL,
  `belongsTo` int(10) DEFAULT NULL,
  `houseId` varchar(50) DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(50) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delflg` int(11) NOT NULL DEFAULT '0',
  `mainFlg` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_bank_details
-- ----------------------------
INSERT INTO ams_bank_details VALUES ('1', 'AD0000', '株式会社Microbit', 'マイクロビット', '467283', '1', '1', '新大阪駅前', '56', '1', null, 'Admin', '2020-08-28 11:08:41', 'Admin', '2020-09-03 10:44:16', '0', '0');
INSERT INTO ams_bank_details VALUES ('2', 'AD0000', '株式会社Microbit', 'マイクロビット', '4325335', '1', '1', '新大阪駅前', '138', null, '1', 'Admin', '2020-09-02 17:24:11', 'Admin', '2020-09-08 12:51:26', '0', '1');
INSERT INTO ams_bank_details VALUES ('3', 'AD0000', 'Sundar', 'スンダラ', '5645645', '1', '1', '新大阪駅前', '0', null, '1', 'Admin', '2020-09-08 12:53:35', 'Admin', '2020-09-08 12:53:35', '0', '1');

-- ----------------------------
-- Table structure for `ams_expenses_details`
-- ----------------------------
DROP TABLE IF EXISTS `ams_expenses_details`;
CREATE TABLE `ams_expenses_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) DEFAULT NULL,
  `houseId` varchar(20) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `mainExpenseId` int(5) DEFAULT '0',
  `subExpenseId` int(5) DEFAULT '0',
  `Month` varchar(20) DEFAULT NULL,
  `expenseAmount` varchar(30) DEFAULT NULL,
  `bill_Image` varchar(30) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `activeFlg` int(3) NOT NULL DEFAULT '0',
  `delFlg` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_expenses_details
-- ----------------------------
INSERT INTO ams_expenses_details VALUES ('1', 'AD0000', 'HOUSE001', '2020-07-01', '1', '1', '7', '5000', '2020-07_1.PNG', '', '2020-08-29 17:34:05', 'Admin', '2020-08-29 17:34:05', null, '0', '0');
INSERT INTO ams_expenses_details VALUES ('2', 'AD0000', 'HOUSE002', '2020-08-29', '2', '5', '5', '16680', '2020-08_2.jpg', '', '2020-08-29 18:22:37', 'Admin', '2020-09-11 15:06:41', 'Admin', '0', '0');
INSERT INTO ams_expenses_details VALUES ('3', 'AD0000', 'HOUSE003', '2020-08-29', '1', '6', '5', '5555', '2020-08_3.jpg', '', '2020-08-30 08:41:49', 'Admin', '2020-09-11 15:13:46', 'Admin', '0', '0');
INSERT INTO ams_expenses_details VALUES ('4', 'AD0000', 'HOUSE001', '2020-08-28', '2', '4', '6,7', '5874', '', '', '2020-08-30 08:42:12', 'Admin', '2020-09-07 10:53:26', 'Admin', '0', '0');
INSERT INTO ams_expenses_details VALUES ('5', 'AD0000', 'HOUSE003', '2021-06-13', '1', '6', '6', '5555', '', '', '2020-09-05 06:37:12', 'Admin', '2020-09-05 06:37:12', null, '0', '0');
INSERT INTO ams_expenses_details VALUES ('6', 'AD0000', 'HOUSE001', '2020-10-10', '1', '1', '10', '5000', '', '', '2020-09-07 10:31:24', 'Admin', '2020-09-07 10:33:41', 'Admin', '0', '0');
INSERT INTO ams_expenses_details VALUES ('7', 'AD0000', 'HOUSE001', '2020-11-10', '1', '1', '11', '10000', '', '', '2020-09-07 10:32:40', 'Admin', '2020-09-07 10:32:40', null, '0', '0');
INSERT INTO ams_expenses_details VALUES ('8', 'AD0000', 'HOUSE001', '2020-02-13', '2', '4', '2', '4000', null, null, '2020-09-07 20:46:13', 'Admin', '2020-09-08 17:39:28', 'Admin', '2', '0');
INSERT INTO ams_expenses_details VALUES ('9', 'AD0000', 'HOUSE001', '2020-03-13', '2', '4', '3', '4000', null, null, '2020-09-07 20:46:13', 'Admin', '2020-09-07 20:46:23', 'Admin', '2', '0');
INSERT INTO ams_expenses_details VALUES ('10', 'AD0000', 'HOUSE001', '2020-03-13', '2', '4', '3', '4000', '', '', '2020-09-07 20:46:23', 'Admin', '2020-09-07 20:46:23', null, '0', '0');
INSERT INTO ams_expenses_details VALUES ('11', 'AD0000', 'HOUSE001', '2020-02-13', '2', '4', '2', '4000', '', '', '2020-09-08 17:39:28', 'Admin', '2020-09-08 17:39:28', null, '0', '0');
INSERT INTO ams_expenses_details VALUES ('12', 'AD0000', 'HOUSE001', '2020-01-10', '1', '2', '1', '1000', null, null, '2020-09-09 13:49:15', 'Admin', '2020-09-09 13:49:15', null, '1', '0');
INSERT INTO ams_expenses_details VALUES ('13', 'AD0000', 'HOUSE001', '2020-02-10', '1', '2', '2', '1000', null, null, '2020-09-09 13:49:15', 'Admin', '2020-09-09 13:49:15', null, '1', '0');
INSERT INTO ams_expenses_details VALUES ('14', 'AD0000', 'HOUSE001', '2020-03-10', '1', '2', '3', '1000', null, null, '2020-09-09 13:49:15', 'Admin', '2020-09-09 13:49:15', null, '1', '0');
INSERT INTO ams_expenses_details VALUES ('15', 'AD0000', 'HOUSE001', '2020-04-10', '1', '2', '4', '1000', null, null, '2020-09-09 13:49:15', 'Admin', '2020-09-09 13:49:15', null, '1', '0');
INSERT INTO ams_expenses_details VALUES ('16', 'AD0000', 'HOUSE001', '2020-05-10', '1', '2', '5', '1000', null, null, '2020-09-09 13:49:15', 'Admin', '2020-09-09 13:49:15', null, '1', '0');
INSERT INTO ams_expenses_details VALUES ('17', 'AD0000', 'HOUSE001', '2020-06-10', '1', '2', '6', '1000', null, null, '2020-09-09 13:49:15', 'Admin', '2020-09-09 13:49:15', null, '1', '0');
INSERT INTO ams_expenses_details VALUES ('18', 'AD0000', 'HOUSE001', '2020-07-10', '1', '2', '7', '1000', null, null, '2020-09-09 13:49:15', 'Admin', '2020-09-09 13:49:15', null, '1', '0');
INSERT INTO ams_expenses_details VALUES ('19', 'AD0000', 'HOUSE001', '2020-08-10', '1', '2', '8', '1000', null, null, '2020-09-09 13:49:15', 'Admin', '2020-09-09 13:49:15', null, '1', '0');
INSERT INTO ams_expenses_details VALUES ('20', 'AD0000', 'HOUSE001', '2020-09-10', '1', '2', '9', '1000', null, null, '2020-09-09 13:49:15', 'Admin', '2020-09-09 13:49:15', null, '1', '0');
INSERT INTO ams_expenses_details VALUES ('21', 'AD0000', 'HOUSE001', '2020-10-10', '1', '2', '10', '1000', null, null, '2020-09-09 13:49:15', 'Admin', '2020-09-09 18:39:19', 'Admin', '2', '0');
INSERT INTO ams_expenses_details VALUES ('22', 'AD0000', 'HOUSE001', '2020-11-10', '1', '2', '11', '1000', null, null, '2020-09-09 13:49:15', 'Admin', '2020-09-09 18:39:19', 'Admin', '2', '0');
INSERT INTO ams_expenses_details VALUES ('23', 'AD0000', 'HOUSE001', '2020-12-10', '1', '2', '12', '1000', null, null, '2020-09-09 13:49:15', 'Admin', '2020-09-09 13:49:15', null, '1', '0');
INSERT INTO ams_expenses_details VALUES ('24', 'AD0000', 'HOUSE001', '2020-10-10', '1', '2', '10,11', '10000', '', '', '2020-09-09 18:39:19', 'Admin', '2020-09-09 18:39:19', null, '0', '0');

-- ----------------------------
-- Table structure for `ams_expenses_yettopay`
-- ----------------------------
DROP TABLE IF EXISTS `ams_expenses_yettopay`;
CREATE TABLE `ams_expenses_yettopay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) DEFAULT NULL,
  `houseId` varchar(20) DEFAULT NULL,
  `mainExpenseId` int(5) DEFAULT '0',
  `subExpenseId` int(5) DEFAULT '0',
  `Date` varchar(20) DEFAULT NULL,
  `Month` varchar(20) DEFAULT NULL,
  `Year` varchar(20) DEFAULT NULL,
  `expenseAmount` varchar(30) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `delFlg` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_expenses_yettopay
-- ----------------------------
INSERT INTO ams_expenses_yettopay VALUES ('1', 'AD0000', 'HOUSE001', '1', '1', '10', '9,10,11,12', '2020', '10000', '2020-09-04 21:08:01', 'Admin', '2020-09-04 21:08:01', null, '0');
INSERT INTO ams_expenses_yettopay VALUES ('2', 'AD0000', 'HOUSE001', '1', '2', '21', '7,8,9', '2020', '20000', '2020-09-04 21:08:34', 'Admin', '2020-09-04 21:08:34', null, '0');
INSERT INTO ams_expenses_yettopay VALUES ('3', 'AD0000', 'HOUSE003', '1', '1', '13', '2,3,4,5,6', '2021', '5000', '2020-09-04 21:09:10', 'Admin', '2020-09-04 21:10:53', 'Admin', '0');

-- ----------------------------
-- Table structure for `ams_family_master`
-- ----------------------------
DROP TABLE IF EXISTS `ams_family_master`;
CREATE TABLE `ams_family_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `familyName` varchar(100) DEFAULT NULL,
  `nickName` varchar(30) DEFAULT NULL,
  `createdBy` varchar(10) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL COMMENT 'Record Inserted DateTime',
  `updatedBy` varchar(10) DEFAULT NULL COMMENT 'Login UserName',
  `updatedDateTime` datetime DEFAULT NULL COMMENT 'Record Update DateTime',
  `delFlg` int(1) DEFAULT '0' COMMENT '0 - Use , 1 - Not In Use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_family_master
-- ----------------------------
INSERT INTO ams_family_master VALUES ('1', '1', 'Father', 'F', 'Admin', '2020-08-27 05:44:42', 'Admin', '2020-10-01 09:07:04', '0');
INSERT INTO ams_family_master VALUES ('2', '2', 'Mother', 'M', 'Admin', '2020-08-27 05:44:52', 'Admin', '2020-10-01 09:07:11', '0');
INSERT INTO ams_family_master VALUES ('3', '3', 'Son', 'S', 'Admin', '2020-08-27 05:44:57', 'Admin', '2020-10-01 09:08:35', '0');
INSERT INTO ams_family_master VALUES ('4', '4', 'Daughter', 'D', 'Admin', '2020-09-24 07:51:38', 'Admin', '2020-10-02 00:42:26', '0');

-- ----------------------------
-- Table structure for `ams_house_details`
-- ----------------------------
DROP TABLE IF EXISTS `ams_house_details`;
CREATE TABLE `ams_house_details` (
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
  `createdBy` varchar(30) NOT NULL,
  `createdDateTime` datetime NOT NULL,
  `updatedBy` varchar(30) DEFAULT NULL,
  `updatedDateTime` datetime DEFAULT NULL,
  `delFlg` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_house_details
-- ----------------------------
INSERT INTO ams_house_details VALUES ('1', 'AD0000', 'HOUSE001', '1', '2020-08-25', '500', '532-0011', '西中島南方', '5', '305 ', 'チサンマンション第２新大阪 - 305 号', 'HOUSE001.jpeg', '', '', '', '', '', '720', '', '1', '1', '0', null, null, 'Admin', '2020-08-25 12:48:42', 'Admin', '2020-09-23 00:05:40', '0');
INSERT INTO ams_house_details VALUES ('2', 'AD0000', 'HOUSE002', '1', '2020-08-05', '1050', '532-0011', '大阪市淀川区西中島5-6-3', '1', '904', '大京ビルマンション - 904号', 'HOUSE002.jpg', '200', '2BHK', '10', '2020-09-03', '', '1200', '', '1', '1', '0', null, null, 'Admin', '2020-08-26 12:30:46', 'Admin', '2020-09-11 11:27:43', '0');
INSERT INTO ams_house_details VALUES ('3', 'AD0000', 'HOUSE003', '1', '2020-08-27', '1000', '532-0011', '大阪市西中島東淀川９－７－１４　２０７号', '3', '1008', '大文マンション - 1008号', 'HOUSE003.jpg', '', '', '', '', '1000', '1300', '10000', '1', '1', '0', null, null, 'Admin', '2020-08-27 01:23:32', 'Admin', '2020-09-11 11:41:23', '0');
INSERT INTO ams_house_details VALUES ('4', 'AD0000', 'HOUSE004', '3', '2020-08-27', '234', '532-0023', '西淡路東淀川９－４－１９　１０５', '4', '608', 'Osaka Mansion - 608号', 'HOUSE004.PNG', '', '', '', '', '', '420', '', '0', '0', '0', null, null, 'Admin', '2020-08-27 05:27:55', 'Admin', '2020-09-11 11:29:55', '0');
INSERT INTO ams_house_details VALUES ('5', 'AD0000', 'HOUSE005', '2', '2020-08-06', '300', '532-0011', '淀川区西中島, 2-12-8', '2', '207', 'チサンマンション - 207号', 'HOUSE005.jpeg', '', '', '', '', '', '600', '', '3', '1', '0', null, null, 'Admin', '2020-08-28 23:35:25', 'Admin', '2020-09-11 11:29:29', '0');
INSERT INTO ams_house_details VALUES ('6', 'AD0000', 'HOUSE006', '3', '2019-01-01', '500', '532-0011', '西中島南方', '4', '601', 'Osaka Mansion - 601号', 'HOUSE006.jpg', '', '', '', '', '', '700', '', null, '0', '1', '2020-10-02', '750', 'Admin', '2020-10-02 12:48:10', null, null, '0');

-- ----------------------------
-- Table structure for `ams_house_images`
-- ----------------------------
DROP TABLE IF EXISTS `ams_house_images`;
CREATE TABLE `ams_house_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(30) DEFAULT NULL,
  `houseId` varchar(30) DEFAULT NULL,
  `mainCategory` varchar(100) DEFAULT NULL,
  `subCategory` varchar(100) DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `createdBy` varchar(30) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Record Inserted DateTime',
  `updatedBy` varchar(30) DEFAULT NULL COMMENT 'Login UserName',
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Record Update DateTime',
  `delFlg` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_house_images
-- ----------------------------
INSERT INTO ams_house_images VALUES ('1', 'AD0000', 'HOUSE003', '3', '2', 'Purchase_1.jpg', 'Admin', '2020-09-11 11:41:17', null, '2020-09-11 20:41:17', '0');

-- ----------------------------
-- Table structure for `ams_income_details`
-- ----------------------------
DROP TABLE IF EXISTS `ams_income_details`;
CREATE TABLE `ams_income_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) DEFAULT NULL,
  `houseId` varchar(20) DEFAULT NULL,
  `subject` varchar(50) DEFAULT '0',
  `others` varchar(50) DEFAULT '0',
  `Date` varchar(20) DEFAULT NULL,
  `Month` varchar(20) DEFAULT NULL,
  `Year` varchar(20) DEFAULT NULL,
  `incomeAmount` varchar(30) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `delFlg` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_income_details
-- ----------------------------
INSERT INTO ams_income_details VALUES ('1', 'AD0000', 'HOUSE001', 'Rent', '', '13', '1', '2020', '5000', '2020-09-08 17:39:35', 'Admin', '2020-09-08 17:39:35', null, '0');
INSERT INTO ams_income_details VALUES ('2', 'AD0000', 'HOUSE001', 'Rent', '', '13', '2', '2020', '5000', '2020-09-08 17:39:35', 'Admin', '2020-09-08 17:39:35', null, '0');
INSERT INTO ams_income_details VALUES ('3', 'AD0000', 'HOUSE002', 'Rent', '', '11', '3', '2020', '6000', '2020-09-08 17:40:00', 'Admin', '2020-09-08 17:40:00', null, '0');
INSERT INTO ams_income_details VALUES ('4', 'AD0000', 'HOUSE002', 'Rent', '', '11', '4', '2020', '6000', '2020-09-08 17:40:00', 'Admin', '2020-09-08 17:40:00', null, '0');
INSERT INTO ams_income_details VALUES ('5', 'AD0000', 'HOUSE002', 'Rent', '', '11', '5', '2020', '0', '2020-09-08 17:40:00', 'Admin', '2020-09-10 11:11:47', null, '0');
INSERT INTO ams_income_details VALUES ('6', 'AD0000', 'HOUSE003', 'Others', 'EB Bill', '12', '4', '2020', '7000', '2020-09-08 17:40:29', 'Admin', '2020-09-08 17:40:29', null, '0');
INSERT INTO ams_income_details VALUES ('7', 'AD0000', 'HOUSE003', 'Others', 'EB Bill', '12', '6', '2020', '7000', '2020-09-08 17:40:29', 'Admin', '2020-09-08 17:40:29', null, '0');
INSERT INTO ams_income_details VALUES ('8', 'AD0000', 'HOUSE003', 'Others', 'EB Bill', '12', '7', '2020', '7000', '2020-09-08 17:40:29', 'Admin', '2020-09-08 17:40:29', null, '0');
INSERT INTO ams_income_details VALUES ('9', 'AD0000', 'HOUSE001', 'Others', 'EB Bill', '2', '1', '2021', '8000', '2020-09-08 18:00:05', 'Admin', '2020-09-08 18:00:05', null, '0');
INSERT INTO ams_income_details VALUES ('10', 'AD0000', 'HOUSE001', 'Others', 'EB Bill', '2', '2', '2021', '8000', '2020-09-08 18:00:05', 'Admin', '2020-09-08 18:00:05', null, '0');
INSERT INTO ams_income_details VALUES ('11', 'AD0000', 'HOUSE003', 'Others', 'Gas Bill', '12', '2', '2020', '6000', '2020-09-09 18:28:50', 'Admin', '2020-09-09 18:28:50', null, '0');
INSERT INTO ams_income_details VALUES ('12', 'AD0000', 'HOUSE003', 'Others', 'Gas Bill', '12', '3', '2020', '8000', '2020-09-09 18:28:50', 'Admin', '2020-09-09 18:30:16', null, '0');
INSERT INTO ams_income_details VALUES ('13', 'AD0000', 'HOUSE003', 'Others', 'Gas Bill', '12', '4', '2020', '7000', '2020-09-09 18:35:24', 'Admin', '2020-09-09 18:35:24', null, '0');
INSERT INTO ams_income_details VALUES ('14', 'AD0000', 'HOUSE003', 'Others', 'Gas Bill', '12', '5', '2020', '7000', '2020-09-09 18:35:24', 'Admin', '2020-09-09 18:35:24', null, '0');

-- ----------------------------
-- Table structure for `ams_loansimulation_details`
-- ----------------------------
DROP TABLE IF EXISTS `ams_loansimulation_details`;
CREATE TABLE `ams_loansimulation_details` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `userId` varchar(10) DEFAULT NULL,
  `loanId` varchar(10) DEFAULT NULL,
  `loanName` varchar(100) DEFAULT NULL,
  `loanAmount` int(30) DEFAULT NULL,
  `totalInterest` varchar(30) DEFAULT NULL,
  `reducedInterest` varchar(30) DEFAULT NULL,
  `interestRate` varchar(10) DEFAULT NULL,
  `loanTerm` int(3) DEFAULT NULL,
  `paymentCount` int(3) DEFAULT NULL,
  `perMonthTotal` int(3) DEFAULT NULL,
  `perMonthAmount` int(30) DEFAULT NULL,
  `startDate` varchar(12) DEFAULT NULL,
  `createdBy` varchar(30) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(30) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activeFlg` int(3) NOT NULL DEFAULT '0',
  `delFlg` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_loansimulation_details
-- ----------------------------
INSERT INTO ams_loansimulation_details VALUES ('4', 'AD0000', 'LOAN001', 'Car Loan', '200', '421698', '384811', '7.8', '5', '12', '0', '0', '2020-01-10', 'Admin', '2020-09-30 16:34:47', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_details VALUES ('5', 'AD0000', 'LOAN002', 'Jewel Loan', '150', '291721', null, '9', '4', '12', '0', '0', '2019-03-01', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_details VALUES ('8', 'AD0000', 'LOAN003', 'チサンマンション第２新大阪 - 305 号,大文マンション - 1008号', '1200', '1640430', '1510464', '12', '3', '12', '1', '500000', '2020-01-10', 'Admin', '2020-10-03 15:11:32', null, '2020-10-03 15:13:44', '0', '0');

-- ----------------------------
-- Table structure for `ams_loansimulation_emidetails`
-- ----------------------------
DROP TABLE IF EXISTS `ams_loansimulation_emidetails`;
CREATE TABLE `ams_loansimulation_emidetails` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `loanId` varchar(10) DEFAULT NULL,
  `userId` varchar(10) DEFAULT NULL,
  `emiDate` varchar(12) DEFAULT NULL,
  `year` int(6) DEFAULT NULL,
  `month` int(3) DEFAULT NULL,
  `monthPayment` varchar(30) DEFAULT NULL,
  `monthPrinciple` varchar(30) DEFAULT NULL,
  `monthInterest` varchar(30) DEFAULT NULL,
  `monthAmount` varchar(30) DEFAULT NULL,
  `loanBalance` varchar(30) DEFAULT NULL,
  `createdBy` varchar(30) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(30) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `editFlg` int(3) NOT NULL DEFAULT '0',
  `delFlg` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1606 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_loansimulation_emidetails
-- ----------------------------
INSERT INTO ams_loansimulation_emidetails VALUES ('121', 'LOAN002', 'AD0000', '2019-03-01', '2019', '3', '37328', '26078', '11250', '37328', '1473922', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('122', 'LOAN002', 'AD0000', '2019-04-01', '2019', '4', '37328', '26273', '11054', '74655', '1447649', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('123', 'LOAN002', 'AD0000', '2019-05-01', '2019', '5', '37328', '26470', '10857', '111983', '1421179', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('124', 'LOAN002', 'AD0000', '2019-06-01', '2019', '6', '37328', '26669', '10659', '149310', '1394510', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('125', 'LOAN002', 'AD0000', '2019-07-01', '2019', '7', '37328', '26869', '10459', '186638', '1367642', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('126', 'LOAN002', 'AD0000', '2019-08-01', '2019', '8', '37328', '27070', '10257', '223965', '1340571', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('127', 'LOAN002', 'AD0000', '2019-09-01', '2019', '9', '37328', '27273', '10054', '261293', '1313298', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('128', 'LOAN002', 'AD0000', '2019-10-01', '2019', '10', '37328', '27478', '9850', '298621', '1285820', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('129', 'LOAN002', 'AD0000', '2019-11-01', '2019', '11', '37328', '27684', '9644', '335948', '1258136', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('130', 'LOAN002', 'AD0000', '2019-12-01', '2019', '12', '37328', '27892', '9436', '373276', '1230245', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('131', 'LOAN002', 'AD0000', '2020-01-01', '2020', '1', '37328', '28101', '9227', '410603', '1202144', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('132', 'LOAN002', 'AD0000', '2020-02-01', '2020', '2', '37328', '28311', '9016', '447931', '1173833', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('133', 'LOAN002', 'AD0000', '2020-03-01', '2020', '3', '37328', '28524', '8804', '485258', '1145309', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('134', 'LOAN002', 'AD0000', '2020-04-01', '2020', '4', '37328', '28738', '8590', '522586', '1116571', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('135', 'LOAN002', 'AD0000', '2020-05-01', '2020', '5', '37328', '28953', '8374', '559913', '1087618', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('136', 'LOAN002', 'AD0000', '2020-06-01', '2020', '6', '37328', '29170', '8157', '597241', '1058447', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('137', 'LOAN002', 'AD0000', '2020-07-01', '2020', '7', '37328', '29389', '7938', '634569', '1029058', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('138', 'LOAN002', 'AD0000', '2020-08-01', '2020', '8', '37328', '29610', '7718', '671896', '999449', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('139', 'LOAN002', 'AD0000', '2020-09-01', '2020', '9', '37328', '29832', '7496', '709224', '969617', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('140', 'LOAN002', 'AD0000', '2020-10-01', '2020', '10', '37328', '30055', '7272', '746551', '939561', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('141', 'LOAN002', 'AD0000', '2020-11-01', '2020', '11', '37328', '30281', '7047', '783879', '909281', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('142', 'LOAN002', 'AD0000', '2020-12-01', '2020', '12', '37328', '30508', '6820', '821206', '878773', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('143', 'LOAN002', 'AD0000', '2021-01-01', '2021', '1', '37328', '30737', '6591', '858534', '848036', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('144', 'LOAN002', 'AD0000', '2021-02-01', '2021', '2', '37328', '30967', '6360', '895862', '817068', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('145', 'LOAN002', 'AD0000', '2021-03-01', '2021', '3', '37328', '31200', '6128', '933189', '785869', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('146', 'LOAN002', 'AD0000', '2021-04-01', '2021', '4', '37328', '31434', '5894', '970517', '754435', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('147', 'LOAN002', 'AD0000', '2021-05-01', '2021', '5', '37328', '31669', '5658', '1007844', '722766', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('148', 'LOAN002', 'AD0000', '2021-06-01', '2021', '6', '37328', '31907', '5421', '1045172', '690859', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('149', 'LOAN002', 'AD0000', '2021-07-01', '2021', '7', '37328', '32146', '5181', '1082499', '658713', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('150', 'LOAN002', 'AD0000', '2021-08-01', '2021', '8', '37328', '32387', '4940', '1119827', '626326', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('151', 'LOAN002', 'AD0000', '2021-09-01', '2021', '9', '37328', '32630', '4697', '1157154', '593696', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('152', 'LOAN002', 'AD0000', '2021-10-01', '2021', '10', '37328', '32875', '4453', '1194482', '560821', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('153', 'LOAN002', 'AD0000', '2021-11-01', '2021', '11', '37328', '33121', '4206', '1231810', '527700', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('154', 'LOAN002', 'AD0000', '2021-12-01', '2021', '12', '37328', '33370', '3958', '1269137', '494330', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('155', 'LOAN002', 'AD0000', '2022-01-01', '2022', '1', '37328', '33620', '3707', '1306465', '460710', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('156', 'LOAN002', 'AD0000', '2022-02-01', '2022', '2', '37328', '33872', '3455', '1343792', '426837', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('157', 'LOAN002', 'AD0000', '2022-03-01', '2022', '3', '37328', '34126', '3201', '1381120', '392711', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('158', 'LOAN002', 'AD0000', '2022-04-01', '2022', '4', '37328', '34382', '2945', '1418447', '358329', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('159', 'LOAN002', 'AD0000', '2022-05-01', '2022', '5', '37328', '34640', '2687', '1455775', '323689', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('160', 'LOAN002', 'AD0000', '2022-06-01', '2022', '6', '37328', '34900', '2428', '1493103', '288789', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('161', 'LOAN002', 'AD0000', '2022-07-01', '2022', '7', '37328', '35162', '2166', '1530430', '253627', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('162', 'LOAN002', 'AD0000', '2022-08-01', '2022', '8', '37328', '35425', '1902', '1567758', '218202', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('163', 'LOAN002', 'AD0000', '2022-09-01', '2022', '9', '37328', '35691', '1637', '1605085', '182511', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('164', 'LOAN002', 'AD0000', '2022-10-01', '2022', '10', '37328', '35959', '1369', '1642413', '146552', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('165', 'LOAN002', 'AD0000', '2022-11-01', '2022', '11', '37328', '36228', '1099', '1679740', '110324', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('166', 'LOAN002', 'AD0000', '2022-12-01', '2022', '12', '37328', '36500', '827', '1717068', '73824', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('167', 'LOAN002', 'AD0000', '2023-01-01', '2023', '1', '37328', '36774', '554', '1754395', '37050', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('168', 'LOAN002', 'AD0000', '2023-02-01', '2023', '2', '37328', '37050', '278', '1791723', '0', 'Admin', '2020-09-30 16:36:18', null, '2020-09-30 16:36:18', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1465', 'LOAN001', 'AD0000', '2020-01-10', '2020', '1', '40362', '27362', '13000', '40362', '1972638', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1466', 'LOAN001', 'AD0000', '2020-02-10', '2020', '2', '40362', '27539', '12822', '80723', '1945099', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1467', 'LOAN001', 'AD0000', '2020-03-10', '2020', '3', '40362', '27718', '12643', '121085', '1917380', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1468', 'LOAN001', 'AD0000', '2020-04-10', '2020', '4', '40362', '27899', '12463', '161447', '1889482', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1469', 'LOAN001', 'AD0000', '2020-05-10', '2020', '5', '40362', '28080', '12282', '201808', '1861402', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1470', 'LOAN001', 'AD0000', '2020-06-10', '2020', '6', '40362', '28263', '12099', '242170', '1833139', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1471', 'LOAN001', 'AD0000', '2020-07-10', '2020', '7', '40362', '28446', '11915', '282531', '1804693', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1472', 'LOAN001', 'AD0000', '2020-08-10', '2020', '8', '40362', '28631', '11731', '322893', '1776062', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1473', 'LOAN001', 'AD0000', '2020-09-10', '2020', '9', '40362', '28817', '11544', '363255', '1747245', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1474', 'LOAN001', 'AD0000', '2020-10-10', '2020', '10', '40362', '29005', '11357', '403616', '1718240', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1475', 'LOAN001', 'AD0000', '2020-11-10', '2020', '11', '40362', '29193', '11169', '443978', '1689047', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1476', 'LOAN001', 'AD0000', '2020-12-10', '2020', '12', '200000', '189021', '10979', '200000', '1500026', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '1', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1477', 'LOAN001', 'AD0000', '2021-01-10', '2021', '1', '36479', '26729', '9750', '236479', '1473297', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1478', 'LOAN001', 'AD0000', '2021-02-10', '2021', '2', '100000', '90424', '9576', '100000', '1382873', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '1', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1479', 'LOAN001', 'AD0000', '2021-03-10', '2021', '3', '34877', '25889', '8989', '134877', '1356984', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1480', 'LOAN001', 'AD0000', '2021-04-10', '2021', '4', '34877', '26057', '8820', '169755', '1330927', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1481', 'LOAN001', 'AD0000', '2021-05-10', '2021', '5', '34877', '26226', '8651', '204632', '1304701', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1482', 'LOAN001', 'AD0000', '2021-06-10', '2021', '6', '34877', '26397', '8481', '239509', '1278304', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1483', 'LOAN001', 'AD0000', '2021-07-10', '2021', '7', '34877', '26568', '8309', '274387', '1251736', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1484', 'LOAN001', 'AD0000', '2021-08-10', '2021', '8', '34877', '26741', '8136', '309264', '1224995', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1485', 'LOAN001', 'AD0000', '2021-09-10', '2021', '9', '34877', '26915', '7962', '344141', '1198080', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1486', 'LOAN001', 'AD0000', '2021-10-10', '2021', '10', '34877', '27090', '7788', '379018', '1170990', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1487', 'LOAN001', 'AD0000', '2021-11-10', '2021', '11', '34877', '27266', '7611', '413896', '1143725', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1488', 'LOAN001', 'AD0000', '2021-12-10', '2021', '12', '34877', '27443', '7434', '448773', '1116282', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1489', 'LOAN001', 'AD0000', '2022-01-10', '2022', '1', '34877', '27621', '7256', '483650', '1088660', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1490', 'LOAN001', 'AD0000', '2022-02-10', '2022', '2', '34877', '27801', '7076', '518528', '1060859', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1491', 'LOAN001', 'AD0000', '2022-03-10', '2022', '3', '34877', '27982', '6896', '553405', '1032877', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1492', 'LOAN001', 'AD0000', '2022-04-10', '2022', '4', '34877', '28164', '6714', '588282', '1004714', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1493', 'LOAN001', 'AD0000', '2022-05-10', '2022', '5', '34877', '28347', '6531', '623160', '976367', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1494', 'LOAN001', 'AD0000', '2022-06-10', '2022', '6', '34877', '28531', '6346', '658037', '947836', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1495', 'LOAN001', 'AD0000', '2022-07-10', '2022', '7', '34877', '28716', '6161', '692914', '919120', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1496', 'LOAN001', 'AD0000', '2022-08-10', '2022', '8', '34877', '28903', '5974', '727791', '890217', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1497', 'LOAN001', 'AD0000', '2022-09-10', '2022', '9', '34877', '29091', '5786', '762669', '861126', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1498', 'LOAN001', 'AD0000', '2022-10-10', '2022', '10', '34877', '29280', '5597', '797546', '831846', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1499', 'LOAN001', 'AD0000', '2022-11-10', '2022', '11', '34877', '29470', '5407', '832423', '802376', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1500', 'LOAN001', 'AD0000', '2022-12-10', '2022', '12', '34877', '29662', '5215', '867301', '772714', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1501', 'LOAN001', 'AD0000', '2023-01-10', '2023', '1', '34877', '29855', '5023', '902178', '742859', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1502', 'LOAN001', 'AD0000', '2023-02-10', '2023', '2', '34877', '30049', '4829', '937055', '712810', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1503', 'LOAN001', 'AD0000', '2023-03-10', '2023', '3', '34877', '30244', '4633', '971933', '682566', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1504', 'LOAN001', 'AD0000', '2023-04-10', '2023', '4', '34877', '30441', '4437', '1006810', '652126', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1505', 'LOAN001', 'AD0000', '2023-05-10', '2023', '5', '34877', '30638', '4239', '1041687', '621487', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1506', 'LOAN001', 'AD0000', '2023-06-10', '2023', '6', '34877', '30838', '4040', '1076565', '590649', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1507', 'LOAN001', 'AD0000', '2023-07-10', '2023', '7', '34877', '31038', '3839', '1111442', '559611', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1508', 'LOAN001', 'AD0000', '2023-08-10', '2023', '8', '34877', '31240', '3637', '1146319', '528372', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1509', 'LOAN001', 'AD0000', '2023-09-10', '2023', '9', '34877', '31443', '3434', '1181196', '496929', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1510', 'LOAN001', 'AD0000', '2023-10-10', '2023', '10', '34877', '31647', '3230', '1216074', '465281', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1511', 'LOAN001', 'AD0000', '2023-11-10', '2023', '11', '34877', '31853', '3024', '1250951', '433428', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1512', 'LOAN001', 'AD0000', '2023-12-10', '2023', '12', '34877', '32060', '2817', '1285828', '401368', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1513', 'LOAN001', 'AD0000', '2024-01-10', '2024', '1', '34877', '32268', '2609', '1320706', '369100', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1514', 'LOAN001', 'AD0000', '2024-02-10', '2024', '2', '34877', '32478', '2399', '1355583', '336622', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1515', 'LOAN001', 'AD0000', '2024-03-10', '2024', '3', '34877', '32689', '2188', '1390460', '303933', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1516', 'LOAN001', 'AD0000', '2024-04-10', '2024', '4', '34877', '32902', '1976', '1425338', '271031', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1517', 'LOAN001', 'AD0000', '2024-05-10', '2024', '5', '34877', '33116', '1762', '1460215', '237915', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1518', 'LOAN001', 'AD0000', '2024-06-10', '2024', '6', '34877', '33331', '1546', '1495092', '204584', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1519', 'LOAN001', 'AD0000', '2024-07-10', '2024', '7', '34877', '33548', '1330', '1529969', '171037', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1520', 'LOAN001', 'AD0000', '2024-08-10', '2024', '8', '34877', '33766', '1112', '1564847', '137271', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1521', 'LOAN001', 'AD0000', '2024-09-10', '2024', '9', '34877', '33985', '892', '1599724', '103286', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1522', 'LOAN001', 'AD0000', '2024-10-10', '2024', '10', '34877', '34206', '671', '1634601', '69080', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1523', 'LOAN001', 'AD0000', '2024-11-10', '2024', '11', '34877', '34428', '449', '1669479', '34652', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1524', 'LOAN001', 'AD0000', '2024-12-10', '2024', '12', '34877', '34652', '225', '1704356', '-0', 'Admin', '2020-09-30 17:02:38', null, '2020-09-30 17:02:38', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1580', 'LOAN003', 'AD0000', '2020-01-10', '2020', '1', '1000000', '880000', '120000', '', '11120000', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '1', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1581', 'LOAN003', 'AD0000', '2020-02-10', '2020', '2', '500000', '388800', '111200', '', '10731200', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1582', 'LOAN003', 'AD0000', '2020-03-10', '2020', '3', '1000000', '892688', '107312', '', '9838512', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '1', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1583', 'LOAN003', 'AD0000', '2020-04-10', '2020', '4', '500000', '401615', '98385', '', '9436897', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1584', 'LOAN003', 'AD0000', '2020-05-10', '2020', '5', '500000', '405631', '94369', '', '9031266', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1585', 'LOAN003', 'AD0000', '2020-06-10', '2020', '6', '500000', '409687', '90313', '', '8621579', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1586', 'LOAN003', 'AD0000', '2020-07-10', '2020', '7', '500000', '413784', '86216', '', '8207795', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1587', 'LOAN003', 'AD0000', '2020-08-10', '2020', '8', '500000', '417922', '82078', '', '7789872', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1588', 'LOAN003', 'AD0000', '2020-09-10', '2020', '9', '500000', '422101', '77899', '', '7367771', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1589', 'LOAN003', 'AD0000', '2020-10-10', '2020', '10', '500000', '426322', '73678', '', '6941449', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1590', 'LOAN003', 'AD0000', '2020-11-10', '2020', '11', '500000', '430586', '69414', '', '6510863', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1591', 'LOAN003', 'AD0000', '2020-12-10', '2020', '12', '500000', '434891', '65109', '', '6075972', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1592', 'LOAN003', 'AD0000', '2021-01-10', '2021', '1', '500000', '439240', '60760', '', '5636732', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1593', 'LOAN003', 'AD0000', '2021-02-10', '2021', '2', '500000', '443633', '56367', '', '5193099', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1594', 'LOAN003', 'AD0000', '2021-03-10', '2021', '3', '500000', '448069', '51931', '', '4745030', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1595', 'LOAN003', 'AD0000', '2021-04-10', '2021', '4', '500000', '452550', '47450', '', '4292480', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1596', 'LOAN003', 'AD0000', '2021-05-10', '2021', '5', '500000', '457075', '42925', '', '3835405', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1597', 'LOAN003', 'AD0000', '2021-06-10', '2021', '6', '500000', '461646', '38354', '', '3373759', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1598', 'LOAN003', 'AD0000', '2021-07-10', '2021', '7', '500000', '466262', '33738', '', '2907497', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1599', 'LOAN003', 'AD0000', '2021-08-10', '2021', '8', '500000', '470925', '29075', '', '2436572', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1600', 'LOAN003', 'AD0000', '2021-09-10', '2021', '9', '500000', '475634', '24366', '', '1960938', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1601', 'LOAN003', 'AD0000', '2021-10-10', '2021', '10', '500000', '480391', '19609', '', '1480547', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1602', 'LOAN003', 'AD0000', '2021-11-10', '2021', '11', '500000', '485195', '14805', '', '995352', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1603', 'LOAN003', 'AD0000', '2021-12-10', '2021', '12', '500000', '490046', '9954', '', '505306', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1604', 'LOAN003', 'AD0000', '2022-01-10', '2022', '1', '500000', '494947', '5053', '', '10359', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');
INSERT INTO ams_loansimulation_emidetails VALUES ('1605', 'LOAN003', 'AD0000', '2022-02-10', '2022', '2', '500000', '499896', '104', '', '0', 'Admin', '2020-10-03 15:13:44', null, '2020-10-03 15:13:44', '0', '0');

-- ----------------------------
-- Table structure for `ams_loan_details`
-- ----------------------------
DROP TABLE IF EXISTS `ams_loan_details`;
CREATE TABLE `ams_loan_details` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `userId` varchar(10) DEFAULT NULL,
  `loanId` varchar(10) DEFAULT NULL,
  `loanName` varchar(100) DEFAULT NULL,
  `houseAddress` varchar(100) DEFAULT NULL,
  `loanAmount` int(30) DEFAULT NULL,
  `interestRate` varchar(10) DEFAULT NULL,
  `loanTerm` int(3) DEFAULT NULL,
  `paymentCount` int(3) DEFAULT NULL,
  `perMonthTotal` int(3) NOT NULL,
  `perMonthAmount` int(30) NOT NULL,
  `startDate` varchar(12) DEFAULT NULL,
  `emiDate` varchar(12) DEFAULT NULL,
  `endDate` varchar(12) DEFAULT NULL,
  `belongsTo` int(3) DEFAULT NULL,
  `bank` int(3) DEFAULT NULL,
  `createdBy` varchar(30) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `updatedBy` varchar(30) DEFAULT NULL,
  `updatedDateTime` datetime DEFAULT NULL,
  `activeFlg` int(3) NOT NULL DEFAULT '0',
  `delFlg` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_loan_details
-- ----------------------------
INSERT INTO ams_loan_details VALUES ('1', 'AD0000', 'LOAN001', 'チサンマンション第２新大阪 - 305 号,大文マンション - 1008号', 'HOUSE001,HOUSE003', '1200', '12', '3', '12', '1', '500000', '2020-01-07', '2020-01-10', null, '1', '1', 'Admin', '2020-09-15 13:33:29', 'Admin', '2020-10-03 09:39:53', '0', '0');
INSERT INTO ams_loan_details VALUES ('2', 'AD0000', 'LOAN002', 'Others', 'Others', '1000', '10', '12', '12', '0', '0', '2020-06-01', '2020-06-10', null, '1', '1', 'Admin', '2020-09-15 13:35:34', null, null, '0', '0');
INSERT INTO ams_loan_details VALUES ('3', 'AD0000', 'LOAN003', 'チサンマンション - 207号', 'HOUSE005', '500', '3.1', '3', '12', '2', '138000', '2020-07-09', '2020-07-10', null, '2', '3', 'Admin', '2020-09-17 07:11:34', 'Admin', '2020-09-17 07:13:22', '0', '0');
INSERT INTO ams_loan_details VALUES ('4', 'AD0000', 'LOAN004', 'Osaka Mansion - 608号', 'HOUSE004', '400', '10', '8', '12', '0', '0', '2020-09-26', '2020-09-28', '2020-08-31', '1', '1', 'Admin', '2020-09-17 15:34:10', null, null, '1', '0');
INSERT INTO ams_loan_details VALUES ('5', 'AD0000', 'LOAN005', '大京ビルマンション - 904号', 'HOUSE002', '2000', '5', '7', '12', '0', '0', '2020-09-01', '2022-03-02', null, '1', '1', 'Admin', '2020-09-17 23:53:02', 'Admin', '2020-09-18 03:50:46', '0', '0');
INSERT INTO ams_loan_details VALUES ('6', 'AD0000', 'LOAN006', 'Others', 'Others', '600', '4', '4', '12', '0', '0', '2018-02-01', '2018-02-01', '2020-09-21', '3', '1', 'Admin', '2020-09-17 23:58:59', 'Admin', '2020-09-21 10:33:59', '1', '0');
INSERT INTO ams_loan_details VALUES ('7', 'AD0000', 'LOAN007', 'Jewel Loan', 'Others', '100', '10', '1', '12', '0', '0', '2019-01-01', '2019-01-01', '2020-09-23', '2', '2', 'Admin', '2020-09-23 10:59:44', null, null, '1', '0');
INSERT INTO ams_loan_details VALUES ('8', 'AD0000', 'LOAN008', 'Others', 'Others', '1900', '3.6', '17', '12', '0', '0', '2020-09-02', '2020-09-09', null, '4', '3', 'Admin', '2020-09-25 09:18:27', 'Admin', '2020-10-01 01:20:36', '0', '0');

-- ----------------------------
-- Table structure for `ams_loan_emidetails`
-- ----------------------------
DROP TABLE IF EXISTS `ams_loan_emidetails`;
CREATE TABLE `ams_loan_emidetails` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `loanId` varchar(10) DEFAULT NULL,
  `userId` varchar(10) DEFAULT NULL,
  `bank` int(3) DEFAULT NULL,
  `belongsTo` int(3) DEFAULT NULL,
  `emiDate` varchar(12) DEFAULT NULL,
  `year` int(6) DEFAULT NULL,
  `month` int(3) DEFAULT NULL,
  `monthPayment` varchar(30) NOT NULL,
  `monthPrinciple` varchar(30) DEFAULT NULL,
  `monthInterest` varchar(30) DEFAULT NULL,
  `monthAmount` varchar(30) DEFAULT NULL,
  `loanBalance` varchar(30) DEFAULT NULL,
  `createdBy` varchar(30) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(30) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `editFlg` int(3) NOT NULL DEFAULT '0',
  `delFlg` int(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3419 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_loan_emidetails
-- ----------------------------
INSERT INTO ams_loan_emidetails VALUES ('145', 'LOAN002', 'AD0000', '1', '1', '2020-06-10', '2020', '6', '119508', '36174', '83333', '119508', '9963826', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('146', 'LOAN002', 'AD0000', '1', '1', '2020-07-10', '2020', '7', '119508', '36476', '83032', '239016', '9927350', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('147', 'LOAN002', 'AD0000', '1', '1', '2020-08-10', '2020', '8', '119508', '36780', '82728', '358523', '9890570', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('148', 'LOAN002', 'AD0000', '1', '1', '2020-09-10', '2020', '9', '119508', '37086', '82421', '478031', '9853483', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('149', 'LOAN002', 'AD0000', '1', '1', '2020-10-10', '2020', '10', '119508', '37395', '82112', '597539', '9816088', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('150', 'LOAN002', 'AD0000', '1', '1', '2020-11-10', '2020', '11', '119508', '37707', '81801', '717047', '9778381', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('151', 'LOAN002', 'AD0000', '1', '1', '2020-12-10', '2020', '12', '119508', '38021', '81487', '836555', '9740359', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('152', 'LOAN002', 'AD0000', '1', '1', '2021-01-10', '2021', '1', '119508', '38338', '81170', '956063', '9702021', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('153', 'LOAN002', 'AD0000', '1', '1', '2021-02-10', '2021', '2', '119508', '38658', '80850', '1075570', '9663364', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('154', 'LOAN002', 'AD0000', '1', '1', '2021-03-10', '2021', '3', '119508', '38980', '80528', '1195078', '9624384', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('155', 'LOAN002', 'AD0000', '1', '1', '2021-04-10', '2021', '4', '119508', '39305', '80203', '1314586', '9585079', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('156', 'LOAN002', 'AD0000', '1', '1', '2021-05-10', '2021', '5', '119508', '39632', '79876', '1434094', '9545447', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('157', 'LOAN002', 'AD0000', '1', '1', '2021-06-10', '2021', '6', '119508', '39962', '79545', '1553602', '9505485', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('158', 'LOAN002', 'AD0000', '1', '1', '2021-07-10', '2021', '7', '119508', '40295', '79212', '1673110', '9465189', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('159', 'LOAN002', 'AD0000', '1', '1', '2021-08-10', '2021', '8', '119508', '40631', '78877', '1792617', '9424558', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('160', 'LOAN002', 'AD0000', '1', '1', '2021-09-10', '2021', '9', '119508', '40970', '78538', '1912125', '9383588', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('161', 'LOAN002', 'AD0000', '1', '1', '2021-10-10', '2021', '10', '119508', '41311', '78197', '2031633', '9342277', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('162', 'LOAN002', 'AD0000', '1', '1', '2021-11-10', '2021', '11', '119508', '41656', '77852', '2151141', '9300621', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('163', 'LOAN002', 'AD0000', '1', '1', '2021-12-10', '2021', '12', '119508', '42003', '77505', '2270649', '9258619', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('164', 'LOAN002', 'AD0000', '1', '1', '2022-01-10', '2022', '1', '119508', '42353', '77155', '2390157', '9216266', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('165', 'LOAN002', 'AD0000', '1', '1', '2022-02-10', '2022', '2', '119508', '42706', '76802', '2509664', '9173560', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('166', 'LOAN002', 'AD0000', '1', '1', '2022-03-10', '2022', '3', '119508', '43061', '76446', '2629172', '9130499', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('167', 'LOAN002', 'AD0000', '1', '1', '2022-04-10', '2022', '4', '119508', '43420', '76087', '2748680', '9087078', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('168', 'LOAN002', 'AD0000', '1', '1', '2022-05-10', '2022', '5', '119508', '43782', '75726', '2868188', '9043296', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('169', 'LOAN002', 'AD0000', '1', '1', '2022-06-10', '2022', '6', '119508', '44147', '75361', '2987696', '8999149', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('170', 'LOAN002', 'AD0000', '1', '1', '2022-07-10', '2022', '7', '119508', '44515', '74993', '3107203', '8954634', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('171', 'LOAN002', 'AD0000', '1', '1', '2022-08-10', '2022', '8', '119508', '44886', '74622', '3226711', '8909748', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('172', 'LOAN002', 'AD0000', '1', '1', '2022-09-10', '2022', '9', '119508', '45260', '74248', '3346219', '8864489', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('173', 'LOAN002', 'AD0000', '1', '1', '2022-10-10', '2022', '10', '119508', '45637', '73871', '3465727', '8818851', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('174', 'LOAN002', 'AD0000', '1', '1', '2022-11-10', '2022', '11', '119508', '46017', '73490', '3585235', '8772834', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('175', 'LOAN002', 'AD0000', '1', '1', '2022-12-10', '2022', '12', '119508', '46401', '73107', '3704743', '8726433', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('176', 'LOAN002', 'AD0000', '1', '1', '2023-01-10', '2023', '1', '119508', '46788', '72720', '3824250', '8679646', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('177', 'LOAN002', 'AD0000', '1', '1', '2023-02-10', '2023', '2', '119508', '47177', '72330', '3943758', '8632468', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('178', 'LOAN002', 'AD0000', '1', '1', '2023-03-10', '2023', '3', '119508', '47571', '71937', '4063266', '8584898', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('179', 'LOAN002', 'AD0000', '1', '1', '2023-04-10', '2023', '4', '119508', '47967', '71541', '4182774', '8536931', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('180', 'LOAN002', 'AD0000', '1', '1', '2023-05-10', '2023', '5', '119508', '48367', '71141', '4302282', '8488564', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('181', 'LOAN002', 'AD0000', '1', '1', '2023-06-10', '2023', '6', '119508', '48770', '70738', '4421790', '8439794', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('182', 'LOAN002', 'AD0000', '1', '1', '2023-07-10', '2023', '7', '119508', '49176', '70332', '4541297', '8390618', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('183', 'LOAN002', 'AD0000', '1', '1', '2023-08-10', '2023', '8', '119508', '49586', '69922', '4660805', '8341032', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('184', 'LOAN002', 'AD0000', '1', '1', '2023-09-10', '2023', '9', '119508', '49999', '69509', '4780313', '8291033', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('185', 'LOAN002', 'AD0000', '1', '1', '2023-10-10', '2023', '10', '119508', '50416', '69092', '4899821', '8240617', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('186', 'LOAN002', 'AD0000', '1', '1', '2023-11-10', '2023', '11', '119508', '50836', '68672', '5019329', '8189781', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('187', 'LOAN002', 'AD0000', '1', '1', '2023-12-10', '2023', '12', '119508', '51260', '68248', '5138837', '8138521', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('188', 'LOAN002', 'AD0000', '1', '1', '2024-01-10', '2024', '1', '119508', '51687', '67821', '5258344', '8086834', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('189', 'LOAN002', 'AD0000', '1', '1', '2024-02-10', '2024', '2', '119508', '52118', '67390', '5377852', '8034717', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('190', 'LOAN002', 'AD0000', '1', '1', '2024-03-10', '2024', '3', '119508', '52552', '66956', '5497360', '7982165', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('191', 'LOAN002', 'AD0000', '1', '1', '2024-04-10', '2024', '4', '119508', '52990', '66518', '5616868', '7929175', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('192', 'LOAN002', 'AD0000', '1', '1', '2024-05-10', '2024', '5', '119508', '53431', '66076', '5736376', '7875744', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('193', 'LOAN002', 'AD0000', '1', '1', '2024-06-10', '2024', '6', '119508', '53877', '65631', '5855883', '7821867', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('194', 'LOAN002', 'AD0000', '1', '1', '2024-07-10', '2024', '7', '119508', '54326', '65182', '5975391', '7767541', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('195', 'LOAN002', 'AD0000', '1', '1', '2024-08-10', '2024', '8', '119508', '54778', '64730', '6094899', '7712763', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('196', 'LOAN002', 'AD0000', '1', '1', '2024-09-10', '2024', '9', '119508', '55235', '64273', '6214407', '7657528', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('197', 'LOAN002', 'AD0000', '1', '1', '2024-10-10', '2024', '10', '119508', '55695', '63813', '6333915', '7601833', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('198', 'LOAN002', 'AD0000', '1', '1', '2024-11-10', '2024', '11', '119508', '56159', '63349', '6453423', '7545674', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('199', 'LOAN002', 'AD0000', '1', '1', '2024-12-10', '2024', '12', '119508', '56627', '62881', '6572930', '7489047', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('200', 'LOAN002', 'AD0000', '1', '1', '2025-01-10', '2025', '1', '119508', '57099', '62409', '6692438', '7431948', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('201', 'LOAN002', 'AD0000', '1', '1', '2025-02-10', '2025', '2', '119508', '57575', '61933', '6811946', '7374373', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('202', 'LOAN002', 'AD0000', '1', '1', '2025-03-10', '2025', '3', '119508', '58055', '61453', '6931454', '7316318', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('203', 'LOAN002', 'AD0000', '1', '1', '2025-04-10', '2025', '4', '119508', '58539', '60969', '7050962', '7257780', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('204', 'LOAN002', 'AD0000', '1', '1', '2025-05-10', '2025', '5', '119508', '59026', '60481', '7170470', '7198753', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('205', 'LOAN002', 'AD0000', '1', '1', '2025-06-10', '2025', '6', '119508', '59518', '59990', '7289977', '7139235', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('206', 'LOAN002', 'AD0000', '1', '1', '2025-07-10', '2025', '7', '119508', '60014', '59494', '7409485', '7079221', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('207', 'LOAN002', 'AD0000', '1', '1', '2025-08-10', '2025', '8', '119508', '60514', '58994', '7528993', '7018706', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('208', 'LOAN002', 'AD0000', '1', '1', '2025-09-10', '2025', '9', '119508', '61019', '58489', '7648501', '6957688', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('209', 'LOAN002', 'AD0000', '1', '1', '2025-10-10', '2025', '10', '119508', '61527', '57981', '7768009', '6896161', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('210', 'LOAN002', 'AD0000', '1', '1', '2025-11-10', '2025', '11', '119508', '62040', '57468', '7887517', '6834121', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('211', 'LOAN002', 'AD0000', '1', '1', '2025-12-10', '2025', '12', '119508', '62557', '56951', '8007024', '6771564', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('212', 'LOAN002', 'AD0000', '1', '1', '2026-01-10', '2026', '1', '119508', '63078', '56430', '8126532', '6708486', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('213', 'LOAN002', 'AD0000', '1', '1', '2026-02-10', '2026', '2', '119508', '63604', '55904', '8246040', '6644882', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('214', 'LOAN002', 'AD0000', '1', '1', '2026-03-10', '2026', '3', '119508', '64134', '55374', '8365548', '6580748', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('215', 'LOAN002', 'AD0000', '1', '1', '2026-04-10', '2026', '4', '119508', '64668', '54840', '8485056', '6516080', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('216', 'LOAN002', 'AD0000', '1', '1', '2026-05-10', '2026', '5', '119508', '65207', '54301', '8604563', '6450873', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('217', 'LOAN002', 'AD0000', '1', '1', '2026-06-10', '2026', '6', '119508', '65751', '53757', '8724071', '6385122', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('218', 'LOAN002', 'AD0000', '1', '1', '2026-07-10', '2026', '7', '119508', '66298', '53209', '8843579', '6318824', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('219', 'LOAN002', 'AD0000', '1', '1', '2026-08-10', '2026', '8', '119508', '66851', '52657', '8963087', '6251973', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('220', 'LOAN002', 'AD0000', '1', '1', '2026-09-10', '2026', '9', '119508', '67408', '52100', '9082595', '6184565', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('221', 'LOAN002', 'AD0000', '1', '1', '2026-10-10', '2026', '10', '119508', '67970', '51538', '9202103', '6116595', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('222', 'LOAN002', 'AD0000', '1', '1', '2026-11-10', '2026', '11', '119508', '68536', '50972', '9321610', '6048059', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('223', 'LOAN002', 'AD0000', '1', '1', '2026-12-10', '2026', '12', '119508', '69107', '50400', '9441118', '5978952', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('224', 'LOAN002', 'AD0000', '1', '1', '2027-01-10', '2027', '1', '119508', '69683', '49825', '9560626', '5909268', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('225', 'LOAN002', 'AD0000', '1', '1', '2027-02-10', '2027', '2', '119508', '70264', '49244', '9680134', '5839004', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('226', 'LOAN002', 'AD0000', '1', '1', '2027-03-10', '2027', '3', '119508', '70849', '48658', '9799642', '5768155', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('227', 'LOAN002', 'AD0000', '1', '1', '2027-04-10', '2027', '4', '119508', '71440', '48068', '9919150', '5696715', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('228', 'LOAN002', 'AD0000', '1', '1', '2027-05-10', '2027', '5', '119508', '72035', '47473', '10038657', '5624680', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('229', 'LOAN002', 'AD0000', '1', '1', '2027-06-10', '2027', '6', '119508', '72635', '46872', '10158165', '5552044', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('230', 'LOAN002', 'AD0000', '1', '1', '2027-07-10', '2027', '7', '119508', '73241', '46267', '10277673', '5478804', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('231', 'LOAN002', 'AD0000', '1', '1', '2027-08-10', '2027', '8', '119508', '73851', '45657', '10397181', '5404953', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('232', 'LOAN002', 'AD0000', '1', '1', '2027-09-10', '2027', '9', '119508', '74467', '45041', '10516689', '5330486', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('233', 'LOAN002', 'AD0000', '1', '1', '2027-10-10', '2027', '10', '119508', '75087', '44421', '10636197', '5255399', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('234', 'LOAN002', 'AD0000', '1', '1', '2027-11-10', '2027', '11', '119508', '75713', '43795', '10755704', '5179686', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('235', 'LOAN002', 'AD0000', '1', '1', '2027-12-10', '2027', '12', '119508', '76344', '43164', '10875212', '5103342', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('236', 'LOAN002', 'AD0000', '1', '1', '2028-01-10', '2028', '1', '119508', '76980', '42528', '10994720', '5026362', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('237', 'LOAN002', 'AD0000', '1', '1', '2028-02-10', '2028', '2', '119508', '77621', '41886', '11114228', '4948741', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('238', 'LOAN002', 'AD0000', '1', '1', '2028-03-10', '2028', '3', '119508', '78268', '41240', '11233736', '4870472', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('239', 'LOAN002', 'AD0000', '1', '1', '2028-04-10', '2028', '4', '119508', '78921', '40587', '11353243', '4791552', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('240', 'LOAN002', 'AD0000', '1', '1', '2028-05-10', '2028', '5', '119508', '79578', '39930', '11472751', '4711974', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('241', 'LOAN002', 'AD0000', '1', '1', '2028-06-10', '2028', '6', '119508', '80241', '39266', '11592259', '4631732', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('242', 'LOAN002', 'AD0000', '1', '1', '2028-07-10', '2028', '7', '119508', '80910', '38598', '11711767', '4550822', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('243', 'LOAN002', 'AD0000', '1', '1', '2028-08-10', '2028', '8', '119508', '81584', '37924', '11831275', '4469238', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('244', 'LOAN002', 'AD0000', '1', '1', '2028-09-10', '2028', '9', '119508', '82264', '37244', '11950783', '4386974', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('245', 'LOAN002', 'AD0000', '1', '1', '2028-10-10', '2028', '10', '119508', '82950', '36558', '12070290', '4304024', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('246', 'LOAN002', 'AD0000', '1', '1', '2028-11-10', '2028', '11', '119508', '83641', '35867', '12189798', '4220383', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('247', 'LOAN002', 'AD0000', '1', '1', '2028-12-10', '2028', '12', '119508', '84338', '35170', '12309306', '4136045', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('248', 'LOAN002', 'AD0000', '1', '1', '2029-01-10', '2029', '1', '119508', '85041', '34467', '12428814', '4051004', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('249', 'LOAN002', 'AD0000', '1', '1', '2029-02-10', '2029', '2', '119508', '85749', '33758', '12548322', '3965255', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('250', 'LOAN002', 'AD0000', '1', '1', '2029-03-10', '2029', '3', '119508', '86464', '33044', '12667830', '3878791', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('251', 'LOAN002', 'AD0000', '1', '1', '2029-04-10', '2029', '4', '119508', '87185', '32323', '12787337', '3791606', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('252', 'LOAN002', 'AD0000', '1', '1', '2029-05-10', '2029', '5', '119508', '87911', '31597', '12906845', '3703695', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('253', 'LOAN002', 'AD0000', '1', '1', '2029-06-10', '2029', '6', '119508', '88644', '30864', '13026353', '3615051', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('254', 'LOAN002', 'AD0000', '1', '1', '2029-07-10', '2029', '7', '119508', '89382', '30125', '13145861', '3525669', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('255', 'LOAN002', 'AD0000', '1', '1', '2029-08-10', '2029', '8', '119508', '90127', '29381', '13265369', '3435542', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('256', 'LOAN002', 'AD0000', '1', '1', '2029-09-10', '2029', '9', '119508', '90878', '28630', '13384877', '3344664', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('257', 'LOAN002', 'AD0000', '1', '1', '2029-10-10', '2029', '10', '119508', '91636', '27872', '13504384', '3253028', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('258', 'LOAN002', 'AD0000', '1', '1', '2029-11-10', '2029', '11', '119508', '92399', '27109', '13623892', '3160629', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('259', 'LOAN002', 'AD0000', '1', '1', '2029-12-10', '2029', '12', '119508', '93169', '26339', '13743400', '3067459', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('260', 'LOAN002', 'AD0000', '1', '1', '2030-01-10', '2030', '1', '119508', '93946', '25562', '13862908', '2973514', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('261', 'LOAN002', 'AD0000', '1', '1', '2030-02-10', '2030', '2', '119508', '94729', '24779', '13982416', '2878785', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('262', 'LOAN002', 'AD0000', '1', '1', '2030-03-10', '2030', '3', '119508', '95518', '23990', '14101924', '2783267', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('263', 'LOAN002', 'AD0000', '1', '1', '2030-04-10', '2030', '4', '119508', '96314', '23194', '14221431', '2686953', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('264', 'LOAN002', 'AD0000', '1', '1', '2030-05-10', '2030', '5', '119508', '97117', '22391', '14340939', '2589837', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('265', 'LOAN002', 'AD0000', '1', '1', '2030-06-10', '2030', '6', '119508', '97926', '21582', '14460447', '2491911', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('266', 'LOAN002', 'AD0000', '1', '1', '2030-07-10', '2030', '7', '119508', '98742', '20766', '14579955', '2393169', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('267', 'LOAN002', 'AD0000', '1', '1', '2030-08-10', '2030', '8', '119508', '99565', '19943', '14699463', '2293604', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('268', 'LOAN002', 'AD0000', '1', '1', '2030-09-10', '2030', '9', '119508', '100394', '19113', '14818970', '2193210', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('269', 'LOAN002', 'AD0000', '1', '1', '2030-10-10', '2030', '10', '119508', '101231', '18277', '14938478', '2091979', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('270', 'LOAN002', 'AD0000', '1', '1', '2030-11-10', '2030', '11', '119508', '102075', '17433', '15057986', '1989904', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('271', 'LOAN002', 'AD0000', '1', '1', '2030-12-10', '2030', '12', '119508', '102925', '16583', '15177494', '1886979', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('272', 'LOAN002', 'AD0000', '1', '1', '2031-01-10', '2031', '1', '119508', '103783', '15725', '15297002', '1783196', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('273', 'LOAN002', 'AD0000', '1', '1', '2031-02-10', '2031', '2', '119508', '104648', '14860', '15416510', '1678548', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('274', 'LOAN002', 'AD0000', '1', '1', '2031-03-10', '2031', '3', '119508', '105520', '13988', '15536017', '1573028', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('275', 'LOAN002', 'AD0000', '1', '1', '2031-04-10', '2031', '4', '119508', '106399', '13109', '15655525', '1466629', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('276', 'LOAN002', 'AD0000', '1', '1', '2031-05-10', '2031', '5', '119508', '107286', '12222', '15775033', '1359343', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('277', 'LOAN002', 'AD0000', '1', '1', '2031-06-10', '2031', '6', '119508', '108180', '11328', '15894541', '1251163', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('278', 'LOAN002', 'AD0000', '1', '1', '2031-07-10', '2031', '7', '119508', '109081', '10426', '16014049', '1142081', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('279', 'LOAN002', 'AD0000', '1', '1', '2031-08-10', '2031', '8', '119508', '109990', '9517', '16133557', '1032091', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('280', 'LOAN002', 'AD0000', '1', '1', '2031-09-10', '2031', '9', '119508', '110907', '8601', '16253064', '921184', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('281', 'LOAN002', 'AD0000', '1', '1', '2031-10-10', '2031', '10', '119508', '111831', '7677', '16372572', '809352', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('282', 'LOAN002', 'AD0000', '1', '1', '2031-11-10', '2031', '11', '119508', '112763', '6745', '16492080', '696589', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('283', 'LOAN002', 'AD0000', '1', '1', '2031-12-10', '2031', '12', '119508', '113703', '5805', '16611588', '582886', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('284', 'LOAN002', 'AD0000', '1', '1', '2032-01-10', '2032', '1', '119508', '114650', '4857', '16731096', '468236', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('285', 'LOAN002', 'AD0000', '1', '1', '2032-02-10', '2032', '2', '119508', '115606', '3902', '16850604', '352630', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('286', 'LOAN002', 'AD0000', '1', '1', '2032-03-10', '2032', '3', '119508', '116569', '2939', '16970111', '236061', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('287', 'LOAN002', 'AD0000', '1', '1', '2032-04-10', '2032', '4', '119508', '117541', '1967', '17089619', '118520', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('288', 'LOAN002', 'AD0000', '1', '1', '2032-05-10', '2032', '5', '119508', '118520', '988', '17209127', '-0', 'Admin', '2020-09-15 19:05:34', null, '2020-09-15 19:05:34', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('578', 'LOAN003', 'AD0000', '3', '2', '2020-07-10', '2020', '7', '182716', '170000', '12716', '', '4830000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '1', '0');
INSERT INTO ams_loan_emidetails VALUES ('579', 'LOAN003', 'AD0000', '3', '2', '2020-08-10', '2020', '8', '150478', '138000', '12478', '', '4692000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('580', 'LOAN003', 'AD0000', '3', '2', '2020-09-10', '2020', '9', '150121', '138000', '12121', '', '4554000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('581', 'LOAN003', 'AD0000', '3', '2', '2020-10-10', '2020', '10', '149765', '138000', '11765', '', '4416000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('582', 'LOAN003', 'AD0000', '3', '2', '2020-11-10', '2020', '11', '149408', '138000', '11408', '', '4278000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('583', 'LOAN003', 'AD0000', '3', '2', '2020-12-10', '2020', '12', '149052', '138000', '11052', '', '4140000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('584', 'LOAN003', 'AD0000', '3', '2', '2021-01-10', '2021', '1', '148695', '138000', '10695', '', '4002000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('585', 'LOAN003', 'AD0000', '3', '2', '2021-02-10', '2021', '2', '148339', '138000', '10339', '', '3864000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('586', 'LOAN003', 'AD0000', '3', '2', '2021-03-10', '2021', '3', '147982', '138000', '9982', '', '3726000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('587', 'LOAN003', 'AD0000', '3', '2', '2021-04-10', '2021', '4', '147626', '138000', '9626', '', '3588000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('588', 'LOAN003', 'AD0000', '3', '2', '2021-05-10', '2021', '5', '147269', '138000', '9269', '', '3450000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('589', 'LOAN003', 'AD0000', '3', '2', '2021-06-10', '2021', '6', '146913', '138000', '8913', '', '3312000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('590', 'LOAN003', 'AD0000', '3', '2', '2021-07-10', '2021', '7', '146556', '138000', '8556', '', '3174000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('591', 'LOAN003', 'AD0000', '3', '2', '2021-08-10', '2021', '8', '146200', '138000', '8200', '', '3036000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('592', 'LOAN003', 'AD0000', '3', '2', '2021-09-10', '2021', '9', '145843', '138000', '7843', '', '2898000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('593', 'LOAN003', 'AD0000', '3', '2', '2021-10-10', '2021', '10', '145487', '138000', '7487', '', '2760000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('594', 'LOAN003', 'AD0000', '3', '2', '2021-11-10', '2021', '11', '145130', '138000', '7130', '', '2622000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('595', 'LOAN003', 'AD0000', '3', '2', '2021-12-10', '2021', '12', '144774', '138000', '6774', '', '2484000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('596', 'LOAN003', 'AD0000', '3', '2', '2022-01-10', '2022', '1', '144417', '138000', '6417', '', '2346000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('597', 'LOAN003', 'AD0000', '3', '2', '2022-02-10', '2022', '2', '144061', '138000', '6061', '', '2208000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('598', 'LOAN003', 'AD0000', '3', '2', '2022-03-10', '2022', '3', '143704', '138000', '5704', '', '2070000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('599', 'LOAN003', 'AD0000', '3', '2', '2022-04-10', '2022', '4', '143348', '138000', '5348', '', '1932000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('600', 'LOAN003', 'AD0000', '3', '2', '2022-05-10', '2022', '5', '142991', '138000', '4991', '', '1794000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('601', 'LOAN003', 'AD0000', '3', '2', '2022-06-10', '2022', '6', '142635', '138000', '4635', '', '1656000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('602', 'LOAN003', 'AD0000', '3', '2', '2022-07-10', '2022', '7', '142278', '138000', '4278', '', '1518000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('603', 'LOAN003', 'AD0000', '3', '2', '2022-08-10', '2022', '8', '141922', '138000', '3922', '', '1380000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('604', 'LOAN003', 'AD0000', '3', '2', '2022-09-10', '2022', '9', '141565', '138000', '3565', '', '1242000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('605', 'LOAN003', 'AD0000', '3', '2', '2022-10-10', '2022', '10', '141209', '138000', '3209', '', '1104000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('606', 'LOAN003', 'AD0000', '3', '2', '2022-11-10', '2022', '11', '140852', '138000', '2852', '', '966000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('607', 'LOAN003', 'AD0000', '3', '2', '2022-12-10', '2022', '12', '140496', '138000', '2496', '', '828000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('608', 'LOAN003', 'AD0000', '3', '2', '2023-01-10', '2023', '1', '140139', '138000', '2139', '', '690000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('609', 'LOAN003', 'AD0000', '3', '2', '2023-02-10', '2023', '2', '139783', '138000', '1783', '', '552000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('610', 'LOAN003', 'AD0000', '3', '2', '2023-03-10', '2023', '3', '139426', '138000', '1426', '', '414000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('611', 'LOAN003', 'AD0000', '3', '2', '2023-04-10', '2023', '4', '139070', '138000', '1070', '', '276000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('612', 'LOAN003', 'AD0000', '3', '2', '2023-05-10', '2023', '5', '138713', '138000', '713', '', '138000', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('613', 'LOAN003', 'AD0000', '3', '2', '2023-06-10', '2023', '6', '138357', '138000', '357', '', '0', 'Admin', '2020-09-17 12:44:57', null, '2020-09-17 12:44:57', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1250', 'LOAN006', 'AD0000', '1', '3', '2018-02-01', '2018', '2', '135474', '115474', '20000', '135474', '5884526', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1251', 'LOAN006', 'AD0000', '1', '3', '2018-03-01', '2018', '3', '135474', '115859', '19615', '270949', '5768666', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1252', 'LOAN006', 'AD0000', '1', '3', '2018-04-01', '2018', '4', '135474', '116245', '19229', '406423', '5652421', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1253', 'LOAN006', 'AD0000', '1', '3', '2018-05-01', '2018', '5', '135474', '116633', '18841', '541897', '5535788', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1254', 'LOAN006', 'AD0000', '1', '3', '2018-06-01', '2018', '6', '135474', '117022', '18453', '677372', '5418766', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1255', 'LOAN006', 'AD0000', '1', '3', '2018-07-01', '2018', '7', '135474', '117412', '18063', '812846', '5301355', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1256', 'LOAN006', 'AD0000', '1', '3', '2018-08-01', '2018', '8', '135474', '117803', '17671', '948320', '5183552', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1257', 'LOAN006', 'AD0000', '1', '3', '2018-09-01', '2018', '9', '135474', '118196', '17279', '1083795', '5065356', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1258', 'LOAN006', 'AD0000', '1', '3', '2018-10-01', '2018', '10', '135474', '118590', '16885', '1219269', '4946766', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1259', 'LOAN006', 'AD0000', '1', '3', '2018-11-01', '2018', '11', '135474', '118985', '16489', '1354743', '4827781', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1260', 'LOAN006', 'AD0000', '1', '3', '2018-12-01', '2018', '12', '135474', '119382', '16093', '1490218', '4708399', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1261', 'LOAN006', 'AD0000', '1', '3', '2019-01-01', '2019', '1', '135474', '119780', '15695', '1625692', '4588620', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1262', 'LOAN006', 'AD0000', '1', '3', '2019-02-01', '2019', '2', '135474', '120179', '15295', '1761166', '4468441', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1263', 'LOAN006', 'AD0000', '1', '3', '2019-03-01', '2019', '3', '135474', '120580', '14895', '1896641', '4347861', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1264', 'LOAN006', 'AD0000', '1', '3', '2019-04-01', '2019', '4', '135474', '120981', '14493', '2032115', '4226880', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1265', 'LOAN006', 'AD0000', '1', '3', '2019-05-01', '2019', '5', '135474', '121385', '14090', '2167589', '4105495', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1266', 'LOAN006', 'AD0000', '1', '3', '2019-06-01', '2019', '6', '135474', '121789', '13685', '2303064', '3983706', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1267', 'LOAN006', 'AD0000', '1', '3', '2019-07-01', '2019', '7', '135474', '122195', '13279', '2438538', '3861510', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1268', 'LOAN006', 'AD0000', '1', '3', '2019-08-01', '2019', '8', '135474', '122603', '12872', '2574012', '3738908', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1269', 'LOAN006', 'AD0000', '1', '3', '2019-09-01', '2019', '9', '135474', '123011', '12463', '2709487', '3615896', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1270', 'LOAN006', 'AD0000', '1', '3', '2019-10-01', '2019', '10', '135474', '123421', '12053', '2844961', '3492475', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1271', 'LOAN006', 'AD0000', '1', '3', '2019-11-01', '2019', '11', '135474', '123833', '11642', '2980435', '3368642', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1272', 'LOAN006', 'AD0000', '1', '3', '2019-12-01', '2019', '12', '135474', '124246', '11229', '3115910', '3244397', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1273', 'LOAN006', 'AD0000', '1', '3', '2020-01-01', '2020', '1', '135474', '124660', '10815', '3251384', '3119737', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1274', 'LOAN006', 'AD0000', '1', '3', '2020-02-01', '2020', '2', '135474', '125075', '10399', '3386858', '2994662', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1275', 'LOAN006', 'AD0000', '1', '3', '2020-03-01', '2020', '3', '135474', '125492', '9982', '3522333', '2869170', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1276', 'LOAN006', 'AD0000', '1', '3', '2020-04-01', '2020', '4', '135474', '125910', '9564', '3657807', '2743259', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1277', 'LOAN006', 'AD0000', '1', '3', '2020-05-01', '2020', '5', '135474', '126330', '9144', '3793281', '2616929', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1278', 'LOAN006', 'AD0000', '1', '3', '2020-06-01', '2020', '6', '135474', '126751', '8723', '3928756', '2490178', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1279', 'LOAN006', 'AD0000', '1', '3', '2020-07-01', '2020', '7', '135474', '127174', '8301', '4064230', '2363004', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1280', 'LOAN006', 'AD0000', '1', '3', '2020-08-01', '2020', '8', '135474', '127598', '7877', '4199704', '2235407', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1281', 'LOAN006', 'AD0000', '1', '3', '2020-09-01', '2020', '9', '135474', '128023', '7451', '4335179', '2107384', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1282', 'LOAN006', 'AD0000', '1', '3', '2020-09-21', '2020', '9', '1978934', '1978934', '0', '1978934', '0', 'Admin', '2020-09-21 16:06:07', null, '2020-09-21 16:06:07', '1', '0');
INSERT INTO ams_loan_emidetails VALUES ('1283', 'LOAN004', 'AD0000', '1', '1', '2020-08-31', '2020', '8', '3972637', '3972637', '0', '3972637', '0', 'Admin', '2020-09-23 05:26:55', null, '2020-09-23 05:26:55', '1', '0');
INSERT INTO ams_loan_emidetails VALUES ('1296', 'LOAN007', 'AD0000', '2', '2', '2019-01-01', '2019', '1', '87916', '79577', '8339', '87916', '920423', 'Admin', '2020-09-23 16:30:29', null, '2020-09-23 16:30:29', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1297', 'LOAN007', 'AD0000', '2', '2', '2019-02-01', '2019', '2', '87916', '80241', '7676', '175832', '840182', 'Admin', '2020-09-23 16:30:29', null, '2020-09-23 16:30:29', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1298', 'LOAN007', 'AD0000', '2', '2', '2019-03-01', '2019', '3', '87917', '80911', '7006', '263749', '759272', 'Admin', '2020-09-23 16:30:29', null, '2020-09-23 16:30:29', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1299', 'LOAN007', 'AD0000', '2', '2', '2019-04-01', '2019', '4', '87918', '81586', '6332', '351667', '677686', 'Admin', '2020-09-23 16:30:29', null, '2020-09-23 16:30:29', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1300', 'LOAN007', 'AD0000', '2', '2', '2019-05-01', '2019', '5', '87918', '82267', '5651', '439585', '595419', 'Admin', '2020-09-23 16:30:29', null, '2020-09-23 16:30:29', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1301', 'LOAN007', 'AD0000', '2', '2', '2019-06-01', '2019', '6', '87919', '82953', '4965', '527504', '512466', 'Admin', '2020-09-23 16:30:29', null, '2020-09-23 16:30:29', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1302', 'LOAN007', 'AD0000', '2', '2', '2019-07-01', '2019', '7', '87919', '83646', '4274', '615423', '428820', 'Admin', '2020-09-23 16:30:29', null, '2020-09-23 16:30:29', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1303', 'LOAN007', 'AD0000', '2', '2', '2019-08-01', '2019', '8', '87920', '84344', '3576', '703343', '344476', 'Admin', '2020-09-23 16:30:29', null, '2020-09-23 16:30:29', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1304', 'LOAN007', 'AD0000', '2', '2', '2019-09-01', '2019', '9', '87921', '85048', '2873', '791263', '259428', 'Admin', '2020-09-23 16:30:29', null, '2020-09-23 16:30:29', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1305', 'LOAN007', 'AD0000', '2', '2', '2019-10-01', '2019', '10', '87921', '85758', '2163', '879185', '173670', 'Admin', '2020-09-23 16:30:29', null, '2020-09-23 16:30:29', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1306', 'LOAN007', 'AD0000', '2', '2', '2019-11-01', '2019', '11', '87922', '86474', '1448', '967107', '87196', 'Admin', '2020-09-23 16:30:29', null, '2020-09-23 16:30:29', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('1307', 'LOAN007', 'AD0000', '2', '2', '2019-12-01', '2019', '12', '87923', '87196', '727', '1055030', '1', 'Admin', '2020-09-23 16:30:29', null, '2020-09-23 16:30:29', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2904', 'LOAN008', 'AD0000', '3', '4', '2020-09-09', '2020', '9', '124662', '67662', '57000', '124662', '18932338', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2905', 'LOAN008', 'AD0000', '3', '4', '2020-10-09', '2020', '10', '124662', '67865', '56797', '249323', '18864474', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2906', 'LOAN008', 'AD0000', '3', '4', '2020-11-09', '2020', '11', '124662', '68068', '56593', '373985', '18796406', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2907', 'LOAN008', 'AD0000', '3', '4', '2020-12-09', '2020', '12', '124662', '68272', '56389', '498647', '18728133', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2908', 'LOAN008', 'AD0000', '3', '4', '2021-01-09', '2021', '1', '124662', '68477', '56184', '623308', '18659656', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2909', 'LOAN008', 'AD0000', '3', '4', '2021-02-09', '2021', '2', '124662', '68683', '55979', '747970', '18590973', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2910', 'LOAN008', 'AD0000', '3', '4', '2021-03-09', '2021', '3', '124662', '68889', '55773', '872631', '18522085', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2911', 'LOAN008', 'AD0000', '3', '4', '2021-04-09', '2021', '4', '124662', '69095', '55566', '997293', '18452989', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2912', 'LOAN008', 'AD0000', '3', '4', '2021-05-09', '2021', '5', '124662', '69303', '55359', '1121955', '18383686', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2913', 'LOAN008', 'AD0000', '3', '4', '2021-06-09', '2021', '6', '124662', '69511', '55151', '1246616', '18314176', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2914', 'LOAN008', 'AD0000', '3', '4', '2021-07-09', '2021', '7', '124662', '69719', '54943', '1371278', '18244457', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2915', 'LOAN008', 'AD0000', '3', '4', '2021-08-09', '2021', '8', '124662', '69928', '54733', '1495940', '18174529', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2916', 'LOAN008', 'AD0000', '3', '4', '2021-09-09', '2021', '9', '124662', '70138', '54524', '1620601', '18104390', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2917', 'LOAN008', 'AD0000', '3', '4', '2021-10-09', '2021', '10', '124662', '70348', '54313', '1745263', '18034042', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2918', 'LOAN008', 'AD0000', '3', '4', '2021-11-09', '2021', '11', '124662', '70560', '54102', '1869924', '17963483', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2919', 'LOAN008', 'AD0000', '3', '4', '2021-12-09', '2021', '12', '124662', '70771', '53890', '1994586', '17892711', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2920', 'LOAN008', 'AD0000', '3', '4', '2022-01-09', '2022', '1', '124662', '70983', '53678', '2119248', '17821728', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2921', 'LOAN008', 'AD0000', '3', '4', '2022-02-09', '2022', '2', '124662', '71196', '53465', '2243909', '17750531', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2922', 'LOAN008', 'AD0000', '3', '4', '2022-03-09', '2022', '3', '124662', '71410', '53252', '2368571', '17679121', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2923', 'LOAN008', 'AD0000', '3', '4', '2022-04-09', '2022', '4', '124662', '71624', '53037', '2493233', '17607497', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2924', 'LOAN008', 'AD0000', '3', '4', '2022-05-09', '2022', '5', '124662', '71839', '52822', '2617894', '17535658', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2925', 'LOAN008', 'AD0000', '3', '4', '2022-06-09', '2022', '6', '124662', '72055', '52607', '2742556', '17463603', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2926', 'LOAN008', 'AD0000', '3', '4', '2022-07-09', '2022', '7', '124662', '72271', '52391', '2867218', '17391332', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2927', 'LOAN008', 'AD0000', '3', '4', '2022-08-09', '2022', '8', '124662', '72488', '52174', '2991879', '17318845', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2928', 'LOAN008', 'AD0000', '3', '4', '2022-09-09', '2022', '9', '124662', '72705', '51957', '3116541', '17246140', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2929', 'LOAN008', 'AD0000', '3', '4', '2022-10-09', '2022', '10', '124662', '72923', '51738', '3241202', '17173216', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2930', 'LOAN008', 'AD0000', '3', '4', '2022-11-09', '2022', '11', '124662', '73142', '51520', '3365864', '17100075', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2931', 'LOAN008', 'AD0000', '3', '4', '2022-12-09', '2022', '12', '124662', '73361', '51300', '3490526', '17026713', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2932', 'LOAN008', 'AD0000', '3', '4', '2023-01-09', '2023', '1', '124662', '73581', '51080', '3615187', '16953132', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2933', 'LOAN008', 'AD0000', '3', '4', '2023-02-09', '2023', '2', '124662', '73802', '50859', '3739849', '16879329', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2934', 'LOAN008', 'AD0000', '3', '4', '2023-03-09', '2023', '3', '124662', '74024', '50638', '3864511', '16805306', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2935', 'LOAN008', 'AD0000', '3', '4', '2023-04-09', '2023', '4', '124662', '74246', '50416', '3989172', '16731060', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2936', 'LOAN008', 'AD0000', '3', '4', '2023-05-09', '2023', '5', '124662', '74468', '50193', '4113834', '16656592', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2937', 'LOAN008', 'AD0000', '3', '4', '2023-06-09', '2023', '6', '124662', '74692', '49970', '4238496', '16581900', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2938', 'LOAN008', 'AD0000', '3', '4', '2023-07-09', '2023', '7', '124662', '74916', '49746', '4363157', '16506984', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2939', 'LOAN008', 'AD0000', '3', '4', '2023-08-09', '2023', '8', '124662', '75141', '49521', '4487819', '16431843', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2940', 'LOAN008', 'AD0000', '3', '4', '2023-09-09', '2023', '9', '124662', '75366', '49296', '4612480', '16356477', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2941', 'LOAN008', 'AD0000', '3', '4', '2023-10-09', '2023', '10', '124662', '75592', '49069', '4737142', '16280885', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2942', 'LOAN008', 'AD0000', '3', '4', '2023-11-09', '2023', '11', '124662', '75819', '48843', '4861804', '16205066', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2943', 'LOAN008', 'AD0000', '3', '4', '2023-12-09', '2023', '12', '124662', '76046', '48615', '4986465', '16129019', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2944', 'LOAN008', 'AD0000', '3', '4', '2024-01-09', '2024', '1', '124662', '76275', '48387', '5111127', '16052745', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2945', 'LOAN008', 'AD0000', '3', '4', '2024-02-09', '2024', '2', '124662', '76503', '48158', '5235789', '15976241', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2946', 'LOAN008', 'AD0000', '3', '4', '2024-03-09', '2024', '3', '124662', '76733', '47929', '5360450', '15899508', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2947', 'LOAN008', 'AD0000', '3', '4', '2024-04-09', '2024', '4', '124662', '76963', '47699', '5485112', '15822545', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2948', 'LOAN008', 'AD0000', '3', '4', '2024-05-09', '2024', '5', '124662', '77194', '47468', '5609773', '15745351', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2949', 'LOAN008', 'AD0000', '3', '4', '2024-06-09', '2024', '6', '124662', '77426', '47236', '5734435', '15667926', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2950', 'LOAN008', 'AD0000', '3', '4', '2024-07-09', '2024', '7', '124662', '77658', '47004', '5859097', '15590268', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2951', 'LOAN008', 'AD0000', '3', '4', '2024-08-09', '2024', '8', '124662', '77891', '46771', '5983758', '15512377', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2952', 'LOAN008', 'AD0000', '3', '4', '2024-09-09', '2024', '9', '124662', '78125', '46537', '6108420', '15434253', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2953', 'LOAN008', 'AD0000', '3', '4', '2024-10-09', '2024', '10', '124662', '78359', '46303', '6233082', '15355894', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2954', 'LOAN008', 'AD0000', '3', '4', '2024-11-09', '2024', '11', '124662', '78594', '46068', '6357743', '15277300', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2955', 'LOAN008', 'AD0000', '3', '4', '2024-12-09', '2024', '12', '124662', '78830', '45832', '6482405', '15198470', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2956', 'LOAN008', 'AD0000', '3', '4', '2025-01-09', '2025', '1', '124662', '79066', '45595', '6607067', '15119404', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2957', 'LOAN008', 'AD0000', '3', '4', '2025-02-09', '2025', '2', '124662', '79303', '45358', '6731728', '15040100', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2958', 'LOAN008', 'AD0000', '3', '4', '2025-03-09', '2025', '3', '124662', '79541', '45120', '6856390', '14960559', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2959', 'LOAN008', 'AD0000', '3', '4', '2025-04-09', '2025', '4', '124662', '79780', '44882', '6981051', '14880779', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2960', 'LOAN008', 'AD0000', '3', '4', '2025-05-09', '2025', '5', '124662', '80019', '44642', '7105713', '14800760', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2961', 'LOAN008', 'AD0000', '3', '4', '2025-06-09', '2025', '6', '124662', '80259', '44402', '7230375', '14720500', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2962', 'LOAN008', 'AD0000', '3', '4', '2025-07-09', '2025', '7', '124662', '80500', '44162', '7355036', '14640000', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2963', 'LOAN008', 'AD0000', '3', '4', '2025-08-09', '2025', '8', '124662', '80742', '43920', '7479698', '14559259', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2964', 'LOAN008', 'AD0000', '3', '4', '2025-09-09', '2025', '9', '124662', '80984', '43678', '7604360', '14478275', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2965', 'LOAN008', 'AD0000', '3', '4', '2025-10-09', '2025', '10', '124662', '81227', '43435', '7729021', '14397048', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2966', 'LOAN008', 'AD0000', '3', '4', '2025-11-09', '2025', '11', '124662', '81470', '43191', '7853683', '14315578', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2967', 'LOAN008', 'AD0000', '3', '4', '2025-12-09', '2025', '12', '124662', '81715', '42947', '7978345', '14233863', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2968', 'LOAN008', 'AD0000', '3', '4', '2026-01-09', '2026', '1', '124662', '81960', '42702', '8103006', '14151903', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2969', 'LOAN008', 'AD0000', '3', '4', '2026-02-09', '2026', '2', '124662', '82206', '42456', '8227668', '14069697', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2970', 'LOAN008', 'AD0000', '3', '4', '2026-03-09', '2026', '3', '124662', '82453', '42209', '8352329', '13987244', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2971', 'LOAN008', 'AD0000', '3', '4', '2026-04-09', '2026', '4', '124662', '82700', '41962', '8476991', '13904544', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2972', 'LOAN008', 'AD0000', '3', '4', '2026-05-09', '2026', '5', '124662', '82948', '41714', '8601653', '13821596', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2973', 'LOAN008', 'AD0000', '3', '4', '2026-06-09', '2026', '6', '124662', '83197', '41465', '8726314', '13738399', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2974', 'LOAN008', 'AD0000', '3', '4', '2026-07-09', '2026', '7', '124662', '83446', '41215', '8850976', '13654953', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2975', 'LOAN008', 'AD0000', '3', '4', '2026-08-09', '2026', '8', '124662', '83697', '40965', '8975638', '13571256', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2976', 'LOAN008', 'AD0000', '3', '4', '2026-09-09', '2026', '9', '124662', '83948', '40714', '9100299', '13487308', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2977', 'LOAN008', 'AD0000', '3', '4', '2026-10-09', '2026', '10', '124662', '84200', '40462', '9224961', '13403109', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2978', 'LOAN008', 'AD0000', '3', '4', '2026-11-09', '2026', '11', '124662', '84452', '40209', '9349622', '13318656', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2979', 'LOAN008', 'AD0000', '3', '4', '2026-12-09', '2026', '12', '124662', '84706', '39956', '9474284', '13233951', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2980', 'LOAN008', 'AD0000', '3', '4', '2027-01-09', '2027', '1', '124662', '84960', '39702', '9598946', '13148991', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2981', 'LOAN008', 'AD0000', '3', '4', '2027-02-09', '2027', '2', '124662', '85215', '39447', '9723607', '13063776', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2982', 'LOAN008', 'AD0000', '3', '4', '2027-03-09', '2027', '3', '124662', '85470', '39191', '9848269', '12978306', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2983', 'LOAN008', 'AD0000', '3', '4', '2027-04-09', '2027', '4', '124662', '85727', '38935', '9972931', '12892579', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2984', 'LOAN008', 'AD0000', '3', '4', '2027-05-09', '2027', '5', '124662', '85984', '38678', '10097592', '12806595', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2985', 'LOAN008', 'AD0000', '3', '4', '2027-06-09', '2027', '6', '124662', '86242', '38420', '10222254', '12720353', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2986', 'LOAN008', 'AD0000', '3', '4', '2027-07-09', '2027', '7', '124662', '86501', '38161', '10346916', '12633853', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2987', 'LOAN008', 'AD0000', '3', '4', '2027-08-09', '2027', '8', '124662', '86760', '37902', '10471577', '12547093', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2988', 'LOAN008', 'AD0000', '3', '4', '2027-09-09', '2027', '9', '124662', '87020', '37641', '10596239', '12460072', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2989', 'LOAN008', 'AD0000', '3', '4', '2027-10-09', '2027', '10', '124662', '87281', '37380', '10720900', '12372791', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2990', 'LOAN008', 'AD0000', '3', '4', '2027-11-09', '2027', '11', '124662', '87543', '37118', '10845562', '12285248', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2991', 'LOAN008', 'AD0000', '3', '4', '2027-12-09', '2027', '12', '124662', '87806', '36856', '10970224', '12197442', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2992', 'LOAN008', 'AD0000', '3', '4', '2028-01-09', '2028', '1', '124662', '88069', '36592', '11094885', '12109373', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2993', 'LOAN008', 'AD0000', '3', '4', '2028-02-09', '2028', '2', '124662', '88334', '36328', '11219547', '12021039', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2994', 'LOAN008', 'AD0000', '3', '4', '2028-03-09', '2028', '3', '124662', '88599', '36063', '11344209', '11932441', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2995', 'LOAN008', 'AD0000', '3', '4', '2028-04-09', '2028', '4', '124662', '88864', '35797', '11468870', '11843576', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2996', 'LOAN008', 'AD0000', '3', '4', '2028-05-09', '2028', '5', '124662', '89131', '35531', '11593532', '11754445', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2997', 'LOAN008', 'AD0000', '3', '4', '2028-06-09', '2028', '6', '124662', '89398', '35263', '11718194', '11665047', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2998', 'LOAN008', 'AD0000', '3', '4', '2028-07-09', '2028', '7', '124662', '89666', '34995', '11842855', '11575381', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('2999', 'LOAN008', 'AD0000', '3', '4', '2028-08-09', '2028', '8', '124662', '89935', '34726', '11967517', '11485445', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3000', 'LOAN008', 'AD0000', '3', '4', '2028-09-09', '2028', '9', '124662', '90205', '34456', '12092178', '11395240', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3001', 'LOAN008', 'AD0000', '3', '4', '2028-10-09', '2028', '10', '124662', '90476', '34186', '12216840', '11304764', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3002', 'LOAN008', 'AD0000', '3', '4', '2028-11-09', '2028', '11', '124662', '90747', '33914', '12341502', '11214016', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3003', 'LOAN008', 'AD0000', '3', '4', '2028-12-09', '2028', '12', '124662', '91020', '33642', '12466163', '11122997', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3004', 'LOAN008', 'AD0000', '3', '4', '2029-01-09', '2029', '1', '124662', '91293', '33369', '12590825', '11031704', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3005', 'LOAN008', 'AD0000', '3', '4', '2029-02-09', '2029', '2', '124662', '91567', '33095', '12715487', '10940138', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3006', 'LOAN008', 'AD0000', '3', '4', '2029-03-09', '2029', '3', '124662', '91841', '32820', '12840148', '10848296', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3007', 'LOAN008', 'AD0000', '3', '4', '2029-04-09', '2029', '4', '124662', '92117', '32545', '12964810', '10756180', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3008', 'LOAN008', 'AD0000', '3', '4', '2029-05-09', '2029', '5', '124662', '92393', '32269', '13089471', '10663787', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3009', 'LOAN008', 'AD0000', '3', '4', '2029-06-09', '2029', '6', '124662', '92670', '31991', '13214133', '10571116', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3010', 'LOAN008', 'AD0000', '3', '4', '2029-07-09', '2029', '7', '124662', '92948', '31713', '13338795', '10478168', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3011', 'LOAN008', 'AD0000', '3', '4', '2029-08-09', '2029', '8', '124662', '93227', '31435', '13463456', '10384941', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3012', 'LOAN008', 'AD0000', '3', '4', '2029-09-09', '2029', '9', '124662', '93507', '31155', '13588118', '10291434', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3013', 'LOAN008', 'AD0000', '3', '4', '2029-10-09', '2029', '10', '124662', '93787', '30874', '13712780', '10197647', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3014', 'LOAN008', 'AD0000', '3', '4', '2029-11-09', '2029', '11', '124662', '94069', '30593', '13837441', '10103578', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3015', 'LOAN008', 'AD0000', '3', '4', '2029-12-09', '2029', '12', '124662', '94351', '30311', '13962103', '10009227', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3016', 'LOAN008', 'AD0000', '3', '4', '2030-01-09', '2030', '1', '124662', '94634', '30028', '14086765', '9914593', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3017', 'LOAN008', 'AD0000', '3', '4', '2030-02-09', '2030', '2', '124662', '94918', '29744', '14211426', '9819675', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3018', 'LOAN008', 'AD0000', '3', '4', '2030-03-09', '2030', '3', '124662', '95203', '29459', '14336088', '9724473', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3019', 'LOAN008', 'AD0000', '3', '4', '2030-04-09', '2030', '4', '124662', '95488', '29173', '14460749', '9628985', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3020', 'LOAN008', 'AD0000', '3', '4', '2030-05-09', '2030', '5', '124662', '95775', '28887', '14585411', '9533210', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3021', 'LOAN008', 'AD0000', '3', '4', '2030-06-09', '2030', '6', '124662', '96062', '28600', '14710073', '9437148', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3022', 'LOAN008', 'AD0000', '3', '4', '2030-07-09', '2030', '7', '124662', '96350', '28311', '14834734', '9340798', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3023', 'LOAN008', 'AD0000', '3', '4', '2030-08-09', '2030', '8', '124662', '96639', '28022', '14959396', '9244159', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3024', 'LOAN008', 'AD0000', '3', '4', '2030-09-09', '2030', '9', '124662', '96929', '27732', '15084058', '9147229', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3025', 'LOAN008', 'AD0000', '3', '4', '2030-10-09', '2030', '10', '124662', '97220', '27442', '15208719', '9050009', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3026', 'LOAN008', 'AD0000', '3', '4', '2030-11-09', '2030', '11', '124662', '97512', '27150', '15333381', '8952498', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3027', 'LOAN008', 'AD0000', '3', '4', '2030-12-09', '2030', '12', '124662', '97804', '26857', '15458043', '8854694', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3028', 'LOAN008', 'AD0000', '3', '4', '2031-01-09', '2031', '1', '124662', '98098', '26564', '15582704', '8756596', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3029', 'LOAN008', 'AD0000', '3', '4', '2031-02-09', '2031', '2', '124662', '98392', '26270', '15707366', '8658204', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3030', 'LOAN008', 'AD0000', '3', '4', '2031-03-09', '2031', '3', '124662', '98687', '25975', '15832027', '8559517', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3031', 'LOAN008', 'AD0000', '3', '4', '2031-04-09', '2031', '4', '124662', '98983', '25679', '15956689', '8460534', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3032', 'LOAN008', 'AD0000', '3', '4', '2031-05-09', '2031', '5', '124662', '99280', '25382', '16081351', '8361254', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3033', 'LOAN008', 'AD0000', '3', '4', '2031-06-09', '2031', '6', '124662', '99578', '25084', '16206012', '8261676', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3034', 'LOAN008', 'AD0000', '3', '4', '2031-07-09', '2031', '7', '124662', '99877', '24785', '16330674', '8161800', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3035', 'LOAN008', 'AD0000', '3', '4', '2031-08-09', '2031', '8', '124662', '100176', '24485', '16455336', '8061623', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3036', 'LOAN008', 'AD0000', '3', '4', '2031-09-09', '2031', '9', '124662', '100477', '24185', '16579997', '7961147', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3037', 'LOAN008', 'AD0000', '3', '4', '2031-10-09', '2031', '10', '124662', '100778', '23883', '16704659', '7860368', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3038', 'LOAN008', 'AD0000', '3', '4', '2031-11-09', '2031', '11', '124662', '101081', '23581', '16829320', '7759288', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3039', 'LOAN008', 'AD0000', '3', '4', '2031-12-09', '2031', '12', '124662', '101384', '23278', '16953982', '7657904', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3040', 'LOAN008', 'AD0000', '3', '4', '2032-01-09', '2032', '1', '124662', '101688', '22974', '17078644', '7556216', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3041', 'LOAN008', 'AD0000', '3', '4', '2032-02-09', '2032', '2', '124662', '101993', '22669', '17203305', '7454223', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3042', 'LOAN008', 'AD0000', '3', '4', '2032-03-09', '2032', '3', '124662', '102299', '22363', '17327967', '7351924', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3043', 'LOAN008', 'AD0000', '3', '4', '2032-04-09', '2032', '4', '124662', '102606', '22056', '17452629', '7249318', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3044', 'LOAN008', 'AD0000', '3', '4', '2032-05-09', '2032', '5', '124662', '102914', '21748', '17577290', '7146405', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3045', 'LOAN008', 'AD0000', '3', '4', '2032-06-09', '2032', '6', '124662', '103222', '21439', '17701952', '7043182', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3046', 'LOAN008', 'AD0000', '3', '4', '2032-07-09', '2032', '7', '124662', '103532', '21130', '17826614', '6939650', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3047', 'LOAN008', 'AD0000', '3', '4', '2032-08-09', '2032', '8', '124662', '103843', '20819', '17951275', '6835808', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3048', 'LOAN008', 'AD0000', '3', '4', '2032-09-09', '2032', '9', '124662', '104154', '20507', '18075937', '6731653', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3049', 'LOAN008', 'AD0000', '3', '4', '2032-10-09', '2032', '10', '124662', '104467', '20195', '18200598', '6627187', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3050', 'LOAN008', 'AD0000', '3', '4', '2032-11-09', '2032', '11', '124662', '104780', '19882', '18325260', '6522407', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3051', 'LOAN008', 'AD0000', '3', '4', '2032-12-09', '2032', '12', '124662', '105094', '19567', '18449922', '6417312', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3052', 'LOAN008', 'AD0000', '3', '4', '2033-01-09', '2033', '1', '124662', '105410', '19252', '18574583', '6311903', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3053', 'LOAN008', 'AD0000', '3', '4', '2033-02-09', '2033', '2', '124662', '105726', '18936', '18699245', '6206177', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3054', 'LOAN008', 'AD0000', '3', '4', '2033-03-09', '2033', '3', '124662', '106043', '18619', '18823907', '6100133', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3055', 'LOAN008', 'AD0000', '3', '4', '2033-04-09', '2033', '4', '124662', '106361', '18300', '18948568', '5993772', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3056', 'LOAN008', 'AD0000', '3', '4', '2033-05-09', '2033', '5', '124662', '106680', '17981', '19073230', '5887092', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3057', 'LOAN008', 'AD0000', '3', '4', '2033-06-09', '2033', '6', '124662', '107000', '17661', '19197891', '5780092', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3058', 'LOAN008', 'AD0000', '3', '4', '2033-07-09', '2033', '7', '124662', '107321', '17340', '19322553', '5672770', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3059', 'LOAN008', 'AD0000', '3', '4', '2033-08-09', '2033', '8', '124662', '107643', '17018', '19447215', '5565127', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3060', 'LOAN008', 'AD0000', '3', '4', '2033-09-09', '2033', '9', '124662', '107966', '16695', '19571876', '5457161', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3061', 'LOAN008', 'AD0000', '3', '4', '2033-10-09', '2033', '10', '124662', '108290', '16371', '19696538', '5348870', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3062', 'LOAN008', 'AD0000', '3', '4', '2033-11-09', '2033', '11', '124662', '108615', '16047', '19821200', '5240255', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3063', 'LOAN008', 'AD0000', '3', '4', '2033-12-09', '2033', '12', '124662', '108941', '15721', '19945861', '5131315', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3064', 'LOAN008', 'AD0000', '3', '4', '2034-01-09', '2034', '1', '124662', '109268', '15394', '20070523', '5022047', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3065', 'LOAN008', 'AD0000', '3', '4', '2034-02-09', '2034', '2', '124662', '109595', '15066', '20195185', '4912451', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3066', 'LOAN008', 'AD0000', '3', '4', '2034-03-09', '2034', '3', '124662', '109924', '14737', '20319846', '4802527', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3067', 'LOAN008', 'AD0000', '3', '4', '2034-04-09', '2034', '4', '124662', '110254', '14408', '20444508', '4692273', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3068', 'LOAN008', 'AD0000', '3', '4', '2034-05-09', '2034', '5', '124662', '110585', '14077', '20569169', '4581688', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3069', 'LOAN008', 'AD0000', '3', '4', '2034-06-09', '2034', '6', '124662', '110917', '13745', '20693831', '4470772', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3070', 'LOAN008', 'AD0000', '3', '4', '2034-07-09', '2034', '7', '124662', '111249', '13412', '20818493', '4359522', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3071', 'LOAN008', 'AD0000', '3', '4', '2034-08-09', '2034', '8', '124662', '111583', '13079', '20943154', '4247939', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3072', 'LOAN008', 'AD0000', '3', '4', '2034-09-09', '2034', '9', '124662', '111918', '12744', '21067816', '4136022', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3073', 'LOAN008', 'AD0000', '3', '4', '2034-10-09', '2034', '10', '124662', '112254', '12408', '21192478', '4023768', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3074', 'LOAN008', 'AD0000', '3', '4', '2034-11-09', '2034', '11', '124662', '112590', '12071', '21317139', '3911178', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3075', 'LOAN008', 'AD0000', '3', '4', '2034-12-09', '2034', '12', '124662', '112928', '11734', '21441801', '3798250', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3076', 'LOAN008', 'AD0000', '3', '4', '2035-01-09', '2035', '1', '124662', '113267', '11395', '21566463', '3684983', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3077', 'LOAN008', 'AD0000', '3', '4', '2035-02-09', '2035', '2', '124662', '113607', '11055', '21691124', '3571376', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3078', 'LOAN008', 'AD0000', '3', '4', '2035-03-09', '2035', '3', '124662', '113948', '10714', '21815786', '3457428', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3079', 'LOAN008', 'AD0000', '3', '4', '2035-04-09', '2035', '4', '124662', '114289', '10372', '21940447', '3343139', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3080', 'LOAN008', 'AD0000', '3', '4', '2035-05-09', '2035', '5', '124662', '114632', '10029', '22065109', '3228507', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3081', 'LOAN008', 'AD0000', '3', '4', '2035-06-09', '2035', '6', '124662', '114976', '9686', '22189771', '3113531', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3082', 'LOAN008', 'AD0000', '3', '4', '2035-07-09', '2035', '7', '124662', '115321', '9341', '22314432', '2998210', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3083', 'LOAN008', 'AD0000', '3', '4', '2035-08-09', '2035', '8', '124662', '115667', '8995', '22439094', '2882543', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3084', 'LOAN008', 'AD0000', '3', '4', '2035-09-09', '2035', '9', '124662', '116014', '8648', '22563756', '2766529', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3085', 'LOAN008', 'AD0000', '3', '4', '2035-10-09', '2035', '10', '124662', '116362', '8300', '22688417', '2650167', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3086', 'LOAN008', 'AD0000', '3', '4', '2035-11-09', '2035', '11', '124662', '116711', '7950', '22813079', '2533456', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3087', 'LOAN008', 'AD0000', '3', '4', '2035-12-09', '2035', '12', '124662', '117061', '7600', '22937740', '2416394', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3088', 'LOAN008', 'AD0000', '3', '4', '2036-01-09', '2036', '1', '124662', '117412', '7249', '23062402', '2298982', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3089', 'LOAN008', 'AD0000', '3', '4', '2036-02-09', '2036', '2', '124662', '117765', '6897', '23187064', '2181217', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3090', 'LOAN008', 'AD0000', '3', '4', '2036-03-09', '2036', '3', '124662', '118118', '6544', '23311725', '2063099', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3091', 'LOAN008', 'AD0000', '3', '4', '2036-04-09', '2036', '4', '124662', '118472', '6189', '23436387', '1944627', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3092', 'LOAN008', 'AD0000', '3', '4', '2036-05-09', '2036', '5', '124662', '118828', '5834', '23561049', '1825799', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3093', 'LOAN008', 'AD0000', '3', '4', '2036-06-09', '2036', '6', '124662', '119184', '5477', '23685710', '1706615', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3094', 'LOAN008', 'AD0000', '3', '4', '2036-07-09', '2036', '7', '124662', '119542', '5120', '23810372', '1587073', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3095', 'LOAN008', 'AD0000', '3', '4', '2036-08-09', '2036', '8', '124662', '119900', '4761', '23935034', '1467173', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3096', 'LOAN008', 'AD0000', '3', '4', '2036-09-09', '2036', '9', '124662', '120260', '4402', '24059695', '1346913', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3097', 'LOAN008', 'AD0000', '3', '4', '2036-10-09', '2036', '10', '124662', '120621', '4041', '24184357', '1226292', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3098', 'LOAN008', 'AD0000', '3', '4', '2036-11-09', '2036', '11', '124662', '120983', '3679', '24309018', '1105309', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3099', 'LOAN008', 'AD0000', '3', '4', '2036-12-09', '2036', '12', '124662', '121346', '3316', '24433680', '983963', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3100', 'LOAN008', 'AD0000', '3', '4', '2037-01-09', '2037', '1', '124662', '121710', '2952', '24558342', '862253', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3101', 'LOAN008', 'AD0000', '3', '4', '2037-02-09', '2037', '2', '124662', '122075', '2587', '24683003', '740179', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3102', 'LOAN008', 'AD0000', '3', '4', '2037-03-09', '2037', '3', '124662', '122441', '2221', '24807665', '617737', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3103', 'LOAN008', 'AD0000', '3', '4', '2037-04-09', '2037', '4', '124662', '122808', '1853', '24932327', '494929', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3104', 'LOAN008', 'AD0000', '3', '4', '2037-05-09', '2037', '5', '124662', '123177', '1485', '25056988', '371752', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3105', 'LOAN008', 'AD0000', '3', '4', '2037-06-09', '2037', '6', '124662', '123546', '1115', '25181650', '248206', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3106', 'LOAN008', 'AD0000', '3', '4', '2037-07-09', '2037', '7', '124662', '123917', '745', '25306312', '124289', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3107', 'LOAN008', 'AD0000', '3', '4', '2037-08-09', '2037', '8', '124662', '124289', '373', '25430973', '-0', 'Admin', '2020-10-01 06:50:37', null, '2020-10-01 06:50:37', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3108', 'LOAN005', 'AD0000', '1', '1', '2022-03-02', '2022', '3', '282678', '199345', '83333', '282678', '19800655', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3109', 'LOAN005', 'AD0000', '1', '1', '2022-04-02', '2022', '4', '282678', '200175', '82503', '565356', '19600480', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3110', 'LOAN005', 'AD0000', '1', '1', '2022-05-02', '2022', '5', '282678', '201010', '81669', '848035', '19399470', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3111', 'LOAN005', 'AD0000', '1', '1', '2022-06-02', '2022', '6', '282678', '201847', '80831', '1130713', '19197623', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3112', 'LOAN005', 'AD0000', '1', '1', '2022-07-02', '2022', '7', '282678', '202688', '79990', '1413391', '18994935', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3113', 'LOAN005', 'AD0000', '1', '1', '2022-08-02', '2022', '8', '2282678', '2203532', '79146', '2282678', '16791403', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '1', '0');
INSERT INTO ams_loan_emidetails VALUES ('3114', 'LOAN005', 'AD0000', '1', '1', '2022-09-02', '2022', '9', '252592', '182628', '69964', '2535270', '16608775', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3115', 'LOAN005', 'AD0000', '1', '1', '2022-10-02', '2022', '10', '252592', '183389', '69203', '2787863', '16425386', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3116', 'LOAN005', 'AD0000', '1', '1', '2022-11-02', '2022', '11', '252592', '184153', '68439', '3040455', '16241233', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3117', 'LOAN005', 'AD0000', '1', '1', '2022-12-02', '2022', '12', '252592', '184920', '67672', '3293047', '16056312', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3118', 'LOAN005', 'AD0000', '1', '1', '2023-01-02', '2023', '1', '252592', '185691', '66901', '3545639', '15870621', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3119', 'LOAN005', 'AD0000', '1', '1', '2023-02-02', '2023', '2', '252592', '186465', '66128', '3798232', '15684157', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3120', 'LOAN005', 'AD0000', '1', '1', '2023-03-02', '2023', '3', '252592', '187242', '65351', '4050824', '15496915', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3121', 'LOAN005', 'AD0000', '1', '1', '2023-04-02', '2023', '4', '252592', '188022', '64570', '4303416', '15308893', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3122', 'LOAN005', 'AD0000', '1', '1', '2023-05-02', '2023', '5', '252592', '188805', '63787', '4556009', '15120088', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3123', 'LOAN005', 'AD0000', '1', '1', '2023-06-02', '2023', '6', '252592', '189592', '63000', '4808601', '14930496', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3124', 'LOAN005', 'AD0000', '1', '1', '2023-07-02', '2023', '7', '252592', '190382', '62210', '5061193', '14740114', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3125', 'LOAN005', 'AD0000', '1', '1', '2023-08-02', '2023', '8', '252592', '191175', '61417', '5313785', '14548939', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3126', 'LOAN005', 'AD0000', '1', '1', '2023-09-02', '2023', '9', '252592', '191972', '60621', '5566378', '14356967', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3127', 'LOAN005', 'AD0000', '1', '1', '2023-10-02', '2023', '10', '252592', '192772', '59821', '5818970', '14164196', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3128', 'LOAN005', 'AD0000', '1', '1', '2023-11-02', '2023', '11', '252592', '193575', '59017', '6071562', '13970621', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3129', 'LOAN005', 'AD0000', '1', '1', '2023-12-02', '2023', '12', '252592', '194381', '58211', '6324155', '13776239', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3130', 'LOAN005', 'AD0000', '1', '1', '2024-01-02', '2024', '1', '252592', '195191', '57401', '6576747', '13581048', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3131', 'LOAN005', 'AD0000', '1', '1', '2024-02-02', '2024', '2', '252592', '196005', '56588', '6829339', '13385044', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3132', 'LOAN005', 'AD0000', '1', '1', '2024-03-02', '2024', '3', '252592', '196821', '55771', '7081931', '13188222', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3133', 'LOAN005', 'AD0000', '1', '1', '2024-04-02', '2024', '4', '252592', '197641', '54951', '7334524', '12990581', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3134', 'LOAN005', 'AD0000', '1', '1', '2024-05-02', '2024', '5', '252592', '198465', '54127', '7587116', '12792116', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3135', 'LOAN005', 'AD0000', '1', '1', '2024-06-02', '2024', '6', '252592', '199292', '53300', '7839708', '12592824', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3136', 'LOAN005', 'AD0000', '1', '1', '2024-07-02', '2024', '7', '252592', '200122', '52470', '8092301', '12392702', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3137', 'LOAN005', 'AD0000', '1', '1', '2024-08-02', '2024', '8', '252592', '200956', '51636', '8344893', '12191746', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3138', 'LOAN005', 'AD0000', '1', '1', '2024-09-02', '2024', '9', '252592', '201793', '50799', '8597485', '11989953', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3139', 'LOAN005', 'AD0000', '1', '1', '2024-10-02', '2024', '10', '252592', '202634', '49958', '8850077', '11787319', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3140', 'LOAN005', 'AD0000', '1', '1', '2024-11-02', '2024', '11', '252592', '203478', '49114', '9102670', '11583840', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3141', 'LOAN005', 'AD0000', '1', '1', '2024-12-02', '2024', '12', '252592', '204326', '48266', '9355262', '11379514', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3142', 'LOAN005', 'AD0000', '1', '1', '2025-01-02', '2025', '1', '252592', '205178', '47415', '9607854', '11174336', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3143', 'LOAN005', 'AD0000', '1', '1', '2025-02-02', '2025', '2', '252592', '206033', '46560', '9860447', '10968304', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3144', 'LOAN005', 'AD0000', '1', '1', '2025-03-02', '2025', '3', '252592', '206891', '45701', '10113039', '10761413', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3145', 'LOAN005', 'AD0000', '1', '1', '2025-04-02', '2025', '4', '252592', '207753', '44839', '10365631', '10553660', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3146', 'LOAN005', 'AD0000', '1', '1', '2025-05-02', '2025', '5', '252592', '208619', '43974', '10618223', '10345041', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3147', 'LOAN005', 'AD0000', '1', '1', '2025-06-02', '2025', '6', '252592', '209488', '43104', '10870816', '10135553', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3148', 'LOAN005', 'AD0000', '1', '1', '2025-07-02', '2025', '7', '252592', '210361', '42231', '11123408', '9925192', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3149', 'LOAN005', 'AD0000', '1', '1', '2025-08-02', '2025', '8', '252592', '211237', '41355', '11376000', '9713955', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3150', 'LOAN005', 'AD0000', '1', '1', '2025-09-02', '2025', '9', '252592', '212117', '40475', '11628593', '9501837', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3151', 'LOAN005', 'AD0000', '1', '1', '2025-10-02', '2025', '10', '252592', '213001', '39591', '11881185', '9288836', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3152', 'LOAN005', 'AD0000', '1', '1', '2025-11-02', '2025', '11', '252592', '213889', '38703', '12133777', '9074947', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3153', 'LOAN005', 'AD0000', '1', '1', '2025-12-02', '2025', '12', '252592', '214780', '37812', '12386369', '8860167', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3154', 'LOAN005', 'AD0000', '1', '1', '2026-01-02', '2026', '1', '252592', '215675', '36917', '12638962', '8644492', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3155', 'LOAN005', 'AD0000', '1', '1', '2026-02-02', '2026', '2', '252592', '216574', '36019', '12891554', '8427919', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3156', 'LOAN005', 'AD0000', '1', '1', '2026-03-02', '2026', '3', '252592', '217476', '35116', '13144146', '8210443', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3157', 'LOAN005', 'AD0000', '1', '1', '2026-04-02', '2026', '4', '252592', '218382', '34210', '13396739', '7992061', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3158', 'LOAN005', 'AD0000', '1', '1', '2026-05-02', '2026', '5', '252592', '219292', '33300', '13649331', '7772769', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3159', 'LOAN005', 'AD0000', '1', '1', '2026-06-02', '2026', '6', '252592', '220206', '32387', '13901923', '7552563', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3160', 'LOAN005', 'AD0000', '1', '1', '2026-07-02', '2026', '7', '252592', '221123', '31469', '14154515', '7331440', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3161', 'LOAN005', 'AD0000', '1', '1', '2026-08-02', '2026', '8', '252592', '222045', '30548', '14407108', '7109395', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3162', 'LOAN005', 'AD0000', '1', '1', '2026-09-02', '2026', '9', '252592', '222970', '29622', '14659700', '6886425', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3163', 'LOAN005', 'AD0000', '1', '1', '2026-10-02', '2026', '10', '252592', '223899', '28693', '14912292', '6662526', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3164', 'LOAN005', 'AD0000', '1', '1', '2026-11-02', '2026', '11', '252592', '224832', '27761', '15164884', '6437695', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3165', 'LOAN005', 'AD0000', '1', '1', '2026-12-02', '2026', '12', '252592', '225769', '26824', '15417477', '6211926', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3166', 'LOAN005', 'AD0000', '1', '1', '2027-01-02', '2027', '1', '252592', '226709', '25883', '15670069', '5985217', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3167', 'LOAN005', 'AD0000', '1', '1', '2027-02-02', '2027', '2', '252592', '227654', '24938', '15922661', '5757563', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3168', 'LOAN005', 'AD0000', '1', '1', '2027-03-02', '2027', '3', '252592', '228602', '23990', '16175254', '5528960', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3169', 'LOAN005', 'AD0000', '1', '1', '2027-04-02', '2027', '4', '252592', '229555', '23037', '16427846', '5299405', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3170', 'LOAN005', 'AD0000', '1', '1', '2027-05-02', '2027', '5', '252592', '230511', '22081', '16680438', '5068894', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3171', 'LOAN005', 'AD0000', '1', '1', '2027-06-02', '2027', '6', '252592', '231472', '21120', '16933030', '4837422', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3172', 'LOAN005', 'AD0000', '1', '1', '2027-07-02', '2027', '7', '252592', '232436', '20156', '17185623', '4604986', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3173', 'LOAN005', 'AD0000', '1', '1', '2027-08-02', '2027', '8', '252592', '233405', '19187', '17438215', '4371581', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3174', 'LOAN005', 'AD0000', '1', '1', '2027-09-02', '2027', '9', '252592', '234377', '18215', '17690807', '4137204', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3175', 'LOAN005', 'AD0000', '1', '1', '2027-10-02', '2027', '10', '252592', '235354', '17238', '17943400', '3901850', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3176', 'LOAN005', 'AD0000', '1', '1', '2027-11-02', '2027', '11', '252592', '236335', '16258', '18195992', '3665515', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3177', 'LOAN005', 'AD0000', '1', '1', '2027-12-02', '2027', '12', '252592', '237319', '15273', '18448584', '3428196', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3178', 'LOAN005', 'AD0000', '1', '1', '2028-01-02', '2028', '1', '252592', '238308', '14284', '18701176', '3189888', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3179', 'LOAN005', 'AD0000', '1', '1', '2028-02-02', '2028', '2', '252592', '239301', '13291', '18953769', '2950587', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3180', 'LOAN005', 'AD0000', '1', '1', '2028-03-02', '2028', '3', '252592', '240298', '12294', '19206361', '2710288', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3181', 'LOAN005', 'AD0000', '1', '1', '2028-04-02', '2028', '4', '252592', '241299', '11293', '19458953', '2468989', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3182', 'LOAN005', 'AD0000', '1', '1', '2028-05-02', '2028', '5', '252592', '242305', '10287', '19711546', '2226684', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3183', 'LOAN005', 'AD0000', '1', '1', '2028-06-02', '2028', '6', '252592', '243314', '9278', '19964138', '1983370', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3184', 'LOAN005', 'AD0000', '1', '1', '2028-07-02', '2028', '7', '252592', '244328', '8264', '20216730', '1739041', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3185', 'LOAN005', 'AD0000', '1', '1', '2028-08-02', '2028', '8', '252592', '245346', '7246', '20469322', '1493695', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3186', 'LOAN005', 'AD0000', '1', '1', '2028-09-02', '2028', '9', '252592', '246369', '6224', '20721915', '1247327', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3187', 'LOAN005', 'AD0000', '1', '1', '2028-10-02', '2028', '10', '252592', '247395', '5197', '20974507', '999932', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3188', 'LOAN005', 'AD0000', '1', '1', '2028-11-02', '2028', '11', '252592', '248426', '4166', '21227099', '751506', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3189', 'LOAN005', 'AD0000', '1', '1', '2028-12-02', '2028', '12', '252592', '249461', '3131', '21479692', '502045', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3190', 'LOAN005', 'AD0000', '1', '1', '2029-01-02', '2029', '1', '252592', '250500', '2092', '21732284', '251544', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3191', 'LOAN005', 'AD0000', '1', '1', '2029-02-02', '2029', '2', '252592', '251544', '1048', '21984876', '-0', 'Admin', '2020-10-03 15:06:49', null, '2020-10-03 15:06:49', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3392', 'LOAN001', 'AD0000', '1', '1', '2020-01-10', '2020', '1', '1000000', '880000', '120000', '', '11120000', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '1', '0');
INSERT INTO ams_loan_emidetails VALUES ('3393', 'LOAN001', 'AD0000', '1', '1', '2020-02-10', '2020', '2', '500000', '388800', '111200', '', '10731200', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3394', 'LOAN001', 'AD0000', '1', '1', '2020-03-10', '2020', '3', '500000', '392688', '107312', '', '10338512', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3395', 'LOAN001', 'AD0000', '1', '1', '2020-04-10', '2020', '4', '500000', '396615', '103385', '', '9941897', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3396', 'LOAN001', 'AD0000', '1', '1', '2020-05-10', '2020', '5', '500000', '400581', '99419', '', '9541316', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3397', 'LOAN001', 'AD0000', '1', '1', '2020-06-10', '2020', '6', '500000', '404587', '95413', '', '9136729', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3398', 'LOAN001', 'AD0000', '1', '1', '2020-07-10', '2020', '7', '500000', '408633', '91367', '', '8728097', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3399', 'LOAN001', 'AD0000', '1', '1', '2020-08-10', '2020', '8', '500000', '412719', '87281', '', '8315378', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3400', 'LOAN001', 'AD0000', '1', '1', '2020-09-10', '2020', '9', '500000', '416846', '83154', '', '7898531', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3401', 'LOAN001', 'AD0000', '1', '1', '2020-10-10', '2020', '10', '500000', '421015', '78985', '', '7477517', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3402', 'LOAN001', 'AD0000', '1', '1', '2020-11-10', '2020', '11', '500000', '425225', '74775', '', '7052292', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3403', 'LOAN001', 'AD0000', '1', '1', '2020-12-10', '2020', '12', '500000', '429477', '70523', '', '6622815', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3404', 'LOAN001', 'AD0000', '1', '1', '2021-01-10', '2021', '1', '500000', '433772', '66228', '', '6189043', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3405', 'LOAN001', 'AD0000', '1', '1', '2021-02-10', '2021', '2', '500000', '438110', '61890', '', '5750933', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3406', 'LOAN001', 'AD0000', '1', '1', '2021-03-10', '2021', '3', '500000', '442491', '57509', '', '5308443', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3407', 'LOAN001', 'AD0000', '1', '1', '2021-04-10', '2021', '4', '500000', '446916', '53084', '', '4861527', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3408', 'LOAN001', 'AD0000', '1', '1', '2021-05-10', '2021', '5', '500000', '451385', '48615', '', '4410142', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3409', 'LOAN001', 'AD0000', '1', '1', '2021-06-10', '2021', '6', '500000', '455899', '44101', '', '3954244', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3410', 'LOAN001', 'AD0000', '1', '1', '2021-07-10', '2021', '7', '500000', '460458', '39542', '', '3493786', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3411', 'LOAN001', 'AD0000', '1', '1', '2021-08-10', '2021', '8', '500000', '465062', '34938', '', '3028724', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3412', 'LOAN001', 'AD0000', '1', '1', '2021-09-10', '2021', '9', '500000', '469713', '30287', '', '2559011', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3413', 'LOAN001', 'AD0000', '1', '1', '2021-10-10', '2021', '10', '500000', '474410', '25590', '', '2084601', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3414', 'LOAN001', 'AD0000', '1', '1', '2021-11-10', '2021', '11', '500000', '479154', '20846', '', '1605447', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3415', 'LOAN001', 'AD0000', '1', '1', '2021-12-10', '2021', '12', '500000', '483946', '16054', '', '1121502', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3416', 'LOAN001', 'AD0000', '1', '1', '2022-01-10', '2022', '1', '500000', '488785', '11215', '', '632717', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3417', 'LOAN001', 'AD0000', '1', '1', '2022-02-10', '2022', '2', '500000', '493673', '6327', '', '139044', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');
INSERT INTO ams_loan_emidetails VALUES ('3418', 'LOAN001', 'AD0000', '1', '1', '2022-03-10', '2022', '3', '500000', '498610', '1390', '', '0', 'Admin', '2020-10-03 15:11:24', null, '2020-10-03 15:11:24', '0', '0');

-- ----------------------------
-- Table structure for `ams_login`
-- ----------------------------
DROP TABLE IF EXISTS `ams_login`;
CREATE TABLE `ams_login` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `userId` varchar(100) DEFAULT NULL COMMENT 'ユーザID',
  `email` varchar(100) DEFAULT NULL COMMENT 'メール',
  `password` varchar(100) DEFAULT NULL COMMENT 'パスワード',
  `remember_token` varchar(100) DEFAULT NULL,
  `userType` int(1) DEFAULT NULL COMMENT 'User Type',
  `delFlg` int(1) DEFAULT '0' COMMENT 'Delete Flag',
  `loginStatus` int(1) DEFAULT '0',
  `verifyFlg` int(2) NOT NULL DEFAULT '0',
  `langFlg` int(1) DEFAULT '0',
  `createdBy` varchar(100) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_login
-- ----------------------------
INSERT INTO ams_login VALUES ('1', 'AD0000', 'admin@gmail.com', '0192023a7bbd73250516f069df18b500', 'm425XCm5hTuPnncSag7r8voM4NaOtU7U6CGTcCukP13ySy1UHxyAxFvGpzjh', '1', '0', '0', '0', '1', 'Admin', '2020-08-18 13:38:08', 'Admin', '2020-10-05 06:29:15');
INSERT INTO ams_login VALUES ('2', 'AMS0001', 'sathish@microbit.co.jp', '96e79218965eb72c92a549dd5a330112', 'u89YPh6lECG1JxB3vSKSfUVRw1JF1bm2U6kliazkisKaLSQFbqkQyUe8VgkT', '2', '0', '0', '0', '0', 'kumar', '2020-08-22 22:11:17', 'kumar', '2020-08-22 13:13:37');
INSERT INTO ams_login VALUES ('3', 'AMS0002', 'sundarasastha.c@gmail.com', 'c20ad4d76fe97759aa27a0c99bff6710', 'Z3FhH8TdvA1VyI5dFfFBxUb478SV8KdJYX9ZEdcdHVYXf08bH6GK6BJFA03b', '2', '0', '0', '1', '0', 'Sastha', '2020-08-24 19:21:17', 'Courtallam  Sastha', '2020-08-27 10:29:33');

-- ----------------------------
-- Table structure for `ams_mailcontent`
-- ----------------------------
DROP TABLE IF EXISTS `ams_mailcontent`;
CREATE TABLE `ams_mailcontent` (
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
-- Records of ams_mailcontent
-- ----------------------------
INSERT INTO ams_mailcontent VALUES ('1', 'MAIL0001', 'User Register', '1', 'Registration Successfully', 'Dear', 'Welcome to Microbit Pvt Ltd..! \r\n\r\n        Your User Details has been Successfully Registered.   \r\n  Now you can Login by using the details given below. \r\n\r\nLoginId   : LLLLL\r\nPassword  : PPPPP\r\nMobile    : MMMMM', '0', 'Admin', '2017-04-13 09:42:39', 'Admin', '2020-08-27 07:25:09', '0');

-- ----------------------------
-- Table structure for `ams_mailstatus`
-- ----------------------------
DROP TABLE IF EXISTS `ams_mailstatus`;
CREATE TABLE `ams_mailstatus` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_mailstatus
-- ----------------------------
INSERT INTO ams_mailstatus VALUES ('1', 'AMS0001', 'sathish@microbit.co.jp', 'Registration Successfully', '<div style=\"padding-bottom:10px\">\n	<table style=\"border:#f6f2f2 solid 5px;font-family:Calibri\" width=\"670\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\n		<tbody>\n			<tr>\n				<td colspan=\"2\" style=\"padding:15px 5px 15px 5px;border-bottom:#ccc solid 1px\">\n					<table style=\"font-family:Arial,Helvetica,sans-serif;font-size:12px\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n						<tbody>\n							<tr>\n								<td style=\"padding-right:10px\" width=\"187\" align=\"left\">\n									<img src=\"http://cvgendev.sathisys.com/larakyujin/public/images/MB_logo.png\" alt=\"Microbit\" class=\"CToWUd\">\n								</td>\n							</tr>\n							<tr>\n								<td colspan=\"2\" style=\"font-family:Calibri;text-align:left;color:#959595;padding:10px;line-height:18px;font-size:13px\"><span class=\"il\">\n									</span>To Login directly to the Employer, please click on Login button\n								</td>\n							</tr>\n							<tr>\n								<td colspan=\"2\" style=\"padding:20px;color:#5a5a5a;font-family:Calibri;font-size:16px\" bgcolor=\"#d8e8f5\">\n									<div><b>Welcome to Microbit Pvt Ltd..! </b></div>\n								</td>\n							</tr>\n							<tr>\n								<td colspan=\"2\" style=\"padding:20px 20px 0 20px;color:#5a5a5a;line-height:22px;font-family:Calibri;font-size:14px\" bgcolor=\"#FFFFFF\">\n									<p>Dear &nbsp;SATHISH  kumar</p>Welcome to Microbit Pvt Ltd..! <br />\r\n<br />\r\n        Your User Details has been Successfully Registered.   <br />\r\n  Now you can Login by using the details given below. <br />\r\n<br />\r\nLoginId   : AMS0001<br />\r\nPassword  : 111111<br />\r\nMobile    : 0803138100\n								</td>\n							</tr>\n							<tr>\n								<td colspan=\"2\" bgcolor=\"#FFFFFF\">\n									<table width=\"650\" style=\"font-family:Calibri;text-align:left;padding:10px 5px 0;line-height:18px;font-size:14px\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\" align=\"center\">\n										<colgroup>\n											<col width=\"5%\">\n											<col width=\"4%\">\n											<col>\n										</colgroup>\n										<tbody>\n											<tr>\n												<td colspan=\"3\" height=\"54\" bgcolor=\"#E4E4E4\" align=\"center\">\n													<a href=\"http://ssdev.microbit.co.jp/AssetManagement\" target=\"_blank\" style=\"background:#bf4237;font-size:18px;color:#fff;text-decoration:none;border-radius:2px;padding:7px 30px;display:inline-block\">Verify Login</a>\n												</td>\n											</tr>\n											<tr>\n												<td colspan=\"3\" style=\"padding:20px 20px 0 20px;color:#5a5a5a;line-height:22px;font-family:Calibri;font-size:16px\" bgcolor=\"#FFFFFF\">\n													Thanks & Regards <br>Click Here To Visit  <a target=\"_blank\" href=\"http://www.microbit.co.jp\">Microbit.com</a> Team												</td>\n											</tr>\n										</tbody>\n									</table>\n								</td>\n							</tr>\n						</tbody>\n					</table>\n				</td>\n			</tr>\n		</tbody>\n	</table>\n</div>', '0', 'kumar', '2020-08-22 22:11:17', 'kumar', '2020-08-22 22:11:17', '0');
INSERT INTO ams_mailstatus VALUES ('2', 'AMS0002', 'sundarasastha.c@gmail.com', 'Registration Successfully', '<div style=\"padding-bottom:10px\">\n	<table style=\"border:#f6f2f2 solid 5px;font-family:Calibri\" width=\"670\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\n		<tbody>\n			<tr>\n				<td colspan=\"2\" style=\"padding:15px 5px 15px 5px;border-bottom:#ccc solid 1px\">\n					<table style=\"font-family:Arial,Helvetica,sans-serif;font-size:12px\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n						<tbody>\n							<tr>\n								<td style=\"padding-right:10px\" width=\"187\" align=\"left\">\n									<img src=\"http://ssdev.microbit.co.jp/AssetManagement/public/images/Microbit_logo.jpg\" alt=\"Microbit\" class=\"CToWUd\">\n								</td>\n							</tr>\n							<tr>\n								<td colspan=\"2\" style=\"font-family:Calibri;text-align:left;color:#959595;padding:10px;line-height:18px;font-size:13px\"><span class=\"il\">\n									</span>To Login directly to the Employer, please click on Login button\n								</td>\n							</tr>\n							<tr>\n								<td colspan=\"2\" style=\"padding:20px;color:#5a5a5a;font-family:Calibri;font-size:16px\" bgcolor=\"#d8e8f5\">\n									<div><b>Welcome to Microbit Pvt Ltd..! </b></div>\n								</td>\n							</tr>\n							<tr>\n								<td colspan=\"2\" style=\"padding:20px 20px 0 20px;color:#5a5a5a;line-height:22px;font-family:Calibri;font-size:14px\" bgcolor=\"#FFFFFF\">\n									<p>Dear &nbsp;Courtallam  Sastha</p>Welcome to Microbit Pvt Ltd..! <br />\r\n<br />\r\n        Your User Details has been Successfully Registered.   <br />\r\n  Now you can Login by using the details given below. <br />\r\n<br />\r\nLoginId   : AMS0002<br />\r\nPassword  : 12<br />\r\nMobile    : 1234567890\n								</td>\n							</tr>\n							<tr>\n								<td colspan=\"2\" bgcolor=\"#FFFFFF\">\n									<table width=\"650\" style=\"font-family:Calibri;text-align:left;padding:10px 5px 0;line-height:18px;font-size:14px\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\" align=\"center\">\n										<colgroup>\n											<col width=\"5%\">\n											<col width=\"4%\">\n											<col>\n										</colgroup>\n										<tbody>\n											<tr>\n												<td colspan=\"3\" height=\"54\" bgcolor=\"#E4E4E4\" align=\"center\">\n													<a href=\"http://ssdev.microbit.co.jp/AssetManagement/User/verifyLogin?userId=AMS0002&amp;name=Courtallam  Sastha\" target=\"_blank\" style=\"background:#bf4237;font-size:18px;color:#fff;text-decoration:none;border-radius:2px;padding:7px 30px;display:inline-block\">Verify Login</a>\n												</td>\n											</tr>\n											<tr>\n												<td colspan=\"3\" style=\"padding:20px 20px 0 20px;color:#5a5a5a;line-height:22px;font-family:Calibri;font-size:16px\" bgcolor=\"#FFFFFF\">\n													Thanks & Regards <br>Click Here To Visit  <a target=\"_blank\" href=\"http://www.microbit.co.jp\">Microbit.com</a> Team												</td>\n											</tr>\n										</tbody>\n									</table>\n								</td>\n							</tr>\n						</tbody>\n					</table>\n				</td>\n			</tr>\n		</tbody>\n	</table>\n</div>', '0', 'Sastha', '2020-08-24 19:21:17', 'Sastha', '2020-08-24 19:21:17', '0');

-- ----------------------------
-- Table structure for `ams_master_assetstypes`
-- ----------------------------
DROP TABLE IF EXISTS `ams_master_assetstypes`;
CREATE TABLE `ams_master_assetstypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `assetsTypes` varchar(100) DEFAULT NULL,
  `createdBy` varchar(10) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL COMMENT 'Record Inserted DateTime',
  `updatedBy` varchar(10) DEFAULT NULL COMMENT 'Login UserName',
  `updatedDateTime` datetime DEFAULT NULL COMMENT 'Record Update DateTime',
  `delFlg` int(1) DEFAULT '0' COMMENT '0 - Use , 1 - Not In Use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_master_assetstypes
-- ----------------------------
INSERT INTO ams_master_assetstypes VALUES ('1', '1', 'Record', 'Admin', '2020-09-15 15:03:53', 'Admin', '2020-09-15 15:03:53', '0');
INSERT INTO ams_master_assetstypes VALUES ('2', '2', 'Gold', 'Admin', '2020-09-16 00:03:36', 'Admin', '2020-09-16 00:10:31', '0');
INSERT INTO ams_master_assetstypes VALUES ('3', '3', 'Fixed Deposit', 'Admin', '2020-09-16 00:03:47', 'Admin', '2020-09-16 00:11:03', '0');
INSERT INTO ams_master_assetstypes VALUES ('4', '4', 'Cash', 'Admin', '2020-09-16 00:10:10', 'Admin', '2020-09-16 00:10:10', '0');

-- ----------------------------
-- Table structure for `ams_master_buildingname`
-- ----------------------------
DROP TABLE IF EXISTS `ams_master_buildingname`;
CREATE TABLE `ams_master_buildingname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `buildingName` varchar(100) DEFAULT NULL,
  `createdBy` varchar(10) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL COMMENT 'Record Inserted DateTime',
  `updatedBy` varchar(10) DEFAULT NULL COMMENT 'Login UserName',
  `updatedDateTime` datetime DEFAULT NULL COMMENT 'Record Update DateTime',
  `delFlg` int(1) DEFAULT '0' COMMENT '0 - Use , 1 - Not In Use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_master_buildingname
-- ----------------------------
INSERT INTO ams_master_buildingname VALUES ('1', '1', '大京ビルマンション', 'Admin', '2020-09-09 08:13:28', 'Admin', '2020-09-09 08:13:28', '0');
INSERT INTO ams_master_buildingname VALUES ('2', '2', 'チサンマンション', 'Admin', '2020-09-09 08:13:39', 'Admin', '2020-09-09 08:13:39', '0');
INSERT INTO ams_master_buildingname VALUES ('3', '3', '大文マンション', 'Admin', '2020-09-09 08:13:52', 'Admin', '2020-09-09 08:13:52', '0');
INSERT INTO ams_master_buildingname VALUES ('4', '4', 'Osaka Mansion', 'Admin', '2020-09-09 08:13:58', 'Admin', '2020-09-09 08:13:58', '0');
INSERT INTO ams_master_buildingname VALUES ('5', '5', 'チサンマンション第２新大阪', 'Admin', '2020-09-23 00:04:54', 'Admin', '2020-10-01 09:07:48', '0');

-- ----------------------------
-- Table structure for `ams_master_expenses_main`
-- ----------------------------
DROP TABLE IF EXISTS `ams_master_expenses_main`;
CREATE TABLE `ams_master_expenses_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `createdBy` varchar(10) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL COMMENT 'Record Inserted DateTime',
  `updatedBy` varchar(10) DEFAULT NULL COMMENT 'Login UserName',
  `updatedDateTime` datetime DEFAULT NULL COMMENT 'Record Update DateTime',
  `delFlg` int(1) DEFAULT '0' COMMENT '0 - Use , 1 - Not In Use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_master_expenses_main
-- ----------------------------
INSERT INTO ams_master_expenses_main VALUES ('1', '1', 'House Purchase', 'Admin', '2020-08-29 12:03:00', 'Admin', '2020-09-14 15:24:09', '0');
INSERT INTO ams_master_expenses_main VALUES ('2', '2', 'House Related', 'Admin', '2020-08-29 12:50:23', 'Admin', '2020-08-29 12:50:23', '0');

-- ----------------------------
-- Table structure for `ams_master_expenses_sub`
-- ----------------------------
DROP TABLE IF EXISTS `ams_master_expenses_sub`;
CREATE TABLE `ams_master_expenses_sub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `categoryId` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `createdBy` varchar(10) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL COMMENT 'Record Inserted DateTime',
  `updatedBy` varchar(10) DEFAULT NULL COMMENT 'Login UserName',
  `updatedDateTime` datetime DEFAULT NULL COMMENT 'Record Update DateTime',
  `delFlg` int(1) DEFAULT '0' COMMENT '0 - Use , 1 - Not In Use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_master_expenses_sub
-- ----------------------------
INSERT INTO ams_master_expenses_sub VALUES ('1', '1', '1', 'Gas', 'Admin', '2020-08-29 12:03:12', 'Admin', '2020-09-04 07:32:31', '0');
INSERT INTO ams_master_expenses_sub VALUES ('2', '2', '1', '管理費', 'Admin', '2020-08-29 12:51:03', 'Admin', '2020-09-08 13:54:47', '1');
INSERT INTO ams_master_expenses_sub VALUES ('3', '3', '2', '電気代', 'Admin', '2020-08-29 12:51:36', 'Admin', '2020-09-08 13:55:02', '0');
INSERT INTO ams_master_expenses_sub VALUES ('4', '4', '2', 'Gas', 'Admin', '0000-00-00 00:00:00', '2020-09-04', '2020-09-04 07:41:58', '0');
INSERT INTO ams_master_expenses_sub VALUES ('5', '5', '2', '管理費', 'Admin', '0000-00-00 00:00:00', '2020-09-04', '2020-09-04 07:42:08', '0');
INSERT INTO ams_master_expenses_sub VALUES ('6', '6', '1', '電気代', 'Admin', '0000-00-00 00:00:00', '2020-09-04', '2020-09-04 07:42:28', '0');

-- ----------------------------
-- Table structure for `ams_master_houseimg_main`
-- ----------------------------
DROP TABLE IF EXISTS `ams_master_houseimg_main`;
CREATE TABLE `ams_master_houseimg_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `imageName` varchar(100) DEFAULT NULL,
  `createdBy` varchar(10) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL COMMENT 'Record Inserted DateTime',
  `updatedBy` varchar(10) DEFAULT NULL COMMENT 'Login UserName',
  `updatedDateTime` datetime DEFAULT NULL COMMENT 'Record Update DateTime',
  `delFlg` int(1) DEFAULT '0' COMMENT '0 - Use , 1 - Not In Use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_master_houseimg_main
-- ----------------------------
INSERT INTO ams_master_houseimg_main VALUES ('1', '1', 'Kitchen', 'Admin', '2020-09-03 15:31:06', 'Admin', '2020-09-03 15:31:06', '0');
INSERT INTO ams_master_houseimg_main VALUES ('2', '2', 'Hall', 'Admin', '2020-09-10 15:03:58', 'Admin', '2020-09-10 15:03:58', '0');
INSERT INTO ams_master_houseimg_main VALUES ('3', '3', 'Documents', 'Admin', '2020-09-11 15:10:24', 'Admin', '2020-09-11 15:10:24', '0');

-- ----------------------------
-- Table structure for `ams_master_houseimg_sub`
-- ----------------------------
DROP TABLE IF EXISTS `ams_master_houseimg_sub`;
CREATE TABLE `ams_master_houseimg_sub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `imageId` varchar(100) DEFAULT NULL,
  `imageName` varchar(100) DEFAULT NULL,
  `createdBy` varchar(10) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL COMMENT 'Record Inserted DateTime',
  `updatedBy` varchar(10) DEFAULT NULL COMMENT 'Login UserName',
  `updatedDateTime` datetime DEFAULT NULL COMMENT 'Record Update DateTime',
  `delFlg` int(1) DEFAULT '0' COMMENT '0 - Use , 1 - Not In Use',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_master_houseimg_sub
-- ----------------------------
INSERT INTO ams_master_houseimg_sub VALUES ('1', '1', '2', 'Television', 'Admin', '0000-00-00 00:00:00', '2020-09-10', '2020-09-10 15:04:40', '1');
INSERT INTO ams_master_houseimg_sub VALUES ('2', '2', '3', 'Purchase', 'Admin', '0000-00-00 00:00:00', '2020-09-11', '2020-09-11 15:10:36', '0');

-- ----------------------------
-- Table structure for `ams_otherasset_details`
-- ----------------------------
DROP TABLE IF EXISTS `ams_otherasset_details`;
CREATE TABLE `ams_otherasset_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) DEFAULT NULL,
  `assetId` int(10) DEFAULT NULL,
  `belongsTo` int(10) DEFAULT NULL,
  `mainSubject` varchar(30) DEFAULT '0',
  `remarks` varchar(100) DEFAULT NULL,
  `otherAssetsAmount` varchar(30) DEFAULT NULL,
  `registerDate` varchar(30) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `updatedDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `editFlg` int(1) NOT NULL DEFAULT '0',
  `copyFlg` int(3) NOT NULL DEFAULT '0',
  `prvMnthFlg` int(3) NOT NULL DEFAULT '0',
  `delFlg` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_otherasset_details
-- ----------------------------
INSERT INTO ams_otherasset_details VALUES ('1', 'AD0000', '4', '1', 'UFJ', '', '700', '2020-09-15', '2020-09-15 20:34:23', 'Admin', '2020-09-21 20:07:32', 'Admin', '1', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('2', 'AD0000', '4', '1', 'Risona', '', '200', '2020-09-15', '2020-09-15 20:35:00', 'Admin', '2020-09-18 15:20:32', 'Admin', '1', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('3', 'AD0000', '4', '2', 'UFJ', '', '50', '2020-09-15', '2020-09-15 20:35:32', 'Admin', '2020-09-18 15:20:32', 'Admin', '1', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('4', 'AD0000', '2', '1', 'Chain 80 gm', '', '57', '2020-09-16', '2020-09-16 05:34:53', 'Admin', '2020-09-18 15:48:46', 'Admin', '1', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('5', 'AD0000', '3', '2', 'SBI INDIA', '.', '100', '2020-09-16', '2020-09-16 05:41:58', 'Admin', '2020-09-18 15:20:32', 'Admin', '1', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('6', 'AD0000', '2', '2', 'chain 120gm', '.', '80', '2020-09-16', '2020-09-16 05:44:29', 'Admin', '2020-09-18 15:20:32', 'Admin', '1', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('7', 'AD0000', '3', '1', 'Advance House 207号', '.', '150', '2020-09-16', '2020-09-16 05:45:55', 'Admin', '2020-09-18 16:13:45', 'Admin', '1', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('8', 'AD0000', '4', '1', 'UFJ', '', '300', '2020-08-15', '2020-08-15 20:34:23', 'Admin', '2020-09-18 16:06:35', 'Admin', '1', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('9', 'AD0000', '2', '1', 'Chain 80 gm', '', '57', '2020-10-16', '2020-09-17 19:13:50', 'Admin', '2020-09-18 15:48:46', 'Admin', '1', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('10', 'AD0000', '2', '2', 'chain 120gm', '.', '80', '2020-10-16', '2020-09-17 19:13:50', 'Admin', '2020-09-18 15:20:32', 'Admin', '0', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('11', 'AD0000', '3', '1', 'Advance House 207号', '.', '150', '2020-10-16', '2020-09-17 19:13:50', 'Admin', '2020-09-18 16:13:45', 'Admin', '1', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('12', 'AD0000', '3', '2', 'SBI INDIA', '.', '100', '2020-10-16', '2020-09-17 19:13:50', 'Admin', '2020-09-18 15:20:32', 'Admin', '0', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('13', 'AD0000', '4', '1', 'UFJ', '', '700', '2020-10-15', '2020-09-17 19:13:50', 'Admin', '2020-09-21 20:07:32', 'Admin', '1', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('14', 'AD0000', '4', '1', 'Risona', '', '200', '2020-10-15', '2020-09-17 19:13:50', 'Admin', '2020-09-18 15:20:32', 'Admin', '0', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('15', 'AD0000', '4', '2', 'UFJ', '', '50', '2020-10-15', '2020-09-17 19:13:50', 'Admin', '2020-09-18 15:20:32', 'Admin', '0', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('16', 'AD0000', '2', '1', 'Chain 80 gm', '', '57', '2020-11-16', '2020-09-17 19:18:41', 'Admin', '2020-09-18 15:48:46', 'Admin', '1', '0', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('17', 'AD0000', '2', '2', 'chain 120gm', '.', '80', '2020-11-16', '2020-09-17 19:18:41', 'Admin', '2020-09-18 15:20:32', null, '0', '0', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('18', 'AD0000', '3', '1', 'Advance House 207号', '.', '150', '2020-11-16', '2020-09-17 19:18:42', 'Admin', '2020-09-18 16:13:45', 'Admin', '1', '0', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('19', 'AD0000', '3', '2', 'SBI INDIA', '.', '100', '2020-11-16', '2020-09-17 19:18:42', 'Admin', '2020-09-18 15:20:32', null, '0', '0', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('20', 'AD0000', '4', '1', 'UFJ', '', '700', '2020-11-15', '2020-09-17 19:18:42', 'Admin', '2020-09-21 20:07:32', 'Admin', '1', '0', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('21', 'AD0000', '4', '1', 'Risona', '', '200', '2020-11-15', '2020-09-17 19:18:42', 'Admin', '2020-09-18 15:20:32', null, '0', '0', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('22', 'AD0000', '4', '2', 'UFJ', '', '50', '2020-11-15', '2020-09-17 19:18:42', 'Admin', '2020-09-18 15:20:32', null, '0', '0', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('23', 'AD0000', '4', '1', 'CashAmount', '', '80', '2020-09-18', '2020-09-18 15:50:06', 'Admin', '2020-09-18 16:15:40', 'Admin', '1', '1', '0', '0');
INSERT INTO ams_otherasset_details VALUES ('24', 'AD0000', '4', '1', 'CashAmount', '', '80', '2020-10-18', '2020-09-18 16:05:16', 'Admin', '2020-09-18 16:15:40', 'Admin', '1', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('25', 'AD0000', '4', '3', 'UFJ', '', '200', '2020-09-15', '2020-09-18 16:06:35', 'Admin', '2020-09-18 16:10:48', 'Admin', '1', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('26', 'AD0000', '4', '3', 'UFJ', '', '200', '2020-10-15', '2020-09-18 16:10:48', 'Admin', '2020-09-18 16:10:55', 'Admin', '0', '1', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('27', 'AD0000', '4', '1', 'CashAmount', '', '80', '2020-11-18', '2020-09-18 16:10:55', 'Admin', '2020-09-18 16:15:40', 'Admin', '1', '0', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('28', 'AD0000', '4', '3', 'UFJ', '', '200', '2020-11-15', '2020-09-18 16:10:55', 'Admin', '2020-09-18 16:10:55', null, '0', '0', '1', '0');
INSERT INTO ams_otherasset_details VALUES ('29', 'AD0000', '3', '1', 'Advance House 207号', '', '200', '2020-01-01', '2020-09-21 20:04:19', 'Admin', '2020-09-21 20:04:23', 'Admin', '0', '1', '0', '0');
INSERT INTO ams_otherasset_details VALUES ('30', 'AD0000', '3', '1', 'Advance House 207号', '', '200', '2020-02-01', '2020-09-21 20:04:23', 'Admin', '2020-09-21 20:04:27', 'Admin', '0', '1', '0', '0');
INSERT INTO ams_otherasset_details VALUES ('31', 'AD0000', '3', '1', 'Advance House 207号', '', '200', '2020-03-01', '2020-09-21 20:04:27', 'Admin', '2020-09-21 20:05:00', 'Admin', '0', '1', '0', '0');
INSERT INTO ams_otherasset_details VALUES ('32', 'AD0000', '3', '1', 'Advance House 207号', '', '400', '2020-04-01', '2020-09-21 20:04:53', 'Admin', '2020-09-23 11:02:12', 'Admin', '1', '1', '0', '0');
INSERT INTO ams_otherasset_details VALUES ('33', 'AD0000', '3', '1', 'Advance House 207号', '', '400', '2020-05-01', '2020-09-21 20:05:05', 'Admin', '2020-09-23 11:02:12', 'Admin', '1', '1', '0', '0');
INSERT INTO ams_otherasset_details VALUES ('34', 'AD0000', '3', '1', 'Advance House 207号', '', '400', '2020-06-01', '2020-09-21 20:05:08', 'Admin', '2020-09-23 11:02:12', 'Admin', '1', '1', '0', '0');
INSERT INTO ams_otherasset_details VALUES ('35', 'AD0000', '3', '1', 'Advance House 207号', '', '400', '2020-07-01', '2020-09-21 20:05:11', 'Admin', '2020-09-23 11:02:12', 'Admin', '1', '1', '0', '0');
INSERT INTO ams_otherasset_details VALUES ('36', 'AD0000', '3', '1', 'Advance House 207号', '', '400', '2020-08-01', '2020-09-21 20:07:53', 'Admin', '2020-09-23 11:02:12', 'Admin', '1', '1', '0', '0');
INSERT INTO ams_otherasset_details VALUES ('37', 'AD0000', '3', '1', 'Advance House 207号', '', '400', '2020-09-01', '2020-09-21 20:07:57', 'Admin', '2020-09-23 11:02:12', 'Admin', '1', '1', '0', '0');
INSERT INTO ams_otherasset_details VALUES ('38', 'AD0000', '3', '1', 'Advance House 207号', '', '400', '2020-10-01', '2020-09-21 21:56:13', 'Admin', '2020-09-23 11:02:12', 'Admin', '1', '0', '0', '0');
INSERT INTO ams_otherasset_details VALUES ('39', 'AD0000', '1', '1', 'Test', '', '9', '2020-09-30', '2020-09-30 14:18:54', 'Admin', '2020-09-30 14:22:53', 'Admin', '1', '1', '0', '0');
INSERT INTO ams_otherasset_details VALUES ('40', 'AD0000', '1', '1', 'Test', '', '9', '2020-10-30', '2020-09-30 14:19:46', 'Admin', '2020-09-30 14:19:46', null, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `ams_users`
-- ----------------------------
DROP TABLE IF EXISTS `ams_users`;
CREATE TABLE `ams_users` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ams_users
-- ----------------------------
INSERT INTO ams_users VALUES ('1', 'AD0000', 'Admin', 'Admin', 'admin@gmail.com', '1994-02-21', '1', '8767897898', '1', 'Admin', '2020-08-19 08:32:21', 'Admin', '2020-09-11 10:26:50', '0');
INSERT INTO ams_users VALUES ('2', 'AMS0001', 'SATHISH', 'kumar', 'sathish@microbit.co.jp', '1972-07-23', '1', '803138100', '2', 'kumar', '2020-08-22 22:11:17', '', '2020-08-22 22:11:17', '0');
INSERT INTO ams_users VALUES ('3', 'AMS0002', 'Courtallam', 'Sastha', 'sundarasastha.c@gmail.com', '1994-02-21', '1', '1234567890', '2', 'Sastha', '2020-08-24 19:21:16', '', '2020-08-24 19:21:16', '0');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
