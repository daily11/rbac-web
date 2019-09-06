/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50549
 Source Host           : localhost:3306
 Source Schema         : permission_local

 Target Server Type    : MySQL
 Target Server Version : 50549
 File Encoding         : 65001

 Date: 06/09/2019 14:35:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_acl_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_acl_info`;
CREATE TABLE `sys_acl_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名',
  `acl_module_id` bigint(20) NOT NULL COMMENT '权限所在的权限模块id',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求的url',
  `type` int(11) NOT NULL COMMENT '类型，1：菜单，2：按钮，3：其他',
  `status` int(11) NOT NULL COMMENT '状态，1：正常，0：冻结',
  `seq` int(11) NOT NULL COMMENT '权限在当前模块下的顺序，由小到大',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N/A' COMMENT '权限在当前模块下的顺序，由小到大',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户权限项定义信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_acl_info
-- ----------------------------
INSERT INTO `sys_acl_info` VALUES (1, '2019-09-05 09:16:37', '2019-09-04 11:20:13', '111', '增加用户', 2, '/user/add', 1, 1, 1, '增加用户');
INSERT INTO `sys_acl_info` VALUES (2, '2019-09-05 09:16:38', '2019-09-04 11:20:15', '222', '删除用户', 2, '/user/delete', 1, 1, 2, '删除用户');
INSERT INTO `sys_acl_info` VALUES (3, '2019-09-05 09:16:39', '2019-09-04 18:20:29', '333', '查询1', 3, '/query1', 1, 1, 1, '查询1');
INSERT INTO `sys_acl_info` VALUES (4, '2019-09-05 18:14:30', '2019-09-05 18:14:22', '444', '查询2', 3, '/query2', 1, 1, 2, '查询2');
INSERT INTO `sys_acl_info` VALUES (5, '2019-09-06 09:14:57', '2019-09-06 09:12:51', '555', '其他1', 4, '/else1', 1, 1, 1, '其他1');
INSERT INTO `sys_acl_info` VALUES (6, '2019-09-06 09:14:58', '2019-09-06 09:12:51', '666', '其他2', 4, '/else2', 1, 1, 2, '其他2');

-- ----------------------------
-- Table structure for sys_acl_module_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_acl_module_info`;
CREATE TABLE `sys_acl_module_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限模块id',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限模块名称',
  `parent_id` bigint(20) NOT NULL COMMENT '上级权限模块id',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限模块层级\r\n案例：1.3.7\r\n含义：\r\n1.3    代表父亲路径\r\n7      代表当前记录ID',
  `seq` int(11) NOT NULL COMMENT '权限模块在当前层级下的顺序，由小到大',
  `status` int(11) NOT NULL COMMENT '状态，1：正常，0：冻结',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N/A' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限模块定义信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_acl_module_info
-- ----------------------------
INSERT INTO `sys_acl_module_info` VALUES (1, '2019-09-04 15:07:02', '2019-09-03 11:29:09', '权限模块', 0, '0', 1, 1, '权限模块 顶级');
INSERT INTO `sys_acl_module_info` VALUES (2, '2019-09-05 09:17:14', '2019-09-04 10:50:26', '用户模块', 1, '0.1', 1, 1, '用户模块');
INSERT INTO `sys_acl_module_info` VALUES (3, '2019-09-05 18:10:32', '2019-09-05 18:10:24', '查询模块', 1, '0.1', 2, 1, '查询模块');
INSERT INTO `sys_acl_module_info` VALUES (4, '2019-09-06 09:10:47', '2019-09-06 09:10:33', '其他模块', 1, '0.1', 1, 1, '其他模块');

