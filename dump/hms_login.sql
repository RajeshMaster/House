/*
Navicat MySQL Data Transfer

Source Server         : laravel
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : asset_db

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2020-12-11 14:14:51
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `hms_login`
-- ----------------------------
DROP TABLE IF EXISTS `hms_login`;
CREATE TABLE `hms_login` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hms_login
-- ----------------------------
INSERT INTO hms_login VALUES ('1', 'AD0000', 'admin@gmail.com', '0192023a7bbd73250516f069df18b500', 'qzuycnrcxS9pX8DQFyYhm1MrmNlyJ42cRdMrw214z9DJZhqjKcUiSQGdavXB', '1', '0', '0', '0', '1', 'Admin', '2020-12-11 13:28:07', 'Admin', '2020-12-11 08:43:38');
