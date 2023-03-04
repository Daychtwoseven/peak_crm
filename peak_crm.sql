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

 Date: 04/03/2023 10:28:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$390000$7SuS5pb2vwP8KF1phhOs0N$6D/O3ROgmblCfxaMkouDuaagSNpezdmaEWz8gXclTnk=', '2023-03-02 11:44:11.000000', 1, 'admin', 'Chad', 'Escol', 'admin@gmail.com', 1, 1, '2023-02-27 09:02:05.000000');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$390000$O0KQrF4HOoD4W5V4DDvN0K$fFaIsynaDaladsI+d0uJNzpXZ2nbiyGog8wCmdrRjLQ=', NULL, 0, 'manager', 'John ', 'Wick', '', 0, 1, '2023-03-03 13:43:21.000000');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$390000$9hx0sEPWPWJaJZBCe5AaV2$khxBGaSEbnLK8OEhh3XZxa3bil3JFuL1a7GA86g8aYM=', NULL, 0, 'closer', 'David', 'Guetta', '', 0, 1, '2023-03-03 13:43:45.000000');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$390000$nnJQn7zVjqdXVRtdPluY00$q5kd2BQzFdOeaXqwdN2arAEua4VN94r+1XKm5JkhaEk=', NULL, 0, 'contractor', 'Klay', 'Thompson', '', 0, 1, '2023-03-03 13:44:33.000000');
INSERT INTO `auth_user` VALUES (5, 'pbkdf2_sha256$390000$lSRBW1MVCTJQ62cVJSqgr8$LyXnlwLpzA4dvAprgxJ6+3PNIqOSI7teTbpcGqv5IDw=', NULL, 0, 'setter', 'Jordan ', 'Clarkson', '', 0, 1, '2023-03-03 13:45:57.000000');
INSERT INTO `auth_user` VALUES (6, 'pbkdf2_sha256$390000$tpBwrq2QIErkqmWDIz0izB$DOqdIHwoOT+svnrYPVHxpqTfgwGim2V6mBjMmDsm0ko=', NULL, 0, 'permit_specialist', 'Stephen', 'Curry', '', 0, 1, '2023-03-03 13:46:20.000000');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
INSERT INTO `auth_user_groups` VALUES (1, 1, 1);
INSERT INTO `auth_user_groups` VALUES (2, 2, 2);
INSERT INTO `auth_user_groups` VALUES (4, 3, 3);
INSERT INTO `auth_user_groups` VALUES (3, 4, 6);
INSERT INTO `auth_user_groups` VALUES (5, 5, 4);
INSERT INTO `auth_user_groups` VALUES (6, 6, 5);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

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
  `approved_permit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `bank_funded` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `battery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `commission_percentage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `contract_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `design_requested` tinyint(1) NOT NULL,
  `dob` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `equipment_ordered` tinyint(1) NOT NULL,
  `finance_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `install_complete` tinyint(1) NOT NULL,
  `install_confirmed` tinyint(1) NOT NULL,
  `install_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `interconnection_approved` tinyint(1) NOT NULL,
  `interconnection_submitted` tinyint(1) NOT NULL,
  `kw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `number_of_panels` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `paid_to_closer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `paid_to_manager` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `paid_to_setter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `pe_stamp_requested` tinyint(1) NOT NULL,
  `permit_approved` tinyint(1) NOT NULL,
  `permit_notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `permit_plan_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `permit_submitted` tinyint(1) NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `previous_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `project_cost` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `sold_with` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
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
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customers_customers_created_by_id_bcaace5c_fk_auth_user_id`(`created_by_id`) USING BTREE,
  INDEX `customers_customers_closer_id_dfcbc787_fk_auth_user_id`(`closer_id`) USING BTREE,
  INDEX `customers_customers_manager_id_3b7d507b_fk_auth_user_id`(`manager_id`) USING BTREE,
  INDEX `customers_customers_setter_id_6efc3ff6_fk_auth_user_id`(`setter_id`) USING BTREE,
  CONSTRAINT `customers_customers_closer_id_dfcbc787_fk_auth_user_id` FOREIGN KEY (`closer_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_created_by_id_bcaace5c_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_manager_id_3b7d507b_fk_auth_user_id` FOREIGN KEY (`manager_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_customers_setter_id_6efc3ff6_fk_auth_user_id` FOREIGN KEY (`setter_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers_customers
