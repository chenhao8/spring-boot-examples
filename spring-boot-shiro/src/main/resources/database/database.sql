/*
Navicat MySQL Data Transfer

Source Server         : 192.168.100.211
Source Server Version : 50629
Source Host           : 192.168.100.211:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-06-27 16:31:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Records of ac_config_template
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `resource_type` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '0', '用户管理', '0', '0/', 'userInfo:view', 'menu', 'userInfo/userList');
INSERT INTO `sys_permission` VALUES ('2', '0', '用户添加', '1', '0/1', 'userInfo:add', 'button', 'userInfo/userAdd');
INSERT INTO `sys_permission` VALUES ('3', '0', '用户删除', '1', '0/1', 'userInfo:del', 'button', 'userInfo/userDel');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL,
  `available` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '0', '管理员', 'admin');
INSERT INTO `sys_role` VALUES ('2', '0', 'VIP会员', 'vip');
INSERT INTO `sys_role` VALUES ('3', '0', '路人甲', 'member');

-- ----------------------------
-- Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `permission_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK9q28ewrhntqeipl1t04kh1be7` (`role_id`),
  KEY `FKomxrs8a388bknvhjokh440waq` (`permission_id`),
  CONSTRAINT `FK9q28ewrhntqeipl1t04kh1be7` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FKomxrs8a388bknvhjokh440waq` FOREIGN KEY (`permission_id`) REFERENCES `sys_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1', '1');
INSERT INTO `sys_role_permission` VALUES ('1', '2', '2');
INSERT INTO `sys_role_permission` VALUES ('1', '3', '3');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgkmyslkrfeyn9ukmolvek8b8f` (`uid`),
  KEY `FKhh52n8vd4ny9ff4x9fb8v65qx` (`role_id`),
  CONSTRAINT `FKgkmyslkrfeyn9ukmolvek8b8f` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uid`),
  CONSTRAINT `FKhh52n8vd4ny9ff4x9fb8v65qx` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `uid` varchar(255) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'admin', '管理员', 'd3c59d25033dbf980d29554025c23a75', '8d78869f470951332959580424d4bf4f', '0');
