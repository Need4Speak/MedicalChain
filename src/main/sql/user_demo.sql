/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : dmtx

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-07-08 15:42:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_demo
-- ----------------------------
DROP TABLE IF EXISTS `user_demo`;
CREATE TABLE `user_demo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户表',
  `name` varchar(8) NOT NULL DEFAULT '' COMMENT '昵称不为null，最长昵称长度为8。',
  `password` varchar(32) NOT NULL COMMENT '密码最长16位',
  `phone_number` varchar(13) NOT NULL COMMENT '手机号加区号共13位',
  `sex` varchar(6) DEFAULT NULL COMMENT 'male or female',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_demo
-- ----------------------------
INSERT INTO `user_demo` VALUES ('1', '张超', '111', '15528798620', 'male');
INSERT INTO `user_demo` VALUES ('2', '叶雄峰', '111', '15511112222', 'male');