-- ----------------------------
INSERT INTO `customers_customers` VALUES ('17c402866e714104852c9b4f8b95fe32', NULL, '684 Osborne St', NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, 'chardrichescol@gmail.com', 0, '', 0, 0, NULL, 0, 0, '', 'John Watsons', '', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 'asdasd', 'dang heey', '', '', '', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-03 15:28:05.009459', 1, NULL, NULL, NULL, NULL);
INSERT INTO `customers_customers` VALUES ('2dcca8852aee4607ab42ca00261d4007', NULL, '684 Osborne St', NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, 'chardrichescol@gmail.com', 0, '', 0, 0, NULL, 0, 0, '', 'John Watsons', '', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, '14314413555', 'asdasd', '', '', '', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-03 15:31:58.287914', 1, NULL, 2, NULL, NULL);
INSERT INTO `customers_customers` VALUES ('6f4bdc3117484d94886c1003162b0186', NULL, '684 Osborne St', NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, 'chardrichescol@gmail.com', 0, '', 0, 0, NULL, 0, 0, '', 'John Watsons', '', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, '14314413555', 'zxczxc', '', '', '', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-03 15:32:49.209484', 1, 3, 2, 5, NULL);
INSERT INTO `customers_customers` VALUES ('80f5f64e609f4213a0771d6d8cbf9b8c', NULL, '684 Osborne St', NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, 'chardrichescol@gmail.com', 0, '', 0, 0, NULL, 0, 0, '', 'John Watsons', '', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, '14314413555', 'at first saw you', '', '', '', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-03 15:33:58.615542', 1, 5, 2, 3, NULL);
INSERT INTO `customers_customers` VALUES ('890eacbabfac4b43b79841b8868e2d4b', NULL, '684 Osborne St', NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, 'chardrichescol@gmail.com', 0, '', 0, 0, NULL, 0, 0, '', 'John Watsons', '', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, '14314413555', 'zxczxczxc', '', '', '', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-03 15:27:51.569399', 1, 5, 2, 3, NULL);
INSERT INTO `customers_customers` VALUES ('a6acd84e2e5a4b90b8aded75c6e4fa2a', NULL, '684 Osborne St', NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, 'citations1@allstarpaintingcompany.ca', 0, '', 0, 0, NULL, 0, 0, '', 'John Watsons', '', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, '14314413555', 'zxczxcqweasdzxcasdqweasdasdasdasdzxcasdqweasdqweqweasdzxcasdqweasdasd', '', '', '', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-03 15:30:31.121622', 1, 3, 2, 5, NULL);
INSERT INTO `customers_customers` VALUES ('a986f82e5a564a559a999c66f6f7d34b', NULL, '684 Osborne St', NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, 'chardrichescol@gmail.com', 0, '', 0, 0, NULL, 0, 0, '', 'John Watsons', '', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, '14314413555', '', '', '', '', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-03 15:29:54.825511', 1, 5, 2, 3, NULL);
INSERT INTO `customers_customers` VALUES ('bfe927c06ef1418ca78b2134ac632362', NULL, '684 Osborne St', NULL, NULL, '', NULL, NULL, NULL, NULL, 1, NULL, 'chardrichescol@gmail.com', 0, '', 0, 0, NULL, 0, 0, '', 'John Watsons', '', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, '14314413555', '', '', '', '', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-03 15:26:29.678514', 1, 5, 2, 3, NULL);
INSERT INTO `customers_customers` VALUES ('cb4269dc579d4c95b2bbd9eb6ad17b1a', NULL, '684 Osborne St', NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, 'citations2@allstarpaintingcompany.ca', 0, '', 0, 0, NULL, 0, 0, '', 'John Watsons', '', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, '14314413555', '', '', '', '', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-03 15:28:54.516497', 1, 3, 2, 5, NULL);
INSERT INTO `customers_customers` VALUES ('e935fee631b54b7fa067cd914d81f92c', NULL, '684 Osborne St', NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, 'chardrichescol@gmail.com', 0, '', 0, 0, NULL, 0, 0, '', 'John Watsons', '', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, '14314413555', '', '', '', '', 'Utah', NULL, NULL, NULL, NULL, 1, '2023-03-03 15:31:27.022914', 1, 5, 2, 5, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers_customersattachments
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers_customerspeople
-- ----------------------------
INSERT INTO `customers_customerspeople` VALUES ('1dd0cece457d45758f1f382185be0885', '2023-03-03 15:32:49.212022', 1, '6f4bdc3117484d94886c1003162b0186', 1);
INSERT INTO `customers_customerspeople` VALUES ('1f341e5126b447bdb41853f12e290c4b', '2023-03-03 15:29:54.828514', 1, 'a986f82e5a564a559a999c66f6f7d34b', 5);
INSERT INTO `customers_customerspeople` VALUES ('229345a31e16499194b8a40ee30c9693', '2023-03-03 15:28:54.519633', 1, 'cb4269dc579d4c95b2bbd9eb6ad17b1a', 6);
INSERT INTO `customers_customerspeople` VALUES ('2653236111cf45fa86baebec33a19e1f', '2023-03-03 15:27:51.571400', 1, '890eacbabfac4b43b79841b8868e2d4b', 4);
INSERT INTO `customers_customerspeople` VALUES ('2d5890ae7e2244dc8d37bf386dcdec3e', '2023-03-03 15:31:58.288915', 1, '2dcca8852aee4607ab42ca00261d4007', 1);
INSERT INTO `customers_customerspeople` VALUES ('3c7eef15c4344f7cbe03b3dc39e84672', '2023-03-03 15:26:29.682860', 1, 'bfe927c06ef1418ca78b2134ac632362', 6);
INSERT INTO `customers_customerspeople` VALUES ('5aec31acaf574a9ba49b1cbb26e245b9', '2023-03-03 15:29:54.828514', 1, 'a986f82e5a564a559a999c66f6f7d34b', 4);
INSERT INTO `customers_customerspeople` VALUES ('5f02276077c141cfa7537a2d86e17eb0', '2023-03-03 15:33:58.617406', 1, '80f5f64e609f4213a0771d6d8cbf9b8c', 4);
INSERT INTO `customers_customerspeople` VALUES ('649eff4317264e7684966f7207c22f8e', '2023-03-03 15:30:31.124074', 1, 'a6acd84e2e5a4b90b8aded75c6e4fa2a', 1);
INSERT INTO `customers_customerspeople` VALUES ('6b638426cdaf4f0fb5294bf1a0971a15', '2023-03-03 15:26:29.682860', 1, 'bfe927c06ef1418ca78b2134ac632362', 5);
INSERT INTO `customers_customerspeople` VALUES ('764cc78e878c47c3af9f940f83c3a487', '2023-03-03 15:28:05.010459', 1, '17c402866e714104852c9b4f8b95fe32', 1);
INSERT INTO `customers_customerspeople` VALUES ('7bfa914248554efea1b9ad034f88d7a6', '2023-03-03 15:26:29.682860', 1, 'bfe927c06ef1418ca78b2134ac632362', 1);
INSERT INTO `customers_customerspeople` VALUES ('7d60fe739a744c2dbe095f7c5cc49955', '2023-03-03 15:28:54.519633', 1, 'cb4269dc579d4c95b2bbd9eb6ad17b1a', 4);
INSERT INTO `customers_customerspeople` VALUES ('950d9a9f226f4ca7ac6f677797f553fd', '2023-03-03 15:30:31.124074', 1, 'a6acd84e2e5a4b90b8aded75c6e4fa2a', 6);
INSERT INTO `customers_customerspeople` VALUES ('a415c6f19a5e48e5b438cee366ac4e4d', '2023-03-03 15:27:51.572401', 1, '890eacbabfac4b43b79841b8868e2d4b', 1);
INSERT INTO `customers_customerspeople` VALUES ('a58843b5ddd545c09a468f30f57eec13', '2023-03-03 15:30:31.124074', 1, 'a6acd84e2e5a4b90b8aded75c6e4fa2a', 3);
INSERT INTO `customers_customerspeople` VALUES ('a5d489607eaf473ea37942e9851b6918', '2023-03-03 15:31:27.025917', 1, 'e935fee631b54b7fa067cd914d81f92c', 1);
INSERT INTO `customers_customerspeople` VALUES ('bd51862111b645aca7831d0974b2fb6e', '2023-03-03 15:31:27.025917', 1, 'e935fee631b54b7fa067cd914d81f92c', 5);
INSERT INTO `customers_customerspeople` VALUES ('c6f7c93c7b4f431696d2a29e6580e3b4', '2023-03-03 15:29:54.828514', 1, 'a986f82e5a564a559a999c66f6f7d34b', 1);
INSERT INTO `customers_customerspeople` VALUES ('caef1b486bc2441688a4840330de7703', '2023-03-03 15:26:29.680855', 1, 'bfe927c06ef1418ca78b2134ac632362', 3);
INSERT INTO `customers_customerspeople` VALUES ('d177a52052e4437f938a1d06111b0dcd', '2023-03-03 15:33:58.617406', 1, '80f5f64e609f4213a0771d6d8cbf9b8c', 1);
INSERT INTO `customers_customerspeople` VALUES ('e990f5257c924ab7924f6f71174115e7', '2023-03-03 15:28:54.520634', 1, 'cb4269dc579d4c95b2bbd9eb6ad17b1a', 1);
INSERT INTO `customers_customerspeople` VALUES ('ebc0542573a94ab2a372ef219bcd607b', '2023-03-03 15:31:27.025917', 1, 'e935fee631b54b7fa067cd914d81f92c', 3);
INSERT INTO `customers_customerspeople` VALUES ('ffda2ee98c69408a93e6329a18521818', '2023-03-03 15:32:49.211018', 1, '6f4bdc3117484d94886c1003162b0186', 4);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `django_content_type` VALUES (9, 'customers', 'customers');
INSERT INTO `django_content_type` VALUES (10, 'customers', 'customersattachments');
INSERT INTO `django_content_type` VALUES (11, 'customers', 'customerspeople');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('ex4uk0ykc7elangg2xfecrkc6eh8mfhe', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1pXLAr:4KbckRTYXsuSkinKcO7WinCkDg5zu0oagnHpPZhwqQw', '2023-03-15 20:03:09.616261');
INSERT INTO `django_session` VALUES ('m6rtxnuow5af6s4twgou924nqcv1rqf6', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1pXDuX:_ZPjaHxnN9c0VzHU1UToWuPg-9_4dLDH6AHUZGwFn5I', '2023-03-15 12:17:49.674017');
INSERT INTO `django_session` VALUES ('p2ti23m5nwqzuw2853cbdppgglize7ak', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1pWomQ:1xscPFQcjEqsruJu1sog2WLgvYtGi5dUHKKWHxt-280', '2023-03-14 09:27:46.545639');
INSERT INTO `django_session` VALUES ('tvmljhb7qr70lz9lqj09rznbq5t3r5xh', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1pXZrX:VGYeZO0LQZNQz4-MeSg-e3S8FwO8pKevVr1PqG1425A', '2023-03-16 11:44:11.528027');
INSERT INTO `django_session` VALUES ('zzx96ao988ms92pn4n4q8u58fxsu1dq1', '.eJxVjDsOwjAQBe_iGllefxElPWew1rs2DiBbipMq4u4QKQW0b2beJiKuS43ryHOcWFwEiNPvlpCeue2AH9juXVJvyzwluSvyoEPeOufX9XD_DiqO-q21YlQOqGTQxgW0zhDaAAZC0T5Yzsk5MhjIeSDUyFZRAc7WpLPxSbw_1Ws32w:1pX04d:jJ0z7Uq786vYc5VeqS2zU9cLUmgZjMPl0NHh8aAuZ-g', '2023-03-14 21:31:19.761385');

SET FOREIGN_KEY_CHECKS = 1;