-- ----------------------------
-- Table structure for sys_role_acl_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_acl_relation`;
CREATE TABLE `sys_role_acl_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `acl_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与权限项关联关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_acl_relation
-- ----------------------------
INSERT INTO `sys_role_acl_relation` VALUES (1, '2019-09-04 11:15:10', '2019-09-04 11:15:09', 1, 1);
INSERT INTO `sys_role_acl_relation` VALUES (2, '2019-09-04 11:15:12', '2019-09-04 11:15:10', 1, 2);
INSERT INTO `sys_role_acl_relation` VALUES (3, '2019-09-04 18:21:48', '2019-09-04 11:15:13', 3, 3);
INSERT INTO `sys_role_acl_relation` VALUES (4, '2019-09-05 18:16:40', '2019-09-05 18:16:32', 3, 4);
INSERT INTO `sys_role_acl_relation` VALUES (5, '2019-09-05 18:36:53', '2019-09-05 18:36:48', 4, 1);
INSERT INTO `sys_role_acl_relation` VALUES (6, '2019-09-05 18:36:59', '2019-09-05 18:36:57', 4, 2);
INSERT INTO `sys_role_acl_relation` VALUES (7, '2019-09-05 18:37:09', '2019-09-05 18:37:05', 4, 3);
INSERT INTO `sys_role_acl_relation` VALUES (8, '2019-09-05 18:37:14', '2019-09-05 18:37:12', 4, 4);

-- ----------------------------
-- Table structure for sys_role_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_info`;
CREATE TABLE `sys_role_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  `type` int(11) NOT NULL COMMENT '角色的类型，1：系统角色     2：个人角色',
  `status` int(11) NOT NULL COMMENT '状态，1：可用，0：冻结。应用场景：一个人临时需要一个权限。然后就临时创建一个角色赋予给他，在这个时间段之后。这个角色就可以把它禁用掉。',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N/A' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_info
-- ----------------------------
INSERT INTO `sys_role_info` VALUES (1, '2019-09-05 18:36:21', '2019-09-05 18:18:42', '管理员', 1, 1, '111');
INSERT INTO `sys_role_info` VALUES (2, '2019-09-04 10:19:14', '2019-09-03 16:39:01', '巡查员', 2, 1, '222');
INSERT INTO `sys_role_info` VALUES (3, '2019-09-04 13:38:18', '2019-09-04 13:38:06', 'cyx', 3, 1, '333');
INSERT INTO `sys_role_info` VALUES (4, '2019-09-05 18:36:38', '2019-09-05 18:36:35', '超级管理员', 1, 1, '444');

-- ----------------------------
-- Table structure for sys_user_usergroup_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_usergroup_relation`;
CREATE TABLE `sys_user_usergroup_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与用户组关联关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_usergroup_relation
-- ----------------------------
INSERT INTO `sys_user_usergroup_relation` VALUES (1, '2019-09-04 10:18:35', '0000-00-00 00:00:00', 1, 1);
INSERT INTO `sys_user_usergroup_relation` VALUES (2, '2019-09-04 10:18:50', '0000-00-00 00:00:00', 1, 2);
INSERT INTO `sys_user_usergroup_relation` VALUES (3, '2019-09-05 09:15:32', '0000-00-00 00:00:00', 2, 1);

-- ----------------------------
-- Table structure for sys_usergroup_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_usergroup_info`;
CREATE TABLE `sys_usergroup_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N/A' COMMENT '描述信息',
  `group_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组唯一识别号码',
  `parent_id` bigint(20) NOT NULL COMMENT '上级父节点记录ID号码',
  `group_path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组路径，用户模糊查询',
  `group_type` int(11) NOT NULL COMMENT '组类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_usergroup_info
-- ----------------------------
INSERT INTO `sys_usergroup_info` VALUES (1, '2019-09-04 17:15:49', '2019-09-03 15:07:09', '用户组', 'a', 'a', 0, '0', 1);
INSERT INTO `sys_usergroup_info` VALUES (2, '2019-09-04 17:11:11', '2019-09-04 17:11:09', 'cyx', 'b', 'b', 1, 'b', 1);

-- ----------------------------
-- Table structure for sys_usergroup_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_usergroup_role_relation`;
CREATE TABLE `sys_usergroup_role_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `user_group_id` bigint(20) NOT NULL COMMENT '用户组id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组与角色关联关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_usergroup_role_relation
-- ----------------------------
INSERT INTO `sys_usergroup_role_relation` VALUES (1, '2019-09-04 18:23:12', '2019-09-04 18:23:08', 1, 1);
INSERT INTO `sys_usergroup_role_relation` VALUES (2, '2019-09-04 18:23:15', '2019-09-04 18:23:16', 2, 3);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '表格创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '表格修改时间',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `user_type` int(10) NOT NULL COMMENT '用户类型',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户详情描述',
  `account_state` int(10) NOT NULL COMMENT '账户状态\r\n1：正常\r\n0：禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '2019-09-03 15:51:51', '2019-09-03 15:51:51', 'cyx', '123456', 1, 'cyx', 1);
INSERT INTO `user_info` VALUES (2, '2019-09-05 18:22:44', '2019-09-05 18:22:38', 'zou', '123456', 1, 'zou', 1);

SET FOREIGN_KEY_CHECKS = 1;
