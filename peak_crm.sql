/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : peak_crm

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 14/03/2023 10:36:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (1, 'admin');
INSERT INTO `auth_group` VALUES (3, 'closer');
INSERT INTO `auth_group` VALUES (6, 'contractor');
INSERT INTO `auth_group` VALUES (2, 'manager');
INSERT INTO `auth_group` VALUES (5, 'permit_specialist');
INSERT INTO `auth_group` VALUES (4, 'setter');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add clients', 7, 'add_clients');
INSERT INTO `auth_permission` VALUES (26, 'Can change clients', 7, 'change_clients');
INSERT INTO `auth_permission` VALUES (27, 'Can delete clients', 7, 'delete_clients');
INSERT INTO `auth_permission` VALUES (28, 'Can view clients', 7, 'view_clients');
INSERT INTO `auth_permission` VALUES (29, 'Can add customers', 8, 'add_customers');
INSERT INTO `auth_permission` VALUES (30, 'Can change customers', 8, 'change_customers');
INSERT INTO `auth_permission` VALUES (31, 'Can delete customers', 8, 'delete_customers');
INSERT INTO `auth_permission` VALUES (32, 'Can view customers', 8, 'view_customers');
INSERT INTO `auth_permission` VALUES (33, 'Can add customers', 9, 'add_customers');
INSERT INTO `auth_permission` VALUES (34, 'Can change customers', 9, 'change_customers');
INSERT INTO `auth_permission` VALUES (35, 'Can delete customers', 9, 'delete_customers');
INSERT INTO `auth_permission` VALUES (36, 'Can view customers', 9, 'view_customers');
INSERT INTO `auth_permission` VALUES (37, 'Can add customers files', 10, 'add_customersfiles');
INSERT INTO `auth_permission` VALUES (38, 'Can change customers files', 10, 'change_customersfiles');
INSERT INTO `auth_permission` VALUES (39, 'Can delete customers files', 10, 'delete_customersfiles');
INSERT INTO `auth_permission` VALUES (40, 'Can view customers files', 10, 'view_customersfiles');
INSERT INTO `auth_permission` VALUES (41, 'Can add customers attachments', 10, 'add_customersattachments');
INSERT INTO `auth_permission` VALUES (42, 'Can change customers attachments', 10, 'change_customersattachments');
INSERT INTO `auth_permission` VALUES (43, 'Can delete customers attachments', 10, 'delete_customersattachments');
INSERT INTO `auth_permission` VALUES (44, 'Can view customers attachments', 10, 'view_customersattachments');
INSERT INTO `auth_permission` VALUES (45, 'Can add customers people', 11, 'add_customerspeople');
INSERT INTO `auth_permission` VALUES (46, 'Can change customers people', 11, 'change_customerspeople');
INSERT INTO `auth_permission` VALUES (47, 'Can delete customers people', 11, 'delete_customerspeople');
INSERT INTO `auth_permission` VALUES (48, 'Can view customers people', 11, 'view_customerspeople');
INSERT INTO `auth_permission` VALUES (49, 'Can add customer select options', 12, 'add_customerselectoptions');
INSERT INTO `auth_permission` VALUES (50, 'Can change customer select options', 12, 'change_customerselectoptions');
INSERT INTO `auth_permission` VALUES (51, 'Can delete customer select options', 12, 'delete_customerselectoptions');
INSERT INTO `auth_permission` VALUES (52, 'Can view customer select options', 12, 'view_customerselectoptions');
INSERT INTO `auth_permission` VALUES (53, 'Can add customer updates', 13, 'add_customerupdates');
INSERT INTO `auth_permission` VALUES (54, 'Can change customer updates', 13, 'change_customerupdates');
INSERT INTO `auth_permission` VALUES (55, 'Can delete customer updates', 13, 'delete_customerupdates');
INSERT INTO `auth_permission` VALUES (56, 'Can view customer updates', 13, 'view_customerupdates');
INSERT INTO `auth_permission` VALUES (57, 'Can add customer activity logs', 13, 'add_customeractivitylogs');
INSERT INTO `auth_permission` VALUES (58, 'Can change customer activity logs', 13, 'change_customeractivitylogs');
INSERT INTO `auth_permission` VALUES (59, 'Can delete customer activity logs', 13, 'delete_customeractivitylogs');
INSERT INTO `auth_permission` VALUES (60, 'Can view customer activity logs', 13, 'view_customeractivitylogs');
INSERT INTO `auth_permission` VALUES (61, 'Can add customer groups', 14, 'add_customergroups');
INSERT INTO `auth_permission` VALUES (62, 'Can change customer groups', 14, 'change_customergroups');
INSERT INTO `auth_permission` VALUES (63, 'Can delete customer groups', 14, 'delete_customergroups');
INSERT INTO `auth_permission` VALUES (64, 'Can view customer groups', 14, 'view_customergroups');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$390000$7SuS5pb2vwP8KF1phhOs0N$6D/O3ROgmblCfxaMkouDuaagSNpezdmaEWz8gXclTnk=', '2023-03-12 18:43:20.401049', 1, 'admin', 'Chad', 'Escol', 'admin@gmail.com', 1, 1, '2023-02-27 09:02:05.000000');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$390000$O0KQrF4HOoD4W5V4DDvN0K$fFaIsynaDaladsI+d0uJNzpXZ2nbiyGog8wCmdrRjLQ=', NULL, 0, 'manager', 'John ', 'Wick', '', 0, 1, '2023-03-03 13:43:21.000000');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$390000$9hx0sEPWPWJaJZBCe5AaV2$khxBGaSEbnLK8OEhh3XZxa3bil3JFuL1a7GA86g8aYM=', NULL, 0, 'closer', 'David', 'Thompson', 'chardrichescol@gmail.com', 0, 1, '2023-03-03 13:43:45.000000');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$390000$nnJQn7zVjqdXVRtdPluY00$q5kd2BQzFdOeaXqwdN2arAEua4VN94r+1XKm5JkhaEk=', NULL, 0, 'contractor', 'Klay', 'Thompson', '', 0, 1, '2023-03-03 13:44:33.000000');
INSERT INTO `auth_user` VALUES (5, 'pbkdf2_sha256$390000$lSRBW1MVCTJQ62cVJSqgr8$LyXnlwLpzA4dvAprgxJ6+3PNIqOSI7teTbpcGqv5IDw=', '2023-03-10 22:00:08.338556', 0, 'setter', 'Jordan ', 'Poole', 'chardrichescol@gmail.com', 0, 1, '2023-03-03 13:45:57.000000');
INSERT INTO `auth_user` VALUES (6, 'pbkdf2_sha256$390000$tpBwrq2QIErkqmWDIz0izB$DOqdIHwoOT+svnrYPVHxpqTfgwGim2V6mBjMmDsm0ko=', NULL, 0, 'permit_specialist', 'Stephen', 'Curry', '', 0, 1, '2023-03-03 13:46:20.000000');
INSERT INTO `auth_user` VALUES (7, 'pbkdf2_sha256$390000$NAnLvDs5sW5XXfHo8opSUI$tK1zVOTpMXDnK+nNjugLxRppcYcgDnnt2CUqhYuNcXU=', '2023-03-10 22:19:26.000000', 0, 'spencer', 'Spencer', '', 'admin@gmail.com', 0, 1, '2023-03-10 21:18:32.000000');
INSERT INTO `auth_user` VALUES (8, 'pbkdf2_sha256$390000$F3HhOrhgEqOX4UtbXKeBiX$9WD1ZLJCpQxgdb2ZRNJ1mGuPn8c+JLJ21KRC2zhS9uA=', NULL, 0, 'ca', 'Third', 'Admin', 'admin3@gmail.com', 0, 1, '2023-03-10 21:23:35.000000');
INSERT INTO `auth_user` VALUES (9, 'pbkdf2_sha256$390000$X6J0BaoaZZlwT4gfsocZ0Q$7ZEFAvukeiXsdb5JWLN6HrVYaPzOFkobhGKdNNBtH2U=', NULL, 0, 'cory', 'cory', '', 'admin4@gmail.com', 0, 1, '2023-03-10 21:26:43.000000');
INSERT INTO `auth_user` VALUES (10, 'pbkdf2_sha256$390000$43XaBNK5jKXtyTybsUO8xO$MFDO69f8vr6o7YZmlqy5kdipPp+1r8Ib77KbMhk9uwU=', NULL, 0, 'aj', 'aj', '', 'admin5@gmail.com', 0, 1, '2023-03-10 21:27:18.000000');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
INSERT INTO `auth_user_groups` VALUES (7, 1, 1);
INSERT INTO `auth_user_groups` VALUES (2, 2, 2);
INSERT INTO `auth_user_groups` VALUES (8, 3, 4);
INSERT INTO `auth_user_groups` VALUES (3, 4, 6);
INSERT INTO `auth_user_groups` VALUES (12, 5, 3);
INSERT INTO `auth_user_groups` VALUES (6, 6, 5);
INSERT INTO `auth_user_groups` VALUES (17, 7, 2);
INSERT INTO `auth_user_groups` VALUES (14, 8, 2);
INSERT INTO `auth_user_groups` VALUES (15, 9, 3);
INSERT INTO `auth_user_groups` VALUES (18, 10, 3);

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for customers_customeractivitylogs
-- ----------------------------
DROP TABLE IF EXISTS `customers_customeractivitylogs`;
CREATE TABLE `customers_customeractivitylogs`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `from_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `to_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_by_id` int NOT NULL,
  `customer_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `field_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customers_customerupdates_created_by_id_9ca2d338_fk_auth_user_id`(`created_by_id`) USING BTREE,
  INDEX `customers_customerac_customer_id_a047c595_fk_customers`(`customer_id`) USING BTREE,
  CONSTRAINT `customers_customerac_customer_id_a047c595_fk_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers_customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customerupdates_created_by_id_9ca2d338_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customers_customeractivitylogs
-- ----------------------------
INSERT INTO `customers_customeractivitylogs` VALUES ('048dc1ac86904600b2cb4e4ac3576495', '2023-03-10 17:51:44.557830', 'SS', '', 'a', 1, '12d35192a11b4ac5b8c3f4f7c842615e', 'text');
INSERT INTO `customers_customeractivitylogs` VALUES ('056860d8f25e4457ad376ef9a9749c8c', '2023-03-10 17:46:48.782544', 'Previous Company', '', 'zxc', 1, '815aa8fcbd064093a5f59614e0d334b7', 'text');
INSERT INTO `customers_customeractivitylogs` VALUES ('08e982dc16184070a294b962b812d39b', '2023-03-14 07:59:02.902052', 'Sold With', 'YES', 'TEST', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('0907a700230141479c9d818f68fb8ddf', '2023-03-14 08:34:13.323577', 'Design Requested', 'No', 'Yes', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', '');
INSERT INTO `customers_customeractivitylogs` VALUES ('0e82e7f169ea405daa720d17b15bd509', '2023-03-10 17:46:33.793027', 'Previous Company', '', 'a', 1, '12d35192a11b4ac5b8c3f4f7c842615e', 'text');
INSERT INTO `customers_customeractivitylogs` VALUES ('10f50c48c21645faaafbe63ed01c492f', '2023-03-09 14:43:41.186202', 'DOB', '2023-03-04', '2023-03-03', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 'text');
INSERT INTO `customers_customeractivitylogs` VALUES ('16db50ea4b0f4d64b7165fdaa632ae05', '2023-03-10 22:33:40.671752', 'Sold With', '', 'YES', 7, '12d35192a11b4ac5b8c3f4f7c842615e', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('17fab0294fb64a7cb54d3ece7f0ae243', '2023-03-10 22:34:49.677622', 'Install Confirmed', '', 'Yes', 7, '815aa8fcbd064093a5f59614e0d334b7', '');
INSERT INTO `customers_customeractivitylogs` VALUES ('1c2d448973b245cda6fc77e1647dd818', '2023-03-14 08:35:41.645454', 'Sold With', '', 'yes', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('21210605673b43548fc5320a0dd85f3d', '2023-03-10 22:19:34.985363', 'SS', 'ax', 'axc', 7, '12d35192a11b4ac5b8c3f4f7c842615e', 'text');
INSERT INTO `customers_customeractivitylogs` VALUES ('2205b761e2624921b58ffe88c2a6f16f', '2023-03-14 09:52:21.144580', 'Sold With', 'yes', 'Company 2', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('221e1a038a5c435cbcd1f4ca74e0a12c', '2023-03-14 09:57:31.098701', 'Sold With', 'YES', 'Company 2', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('253f3a89b87d4e0ba8a71c20ef09509d', '2023-03-14 09:52:00.937449', 'Sold With', 'ZXC', 'Company 2', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('2b3b7fa39a0d43fbb194f5b0cfd32f8e', '2023-03-14 07:59:04.177217', 'Sold With', 'TEST', 'yes', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('2fae2808901c432aae6a771ee78ebc8d', '2023-03-14 00:45:26.558193', 'Sold With', 'yes', 'YES', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('342c3313f42a4b6b92cde5630c2a07a8', '2023-03-14 09:52:02.498489', 'Sold With', 'Company 2', 'ZXC', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('43001f2b25174c2c97ab4d539482dbd3', '2023-03-10 22:34:46.006042', 'Install Confirmed', '', 'Yes', 7, '12d35192a11b4ac5b8c3f4f7c842615e', '');
INSERT INTO `customers_customeractivitylogs` VALUES ('4315d479092d4bc8ac50574ed62bd588', '2023-03-14 09:51:31.885873', 'Sold With', 'Company 2', 'ZXC', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('4ab6b44b02f44004b18b65409bf367d9', '2023-03-14 00:49:59.270395', 'Sold With', 'ZXC', 'yes', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('50d3cfe936b54bcbae43b567b929396b', '2023-03-14 00:49:47.380608', 'Sold With', 'Company 2', 'YES', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('605143b0bd4a41bf8950296cdf3cd5fb', '2023-03-14 07:59:01.814256', 'Sold With', 'Company 2', 'YES', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('60e696781be84e3a8b04c77f3f593190', '2023-03-14 10:36:30.455871', 'Sold With', 'Yes', 'No', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('6351f6bccab140f496926a82b83feb15', '2023-03-14 09:57:26.620687', 'Permit Submitted', '', 'No', 1, '815aa8fcbd064093a5f59614e0d334b7', '');
INSERT INTO `customers_customeractivitylogs` VALUES ('65fc623f6d1f42c58437fb41e53d756a', '2023-03-10 17:46:47.112880', 'Previous Company', 'a', 'aasd', 1, '12d35192a11b4ac5b8c3f4f7c842615e', 'text');
INSERT INTO `customers_customeractivitylogs` VALUES ('6681db68bfe240689d81c9c2a2499011', '2023-03-14 09:51:23.681075', 'Sold With', 'YES', 'Company 2', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('6e25a5ae3a254f32a27c139aea0dc16a', '2023-03-10 22:34:47.481677', 'Equipment Ordered', '', 'NO', 7, '12d35192a11b4ac5b8c3f4f7c842615e', '');
INSERT INTO `customers_customeractivitylogs` VALUES ('723ee65a8f194e6b8884fe2b3299b4dd', '2023-03-14 09:52:05.143376', 'Sold With', 'TEST', 'yes', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('732d7755ebd8409c8648c74c5d0a24cf', '2023-03-14 08:34:15.510661', 'Design Requested', 'Yes', 'No', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', '');
INSERT INTO `customers_customeractivitylogs` VALUES ('7993d71aa39a4bfebce7d059efa70003', '2023-03-14 00:43:21.856683', 'Sold With', 'yes', 'ZXC', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('8209007a9f4044e085bdf63e5b17f704', '2023-03-14 07:59:05.101206', 'Sold With', 'yes', 'Company 2', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('839ca91e1d9d4714b7b8e9e292ca60c5', '2023-03-14 00:47:51.219761', 'Sold With', 'YES', 'Company 2', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('864909ab75124f8ead7145cf6282d815', '2023-03-14 08:29:53.273332', 'Design Requested', '', 'Yes', 1, '815aa8fcbd064093a5f59614e0d334b7', '');
INSERT INTO `customers_customeractivitylogs` VALUES ('866341e72cd74945bcf84c01be8af300', '2023-03-14 00:49:49.579880', 'Sold With', 'YES', 'SAMPLE COMPANY', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('8ad90dfce63844afb15ddf3518dffbfc', '2023-03-14 07:58:59.722404', 'Sold With', 'Company 2', 'yes', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('8c4e7f6f17244c3f88c4ad62d96b4680', '2023-03-14 00:42:12.924063', 'Sold With', '', 'YES', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('991e734ca97c4293b7f9dcc3c1d81b63', '2023-03-14 00:49:51.273052', 'Sold With', 'SAMPLE COMPANY', 'ZXC', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('9aa246770e764d0086c3080c5d910954', '2023-03-14 00:44:30.852614', 'Sold With', 'YES', 'yes', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('9ca5ca50282242b08d794876b2cac990', '2023-03-14 09:59:17.991119', 'PE Stamp Requested', 'Yes', 'Yes', 1, '815aa8fcbd064093a5f59614e0d334b7', '');
INSERT INTO `customers_customeractivitylogs` VALUES ('a30249f41f3c406894988fdfbc2f7ea0', '2023-03-13 22:37:54.722575', 'Design Requested', '', 'Yes', 1, '12d35192a11b4ac5b8c3f4f7c842615e', '');
INSERT INTO `customers_customeractivitylogs` VALUES ('ae4547a2712d462a98442d81d1aebfd2', '2023-03-14 07:58:52.494733', 'Sold With', 'YES', 'Company 2', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('ae5347b0d6c74df4a3fe4c281fddcd00', '2023-03-14 07:59:00.782057', 'Sold With', 'yes', 'Company 2', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('b067e6e142a147b188828b3e387c2d59', '2023-03-10 22:34:49.045672', 'Install Complete', '', 'No', 7, '815aa8fcbd064093a5f59614e0d334b7', '');
INSERT INTO `customers_customeractivitylogs` VALUES ('b0afdb79f50d46e689c8c7d2c14709b9', '2023-03-14 00:42:14.096200', 'Sold With', 'YES', 'yes', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('b32f4be53aa94069b7805218cc859cc6', '2023-03-14 00:47:02.351265', 'Sold With', 'Company 2', 'TEST', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('b3dd58190ee8461796c98663b5efe64c', '2023-03-14 00:44:28.779581', 'Sold With', 'SAMPLE COMPANY', 'YES', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('b4b7de6280a042adbd85680fc72710b8', '2023-03-14 00:47:54.093382', 'Sold With', '', 'yes', 1, '823d96965fff439ea5a484f3ee3895ec', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('b51b2915fbcd422ab02ef19fb5dfcb8c', '2023-03-14 08:35:33.327337', 'Sold With', '', 'yes', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('b69844dbd70947199003ec39fff941df', '2023-03-14 00:44:26.582541', 'Sold With', 'ZXC', 'SAMPLE COMPANY', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('ba245ce8b5d54a819e73b59c3f794fbb', '2023-03-14 00:47:17.977080', 'Sold With', 'TEST', 'YES', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('bacf969f8d824c2fb781aa7412bda4ef', '2023-03-13 22:44:00.299988', 'Commission Percentage', '5', '50', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 'number');
INSERT INTO `customers_customeractivitylogs` VALUES ('bd1c4de832df4963a8b61f932a82bb04', '2023-03-14 10:36:34.490946', 'Sold With', 'Yes', 'No', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('bf4948f1d3574b99a83e261b2f9cb360', '2023-03-14 10:35:25.661787', 'Sold With', '', 'Yes', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('c3cbbf6cde54481babe1b24b185e07e2', '2023-03-12 18:54:30.742518', 'Previous Company', 'aasd', 'aasds', 1, '12d35192a11b4ac5b8c3f4f7c842615e', 'text');
INSERT INTO `customers_customeractivitylogs` VALUES ('c41fafda27794816847a534ec55d26d5', '2023-03-14 00:47:07.180170', 'Sold With', 'yes', 'YES', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('c614f4b1f91b4815b8d844b9f1d8e08e', '2023-03-14 10:21:59.433199', 'Sold With', '', 'Yes', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('c78e396ad3c54f3382414f80a5b469af', '2023-03-14 00:45:29.445976', 'Sold With', 'YES', 'SAMPLE COMPANY', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('cebf672aa3c6409aa5d5686caddddb3a', '2023-03-14 09:57:09.686789', 'Sold With', 'Company 2', 'YES', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('cf8e1d6f0d31432ca4eaac04d68bde71', '2023-03-10 22:34:46.821466', 'Install Complete', '', 'No', 7, '12d35192a11b4ac5b8c3f4f7c842615e', '');
INSERT INTO `customers_customeractivitylogs` VALUES ('d03100ed9ba34af5b74f45ebbc4a87cf', '2023-03-14 00:47:06.077794', 'Sold With', 'Company 2', 'yes', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('d382e89db6d7470bafcd9e8abcc249e6', '2023-03-14 09:51:21.321449', 'Sold With', 'ZXC', 'YES', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('d59c6c4598b14aa4ae8a1e361fc0b7fb', '2023-03-10 22:34:48.393535', 'Equipment Ordered', '', 'NO', 7, '815aa8fcbd064093a5f59614e0d334b7', '');
INSERT INTO `customers_customeractivitylogs` VALUES ('d5bdfe2e4fe242ba81a50d04f987b962', '2023-03-14 00:50:08.619855', 'Sold With', 'yes', 'YES', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('d814dad8f34f40a4a1c43ac144091fd6', '2023-03-14 00:47:04.992854', 'Sold With', 'TEST', 'Company 2', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('d9c2edbc8acd4c1984ffb41c368e659a', '2023-03-14 08:35:38.580378', 'Sold With', 'yes', 'TEST', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('da8f860cd31b47cc927df3f9811e3b28', '2023-03-13 22:38:00.065099', 'Sold With', 'YES', 'ZXC', 1, '12d35192a11b4ac5b8c3f4f7c842615e', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('da92783b8c534d2abf1bfa1798f6e517', '2023-03-14 08:36:05.377792', 'Sold With', 'TEST', 'ZXC', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('de84062dcc434bb290fd30e462cfed31', '2023-03-14 00:47:13.486772', 'Sold With', 'SAMPLE COMPANY', 'TEST', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('df540c7c29214718bb0ad4e000357205', '2023-03-14 00:45:35.865187', 'Sold With', 'SAMPLE COMPANY', 'Company 2', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('e35eb4b68dc9497e8760989aacb75f6f', '2023-03-14 00:45:39.578058', 'Sold With', 'YES', 'SAMPLE COMPANY', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('e4610e401eed477794b7b3d485e33b2c', '2023-03-14 00:48:02.635240', 'Sold With', '', 'YES', 1, '814c236ba5a949058e7bd5899655fb0f', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('e4d921b1be7f45bf9f5839296c9609cc', '2023-03-09 15:08:53.713155', 'Commission Percentage', 'asd', '5', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 'number');
INSERT INTO `customers_customeractivitylogs` VALUES ('e63a57c221804aeca4072c900bef3038', '2023-03-14 10:36:33.431834', 'Sold With', 'No', 'Yes', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('e8204923c6e64c34ba659264e09e87a1', '2023-03-14 09:57:18.228160', 'PE Stamp Requested', '', 'Yes', 1, '815aa8fcbd064093a5f59614e0d334b7', '');
INSERT INTO `customers_customeractivitylogs` VALUES ('ec6c019b3efb4293b8d6f5a52430c7b3', '2023-03-14 07:59:06.091369', 'Sold With', 'Company 2', 'SAMPLE COMPANY', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('ec9f7aaad73b410f897e775854c5ae8d', '2023-03-10 22:19:17.844982', 'SS', 'a', 'ax', 1, '12d35192a11b4ac5b8c3f4f7c842615e', 'text');
INSERT INTO `customers_customeractivitylogs` VALUES ('edebb26947eb46aeb5d1ea3864c76014', '2023-03-14 09:52:03.795850', 'Sold With', 'ZXC', 'TEST', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('efd1b244d891490b9503b6045350db28', '2023-03-14 10:08:28.699112', 'Sold With', 'yes', 'Company 2', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 'choices');
INSERT INTO `customers_customeractivitylogs` VALUES ('f17eb8d5c65a4262ab2bee3e1ea17e24', '2023-03-14 00:47:08.127364', 'Sold With', 'YES', 'SAMPLE COMPANY', 1, '815aa8fcbd064093a5f59614e0d334b7', 'choices');

-- ----------------------------
-- Table structure for customers_customergroups
-- ----------------------------
DROP TABLE IF EXISTS `customers_customergroups`;
CREATE TABLE `customers_customergroups`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customers_customergroups_created_by_id_ce6b5435_fk_auth_user_id`(`created_by_id`) USING BTREE,
  CONSTRAINT `customers_customergroups_created_by_id_ce6b5435_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers_customergroups
-- ----------------------------
INSERT INTO `customers_customergroups` VALUES ('94884b0b070d4238b2a30a68589a7bd5', 'COMPLETED', '2023-03-13 22:56:35.798921', 1, 1);
INSERT INTO `customers_customergroups` VALUES ('a167f9a9179841ad9dd8ac1ce8b120d5', 'done', '2023-03-13 21:36:05.823595', 1, 1);
INSERT INTO `customers_customergroups` VALUES ('f2ab12b88623428f970601c03650cf32', 'PENDING', '2023-03-13 22:44:59.082054', 1, 1);

-- ----------------------------
-- Table structure for customers_customers
-- ----------------------------
DROP TABLE IF EXISTS `customers_customers`;
CREATE TABLE `customers_customers`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `adders` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ahj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ahj_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `calc_red` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `battery_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `commission_percentage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `contract_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `design_requested_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `dob` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `equipment_ordered_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `finance_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `install_complete_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `install_confirmed_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `install_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ic_approved_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ic_submitted_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `kw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `number_of_panels` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `paid_to_closer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `paid_to_manager` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `paid_to_setter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `pe_stamp_requested_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `permit_approved_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `permit_notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `permit_plan_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `permit_submitted_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `previous_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `project_cost` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `their_company_cost` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `their_company_mo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `utility_and_esid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `contract_signed_date` date NULL DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `closer_id` int NULL DEFAULT NULL,
  `manager_id` int NULL DEFAULT NULL,
  `setter_id` int NULL DEFAULT NULL,
  `design_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `contractor_id` int NULL DEFAULT NULL,
  `permit_specialist_id` int NULL DEFAULT NULL,
  `sold_with_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `bank_funded` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `group_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customers_customers_created_by_id_bcaace5c_fk_auth_user_id`(`created_by_id`) USING BTREE,
  INDEX `customers_customers_closer_id_dfcbc787_fk_auth_user_id`(`closer_id`) USING BTREE,
  INDEX `customers_customers_manager_id_3b7d507b_fk_auth_user_id`(`manager_id`) USING BTREE,
  INDEX `customers_customers_setter_id_6efc3ff6_fk_auth_user_id`(`setter_id`) USING BTREE,
  INDEX `customers_customers_contractor_id_97e2d73b_fk_auth_user_id`(`contractor_id`) USING BTREE,
  INDEX `customers_customers_permit_specialist_id_d551f19c_fk_auth_user`(`permit_specialist_id`) USING BTREE,
  INDEX `customers_customers_sold_with_id_9a28083a_fk_customers`(`sold_with_id`) USING BTREE,
  INDEX `customers_customers_battery_id_0034ac66`(`battery_id`) USING BTREE,
  INDEX `customers_customers_design_requested_id_43cb051d`(`design_requested_id`) USING BTREE,
  INDEX `customers_customers_equipment_ordered_id_a3ecade3`(`equipment_ordered_id`) USING BTREE,
  INDEX `customers_customers_install_complete_id_f723b98d`(`install_complete_id`) USING BTREE,
  INDEX `customers_customers_install_confirmed_id_3db5fba4`(`install_confirmed_id`) USING BTREE,
  INDEX `customers_customers_interconnection_approved_id_89059153`(`ic_approved_id`) USING BTREE,
  INDEX `customers_customers_interconnection_submitted_id_baf633a7`(`ic_submitted_id`) USING BTREE,
  INDEX `customers_customers_pe_stamp_requested_id_c1272941`(`pe_stamp_requested_id`) USING BTREE,
  INDEX `customers_customers_permit_approved_id_ed49cb9f`(`permit_approved_id`) USING BTREE,
  INDEX `customers_customers_permit_submitted_id_d45cb475`(`permit_submitted_id`) USING BTREE,
  INDEX `customers_customers_group_id_ba27131b_fk_customers`(`group_id`) USING BTREE,
  CONSTRAINT `customers_customers_battery_id_0034ac66_fk_customers` FOREIGN KEY (`battery_id`) REFERENCES `customers_customerselectoptions` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_closer_id_dfcbc787_fk_auth_user_id` FOREIGN KEY (`closer_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_contractor_id_97e2d73b_fk_auth_user_id` FOREIGN KEY (`contractor_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_created_by_id_bcaace5c_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_design_requested_id_43cb051d_fk_customers` FOREIGN KEY (`design_requested_id`) REFERENCES `customers_customerselectoptions` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_equipment_ordered_id_a3ecade3_fk_customers` FOREIGN KEY (`equipment_ordered_id`) REFERENCES `customers_customerselectoptions` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_group_id_ba27131b_fk_customers` FOREIGN KEY (`group_id`) REFERENCES `customers_customergroups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_ic_approved_id_2e9b2057_fk_customers` FOREIGN KEY (`ic_approved_id`) REFERENCES `customers_customerselectoptions` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_ic_submitted_id_cefa8266_fk_customers` FOREIGN KEY (`ic_submitted_id`) REFERENCES `customers_customerselectoptions` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_install_complete_id_f723b98d_fk_customers` FOREIGN KEY (`install_complete_id`) REFERENCES `customers_customerselectoptions` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_install_confirmed_id_3db5fba4_fk_customers` FOREIGN KEY (`install_confirmed_id`) REFERENCES `customers_customerselectoptions` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_manager_id_3b7d507b_fk_auth_user_id` FOREIGN KEY (`manager_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_pe_stamp_requested_i_c1272941_fk_customers` FOREIGN KEY (`pe_stamp_requested_id`) REFERENCES `customers_customerselectoptions` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_permit_approved_id_ed49cb9f_fk_customers` FOREIGN KEY (`permit_approved_id`) REFERENCES `customers_customerselectoptions` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_permit_specialist_id_d551f19c_fk_auth_user` FOREIGN KEY (`permit_specialist_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_permit_submitted_id_d45cb475_fk_customers` FOREIGN KEY (`permit_submitted_id`) REFERENCES `customers_customerselectoptions` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_setter_id_6efc3ff6_fk_auth_user_id` FOREIGN KEY (`setter_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_sold_with_id_9a28083a_fk_customers` FOREIGN KEY (`sold_with_id`) REFERENCES `customers_customerselectoptions` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customers_customers
-- ----------------------------
INSERT INTO `customers_customers` VALUES ('12d35192a11b4ac5b8c3f4f7c842615e', NULL, '684 Osborne St', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'chadescol321@gmail.com', NULL, '', NULL, NULL, NULL, NULL, NULL, '', 'Hudson Kirt', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14314413555', 'aasds', '', 'axc', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-09 15:22:01.541603', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a167f9a9179841ad9dd8ac1ce8b120d5');
INSERT INTO `customers_customers` VALUES ('814c236ba5a949058e7bd5899655fb0f', NULL, '684 Osborne St', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'chardrichescol@gmail.com', NULL, '', NULL, NULL, NULL, NULL, NULL, '', 'John Watsons', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14314413555', '', '', '', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-12 21:22:40.395505', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '94884b0b070d4238b2a30a68589a7bd5');
INSERT INTO `customers_customers` VALUES ('815aa8fcbd064093a5f59614e0d334b7', NULL, '684 Osborne St', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'chardrichescol@gmail.com', NULL, '', NULL, NULL, NULL, NULL, NULL, '', 'Chad Escol', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14314413555', 'zxc', '', '', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-09 15:23:43.364755', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2cbd31bca81f42bb87d3cd3386efbb4d', NULL, '94884b0b070d4238b2a30a68589a7bd5');
INSERT INTO `customers_customers` VALUES ('823d96965fff439ea5a484f3ee3895ec', NULL, '684 Osborne St', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'chardrichescol@gmail.com', NULL, '', NULL, NULL, NULL, NULL, NULL, '', 'Chad Escol', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14314413555', '', '', '', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-13 23:00:04.164101', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f2ab12b88623428f970601c03650cf32');
INSERT INTO `customers_customers` VALUES ('b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 'asdasd', '684 Osborne St', 'asdasknd', 'asdsad', 'zxczxczxc', NULL, '50', 'a', NULL, '2023-03-03', 'johnwick@gmail.com', NULL, 'Finance Company', NULL, NULL, '2023-03-15', NULL, NULL, '6kw', 'John Wick', '25', 'asd', 'asd', 'asd', NULL, NULL, 'asodjasd', '12345', NULL, '14314413555', 'Test Companys', '124000', 'Stay Strong', 'Utah', 'asdasd', 'asd', 'sample only', '2023-03-03', 1, '2023-03-05 12:55:51.186570', 1, 5, 2, 3, 'qweqwe', 4, 6, 'f6ce32ef205d451da969a73af2928a96', '234234', NULL);

-- ----------------------------
-- Table structure for customers_customersattachments
-- ----------------------------
DROP TABLE IF EXISTS `customers_customersattachments`;
CREATE TABLE `customers_customersattachments`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `customer_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `date_uploaded` datetime(6) NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `uploaded_by_id` int NOT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customers_customersf_customer_id_785350fa_fk_customers`(`customer_id`) USING BTREE,
  INDEX `customers_customersfiles_uploaded_by_id_00a58cf6_fk_auth_user_id`(`uploaded_by_id`) USING BTREE,
  CONSTRAINT `customers_customersf_customer_id_785350fa_fk_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers_customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customersfiles_uploaded_by_id_00a58cf6_fk_auth_user_id` FOREIGN KEY (`uploaded_by_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customers_customersattachments
-- ----------------------------
INSERT INTO `customers_customersattachments` VALUES ('1d3f7b7a85d64106b2d336ce93090466', '12d35192a11b4ac5b8c3f4f7c842615e', '2023-03-09 15:22:01.554604', 'front_of_house', 1, 1, '/attachments/1110%20Baptist%20World%20Center_TDEC%20NOI%20%26%20SWPPP.pdf');
INSERT INTO `customers_customersattachments` VALUES ('24b86e0bcf2b41409d57fe0f19bf428b', '815aa8fcbd064093a5f59614e0d334b7', '2023-03-09 15:23:43.377753', 'front_of_house', 1, 1, '/attachments/1110%20Baptist%20World%20Center_TDEC%20NOI%20%26%20SWPPP_P2d0xF0.pdf');
INSERT INTO `customers_customersattachments` VALUES ('5fbd48a3b7ee4ab883adbb0710e25c8b', '823d96965fff439ea5a484f3ee3895ec', '2023-03-13 23:00:04.190101', 'panel_layout', 1, 1, '/attachments/1110%20Baptist%20World%20Center_TDEC%20NOI%20%26%20SWPPP_ZqjPfTR.pdf');
INSERT INTO `customers_customersattachments` VALUES ('703afc71cb7e4fbc9c42d0ccc2029546', '823d96965fff439ea5a484f3ee3895ec', '2023-03-13 23:00:04.177100', 'front_of_house', 1, 1, '/attachments/1110%20Baptist%20World%20Center_TDEC%20NOI%20%26%20SWPPP_T4rVqwN.pdf');
INSERT INTO `customers_customersattachments` VALUES ('b182efd5b8fe40eb8ac5d8257e9781a3', '815aa8fcbd064093a5f59614e0d334b7', '2023-03-09 15:23:43.390758', 'panel_layout', 1, 1, '/attachments/1110%20Baptist%20World%20Center_TDEC%20NOI%20%26%20SWPPP_ARoe4QB.pdf');

-- ----------------------------
-- Table structure for customers_customerselectoptions
-- ----------------------------
DROP TABLE IF EXISTS `customers_customerselectoptions`;
CREATE TABLE `customers_customerselectoptions`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `created_by_id` int NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customers_customerse_created_by_id_2135e577_fk_auth_user`(`created_by_id`) USING BTREE,
  CONSTRAINT `customers_customerse_created_by_id_2135e577_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customers_customerselectoptions
-- ----------------------------
INSERT INTO `customers_customerselectoptions` VALUES ('2cbd31bca81f42bb87d3cd3386efbb4d', 'Yes', 'sold_with', '2023-03-14 10:21:54.150312', 1, 'success');
INSERT INTO `customers_customerselectoptions` VALUES ('f6ce32ef205d451da969a73af2928a96', 'No', 'sold_with', '2023-03-14 10:36:24.678968', 1, 'danger');

-- ----------------------------
-- Table structure for customers_customerspeople
-- ----------------------------
DROP TABLE IF EXISTS `customers_customerspeople`;
CREATE TABLE `customers_customerspeople`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `added_by_id` int NOT NULL,
  `customer_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customers_customerspeople_added_by_id_d0bf4e0c_fk_auth_user_id`(`added_by_id`) USING BTREE,
  INDEX `customers_customersp_customer_id_c900383b_fk_customers`(`customer_id`) USING BTREE,
  INDEX `customers_customerspeople_user_id_5f9412f9_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `customers_customersp_customer_id_c900383b_fk_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers_customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customerspeople_added_by_id_d0bf4e0c_fk_auth_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customerspeople_user_id_5f9412f9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customers_customerspeople
-- ----------------------------
INSERT INTO `customers_customerspeople` VALUES ('003432776ed4431fa95d49ba1b3dd9a5', '2023-03-05 12:55:51.193629', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 1);
INSERT INTO `customers_customerspeople` VALUES ('1c15723da9e2414c872c326e3153c198', '2023-03-05 12:55:51.192628', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 5);
INSERT INTO `customers_customerspeople` VALUES ('286c7ad1ac1f4e0581a8ffbee8cb63fa', '2023-03-13 23:00:04.164101', 1, '823d96965fff439ea5a484f3ee3895ec', 1);
INSERT INTO `customers_customerspeople` VALUES ('5b059cdd964343fa9ffcc1d40afae3ca', '2023-03-12 21:22:40.396503', 1, '814c236ba5a949058e7bd5899655fb0f', 1);
INSERT INTO `customers_customerspeople` VALUES ('5c71c28553124d93aaa0f74de8782ed4', '2023-03-05 12:55:51.190574', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 2);
INSERT INTO `customers_customerspeople` VALUES ('873d631604164ece888583c20c4865e6', '2023-03-05 12:55:51.192628', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 6);
INSERT INTO `customers_customerspeople` VALUES ('b550557dc8564b5b8dcbe40500c74f1e', '2023-03-05 12:55:51.192628', 1, 'b0ac0f4bcb6c4b5f8b6fd9bf1ce962ae', 4);
INSERT INTO `customers_customerspeople` VALUES ('da2bdbd8fe114ec588037ffb217cae1e', '2023-03-09 15:23:43.365756', 1, '815aa8fcbd064093a5f59614e0d334b7', 1);
INSERT INTO `customers_customerspeople` VALUES ('ffb7564c1c0444759b8cc7d46dbd67f4', '2023-03-09 15:22:01.542603', 1, '12d35192a11b4ac5b8c3f4f7c842615e', 1);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2023-03-03 13:42:29.205762', '1', 'admin', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (2, '2023-03-03 13:42:32.328252', '2', 'manager', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (3, '2023-03-03 13:42:41.877739', '3', 'closer', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (4, '2023-03-03 13:42:44.119759', '4', 'setter', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (5, '2023-03-03 13:42:53.497846', '5', 'permit_specialist', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (6, '2023-03-03 13:43:03.003620', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (7, '2023-03-03 13:43:21.853415', '2', 'manager', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (8, '2023-03-03 13:43:29.138472', '2', 'manager', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (9, '2023-03-03 13:43:45.205588', '3', 'closer', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (10, '2023-03-03 13:44:33.494070', '4', 'contractor', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (11, '2023-03-03 13:44:43.098914', '4', 'contractor', 2, '[]', 4, 1);
INSERT INTO `django_admin_log` VALUES (12, '2023-03-03 13:44:48.351443', '6', 'contractor', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (13, '2023-03-03 13:44:55.544410', '4', 'contractor', 2, '[]', 4, 1);
INSERT INTO `django_admin_log` VALUES (14, '2023-03-03 13:45:08.834785', '4', 'contractor', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (15, '2023-03-03 13:45:16.860363', '3', 'closer', 2, '[]', 4, 1);
INSERT INTO `django_admin_log` VALUES (16, '2023-03-03 13:45:36.934430', '3', 'closer', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (17, '2023-03-03 13:45:57.881325', '5', 'setter', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (18, '2023-03-03 13:46:07.179433', '5', 'setter', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (19, '2023-03-03 13:46:20.233175', '6', 'permit_specialist', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (20, '2023-03-03 13:46:24.364896', '6', 'permit_specialist', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (21, '2023-03-10 19:57:05.978817', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (22, '2023-03-10 19:57:30.966697', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (23, '2023-03-10 22:36:28.929132', '7', 'admin2', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (24, '2023-03-10 22:36:38.246695', '7', 'spencer', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (25, '2023-03-10 22:36:47.712956', '8', 'ca', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (26, '2023-03-10 22:37:14.991156', '9', 'cory', 2, '[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (27, '2023-03-10 22:37:27.890697', '10', 'aj', 2, '[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\", \"Groups\"]}}]', 4, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (7, 'backend', 'clients');
INSERT INTO `django_content_type` VALUES (8, 'backend', 'customers');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (13, 'customers', 'customeractivitylogs');
INSERT INTO `django_content_type` VALUES (14, 'customers', 'customergroups');
INSERT INTO `django_content_type` VALUES (9, 'customers', 'customers');
INSERT INTO `django_content_type` VALUES (10, 'customers', 'customersattachments');
INSERT INTO `django_content_type` VALUES (12, 'customers', 'customerselectoptions');
INSERT INTO `django_content_type` VALUES (11, 'customers', 'customerspeople');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2023-02-27 09:01:43.561715');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2023-02-27 09:01:43.795495');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2023-02-27 09:01:43.888977');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-02-27 09:01:43.903060');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-27 09:01:43.909067');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-02-27 09:01:43.966053');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-02-27 09:01:43.996053');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-02-27 09:01:44.012068');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-02-27 09:01:44.017073');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-02-27 09:01:44.049607');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-02-27 09:01:44.051608');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-02-27 09:01:44.058615');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-02-27 09:01:44.090644');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-02-27 09:01:44.127181');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-02-27 09:01:44.141195');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-02-27 09:01:44.146198');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-02-27 09:01:44.175054');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2023-02-27 09:01:44.193070');
INSERT INTO `django_migrations` VALUES (19, 'backend', '0001_initial', '2023-02-28 10:23:37.144066');
INSERT INTO `django_migrations` VALUES (20, 'backend', '0002_delete_customers', '2023-02-28 10:24:02.474331');
INSERT INTO `django_migrations` VALUES (21, 'customers', '0001_initial', '2023-02-28 10:25:11.115762');
INSERT INTO `django_migrations` VALUES (22, 'customers', '0002_rename_full_name_customers_adders_customers_address_and_more', '2023-02-28 22:46:34.560774');
INSERT INTO `django_migrations` VALUES (23, 'customers', '0003_remove_customers_contact_signed_date_and_more', '2023-02-28 22:59:14.106690');
INSERT INTO `django_migrations` VALUES (24, 'customers', '0004_alter_customers_interconnection_approved_and_more', '2023-03-01 20:10:46.028940');
INSERT INTO `django_migrations` VALUES (25, 'customers', '0005_customers_created_by_customers_date_created_and_more', '2023-03-02 20:45:26.255230');
INSERT INTO `django_migrations` VALUES (26, 'customers', '0006_rename_customersfiles_customersattachments', '2023-03-03 12:56:54.612726');
INSERT INTO `django_migrations` VALUES (27, 'customers', '0007_rename_status_customers_is_active_and_more', '2023-03-03 13:01:45.253922');
INSERT INTO `django_migrations` VALUES (28, 'customers', '0008_customerspeople', '2023-03-03 14:33:56.258512');
INSERT INTO `django_migrations` VALUES (29, 'customers', '0009_customers_closer_customers_manager_customers_setter', '2023-03-03 15:02:50.027677');
INSERT INTO `django_migrations` VALUES (30, 'customers', '0010_alter_customers_closer_alter_customers_manager_and_more', '2023-03-03 15:25:17.610021');
INSERT INTO `django_migrations` VALUES (31, 'customers', '0011_alter_customers_design_requested_and_more', '2023-03-03 22:46:09.187873');
INSERT INTO `django_migrations` VALUES (32, 'customers', '0012_customers_design_fee', '2023-03-04 08:01:12.235489');
INSERT INTO `django_migrations` VALUES (33, 'customers', '0013_alter_customers_equipment_ordered_and_more', '2023-03-04 08:07:24.135984');
INSERT INTO `django_migrations` VALUES (34, 'customers', '0014_customers_contractor_customers_permit_specialist', '2023-03-04 22:16:39.714317');
INSERT INTO `django_migrations` VALUES (35, 'customers', '0015_customerselectoptions', '2023-03-04 23:13:48.552001');
INSERT INTO `django_migrations` VALUES (36, 'customers', '0016_customers_nsold_with', '2023-03-04 23:14:44.133019');
INSERT INTO `django_migrations` VALUES (37, 'customers', '0017_remove_customers_sold_with', '2023-03-04 23:17:58.300665');
INSERT INTO `django_migrations` VALUES (38, 'customers', '0018_rename_nsold_with_customers_sold_with', '2023-03-04 23:18:29.729246');
INSERT INTO `django_migrations` VALUES (39, 'customers', '0019_alter_customers_battery_and_more', '2023-03-05 12:49:15.855134');
INSERT INTO `django_migrations` VALUES (40, 'customers', '0020_rename_interconnection_approved_customers_ic_approved_and_more', '2023-03-05 13:15:48.776507');
INSERT INTO `django_migrations` VALUES (41, 'customers', '0021_rename_bank_funded_customers_calc_red', '2023-03-05 13:49:48.253496');
INSERT INTO `django_migrations` VALUES (42, 'customers', '0022_customers_bank_funded', '2023-03-05 13:49:48.279519');
INSERT INTO `django_migrations` VALUES (43, 'customers', '0023_rename_bank_funded_customers_bank_fundeds', '2023-03-05 13:50:23.497609');
INSERT INTO `django_migrations` VALUES (44, 'customers', '0024_rename_bank_fundeds_customers_bank_funded', '2023-03-05 13:50:34.744173');
INSERT INTO `django_migrations` VALUES (45, 'customers', '0025_customerupdates', '2023-03-06 23:39:29.536358');
INSERT INTO `django_migrations` VALUES (46, 'customers', '0026_rename_customerupdates_customeractivitylogs', '2023-03-06 23:39:48.995059');
INSERT INTO `django_migrations` VALUES (47, 'customers', '0027_customeractivitylogs_customer', '2023-03-09 12:01:14.597162');
INSERT INTO `django_migrations` VALUES (48, 'customers', '0028_customeractivitylogs_field_type', '2023-03-09 14:40:44.636359');
INSERT INTO `django_migrations` VALUES (49, 'customers', '0029_alter_customers_approved_permit', '2023-03-09 15:23:17.443727');
INSERT INTO `django_migrations` VALUES (50, 'customers', '0030_remove_customers_approved_permit_and_more', '2023-03-09 15:26:09.505196');
INSERT INTO `django_migrations` VALUES (51, 'customers', '0031_alter_customers_battery_and_more', '2023-03-12 18:53:07.729316');
INSERT INTO `django_migrations` VALUES (52, 'customers', '0032_customerselectoptions_color', '2023-03-13 13:47:44.782202');
INSERT INTO `django_migrations` VALUES (53, 'customers', '0033_alter_customerselectoptions_color', '2023-03-13 13:48:04.507394');
INSERT INTO `django_migrations` VALUES (54, 'customers', '0034_alter_customers_sold_with', '2023-03-14 08:19:13.038394');
INSERT INTO `django_migrations` VALUES (55, 'customers', '0035_alter_customers_sold_with', '2023-03-14 08:19:42.396797');
INSERT INTO `django_migrations` VALUES (56, 'customers', '0036_alter_customers_sold_with', '2023-03-14 08:24:30.165444');
INSERT INTO `django_migrations` VALUES (57, 'customers', '0037_alter_customers_battery_and_more', '2023-03-14 08:25:08.376951');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('12o9b83w4znebrhhjc6zzg4tjjd817jf', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1pa6n2:ArIQgQ8Ie6a6ZvbqWe-2ypF5Y-DK7cs4dKC7iGZ3bFQ', '2023-03-23 11:18:00.202787');
INSERT INTO `django_session` VALUES ('4bk9snfrwje7h0lthazok2wyulmbwuzv', '.eJxVjDsOwjAUBO_iGlmOHf8o6TlDtM9-xgGUSHFSIe4OkVJAuzOzLzFgW-uwNV6GMYuz8OL0uxHSg6cd5Dum2yzTPK3LSHJX5EGbvM6Zn5fD_TuoaPVbF-OMiqAcY580vLeOTeHSO5WgScF2HTwFRHLWMlMEnA45-GACtBLvD_CFOAs:1padRw:GexPShxRQKcPXRjaQZZFIj0Vg_pDQwmT5b9FQ64JZZs', '2023-03-24 22:10:24.888091');
INSERT INTO `django_session` VALUES ('73fejej24ffaaki971to982cuqpulxsl', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1pYSaE:H-ybNhXeuJPHkOrvWiHF-ybRiBaNH90vIWQd3QrEJx0', '2023-03-18 22:09:58.542448');
INSERT INTO `django_session` VALUES ('7jg5sjo1lu83awz07aorfek6jn51v0ki', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1padpu:3_35zLa8JJV72PCjjfm4NgI9mCN8Xu0d1AoF7yfkXxo', '2023-03-24 22:35:10.819393');
INSERT INTO `django_session` VALUES ('dlwz1yn5flegf1lckdhmdckvah7qx58t', '.eJxVjDEOgzAMRe-SuYoIiR3o2J0zIBs7DW0FEoGp6t2rSAzt-t97_21GOvY8HkW3cRZzNWAuvxvT9NSlAnnQcl_ttC77NrOtij1pscMq-rqd7t9BppJr7ZIIckgUJaIHTQ0Aiifn2oDcao-pc-SJQhRglRD7Dj1Dz14bBPP5Avu9OA4:1padI0:V42RGObznC8XIiZyHI2XB_pGrk_kALOdlo0dN-ss6Ng', '2023-03-24 22:00:08.341554');
INSERT INTO `django_session` VALUES ('ex4uk0ykc7elangg2xfecrkc6eh8mfhe', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1pXLAr:4KbckRTYXsuSkinKcO7WinCkDg5zu0oagnHpPZhwqQw', '2023-03-15 20:03:09.616261');
INSERT INTO `django_session` VALUES ('h2yc6yc2o60o1gw80piktv8kvpi9hllj', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1pbJAe:lM4a34ZtygFB0U_mq381RKVYGHvpTpz3GkFetO_nYHo', '2023-03-26 18:43:20.403048');
INSERT INTO `django_session` VALUES ('m6rtxnuow5af6s4twgou924nqcv1rqf6', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1pXDuX:_ZPjaHxnN9c0VzHU1UToWuPg-9_4dLDH6AHUZGwFn5I', '2023-03-15 12:17:49.674017');
INSERT INTO `django_session` VALUES ('p2ti23m5nwqzuw2853cbdppgglize7ak', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1pWomQ:1xscPFQcjEqsruJu1sog2WLgvYtGi5dUHKKWHxt-280', '2023-03-14 09:27:46.545639');
INSERT INTO `django_session` VALUES ('yiub1sgh7fqc24b7mu8m8jp3omwnogqv', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1paYDo:EDVpWd63oBENNbeOOl5EBSmuQboJ0qigsGp_Fg9T9uQ', '2023-03-24 16:35:28.460612');
INSERT INTO `django_session` VALUES ('zzx96ao988ms92pn4n4q8u58fxsu1dq1', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1pX04d:jJ0z7Uq786vYc5VeqS2zU9cLUmgZjMPl0NHh8aAuZ-g', '2023-03-14 21:31:19.761385');

SET FOREIGN_KEY_CHECKS = 1;
