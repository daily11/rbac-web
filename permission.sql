/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50549
 Source Host           : localhost:3306
 Source Schema         : permission

 Target Server Type    : MySQL
 Target Server Version : 50549
 File Encoding         : 65001

 Date: 31/08/2019 12:07:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_acl
-- ----------------------------
DROP TABLE IF EXISTS `sys_acl`;
CREATE TABLE `sys_acl`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限码',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限名',
  `acl_module_id` int(11) NOT NULL DEFAULT 0 COMMENT '权限所在的权限模块id',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求的url',
  `type` int(11) NOT NULL DEFAULT 3 COMMENT '类型，1：菜单，2：按钮，3：其他',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态，1：正常，0：冻结',
  `seq` int(11) NOT NULL DEFAULT 0 COMMENT '权限在当前模块下的顺序，由小到大',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作员',
  `operate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作者操作的时间',
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后一个操作者的ip地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_module`(`acl_module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 359 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_acl
-- ----------------------------
INSERT INTO `sys_acl` VALUES (58, '20190524111752_92', '保存功能模块', 100, '/rbac/saveAclModule', 2, 1, 1, NULL, '', '2019-05-24 13:00:41', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (59, '20190524111936_9', '删除功能模块', 100, '/rbac/deleteAclModule', 2, 1, 1, NULL, '', '2019-05-24 11:19:36', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (60, '20190524112022_72', '更新功能模块', 100, '/rbac/updateAclModule', 2, 1, 1, NULL, '', '2019-05-24 11:20:22', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (61, '20190524112100_14', '查询所有的功能模块', 100, '/rbac/findAllAclModule', 2, 1, 1, NULL, '', '2019-05-24 11:21:00', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (62, '20190524112224_18', '根据功能模块id查询功能模块', 100, '/rbac/findAclModuleById', 2, 1, 1, NULL, '', '2019-05-24 11:22:24', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (63, '20190524112311_94', '保存功能点', 100, '/rbac/saveAcl', 2, 1, 1, NULL, '', '2019-05-24 11:24:15', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (64, '20190524112439_27', '删除功能点', 100, '/rbac/deleteAcl', 2, 1, 1, NULL, '', '2019-05-24 11:24:39', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (65, '20190524112515_91', '查询所有功能点', 100, '/rbac/findAllAcl', 2, 1, 1, NULL, '', '2019-05-24 11:25:15', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (66, '20190524112542_59', '根据功能点id查询功能点', 100, '/rbac/findAclById', 2, 1, 1, NULL, '', '2019-05-24 11:25:42', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (67, '20190524112619_10', '更新功能点', 100, '/rbac/updateAcl', 2, 1, 1, NULL, '', '2019-05-24 11:26:19', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (68, '20190524112838_33', '保存角色功能', 100, '/rbac/saveRoleAcl', 2, 1, 1, NULL, '', '2019-05-24 11:28:38', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (69, '20190524112909_55', '删除角色功能', 100, '/rbac/deleteRoleAcl', 2, 1, 1, NULL, '', '2019-05-24 11:29:09', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (70, '20190524112953_6', '查询角色功能', 100, '/rbac/findAllRoleAcl', 2, 1, 1, NULL, '', '2019-05-24 11:29:53', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (71, '20190524123839_3', '根据角色功能id查询角色功能', 100, '/rbac/findRoleAclById', 2, 1, 1, NULL, '', '2019-05-24 12:38:39', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (72, '20190524123916_23', '更新角色功能', 100, '/rbac/updateRoleAcl', 2, 1, 1, NULL, '', '2019-05-24 12:39:16', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (73, '20190524123949_70', '保存角色', 100, '/rbac/saveRole', 2, 1, 1, NULL, '', '2019-05-24 12:39:49', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (74, '20190524124036_88', '删除角色', 100, '/rbac/deleteRole', 2, 1, 1, NULL, '', '2019-05-24 12:40:36', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (75, '20190524124144_45', '根据角色查询角色功能', 100, '/rbac/fidRoleAclByRolename', 2, 1, 1, NULL, '', '2019-05-24 12:41:44', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (76, '20190524124216_88', '查询角色', 100, '/rbac/findAllRole', 2, 1, 1, NULL, '', '2019-05-24 12:42:16', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (77, '20190524124251_35', '根据id查询角色', 100, '/rbac/findRoleById', 2, 1, 1, NULL, '', '2019-05-24 12:42:51', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (78, '20190524124323_12', '更新角色', 100, '/rbac/updateRole', 2, 1, 1, NULL, '', '2019-05-24 12:43:23', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (79, '20190524124410_74', '查询层级树', 100, '/rbac/aclModuleTree', 2, 1, 1, NULL, '', '2019-05-24 12:44:10', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (80, '20190524124438_88', '查询角色权限模块层级树', 100, '/rbac/aclModuleTreeByRolename', 2, 1, 1, NULL, '', '2019-05-24 12:44:38', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (81, '20190524124528_44', '根据用户id及用户名查询权限层级树', 100, '/rbac/aclModuleTreeByUserIdAndname', 2, 1, 1, NULL, '', '2019-05-24 12:45:28', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (82, '20190524124558_54', '根据id查询用户权限', 100, '/rbac/userAcls', 2, 1, 1, NULL, '', '2019-05-24 12:45:58', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (83, '20190524124621_15', '查询系统预定义给用户对应角色的权限', 100, '/rbac/findUserAclsBySystem', 2, 1, 1, NULL, '', '2019-05-24 12:46:21', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (84, '20190524124638_91', '查询用户自己的，非系统预定义的权限', 100, '/rbac/findUserAclsBySingle', 2, 1, 1, NULL, '', '2019-05-24 12:46:38', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (85, '20190524124726_67', '根据用户id查询层级树', 100, '/rbac/userAclModuleTree', 2, 1, 1, NULL, '', '2019-05-24 12:47:26', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (86, '20190524124758_66', '保存用户角色', 100, '/rbac/saveUserRole', 2, 1, 1, NULL, '', '2019-05-24 12:47:58', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (87, '20190524124828_82', '删除用户角色', 100, '/rbac/deleteUserRole', 2, 1, 1, NULL, '', '2019-05-24 12:48:28', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (88, '20190524124854_48', '查询用户角色', 100, '/rbac/findAllUserRole', 2, 1, 1, NULL, '', '2019-05-24 12:48:54', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (89, '20190524124918_40', '根据id查询用户角色', 100, '/rbac/findUserRoleById', 2, 1, 1, NULL, '', '2019-05-24 12:49:18', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (90, '20190524124945_17', '更新用户角色', 100, '/rbac/updateUserRole', 2, 1, 1, NULL, '', '2019-05-24 12:49:45', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (91, '20190524125009_95', '保存用户', 100, '/rbac/saveUser', 2, 1, 1, NULL, '', '2019-05-24 12:50:09', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (92, '20190524125049_21', '删除用户', 99, '/user/remove', 2, 1, 1, '删除用户', '', '2019-05-24 12:50:49', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (93, '20190524125117_35', '查询用户', 100, '/rbac/findAllUser', 2, 1, 1, NULL, '', '2019-05-24 12:51:17', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (94, '20190524125149_47', '根据id查询用户', 100, '/rbac/findUserById', 2, 1, 1, NULL, '', '2019-05-24 12:51:49', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (95, '20190524125216_18', '更新用户', 100, '/rbac/updateUser', 2, 1, 1, NULL, '', '2019-05-24 12:52:16', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (96, '20190524125317_12', '功能模块与功能点绑定', 100, '/rbca/bondAclModule', 2, 1, 1, NULL, '', '2019-05-24 12:53:17', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (100, '20190528101943_18', '整改问题上报', 56, '/inspect/add/rectification', 2, 1, 1, '上报整改问题', '', '2019-05-28 10:19:43', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (101, '20190528102856_75', '删除整改问题', 56, '/inspect/delete/rectification', 2, 1, 1, NULL, '', '2019-05-28 10:28:56', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (102, '20190528103014_80', '修改整改问题的基本信息', 56, '/inspect/update/rectification/basic', 2, 1, 1, NULL, '', '2019-05-28 10:30:14', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (103, '20190528103118_27', '开始整改问题', 56, '/inspect/start/rectification', 2, 1, 1, NULL, '', '2019-05-28 10:31:18', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (104, '20190528103145_42', '提交整改问题', 56, '/inspect/commit/rectification', 2, 1, 1, NULL, '', '2019-05-28 10:31:45', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (105, '20190528103325_6', '获取整改问题的最新状态', 56, '/inspect/find/rectification/status', 2, 1, 1, NULL, '', '2019-05-28 10:33:25', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (106, '20190528103504_46', '获取整改问题的处理流程', 56, '/inspect/find/rectification/detail', 2, 1, 1, NULL, '', '2019-05-28 10:35:04', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (107, '20190528103804_68', '列举整改问题列表', 56, '/inspect/list/rectification/history', 2, 1, 1, NULL, '', '2019-05-28 10:38:04', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (108, '20190528104421_4', '查询单个人的排班', 76, '/schedule/find/byUser', 2, 1, 1, NULL, '', '2019-05-28 10:44:21', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (109, '20190528104645_1', '查询一天的排班', 76, '/schedule/find/forDay', 2, 1, 1, '查询某个水利设施一天的排班', '', '2019-05-28 10:46:45', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (110, '20190528105025_76', '列举排班', 76, '/schedule/list', 2, 1, 1, NULL, '', '2019-05-28 10:50:25', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (111, '20190528105238_1', '添加水利设施', 77, '/conservancy/addTest', 2, 1, 1, '添加水利设施及管理设备', '', '2019-05-28 10:52:38', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (112, '20190528105313_57', '添加水闸', 77, '/conservancy/add', 2, 1, 1, '添加水利设施', '', '2019-05-28 10:53:13', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (113, '20190528111818_28', '修改水利设施基本信息', 77, '/conservancy/update/basic', 2, 1, 1, '修改基本信息', '', '2019-05-28 11:18:18', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (114, '20190528111911_12', '修改水利设施信息', 77, '/conservancy/update', 2, 1, 1, '修改水利设施详细信息', '', '2019-05-28 11:19:11', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (115, '20190528112034_37', '查询水利设施的基本信息列表', 77, '/conservancy/list/basic', 2, 1, 1, NULL, '', '2019-05-28 11:20:34', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (116, '20190528112303_60', '查询单个水利设施的详情', 77, '/conservancy/find/detail', 2, 1, 1, NULL, '', '2019-05-28 11:23:03', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (117, '20190528112939_49', '新增摄像头', 78, '/camera/add', 2, 1, 1, NULL, '', '2019-05-28 11:29:39', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (118, '20190528113013_59', '删除摄像头', 78, '/camera/delete', 2, 1, 1, NULL, '', '2019-05-28 11:30:13', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (119, '20190528113059_64', '修改摄像头', 78, '/camera/update', 2, 1, 1, NULL, '', '2019-05-28 11:30:59', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (120, '20190528113307_89', '查询摄像头列表', 78, '/camera/list', 2, 1, 1, NULL, '', '2019-05-28 11:33:07', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (121, '20190528142910_77', '闸门列表', 83, '/gate/listGate', 2, 1, 1, '点击闸门管理，列举闸门列表', 'ps', '2019-05-28 14:29:10', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (122, '20190528145052_68', '添加闸门', 83, '/gate/add', 2, 1, 1, '添加闸门', 'ps', '2019-05-28 14:50:52', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (123, '20190528145140_69', '修改闸门', 83, '/gate/update', 2, 1, 1, '修改闸门', 'ps', '2019-05-28 14:51:40', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (124, '20190528145227_61', '删除闸门', 83, '/gate/deleteById', 2, 1, 1, '删除闸门', 'ps', '2019-05-28 14:52:27', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (126, '20190528151334_5', '新增公司', 102, '/company/add', 2, 1, 1, '新增公司', 'ps', '2019-05-28 15:13:34', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (127, '20190528151404_42', '删除公司', 102, '/company/delete', 2, 1, 1, '删除公司', 'ps', '2019-05-28 15:14:04', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (128, '20190528151427_59', '更新公司信息', 102, '/company/update', 2, 1, 1, '更新公司信息', 'ps', '2019-05-28 15:14:27', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (129, '20190528151452_47', '根据公司id查询', 102, '/company/query', 2, 1, 1, '根据公司id查询', 'ps', '2019-05-28 15:14:52', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (130, '20190528151519_51', '根据类型查询', 102, '/company/querybytype', 2, 1, 1, '根据类型查询', 'ps', '2019-05-28 15:15:19', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (131, '20190528151542_96', '根据条件查询公司详情', 102, '/find/byCondition', 2, 1, 1, '根据条件查询公司详情', 'ps', '2019-05-28 15:15:42', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (132, '20190528152103_63', '开始整改', 55, '/process/start', 2, 1, 1, '开始整改', 'ps', '2019-05-28 15:21:03', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (133, '20190528152129_84', '查询报警公司', 55, '/process/company', 2, 1, 1, '查询报警公司', 'ps', '2019-05-28 15:21:29', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (134, '20190528152150_43', '提交整改', 55, '/process/commit', 2, 1, 1, '提交整改', 'ps', '2019-05-28 15:21:50', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (135, '20190528152213_13', '查询报警', 55, '/process/query', 2, 1, 1, '查询报警', 'ps', '2019-05-28 15:22:13', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (136, '20190528152237_85', '结束报警', 55, '/process/end', 2, 1, 1, '结束报警', 'ps', '2019-05-28 15:22:37', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (137, '20190528152257_43', '重置报警', 55, '/process/relieve', 2, 1, 1, '重置报警', 'ps', '2019-05-28 15:22:57', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (138, '20190528152317_69', '取消报警', 55, '/process/cancel', 2, 1, 1, '取消报警', 'ps', '2019-05-28 15:23:17', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (139, '20190528152433_3', '新增组信息', 41, '/group/add', 2, 1, 1, '新增组信息', 'ps', '2019-05-28 15:24:33', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (140, '20190528152453_6', '修改组信息', 41, '/group/edit', 2, 1, 1, '修改组信息', 'ps', '2019-05-28 15:24:53', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (141, '20190528152515_25', '删除组', 41, '/group/delete', 2, 1, 1, '删除组', 'ps', '2019-05-28 15:25:15', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (142, '20190528152535_53', '查询组信息', 41, '/group/list', 2, 1, 1, '查询组信息', 'ps', '2019-05-28 15:25:35', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (143, '20190528152554_67', '查询用户组信息', 41, '/group/query/user', 2, 1, 1, '查询用户组信息', 'ps', '2019-05-28 15:25:54', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (144, '20190528152616_88', '查询权限信息', 41, '/group/query/roleId', 2, 1, 1, '查询权限信息', 'ps', '2019-05-28 15:26:16', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (145, '20190528152637_31', '新增资源', 41, '/group/add/resources', 2, 1, 1, '新增资源', 'ps', '2019-05-28 15:26:37', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (146, '20190528152656_40', '删除资源', 41, '/group/delete/resources', 2, 1, 1, '删除资源', 'ps', '2019-05-28 15:26:56', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (147, '20190528152716_88', '修改资源信息', 41, '/group/edit/resources', 2, 1, 1, '修改资源信息', 'ps', '2019-05-28 15:27:16', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (148, '20190528152735_20', '查询资源信息', 41, '/group/resources/query', 2, 1, 1, '查询资源信息', 'ps', '2019-05-28 15:27:35', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (149, '20190528152753_54', '查询资源', 41, '/group/resources/list', 2, 1, 1, '查询资源', 'ps', '2019-05-28 15:27:53', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (150, '20190528152812_48', '查询水利资源', 41, '/group/resources/water', 2, 1, 1, '查询水利资源', 'ps', '2019-05-28 15:28:12', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (151, '20190528152837_23', '查询用户资源', 41, '/group/resources/person', 2, 1, 1, '查询用户资源', 'ps', '2019-05-28 15:28:37', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (152, '20190528152951_77', '实时水位信息', 54, '/monitoring/water', 2, 1, 1, '实时水位信息', 'ps', '2019-05-28 15:29:51', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (153, '20190528153013_34', '实时电量信息', 54, '/monitoring/electricity', 2, 1, 1, '实时电量信息', 'ps', '2019-05-28 15:30:13', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (154, '20190528153035_19', '实时门信息', 54, '/monitoring/gate', 2, 1, 1, '实时门信息', 'ps', '2019-05-28 15:30:35', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (155, '20190528153056_49', '实时泵信息', 54, '/monitoring/pump', 2, 1, 1, '实时泵信息', 'ps', '2019-05-28 15:30:56', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (156, '20190528153121_90', '实时摄像头信息', 54, '/monitoring/cream', 2, 1, 1, '实时摄像头信息', 'ps', '2019-05-28 15:31:21', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (157, '20190528153144_57', '实时网络信息', 54, '/monitoring/network', 2, 1, 1, '实时网络信息', 'ps', '2019-05-28 15:31:44', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (158, '20190528153203_12', '闸门信息', 54, '/monitoring/gateState', 2, 1, 1, '闸门信息', 'ps', '2019-05-28 15:32:03', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (159, '20190528153223_60', '圩区树', 54, '/monitoring/damTree', 2, 1, 1, '圩区树', 'ps', '2019-05-28 15:32:23', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (160, '20190528153326_70', '水闸综合监控树结构', 54, '/monitoring/damShowTree', 2, 1, 1, '水闸综合监控树结构', 'ps', '2019-05-28 15:33:26', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (161, '20190528153359_54', '视频监控实时视频左侧树形结构', 54, '/monitoring/damShowTree2', 2, 1, 1, '视频监控实时视频左侧树形结构', 'ps', '2019-05-28 15:33:59', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (162, '20190528153423_20', '区域摄像头树', 54, '/monitoring/regionCameraTree', 2, 1, 1, '区域摄像头树', 'ps', '2019-05-28 15:34:23', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (163, '20190528153443_35', '圩区摄像头树', 54, '/monitoring/damCameraTree', 2, 1, 1, '圩区摄像头树', 'ps', '2019-05-28 15:34:43', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (164, '20190528153514_88', '新增水利关注', 54, '/monitoring/addFavourite', 2, 1, 1, '新增水利关注', 'ps', '2019-05-28 15:35:14', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (165, '20190528153535_15', '查询摄像头关注', 54, '/monitoring/cameraFavourite', 2, 1, 1, '查询摄像头关注', 'ps', '2019-05-28 15:35:35', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (166, '20190528153555_26', '新增摄像头关注', 54, '/monitoring/addCameraFavourite', 2, 1, 1, '新增摄像头关注', 'ps', '2019-05-28 15:35:55', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (167, '20190528153620_77', '删除摄像头关注', 54, '/monitoring/deleteFavourite', 2, 1, 1, '删除摄像头关注', 'ps', '2019-05-28 15:36:20', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (168, '20190528153645_25', '删除水利关注', 54, '/monitoring/deleteWaterFavourite', 2, 1, 1, '删除水利关注', 'ps', '2019-05-28 15:36:45', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (169, '20190528153706_32', '查询摄像头是否被收藏', 54, '/monitoring/queryCameraIsFavourite', 2, 1, 1, '查询摄像头是否被收藏', 'ps', '2019-05-28 15:37:06', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (170, '20190528153910_38', '图层', 109, '/map/list', 2, 1, 1, '图层', 'ps', '2019-05-28 15:39:10', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (171, '20190528153930_35', '船舶信息', 109, '/map/ship', 2, 1, 1, '船舶信息', 'ps', '2019-05-28 15:39:30', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (172, '20190528153951_96', '人员信息', 109, '/map/personnel', 2, 1, 1, '人员信息', 'ps', '2019-05-28 15:39:51', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (173, '20190528154012_20', '设备监控', 109, '/map/device', 2, 1, 1, '设备监控', 'ps', '2019-05-28 15:40:12', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (174, '20190528154036_88', '水位信息', 109, '/map/waterLevel', 2, 1, 1, '水位信息', 'ps', '2019-05-28 15:40:36', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (175, '20190528154058_27', '子系统', 109, '/map/sub', 2, 1, 1, '子系统', 'ps', '2019-05-28 15:40:58', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (176, '20190528154123_69', '统计信息', 109, '/map/summary', 2, 1, 1, '统计信息', 'ps', '2019-05-28 15:41:23', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (177, '20190528154143_26', '查看取证信息', 109, '/map/evidence', 2, 1, 1, '查看取证信息', 'ps', '2019-05-28 15:41:43', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (178, '20190528154206_26', '查看人员报警信息', 109, '/map/personalAlarm', 2, 1, 1, '查看人员报警信息', 'ps', '2019-05-28 15:42:06', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (179, '20190528154227_72', '查看船舶报警信息', 109, '/map/shipAlarm', 2, 1, 1, '查看船舶报警信息', 'ps', '2019-05-28 15:42:27', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (180, '20190528154246_77', '报警信息', 109, '/map/alarm', 2, 1, 1, '报警信息', 'ps', '2019-05-28 15:42:46', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (181, '20190528154309_89', '报警处理信息', 109, '/map/inspect', 2, 1, 1, '报警处理信息', 'ps', '2019-05-28 15:43:09', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (182, '20190528154328_74', '养护信息', 109, '/map/maintain', 2, 1, 1, '养护信息', 'ps', '2019-05-28 15:43:28', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (183, '20190528154349_95', '下方详细信息显示内容', 109, '/map/monitorGrid', 2, 1, 1, '下方详细信息显示内容', 'ps', '2019-05-28 15:43:49', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (184, '20190528154431_77', '报警详细信息', 109, '/map/gridAlarm', 2, 1, 1, '报警详细信息', 'ps', '2019-05-28 15:44:31', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (185, '20190528154450_81', '取证列表取证详细信息', 109, '/map/gridRiver', 2, 1, 1, '取证列表取证详细信息', 'ps', '2019-05-28 15:44:50', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (186, '20190528154525_61', '市区取证统计信息', 109, '/map/gridCityRegionStatistics', 2, 1, 1, '市区取证统计信息', 'ps', '2019-05-28 15:45:25', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (187, '20190528154551_0', '镇村取证统计信息', 109, '/map/gridTownRegionStatistics', 2, 1, 1, '镇村取证统计信息', 'ps', '2019-05-28 15:45:51', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (188, '20190528154637_57', '作战图养护信息', 109, '/map/gridInspect', 2, 1, 1, '作战图养护信息', 'ps', '2019-05-28 15:46:37', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (189, '20190528154705_42', '作战图报警信息', 109, '/map/gridWork', 2, 1, 1, '作战图报警信息', 'ps', '2019-05-28 15:47:05', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (190, '20190528154725_11', '水利设施报警信息', 109, '/map/gridFacility', 2, 1, 1, '水利设施报警信息', 'ps', '2019-05-28 15:47:25', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (191, '20190528154751_47', '作战图人员信息', 109, '/map/gridPersonnel', 2, 1, 1, '作战图人员信息', 'ps', '2019-05-28 15:47:51', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (192, '20190528154820_83', '新闻', 109, '/map/news', 2, 1, 1, '新闻', 'ps', '2019-05-28 15:48:20', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (193, '20190528154847_37', '作战图新闻', 109, '/map/gridNews', 2, 1, 1, '作战图新闻', 'ps', '2019-05-28 15:48:47', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (194, '20190528155106_2', '作战图下方Tab', 109, '/map/tabBoard', 2, 1, 1, '作战图下方Tab', 'ps', '2019-05-28 15:51:06', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (195, '20190528163243_82', '添加圩区', 86, '/damDomain/addDam', 2, 1, 1, '添加圩区', 'ps', '2019-05-28 16:32:43', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (196, '20190528163421_52', '更新圩区', 86, '/damDomain/updateDam', 2, 1, 1, '更新圩区', 'ps', '2019-05-28 16:34:21', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (197, '20190528163959_90', '删除圩区', 86, '/damDomain/deleteDamById', 2, 1, 1, '删除圩区', 'ps', '2019-05-28 16:39:59', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (198, '20190528164106_39', '查询圩区', 86, '/damDomain/findDamByCondition', 2, 1, 1, '查询圩区', 'ps', '2019-05-28 16:41:06', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (199, '20190528164216_82', '导出圩区', 86, '/damDomain/export', 2, 1, 1, '导出圩区', 'ps', '2019-05-28 16:42:16', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (200, '20190528164347_34', '导入圩区', 86, '/damDomain/import', 2, 1, 1, '导入圩区', 'ps', '2019-05-28 16:43:47', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (201, '20190528175707_20', '设施总数分类', 109, '/count/facilityCountByGroupOnther', 2, 1, 1, '设施总数分类', 'ps', '2019-05-28 17:57:07', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (202, '20190528175751_30', '河流分类', 109, '/count/riverCountByGroup', 2, 1, 1, '河流分类', 'ps', '2019-05-28 17:57:51', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (203, '20190528175857_34', '水闸报警（饼图）', 109, '/count/runAlarmCountByGroup', 2, 1, 1, '水闸报警（饼图）', 'ps', '2019-05-28 17:58:57', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (204, '20190528175953_22', '水闸整改（饼图）', 109, '/count/reportAlarmCountByGroup', 2, 1, 1, '水闸整改（饼图）', 'ps', '2019-05-28 17:59:53', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (205, '20190528180143_96', '水闸整改（滚动tab）', 109, '/count/facilityReportCount', 2, 1, 1, '水闸整改（滚动tab）', 'ps', '2019-05-28 18:01:43', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (206, '20190528182629_94', '水泵列表', 82, '/pump/listPump', 2, 1, 1, '水泵列表', 'ps', '2019-05-28 18:26:29', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (207, '20190528182706_36', '添加水泵', 82, '/pump/add', 2, 1, 1, '添加水泵', 'ps', '2019-05-28 18:27:06', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (208, '20190528182733_0', '修改水泵', 82, '/pump/update', 2, 1, 1, '修改水泵', 'ps', '2019-05-28 18:27:33', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (209, '20190528182807_90', '删除水泵', 82, '/pump/deletePumpById', 2, 1, 1, '删除水泵', 'ps', '2019-05-28 18:28:07', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (210, '20190528182841_55', '导出水泵信息', 82, '/pump/exportPump', 2, 1, 1, '导出水泵信息', 'ps', '2019-05-28 18:28:41', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (211, '20190528182921_39', '网络设备列表', 84, '/network/listNetwork', 2, 1, 1, '网络设备列表', 'ps', '2019-05-28 18:29:21', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (212, '20190528182949_55', '添加网络设备', 84, '/network/add', 2, 1, 1, '添加网络设备', 'ps', '2019-05-28 18:29:49', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (213, '20190528183015_45', '修改网络设备', 84, '/network/update', 2, 1, 1, '修改网络设备', 'ps', '2019-05-28 18:30:15', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (214, '20190528183046_29', '删除网络设备', 84, '/network/deleteNetworkById', 2, 1, 1, '删除网络设备', 'ps', '2019-05-28 18:30:46', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (215, '20190528183117_93', '导出网络设备信息', 84, '/network/exportNetwork', 2, 1, 1, '导出网络设备信息', 'ps', '2019-05-28 18:31:17', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (216, '20190528183206_86', '实时视频树结构', 52, '/monitoring/damShowTree2', 2, 1, 1, '实时视频树结构', 'ps', '2019-05-28 18:32:06', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (217, '20190528183257_67', '水闸监控树结构', 53, '/monitoring/damShowTree', 2, 1, 1, '水闸监控树结构', 'ps', '2019-05-28 18:32:57', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (218, '20190528183447_66', '日常巡查记录表搜索', 57, '/inspection/inspRecordQuery', 2, 1, 1, '日常巡查记录表搜索', 'ps', '2019-05-28 18:34:47', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (219, '20190528183523_14', '日常巡查记录表导出', 57, '/inspection/inspRecordExport', 2, 1, 1, '日常巡查记录表导出', 'ps', '2019-05-28 18:35:23', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (220, '20190528183602_67', '水利整改汇总表搜索', 59, '/conservancyMaintenance/getConMainList', 2, 1, 1, '水利整改汇总表搜索', 'ps', '2019-05-28 18:36:02', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (221, '20190528183646_40', '水利整改汇总表导出', 59, '/conservancyMaintenance/exportConMain', 2, 1, 1, '水利整改汇总表导出', 'ps', '2019-05-28 18:36:46', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (222, '20190528183739_50', '水利整改记录表搜索', 58, '/conservancyMaintenance/listConMainImage', 2, 1, 1, '水利整改记录表搜索', 'ps', '2019-05-28 18:37:39', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (223, '20190528183814_79', '绿化养护月报搜索', 60, '/greenMain/getGreenRecordList', 2, 1, 1, '绿化养护月报搜索', 'ps', '2019-05-28 18:38:14', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (224, '20190528183844_83', '绿化养护月报导出', 60, '/greenMain/exportGreenRecord', 2, 1, 1, '绿化养护月报导出', 'ps', '2019-05-28 18:38:44', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (225, '20190528183912_49', '绿化养护月报新增', 60, '/greenMain/addGreenRecordList', 2, 1, 1, '绿化养护月报新增', 'ps', '2019-05-28 18:39:12', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (226, '20190528183939_18', '绿化养护记录表搜索', 61, '/greenMain/getGreenTotalRecordList', 2, 1, 1, '绿化养护记录表搜索', 'ps', '2019-05-28 18:39:39', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (227, '20190528184006_53', '绿化养护记录表导出', 61, '/greenMain/greenTotalRecordExport', 2, 1, 1, '绿化养护记录表导出', 'ps', '2019-05-28 18:40:06', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (228, '20190528184040_79', '绿化养护记录表添加', 61, '/greenMain/addGreenTotalRecord', 2, 1, 1, '绿化养护记录表添加', 'ps', '2019-05-28 18:40:40', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (229, '20190528184122_36', '柴油发电机组搜索', 62, '/dynamotor/getRecordList', 2, 1, 1, '柴油发电机组搜索', 'ps', '2019-05-28 18:41:22', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (230, '20190528184148_20', '柴油发电机组新增', 62, '/dynamotor/addRecord', 2, 1, 1, '柴油发电机组新增', 'ps', '2019-05-28 18:41:48', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (231, '20190528184223_46', '柴油发电机组删除', 62, '/dynamotor/deleteRecord', 2, 1, 1, '柴油发电机组删除', 'ps', '2019-05-28 18:42:23', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (232, '20190528184310_64', '柴油发电机组导出', 62, '/dynamotor/exportRecord', 2, 1, 1, '柴油发电机组导出', 'ps', '2019-05-28 18:43:10', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (233, '20190528184330_51', '柴油发电机组导入', 62, '/dynamotor/importRecord', 2, 1, 1, '柴油发电机组导入', 'ps', '2019-05-28 18:43:30', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (234, '20190528184426_41', '巡查工作查询', 91, '/inspection/coverRateQuery', 2, 1, 1, '巡查工作查询', 'ps', '2019-05-28 18:44:26', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (235, '20190528184519_13', '物资养护信息搜索', 97, '/goodsMaintenance/getGoodsMainByCondition', 2, 1, 1, '物资养护信息搜索', 'ps', '2019-05-28 18:45:19', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (236, '20190528184549_36', '物资养护信息新增', 97, '/goodsMaintenance/addMain', 2, 1, 1, '物资养护信息新增', 'ps', '2019-05-28 18:45:49', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (237, '20190528184626_37', '物资巡检信息搜索', 98, '/goodsInspection/getGoodsInsByCondition', 2, 1, 1, '物资巡检信息搜索', 'ps', '2019-05-28 18:46:26', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (238, '20190528184753_46', '物资巡检信息新增', 98, '/goodsInspection/add', 2, 1, 1, '物资巡检信息新增', 'ps', '2019-05-28 18:47:53', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (239, '20190529095515_78', '新增防汛物资状态', 95, '/status/addStatus', 2, 1, 1, '新增防汛物资状态', 'ps', '2019-05-29 09:55:15', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (240, '20190529095616_46', '删除防汛物资状态', 95, '/status/delStatus', 2, 1, 1, '删除防汛物资状态', 'ps', '2019-05-29 09:56:16', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (241, '20190529095654_74', '修改防汛物资状态', 95, '/status/updStatus', 2, 1, 1, '修改防汛物资状态', 'ps', '2019-05-29 09:56:54', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (242, '20190529095748_62', '查询防汛物资状态', 95, '/status/findStatusByCondition', 2, 1, 1, '查询防汛物资状态', 'ps', '2019-05-29 09:57:48', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (243, '20190529095844_32', '导出防汛物资状态', 95, '/status/exportStatus', 2, 1, 1, '导出防汛物资状态', 'ps', '2019-05-29 09:58:44', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (244, '20190529100543_37', '新增物资出入库信息', 96, '/status/addCheckinout', 2, 1, 1, '新增物资出入库信息', 'ps', '2019-05-29 10:05:43', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (245, '20190529100616_92', '删除物资出入库信息', 96, '/status/delCheckinout', 2, 1, 1, '删除物资出入库信息', 'ps', '2019-05-29 10:06:16', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (246, '20190529100642_4', '更新物资出入库信息', 96, '/status/updCheckinout', 2, 1, 1, '更新物资出入库信息', 'ps', '2019-05-29 10:06:42', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (247, '20190529100718_35', '查询物资流动信息', 96, '/status/findFlow', 2, 1, 1, '查询物资流动信息', 'ps', '2019-05-29 10:07:18', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (248, '20190529100803_45', '导出物资流动信息', 96, '/status/exportCheckinout', 2, 1, 1, '导出物资流动信息', 'ps', '2019-05-29 10:08:03', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (249, '20190529100958_12', '添加卫生执勤', 68, '/healthDut/addHealthDutyRow', 2, 1, 1, '添加卫生执勤，注意是添加一行', 'ps', '2019-05-29 10:09:58', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (252, '20190529101220_45', '查询卫生记录', 68, '/healthDut/findHealthDutyByCondition', 2, 1, 1, '查询卫生记录', 'ps', '2019-05-29 10:12:20', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (253, '20190529101251_25', '导出卫生记录', 68, '/healthDut/export', 2, 1, 1, '导出卫生记录', 'ps', '2019-05-29 10:12:51', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (254, '20190529101320_70', '上传卫生记录', 68, '/healthDut/import', 2, 1, 1, '上传卫生记录', 'ps', '2019-05-29 10:13:20', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (255, '20190529101506_79', '查泵闸历史工况', 73, '/history/findPumpAndGateHistory', 2, 1, 1, '查泵闸历史工况', 'ps', '2019-05-29 10:15:06', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (256, '20190529101539_27', '导出泵闸历史工况', 73, '/history/exportPumpAndGate', 2, 1, 1, '导出泵闸的历史工况', 'ps', '2019-05-29 10:15:39', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (257, '20190529102009_18', '添加泵闸运行记录', 63, '/operationRecord/addPumGate', 2, 1, 1, '添加泵闸运行记录', 'ps', '2019-05-29 10:20:09', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (258, '20190529102126_69', '删除闸门运行记录', 63, '/operationRecord/delPumGate', 2, 1, 1, '删除闸门运行记录', 'ps', '2019-05-29 10:21:26', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (259, '20190529102150_25', '更新泵闸运行记录', 63, '/operationRecord/updPumGate', 2, 1, 1, '更新泵闸运行记录', 'ps', '2019-05-29 10:21:50', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (260, '20190529102220_93', '查询泵闸运行记录', 63, '/operationRecord/findPumGate', 2, 1, 1, '查询泵闸运行记录', 'ps', '2019-05-29 10:22:20', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (261, '20190529102244_69', '导出泵闸运行记录', 63, '/operationRecord/export', 2, 1, 1, '导出泵闸运行记录', 'ps', '2019-05-29 10:22:44', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (262, '20190529102319_46', '上传泵闸运行记录', 63, '/operationRecord/import', 2, 1, 1, '上传泵闸运行记录', 'ps', '2019-05-29 10:23:19', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (263, '20190529102509_3', '添加行政区', 87, '/region/addRegion', 2, 1, 1, '添加行政区', 'ps', '2019-05-29 10:25:09', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (264, '20190529102547_2', '更新行政区', 87, '/region/updateRegion', 2, 1, 1, '更新行政区', 'ps', '2019-05-29 10:25:47', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (265, '20190529102617_32', '删除行政区', 87, '/region/deleteRegionById', 2, 1, 1, '删除行政区', 'ps', '2019-05-29 10:26:17', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (266, '20190529103010_18', '删除卫生记录', 68, '/healthDut/delHealthDuty', 2, 1, 1, '删除卫生记录，注意是删除一行', 'ps', '2019-05-29 10:30:10', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (267, '20190529103107_78', '更新卫生记录', 68, '/healthDut/updHealthDutyAll', 2, 1, 1, '更新卫生记录，注意是页面全部数据', 'ps', '2019-05-29 10:31:07', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (268, '20190529103221_21', '查询行政区', 87, '/region/findRegion', 2, 1, 1, '查询行政区', 'ps', '2019-05-29 10:32:21', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (269, '20190529103258_88', '导出行政区', 87, '/region/export', 2, 1, 1, '导出行政区', 'ps', '2019-05-29 10:32:58', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (270, '20190529103330_74', '导入行政区', 87, '/region/import', 2, 1, 1, '导入行政区', 'ps', '2019-05-29 10:33:30', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (271, '20190529103622_1', '添加河流', 85, '/river/addRiver', 2, 1, 1, '添加河流', 'ps', '2019-05-29 10:36:22', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (272, '20190529103659_47', '更新河流', 85, '/river/updateRiver', 2, 1, 1, '更新河流', 'ps', '2019-05-29 10:36:59', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (273, '20190529103745_91', '删除河流', 85, '/river/deleteRiverById', 2, 1, 1, '删除河流', 'ps', '2019-05-29 10:37:45', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (274, '20190529103838_16', '查询河流信息', 85, '/river/findRiverByCondition', 2, 1, 1, '查询河流信息', 'ps', '2019-05-29 10:38:38', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (275, '20190529103903_3', '导出河流', 85, '/river/export', 2, 1, 1, '导出河流', 'ps', '2019-05-29 10:39:03', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (276, '20190529103926_31', '导入河流', 85, '/river/import', 2, 1, 1, '导入河流', 'ps', '2019-05-29 10:39:26', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (277, '20190529104014_69', '添加船舶过闸记录', 67, '/ship/addShipCross', 2, 1, 1, '添加船舶过闸记录', 'ps', '2019-05-29 10:40:14', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (278, '20190529104055_97', '删除船舶过闸记录', 67, '/ship/delShipCross', 2, 1, 1, '删除船舶过闸记录', 'ps', '2019-05-29 10:40:55', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (279, '20190529104121_45', '更新船舶过闸记录', 67, '/ship/updShipCross', 2, 1, 1, '更新船舶过闸记录', 'ps', '2019-05-29 10:41:21', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (280, '20190529104150_69', '查找船舶过闸记录', 67, '/ship/findShipCrossByCondition', 2, 1, 1, '查找船舶过闸记录', 'ps', '2019-05-29 10:41:50', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (281, '20190529104221_66', '导出船舶过闸记录', 67, '/ship/export', 2, 1, 1, '导出船舶过闸记录', 'ps', '2019-05-29 10:42:21', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (282, '20190529104301_0', '上传船舶过记录', 67, '/ship/import', 2, 1, 1, '上传船舶过记录', 'ps', '2019-05-29 10:43:01', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (283, '20190529104425_0', '增加交接班记录', 66, '/waterHandover/addHandover', 2, 1, 1, '增加交接班记录', 'ps', '2019-05-29 10:44:25', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (284, '20190529104449_27', '删除交接班记录', 66, '/waterHandover/delHandover', 2, 1, 1, '删除交接班记录', 'ps', '2019-05-29 10:44:49', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (285, '20190529104514_54', '更新交接班记录', 66, '/waterHandover/updHandover', 2, 1, 1, '更新交接班记录', 'ps', '2019-05-29 10:45:14', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (286, '20190529104651_9', '查出交接班记录', 66, '/waterHandover/findHandoverByCondition', 2, 1, 1, '查出交接班记录', 'ps', '2019-05-29 10:46:51', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (287, '20190529104721_89', '导出交接班记录', 66, '/waterHandover/export', 2, 1, 1, '导出交接班记录', 'ps', '2019-05-29 10:47:21', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (288, '20190529104749_26', '上传交接班记录', 66, '/waterHandover/import', 2, 1, 1, '上传交接班记录', 'ps', '2019-05-29 10:47:49', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (289, '20190529104947_9', '添加调水记录', 64, '/waterTransfer/addWaterTransferAndTmage', 2, 1, 1, '添加调水记录：汇总和照片', 'ps', '2019-05-29 10:49:47', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (290, '20190529105023_81', '删除调水记录汇总', 64, '/waterTransfer/delWaterTransfer', 2, 1, 1, '删除调水记录汇总，没有删除图片', 'ps', '2019-05-29 10:50:23', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (291, '20190529105055_85', '更新调水记录', 64, '/waterTransfer/updWaterTransfer', 2, 1, 1, '更新调水记录', 'ps', '2019-05-29 10:50:55', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (292, '20190529105124_57', '查找调水记录', 64, '/waterTransfer/findWaterTransferBycondition', 2, 1, 1, '查找调水记录', 'ps', '2019-05-29 10:51:24', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (293, '20190529105149_97', '导出调水记录', 64, '/waterTransfer/export', 2, 1, 1, '导出调水记录', 'ps', '2019-05-29 10:51:49', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (294, '20190529105221_49', '导入调水记录', 64, '/waterTransfer/import', 2, 1, 1, '导入调水记录', 'ps', '2019-05-29 10:52:21', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (295, '20190529105434_78', '导出调水照片', 65, '/waterTransfer/exportPicture', 2, 1, 1, '导出调水照片', 'ps', '2019-05-29 10:54:34', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (296, '20190529111156_68', '新增人员', 101, '/personnel/add', 2, 1, 1, '新增人员', 'ps', '2019-05-29 11:11:56', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (297, '20190529111217_79', '修改人员', 101, '/personnel/update', 2, 1, 1, '修改人员', 'ps', '2019-05-29 11:12:17', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (298, '20190529111238_45', '删除人员', 101, '/personnel/deleteByPersonnelId', 2, 1, 1, '删除人员', 'ps', '2019-05-29 11:12:38', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (299, '20190529111300_14', '删除公司人员', 101, '/personnel/deleteByCompanyId', 2, 1, 1, '删除公司人员', 'ps', '2019-05-29 11:13:00', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (300, '20190529111322_54', '更新公司人员', 101, '/personnel/updateCompany', 2, 1, 1, '更新公司人员', 'ps', '2019-05-29 11:13:22', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (301, '20190529111341_66', '查询人员列表', 101, '/personnel/query', 2, 1, 1, '查询人员列表', 'ps', '2019-05-29 11:13:41', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (302, '20190529111403_92', '查询人员列表所有', 101, '/personnel/list', 2, 1, 1, '查询人员列表所有', 'ps', '2019-05-29 11:14:03', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (303, '20190529111436_14', '修改功能资源', 41, '/rabc/role/update', 2, 1, 1, '修改功能资源', 'ps', '2019-05-29 11:14:36', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (304, '20190529111514_42', '查询权限资源', 41, '/rabc/role/query/aclInfo', 2, 1, 1, '查询权限资源', 'ps', '2019-05-29 11:15:14', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (305, '20190529111544_79', '查询用户管理列表', 99, '/user/list', 2, 1, 1, '查询用户管理列表', 'ps', '2019-05-29 11:15:44', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (306, '20190529111607_76', '新增用户', 99, '/user/add', 2, 1, 1, '新增用户', 'ps', '2019-05-29 11:16:07', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (307, '20190529111627_93', '修改用户', 99, '/user/update', 2, 1, 1, '修改用户', 'ps', '2019-05-29 11:16:27', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (308, '20190529111649_45', '重置密码', 99, '/user/resetPwd', 2, 1, 1, '重置密码', 'ps', '2019-05-29 11:16:49', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (309, '20190529111710_40', '批量删除用户', 99, '/user/deleteByIds', 2, 1, 1, '批量删除用户', 'ps', '2019-05-29 11:17:10', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (310, '20190529111734_80', '删除用户', 99, '/user/remove', 2, 1, 1, '删除用户', 'ps', '2019-05-29 11:17:34', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (311, '20190529112005_82', '检测用户名称', 99, '/user/checkName', 2, 1, 1, '检测用户名称', 'ps', '2019-05-29 11:20:05', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (312, '20190529112028_64', '获取用户类型', 99, '/user/types', 2, 1, 1, '获取用户类型', 'ps', '2019-05-29 11:20:28', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (313, '20190529133332_91', '首页数据统计功能', 45, '/facilityUnite/monitoring/queryAllCount', 2, 1, 1, '获取各项统计数据', 'ps', '2019-05-29 13:33:32', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (314, '20190529133440_45', '设施工况综合查询接口', 45, '/facilityUnite/monitoring/queryAllFacilityWaterNew', 2, 1, 1, '可根据条件查询设施的综合实时信息', 'ps', '2019-05-29 13:34:40', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (315, '20190529133632_89', '实时报警查询', 45, '/facilityUnite/alarm/getAllAlarm', 2, 1, 1, '按设施分组返回各类报警信息', 'ps', '2019-05-29 13:36:32', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (316, '20190529133939_51', '考勤查询接口', 75, '/attendance/findAttendanceLog', 2, 1, 1, '返回无正常异常状态值的考勤', 'ps', '2019-05-29 13:39:39', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (317, '20190529134021_19', '考勤查询', 75, '/attendance/findBypage', 2, 1, 1, '返回区分正常异常状态的考勤', 'ps', '2019-05-29 13:40:21', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (318, '20190529134210_17', '考勤查询(按设施名称)', 75, '/attendance/findByFacilityName', 2, 1, 1, '按设施名称查询该设施下的考勤信息', 'ps', '2019-05-29 13:42:10', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (319, '20190529134303_2', '考勤统计信息', 75, '/attendance/attendanceStatus', 2, 1, 1, '(柱状图展示)', 'ps', '2019-05-29 13:43:03', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (320, '20190529134329_56', '考勤统计应出勤人数', 75, '/attendance/attendanceCount', 2, 1, 1, '(柱状图展示)', 'ps', '2019-05-29 13:43:29', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (321, '20190529134413_95', '考勤详情查询', 75, '/attendance/findAttendanceOrgLog', 2, 1, 1, '返回考勤详情', 'ps', '2019-05-29 13:44:13', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (322, '20190529134514_15', '作战图区域整改率统计', 109, '/map/rectification', 2, 1, 1, '作战图区域整改率统计数据展示', 'ps', '2019-05-29 13:45:14', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (323, '20190529134540_98', '获取电量仪安装记录', 81, '/electricityInstall/getById', 2, 1, 1, NULL, 'ps', '2019-05-29 13:45:40', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (324, '20190529134604_29', '获取电量仪历史安装记录', 81, '/electricityInstall/listByElectricityInstallLog', 2, 1, 1, NULL, 'ps', '2019-05-29 13:46:04', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (325, '20190529134624_19', '将电量仪与水泵绑定', 81, '/electricityInstall/bind', 2, 1, 1, NULL, 'ps', '2019-05-29 13:46:24', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (326, '20190529134643_71', '修改电量仪与水泵的绑定信息', 81, '/electricityInstall/modifyBind', 2, 1, 1, NULL, 'ps', '2019-05-29 13:46:43', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (327, '20190529134705_56', '将电量仪与水泵解绑', 81, '/electricityInstall/unBindById', 2, 1, 1, NULL, 'ps', '2019-05-29 13:47:05', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (328, '20190529134723_87', '批量将电量仪与水泵解绑', 81, '/electricityInstall/unBindByIds', 2, 1, 1, NULL, 'ps', '2019-05-29 13:47:23', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (329, '20190529175701_59', '水利设施和大项的关系列表', 89, '/conservancy/findContentByCondition', 2, 1, 1, '水利设施和大项的关系列表', 'ps', '2019-05-29 17:57:01', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (331, '20190531102608_43', '21213', 41, '213', 2, 1, 1, NULL, 'ps', '2019-05-31 10:26:08', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (332, '20190531140929_19', '更新角色功能树', 100, '/rabc/role/update', 2, 1, 1, '厉辉的接口rabc，非rbac', 'ps', '2019-05-31 14:09:29', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (333, '20190531143955_11', '查询历史报警', 69, '/alarmlog/list', 2, 1, 1, NULL, 'ps', '2019-05-31 14:39:55', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (334, '20190531144233_88', '历史报警维护日志', 69, '/alarmlog/chakan', 2, 1, 1, NULL, 'ps', '2019-05-31 14:42:33', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (335, '20190531144251_81', '历史报警导出', 69, '/alarmlog/export', 2, 1, 1, NULL, 'ps', '2019-05-31 14:42:51', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (336, '20190531150743_72', '用户查询', 99, '/user/list', 2, 1, 1, '用户查询', 'ps', '2019-05-31 15:07:43', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (337, '20190531150849_49', '资源查询', 100, '/group/resources/list', 2, 1, 1, '资源查询', 'ps', '2019-05-31 15:08:49', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (338, '20190531150954_53', '查询组信息', 100, '/group/list', 2, 1, 1, '查询组信息', 'ps', '2019-05-31 15:09:54', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (339, '20190531155206_20', '查询监测点水位', 72, '/waterLevelLog/monitoringpoint', 2, 1, 1, NULL, 'ps', '2019-05-31 15:52:06', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (340, '20190531155238_96', '导出监测点水位', 72, '/waterLevelLog/exportMP', 2, 1, 1, NULL, 'ps', '2019-05-31 15:52:38', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (341, '20190531155618_38', '获取监测点列表', 72, '/waterLevelLog/mplist', 2, 1, 1, '', 'ps', '2019-05-31 15:56:18', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (342, '20190531160015_11', '查询历史水位', 70, '/waterLevelLog/instrument', 2, 1, 1, NULL, 'ps', '2019-05-31 16:00:15', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (343, '20190531160043_52', '导出历史水位', 70, '/waterLevelLog/exportInstrument', 2, 1, 1, NULL, 'ps', '2019-05-31 16:00:43', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (344, '20190531160139_67', '水闸对比图', 71, '/waterLevelLog/waterlevelgatepump', 2, 1, 1, NULL, 'ps', '2019-05-31 16:01:39', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (345, '20190531160231_60', '导出历史水位工况', 71, '/waterLevelLog/exportInstrument', 2, 1, 1, NULL, 'ps', '2019-05-31 16:02:31', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (346, '20190531160556_93', '查询水闸综合监控', 54, '/waterLevelLog/waterlevelgatepump', 2, 1, 1, NULL, 'ps', '2019-05-31 16:05:56', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (347, '20190531160858_80', '增加防汛仓库信息', 93, '/goodsrepertory/add', 2, 1, 1, NULL, 'ps', '2019-05-31 16:08:58', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (348, '20190531161323_33', '删除防汛仓库信息', 93, '/goodsrepertory/delete', 2, 1, 1, NULL, 'ps', '2019-05-31 16:13:23', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (349, '20190531161358_25', '修改防汛仓库信息', 93, '/goodsrepertory/update', 2, 1, 1, NULL, 'ps', '2019-05-31 16:13:58', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (350, '20190531161426_15', '查询防汛仓库信息', 93, '/goodsrepertory/get', 2, 1, 1, NULL, 'ps', '2019-05-31 16:14:26', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (351, '20190531161500_79', '导出防汛仓库信息', 93, '/goodsrepertory/export', 2, 1, 1, NULL, 'ps', '2019-05-31 16:15:00', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (352, '20190531161534_55', '防汛仓库列表', 93, '/goodsrepertory/list', 2, 1, 1, NULL, 'ps', '2019-05-31 16:15:34', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (353, '20190531162201_97', '区域树查询', 53, '/monitoring/regionTree', 2, 1, 1, '区域树查询', 'ps', '2019-05-31 16:22:01', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (354, '20190531162920_51', '查询关注信息', 54, '/monitoring/favourite', 2, 1, 1, '查询关注信息', 'ps', '2019-05-31 16:29:20', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (355, '20190531162957_42', '增加防汛物资信息', 94, '/goods/add', 2, 1, 1, NULL, 'ps', '2019-05-31 16:29:57', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (356, '20190531163912_90', '删除防汛物资信息', 94, '/goods/delete', 2, 1, 1, NULL, 'ps', '2019-05-31 16:39:12', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (357, '20190531164055_51', '修改防汛物资信息', 94, '/goods/update', 2, 1, 1, NULL, 'ps', '2019-05-31 16:40:55', '127.0.0.1');
INSERT INTO `sys_acl` VALUES (358, '20190531164359_63', '查询防汛位置信息', 94, '/goods/get', 2, 1, 1, NULL, 'ps', '2019-05-31 16:43:59', '127.0.0.1');

-- ----------------------------
-- Table structure for sys_acl1
-- ----------------------------
DROP TABLE IF EXISTS `sys_acl1`;
CREATE TABLE `sys_acl1`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限码',
  `acl_module_id` int(11) NULL DEFAULT NULL COMMENT '权限所在的权限模块id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_acl_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_acl_module`;
CREATE TABLE `sys_acl_module`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限模块id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限模块名称',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级权限模块id',
  `level` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限模块层级',
  `seq` int(11) NOT NULL DEFAULT 0 COMMENT '权限模块在当前层级下的顺序，由小到大',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态，1：正常，0：冻结',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作者操作的时间',
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1' COMMENT '最后一次更新操作者的ip地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_acl_module
-- ----------------------------
INSERT INTO `sys_acl_module` VALUES (41, '权限模块', 0, '0', 1, 1, '权限模块，顶级', 'ps', '2019-05-23 16:47:23', '127.0.0.1');
INSERT INTO `sys_acl_module` VALUES (45, '运行监控', 105, '0.41.105', 1, 1, '运行监控模块', 'ps', '2019-05-27 09:25:21', '');
INSERT INTO `sys_acl_module` VALUES (46, '数据台账', 105, '0.41.105', 1, 1, '数据台账模块', 'ps', '2019-05-27 09:25:26', '');
INSERT INTO `sys_acl_module` VALUES (47, '查询统计', 105, '0.41.105', 1, 1, '查询统计模块', 'ps', '2019-05-27 09:25:35', '');
INSERT INTO `sys_acl_module` VALUES (48, '基础资料管理', 105, '0.41.105', 1, 1, '基础资料管理模块', 'ps', '2019-05-27 09:25:44', '');
INSERT INTO `sys_acl_module` VALUES (49, '巡查管理', 105, '0.41.105', 1, 1, '巡查管理模块', 'ps', '2019-05-27 09:25:49', '');
INSERT INTO `sys_acl_module` VALUES (50, '防汛管理', 105, '0.41.105', 1, 1, '防汛管理模块', 'ps', '2019-05-27 09:25:55', '');
INSERT INTO `sys_acl_module` VALUES (51, '系统管理', 105, '0.41.105', 1, 1, '系统管理模块', 'ps', '2019-05-27 09:25:59', '');
INSERT INTO `sys_acl_module` VALUES (52, '实时视频', 45, '0.41.105.45', 1, 1, '实时视频模块', 'ps', '2019-05-27 09:26:55', '');
INSERT INTO `sys_acl_module` VALUES (53, '水闸监控', 45, '0.41.105.45', 1, 1, '水闸监控模块', 'ps', '2019-05-27 09:26:59', '');
INSERT INTO `sys_acl_module` VALUES (54, '水闸综合监控', 45, '0.41.105.45', 1, 1, '水闸综合监控模块', 'ps', '2019-05-27 09:27:05', '');
INSERT INTO `sys_acl_module` VALUES (55, '报警信息', 45, '0.41.105.45', 1, 1, '报警信息模块', 'ps', '2019-05-27 09:27:49', '');
INSERT INTO `sys_acl_module` VALUES (56, '水利整改', 46, '0.41.105.46', 1, 1, '水利整改模块', 'ps', '2019-05-27 09:28:10', '');
INSERT INTO `sys_acl_module` VALUES (57, '日常巡查记录表', 46, '0.41.105.46', 1, 1, '日常巡查记录表模块', 'ps', '2019-05-27 09:28:22', '');
INSERT INTO `sys_acl_module` VALUES (58, '水利整改记录表', 46, '0.41.105.46', 1, 1, '水利整改记录表模块', 'ps', '2019-05-27 09:28:26', '');
INSERT INTO `sys_acl_module` VALUES (59, '水利整改汇总表', 46, '0.41.105.46', 1, 1, '水利整改汇总表模块', 'ps', '2019-05-27 09:28:30', '');
INSERT INTO `sys_acl_module` VALUES (60, '绿化养护月报表', 46, '0.41.105.46', 1, 1, '绿化养护月报表模块', 'ps', '2019-05-27 09:28:33', '');
INSERT INTO `sys_acl_module` VALUES (61, '绿化养护记录表', 46, '0.41.105.46', 1, 1, '绿化养护记录表模块', 'ps', '2019-05-27 09:28:36', '');
INSERT INTO `sys_acl_module` VALUES (62, '柴油发电机组运行记录', 46, '0.41.105.46', 1, 1, '柴油发电机组运行记录模块', 'ps', '2019-05-27 09:28:38', '');
INSERT INTO `sys_acl_module` VALUES (63, '(泵)闸启闭运行记录', 46, '0.41.105.46', 1, 1, '(泵)闸启闭运行记录模块', 'ps', '2019-05-27 09:28:40', '');
INSERT INTO `sys_acl_module` VALUES (64, '调水记录汇总', 46, '0.41.105.46', 1, 1, '调水记录汇总模块', 'ps', '2019-05-27 09:28:43', '');
INSERT INTO `sys_acl_module` VALUES (65, '调水图片汇总', 46, '0.41.105.46', 1, 1, '调水图片汇总模块', 'ps', '2019-05-27 09:28:46', '');
INSERT INTO `sys_acl_module` VALUES (66, '水闸管理交接班', 46, '0.41.105.46', 1, 1, '水闸管理交接班模块', 'ps', '2019-05-27 09:28:50', '');
INSERT INTO `sys_acl_module` VALUES (67, '船舶过闸情况明细表', 46, '0.41.105.46', 1, 1, '船舶过闸情况明细表', 'ps', '2019-05-27 09:28:52', '');
INSERT INTO `sys_acl_module` VALUES (68, '卫生执勤记录表', 46, '0.41.105.46', 1, 1, '卫生执勤记录表', 'ps', '2019-05-27 09:28:55', '');
INSERT INTO `sys_acl_module` VALUES (69, '报警查询', 47, '0.41.105.47', 1, 1, '报警查询', 'ps', '2019-05-27 09:29:00', '');
INSERT INTO `sys_acl_module` VALUES (70, '水位查询', 47, '0.41.105.47', 1, 1, '水位查询', 'ps', '2019-05-27 09:29:02', '');
INSERT INTO `sys_acl_module` VALUES (71, '水闸对比', 47, '0.41.105.47', 1, 1, '水闸对比', 'ps', '2019-05-27 09:29:04', '');
INSERT INTO `sys_acl_module` VALUES (72, '监测点查询', 47, '0.41.105.47', 1, 1, '监测点查询', 'ps', '2019-05-27 09:29:06', '');
INSERT INTO `sys_acl_module` VALUES (73, '工况查询', 47, '0.41.105.47', 1, 1, '工况查询', 'ps', '2019-05-27 09:29:08', '');
INSERT INTO `sys_acl_module` VALUES (74, '整改查询', 47, '0.41.105.47', 1, 1, '整改查询', 'ps', '2019-05-27 09:29:14', '');
INSERT INTO `sys_acl_module` VALUES (75, '考勤查询', 47, '0.41.105.47', 1, 1, '考勤查询', 'ps', '2019-05-27 09:29:16', '');
INSERT INTO `sys_acl_module` VALUES (76, '排班查询', 47, '0.41.105.47', 1, 1, '排班查询', 'ps', '2019-05-27 09:29:18', '');
INSERT INTO `sys_acl_module` VALUES (77, '水闸管理', 48, '0.41.105.48', 1, 1, '水闸管理', 'ps', '2019-05-27 09:29:20', '');
INSERT INTO `sys_acl_module` VALUES (78, '视频管理', 48, '0.41.105.48', 1, 1, '视频管理', 'ps', '2019-05-27 09:29:22', '');
INSERT INTO `sys_acl_module` VALUES (79, '水位仪管理', 48, '0.41.105.48', 1, 1, '水位仪管理', 'ps', '2019-05-27 09:29:23', '');
INSERT INTO `sys_acl_module` VALUES (80, '闸位仪管理', 48, '0.41.105.48', 1, 1, '闸位仪管理', 'ps', '2019-05-27 09:29:25', '');
INSERT INTO `sys_acl_module` VALUES (81, '电量仪管理', 48, '0.41.105.48', 1, 1, '电量仪管理', 'ps', '2019-05-27 09:29:27', '');
INSERT INTO `sys_acl_module` VALUES (82, '水泵管理', 48, '0.41.105.48', 1, 1, '水泵管理', 'ps', '2019-05-27 09:29:28', '');
INSERT INTO `sys_acl_module` VALUES (83, '闸门管理', 48, '0.41.105.48', 1, 1, '闸门管理', 'ps', '2019-05-27 09:29:31', '');
INSERT INTO `sys_acl_module` VALUES (84, '网络设备管理', 48, '0.41.105.48', 1, 1, '网络设备管理', 'ps', '2019-05-27 09:29:33', '');
INSERT INTO `sys_acl_module` VALUES (85, '河流管理', 48, '0.41.105.48', 1, 1, '河流管理', 'ps', '2019-05-27 09:29:35', '');
INSERT INTO `sys_acl_module` VALUES (86, '圩区管理', 48, '0.41.105.48', 1, 1, '圩区管理', 'ps', '2019-05-27 09:29:38', '');
INSERT INTO `sys_acl_module` VALUES (87, '行政区管理', 48, '0.41.105.48', 1, 1, '行政区管理', 'ps', '2019-05-27 09:29:40', '');
INSERT INTO `sys_acl_module` VALUES (88, '巡查人员管理设置', 49, '0.41.105.49', 1, 1, '巡查人员管理设置', 'ps', '2019-05-27 09:29:42', '');
INSERT INTO `sys_acl_module` VALUES (89, '巡查目标管理设置', 49, '0.41.105.49', 1, 1, '巡查目标管理设置', 'ps', '2019-05-27 09:29:43', '');
INSERT INTO `sys_acl_module` VALUES (90, '人员排班管理设置', 49, '0.41.105.49', 1, 1, '人员排班管理设置', 'ps', '2019-05-27 09:29:45', '');
INSERT INTO `sys_acl_module` VALUES (91, '巡查工作', 49, '0.41.105.49', 1, 1, '巡查工作', 'ps', '2019-05-27 09:29:48', '');
INSERT INTO `sys_acl_module` VALUES (92, '考勤异常', 49, '0.41.105.49', 1, 1, '考勤异常', 'ps', '2019-05-27 09:29:50', '');
INSERT INTO `sys_acl_module` VALUES (93, '防汛仓库信息', 50, '0.41.105.50', 1, 1, '防汛仓库信息', 'ps', '2019-05-27 09:29:52', '');
INSERT INTO `sys_acl_module` VALUES (94, '防汛物资信息', 50, '0.41.105.50', 1, 1, '防汛物资信息', 'ps', '2019-05-27 09:29:54', '');
INSERT INTO `sys_acl_module` VALUES (95, '防汛物资状态', 50, '0.41.105.50', 1, 1, '防汛物资状态', 'ps', '2019-05-27 09:29:57', '');
INSERT INTO `sys_acl_module` VALUES (96, '防汛出入库信息', 50, '0.41.105.50', 1, 1, '防汛出入库信息', 'ps', '2019-05-27 09:29:59', '');
INSERT INTO `sys_acl_module` VALUES (97, '物资养护信息', 50, '0.41.105.50', 1, 1, '物资养护信息', 'ps', '2019-05-27 09:30:00', '');
INSERT INTO `sys_acl_module` VALUES (98, '物资巡检信息', 50, '0.41.105.50', 1, 1, '物资巡检信息', 'ps', '2019-05-27 09:30:02', '');
INSERT INTO `sys_acl_module` VALUES (99, '用户管理', 51, '0.41.105.51', 1, 1, '物资巡检信息', 'ps', '2019-05-27 09:30:04', '');
INSERT INTO `sys_acl_module` VALUES (100, '权限组管理', 51, '0.41.105.51', 1, 1, '权限组管理', 'ps', '2019-05-27 09:30:06', '');
INSERT INTO `sys_acl_module` VALUES (101, '人员管理', 51, '0.41.105.51', 1, 1, '人员管理', 'ps', '2019-05-27 09:30:08', '');
INSERT INTO `sys_acl_module` VALUES (102, '单位管理', 51, '0.41.105.51', 1, 1, '单位管理', 'ps', '2019-05-27 09:30:11', '');
INSERT INTO `sys_acl_module` VALUES (103, '报警规则', 51, '0.41.105.51', 1, 1, '报警规则', 'ps', '2019-05-27 09:30:13', '');
INSERT INTO `sys_acl_module` VALUES (105, '水闸长效管理系统', 41, '0.41', 1, 1, '水闸长效管理系统', 'ps', '2019-05-27 09:24:45', '127.0.0.1');
INSERT INTO `sys_acl_module` VALUES (106, '水闸长效管理APP系统', 41, '0.41', 1, 1, '水闸长效管理APP系统', 'ps', '2019-05-27 09:32:02', '127.0.0.1');
INSERT INTO `sys_acl_module` VALUES (107, '河道长效管理系统', 41, '0.41', 1, 1, '河道长效管理系统', 'ps', '2019-05-27 09:33:02', '127.0.0.1');
INSERT INTO `sys_acl_module` VALUES (108, '河道长效管理APP系统', 41, '0.41', 1, 1, '河道长效管理APP系统', 'ps', '2019-05-27 09:33:12', '127.0.0.1');
INSERT INTO `sys_acl_module` VALUES (109, '作战图', 105, '0.41.105', 1, 1, '作战图', 'ps', '2019-05-28 15:38:17', '127.0.0.1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '权限更新的类型，1：部门，2：用户，3：权限模块，4：权限，5：角色，6：角色用户关系，7：角色权限关系',
  `target_id` int(11) NOT NULL COMMENT '基于type后指定的对象id，比如用户、权限、角色等表的主键',
  `old_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '旧值',
  `new_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新值',
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新的时间',
  `operate_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后一次更新者的ip地址',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '当前是否复原过，0：没有，1：复原过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 549 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (25, 4, 0, '', 'AclInfo(id=0, code=20190115184802_24, name=查询角色, aclModuleId=2, url=sys/role/find, type=2, status=1, seq=4, remark=hha, operator=陈义星, operate_time=2019-01-15 18:48:02.008, operate_ip=127.0.0.1)', '陈义星', '2019-01-15 18:48:02', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (26, 5, 0, '', 'RoleInfo(id=0, name=普通用户2, type=2, status=1, remark=普通用户权限2, operator=陈义星, operate_time=2019-04-12 12:52:28.006, operate_ip=127.0.0.1)', '陈义星', '2019-04-12 12:52:28', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (27, 3, 0, '', 'AclModuleInfo(id=0, name=用户管理1, parentId=1, level=0.1, seq=2, status=1, remark=用户管理模块1, operator=陈义星, operateTime=2019-04-12 12:54:52.133, operateIp=127.0.0.1)', '陈义星', '2019-04-12 12:54:52', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (28, 4, 0, '', 'AclInfo(id=0, code=20190507100235_94, name=测试角色1, aclModuleId=2, url=sys/role/test1, type=2, status=1, seq=5, remark=hha, operator=登录用户1, operate_time=2019-05-07 10:02:35.592, operate_ip=127.0.0.1)', '陈义星', '2019-05-07 10:02:35', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (29, 3, 0, '', 'AclModuleInfo(id=0, name=用户管理1, parentId=3, level=0.1.3, seq=1, status=1, remark=用户管理模块1, operator=登录用户1, operateTime=2019-05-07 10:25:13.313, operateIp=127.0.0.1)', '陈义星', '2019-05-07 10:25:13', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (30, 5, 0, '', 'RoleInfo(id=0, name=监理员1, type=3, status=1, remark=监理员1, operator=登录用户1, operate_time=2019-05-07 10:58:23.245, operate_ip=127.0.0.1)', '陈义星', '2019-05-07 10:58:23', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (31, 4, 0, '', 'AclInfo(id=0, code=20190516105031_26, name=测试角色1, aclModuleId=2, url=sys/role/test1, type=2, status=1, seq=5, remark=hha, operator=登录用户1, operate_time=2019-05-16 10:50:31.764, operate_ip=127.0.0.1)', '陈义星', '2019-05-16 10:50:31', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (32, 3, 0, '', 'AclModuleInfo(id=0, name=chenyixing, parentId=1, level=0.1, seq=1, status=1, remark=备注, operator=测试功能模块, operateTime=2019-05-17 11:25:49.057, operateIp=127.0.0.1)', '陈义星', '2019-05-17 11:25:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (33, 3, 0, '', 'AclModuleInfo(id=0, name=测试功能模块, parentId=1, level=0.1, seq=1, status=1, remark=备注, operator=chenyixing, operateTime=2019-05-17 11:28:37.804, operateIp=127.0.0.1)', '陈义星', '2019-05-17 11:28:37', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (34, 3, 0, '', 'AclModuleInfo(id=0, name=测试功能模块, parentId=1, level=0.1, seq=1, status=1, remark=, operator=chenyixing, operateTime=2019-05-17 13:10:12.297, operateIp=127.0.0.1)', '陈义星', '2019-05-17 13:10:12', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (35, 3, 0, '', 'AclModuleInfo(id=0, name=测试功能模块, parentId=1, level=0.1, seq=1, status=1, remark=, operator=chenyixing, operateTime=2019-05-17 13:19:37.488, operateIp=127.0.0.1)', '陈义星', '2019-05-17 13:19:37', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (36, 3, 0, '', 'AclModuleInfo(id=0, name=测试功能模块, parentId=1, level=0.1, seq=1, status=1, remark=, operator=chenyixing, operateTime=2019-05-17 13:30:11.496, operateIp=127.0.0.1)', '陈义星', '2019-05-17 13:30:11', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (37, 3, 0, '', 'AclModuleInfo(id=0, name=测试功能模块1111, parentId=1, level=0.1, seq=1, status=1, remark=, operator=ps, operateTime=2019-05-17 13:31:02.251, operateIp=127.0.0.1)', '陈义星', '2019-05-17 13:31:02', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (38, 3, 0, '', 'AclModuleInfo(id=0, name=测试功能模块1111, parentId=1, level=0.1, seq=1, status=1, remark=, operator=ps, operateTime=2019-05-17 13:48:04.236, operateIp=127.0.0.1)', '陈义星', '2019-05-17 13:48:04', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (39, 3, 0, '', 'AclModuleInfo(id=0, name=测试功能模块, parentId=1, level=0.1, seq=1, status=1, remark=, operator=chenyixing, operateTime=2019-05-17 13:55:12.788, operateIp=127.0.0.1)', '陈义星', '2019-05-17 13:55:12', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (40, 3, 0, '', 'AclModuleInfo(id=0, name=测试功能模块, parentId=1, level=0.1, seq=1, status=1, remark=, operator=chenyixing, operateTime=2019-05-17 13:59:01.341, operateIp=127.0.0.1)', '陈义星', '2019-05-17 13:59:01', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (41, 3, 0, '', 'AclModuleInfo(id=0, name=aaaaa, parentId=1, level=0.1, seq=1, status=1, remark=a, operator=aaaaaaaaaaa, operateTime=2019-05-17 14:18:14.076, operateIp=127.0.0.1)', '陈义星', '2019-05-17 14:18:14', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (42, 3, 0, '', 'AclModuleInfo(id=0, name=测试功能模块1111???, parentId=1, level=0.1, seq=1, status=1, remark=, operator=ps, operateTime=2019-05-20 09:33:18.66, operateIp=127.0.0.1)', '陈义星', '2019-05-20 09:33:18', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (43, 3, 0, '', 'AclModuleInfo(id=0, name=test22, parentId=1, level=0.1, seq=1, status=1, remark=test22, operator=ps, operateTime=2019-05-20 09:35:54.09, operateIp=127.0.0.1)', '陈义星', '2019-05-20 09:35:54', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (44, 3, 0, '', 'AclModuleInfo(id=0, name=wwwwwwwww, parentId=1, level=0.1, seq=1, status=1, remark=wwwwwwwww, operator=ps, operateTime=2019-05-20 09:45:11.989, operateIp=127.0.0.1)', '陈义星', '2019-05-20 09:45:12', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (45, 3, 0, '', 'AclModuleInfo(id=0, name=李涛10, parentId=1, level=0.1, seq=1, status=1, remark=李涛10, operator=ps, operateTime=2019-05-20 09:48:41.511, operateIp=127.0.0.1)', '陈义星', '2019-05-20 09:48:41', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (46, 4, 0, '', 'AclInfo(id=0, code=20190520145521_4, name=test, aclModuleId=-1, url=, type=2, status=1, seq=1, remark=, operator=, operate_time=2019-05-20 14:55:21.923, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 14:55:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (47, 4, 0, '', 'AclInfo(id=0, code=20190520145858_46, name=test, aclModuleId=-1, url=, type=2, status=0, seq=1, remark=test, operator=, operate_time=2019-05-20 14:58:58.089, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 14:58:58', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (48, 4, 0, '', 'AclInfo(id=0, code=20190520150216_87, name=test, aclModuleId=-1, url=, type=2, status=0, seq=1, remark=test, operator=, operate_time=2019-05-20 15:02:16.774, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 15:02:16', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (49, 4, 0, '', 'AclInfo(id=0, code=20190520150421_43, name=test, aclModuleId=-1, url=, type=2, status=0, seq=1, remark=test, operator=, operate_time=2019-05-20 15:04:21.35, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 15:04:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (50, 4, 0, '', 'AclInfo(id=0, code=20190520150430_33, name=test1, aclModuleId=-1, url=, type=2, status=1, seq=1, remark=test1, operator=, operate_time=2019-05-20 15:04:30.693, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 15:04:30', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (51, 4, 0, '', 'AclInfo(id=0, code=20190520151836_96, name=test, aclModuleId=-1, url=, type=2, status=0, seq=1, remark=test, operator=, operate_time=2019-05-20 15:18:36.179, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 15:18:36', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (52, 4, 0, '', 'AclInfo(id=0, code=20190520151843_48, name=test1, aclModuleId=-1, url=, type=2, status=0, seq=1, remark=test1, operator=, operate_time=2019-05-20 15:18:43.724, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 15:18:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (53, 4, 0, '', 'AclInfo(id=0, code=20190520152918_50, name=test1, aclModuleId=-1, url=, type=2, status=0, seq=1, remark=test1, operator=, operate_time=2019-05-20 15:29:18.582, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 15:29:18', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (54, 4, 0, '', 'AclInfo(id=0, code=20190520153124_99, name=test1, aclModuleId=-1, url=, type=2, status=0, seq=1, remark=test1, operator=, operate_time=2019-05-20 15:31:24.807, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 15:31:24', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (55, 4, 0, '', 'AclInfo(id=0, code=20190520153159_88, name=test1, aclModuleId=-1, url=, type=2, status=0, seq=1, remark=test1, operator=, operate_time=2019-05-20 15:31:59.831, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 15:31:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (56, 4, 0, '', 'AclInfo(id=0, code=20190520153214_53, name=test2, aclModuleId=-1, url=, type=2, status=0, seq=1, remark=test2, operator=, operate_time=2019-05-20 15:32:14.435, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 15:32:14', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (57, 4, 0, '', 'AclInfo(id=0, code=20190520153234_90, name=test2, aclModuleId=-1, url=, type=2, status=0, seq=1, remark=test2, operator=, operate_time=2019-05-20 15:32:34.941, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 15:32:34', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (58, 4, 0, '', 'AclInfo(id=0, code=20190520194559_33, name=test3, aclModuleId=-1, url=, type=2, status=0, seq=1, remark=test3, operator=, operate_time=2019-05-20 19:45:59.914, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 19:45:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (59, 4, 0, '', 'AclInfo(id=0, code=20190520195244_84, name=test3, aclModuleId=-1, url=, type=2, status=0, seq=1, remark=test3, operator=, operate_time=2019-05-20 19:52:44.579, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 19:52:44', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (60, 4, 0, '', 'AclInfo(id=0, code=20190520195742_35, name=test2, aclModuleId=-1, url=, type=2, status=0, seq=1, remark=test2, operator=, operate_time=2019-05-20 19:57:42.01, operate_ip=127.0.0.1)', '陈义星', '2019-05-20 19:57:42', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (61, 4, 0, '', 'AclInfo(id=0, code=20190521105542_52, name=test, aclModuleId=21, url=, type=2, status=0, seq=1, remark=test, operator=, operate_time=2019-05-21 10:55:42.382, operate_ip=127.0.0.1)', '陈义星', '2019-05-21 10:55:42', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (62, 4, 0, '', 'AclInfo(id=0, code=20190521113211_35, name=test, aclModuleId=21, url=, type=2, status=0, seq=1, remark=test, operator=, operate_time=2019-05-21 11:32:11.867, operate_ip=127.0.0.1)', '陈义星', '2019-05-21 11:32:11', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (63, 3, 0, '', 'AclModuleInfo(id=0, name=测试功能模块, parentId=1, level=0.1, seq=1, status=1, remark=, operator=chenyixing, operateTime=2019-05-21 13:01:43.532, operateIp=127.0.0.1)', '陈义星', '2019-05-21 13:01:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (64, 3, 0, '', 'AclModuleInfo(id=0, name=测试功能模块, parentId=1, level=0.1, seq=1, status=1, remark=, operator=chenyixing, operateTime=2019-05-21 13:02:49.749, operateIp=127.0.0.1)', '陈义星', '2019-05-21 13:02:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (65, 4, 0, '', 'AclInfo{id=0, code=\'20190521133534_9\', name=\'test\', aclModuleId=-1, url=\'\', type=2, status=1, seq=1, remark=\'\', operator=\'\', operate_time=2019-05-21 13:35:34.567, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-21 13:35:34', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (66, 3, 0, '', 'AclModuleInfo{id=0, name=\'测试功能模块\', parentId=1, level=\'0.1\', seq=1, status=1, remark=\'\', operator=\'chenyixing\', operateTime=2019-05-21 13:42:33.409, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-21 13:42:33', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (67, 3, 0, '', 'AclModuleInfo{id=0, name=\'测试功能模块\', parentId=1, level=\'0.1\', seq=1, status=1, remark=\'\', operator=\'chenyixing\', operateTime=2019-05-21 14:21:29.22, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-21 14:21:29', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (68, 4, 0, '', 'AclInfo{id=0, code=\'20190521142131_66\', name=\'test\', aclModuleId=-1, url=\'\', type=2, status=1, seq=1, remark=\'\', operator=\'\', operate_time=2019-05-21 14:21:31.998, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-21 14:21:32', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (69, 3, 0, '', 'AclModuleInfo{id=0, name=\'test333\', parentId=2, level=\'0.1.15.2\', seq=1, status=1, remark=\'test333\', operator=\'ps\', operateTime=2019-05-21 15:03:19.355, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-21 15:03:19', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (70, 4, 0, '', 'AclInfo{id=0, code=\'20190521152628_12\', name=\'test\', aclModuleId=21, url=\'\', type=2, status=0, seq=1, remark=\'test\', operator=\'\', operate_time=2019-05-21 15:26:28.955, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-21 15:26:28', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (71, 4, 0, '', 'AclInfo{id=0, code=\'20190521184733_36\', name=\'test\', aclModuleId=21, url=\'\', type=2, status=0, seq=1, remark=\'test\', operator=\'\', operate_time=2019-05-21 18:47:33.942, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-21 18:47:33', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (72, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=1, level=\'0.1\', seq=1, status=1, remark=\'test\', operator=\'ps\', operateTime=2019-05-21 19:47:59.884, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-21 19:48:00', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (73, 3, 0, '', 'AclModuleInfo{id=0, name=\'你大哥\', parentId=2, level=\'0.1.15.2\', seq=1, status=1, remark=\'你大哥\', operator=\'ps\', operateTime=2019-05-21 19:48:46.387, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-21 19:48:46', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (74, 4, 0, '', 'AclInfo{id=0, code=\'20190522085045_93\', name=\'test\', aclModuleId=1, url=\'\', type=2, status=0, seq=1, remark=\'test\', operator=\'\', operate_time=2019-05-22 08:50:45.157, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 08:50:45', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (75, 4, 0, '', 'AclInfo{id=0, code=\'20190522093131_16\', name=\'test\', aclModuleId=1, url=\'\', type=2, status=0, seq=1, remark=\'test\', operator=\'\', operate_time=2019-05-22 09:31:31.975, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 09:31:32', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (76, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=1, level=\'0.1\', seq=1, status=1, remark=\'test\', operator=\'null\', operateTime=2019-05-22 13:10:27.243, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 13:10:27', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (77, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=1, level=\'0.1\', seq=1, status=1, remark=\'test\', operator=\'null\', operateTime=2019-05-22 13:10:50.646, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 13:10:50', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (78, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=1, level=\'0.1\', seq=1, status=1, remark=\'test\', operator=\'xc\', operateTime=2019-05-22 13:12:58.578, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 13:12:58', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (79, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=2, level=\'0.1.15.2\', seq=1, status=1, remark=\'test\', operator=\'xc\', operateTime=2019-05-22 13:15:35.951, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 13:15:36', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (80, 4, 0, '', 'AclInfo{id=0, code=\'20190522131553_82\', name=\'test1\', aclModuleId=34, url=\'\', type=2, status=0, seq=1, remark=\'test1\', operator=\'\', operate_time=2019-05-22 13:15:53.94, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 13:15:53', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (81, 4, 0, '', 'AclInfo{id=0, code=\'20190522131854_50\', name=\'test1\', aclModuleId=34, url=\'\', type=2, status=0, seq=1, remark=\'test1\', operator=\'\', operate_time=2019-05-22 13:18:54.465, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 13:18:54', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (82, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=2, level=\'0.1.15.2\', seq=1, status=1, remark=\'test\', operator=\'xc\', operateTime=2019-05-22 13:28:50.727, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 13:28:50', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (83, 4, 0, '', 'AclInfo{id=0, code=\'20190522133114_19\', name=\'test1\', aclModuleId=35, url=\'\', type=2, status=0, seq=1, remark=\'test1\', operator=\'\', operate_time=2019-05-22 13:31:14.875, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 13:31:14', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (84, 4, 0, '', 'AclInfo{id=0, code=\'20190522134045_17\', name=\'test1\', aclModuleId=35, url=\'\', type=2, status=0, seq=1, remark=\'test1\', operator=\'\', operate_time=2019-05-22 13:40:45.692, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 13:40:45', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (85, 5, 0, '', 'RoleInfo{id=0, name=\'role1\', type=1, status=1, remark=\'remark1\', operator=\'chenyixing\', operate_time=2019-05-22 14:07:02.626, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 14:07:02', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (86, 5, 0, '', 'RoleInfo{id=0, name=\'role1\', type=1, status=1, remark=\'remark1\', operator=\'chenyixing\', operate_time=2019-05-22 14:07:17.275, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 14:07:17', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (87, 5, 0, '', 'RoleInfo{id=0, name=\'role1\', type=1, status=1, remark=\'remark1\', operator=\'chenyixing\', operate_time=2019-05-22 14:07:28.107, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 14:07:28', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (88, 5, 0, '', 'RoleInfo{id=0, name=\'李红涛\', type=1, status=1, remark=\'权限管理新增\', operator=\'ps\', operate_time=2019-05-22 14:13:13.226, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 14:13:13', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (89, 5, 0, '', 'RoleInfo{id=0, name=\'李红涛\', type=1, status=0, remark=\'权限管理新增\', operator=\'ps\', operate_time=2019-05-22 14:46:13.918, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 14:46:14', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (90, 5, 0, '', 'RoleInfo{id=0, name=\'李红涛\', type=2, status=1, remark=\'权限管理新增\', operator=\'ps\', operate_time=2019-05-22 15:14:20.615, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 15:14:20', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (91, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=1, level=\'0.1\', seq=1, status=1, remark=\'test\', operator=\'ps\', operateTime=2019-05-22 15:20:34.44, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 15:20:34', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (92, 4, 0, '', 'AclInfo{id=0, code=\'20190522152629_67\', name=\'test1\', aclModuleId=36, url=\'\', type=2, status=1, seq=1, remark=\'test1\', operator=\'\', operate_time=2019-05-22 15:26:29.738, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 15:26:29', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (93, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=1, level=\'0.1\', seq=1, status=1, remark=\'test\', operator=\'ps\', operateTime=2019-05-22 15:27:58.526, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 15:27:58', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (94, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=1, level=\'0.1\', seq=1, status=1, remark=\'test\', operator=\'ps\', operateTime=2019-05-22 15:28:40.199, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 15:28:40', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (95, 4, 0, '', 'AclInfo{id=0, code=\'20190522152856_51\', name=\'test1\', aclModuleId=38, url=\'\', type=2, status=1, seq=1, remark=\'test1\', operator=\'\', operate_time=2019-05-22 15:28:56.327, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 15:28:56', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (96, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=1, level=\'0.1\', seq=1, status=1, remark=\'test\', operator=\'null\', operateTime=2019-05-22 15:49:59.337, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 15:49:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (97, 3, 0, '', 'AclModuleInfo{id=0, name=\'test789\', parentId=1, level=\'0.1\', seq=1, status=1, remark=\'test789\', operator=\'null\', operateTime=2019-05-22 15:51:02.319, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 15:51:02', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (98, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=1, level=\'0.1\', seq=1, status=1, remark=\'test\', operator=\'ps\', operateTime=2019-05-22 15:48:43.141, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 15:48:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (99, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=1, level=\'0.1\', seq=1, status=1, remark=\'test\', operator=\'ps\', operateTime=2019-05-22 15:51:21.223, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 15:51:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (100, 4, 0, '', 'AclInfo{id=0, code=\'20190522155144_70\', name=\'test\', aclModuleId=40, url=\'\', type=2, status=1, seq=1, remark=\'test1\', operator=\'\', operate_time=2019-05-22 15:51:44.328, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 15:51:44', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (101, 4, 0, '', 'AclInfo{id=0, code=\'20190522155304_69\', name=\'test1\', aclModuleId=40, url=\'\', type=2, status=1, seq=1, remark=\'test1\', operator=\'\', operate_time=2019-05-22 15:53:04.939, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 15:53:04', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (102, 4, 0, '', 'AclInfo{id=0, code=\'20190522163824_8\', name=\'test1\', aclModuleId=40, url=\'\', type=2, status=1, seq=1, remark=\'test1\', operator=\'\', operate_time=2019-05-22 16:38:24.392, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 16:38:24', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (103, 4, 0, '', 'AclInfo{id=0, code=\'20190522164246_43\', name=\'test1\', aclModuleId=40, url=\'test1\', type=2, status=1, seq=1, remark=\'test1\', operator=\'\', operate_time=2019-05-22 16:42:46.827, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 16:42:46', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (104, 4, 0, '', 'AclInfo{id=0, code=\'20190522170217_2\', name=\'test1\', aclModuleId=40, url=\'test1/test1\', type=2, status=0, seq=1, remark=\'test1\', operator=\'\', operate_time=2019-05-22 17:02:17.308, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 17:02:17', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (105, 4, 0, '', 'AclInfo{id=0, code=\'20190522180908_24\', name=\'test1\', aclModuleId=41, url=\'test1\', type=2, status=1, seq=1, remark=\'test1\', operator=\'\', operate_time=2019-05-22 18:09:08.436, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-22 18:09:08', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (106, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'test\', operator=\'xc\', operateTime=2019-05-22 18:09:33.966, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 18:09:34', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (107, 3, 0, '', 'AclModuleInfo{id=0, name=\'1\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'1\', operator=\'xc\', operateTime=2019-05-22 18:41:47.034, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-22 18:41:47', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (108, 4, 0, '', 'AclInfo{id=0, code=\'20190523091952_1\', name=\'test1\', aclModuleId=41, url=\'test1\', type=2, status=1, seq=1, remark=\'test1\', operator=\'\', operate_time=2019-05-23 09:19:52.506, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:19:52', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (109, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'test\', operator=\'ps\', operateTime=2019-05-23 09:20:11.686, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:20:11', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (110, 3, 0, '', 'AclModuleInfo{id=0, name=\'运行监控\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'运行监控\', operator=\'ps\', operateTime=2019-05-23 09:48:07.447, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:48:07', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (111, 3, 0, '', 'AclModuleInfo{id=0, name=\'数据台账\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'数据台账\', operator=\'ps\', operateTime=2019-05-23 09:48:25.842, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:48:25', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (112, 3, 0, '', 'AclModuleInfo{id=0, name=\'查询统计\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'查询统计\', operator=\'ps\', operateTime=2019-05-23 09:48:38.649, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:48:38', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (113, 3, 0, '', 'AclModuleInfo{id=0, name=\'基础资料管理\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'基础资料管理\', operator=\'ps\', operateTime=2019-05-23 09:49:27.327, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:49:27', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (114, 3, 0, '', 'AclModuleInfo{id=0, name=\'巡查管理\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'巡查管理\', operator=\'ps\', operateTime=2019-05-23 09:49:59.192, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:49:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (115, 3, 0, '', 'AclModuleInfo{id=0, name=\'防汛管理\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'防汛管理\', operator=\'ps\', operateTime=2019-05-23 09:50:10.806, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:50:10', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (116, 3, 0, '', 'AclModuleInfo{id=0, name=\'系统管理\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'系统管理\', operator=\'ps\', operateTime=2019-05-23 09:50:21.271, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:50:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (117, 3, 0, '', 'AclModuleInfo{id=0, name=\'实时视频\', parentId=45, level=\'0.41.45\', seq=1, status=1, remark=\'实时视频\', operator=\'ps\', operateTime=2019-05-23 09:50:50.658, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:50:50', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (118, 3, 0, '', 'AclModuleInfo{id=0, name=\'水闸监控\', parentId=45, level=\'0.41.45\', seq=1, status=1, remark=\'水闸监控\', operator=\'ps\', operateTime=2019-05-23 09:51:19.966, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:51:20', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (119, 3, 0, '', 'AclModuleInfo{id=0, name=\'水闸综合监控\', parentId=45, level=\'0.41.45\', seq=1, status=1, remark=\'水闸综合监控\', operator=\'ps\', operateTime=2019-05-23 09:53:10.208, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:53:10', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (120, 3, 0, '', 'AclModuleInfo{id=0, name=\'报警信息\', parentId=45, level=\'0.41.45\', seq=1, status=1, remark=\'报警信息模块\', operator=\'ps\', operateTime=2019-05-23 09:55:27.569, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:55:27', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (121, 3, 0, '', 'AclModuleInfo{id=0, name=\'水利整改\', parentId=46, level=\'0.41.46\', seq=1, status=1, remark=\'水利整改模块\', operator=\'ps\', operateTime=2019-05-23 09:56:01.902, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:56:01', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (122, 3, 0, '', 'AclModuleInfo{id=0, name=\'日常巡查记录表\', parentId=46, level=\'0.41.46\', seq=1, status=1, remark=\'日常巡查记录表模块\', operator=\'ps\', operateTime=2019-05-23 09:56:16.262, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:56:16', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (123, 3, 0, '', 'AclModuleInfo{id=0, name=\'水利整改记录表\', parentId=46, level=\'0.41.46\', seq=1, status=1, remark=\'水利整改记录表模块\', operator=\'ps\', operateTime=2019-05-23 09:56:35.374, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:56:35', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (124, 3, 0, '', 'AclModuleInfo{id=0, name=\'水利整改汇总表\', parentId=46, level=\'0.41.46\', seq=1, status=1, remark=\'水利整改汇总表模块\', operator=\'ps\', operateTime=2019-05-23 09:56:59.278, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:56:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (125, 3, 0, '', 'AclModuleInfo{id=0, name=\'绿化养护月报表\', parentId=46, level=\'0.41.46\', seq=1, status=1, remark=\'绿化养护月报表模块\', operator=\'ps\', operateTime=2019-05-23 09:57:26.584, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:57:26', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (126, 3, 0, '', 'AclModuleInfo{id=0, name=\'绿化养护记录表\', parentId=46, level=\'0.41.46\', seq=1, status=1, remark=\'绿化养护记录表模块\', operator=\'ps\', operateTime=2019-05-23 09:57:38.142, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:57:38', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (127, 3, 0, '', 'AclModuleInfo{id=0, name=\'柴油发电机组运行记录\', parentId=46, level=\'0.41.46\', seq=1, status=1, remark=\'柴油发电机组运行记录模块\', operator=\'ps\', operateTime=2019-05-23 09:58:02.551, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:58:02', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (128, 3, 0, '', 'AclModuleInfo{id=0, name=\'（泵）闸启闭运行记录\', parentId=46, level=\'0.41.46\', seq=1, status=1, remark=\'（泵）闸启闭运行记录模块\', operator=\'ps\', operateTime=2019-05-23 09:58:28.597, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:58:28', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (129, 3, 0, '', 'AclModuleInfo{id=0, name=\'调水记录汇总\', parentId=46, level=\'0.41.46\', seq=1, status=1, remark=\'调水记录汇总模块\', operator=\'ps\', operateTime=2019-05-23 09:58:51.902, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:58:51', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (130, 3, 0, '', 'AclModuleInfo{id=0, name=\'调水图片汇总\', parentId=46, level=\'0.41.46\', seq=1, status=1, remark=\'调水图片汇总模块\', operator=\'ps\', operateTime=2019-05-23 09:59:15.31, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:59:15', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (131, 3, 0, '', 'AclModuleInfo{id=0, name=\'水闸管理交接班\', parentId=46, level=\'0.41.46\', seq=1, status=1, remark=\'水闸管理交接班模块\', operator=\'ps\', operateTime=2019-05-23 09:59:39.206, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 09:59:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (132, 3, 0, '', 'AclModuleInfo{id=0, name=\'船舶过闸情况明细表\', parentId=46, level=\'0.41.46\', seq=1, status=1, remark=\'船舶过闸情况明细表\', operator=\'ps\', operateTime=2019-05-23 10:00:06.573, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:00:06', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (133, 3, 0, '', 'AclModuleInfo{id=0, name=\'卫生执勤记录表\', parentId=46, level=\'0.41.46\', seq=1, status=1, remark=\'卫生执勤记录表\', operator=\'ps\', operateTime=2019-05-23 10:00:24.982, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:00:25', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (134, 3, 0, '', 'AclModuleInfo{id=0, name=\'报警查询\', parentId=47, level=\'0.41.47\', seq=1, status=1, remark=\'报警查询\', operator=\'ps\', operateTime=2019-05-23 10:01:21.134, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:01:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (135, 3, 0, '', 'AclModuleInfo{id=0, name=\'水位查询\', parentId=47, level=\'0.41.47\', seq=1, status=1, remark=\'水位查询\', operator=\'ps\', operateTime=2019-05-23 10:01:30.29, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:01:30', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (136, 3, 0, '', 'AclModuleInfo{id=0, name=\'水闸对比\', parentId=47, level=\'0.41.47\', seq=1, status=1, remark=\'水闸对比\', operator=\'ps\', operateTime=2019-05-23 10:01:41.11, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:01:41', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (137, 3, 0, '', 'AclModuleInfo{id=0, name=\'监测点查询\', parentId=47, level=\'0.41.47\', seq=1, status=1, remark=\'监测点查询\', operator=\'ps\', operateTime=2019-05-23 10:01:59.445, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:01:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (138, 3, 0, '', 'AclModuleInfo{id=0, name=\'工况查询\', parentId=47, level=\'0.41.47\', seq=1, status=1, remark=\'工况查询\', operator=\'ps\', operateTime=2019-05-23 10:02:10.814, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:02:10', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (139, 3, 0, '', 'AclModuleInfo{id=0, name=\'整改查询\', parentId=47, level=\'0.41.47\', seq=1, status=1, remark=\'整改查询\', operator=\'ps\', operateTime=2019-05-23 10:02:21.415, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:02:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (140, 3, 0, '', 'AclModuleInfo{id=0, name=\'考勤查询\', parentId=47, level=\'0.41.47\', seq=1, status=1, remark=\'考勤查询\', operator=\'ps\', operateTime=2019-05-23 10:04:12.551, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:04:12', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (141, 3, 0, '', 'AclModuleInfo{id=0, name=\'排班查询\', parentId=47, level=\'0.41.47\', seq=1, status=1, remark=\'排班查询\', operator=\'ps\', operateTime=2019-05-23 10:04:25.694, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:04:25', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (142, 3, 0, '', 'AclModuleInfo{id=0, name=\'水闸管理\', parentId=48, level=\'0.41.48\', seq=1, status=1, remark=\'水闸管理\', operator=\'ps\', operateTime=2019-05-23 10:04:43.498, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:04:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (143, 3, 0, '', 'AclModuleInfo{id=0, name=\'视频管理\', parentId=48, level=\'0.41.48\', seq=1, status=1, remark=\'视频管理\', operator=\'ps\', operateTime=2019-05-23 10:04:54.449, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:04:54', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (144, 3, 0, '', 'AclModuleInfo{id=0, name=\'水位仪管理\', parentId=48, level=\'0.41.48\', seq=1, status=1, remark=\'水位仪管理\', operator=\'ps\', operateTime=2019-05-23 10:05:03.741, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:05:03', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (145, 3, 0, '', 'AclModuleInfo{id=0, name=\'闸位仪管理\', parentId=48, level=\'0.41.48\', seq=1, status=1, remark=\'闸位仪管理\', operator=\'ps\', operateTime=2019-05-23 10:05:25.52, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:05:25', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (146, 3, 0, '', 'AclModuleInfo{id=0, name=\'电量仪管理\', parentId=48, level=\'0.41.48\', seq=1, status=1, remark=\'电量仪管理\', operator=\'ps\', operateTime=2019-05-23 10:05:39.005, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:05:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (147, 3, 0, '', 'AclModuleInfo{id=0, name=\'水泵管理\', parentId=48, level=\'0.41.48\', seq=1, status=1, remark=\'水泵管理\', operator=\'ps\', operateTime=2019-05-23 10:05:52.853, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:05:52', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (148, 3, 0, '', 'AclModuleInfo{id=0, name=\'闸门管理\', parentId=48, level=\'0.41.48\', seq=1, status=1, remark=\'闸门管理\', operator=\'ps\', operateTime=2019-05-23 10:06:05.517, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:06:05', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (149, 3, 0, '', 'AclModuleInfo{id=0, name=\'网络设备管理\', parentId=48, level=\'0.41.48\', seq=1, status=1, remark=\'网络设备管理\', operator=\'ps\', operateTime=2019-05-23 10:06:20.117, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:06:20', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (150, 3, 0, '', 'AclModuleInfo{id=0, name=\'河流管理\', parentId=48, level=\'0.41.48\', seq=1, status=1, remark=\'河流管理\', operator=\'ps\', operateTime=2019-05-23 10:06:29.566, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:06:29', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (151, 3, 0, '', 'AclModuleInfo{id=0, name=\'圩区管理\', parentId=48, level=\'0.41.48\', seq=1, status=1, remark=\'圩区管理\', operator=\'ps\', operateTime=2019-05-23 10:07:39.598, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:07:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (152, 3, 0, '', 'AclModuleInfo{id=0, name=\'行政区管理\', parentId=48, level=\'0.41.48\', seq=1, status=1, remark=\'行政区管理\', operator=\'ps\', operateTime=2019-05-23 10:07:58.15, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:07:58', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (153, 3, 0, '', 'AclModuleInfo{id=0, name=\'巡查人员管理设置\', parentId=49, level=\'0.41.49\', seq=1, status=1, remark=\'巡查人员管理设置\', operator=\'ps\', operateTime=2019-05-23 10:08:31.415, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:08:31', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (154, 3, 0, '', 'AclModuleInfo{id=0, name=\'巡查目标管理设置\', parentId=49, level=\'0.41.49\', seq=1, status=1, remark=\'巡查目标管理设置\', operator=\'ps\', operateTime=2019-05-23 10:08:46.196, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:08:46', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (155, 3, 0, '', 'AclModuleInfo{id=0, name=\'人员排班管理设置\', parentId=49, level=\'0.41.49\', seq=1, status=1, remark=\'人员排班管理设置\', operator=\'ps\', operateTime=2019-05-23 10:09:10.525, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:09:10', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (156, 3, 0, '', 'AclModuleInfo{id=0, name=\'巡查工作\', parentId=49, level=\'0.41.49\', seq=1, status=1, remark=\'巡查工作\', operator=\'ps\', operateTime=2019-05-23 10:09:21.437, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:09:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (157, 3, 0, '', 'AclModuleInfo{id=0, name=\'考勤异常\', parentId=49, level=\'0.41.49\', seq=1, status=1, remark=\'考勤异常\', operator=\'ps\', operateTime=2019-05-23 10:09:35.557, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:09:35', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (158, 3, 0, '', 'AclModuleInfo{id=0, name=\'防汛仓库信息\', parentId=50, level=\'0.41.50\', seq=1, status=1, remark=\'防汛仓库信息\', operator=\'ps\', operateTime=2019-05-23 10:10:02.846, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:10:02', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (159, 3, 0, '', 'AclModuleInfo{id=0, name=\'防汛物资信息\', parentId=50, level=\'0.41.50\', seq=1, status=1, remark=\'防汛物资信息\', operator=\'ps\', operateTime=2019-05-23 10:10:19.486, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:10:19', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (160, 3, 0, '', 'AclModuleInfo{id=0, name=\'防汛物资状态\', parentId=50, level=\'0.41.50\', seq=1, status=1, remark=\'防汛物资状态\', operator=\'ps\', operateTime=2019-05-23 10:10:32.213, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:10:32', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (161, 3, 0, '', 'AclModuleInfo{id=0, name=\'防汛出入库信息\', parentId=50, level=\'0.41.50\', seq=1, status=1, remark=\'防汛出入库信息\', operator=\'ps\', operateTime=2019-05-23 10:10:47.702, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:10:47', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (162, 3, 0, '', 'AclModuleInfo{id=0, name=\'物资养护信息\', parentId=50, level=\'0.41.50\', seq=1, status=1, remark=\'物资养护信息\', operator=\'ps\', operateTime=2019-05-23 10:11:07.798, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:11:07', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (163, 3, 0, '', 'AclModuleInfo{id=0, name=\'物资巡检信息\', parentId=50, level=\'0.41.50\', seq=1, status=1, remark=\'物资巡检信息\', operator=\'ps\', operateTime=2019-05-23 10:11:23.957, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:11:23', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (164, 3, 0, '', 'AclModuleInfo{id=0, name=\'用户管理\', parentId=51, level=\'0.41.51\', seq=1, status=1, remark=\'物资巡检信息\', operator=\'ps\', operateTime=2019-05-23 10:11:46.348, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:11:46', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (165, 3, 0, '', 'AclModuleInfo{id=0, name=\'权限组管理\', parentId=51, level=\'0.41.51\', seq=1, status=1, remark=\'权限组管理\', operator=\'ps\', operateTime=2019-05-23 10:11:58.046, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:11:58', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (166, 3, 0, '', 'AclModuleInfo{id=0, name=\'人员管理\', parentId=51, level=\'0.41.51\', seq=1, status=1, remark=\'人员管理\', operator=\'ps\', operateTime=2019-05-23 10:12:07.101, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:12:07', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (167, 3, 0, '', 'AclModuleInfo{id=0, name=\'单位管理\', parentId=51, level=\'0.41.51\', seq=1, status=1, remark=\'单位管理\', operator=\'ps\', operateTime=2019-05-23 10:12:24.59, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:12:24', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (168, 3, 0, '', 'AclModuleInfo{id=0, name=\'报警规则\', parentId=51, level=\'0.41.51\', seq=1, status=1, remark=\'报警规则\', operator=\'ps\', operateTime=2019-05-23 10:12:44.439, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-23 10:12:44', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (169, 4, 0, '', 'AclInfo{id=0, code=\'20190523140000_29\', name=\'test\', aclModuleId=52, url=\'test\', type=2, status=1, seq=1, remark=\'test\', operator=\'\', operate_time=2019-05-23 14:00:00.051, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-23 14:00:00', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (170, 4, 0, '', 'AclInfo{id=0, code=\'20190523141302_85\', name=\'test\', aclModuleId=52, url=\'test\', type=2, status=1, seq=1, remark=\'test\', operator=\'\', operate_time=2019-05-23 14:13:02.248, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-23 14:13:02', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (171, 4, 0, '', 'AclInfo{id=0, code=\'20190523180811_7\', name=\'添加视频\', aclModuleId=52, url=\'add\', type=2, status=1, seq=1, remark=\'\', operator=\'\', operate_time=2019-05-23 18:08:11.632, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-23 18:08:11', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (172, 4, 0, '', 'AclInfo{id=0, code=\'20190523180833_81\', name=\'删除视频\', aclModuleId=52, url=\'delete\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-23 18:08:33.486, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-23 18:08:33', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (173, 4, 0, '', 'AclInfo{id=0, code=\'20190523180849_51\', name=\'修改视频\', aclModuleId=52, url=\'update\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-23 18:08:49.421, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-23 18:08:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (174, 4, 0, '', 'AclInfo{id=0, code=\'20190523180904_7\', name=\'查询视频\', aclModuleId=52, url=\'query\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-23 18:09:04.982, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-23 18:09:05', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (175, 3, 0, '', 'AclModuleInfo{id=0, name=\'权限模块\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'test\', operator=\'ps\', operateTime=2019-05-24 09:31:47.481, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-24 09:31:47', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (176, 4, 0, '', 'AclInfo{id=0, code=\'20190524111752_92\', name=\'保存功能模块\', aclModuleId=100, url=\'rbac/saveAclModule\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 11:17:52.757, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 11:17:52', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (177, 4, 0, '', 'AclInfo{id=0, code=\'20190524111936_9\', name=\'删除功能模块\', aclModuleId=100, url=\'/rbac/deleteAclModule\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 11:19:36.479, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 11:19:36', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (178, 4, 0, '', 'AclInfo{id=0, code=\'20190524112022_72\', name=\'更新功能模块\', aclModuleId=100, url=\'/rbac/updateAclModule\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 11:20:22.594, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 11:20:22', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (179, 4, 0, '', 'AclInfo{id=0, code=\'20190524112100_14\', name=\'查询所有的功能模块\', aclModuleId=100, url=\'/rbac/findAllAclModule\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 11:21:00.384, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 11:21:00', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (180, 4, 0, '', 'AclInfo{id=0, code=\'20190524112224_18\', name=\'根据功能模块id查询功能模块\', aclModuleId=100, url=\'/rbac/findAclModuleById\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 11:22:24.113, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 11:22:24', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (181, 4, 0, '', 'AclInfo{id=0, code=\'20190524112311_94\', name=\'保存角色\', aclModuleId=100, url=\'/rbac/saveAcl\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 11:23:11.603, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 11:23:11', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (182, 4, 0, '', 'AclInfo{id=0, code=\'20190524112439_27\', name=\'删除功能点\', aclModuleId=100, url=\'/rbac/deleteAcl\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 11:24:39.041, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 11:24:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (183, 4, 0, '', 'AclInfo{id=0, code=\'20190524112515_91\', name=\'查询所有功能点\', aclModuleId=100, url=\'/rbac/findAllAcl\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 11:25:15.434, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 11:25:15', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (184, 4, 0, '', 'AclInfo{id=0, code=\'20190524112542_59\', name=\'根据功能点id查询功能点\', aclModuleId=100, url=\'/rbac/findAclById\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 11:25:42.688, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 11:25:42', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (185, 4, 0, '', 'AclInfo{id=0, code=\'20190524112619_10\', name=\'更新功能点\', aclModuleId=100, url=\'/rbac/updateAcl\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 11:26:19.537, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 11:26:19', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (186, 4, 0, '', 'AclInfo{id=0, code=\'20190524112838_33\', name=\'保存角色功能\', aclModuleId=100, url=\'/rbac/saveRoleAcl\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 11:28:38.773, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 11:28:38', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (187, 4, 0, '', 'AclInfo{id=0, code=\'20190524112909_55\', name=\'删除角色功能\', aclModuleId=100, url=\'/rbac/deleteRoleAcl\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 11:29:09.641, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 11:29:09', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (188, 4, 0, '', 'AclInfo{id=0, code=\'20190524112953_6\', name=\'查询角色功能\', aclModuleId=100, url=\'/rbac/findAllRoleAcl\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 11:29:53.875, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 11:29:53', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (189, 4, 0, '', 'AclInfo{id=0, code=\'20190524123839_3\', name=\'根据角色功能id查询角色功能\', aclModuleId=100, url=\'/rbac/findRoleAclById\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:38:39.605, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:38:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (190, 4, 0, '', 'AclInfo{id=0, code=\'20190524123916_23\', name=\'更新角色功能\', aclModuleId=100, url=\'/rbac/updateRoleAcl\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:39:16.766, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:39:16', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (191, 4, 0, '', 'AclInfo{id=0, code=\'20190524123949_70\', name=\'保存角色\', aclModuleId=100, url=\'/rbac/saveRole\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:39:49.026, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:39:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (192, 4, 0, '', 'AclInfo{id=0, code=\'20190524124036_88\', name=\'删除角色\', aclModuleId=100, url=\'/rbac/deleteRole\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:40:36.692, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:40:36', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (193, 4, 0, '', 'AclInfo{id=0, code=\'20190524124144_45\', name=\'根据角色查询角色功能\', aclModuleId=100, url=\'/rbac/fidRoleAclByRolename\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:41:44.145, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:41:44', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (194, 4, 0, '', 'AclInfo{id=0, code=\'20190524124216_88\', name=\'查询角色\', aclModuleId=100, url=\'/rbac/findAllRole\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:42:16.734, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:42:16', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (195, 4, 0, '', 'AclInfo{id=0, code=\'20190524124251_35\', name=\'根据id查询角色\', aclModuleId=100, url=\'/rbac/findRoleById\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:42:51.09, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:42:51', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (196, 4, 0, '', 'AclInfo{id=0, code=\'20190524124323_12\', name=\'更新角色\', aclModuleId=100, url=\'/rbac/updateRole\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:43:23.406, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:43:23', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (197, 4, 0, '', 'AclInfo{id=0, code=\'20190524124410_74\', name=\'查询层级树\', aclModuleId=100, url=\'/rbac/aclModuleTree\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:44:10.568, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:44:10', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (198, 4, 0, '', 'AclInfo{id=0, code=\'20190524124438_88\', name=\'查询角色权限模块层级树\', aclModuleId=100, url=\'/rbac/aclModuleTreeByRolename\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:44:38.541, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:44:38', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (199, 4, 0, '', 'AclInfo{id=0, code=\'20190524124528_44\', name=\'根据用户id及用户名查询权限层级树\', aclModuleId=100, url=\'/rbac/aclModuleTreeByUserIdAndname\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:45:28.287, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:45:28', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (200, 4, 0, '', 'AclInfo{id=0, code=\'20190524124558_54\', name=\'根据id查询用户权限\', aclModuleId=100, url=\'/rbac/userAcls\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:45:58.175, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:45:58', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (201, 4, 0, '', 'AclInfo{id=0, code=\'20190524124621_15\', name=\'查询系统预定义给用户对应角色的权限\', aclModuleId=100, url=\'/rbac/findUserAclsBySystem\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:46:21.05, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:46:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (202, 4, 0, '', 'AclInfo{id=0, code=\'20190524124638_91\', name=\'查询用户自己的，非系统预定义的权限\', aclModuleId=100, url=\'/rbac/findUserAclsBySingle\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:46:38.046, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:46:38', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (203, 4, 0, '', 'AclInfo{id=0, code=\'20190524124726_67\', name=\'根据用户id查询层级树\', aclModuleId=100, url=\'/rbac/userAclModuleTree\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:47:26.2, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:47:26', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (204, 4, 0, '', 'AclInfo{id=0, code=\'20190524124758_66\', name=\'保存用户角色\', aclModuleId=100, url=\'/rbac/saveUserRole\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:47:58.597, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:47:58', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (205, 4, 0, '', 'AclInfo{id=0, code=\'20190524124828_82\', name=\'删除用户角色\', aclModuleId=100, url=\'/rbac/deleteUserRole\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:48:28.222, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:48:28', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (206, 4, 0, '', 'AclInfo{id=0, code=\'20190524124854_48\', name=\'查询用户角色\', aclModuleId=100, url=\'/rbac/findAllUserRole\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:48:54.52, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:48:54', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (207, 4, 0, '', 'AclInfo{id=0, code=\'20190524124918_40\', name=\'根据id查询用户角色\', aclModuleId=100, url=\'/rbac/findUserRoleById\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:49:18.829, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:49:18', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (208, 4, 0, '', 'AclInfo{id=0, code=\'20190524124945_17\', name=\'更新用户角色\', aclModuleId=100, url=\'/rbac/updateUserRole\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:49:45.622, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:49:45', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (209, 4, 0, '', 'AclInfo{id=0, code=\'20190524125009_95\', name=\'保存用户\', aclModuleId=100, url=\'/rbac/saveUser\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:50:09.709, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:50:09', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (210, 4, 0, '', 'AclInfo{id=0, code=\'20190524125049_21\', name=\'删除用户\', aclModuleId=100, url=\'/rbac/deleteUser\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:50:49.857, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:50:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (211, 4, 0, '', 'AclInfo{id=0, code=\'20190524125117_35\', name=\'查询用户\', aclModuleId=100, url=\'/rbac/findAllUser\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:51:17.785, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:51:17', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (212, 4, 0, '', 'AclInfo{id=0, code=\'20190524125149_47\', name=\'根据id查询用户\', aclModuleId=100, url=\'/rbac/findUserById\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:51:49.49, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:51:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (213, 4, 0, '', 'AclInfo{id=0, code=\'20190524125216_18\', name=\'更新用户\', aclModuleId=100, url=\'/rbac/updateUser\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:52:16.708, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:52:16', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (214, 4, 0, '', 'AclInfo{id=0, code=\'20190524125317_12\', name=\'功能模块与功能点绑定\', aclModuleId=100, url=\'/rbca/bondAclModule\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-24 12:53:17.277, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-24 12:53:17', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (215, 3, 0, '', 'AclModuleInfo{id=0, name=\'水闸长效管理系统\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'水闸长效管理系统\', operator=\'ps\', operateTime=2019-05-27 09:24:45.297, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-27 09:24:45', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (216, 3, 0, '', 'AclModuleInfo{id=0, name=\'水闸长效管理APP系统\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'水闸长效管理APP系统\', operator=\'ps\', operateTime=2019-05-27 09:32:02.852, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-27 09:32:02', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (217, 3, 0, '', 'AclModuleInfo{id=0, name=\'河道长效管理系统\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'河道长效管理系统\', operator=\'ps\', operateTime=2019-05-27 09:33:02.448, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-27 09:33:02', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (218, 3, 0, '', 'AclModuleInfo{id=0, name=\'河道长效管理APP系统\', parentId=41, level=\'0.41\', seq=1, status=1, remark=\'河道长效管理APP系统\', operator=\'ps\', operateTime=2019-05-27 09:33:12.047, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-27 09:33:12', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (219, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'test111\', operate_time=2019-05-27 13:38:43.399, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 13:38:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (220, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 13:42:57.385, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 13:42:57', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (221, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 13:54:51.434, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 13:54:51', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (222, 5, 0, '', 'RoleInfo{id=0, name=\'test1\', type=1, status=1, remark=\'test1个人角色\', operator=\'ps\', operate_time=2019-05-27 14:09:02.414, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:09:02', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (223, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:11:21.178, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:11:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (224, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:13:09.88, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:13:09', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (225, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:14:25.995, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:14:26', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (226, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:15:39.145, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:15:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (227, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:18:03.326, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:18:03', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (228, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:20:29.782, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:20:29', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (229, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:20:54.461, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:20:54', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (230, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:29:14.937, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:29:14', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (231, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:32:35.522, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:32:35', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (232, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:34:19.29, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:34:19', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (233, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:46:46.302, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:46:46', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (234, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:48:03.429, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:48:03', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (235, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:49:10.605, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:49:10', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (236, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-27 14:50:14.004, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 14:50:14', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (237, 4, 0, '', 'AclInfo{id=0, code=\'20190527154221_69\', name=\'test\', aclModuleId=41, url=\'sys/test\', type=2, status=0, seq=1, remark=\'test\', operator=\'\', operate_time=2019-05-27 15:42:21.429, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 15:42:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (238, 4, 0, '', 'AclInfo{id=0, code=\'20190527154821_15\', name=\'test\', aclModuleId=41, url=\'sys/test\', type=2, status=0, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-27 15:48:21.23, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 15:48:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (239, 4, 0, '', 'AclInfo{id=0, code=\'20190527155534_25\', name=\'test\', aclModuleId=41, url=\'sys/test\', type=2, status=0, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-27 15:55:34.867, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-27 15:55:34', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (240, 4, 0, '', 'AclInfo{id=0, code=\'20190528101943_18\', name=\'整改问题上报\', aclModuleId=56, url=\'/add/rectification\', type=2, status=1, seq=1, remark=\'上报整改问题\', operator=\'\', operate_time=2019-05-28 10:19:43.524, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 10:19:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (241, 4, 0, '', 'AclInfo{id=0, code=\'20190528102856_75\', name=\'删除整改问题\', aclModuleId=56, url=\'/delete/rectification\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 10:28:56.251, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 10:28:56', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (242, 4, 0, '', 'AclInfo{id=0, code=\'20190528103014_80\', name=\'修改整改问题的基本信息\', aclModuleId=56, url=\'/update/rectification/basic\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 10:30:14.095, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 10:30:14', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (243, 4, 0, '', 'AclInfo{id=0, code=\'20190528103118_27\', name=\'开始整改问题\', aclModuleId=56, url=\'/start/rectification\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 10:31:18.009, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 10:31:18', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (244, 4, 0, '', 'AclInfo{id=0, code=\'20190528103145_42\', name=\'提交整改问题\', aclModuleId=56, url=\'/commit/rectification\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 10:31:45.699, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 10:31:45', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (245, 4, 0, '', 'AclInfo{id=0, code=\'20190528103325_6\', name=\'获取整改问题的最新状态\', aclModuleId=56, url=\'/find/rectification/status\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 10:33:25.601, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 10:33:25', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (246, 4, 0, '', 'AclInfo{id=0, code=\'20190528103504_46\', name=\'获取整改问题的处理流程\', aclModuleId=56, url=\'/find/rectification/detail\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 10:35:04.1, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 10:35:04', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (247, 4, 0, '', 'AclInfo{id=0, code=\'20190528103804_68\', name=\'列举整改问题列表\', aclModuleId=56, url=\'/list/rectification/history\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 10:38:04.842, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 10:38:04', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (248, 4, 0, '', 'AclInfo{id=0, code=\'20190528104421_4\', name=\'查询单个人的排班\', aclModuleId=76, url=\'/schedule/find/byUser\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 10:44:21.442, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 10:44:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (249, 4, 0, '', 'AclInfo{id=0, code=\'20190528104645_1\', name=\'查询一天的排班\', aclModuleId=76, url=\'/schedule/find/forDay\', type=2, status=1, seq=1, remark=\'查询某个水利设施一天的排班\', operator=\'\', operate_time=2019-05-28 10:46:45.68, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 10:46:45', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (250, 4, 0, '', 'AclInfo{id=0, code=\'20190528105025_76\', name=\'列举排班\', aclModuleId=76, url=\'/schedule/list\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 10:50:25.812, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 10:50:25', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (251, 4, 0, '', 'AclInfo{id=0, code=\'20190528105238_1\', name=\'添加水利设施\', aclModuleId=77, url=\'/conservancy/addTest\', type=2, status=1, seq=1, remark=\'添加水利设施及管理设备\', operator=\'\', operate_time=2019-05-28 10:52:38.116, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 10:52:38', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (252, 4, 0, '', 'AclInfo{id=0, code=\'20190528105313_57\', name=\'添加水闸\', aclModuleId=77, url=\'/conservancy/add\', type=2, status=1, seq=1, remark=\'添加水利设施\', operator=\'\', operate_time=2019-05-28 10:53:13.699, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 10:53:13', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (253, 4, 0, '', 'AclInfo{id=0, code=\'20190528111818_28\', name=\'修改水利设施基本信息\', aclModuleId=77, url=\'/conservancy/update/basic\', type=2, status=1, seq=1, remark=\'修改基本信息\', operator=\'\', operate_time=2019-05-28 11:18:18.338, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 11:18:18', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (254, 4, 0, '', 'AclInfo{id=0, code=\'20190528111911_12\', name=\'修改水利设施信息\', aclModuleId=77, url=\'/conservancy/update\', type=2, status=1, seq=1, remark=\'修改水利设施详细信息\', operator=\'\', operate_time=2019-05-28 11:19:11.3, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 11:19:11', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (255, 4, 0, '', 'AclInfo{id=0, code=\'20190528112034_37\', name=\'查询水利设施的基本信息列表\', aclModuleId=77, url=\'/conservancy/list/basic\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 11:20:34.697, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 11:20:34', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (256, 4, 0, '', 'AclInfo{id=0, code=\'20190528112303_60\', name=\'查询单个水利设施的详情\', aclModuleId=77, url=\'/conservancy/find/detail\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 11:23:03.444, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 11:23:03', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (257, 4, 0, '', 'AclInfo{id=0, code=\'20190528112939_49\', name=\'新增摄像头\', aclModuleId=78, url=\'/camera/add\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 11:29:39.154, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 11:29:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (258, 4, 0, '', 'AclInfo{id=0, code=\'20190528113013_59\', name=\'删除摄像头\', aclModuleId=78, url=\'/camera/delete\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 11:30:13.942, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 11:30:13', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (259, 4, 0, '', 'AclInfo{id=0, code=\'20190528113059_64\', name=\'修改摄像头\', aclModuleId=78, url=\'/camera/update\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 11:30:59.681, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 11:30:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (260, 4, 0, '', 'AclInfo{id=0, code=\'20190528113307_89\', name=\'查询摄像头列表\', aclModuleId=78, url=\'/camera/list\', type=2, status=1, seq=1, remark=\'null\', operator=\'\', operate_time=2019-05-28 11:33:07.289, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 11:33:07', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (261, 4, 0, '', 'AclInfo{id=0, code=\'20190528142910_77\', name=\'闸门列表\', aclModuleId=83, url=\'/gate/listGate\', type=2, status=1, seq=1, remark=\'点击闸门管理，列举闸门列表\', operator=\'ps\', operate_time=2019-05-28 14:29:10.191, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 14:29:10', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (262, 4, 0, '', 'AclInfo{id=0, code=\'20190528145052_68\', name=\'添加闸门\', aclModuleId=83, url=\'/gate/add\', type=2, status=1, seq=1, remark=\'添加闸门\', operator=\'ps\', operate_time=2019-05-28 14:50:52.548, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 14:50:52', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (263, 4, 0, '', 'AclInfo{id=0, code=\'20190528145140_69\', name=\'修改闸门\', aclModuleId=83, url=\'/gate/update\', type=2, status=1, seq=1, remark=\'修改闸门\', operator=\'ps\', operate_time=2019-05-28 14:51:40.66, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 14:51:40', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (264, 4, 0, '', 'AclInfo{id=0, code=\'20190528145227_61\', name=\'删除闸门\', aclModuleId=83, url=\'/gate/deleteById\', type=2, status=1, seq=1, remark=\'删除闸门\', operator=\'ps\', operate_time=2019-05-28 14:52:27.135, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 14:52:27', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (265, 4, 0, '', 'AclInfo{id=0, code=\'20190528145339_75\', name=\'test\', aclModuleId=41, url=\'staesfs\', type=2, status=0, seq=1, remark=\'null\', operator=\'xc\', operate_time=2019-05-28 14:53:39.949, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 14:53:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (266, 5, 0, '', 'RoleInfo{id=0, name=\'17601506602\', type=1, status=1, remark=\'17601506602个人角色\', operator=\'\', operate_time=2019-05-28 15:01:49.775, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:01:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (267, 4, 0, '', 'AclInfo{id=0, code=\'20190528151334_5\', name=\'新增公司\', aclModuleId=102, url=\'/company/add\', type=2, status=1, seq=1, remark=\'新增公司\', operator=\'ps\', operate_time=2019-05-28 15:13:34.272, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:13:34', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (268, 4, 0, '', 'AclInfo{id=0, code=\'20190528151404_42\', name=\'删除公司\', aclModuleId=102, url=\'/company/delete\', type=2, status=1, seq=1, remark=\'删除公司\', operator=\'ps\', operate_time=2019-05-28 15:14:04.193, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:14:04', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (269, 4, 0, '', 'AclInfo{id=0, code=\'20190528151427_59\', name=\'更新公司信息\', aclModuleId=102, url=\'/company/update\', type=2, status=1, seq=1, remark=\'更新公司信息\', operator=\'ps\', operate_time=2019-05-28 15:14:27.874, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:14:27', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (270, 4, 0, '', 'AclInfo{id=0, code=\'20190528151452_47\', name=\'根据公司id查询\', aclModuleId=102, url=\'/company/query\', type=2, status=1, seq=1, remark=\'根据公司id查询\', operator=\'ps\', operate_time=2019-05-28 15:14:52.412, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:14:52', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (271, 4, 0, '', 'AclInfo{id=0, code=\'20190528151519_51\', name=\'根据类型查询\', aclModuleId=102, url=\'/company/querybytype\', type=2, status=1, seq=1, remark=\'根据类型查询\', operator=\'ps\', operate_time=2019-05-28 15:15:19.572, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:15:19', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (272, 4, 0, '', 'AclInfo{id=0, code=\'20190528151542_96\', name=\'根据条件查询公司详情\', aclModuleId=102, url=\'/find/byCondition\', type=2, status=1, seq=1, remark=\'根据条件查询公司详情\', operator=\'ps\', operate_time=2019-05-28 15:15:42.863, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:15:42', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (273, 5, 0, '', 'RoleInfo{id=0, name=\'2\', type=1, status=1, remark=\'2个人角色\', operator=\'ps\', operate_time=2019-05-28 15:19:54.988, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:19:55', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (274, 4, 0, '', 'AclInfo{id=0, code=\'20190528152103_63\', name=\'开始整改\', aclModuleId=55, url=\'/process/start\', type=2, status=1, seq=1, remark=\'开始整改\', operator=\'ps\', operate_time=2019-05-28 15:21:03.88, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:21:03', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (275, 4, 0, '', 'AclInfo{id=0, code=\'20190528152129_84\', name=\'查询报警公司\', aclModuleId=55, url=\'/process/company\', type=2, status=1, seq=1, remark=\'查询报警公司\', operator=\'ps\', operate_time=2019-05-28 15:21:29.059, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:21:29', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (276, 4, 0, '', 'AclInfo{id=0, code=\'20190528152150_43\', name=\'提交整改\', aclModuleId=55, url=\'/process/commit\', type=2, status=1, seq=1, remark=\'提交整改\', operator=\'ps\', operate_time=2019-05-28 15:21:50.68, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:21:50', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (277, 4, 0, '', 'AclInfo{id=0, code=\'20190528152213_13\', name=\'查询报警\', aclModuleId=55, url=\'/process/query\', type=2, status=1, seq=1, remark=\'查询报警\', operator=\'ps\', operate_time=2019-05-28 15:22:13.659, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:22:13', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (278, 4, 0, '', 'AclInfo{id=0, code=\'20190528152237_85\', name=\'结束报警\', aclModuleId=55, url=\'/process/end\', type=2, status=1, seq=1, remark=\'结束报警\', operator=\'ps\', operate_time=2019-05-28 15:22:37.87, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:22:37', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (279, 4, 0, '', 'AclInfo{id=0, code=\'20190528152257_43\', name=\'重置报警\', aclModuleId=55, url=\'/process/relieve\', type=2, status=1, seq=1, remark=\'重置报警\', operator=\'ps\', operate_time=2019-05-28 15:22:57.651, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:22:57', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (280, 4, 0, '', 'AclInfo{id=0, code=\'20190528152317_69\', name=\'取消报警\', aclModuleId=55, url=\'/process/cancel\', type=2, status=1, seq=1, remark=\'取消报警\', operator=\'ps\', operate_time=2019-05-28 15:23:17.822, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:23:17', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (281, 4, 0, '', 'AclInfo{id=0, code=\'20190528152433_3\', name=\'新增组信息\', aclModuleId=41, url=\'/group/add\', type=2, status=1, seq=1, remark=\'新增组信息\', operator=\'ps\', operate_time=2019-05-28 15:24:33.576, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:24:33', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (282, 4, 0, '', 'AclInfo{id=0, code=\'20190528152453_6\', name=\'修改组信息\', aclModuleId=41, url=\'/group/edit\', type=2, status=1, seq=1, remark=\'修改组信息\', operator=\'ps\', operate_time=2019-05-28 15:24:53.513, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:24:53', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (283, 4, 0, '', 'AclInfo{id=0, code=\'20190528152515_25\', name=\'删除组\', aclModuleId=41, url=\'/group/delete\', type=2, status=1, seq=1, remark=\'删除组\', operator=\'ps\', operate_time=2019-05-28 15:25:15.649, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:25:15', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (284, 4, 0, '', 'AclInfo{id=0, code=\'20190528152535_53\', name=\'查询组信息\', aclModuleId=41, url=\'/group/list\', type=2, status=1, seq=1, remark=\'查询组信息\', operator=\'ps\', operate_time=2019-05-28 15:25:35.165, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:25:35', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (285, 4, 0, '', 'AclInfo{id=0, code=\'20190528152554_67\', name=\'查询用户组信息\', aclModuleId=41, url=\'/group/query/user\', type=2, status=1, seq=1, remark=\'查询用户组信息\', operator=\'ps\', operate_time=2019-05-28 15:25:54.618, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:25:54', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (286, 4, 0, '', 'AclInfo{id=0, code=\'20190528152616_88\', name=\'查询权限信息\', aclModuleId=41, url=\'/group/query/roleId\', type=2, status=1, seq=1, remark=\'查询权限信息\', operator=\'ps\', operate_time=2019-05-28 15:26:16.895, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:26:16', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (287, 4, 0, '', 'AclInfo{id=0, code=\'20190528152637_31\', name=\'新增资源\', aclModuleId=41, url=\'/group/add/resources\', type=2, status=1, seq=1, remark=\'新增资源\', operator=\'ps\', operate_time=2019-05-28 15:26:37.799, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:26:37', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (288, 4, 0, '', 'AclInfo{id=0, code=\'20190528152656_40\', name=\'删除资源\', aclModuleId=41, url=\'/group/delete/resources\', type=2, status=1, seq=1, remark=\'删除资源\', operator=\'ps\', operate_time=2019-05-28 15:26:56.659, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:26:56', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (289, 4, 0, '', 'AclInfo{id=0, code=\'20190528152716_88\', name=\'修改资源信息\', aclModuleId=41, url=\'/group/edit/resources\', type=2, status=1, seq=1, remark=\'修改资源信息\', operator=\'ps\', operate_time=2019-05-28 15:27:16.596, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:27:16', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (290, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=1, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-28 15:27:06.565, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:27:06', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (291, 4, 0, '', 'AclInfo{id=0, code=\'20190528152735_20\', name=\'查询资源信息\', aclModuleId=41, url=\'/group/resources/query\', type=2, status=1, seq=1, remark=\'查询资源信息\', operator=\'ps\', operate_time=2019-05-28 15:27:35.332, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:27:35', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (292, 4, 0, '', 'AclInfo{id=0, code=\'20190528152753_54\', name=\'查询资源\', aclModuleId=41, url=\'/group/resources/list\', type=2, status=1, seq=1, remark=\'查询资源\', operator=\'ps\', operate_time=2019-05-28 15:27:53.724, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:27:53', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (293, 4, 0, '', 'AclInfo{id=0, code=\'20190528152812_48\', name=\'查询水利资源\', aclModuleId=41, url=\'/group/resources/water\', type=2, status=1, seq=1, remark=\'查询水利资源\', operator=\'ps\', operate_time=2019-05-28 15:28:12.413, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:28:12', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (294, 4, 0, '', 'AclInfo{id=0, code=\'20190528152837_23\', name=\'查询用户资源\', aclModuleId=41, url=\'/group/resources/person\', type=2, status=1, seq=1, remark=\'查询用户资源\', operator=\'ps\', operate_time=2019-05-28 15:28:37.841, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:28:37', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (295, 4, 0, '', 'AclInfo{id=0, code=\'20190528152951_77\', name=\'实时水位信息\', aclModuleId=54, url=\'/monitoring/water\', type=2, status=1, seq=1, remark=\'实时水位信息\', operator=\'ps\', operate_time=2019-05-28 15:29:51.099, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:29:51', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (296, 4, 0, '', 'AclInfo{id=0, code=\'20190528153013_34\', name=\'实时电量信息\', aclModuleId=54, url=\'/monitoring/electricity\', type=2, status=1, seq=1, remark=\'实时电量信息\', operator=\'ps\', operate_time=2019-05-28 15:30:13.469, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:30:13', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (297, 4, 0, '', 'AclInfo{id=0, code=\'20190528153035_19\', name=\'实时门信息\', aclModuleId=54, url=\'/monitoring/gate\', type=2, status=1, seq=1, remark=\'实时门信息\', operator=\'ps\', operate_time=2019-05-28 15:30:35.481, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:30:35', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (298, 4, 0, '', 'AclInfo{id=0, code=\'20190528153056_49\', name=\'实时泵信息\', aclModuleId=54, url=\'/monitoring/pump\', type=2, status=1, seq=1, remark=\'实时泵信息\', operator=\'ps\', operate_time=2019-05-28 15:30:56.681, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:30:56', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (299, 4, 0, '', 'AclInfo{id=0, code=\'20190528153121_90\', name=\'实时摄像头信息\', aclModuleId=54, url=\'/monitoring/cream\', type=2, status=1, seq=1, remark=\'实时摄像头信息\', operator=\'ps\', operate_time=2019-05-28 15:31:21.688, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:31:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (300, 4, 0, '', 'AclInfo{id=0, code=\'20190528153144_57\', name=\'实时网络信息\', aclModuleId=54, url=\'/monitoring/network\', type=2, status=1, seq=1, remark=\'实时网络信息\', operator=\'ps\', operate_time=2019-05-28 15:31:44.09, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:31:44', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (301, 4, 0, '', 'AclInfo{id=0, code=\'20190528153203_12\', name=\'闸门信息\', aclModuleId=54, url=\'/monitoring/gateState\', type=2, status=1, seq=1, remark=\'闸门信息\', operator=\'ps\', operate_time=2019-05-28 15:32:03.091, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:32:03', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (302, 4, 0, '', 'AclInfo{id=0, code=\'20190528153223_60\', name=\'圩区树\', aclModuleId=54, url=\'/monitoring/damTree\', type=2, status=1, seq=1, remark=\'圩区树\', operator=\'ps\', operate_time=2019-05-28 15:32:23.215, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:32:23', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (303, 4, 0, '', 'AclInfo{id=0, code=\'20190528153326_70\', name=\'水闸综合监控树结构\', aclModuleId=54, url=\'/monitoring/damShowTree\', type=2, status=1, seq=1, remark=\'水闸综合监控树结构\', operator=\'ps\', operate_time=2019-05-28 15:33:26.473, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:33:26', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (304, 5, 0, '', 'RoleInfo{id=0, name=\'test\', type=2, status=1, remark=\'test个人角色\', operator=\'ps\', operate_time=2019-05-28 15:33:20.988, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:33:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (305, 4, 0, '', 'AclInfo{id=0, code=\'20190528153359_54\', name=\'视频监控实时视频左侧树形结构\', aclModuleId=54, url=\'/monitoring/damShowTree2\', type=2, status=1, seq=1, remark=\'视频监控实时视频左侧树形结构\', operator=\'ps\', operate_time=2019-05-28 15:33:59.108, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:33:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (306, 4, 0, '', 'AclInfo{id=0, code=\'20190528153423_20\', name=\'区域摄像头树\', aclModuleId=54, url=\'/monitoring/regionCameraTree\', type=2, status=1, seq=1, remark=\'区域摄像头树\', operator=\'ps\', operate_time=2019-05-28 15:34:23.039, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:34:23', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (307, 4, 0, '', 'AclInfo{id=0, code=\'20190528153443_35\', name=\'圩区摄像头树\', aclModuleId=54, url=\'/monitoring/damCameraTree\', type=2, status=1, seq=1, remark=\'圩区摄像头树\', operator=\'ps\', operate_time=2019-05-28 15:34:43.053, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:34:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (308, 4, 0, '', 'AclInfo{id=0, code=\'20190528153514_88\', name=\'查询关注信息\', aclModuleId=54, url=\'/monitoring/addFavourite\', type=2, status=1, seq=1, remark=\'查询关注信息\', operator=\'ps\', operate_time=2019-05-28 15:35:14.628, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:35:14', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (309, 4, 0, '', 'AclInfo{id=0, code=\'20190528153535_15\', name=\'查询摄像头关注\', aclModuleId=54, url=\'/monitoring/cameraFavourite\', type=2, status=1, seq=1, remark=\'查询摄像头关注\', operator=\'ps\', operate_time=2019-05-28 15:35:35.844, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:35:35', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (310, 4, 0, '', 'AclInfo{id=0, code=\'20190528153555_26\', name=\'新增摄像头关注\', aclModuleId=54, url=\'/monitoring/addCameraFavourite\', type=2, status=1, seq=1, remark=\'新增摄像头关注\', operator=\'ps\', operate_time=2019-05-28 15:35:55.547, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:35:55', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (311, 4, 0, '', 'AclInfo{id=0, code=\'20190528153620_77\', name=\'删除摄像头关注\', aclModuleId=54, url=\'/monitoring/deleteFavourite\', type=2, status=1, seq=1, remark=\'删除摄像头关注\', operator=\'ps\', operate_time=2019-05-28 15:36:20.819, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:36:20', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (312, 4, 0, '', 'AclInfo{id=0, code=\'20190528153645_25\', name=\'删除水利关注\', aclModuleId=54, url=\'/monitoring/deleteWaterFavourite\', type=2, status=1, seq=1, remark=\'删除水利关注\', operator=\'ps\', operate_time=2019-05-28 15:36:45.248, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:36:45', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (313, 4, 0, '', 'AclInfo{id=0, code=\'20190528153706_32\', name=\'查询摄像头是否被收藏\', aclModuleId=54, url=\'/monitoring/queryCameraIsFavourite\', type=2, status=1, seq=1, remark=\'查询摄像头是否被收藏\', operator=\'ps\', operate_time=2019-05-28 15:37:06.776, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:37:06', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (314, 3, 0, '', 'AclModuleInfo{id=0, name=\'作战图\', parentId=105, level=\'0.41.105\', seq=1, status=1, remark=\'作战图\', operator=\'ps\', operateTime=2019-05-28 15:38:17.991, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:38:18', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (315, 4, 0, '', 'AclInfo{id=0, code=\'20190528153910_38\', name=\'图层\', aclModuleId=109, url=\'/map/list\', type=2, status=1, seq=1, remark=\'图层\', operator=\'ps\', operate_time=2019-05-28 15:39:10.797, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:39:10', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (316, 4, 0, '', 'AclInfo{id=0, code=\'20190528153930_35\', name=\'船舶信息\', aclModuleId=109, url=\'/map/ship\', type=2, status=1, seq=1, remark=\'船舶信息\', operator=\'ps\', operate_time=2019-05-28 15:39:30.921, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:39:30', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (317, 4, 0, '', 'AclInfo{id=0, code=\'20190528153951_96\', name=\'人员信息\', aclModuleId=109, url=\'/map/personnel\', type=2, status=1, seq=1, remark=\'人员信息\', operator=\'ps\', operate_time=2019-05-28 15:39:51.466, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:39:51', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (318, 4, 0, '', 'AclInfo{id=0, code=\'20190528154012_20\', name=\'设备监控\', aclModuleId=109, url=\'/map/device\', type=2, status=1, seq=1, remark=\'设备监控\', operator=\'ps\', operate_time=2019-05-28 15:40:12.386, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:40:12', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (319, 4, 0, '', 'AclInfo{id=0, code=\'20190528154036_88\', name=\'水位信息\', aclModuleId=109, url=\'/map/waterLevel\', type=2, status=1, seq=1, remark=\'水位信息\', operator=\'ps\', operate_time=2019-05-28 15:40:36.488, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:40:36', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (320, 4, 0, '', 'AclInfo{id=0, code=\'20190528154058_27\', name=\'子系统\', aclModuleId=109, url=\'/map/sub\', type=2, status=1, seq=1, remark=\'子系统\', operator=\'ps\', operate_time=2019-05-28 15:40:58.094, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:40:58', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (321, 4, 0, '', 'AclInfo{id=0, code=\'20190528154123_69\', name=\'统计信息\', aclModuleId=109, url=\'/map/summary\', type=2, status=1, seq=1, remark=\'统计信息\', operator=\'ps\', operate_time=2019-05-28 15:41:23.132, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:41:23', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (322, 4, 0, '', 'AclInfo{id=0, code=\'20190528154143_26\', name=\'查看取证信息\', aclModuleId=109, url=\'/map/evidence\', type=2, status=1, seq=1, remark=\'查看取证信息\', operator=\'ps\', operate_time=2019-05-28 15:41:43.692, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:41:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (323, 4, 0, '', 'AclInfo{id=0, code=\'20190528154206_26\', name=\'查看人员报警信息\', aclModuleId=109, url=\'/map/personalAlarm\', type=2, status=1, seq=1, remark=\'查看人员报警信息\', operator=\'ps\', operate_time=2019-05-28 15:42:06.625, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:42:06', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (324, 4, 0, '', 'AclInfo{id=0, code=\'20190528154227_72\', name=\'查看船舶报警信息\', aclModuleId=109, url=\'/map/shipAlarm\', type=2, status=1, seq=1, remark=\'查看船舶报警信息\', operator=\'ps\', operate_time=2019-05-28 15:42:27.466, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:42:27', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (325, 4, 0, '', 'AclInfo{id=0, code=\'20190528154246_77\', name=\'报警信息\', aclModuleId=109, url=\'/map/alarm\', type=2, status=1, seq=1, remark=\'报警信息\', operator=\'ps\', operate_time=2019-05-28 15:42:46.935, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:42:46', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (326, 4, 0, '', 'AclInfo{id=0, code=\'20190528154309_89\', name=\'报警处理信息\', aclModuleId=109, url=\'/map/inspect\', type=2, status=1, seq=1, remark=\'报警处理信息\', operator=\'ps\', operate_time=2019-05-28 15:43:09.165, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:43:09', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (327, 4, 0, '', 'AclInfo{id=0, code=\'20190528154328_74\', name=\'养护信息\', aclModuleId=109, url=\'/map/maintain\', type=2, status=1, seq=1, remark=\'养护信息\', operator=\'ps\', operate_time=2019-05-28 15:43:28.961, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:43:29', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (328, 4, 0, '', 'AclInfo{id=0, code=\'20190528154349_95\', name=\'下方详细信息显示内容\', aclModuleId=109, url=\'/map/monitorGrid\', type=2, status=1, seq=1, remark=\'下方详细信息显示内容\', operator=\'ps\', operate_time=2019-05-28 15:43:49.413, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:43:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (329, 4, 0, '', 'AclInfo{id=0, code=\'20190528154431_77\', name=\'报警详细信息\', aclModuleId=109, url=\'/map/gridAlarm\', type=2, status=1, seq=1, remark=\'报警详细信息\', operator=\'ps\', operate_time=2019-05-28 15:44:31.05, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:44:31', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (330, 4, 0, '', 'AclInfo{id=0, code=\'20190528154450_81\', name=\'取证列表取证详细信息\', aclModuleId=109, url=\'/map/gridRiver\', type=2, status=1, seq=1, remark=\'取证列表取证详细信息\', operator=\'ps\', operate_time=2019-05-28 15:44:50.721, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:44:50', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (331, 4, 0, '', 'AclInfo{id=0, code=\'20190528154525_61\', name=\'市区取证统计信息\', aclModuleId=109, url=\'/map/gridCityRegionStatistics\', type=2, status=1, seq=1, remark=\'市区取证统计信息\', operator=\'ps\', operate_time=2019-05-28 15:45:25.743, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:45:25', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (332, 4, 0, '', 'AclInfo{id=0, code=\'20190528154551_0\', name=\'镇村取证统计信息\', aclModuleId=109, url=\'/map/gridTownRegionStatistics\', type=2, status=1, seq=1, remark=\'镇村取证统计信息\', operator=\'ps\', operate_time=2019-05-28 15:45:51.203, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:45:51', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (333, 4, 0, '', 'AclInfo{id=0, code=\'20190528154637_57\', name=\'作战图养护信息\', aclModuleId=109, url=\'/map/gridInspect\', type=2, status=1, seq=1, remark=\'作战图养护信息\', operator=\'ps\', operate_time=2019-05-28 15:46:37.597, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:46:37', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (334, 4, 0, '', 'AclInfo{id=0, code=\'20190528154705_42\', name=\'作战图报警信息\', aclModuleId=109, url=\'/map/gridWork\', type=2, status=1, seq=1, remark=\'作战图报警信息\', operator=\'ps\', operate_time=2019-05-28 15:47:05.209, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:47:05', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (335, 4, 0, '', 'AclInfo{id=0, code=\'20190528154725_11\', name=\'水利设施报警信息\', aclModuleId=109, url=\'/map/gridFacility\', type=2, status=1, seq=1, remark=\'水利设施报警信息\', operator=\'ps\', operate_time=2019-05-28 15:47:25.536, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:47:25', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (336, 4, 0, '', 'AclInfo{id=0, code=\'20190528154751_47\', name=\'作战图人员信息\', aclModuleId=109, url=\'/map/gridPersonnel\', type=2, status=1, seq=1, remark=\'作战图人员信息\', operator=\'ps\', operate_time=2019-05-28 15:47:51.744, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:47:51', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (337, 4, 0, '', 'AclInfo{id=0, code=\'20190528154820_83\', name=\'新闻\', aclModuleId=109, url=\'/map/news\', type=2, status=1, seq=1, remark=\'新闻\', operator=\'ps\', operate_time=2019-05-28 15:48:20.76, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:48:20', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (338, 4, 0, '', 'AclInfo{id=0, code=\'20190528154847_37\', name=\'作战图新闻\', aclModuleId=109, url=\'/map/gridNews\', type=2, status=1, seq=1, remark=\'作战图新闻\', operator=\'ps\', operate_time=2019-05-28 15:48:47.42, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:48:47', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (339, 4, 0, '', 'AclInfo{id=0, code=\'20190528155106_2\', name=\'作战图下方Tab\', aclModuleId=109, url=\'/map/tabBoard\', type=2, status=1, seq=1, remark=\'作战图下方Tab\', operator=\'ps\', operate_time=2019-05-28 15:51:06.557, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 15:51:06', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (340, 4, 0, '', 'AclInfo{id=0, code=\'20190528163243_82\', name=\'添加圩区\', aclModuleId=86, url=\'/damDomain/addDam\', type=2, status=1, seq=1, remark=\'添加圩区\', operator=\'ps\', operate_time=2019-05-28 16:32:43.22, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 16:32:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (341, 4, 0, '', 'AclInfo{id=0, code=\'20190528163421_52\', name=\'更新圩区\', aclModuleId=86, url=\'/damDomain/updateDam\', type=2, status=1, seq=1, remark=\'更新圩区\', operator=\'ps\', operate_time=2019-05-28 16:34:21.219, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 16:34:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (342, 4, 0, '', 'AclInfo{id=0, code=\'20190528163959_90\', name=\'删除圩区\', aclModuleId=86, url=\'/damDomain/deleteDamById\', type=2, status=1, seq=1, remark=\'删除圩区\', operator=\'ps\', operate_time=2019-05-28 16:39:59.849, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 16:39:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (343, 4, 0, '', 'AclInfo{id=0, code=\'20190528164106_39\', name=\'查询圩区\', aclModuleId=86, url=\'/damDomain/findDamByCondition\', type=2, status=1, seq=1, remark=\'查询圩区\', operator=\'ps\', operate_time=2019-05-28 16:41:06.82, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 16:41:06', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (344, 4, 0, '', 'AclInfo{id=0, code=\'20190528164216_82\', name=\'导出圩区\', aclModuleId=86, url=\'/damDomain/export\', type=2, status=1, seq=1, remark=\'导出圩区\', operator=\'ps\', operate_time=2019-05-28 16:42:16.162, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 16:42:16', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (345, 4, 0, '', 'AclInfo{id=0, code=\'20190528164347_34\', name=\'导入圩区\', aclModuleId=73, url=\'/damDomain/import\', type=2, status=1, seq=1, remark=\'导入圩区\', operator=\'ps\', operate_time=2019-05-28 16:43:47.968, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 16:43:48', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (346, 4, 0, '', 'AclInfo{id=0, code=\'20190528175707_20\', name=\'设施总数分类\', aclModuleId=109, url=\'/count/facilityCountByGroupOnther\', type=2, status=1, seq=1, remark=\'设施总数分类\', operator=\'ps\', operate_time=2019-05-28 17:57:07.644, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 17:57:07', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (347, 4, 0, '', 'AclInfo{id=0, code=\'20190528175751_30\', name=\'河流分类\', aclModuleId=109, url=\'/count/riverCountByGroup\', type=2, status=1, seq=1, remark=\'河流分类\', operator=\'ps\', operate_time=2019-05-28 17:57:51.87, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 17:57:51', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (348, 4, 0, '', 'AclInfo{id=0, code=\'20190528175857_34\', name=\'水闸报警（饼图）\', aclModuleId=109, url=\'/count/runAlarmCountByGroup\', type=2, status=1, seq=1, remark=\'水闸报警（饼图）\', operator=\'ps\', operate_time=2019-05-28 17:58:57.094, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 17:58:57', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (349, 4, 0, '', 'AclInfo{id=0, code=\'20190528175953_22\', name=\'水闸整改\', aclModuleId=109, url=\'/count/reportAlarmCountByGroup\', type=2, status=1, seq=1, remark=\'水闸整改\', operator=\'ps\', operate_time=2019-05-28 17:59:53.768, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 17:59:53', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (350, 4, 0, '', 'AclInfo{id=0, code=\'20190528180143_96\', name=\'水闸整改（滚动tab）\', aclModuleId=109, url=\'/count/facilityReportCount\', type=2, status=1, seq=1, remark=\'水闸整改（滚动tab）\', operator=\'ps\', operate_time=2019-05-28 18:01:43.967, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:01:44', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (351, 4, 0, '', 'AclInfo{id=0, code=\'20190528182629_94\', name=\'水泵列表\', aclModuleId=82, url=\'/pump/listPump\', type=2, status=1, seq=1, remark=\'水泵列表\', operator=\'ps\', operate_time=2019-05-28 18:26:29.027, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:26:29', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (352, 4, 0, '', 'AclInfo{id=0, code=\'20190528182706_36\', name=\'添加水泵\', aclModuleId=82, url=\'/pump/add\', type=2, status=1, seq=1, remark=\'添加水泵\', operator=\'ps\', operate_time=2019-05-28 18:27:06.764, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:27:06', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (353, 4, 0, '', 'AclInfo{id=0, code=\'20190528182733_0\', name=\'修改水泵\', aclModuleId=82, url=\'/pump/update\', type=2, status=1, seq=1, remark=\'修改水泵\', operator=\'ps\', operate_time=2019-05-28 18:27:33.767, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:27:33', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (354, 4, 0, '', 'AclInfo{id=0, code=\'20190528182807_90\', name=\'删除水泵\', aclModuleId=82, url=\'/pump/deletePumpById\', type=2, status=1, seq=1, remark=\'删除水泵\', operator=\'ps\', operate_time=2019-05-28 18:28:07.089, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:28:07', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (355, 4, 0, '', 'AclInfo{id=0, code=\'20190528182841_55\', name=\'导出水泵信息\', aclModuleId=82, url=\'/pump/exportPump\', type=2, status=1, seq=1, remark=\'导出水泵信息\', operator=\'ps\', operate_time=2019-05-28 18:28:41.939, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:28:41', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (356, 4, 0, '', 'AclInfo{id=0, code=\'20190528182921_39\', name=\'网络设备列表\', aclModuleId=84, url=\'/network/listNetwork\', type=2, status=1, seq=1, remark=\'网络设备列表\', operator=\'ps\', operate_time=2019-05-28 18:29:21.657, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:29:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (357, 4, 0, '', 'AclInfo{id=0, code=\'20190528182949_55\', name=\'添加网络设备\', aclModuleId=84, url=\'/network/add\', type=2, status=1, seq=1, remark=\'添加网络设备\', operator=\'ps\', operate_time=2019-05-28 18:29:49.612, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:29:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (358, 4, 0, '', 'AclInfo{id=0, code=\'20190528183015_45\', name=\'修改网络设备\', aclModuleId=84, url=\'/network/update\', type=2, status=1, seq=1, remark=\'修改网络设备\', operator=\'ps\', operate_time=2019-05-28 18:30:15.508, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:30:15', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (359, 4, 0, '', 'AclInfo{id=0, code=\'20190528183046_29\', name=\'删除网络设备\', aclModuleId=84, url=\'/network/deleteNetworkById\', type=2, status=1, seq=1, remark=\'删除网络设备\', operator=\'ps\', operate_time=2019-05-28 18:30:46.974, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:30:47', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (360, 4, 0, '', 'AclInfo{id=0, code=\'20190528183117_93\', name=\'导出网络设备信息\', aclModuleId=84, url=\'/network/exportNetwork\', type=2, status=1, seq=1, remark=\'导出网络设备信息\', operator=\'ps\', operate_time=2019-05-28 18:31:17.799, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:31:17', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (361, 4, 0, '', 'AclInfo{id=0, code=\'20190528183206_86\', name=\'实时视频树结构\', aclModuleId=52, url=\'/monitoring/damShowTree2\', type=2, status=1, seq=1, remark=\'实时视频树结构\', operator=\'ps\', operate_time=2019-05-28 18:32:06.799, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:32:06', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (362, 4, 0, '', 'AclInfo{id=0, code=\'20190528183257_67\', name=\'水闸监控树结构\', aclModuleId=53, url=\'/monitoring/damShowTree\', type=2, status=1, seq=1, remark=\'水闸监控树结构\', operator=\'ps\', operate_time=2019-05-28 18:32:57.109, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:32:57', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (363, 4, 0, '', 'AclInfo{id=0, code=\'20190528183447_66\', name=\'日常巡查记录表搜索\', aclModuleId=57, url=\'/inspection/inspRecordQuery\', type=2, status=1, seq=1, remark=\'日常巡查记录表搜索\', operator=\'ps\', operate_time=2019-05-28 18:34:47.448, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:34:47', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (364, 4, 0, '', 'AclInfo{id=0, code=\'20190528183523_14\', name=\'日常巡查记录表导出\', aclModuleId=57, url=\'/inspection/inspRecordExport\', type=2, status=1, seq=1, remark=\'日常巡查记录表导出\', operator=\'ps\', operate_time=2019-05-28 18:35:23.219, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:35:23', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (365, 4, 0, '', 'AclInfo{id=0, code=\'20190528183602_67\', name=\'水利整改汇总表搜索\', aclModuleId=59, url=\'/conservancyMaintenance/getConMainList\', type=2, status=1, seq=1, remark=\'水利整改汇总表搜索\', operator=\'ps\', operate_time=2019-05-28 18:36:02.032, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:36:02', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (366, 4, 0, '', 'AclInfo{id=0, code=\'20190528183646_40\', name=\'水利整改汇总表导出\', aclModuleId=59, url=\'/conservancyMaintenance/exportConMain\', type=2, status=1, seq=1, remark=\'水利整改汇总表导出\', operator=\'ps\', operate_time=2019-05-28 18:36:46.679, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:36:46', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (367, 4, 0, '', 'AclInfo{id=0, code=\'20190528183739_50\', name=\'水利整改记录表搜索\', aclModuleId=58, url=\'/conservancyMaintenance/listConMainImage\', type=2, status=1, seq=1, remark=\'水利整改记录表搜索\', operator=\'ps\', operate_time=2019-05-28 18:37:39.953, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:37:40', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (368, 4, 0, '', 'AclInfo{id=0, code=\'20190528183814_79\', name=\'绿化养护月报搜索\', aclModuleId=60, url=\'/greenMain/getGreenRecordList\', type=2, status=1, seq=1, remark=\'绿化养护月报搜索\', operator=\'ps\', operate_time=2019-05-28 18:38:14.975, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:38:15', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (369, 4, 0, '', 'AclInfo{id=0, code=\'20190528183844_83\', name=\'绿化养护月报导出\', aclModuleId=60, url=\'/greenMain/exportGreenRecord\', type=2, status=1, seq=1, remark=\'绿化养护月报导出\', operator=\'ps\', operate_time=2019-05-28 18:38:44.413, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:38:44', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (370, 4, 0, '', 'AclInfo{id=0, code=\'20190528183912_49\', name=\'绿化养护月报新增\', aclModuleId=60, url=\'/greenMain/addGreenRecordList\', type=2, status=1, seq=1, remark=\'绿化养护月报新增\', operator=\'ps\', operate_time=2019-05-28 18:39:12.836, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:39:12', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (371, 4, 0, '', 'AclInfo{id=0, code=\'20190528183939_18\', name=\'绿化养护记录表搜索\', aclModuleId=61, url=\'/greenMain/getGreenTotalRecordList\', type=2, status=1, seq=1, remark=\'绿化养护记录表搜索\', operator=\'ps\', operate_time=2019-05-28 18:39:39.652, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:39:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (372, 4, 0, '', 'AclInfo{id=0, code=\'20190528184006_53\', name=\'绿化养护记录表导出\', aclModuleId=61, url=\'/greenMain/greenTotalRecordExport\', type=2, status=1, seq=1, remark=\'绿化养护记录表导出\', operator=\'ps\', operate_time=2019-05-28 18:40:06.562, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:40:06', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (373, 4, 0, '', 'AclInfo{id=0, code=\'20190528184040_79\', name=\'绿化养护记录表添加\', aclModuleId=61, url=\'/greenMain/addGreenTotalRecord\', type=2, status=1, seq=1, remark=\'绿化养护记录表添加\', operator=\'ps\', operate_time=2019-05-28 18:40:40.555, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:40:40', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (374, 4, 0, '', 'AclInfo{id=0, code=\'20190528184122_36\', name=\'柴油发电机组搜索\', aclModuleId=62, url=\'/dynamotor/getRecordList\', type=2, status=1, seq=1, remark=\'柴油发电机组搜索\', operator=\'ps\', operate_time=2019-05-28 18:41:22.082, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:41:22', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (375, 4, 0, '', 'AclInfo{id=0, code=\'20190528184148_20\', name=\'柴油发电机组新增\', aclModuleId=62, url=\'/dynamotor/addRecord\', type=2, status=1, seq=1, remark=\'柴油发电机组新增\', operator=\'ps\', operate_time=2019-05-28 18:41:48.961, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:41:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (376, 4, 0, '', 'AclInfo{id=0, code=\'20190528184223_46\', name=\'柴油发电机组删除\', aclModuleId=62, url=\'/dynamotor/deleteRecord\', type=2, status=1, seq=1, remark=\'柴油发电机组删除\', operator=\'ps\', operate_time=2019-05-28 18:42:23.609, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:42:23', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (377, 4, 0, '', 'AclInfo{id=0, code=\'20190528184310_64\', name=\'柴油发电机组导出\', aclModuleId=62, url=\'/dynamotor/exportRecord\', type=2, status=1, seq=1, remark=\'柴油发电机组导出\', operator=\'ps\', operate_time=2019-05-28 18:43:10.97, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:43:11', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (378, 4, 0, '', 'AclInfo{id=0, code=\'20190528184330_51\', name=\'柴油发电机组导入\', aclModuleId=62, url=\'/dynamotor/importRecord\', type=2, status=1, seq=1, remark=\'柴油发电机组导入\', operator=\'ps\', operate_time=2019-05-28 18:43:30.751, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:43:30', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (379, 4, 0, '', 'AclInfo{id=0, code=\'20190528184426_41\', name=\'巡查工作查询\', aclModuleId=91, url=\'/inspection/coverRateQuery\', type=2, status=1, seq=1, remark=\'巡查工作查询\', operator=\'ps\', operate_time=2019-05-28 18:44:26.287, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:44:26', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (380, 4, 0, '', 'AclInfo{id=0, code=\'20190528184519_13\', name=\'物资养护信息搜索\', aclModuleId=97, url=\'/goodsMaintenance/getGoodsMainByCondition\', type=2, status=1, seq=1, remark=\'物资养护信息搜索\', operator=\'ps\', operate_time=2019-05-28 18:45:19.795, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:45:19', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (381, 4, 0, '', 'AclInfo{id=0, code=\'20190528184549_36\', name=\'物资养护信息新增\', aclModuleId=97, url=\'/goodsMaintenance/addMain\', type=2, status=1, seq=1, remark=\'物资养护信息新增\', operator=\'ps\', operate_time=2019-05-28 18:45:49.201, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:45:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (382, 4, 0, '', 'AclInfo{id=0, code=\'20190528184626_37\', name=\'物资巡检信息索索\', aclModuleId=98, url=\'/goodsInspection/getGoodsInsByCondition\', type=2, status=1, seq=1, remark=\'物资巡检信息索索\', operator=\'ps\', operate_time=2019-05-28 18:46:26.938, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:46:26', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (383, 4, 0, '', 'AclInfo{id=0, code=\'20190528184753_46\', name=\'物资巡检信息新增\', aclModuleId=98, url=\'/goodsInspection/add\', type=2, status=1, seq=1, remark=\'物资巡检信息新增\', operator=\'ps\', operate_time=2019-05-28 18:47:53.69, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-28 18:47:53', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (384, 4, 0, '', 'AclInfo{id=0, code=\'20190529095515_78\', name=\'新增防汛物资状态\', aclModuleId=95, url=\'/status/addStatus\', type=2, status=1, seq=1, remark=\'新增防汛物资状态\', operator=\'ps\', operate_time=2019-05-29 09:55:15.363, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 09:55:15', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (385, 4, 0, '', 'AclInfo{id=0, code=\'20190529095616_46\', name=\'删除防汛物资状态\', aclModuleId=95, url=\'/status/delStatus\', type=2, status=1, seq=1, remark=\'删除防汛物资状态\', operator=\'ps\', operate_time=2019-05-29 09:56:16.58, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 09:56:16', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (386, 4, 0, '', 'AclInfo{id=0, code=\'20190529095654_74\', name=\'修改防汛物资状态\', aclModuleId=95, url=\'/status/updStatus\', type=2, status=1, seq=1, remark=\'修改防汛物资状态\', operator=\'ps\', operate_time=2019-05-29 09:56:54.44, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 09:56:54', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (387, 4, 0, '', 'AclInfo{id=0, code=\'20190529095748_62\', name=\'查询防汛物资状态\', aclModuleId=95, url=\'/status/findStatusByCondition\', type=2, status=1, seq=1, remark=\'查询防汛物资状态\', operator=\'ps\', operate_time=2019-05-29 09:57:48.287, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 09:57:48', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (388, 4, 0, '', 'AclInfo{id=0, code=\'20190529095844_32\', name=\'导出防汛物资状态\', aclModuleId=95, url=\'/status/exportStatus\', type=2, status=1, seq=1, remark=\'导出防汛物资状态\', operator=\'ps\', operate_time=2019-05-29 09:58:44.402, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 09:58:44', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (389, 4, 0, '', 'AclInfo{id=0, code=\'20190529100543_37\', name=\'新增物资出入库信息\', aclModuleId=96, url=\'/status/addCheckinout\', type=2, status=1, seq=1, remark=\'新增物资出入库信息\', operator=\'ps\', operate_time=2019-05-29 10:05:43.777, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:05:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (390, 4, 0, '', 'AclInfo{id=0, code=\'20190529100616_92\', name=\'删除物资出入库信息\', aclModuleId=96, url=\'/status/delCheckinout\', type=2, status=1, seq=1, remark=\'删除物资出入库信息\', operator=\'ps\', operate_time=2019-05-29 10:06:16.556, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:06:16', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (391, 4, 0, '', 'AclInfo{id=0, code=\'20190529100642_4\', name=\'更新物资出入库信息\', aclModuleId=96, url=\'/status/updCheckinout\', type=2, status=1, seq=1, remark=\'更新物资出入库信息\', operator=\'ps\', operate_time=2019-05-29 10:06:42.348, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:06:42', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (392, 4, 0, '', 'AclInfo{id=0, code=\'20190529100718_35\', name=\'查询物资流动信息\', aclModuleId=96, url=\'/status/findFlow\', type=2, status=1, seq=1, remark=\'查询物资流动信息\', operator=\'ps\', operate_time=2019-05-29 10:07:18.226, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:07:18', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (393, 4, 0, '', 'AclInfo{id=0, code=\'20190529100803_45\', name=\'导出物资流动信息\', aclModuleId=96, url=\'/status/exportCheckinout\', type=2, status=1, seq=1, remark=\'导出物资流动信息\', operator=\'ps\', operate_time=2019-05-29 10:08:03.002, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:08:03', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (394, 4, 0, '', 'AclInfo{id=0, code=\'20190529100958_12\', name=\'添加卫生执勤\', aclModuleId=68, url=\'/healthDut/addHealthDutyRow\', type=2, status=1, seq=1, remark=\'添加卫生执勤，注意是添加一行\', operator=\'ps\', operate_time=2019-05-29 10:09:58.977, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:09:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (395, 4, 0, '', 'AclInfo{id=0, code=\'20190529101053_36\', name=\'删除卫生记录\', aclModuleId=68, url=\'/healthDut/delHealthDuty\', type=2, status=1, seq=1, remark=\'删除卫生记录，注意是删除一行\', operator=\'ps\', operate_time=2019-05-29 10:10:53.95, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:10:54', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (396, 4, 0, '', 'AclInfo{id=0, code=\'20190529101138_98\', name=\'更新卫生记录\', aclModuleId=68, url=\'/healthDut/updHealthDutyAll\', type=2, status=1, seq=1, remark=\'更新卫生记录，注意是更新页面全部\', operator=\'ps\', operate_time=2019-05-29 10:11:38.585, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:11:38', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (397, 4, 0, '', 'AclInfo{id=0, code=\'20190529101220_45\', name=\'查询卫生记录\', aclModuleId=68, url=\'/healthDut/findHealthDutyByCondition\', type=2, status=1, seq=1, remark=\'查询卫生记录\', operator=\'ps\', operate_time=2019-05-29 10:12:20.938, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:12:20', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (398, 4, 0, '', 'AclInfo{id=0, code=\'20190529101251_25\', name=\'导出卫生记录\', aclModuleId=68, url=\'/healthDut/export\', type=2, status=1, seq=1, remark=\'导出卫生记录\', operator=\'ps\', operate_time=2019-05-29 10:12:51.692, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:12:51', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (399, 4, 0, '', 'AclInfo{id=0, code=\'20190529101320_70\', name=\'上传卫生记录\', aclModuleId=68, url=\'/healthDut/import\', type=2, status=1, seq=1, remark=\'上传卫生记录\', operator=\'ps\', operate_time=2019-05-29 10:13:20.597, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:13:20', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (400, 4, 0, '', 'AclInfo{id=0, code=\'20190529101506_79\', name=\'查泵闸历史工况\', aclModuleId=73, url=\'/history/findPumpAndGateHistory\', type=2, status=1, seq=1, remark=\'查泵闸历史工况\', operator=\'ps\', operate_time=2019-05-29 10:15:06.821, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:15:06', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (401, 4, 0, '', 'AclInfo{id=0, code=\'20190529101539_27\', name=\'导出泵闸历史工况\', aclModuleId=73, url=\'/history/exportPumpAndGate\', type=2, status=1, seq=1, remark=\'导出泵闸的历史工况\', operator=\'ps\', operate_time=2019-05-29 10:15:39.551, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:15:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (402, 4, 0, '', 'AclInfo{id=0, code=\'20190529102009_18\', name=\'添加泵闸运行记录\', aclModuleId=63, url=\'/operationRecord/addPumGate\', type=2, status=1, seq=1, remark=\'添加泵闸运行记录\', operator=\'ps\', operate_time=2019-05-29 10:20:09.143, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:20:09', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (403, 4, 0, '', 'AclInfo{id=0, code=\'20190529102126_69\', name=\'删除闸门运行记录\', aclModuleId=63, url=\'/operationRecord/delPumGate\', type=2, status=1, seq=1, remark=\'删除闸门运行记录\', operator=\'ps\', operate_time=2019-05-29 10:21:26.633, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:21:26', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (404, 4, 0, '', 'AclInfo{id=0, code=\'20190529102150_25\', name=\'更新泵闸运行记录\', aclModuleId=63, url=\'/operationRecord/updPumGate\', type=2, status=1, seq=1, remark=\'更新泵闸运行记录\', operator=\'ps\', operate_time=2019-05-29 10:21:50.283, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:21:50', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (405, 4, 0, '', 'AclInfo{id=0, code=\'20190529102220_93\', name=\'查询泵闸运行记录\', aclModuleId=63, url=\'/operationRecord/findPumGate\', type=2, status=1, seq=1, remark=\'查询泵闸运行记录\', operator=\'ps\', operate_time=2019-05-29 10:22:20.354, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:22:20', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (406, 4, 0, '', 'AclInfo{id=0, code=\'20190529102244_69\', name=\'导出泵闸运行记录\', aclModuleId=63, url=\'/operationRecord/export\', type=2, status=1, seq=1, remark=\'导出泵闸运行记录\', operator=\'ps\', operate_time=2019-05-29 10:22:44.554, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:22:44', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (407, 4, 0, '', 'AclInfo{id=0, code=\'20190529102319_46\', name=\'上传泵闸运行记录\', aclModuleId=63, url=\'/operationRecord/import\', type=2, status=1, seq=1, remark=\'上传泵闸运行记录\', operator=\'ps\', operate_time=2019-05-29 10:23:19.462, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:23:19', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (408, 4, 0, '', 'AclInfo{id=0, code=\'20190529102509_3\', name=\'添加行政区\', aclModuleId=87, url=\'/region/addRegion\', type=2, status=1, seq=1, remark=\'添加行政区\', operator=\'ps\', operate_time=2019-05-29 10:25:09.406, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:25:09', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (409, 4, 0, '', 'AclInfo{id=0, code=\'20190529102547_2\', name=\'更新行政区\', aclModuleId=87, url=\'/region/updateRegion\', type=2, status=1, seq=1, remark=\'更新行政区\', operator=\'ps\', operate_time=2019-05-29 10:25:47.162, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:25:47', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (410, 4, 0, '', 'AclInfo{id=0, code=\'20190529102617_32\', name=\'删除行政区\', aclModuleId=87, url=\'/region/deleteRegionById\', type=2, status=1, seq=1, remark=\'删除行政区\', operator=\'ps\', operate_time=2019-05-29 10:26:17.533, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:26:17', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (411, 4, 0, '', 'AclInfo{id=0, code=\'20190529103010_18\', name=\'删除卫生记录\', aclModuleId=68, url=\'/healthDut/delHealthDuty\', type=2, status=1, seq=1, remark=\'删除卫生记录，注意是删除一行\', operator=\'ps\', operate_time=2019-05-29 10:30:10.016, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:30:10', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (412, 4, 0, '', 'AclInfo{id=0, code=\'20190529103107_78\', name=\'更新卫生记录\', aclModuleId=68, url=\'/healthDut/updHealthDutyAll\', type=2, status=1, seq=1, remark=\'更新卫生记录，注意是页面全部数据\', operator=\'ps\', operate_time=2019-05-29 10:31:07.732, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:31:07', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (413, 4, 0, '', 'AclInfo{id=0, code=\'20190529103221_21\', name=\'查询行政区\', aclModuleId=87, url=\'/region/findRegion\', type=2, status=1, seq=1, remark=\'查询行政区\', operator=\'ps\', operate_time=2019-05-29 10:32:21.551, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:32:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (414, 4, 0, '', 'AclInfo{id=0, code=\'20190529103258_88\', name=\'导出行政区\', aclModuleId=87, url=\'/region/export\', type=2, status=1, seq=1, remark=\'导出行政区\', operator=\'ps\', operate_time=2019-05-29 10:32:58.347, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:32:58', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (415, 4, 0, '', 'AclInfo{id=0, code=\'20190529103330_74\', name=\'导入行政区\', aclModuleId=87, url=\'/region/import\', type=2, status=1, seq=1, remark=\'导入行政区\', operator=\'ps\', operate_time=2019-05-29 10:33:30.605, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:33:30', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (416, 4, 0, '', 'AclInfo{id=0, code=\'20190529103622_1\', name=\'添加河流\', aclModuleId=85, url=\'/river/addRiver\', type=2, status=1, seq=1, remark=\'添加河流\', operator=\'ps\', operate_time=2019-05-29 10:36:22.68, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:36:22', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (417, 4, 0, '', 'AclInfo{id=0, code=\'20190529103659_47\', name=\'更新河流\', aclModuleId=85, url=\'/river/updateRiver\', type=2, status=1, seq=1, remark=\'更新河流\', operator=\'ps\', operate_time=2019-05-29 10:36:59.471, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:36:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (418, 4, 0, '', 'AclInfo{id=0, code=\'20190529103745_91\', name=\'删除河流\', aclModuleId=85, url=\'/river/deleteRiverById\', type=2, status=1, seq=1, remark=\'删除河流\', operator=\'ps\', operate_time=2019-05-29 10:37:45.547, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:37:45', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (419, 4, 0, '', 'AclInfo{id=0, code=\'20190529103838_16\', name=\'查询河流信息\', aclModuleId=85, url=\'/river/findRiverByCondition\', type=2, status=1, seq=1, remark=\'查询河流信息\', operator=\'ps\', operate_time=2019-05-29 10:38:38.907, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:38:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (420, 4, 0, '', 'AclInfo{id=0, code=\'20190529103903_3\', name=\'导出河流\', aclModuleId=85, url=\'/river/export\', type=2, status=1, seq=1, remark=\'导出河流\', operator=\'ps\', operate_time=2019-05-29 10:39:03.386, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:39:03', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (421, 4, 0, '', 'AclInfo{id=0, code=\'20190529103926_31\', name=\'导入河流\', aclModuleId=85, url=\'/river/import\', type=2, status=1, seq=1, remark=\'导入河流\', operator=\'ps\', operate_time=2019-05-29 10:39:26.802, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:39:26', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (422, 4, 0, '', 'AclInfo{id=0, code=\'20190529104014_69\', name=\'添加船舶过闸记录\', aclModuleId=67, url=\'添加船舶过闸记录\', type=2, status=1, seq=1, remark=\'添加船舶过闸记录\', operator=\'ps\', operate_time=2019-05-29 10:40:14.25, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:40:14', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (423, 4, 0, '', 'AclInfo{id=0, code=\'20190529104055_97\', name=\'删除船舶过闸记录\', aclModuleId=67, url=\'/ship/delShipCross\', type=2, status=1, seq=1, remark=\'删除船舶过闸记录\', operator=\'ps\', operate_time=2019-05-29 10:40:55.224, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:40:55', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (424, 4, 0, '', 'AclInfo{id=0, code=\'20190529104121_45\', name=\'更新船舶过闸记录\', aclModuleId=67, url=\'/ship/updShipCross\', type=2, status=1, seq=1, remark=\'更新船舶过闸记录\', operator=\'ps\', operate_time=2019-05-29 10:41:21.281, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:41:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (425, 4, 0, '', 'AclInfo{id=0, code=\'20190529104150_69\', name=\'查找船舶过闸记录\', aclModuleId=67, url=\'/ship/findShipCrossByCondition\', type=2, status=1, seq=1, remark=\'查找船舶过闸记录\', operator=\'ps\', operate_time=2019-05-29 10:41:50.661, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:41:50', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (426, 4, 0, '', 'AclInfo{id=0, code=\'20190529104221_66\', name=\'上传船舶过闸记录\', aclModuleId=67, url=\'/ship/export\', type=2, status=1, seq=1, remark=\'上传船舶过闸记录\', operator=\'ps\', operate_time=2019-05-29 10:42:21.708, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:42:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (427, 4, 0, '', 'AclInfo{id=0, code=\'20190529104301_0\', name=\'上传船舶过记录\', aclModuleId=67, url=\'/ship/import\', type=2, status=1, seq=1, remark=\'上传船舶过记录\', operator=\'ps\', operate_time=2019-05-29 10:43:01.715, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:43:01', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (428, 4, 0, '', 'AclInfo{id=0, code=\'20190529104425_0\', name=\'增加交接班记录\', aclModuleId=66, url=\'/waterHandover/addHandover\', type=2, status=1, seq=1, remark=\'增加交接班记录\', operator=\'ps\', operate_time=2019-05-29 10:44:25.957, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:44:26', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (429, 4, 0, '', 'AclInfo{id=0, code=\'20190529104449_27\', name=\'删除交接班记录\', aclModuleId=66, url=\'/waterHandover/delHandover\', type=2, status=1, seq=1, remark=\'删除交接班记录\', operator=\'ps\', operate_time=2019-05-29 10:44:49.005, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:44:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (430, 4, 0, '', 'AclInfo{id=0, code=\'20190529104514_54\', name=\'更新交接班记录\', aclModuleId=66, url=\'/waterHandover/updHandover\', type=2, status=1, seq=1, remark=\'更新交接班记录\', operator=\'ps\', operate_time=2019-05-29 10:45:14.257, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:45:14', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (431, 4, 0, '', 'AclInfo{id=0, code=\'20190529104651_9\', name=\'查出交接班记录\', aclModuleId=66, url=\'/waterHandover/findHandoverByCondition\', type=2, status=1, seq=1, remark=\'查出交接班记录\', operator=\'ps\', operate_time=2019-05-29 10:46:51.768, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:46:51', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (432, 4, 0, '', 'AclInfo{id=0, code=\'20190529104721_89\', name=\'导出交接班记录\', aclModuleId=66, url=\'/waterHandover/export\', type=2, status=1, seq=1, remark=\'导出交接班记录\', operator=\'ps\', operate_time=2019-05-29 10:47:21.625, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:47:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (433, 4, 0, '', 'AclInfo{id=0, code=\'20190529104749_26\', name=\'上传交接班记录\', aclModuleId=66, url=\'/waterHandover/import\', type=2, status=1, seq=1, remark=\'上传交接班记录\', operator=\'ps\', operate_time=2019-05-29 10:47:49.594, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:47:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (434, 4, 0, '', 'AclInfo{id=0, code=\'20190529104947_9\', name=\'添加调水记录\', aclModuleId=64, url=\'/waterTransfer/addWaterTransferAndTmage\', type=2, status=1, seq=1, remark=\'添加调水记录：汇总和照片\', operator=\'ps\', operate_time=2019-05-29 10:49:47.97, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:49:48', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (435, 4, 0, '', 'AclInfo{id=0, code=\'20190529105023_81\', name=\'删除调水记录汇总\', aclModuleId=64, url=\'/waterTransfer/delWaterTransfer\', type=2, status=1, seq=1, remark=\'删除调水记录汇总，没有删除图片\', operator=\'ps\', operate_time=2019-05-29 10:50:23.69, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:50:23', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (436, 4, 0, '', 'AclInfo{id=0, code=\'20190529105055_85\', name=\'更新调水记录\', aclModuleId=64, url=\'/waterTransfer/updWaterTransfer\', type=2, status=1, seq=1, remark=\'更新调水记录\', operator=\'ps\', operate_time=2019-05-29 10:50:55.131, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:50:55', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (437, 4, 0, '', 'AclInfo{id=0, code=\'20190529105124_57\', name=\'查找调水记录\', aclModuleId=64, url=\'/waterTransfer/findWaterTransferBycondition\', type=2, status=1, seq=1, remark=\'查找调水记录\', operator=\'ps\', operate_time=2019-05-29 10:51:24.925, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:51:24', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (438, 4, 0, '', 'AclInfo{id=0, code=\'20190529105149_97\', name=\'导出调水记录\', aclModuleId=64, url=\'/waterTransfer/export\', type=2, status=1, seq=1, remark=\'导出调水记录\', operator=\'ps\', operate_time=2019-05-29 10:51:49.477, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:51:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (439, 4, 0, '', 'AclInfo{id=0, code=\'20190529105221_49\', name=\'导入调水记录\', aclModuleId=64, url=\'/waterTransfer/import\', type=2, status=1, seq=1, remark=\'导入调水记录\', operator=\'ps\', operate_time=2019-05-29 10:52:21.178, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:52:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (440, 4, 0, '', 'AclInfo{id=0, code=\'20190529105434_78\', name=\'导出调水照片\', aclModuleId=65, url=\'/waterTransfer/exportPicture\', type=2, status=1, seq=1, remark=\'导出调水照片\', operator=\'ps\', operate_time=2019-05-29 10:54:34.534, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 10:54:34', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (441, 4, 0, '', 'AclInfo{id=0, code=\'20190529111156_68\', name=\'新增人员\', aclModuleId=101, url=\'/personnel/add\', type=2, status=1, seq=1, remark=\'新增人员\', operator=\'ps\', operate_time=2019-05-29 11:11:56.951, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:11:57', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (442, 4, 0, '', 'AclInfo{id=0, code=\'20190529111217_79\', name=\'修改人员\', aclModuleId=101, url=\'/personnel/update\', type=2, status=1, seq=1, remark=\'修改人员\', operator=\'ps\', operate_time=2019-05-29 11:12:17.34, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:12:17', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (443, 4, 0, '', 'AclInfo{id=0, code=\'20190529111238_45\', name=\'删除人员\', aclModuleId=101, url=\'/personnel/deleteByPersonnelId\', type=2, status=1, seq=1, remark=\'删除人员\', operator=\'ps\', operate_time=2019-05-29 11:12:38.469, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:12:38', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (444, 4, 0, '', 'AclInfo{id=0, code=\'20190529111300_14\', name=\'删除公司人员\', aclModuleId=101, url=\'/personnel/deleteByCompanyId\', type=2, status=1, seq=1, remark=\'删除公司人员\', operator=\'ps\', operate_time=2019-05-29 11:13:00.32, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:13:00', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (445, 4, 0, '', 'AclInfo{id=0, code=\'20190529111322_54\', name=\'更新公司人员\', aclModuleId=101, url=\'/personnel/updateCompany\', type=2, status=1, seq=1, remark=\'更新公司人员\', operator=\'ps\', operate_time=2019-05-29 11:13:22.38, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:13:22', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (446, 4, 0, '', 'AclInfo{id=0, code=\'20190529111341_66\', name=\'查询人员列表\', aclModuleId=101, url=\'/personnel/query\', type=2, status=1, seq=1, remark=\'查询人员列表\', operator=\'ps\', operate_time=2019-05-29 11:13:41.928, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:13:41', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (447, 4, 0, '', 'AclInfo{id=0, code=\'20190529111403_92\', name=\'查询人员列表所有\', aclModuleId=101, url=\'/personnel/list\', type=2, status=1, seq=1, remark=\'查询人员列表所有\', operator=\'ps\', operate_time=2019-05-29 11:14:03.689, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:14:03', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (448, 4, 0, '', 'AclInfo{id=0, code=\'20190529111436_14\', name=\'修改功能资源\', aclModuleId=41, url=\'/rabc/role/update\', type=2, status=1, seq=1, remark=\'修改功能资源\', operator=\'ps\', operate_time=2019-05-29 11:14:36.67, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:14:36', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (449, 4, 0, '', 'AclInfo{id=0, code=\'20190529111514_42\', name=\'查询权限资源\', aclModuleId=41, url=\'/rabc/role/query/aclInfo\', type=2, status=1, seq=1, remark=\'查询权限资源\', operator=\'ps\', operate_time=2019-05-29 11:15:14.926, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:15:14', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (450, 4, 0, '', 'AclInfo{id=0, code=\'20190529111544_79\', name=\'查询用户管理列表\', aclModuleId=99, url=\'/user/list\', type=2, status=1, seq=1, remark=\'查询用户管理列表\', operator=\'ps\', operate_time=2019-05-29 11:15:44.181, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:15:44', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (451, 4, 0, '', 'AclInfo{id=0, code=\'20190529111607_76\', name=\'新增用户\', aclModuleId=99, url=\'/user/add\', type=2, status=1, seq=1, remark=\'新增用户\', operator=\'ps\', operate_time=2019-05-29 11:16:07.498, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:16:07', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (452, 4, 0, '', 'AclInfo{id=0, code=\'20190529111627_93\', name=\'修改用户\', aclModuleId=99, url=\'/user/update\', type=2, status=1, seq=1, remark=\'修改用户\', operator=\'ps\', operate_time=2019-05-29 11:16:27.609, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:16:27', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (453, 4, 0, '', 'AclInfo{id=0, code=\'20190529111649_45\', name=\'重置密码\', aclModuleId=99, url=\'/user/resetPwd\', type=2, status=1, seq=1, remark=\'重置密码\', operator=\'ps\', operate_time=2019-05-29 11:16:49.582, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:16:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (454, 4, 0, '', 'AclInfo{id=0, code=\'20190529111710_40\', name=\'批量删除用户\', aclModuleId=99, url=\'/user/deleteByIds\', type=2, status=1, seq=1, remark=\'批量删除用户\', operator=\'ps\', operate_time=2019-05-29 11:17:10.814, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:17:10', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (455, 4, 0, '', 'AclInfo{id=0, code=\'20190529111734_80\', name=\'删除用户\', aclModuleId=99, url=\'/user/remove\', type=2, status=1, seq=1, remark=\'删除用户\', operator=\'ps\', operate_time=2019-05-29 11:17:34.02, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:17:34', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (456, 4, 0, '', 'AclInfo{id=0, code=\'20190529112005_82\', name=\'检测用户名称\', aclModuleId=99, url=\'/user/checkName\', type=2, status=1, seq=1, remark=\'检测用户名称\', operator=\'ps\', operate_time=2019-05-29 11:20:05.51, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:20:05', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (457, 4, 0, '', 'AclInfo{id=0, code=\'20190529112028_64\', name=\'获取用户类型\', aclModuleId=99, url=\'/user/types\', type=2, status=1, seq=1, remark=\'获取用户类型\', operator=\'ps\', operate_time=2019-05-29 11:20:28.409, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 11:20:28', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (458, 4, 0, '', 'AclInfo{id=0, code=\'20190529133332_91\', name=\'首页数据统计功能\', aclModuleId=45, url=\'/facilityUnite/monitoring/queryAllCount\', type=2, status=1, seq=1, remark=\'获取各项统计数据\', operator=\'ps\', operate_time=2019-05-29 13:33:32.947, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:33:33', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (459, 4, 0, '', 'AclInfo{id=0, code=\'20190529133440_45\', name=\'设施工况综合查询接口\', aclModuleId=45, url=\'/facilityUnite/monitoring/queryAllFacilityWaterNew\', type=2, status=1, seq=1, remark=\'可根据条件查询设施的综合实时信息\', operator=\'ps\', operate_time=2019-05-29 13:34:40.337, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:34:40', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (460, 4, 0, '', 'AclInfo{id=0, code=\'20190529133632_89\', name=\'实时报警查询\', aclModuleId=45, url=\'/facilityUnite/alarm/getAllAlarm\', type=2, status=1, seq=1, remark=\'按设施分组返回各类报警信息\', operator=\'ps\', operate_time=2019-05-29 13:36:32.116, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:36:32', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (461, 4, 0, '', 'AclInfo{id=0, code=\'20190529133939_51\', name=\'考勤查询接口\', aclModuleId=75, url=\'/attendance/findAttendanceLog\', type=2, status=1, seq=1, remark=\'返回无正常异常状态值的考勤\', operator=\'ps\', operate_time=2019-05-29 13:39:39.883, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:39:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (462, 4, 0, '', 'AclInfo{id=0, code=\'20190529134021_19\', name=\'考勤查询\', aclModuleId=75, url=\'/attendance/findBypage\', type=2, status=1, seq=1, remark=\'返回区分正常异常状态的考勤\', operator=\'ps\', operate_time=2019-05-29 13:40:21.203, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:40:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (463, 4, 0, '', 'AclInfo{id=0, code=\'20190529134210_17\', name=\'考勤查询(按设施名称)\', aclModuleId=75, url=\'/attendance/findByFacilityName\', type=2, status=1, seq=1, remark=\'按设施名称查询该设施下的考勤信息\', operator=\'ps\', operate_time=2019-05-29 13:42:10.964, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:42:11', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (464, 4, 0, '', 'AclInfo{id=0, code=\'20190529134303_2\', name=\'考勤统计信息\', aclModuleId=75, url=\'/attendance/attendanceStatus\', type=2, status=1, seq=1, remark=\'(柱状图展示)\', operator=\'ps\', operate_time=2019-05-29 13:43:03.574, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:43:03', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (465, 4, 0, '', 'AclInfo{id=0, code=\'20190529134329_56\', name=\'考勤统计应出勤人数\', aclModuleId=75, url=\'/attendance/attendanceCount\', type=2, status=1, seq=1, remark=\'(柱状图展示)\', operator=\'ps\', operate_time=2019-05-29 13:43:29.013, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:43:29', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (466, 4, 0, '', 'AclInfo{id=0, code=\'20190529134413_95\', name=\'考勤详情查询\', aclModuleId=75, url=\'/attendance/findAttendanceOrgLog\', type=2, status=1, seq=1, remark=\'返回考勤详情\', operator=\'ps\', operate_time=2019-05-29 13:44:13.842, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:44:13', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (467, 4, 0, '', 'AclInfo{id=0, code=\'20190529134514_15\', name=\'作战图区域整改率统计\', aclModuleId=109, url=\'/map/rectification\', type=2, status=1, seq=1, remark=\'作战图区域整改率统计数据展示\', operator=\'ps\', operate_time=2019-05-29 13:45:14.517, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:45:14', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (468, 4, 0, '', 'AclInfo{id=0, code=\'20190529134540_98\', name=\'获取电量仪安装记录\', aclModuleId=81, url=\'/electricityInstall/getById\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-29 13:45:40.964, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:45:41', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (469, 4, 0, '', 'AclInfo{id=0, code=\'20190529134604_29\', name=\'获取电量仪历史安装记录\', aclModuleId=81, url=\'/electricityInstall/listByElectricityInstallLog\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-29 13:46:04.053, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:46:04', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (470, 4, 0, '', 'AclInfo{id=0, code=\'20190529134624_19\', name=\'将电量仪与水泵绑定\', aclModuleId=81, url=\'/electricityInstall/bind\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-29 13:46:24.387, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:46:24', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (471, 4, 0, '', 'AclInfo{id=0, code=\'20190529134643_71\', name=\'修改电量仪与水泵的绑定信息\', aclModuleId=81, url=\'/electricityInstall/modifyBind\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-29 13:46:43.669, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:46:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (472, 4, 0, '', 'AclInfo{id=0, code=\'20190529134705_56\', name=\'将电量仪与水泵解绑\', aclModuleId=81, url=\'/electricityInstall/unBindById\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-29 13:47:05.684, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:47:05', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (473, 4, 0, '', 'AclInfo{id=0, code=\'20190529134723_87\', name=\'批量将电量仪与水泵解绑\', aclModuleId=81, url=\'/electricityInstall/unBindByIds\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-29 13:47:23.564, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-29 13:47:23', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (474, 5, 0, '', 'RoleInfo{id=0, name=\'yw\', type=2, status=1, remark=\'yw个人角色\', operator=\'ps\', operate_time=2019-05-30 15:26:22.1, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:26:22', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (475, 5, 0, '', 'RoleInfo{id=0, name=\'liuchuan\', type=2, status=1, remark=\'liuchuan个人角色\', operator=\'ps\', operate_time=2019-05-30 15:26:45.68, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:26:45', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (476, 5, 0, '', 'RoleInfo{id=0, name=\'gdl\', type=2, status=1, remark=\'gdl个人角色\', operator=\'ps\', operate_time=2019-05-30 15:26:59.536, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:26:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (477, 5, 0, '', 'RoleInfo{id=0, name=\'huaxin\', type=2, status=1, remark=\'huaxin个人角色\', operator=\'ps\', operate_time=2019-05-30 15:27:09.431, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:27:10', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (478, 5, 0, '', 'RoleInfo{id=0, name=\'yingpu\', type=2, status=1, remark=\'yingpu个人角色\', operator=\'ps\', operate_time=2019-05-30 15:27:18.578, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:27:18', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (479, 5, 0, '', 'RoleInfo{id=0, name=\'xianghuaqiao\', type=2, status=1, remark=\'xianghuaqiao个人角色\', operator=\'ps\', operate_time=2019-05-30 15:27:33.111, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:27:33', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (480, 5, 0, '', 'RoleInfo{id=0, name=\'xujing\', type=2, status=1, remark=\'xujing个人角色\', operator=\'ps\', operate_time=2019-05-30 15:27:46.078, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:27:46', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (481, 5, 0, '', 'RoleInfo{id=0, name=\'zhujiajiao\', type=2, status=1, remark=\'zhujiajiao个人角色\', operator=\'ps\', operate_time=2019-05-30 15:27:55.899, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:27:56', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (482, 5, 0, '', 'RoleInfo{id=0, name=\'liantang\', type=2, status=1, remark=\'liantang个人角色\', operator=\'ps\', operate_time=2019-05-30 15:28:04.126, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:28:04', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (483, 5, 0, '', 'RoleInfo{id=0, name=\'baihe\', type=2, status=1, remark=\'baihe个人角色\', operator=\'ps\', operate_time=2019-05-30 15:28:17.971, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:28:19', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (484, 5, 0, '', 'RoleInfo{id=0, name=\'xiayang\', type=2, status=1, remark=\'xiayang个人角色\', operator=\'ps\', operate_time=2019-05-30 15:28:30.212, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:28:30', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (485, 5, 0, '', 'RoleInfo{id=0, name=\'zhaoxiang\', type=2, status=1, remark=\'zhaoxiang个人角色\', operator=\'ps\', operate_time=2019-05-30 15:28:43.766, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:28:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (486, 5, 0, '', 'RoleInfo{id=0, name=\'jinze\', type=2, status=1, remark=\'jinze个人角色\', operator=\'ps\', operate_time=2019-05-30 15:28:54.02, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:28:54', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (487, 5, 0, '', 'RoleInfo{id=0, name=\'lxx\', type=2, status=1, remark=\'lxx个人角色\', operator=\'ps\', operate_time=2019-05-30 15:29:03.767, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:29:03', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (488, 5, 0, '', 'RoleInfo{id=0, name=\'test\', type=2, status=1, remark=\'test个人角色\', operator=\'ps\', operate_time=2019-05-30 15:29:15.655, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:29:15', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (489, 5, 0, '', 'RoleInfo{id=0, name=\'test2\', type=2, status=1, remark=\'test2个人角色\', operator=\'ps\', operate_time=2019-05-30 15:29:22.825, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:29:23', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (490, 5, 0, '', 'RoleInfo{id=0, name=\'15190477424\', type=2, status=1, remark=\'15190477424个人角色\', operator=\'ps\', operate_time=2019-05-30 15:29:32.424, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:29:32', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (491, 5, 0, '', 'RoleInfo{id=0, name=\'15900624520\', type=2, status=1, remark=\'15900624520个人角色\', operator=\'ps\', operate_time=2019-05-30 15:29:41.406, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-30 15:29:41', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (492, 3, 0, '', 'AclModuleInfo{id=0, name=\'test\', parentId=106, level=\'0.41.106\', seq=1, status=1, remark=\'1\', operator=\'ps\', operateTime=2019-05-31 10:19:41.802, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:19:41', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (493, 4, 0, '', 'AclInfo{id=0, code=\'20190531102323_12\', name=\'4\', aclModuleId=41, url=\'4\', type=2, status=0, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 10:23:23.004, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:23:23', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (494, 5, 0, '', 'RoleInfo{id=0, name=\'666\', type=2, status=1, remark=\'666个人角色\', operator=\'ps\', operate_time=2019-05-31 10:24:21.737, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:24:21', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (495, 5, 0, '', 'RoleInfo{id=0, name=\'6\', type=2, status=1, remark=\'6个人角色\', operator=\'ps\', operate_time=2019-05-31 10:24:58.583, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:24:58', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (496, 3, 0, '', 'AclModuleInfo{id=0, name=\'11111\', parentId=45, level=\'0.41.105.45\', seq=1, status=1, remark=\'1111\', operator=\'ps\', operateTime=2019-05-31 10:25:49.097, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:25:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (497, 4, 0, '', 'AclInfo{id=0, code=\'20190531102608_43\', name=\'21213\', aclModuleId=41, url=\'213\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 10:26:08.053, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:26:08', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (498, 3, 0, '', 'AclModuleInfo{id=0, name=\'11111111111111111\', parentId=103, level=\'0.41.105.51.103\', seq=1, status=1, remark=\'111111\', operator=\'ps\', operateTime=2019-05-31 10:27:11.326, operateIp=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:27:11', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (499, 5, 0, '', 'RoleInfo{id=0, name=\'12\', type=1, status=1, remark=\'12\', operator=\'ps\', operate_time=2019-05-31 10:27:39.374, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:27:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (500, 5, 0, '', 'RoleInfo{id=0, name=\'99\', type=2, status=1, remark=\'99个人角色\', operator=\'ps\', operate_time=2019-05-31 10:35:58.158, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:35:58', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (501, 5, 0, '', 'RoleInfo{id=0, name=\'888\', type=2, status=1, remark=\'888个人角色\', operator=\'ps\', operate_time=2019-05-31 10:36:56.843, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:36:56', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (502, 5, 0, '', 'RoleInfo{id=0, name=\'3\', type=2, status=1, remark=\'3个人角色\', operator=\'ps\', operate_time=2019-05-31 10:37:45.039, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:37:45', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (503, 5, 0, '', 'RoleInfo{id=0, name=\'test111\', type=2, status=1, remark=\'test111个人角色\', operator=\'ps\', operate_time=2019-05-31 10:41:56.56, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:41:56', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (504, 5, 0, '', 'RoleInfo{id=0, name=\'4\', type=2, status=1, remark=\'4个人角色\', operator=\'ps\', operate_time=2019-05-31 10:43:53.957, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:43:54', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (505, 5, 0, '', 'RoleInfo{id=0, name=\'3\', type=2, status=1, remark=\'3个人角色\', operator=\'ps\', operate_time=2019-05-31 10:50:07.41, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:50:08', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (506, 5, 0, '', 'RoleInfo{id=0, name=\'3\', type=2, status=1, remark=\'3个人角色\', operator=\'ps\', operate_time=2019-05-31 10:51:57.079, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:51:57', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (507, 5, 0, '', 'RoleInfo{id=0, name=\'3\', type=2, status=1, remark=\'3个人角色\', operator=\'ps\', operate_time=2019-05-31 10:53:24.146, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 10:53:24', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (508, 5, 0, '', 'RoleInfo{id=0, name=\'2\', type=2, status=1, remark=\'2个人角色\', operator=\'ps\', operate_time=2019-05-31 11:26:59.447, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 11:26:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (509, 4, 0, '', 'AclInfo{id=0, code=\'20190531140929_19\', name=\'更新角色功能树\', aclModuleId=100, url=\'/rabc/role/update\', type=2, status=1, seq=1, remark=\'厉辉的接口rabc，非rbac\', operator=\'ps\', operate_time=2019-05-31 14:09:29.099, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 14:09:29', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (510, 4, 0, '', 'AclInfo{id=0, code=\'20190531143955_11\', name=\'查询历史报警\', aclModuleId=55, url=\'/alarmlog/list\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 14:39:55.295, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 14:39:55', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (511, 4, 0, '', 'AclInfo{id=0, code=\'20190531144233_88\', name=\'历史报警维护日志\', aclModuleId=55, url=\'/alarmlog/chakan\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 14:42:33.781, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 14:42:33', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (512, 4, 0, '', 'AclInfo{id=0, code=\'20190531144251_81\', name=\'历史报警导出\', aclModuleId=55, url=\'/alarmlog/export\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 14:42:51.407, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 14:42:51', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (513, 4, 0, '', 'AclInfo{id=0, code=\'20190531150743_72\', name=\'用户查询\', aclModuleId=99, url=\'/user/list\', type=2, status=1, seq=1, remark=\'用户查询\', operator=\'ps\', operate_time=2019-05-31 15:07:43.334, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 15:07:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (514, 4, 0, '', 'AclInfo{id=0, code=\'20190531150849_49\', name=\'资源查询\', aclModuleId=100, url=\'/group/resources/list\', type=2, status=1, seq=1, remark=\'资源查询\', operator=\'ps\', operate_time=2019-05-31 15:08:49.224, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 15:08:49', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (515, 4, 0, '', 'AclInfo{id=0, code=\'20190531150954_53\', name=\'查询组信息\', aclModuleId=100, url=\'/group/list\', type=2, status=1, seq=1, remark=\'查询组信息\', operator=\'ps\', operate_time=2019-05-31 15:09:54.332, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 15:09:54', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (516, 5, 0, '', 'RoleInfo{id=0, name=\'yanshi\', type=2, status=1, remark=\'yanshi个人角色\', operator=\'ps\', operate_time=2019-05-31 15:42:02.89, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 15:42:02', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (517, 4, 0, '', 'AclInfo{id=0, code=\'20190531155206_20\', name=\'查询监测点水位\', aclModuleId=72, url=\'/waterLevelLog/monitoringpoint\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 15:52:06.398, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 15:52:06', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (518, 4, 0, '', 'AclInfo{id=0, code=\'20190531155238_96\', name=\'导出监测点水位\', aclModuleId=72, url=\'/waterLevelLog/exportMP\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 15:52:38.081, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 15:52:38', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (519, 4, 0, '', 'AclInfo{id=0, code=\'20190531155618_38\', name=\'获取监测点列表\', aclModuleId=72, url=\'/waterLevelLog/mplist\', type=2, status=1, seq=1, remark=\'\', operator=\'ps\', operate_time=2019-05-31 15:56:18.057, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 15:56:18', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (520, 4, 0, '', 'AclInfo{id=0, code=\'20190531160015_11\', name=\'查询历史水位\', aclModuleId=70, url=\'/waterLevelLog/instrument\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:00:15.378, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:00:15', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (521, 4, 0, '', 'AclInfo{id=0, code=\'20190531160043_52\', name=\'导出历史水位\', aclModuleId=70, url=\'/waterLevelLog/exportInstrument\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:00:43.341, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:00:43', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (522, 4, 0, '', 'AclInfo{id=0, code=\'20190531160139_67\', name=\'水闸对比图\', aclModuleId=71, url=\'/waterLevelLog/waterlevelgatepump\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:01:39.799, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:01:39', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (523, 4, 0, '', 'AclInfo{id=0, code=\'20190531160231_60\', name=\'导出历史水位工况\', aclModuleId=71, url=\'/waterLevelLog/exportInstrument\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:02:31.428, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:02:31', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (524, 4, 0, '', 'AclInfo{id=0, code=\'20190531160556_93\', name=\'查询水闸综合监控\', aclModuleId=54, url=\'/waterLevelLog/waterlevelgatepump\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:05:56.447, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:05:56', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (525, 4, 0, '', 'AclInfo{id=0, code=\'20190531160858_80\', name=\'增加防汛仓库信息\', aclModuleId=93, url=\'/goodsrepertory/add\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:08:58.751, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:08:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (526, 4, 0, '', 'AclInfo{id=0, code=\'20190531161323_33\', name=\'删除防汛仓库信息\', aclModuleId=93, url=\'/goodsrepertory/delete\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:13:23.844, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:13:23', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (527, 4, 0, '', 'AclInfo{id=0, code=\'20190531161358_25\', name=\'修改防汛仓库信息\', aclModuleId=93, url=\'/goodsrepertory/update\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:13:58.325, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:13:58', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (528, 4, 0, '', 'AclInfo{id=0, code=\'20190531161426_15\', name=\'查询防汛仓库信息\', aclModuleId=93, url=\'/goodsrepertory/get\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:14:26.236, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:14:26', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (529, 4, 0, '', 'AclInfo{id=0, code=\'20190531161500_79\', name=\'导出防汛仓库信息\', aclModuleId=93, url=\'/goodsrepertory/export\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:15:00.616, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:15:00', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (530, 4, 0, '', 'AclInfo{id=0, code=\'20190531161534_55\', name=\'防汛仓库列表\', aclModuleId=93, url=\'/goodsrepertory/list\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:15:34.972, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:15:35', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (531, 4, 0, '', 'AclInfo{id=0, code=\'20190531162201_97\', name=\'区域树查询\', aclModuleId=53, url=\'/monitoring/regionTree\', type=2, status=1, seq=1, remark=\'区域树查询\', operator=\'ps\', operate_time=2019-05-31 16:22:01.122, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:22:01', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (532, 4, 0, '', 'AclInfo{id=0, code=\'20190531162920_51\', name=\'查询关注信息\', aclModuleId=54, url=\'/monitoring/favourite\', type=2, status=1, seq=1, remark=\'查询关注信息\', operator=\'ps\', operate_time=2019-05-31 16:29:20.252, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:29:20', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (533, 4, 0, '', 'AclInfo{id=0, code=\'20190531162957_42\', name=\'增加防汛物资信息\', aclModuleId=94, url=\'/goods/add\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:29:57.067, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:29:57', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (534, 5, 0, '', 'RoleInfo{id=0, name=\'twst\', type=2, status=1, remark=\'twst个人角色\', operator=\'ps\', operate_time=2019-05-31 16:34:01.236, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:34:01', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (535, 5, 0, '', 'RoleInfo{id=0, name=\'q\', type=2, status=1, remark=\'q个人角色\', operator=\'ps\', operate_time=2019-05-31 16:34:25.145, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:34:25', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (536, 5, 0, '', 'RoleInfo{id=0, name=\'qqq\', type=1, status=1, remark=\'qqq\', operator=\'ps\', operate_time=2019-05-31 16:36:08.671, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:36:08', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (537, 5, 0, '', 'RoleInfo{id=0, name=\'wwww\', type=2, status=1, remark=\'wwww个人角色\', operator=\'ps\', operate_time=2019-05-31 16:36:42.199, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:36:42', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (538, 5, 0, '', 'RoleInfo{id=0, name=\'1\', type=2, status=1, remark=\'1个人角色\', operator=\'ps\', operate_time=2019-05-31 16:38:26.149, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:38:26', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (539, 5, 0, '', 'RoleInfo{id=0, name=\'`\', type=1, status=1, remark=\'`\', operator=\'ps\', operate_time=2019-05-31 16:38:51.707, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:38:51', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (540, 5, 0, '', 'RoleInfo{id=0, name=\'123\', type=1, status=1, remark=\'123\', operator=\'ps\', operate_time=2019-05-31 16:39:02.45, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:39:02', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (541, 4, 0, '', 'AclInfo{id=0, code=\'20190531163912_90\', name=\'删除防汛物资信息\', aclModuleId=94, url=\'/goods/delete\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:39:12.19, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:39:12', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (542, 5, 0, '', 'RoleInfo{id=0, name=\'1\', type=1, status=1, remark=\'1\', operator=\'ps\', operate_time=2019-05-31 16:39:22.395, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:39:22', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (543, 5, 0, '', 'RoleInfo{id=0, name=\'1\', type=1, status=1, remark=\'1\', operator=\'ps\', operate_time=2019-05-31 16:40:04.721, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:40:04', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (544, 5, 0, '', 'RoleInfo{id=0, name=\'11\', type=2, status=1, remark=\'11个人角色\', operator=\'ps\', operate_time=2019-05-31 16:40:18.155, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:40:18', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (545, 5, 0, '', 'RoleInfo{id=0, name=\'123123\', type=2, status=1, remark=\'123123个人角色\', operator=\'ps\', operate_time=2019-05-31 16:40:54.023, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:40:54', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (546, 4, 0, '', 'AclInfo{id=0, code=\'20190531164055_51\', name=\'修改防汛物资信息\', aclModuleId=94, url=\'/goods/update\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:40:55.953, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:40:56', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (547, 4, 0, '', 'AclInfo{id=0, code=\'20190531164359_63\', name=\'查询防汛位置信息\', aclModuleId=94, url=\'/goods/get\', type=2, status=1, seq=1, remark=\'null\', operator=\'ps\', operate_time=2019-05-31 16:43:59.527, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:43:59', '127.0.0.1', 1);
INSERT INTO `sys_log` VALUES (548, 5, 0, '', 'RoleInfo{id=0, name=\'111111\', type=2, status=1, remark=\'111111个人角色\', operator=\'ps\', operate_time=2019-05-31 16:44:10.085, operate_ip=\'127.0.0.1\'}', '陈义星', '2019-05-31 16:44:10', '127.0.0.1', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '角色的类型，1：系统角色     2：个人角色',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态，1：可用，0：冻结。应用场景：一个人临时需要一个权限。然后就临时创建一个角色赋予给他，在这个时间段之后。这个角色就可以把它禁用掉。',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作员',
  `operate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作者操作时间',
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后一次操作者的ip地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 1, 1, '管理员角色', 'ps', '2019-05-16 16:33:46', '127.0.0.1');
INSERT INTO `sys_role` VALUES (2, '巡查员', 1, 1, '巡查员角色', 'ps', '2019-05-22 14:20:53', '127.0.0.1');
INSERT INTO `sys_role` VALUES (3, '监理员', 1, 1, '监理员角色', 'ps', '2019-05-23 11:34:17', '127.0.0.1');
INSERT INTO `sys_role` VALUES (4, '运维人员', 1, 1, '运维人员', 'ps', '2019-05-31 14:02:25', '');
INSERT INTO `sys_role` VALUES (5, '超级管理员', 1, 1, '超级管理员', 'ps', '2019-05-31 18:03:09', '');
INSERT INTO `sys_role` VALUES (6, '站长', 1, 1, '站长', 'ps', '2019-05-31 18:03:11', '');
INSERT INTO `sys_role` VALUES (7, '养护人员', 1, 1, '养护人员', 'ps', '2019-05-31 18:03:13', '');
INSERT INTO `sys_role` VALUES (8, '共有角色', 1, 1, '共有角色', 'ps', '2019-05-31 18:03:15', '');
INSERT INTO `sys_role` VALUES (9, '数据展示人员', 1, 1, '数据展示人员角色组', 'ps', '2019-05-31 18:04:54', '');

-- ----------------------------
-- Table structure for sys_role_acl
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_acl`;
CREATE TABLE `sys_role_acl`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色权限id',
  `role_id` bigint(20) NOT NULL COMMENT '用户id',
  `acl_id` bigint(20) NOT NULL COMMENT '权限id',
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作员',
  `operate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作员操作的时间',
  `operate_ip` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后一次操作者的ip',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_role_acl_role`(`role_id`) USING BTREE,
  INDEX `fk_role_acl_acl`(`acl_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5397 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_acl
-- ----------------------------
INSERT INTO `sys_role_acl` VALUES (5118, 60, 58, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5119, 60, 59, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5120, 60, 60, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5121, 60, 61, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5122, 60, 62, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5123, 60, 63, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5124, 60, 64, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5125, 60, 65, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5126, 60, 66, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5127, 60, 67, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5128, 60, 68, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5129, 60, 69, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5130, 60, 70, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5131, 60, 71, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5132, 60, 72, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5133, 60, 73, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5134, 60, 74, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5135, 60, 75, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5136, 60, 76, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5137, 60, 77, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5138, 60, 78, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5139, 60, 79, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5140, 60, 80, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5141, 60, 81, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5142, 60, 82, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5143, 60, 83, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5144, 60, 84, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5145, 60, 85, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5146, 60, 86, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5147, 60, 87, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5148, 60, 88, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5149, 60, 89, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5150, 60, 90, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5151, 60, 91, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5152, 60, 92, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5153, 60, 93, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5154, 60, 94, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5155, 60, 95, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5156, 60, 96, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5157, 60, 100, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5158, 60, 101, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5159, 60, 102, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5160, 60, 103, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5161, 60, 104, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5162, 60, 105, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5163, 60, 106, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5164, 60, 107, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5165, 60, 108, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5166, 60, 109, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5167, 60, 110, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5168, 60, 111, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5169, 60, 112, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5170, 60, 113, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5171, 60, 114, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5172, 60, 115, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5173, 60, 116, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5174, 60, 117, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5175, 60, 118, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5176, 60, 119, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5177, 60, 120, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5178, 60, 121, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5179, 60, 122, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5180, 60, 123, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5181, 60, 124, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5182, 60, 126, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5183, 60, 127, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5184, 60, 128, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5185, 60, 129, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5186, 60, 130, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5187, 60, 131, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5188, 60, 132, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5189, 60, 133, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5190, 60, 134, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5191, 60, 135, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5192, 60, 136, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5193, 60, 137, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5194, 60, 138, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5195, 60, 152, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5196, 60, 153, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5197, 60, 154, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5198, 60, 155, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5199, 60, 156, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5200, 60, 157, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5201, 60, 158, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5202, 60, 159, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5203, 60, 160, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5204, 60, 161, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5205, 60, 162, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5206, 60, 163, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5207, 60, 164, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5208, 60, 165, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5209, 60, 166, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5210, 60, 167, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5211, 60, 168, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5212, 60, 169, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5213, 60, 170, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5214, 60, 171, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5215, 60, 172, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5216, 60, 173, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5217, 60, 174, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5218, 60, 175, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5219, 60, 176, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5220, 60, 177, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5221, 60, 178, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5222, 60, 179, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5223, 60, 180, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5224, 60, 181, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5225, 60, 182, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5226, 60, 183, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5227, 60, 184, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5228, 60, 185, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5229, 60, 186, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5230, 60, 187, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5231, 60, 188, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5232, 60, 189, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5233, 60, 190, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5234, 60, 191, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5235, 60, 192, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5236, 60, 193, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5237, 60, 194, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5238, 60, 195, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5239, 60, 196, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5240, 60, 197, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5241, 60, 198, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5242, 60, 199, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5243, 60, 200, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5244, 60, 201, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5245, 60, 202, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5246, 60, 203, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5247, 60, 204, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5248, 60, 205, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5249, 60, 206, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5250, 60, 207, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5251, 60, 208, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5252, 60, 209, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5253, 60, 210, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5254, 60, 211, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5255, 60, 212, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5256, 60, 213, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5257, 60, 214, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5258, 60, 215, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5259, 60, 216, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5260, 60, 217, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5261, 60, 218, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5262, 60, 219, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5263, 60, 220, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5264, 60, 221, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5265, 60, 222, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5266, 60, 223, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5267, 60, 224, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5268, 60, 225, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5269, 60, 226, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5270, 60, 227, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5271, 60, 228, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5272, 60, 229, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5273, 60, 230, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5274, 60, 231, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5275, 60, 232, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5276, 60, 233, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5277, 60, 234, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5278, 60, 235, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5279, 60, 236, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5280, 60, 237, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5281, 60, 238, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5282, 60, 239, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5283, 60, 240, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5284, 60, 241, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5285, 60, 242, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5286, 60, 243, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5287, 60, 244, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5288, 60, 245, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5289, 60, 246, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5290, 60, 247, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5291, 60, 248, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5292, 60, 249, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5293, 60, 252, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5294, 60, 253, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5295, 60, 254, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5296, 60, 255, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5297, 60, 256, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5298, 60, 257, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5299, 60, 258, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5300, 60, 259, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5301, 60, 260, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5302, 60, 261, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5303, 60, 262, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5304, 60, 263, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5305, 60, 264, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5306, 60, 265, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5307, 60, 266, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5308, 60, 267, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5309, 60, 268, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5310, 60, 269, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5311, 60, 270, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5312, 60, 271, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5313, 60, 272, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5314, 60, 273, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5315, 60, 274, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5316, 60, 275, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5317, 60, 276, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5318, 60, 277, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5319, 60, 278, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5320, 60, 279, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5321, 60, 280, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5322, 60, 281, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5323, 60, 282, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5324, 60, 283, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5325, 60, 284, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5326, 60, 285, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5327, 60, 286, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5328, 60, 287, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5329, 60, 288, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5330, 60, 289, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5331, 60, 290, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5332, 60, 291, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5333, 60, 292, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5334, 60, 293, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5335, 60, 294, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5336, 60, 295, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5337, 60, 296, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5338, 60, 297, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5339, 60, 298, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5340, 60, 299, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5341, 60, 300, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5342, 60, 301, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5343, 60, 302, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5344, 60, 305, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5345, 60, 306, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5346, 60, 307, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5347, 60, 308, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5348, 60, 309, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5349, 60, 310, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5350, 60, 311, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5351, 60, 312, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5352, 60, 313, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5353, 60, 314, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5354, 60, 315, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5355, 60, 316, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5356, 60, 317, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5357, 60, 318, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5358, 60, 319, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5359, 60, 320, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5360, 60, 321, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5361, 60, 322, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5362, 60, 323, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5363, 60, 324, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5364, 60, 325, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5365, 60, 326, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5366, 60, 327, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5367, 60, 328, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5368, 60, 329, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5369, 60, 332, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5370, 60, 333, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5371, 60, 334, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5372, 60, 335, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5373, 60, 336, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5374, 60, 337, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5375, 60, 338, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5376, 60, 339, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5377, 60, 340, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5378, 60, 341, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5379, 60, 342, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5380, 60, 343, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5381, 60, 344, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5382, 60, 345, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5383, 60, 346, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5384, 60, 347, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5385, 60, 348, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5386, 60, 349, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5387, 60, 350, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5388, 60, 351, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5389, 60, 352, '张小平', '2019-05-31 16:20:32', '192.168.2.105');
INSERT INTO `sys_role_acl` VALUES (5390, 60, 353, 'ps', '2019-05-31 16:22:01', '127.0.0.1');
INSERT INTO `sys_role_acl` VALUES (5391, 60, 354, 'ps', '2019-05-31 16:29:20', '127.0.0.1');
INSERT INTO `sys_role_acl` VALUES (5392, 60, 355, 'ps', '2019-05-31 16:29:57', '127.0.0.1');
INSERT INTO `sys_role_acl` VALUES (5393, 60, 356, 'ps', '2019-05-31 16:39:12', '127.0.0.1');
INSERT INTO `sys_role_acl` VALUES (5394, 60, 357, 'ps', '2019-05-31 16:40:56', '127.0.0.1');
INSERT INTO `sys_role_acl` VALUES (5396, 60, 358, 'ps', '2019-05-31 16:43:59', '127.0.0.1');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户角色id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作员',
  `operate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作者操作时间',
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后一次操作者的ip地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_role_user_user`(`user_id`) USING BTREE,
  INDEX `fk_role_user_role`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 266 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (12, 7, 86, 'ps', '2019-05-23 10:28:02', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (13, 8, 85, 'ps', '2019-05-23 10:28:31', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (14, 9, 84, 'ps', '2019-05-23 10:28:48', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (15, 10, 72, 'ps', '2019-05-23 10:28:56', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (16, 11, 57, 'ps', '2019-05-23 10:29:09', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (17, 12, 65, 'ps', '2019-05-23 10:29:16', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (18, 13, 56, 'ps', '2019-05-23 10:29:23', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (19, 14, 53, 'ps', '2019-05-23 10:29:32', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (20, 17, 66, 'ps', '2019-05-23 10:36:23', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (21, 18, 69, 'ps', '2019-05-23 10:36:41', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (22, 19, 55, 'ps', '2019-05-23 10:36:49', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (23, 20, 71, 'ps', '2019-05-23 10:36:58', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (24, 21, 58, 'ps', '2019-05-23 10:37:10', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (25, 22, 64, 'ps', '2019-05-23 10:37:21', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (26, 23, 61, 'ps', '2019-05-23 10:37:32', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (27, 24, 54, 'ps', '2019-05-23 10:37:40', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (28, 26, 59, 'ps', '2019-05-23 10:38:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (29, 29, 62, 'ps', '2019-05-23 10:39:24', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (30, 30, 63, 'ps', '2019-05-23 10:39:43', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (31, 33, 83, 'ps', '2019-05-23 10:40:26', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (32, 34, 70, 'ps', '2019-05-23 10:40:42', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (33, 36, 60, 'ps', '2019-05-23 10:41:31', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (34, 38, 67, 'ps', '2019-05-23 10:42:13', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (35, 39, 68, 'ps', '2019-05-23 10:42:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (36, 41, 9, 'ps', '2019-05-23 10:42:47', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (37, 42, 1, 'ps', '2019-05-23 10:42:55', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (38, 43, 93, 'ps', '2019-05-23 10:44:54', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (39, 44, 81, 'ps', '2019-05-23 10:50:25', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (40, 45, 87, 'ps', '2019-05-23 10:53:33', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (41, 46, 89, 'ps', '2019-05-23 10:53:40', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (128, 5, 4, '张小平', '2019-05-28 14:56:43', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (143, 63, 9, 'ps', '2019-05-30 14:57:21', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (144, 63, 1, 'ps', '2019-05-30 14:57:21', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (145, 63, 56, 'ps', '2019-05-30 14:57:21', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (146, 63, 66, 'ps', '2019-05-30 14:57:21', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (147, 63, 69, 'ps', '2019-05-30 14:57:21', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (148, 63, 55, 'ps', '2019-05-30 14:57:21', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (149, 63, 71, 'ps', '2019-05-30 14:57:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (150, 63, 58, 'ps', '2019-05-30 14:57:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (151, 63, 64, 'ps', '2019-05-30 14:57:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (152, 63, 61, 'ps', '2019-05-30 14:57:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (153, 63, 54, 'ps', '2019-05-30 14:57:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (154, 63, 57, 'ps', '2019-05-30 14:57:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (155, 63, 72, 'ps', '2019-05-30 14:57:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (156, 63, 53, 'ps', '2019-05-30 14:57:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (157, 63, 65, 'ps', '2019-05-30 14:57:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (158, 63, 59, 'ps', '2019-05-30 14:57:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (159, 63, 70, 'ps', '2019-05-30 14:57:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (160, 63, 60, 'ps', '2019-05-30 14:57:22', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (161, 63, 67, 'ps', '2019-05-30 14:57:23', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (162, 63, 68, 'ps', '2019-05-30 14:57:23', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (163, 63, 83, 'ps', '2019-05-30 14:57:23', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (164, 63, 84, 'ps', '2019-05-30 14:57:23', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (165, 63, 85, 'ps', '2019-05-30 14:57:23', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (166, 63, 86, 'ps', '2019-05-30 14:57:23', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (167, 63, 89, 'ps', '2019-05-30 14:57:24', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (168, 63, 93, 'ps', '2019-05-30 14:57:24', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (169, 63, 81, 'ps', '2019-05-30 14:57:24', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (170, 63, 87, 'ps', '2019-05-30 14:57:25', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (171, 63, 99, 'ps', '2019-05-30 14:57:25', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (172, 63, 4, 'ps', '2019-05-30 14:57:25', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (174, 63, 74, 'ps', '2019-05-30 14:57:26', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (175, 63, 80, 'ps', '2019-05-30 14:57:26', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (176, 63, 77, 'ps', '2019-05-30 14:57:27', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (177, 63, 121, 'ps', '2019-05-30 14:57:27', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (178, 63, 88, 'ps', '2019-05-30 14:57:27', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (179, 63, 76, 'ps', '2019-05-30 14:57:27', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (180, 63, 62, 'ps', '2019-05-30 14:57:27', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (181, 63, 63, 'ps', '2019-05-30 14:57:27', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (182, 63, 79, 'ps', '2019-05-30 14:57:27', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (183, 63, 75, 'ps', '2019-05-30 14:57:27', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (184, 63, 122, 'ps', '2019-05-30 14:57:28', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (185, 63, 73, 'ps', '2019-05-30 14:57:28', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (186, 63, 78, 'ps', '2019-05-30 14:57:28', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (187, 63, 102, 'ps', '2019-05-30 14:57:28', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (188, 63, 95, 'ps', '2019-05-30 14:57:28', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (189, 63, 96, 'ps', '2019-05-30 14:57:28', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (190, 63, 105, 'ps', '2019-05-30 14:57:28', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (191, 63, 101, 'ps', '2019-05-30 14:57:29', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (192, 63, 94, 'ps', '2019-05-30 14:57:29', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (193, 63, 107, 'ps', '2019-05-30 14:57:29', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (194, 63, 108, 'ps', '2019-05-30 14:57:29', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (195, 63, 109, 'ps', '2019-05-30 14:57:29', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (196, 63, 98, 'ps', '2019-05-30 14:57:29', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (197, 63, 103, 'ps', '2019-05-30 14:57:29', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (198, 63, 97, 'ps', '2019-05-30 14:57:29', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (199, 63, 92, 'ps', '2019-05-30 14:57:29', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (200, 63, 104, 'ps', '2019-05-30 14:57:29', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (201, 63, 100, 'ps', '2019-05-30 14:57:29', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (202, 63, 91, 'ps', '2019-05-30 14:57:29', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (206, 60, 1, 'ps', '2019-05-30 15:44:13', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (207, 60, 93, 'ps', '2019-05-30 15:44:13', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (208, 60, 77, 'ps', '2019-05-30 15:44:13', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (209, 60, 76, 'ps', '2019-05-30 15:44:13', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (210, 60, 75, 'ps', '2019-05-30 15:44:13', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (211, 60, 74, 'ps', '2019-05-30 15:44:14', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (212, 60, 73, 'ps', '2019-05-30 15:44:14', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (245, 63, 132, '张小平', '2019-05-31 13:39:12', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (253, 6, 90, '张小平', '2019-05-31 13:58:30', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (254, 63, 90, '张小平', '2019-05-31 13:58:30', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (255, 2, 133, '张小平', '2019-05-31 15:42:03', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (257, 63, 133, '张小平', '2019-05-31 15:42:03', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (259, 63, 134, '张小平', '2019-05-31 16:34:25', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (262, 63, 135, '张小平', '2019-05-31 16:36:44', '127.0.0.1');
INSERT INTO `sys_role_user` VALUES (265, 63, 136, '张小平', '2019-05-31 16:40:54', '127.0.0.1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `user_type` int(11) NULL DEFAULT NULL COMMENT '用户类型',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户描述',
  `account_state` int(11) NULL DEFAULT NULL COMMENT '账号状态：1正常、0禁用',
  `gmt_create` timestamp NULL DEFAULT NULL,
  `gmt_modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'cyx', '123456', 6200, '管理员', 1, '2019-08-30 16:23:55', '2019-08-30 16:24:51');
INSERT INTO `sys_user` VALUES (2, 'zou', '123456', 6201, '巡查员', 1, '2019-08-30 16:25:14', '2019-08-30 16:25:21');

-- ----------------------------
-- Table structure for sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_group`;
CREATE TABLE `sys_user_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `gmt_create` timestamp NULL DEFAULT NULL,
  `gmt_modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_group
-- ----------------------------
INSERT INTO `sys_user_group` VALUES (1, 1, 1, NULL, NULL);
INSERT INTO `sys_user_group` VALUES (2, 2, 2, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_group_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_group_info`;
CREATE TABLE `sys_user_group_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` timestamp NULL DEFAULT NULL,
  `gmt_modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_group_info
-- ----------------------------
INSERT INTO `sys_user_group_info` VALUES (1, '管理员组', NULL, NULL);
INSERT INTO `sys_user_group_info` VALUES (2, '巡查员组', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
