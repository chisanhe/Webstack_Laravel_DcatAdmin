/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : webstack

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_extension_histories
-- ----------------------------
DROP TABLE IF EXISTS `admin_extension_histories`;
CREATE TABLE `admin_extension_histories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_extension_histories_name_index`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_extension_histories
-- ----------------------------

-- ----------------------------
-- Table structure for admin_extensions
-- ----------------------------
DROP TABLE IF EXISTS `admin_extensions`;
CREATE TABLE `admin_extensions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_extensions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_extensions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `extension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `show` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (9, 0, 1, '网站管理', 'fa-internet-explorer', 'sites', '', 1, '2025-05-07 17:04:29', '2025-05-07 17:04:32');
INSERT INTO `admin_menu` VALUES (2, 0, 4, 'Admin', 'feather icon-settings', '', '', 1, '2025-05-07 07:28:32', '2025-05-09 11:41:12');
INSERT INTO `admin_menu` VALUES (3, 2, 5, 'Users', '', 'auth/users', '', 1, '2025-05-07 07:28:32', '2025-05-09 11:41:12');
INSERT INTO `admin_menu` VALUES (4, 2, 6, 'Roles', '', 'auth/roles', '', 1, '2025-05-07 07:28:32', '2025-05-09 11:41:12');
INSERT INTO `admin_menu` VALUES (5, 2, 7, 'Permission', '', 'auth/permissions', '', 1, '2025-05-07 07:28:32', '2025-05-09 11:41:12');
INSERT INTO `admin_menu` VALUES (6, 2, 8, 'Menu', '', 'auth/menu', '', 1, '2025-05-07 07:28:32', '2025-05-09 11:41:12');
INSERT INTO `admin_menu` VALUES (7, 2, 9, 'Extensions', '', 'auth/extensions', '', 1, '2025-05-07 07:28:32', '2025-05-09 11:41:12');
INSERT INTO `admin_menu` VALUES (8, 0, 2, '分类管理', 'fa-bars', 'categories', '', 1, '2025-05-07 16:31:44', '2025-05-07 17:04:32');
INSERT INTO `admin_menu` VALUES (10, 0, 3, '首页 SEO', 'fa-globe', 'seo', '', 1, '2025-05-09 11:41:06', '2025-05-09 13:38:06');

-- ----------------------------
-- Table structure for admin_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_menu`;
CREATE TABLE `admin_permission_menu`  (
  `permission_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_permission_menu_permission_id_menu_id_unique`(`permission_id`, `menu_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_permission_menu
-- ----------------------------

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `parent_id` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'Auth management', 'auth-management', '', '', 1, 0, '2025-05-07 07:28:32', NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Users', 'users', '', '/auth/users*', 2, 1, '2025-05-07 07:28:32', NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Roles', 'roles', '', '/auth/roles*', 3, 1, '2025-05-07 07:28:32', NULL);
INSERT INTO `admin_permissions` VALUES (4, 'Permissions', 'permissions', '', '/auth/permissions*', 4, 1, '2025-05-07 07:28:32', NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Menu', 'menu', '', '/auth/menu*', 5, 1, '2025-05-07 07:28:32', NULL);
INSERT INTO `admin_permissions` VALUES (6, 'Extension', 'extension', '', '/auth/extensions*', 6, 1, '2025-05-07 07:28:32', NULL);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_role_menu_role_id_menu_id_unique`(`role_id`, `menu_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_role_permissions_role_id_permission_id_unique`(`role_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_role_users_role_id_user_id_unique`(`role_id`, `user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, '2025-05-07 07:28:32', '2025-05-07 07:28:32');

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2025-05-07 07:28:32', '2025-05-07 07:28:32');

-- ----------------------------
-- Table structure for admin_settings
-- ----------------------------
DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE `admin_settings`  (
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_settings
-- ----------------------------

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$1/VtCfK7Fdpeq4xxJ06/O.OOkF6s3ckZjaYxcxZoUZEl9fVJ2tz6O', 'Administrator', NULL, NULL, '2025-05-07 07:28:32', '2025-05-07 07:28:32');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (6, '2020_09_07_090635_create_admin_settings_table', 1);
INSERT INTO `migrations` VALUES (7, '2020_09_22_015815_create_admin_extensions_table', 1);
INSERT INTO `migrations` VALUES (8, '2020_11_01_083237_update_admin_menu_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for pro_categories
-- ----------------------------
DROP TABLE IF EXISTS `pro_categories`;
CREATE TABLE `pro_categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父级ID',
  `order` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图标',
  `is_show` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '1显示/0隐藏',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id_is_show_order`(`parent_id`, `is_show`, `order`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '项目 - 分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_categories
-- ----------------------------
INSERT INTO `pro_categories` VALUES (1, 0, 2, '常用推荐', 'fa-star-o', 1, '2019-01-21 12:48:58', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (2, 0, 3, '社区资讯', 'fa-bullhorn', 1, '2019-01-21 12:50:17', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (3, 0, 4, '灵感采集', 'fa-lightbulb-o', 1, '2019-01-21 13:53:10', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (4, 3, 5, '发现产品', 'fa-star-o', 1, '2019-01-21 13:53:31', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (5, 3, 6, '界面灵感', 'fa-star-o', 1, '2019-01-21 13:53:49', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (6, 3, 7, '网页灵感', 'fa-star-o', 1, '2019-01-21 13:54:00', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (7, 0, 8, '素材资源', 'fa-thumbs-o-up', 1, '2019-01-21 13:54:42', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (8, 7, 9, '图标素材', 'fa-star-o', 1, '2019-01-21 13:54:59', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (9, 7, 10, 'LOGO设计', 'fa-star-o', 1, '2019-01-21 13:55:11', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (10, 7, 11, '平面素材', 'fa-star-o', 1, '2019-01-21 13:55:25', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (11, 7, 12, 'UI资源', 'fa-star-o', 1, '2019-01-21 13:55:31', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (12, 7, 13, 'Sketch资源', 'fa-star-o', 1, '2019-01-22 01:00:51', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (13, 7, 14, '字体资源', 'fa-star-o', 1, '2019-01-22 01:01:02', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (14, 7, 15, 'Mockup', 'fa-star-o', 1, '2019-01-22 01:01:12', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (15, 7, 16, '摄影图库', 'fa-star-o', 1, '2019-01-22 01:01:23', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (16, 7, 17, 'PPT资源', 'fa-star-o', 1, '2019-01-22 01:01:33', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (17, 0, 18, '常用工具', 'fa-cogs', 1, '2019-01-22 01:02:04', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (18, 17, 19, '图形创意', 'fa-star-o', 1, '2019-01-22 01:02:14', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (19, 17, 20, '界面设计', 'fa-star-o', 1, '2019-01-22 01:02:24', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (20, 17, 21, '交互动效', 'fa-star-o', 1, '2019-01-22 01:02:32', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (21, 17, 22, '在线配色', 'fa-star-o', 1, '2019-01-22 01:02:40', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (22, 17, 23, '在线工具', 'fa-star-o', 1, '2019-01-22 01:02:49', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (23, 17, 24, 'Chrome插件', 'fa-star-o', 1, '2019-01-22 01:02:58', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (24, 0, 25, '学习教程', 'fa-pencil', 1, '2019-01-22 01:03:17', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (25, 24, 26, '设计规范', 'fa-star-o', 1, '2019-01-22 01:03:29', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (26, 24, 27, '视频教程', 'fa-star-o', 1, '2019-01-22 01:03:36', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (27, 24, 28, '设计文章', 'fa-star-o', 1, '2019-01-22 01:03:44', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (28, 24, 29, '设计电台', 'fa-star-o', 1, '2019-01-22 01:03:52', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (29, 24, 30, '交互设计', 'fa-star-o', 1, '2019-01-22 01:04:03', '2025-05-07 16:50:47', NULL);
INSERT INTO `pro_categories` VALUES (30, 0, 31, 'UED团队', 'fa-user', 1, '2019-01-22 01:05:39', '2025-05-07 16:50:47', NULL);

-- ----------------------------
-- Table structure for pro_seo
-- ----------------------------
DROP TABLE IF EXISTS `pro_seo`;
CREATE TABLE `pro_seo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网页标题',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '首页左上角logo',
  `og_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '社交网络上分项时显示的标题',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `site_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网站名称',
  `banner_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'banner图',
  `is_show` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '1显示/0隐藏',
  `baidu_tj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '百度统计代码',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '项目 - 前台首页SEO' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_seo
-- ----------------------------
INSERT INTO `pro_seo` VALUES (1, 'WebStack.cc - 设计师网址导航', 'images/35bca02f09c1f802cae5cdbf82429eac.png', 'WebStack - 收集国内外优秀设计网站、UI设计资源网站、灵感创意网站、素材资源网站，定时更新分享优质产品设计书签。www.webstack.cc', 'keywords', 'WebStack - 收集国内外优秀设计网站、UI设计资源网站、灵感创意网站、素材资源网站，定时更新分享优质产品设计书签。www.webstack.cc', 'WebStack - 收集国内外优秀设计网站、UI设计资源网站、灵感创意网站、素材资源网站，定时更新分享优质产品设计书签。www.webstack.cc', 'images/034ab8b7243cce8c683bd391e2b45c4f.png', 1, NULL, '2025-05-09 11:55:31', '2025-05-09 13:48:08', NULL);

-- ----------------------------
-- Table structure for pro_site_pvs
-- ----------------------------
DROP TABLE IF EXISTS `pro_site_pvs`;
CREATE TABLE `pro_site_pvs`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL COMMENT '分类网站ID',
  `browser_family` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `browser_version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `device_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `device_family` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `device_model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `platform_family` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `platform_version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_id_is_show`(`site_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 233 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '项目 - 分类网站 - 浏览量' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_site_pvs
-- ----------------------------
INSERT INTO `pro_site_pvs` VALUES (1, 2, 'Chrome', '135', 'Desktop', 'Unknown', '', 'Windows', '10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '127.0.0.1', '2025-05-09 13:34:47', '2025-05-09 13:34:47', NULL);
INSERT INTO `pro_site_pvs` VALUES (2, 29, 'Chrome', '135', 'Desktop', 'Unknown', '', 'Windows', '10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '127.0.0.1', '2025-05-09 13:34:51', '2025-05-09 13:34:51', NULL);
INSERT INTO `pro_site_pvs` VALUES (3, 14, 'Chrome', '135', 'Desktop', 'Unknown', '', 'Windows', '10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '127.0.0.1', '2025-05-09 13:34:53', '2025-05-09 13:34:53', NULL);
INSERT INTO `pro_site_pvs` VALUES (4, 26, 'Chrome', '135', 'Desktop', 'Unknown', '', 'Windows', '10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '127.0.0.1', '2025-05-09 13:34:56', '2025-05-09 13:34:56', NULL);
INSERT INTO `pro_site_pvs` VALUES (5, 53, 'Chrome', '135', 'Desktop', 'Unknown', '', 'Windows', '10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '127.0.0.1', '2025-05-09 13:34:58', '2025-05-09 13:34:58', NULL);
INSERT INTO `pro_site_pvs` VALUES (6, 74, 'Chrome', '135', 'Desktop', 'Unknown', '', 'Windows', '10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '127.0.0.1', '2025-05-09 13:35:01', '2025-05-09 13:35:01', NULL);
INSERT INTO `pro_site_pvs` VALUES (7, 13, 'Chrome', '135', 'Desktop', 'Unknown', '', 'Windows', '10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '127.0.0.1', '2025-05-09 13:35:06', '2025-05-09 13:35:06', NULL);
INSERT INTO `pro_site_pvs` VALUES (8, 8, 'Chrome', '135', 'Desktop', 'Unknown', '', 'Windows', '10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '127.0.0.1', '2025-05-09 13:42:50', '2025-05-09 13:42:50', NULL);

-- ----------------------------
-- Table structure for pro_sites
-- ----------------------------
DROP TABLE IF EXISTS `pro_sites`;
CREATE TABLE `pro_sites`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL COMMENT '分类ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `thumb` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `describe` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `url` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '网址',
  `is_show` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '1显示/0隐藏',
  `status_code` tinyint(4) UNSIGNED NULL DEFAULT 200 COMMENT '状态码',
  `pv` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '浏览量',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_id_is_show`(`category_id`, `is_show`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 233 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '项目 - 分类网站' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_sites
-- ----------------------------
INSERT INTO `pro_sites` VALUES (1, 1, 'Dribbble', 'images/7db1257f40b9b04482744387a00b359d.png', '全球UI设计师作品分享平台。', 'https://dribbble.com/', 0, 200, 0, '2019-01-21 15:23:29', '2025-05-07 17:29:48', NULL);
INSERT INTO `pro_sites` VALUES (2, 1, 'Behance', 'images/c3b59ad338e7e122072b867381e4b599.png', 'Adobe旗下的设计师交流平台，来自世界各地的设计师在这里分享自己的作品。', 'https://behance.net/', 1, 200, 1, '2019-01-22 01:11:24', '2025-05-09 13:34:47', NULL);
INSERT INTO `pro_sites` VALUES (3, 1, 'UI中国', 'images/9458ececbfeea651b5e871179f245ce5.png', '图形交互与界面设计交流、作品展示、学习平台。', 'http://www.ui.cn/', 1, 200, 0, '2019-01-22 01:13:10', '2025-05-09 13:29:17', NULL);
INSERT INTO `pro_sites` VALUES (4, 1, '站酷', 'images/c2aa8b63006d36a026e419bf3e0d7e50.png', '中国人气设计师互动平台。', 'http://www.zcool.com.cn/', 1, 200, 0, '2019-01-22 01:14:04', '2025-05-09 13:29:20', NULL);
INSERT INTO `pro_sites` VALUES (5, 1, 'Pinterest', 'images/4b8c9c66df25d3867961ebbd6a824eea.png', '全球美图收藏采集站。', 'https://www.pinterest.com/', 1, 200, 0, '2019-01-22 01:14:51', '2019-01-22 01:14:51', NULL);
INSERT INTO `pro_sites` VALUES (6, 1, '花瓣', 'images/48c7741c42e39eae508c3d9eef4e7a97.png', '收集灵感,保存有用的素材。', 'http://huaban.com/', 1, 200, 0, '2019-01-22 01:15:35', '2019-01-22 01:15:35', NULL);
INSERT INTO `pro_sites` VALUES (7, 1, 'Medium', 'images/11b56d4a9cc9297638d46c4b67c73693.png', '高质量设计文章。', 'https://medium.com/', 1, 200, 0, '2019-01-22 01:16:14', '2019-01-22 01:16:14', NULL);
INSERT INTO `pro_sites` VALUES (8, 1, '优设', 'images/636342035cdd2fbc08097d012b5e5fad.png', '设计师交流学习平台。', 'http://www.uisdc.com/', 1, 200, 1, '2019-01-22 01:17:07', '2025-05-09 13:42:50', NULL);
INSERT INTO `pro_sites` VALUES (9, 1, 'Producthunt', 'images/8bdf511e23b183f9aac30aee3368152b.png', '发现新鲜有趣的产品。', 'https://www.producthunt.com/', 1, 200, 0, '2019-01-22 01:17:50', '2019-01-22 01:17:50', NULL);
INSERT INTO `pro_sites` VALUES (10, 1, 'Youtube', 'images/15b4f46186f718e92b97f6f282f140fd.png', '全球最大的学习分享平台。', 'https://www.youtube.com/', 1, 200, 0, '2019-01-22 01:18:31', '2019-01-22 01:18:31', NULL);
INSERT INTO `pro_sites` VALUES (11, 1, 'Google', 'images/643faef109965a9cedcf9cde74d0adb1.png', '全球最大的搜索平台。', 'https://www.google.com/', 1, 200, 0, '2019-01-22 01:19:35', '2019-01-22 01:19:35', NULL);
INSERT INTO `pro_sites` VALUES (12, 2, '雷锋网', 'images/57ab570b631cc25a23390f507d496bc6.png', '人工智能和智能硬件领域的互联网科技媒体。', 'https://www.leiphone.com/', 1, 200, 0, '2019-01-22 01:21:05', '2019-01-22 01:21:05', NULL);
INSERT INTO `pro_sites` VALUES (13, 2, '36kr', 'images/adef44c84185d959446024452ad615cc.png', '创业资讯、科技新闻。', 'http://36kr.com/', 1, 200, 1, '2019-01-22 01:21:52', '2025-05-09 13:35:06', NULL);
INSERT INTO `pro_sites` VALUES (14, 2, '数英网', 'images/cee8fd836f98652f52fcc6046ba9db89.png', '数字媒体及职业招聘网站。', 'https://www.digitaling.com/', 1, 200, 1, '2019-01-22 01:23:15', '2025-05-09 13:34:53', NULL);
INSERT INTO `pro_sites` VALUES (15, 2, '猎云网', 'images/f9b1cfa239abdda5ee2dca7c04ca2d73.png', '互联网创业项目推荐和创业创新资讯。', 'http://www.lieyunwang.com/', 1, 200, 0, '2019-01-22 01:24:21', '2019-01-22 01:24:21', NULL);
INSERT INTO `pro_sites` VALUES (16, 2, '人人都是产品经理', 'images/fe7dcb7b5937c3bcf6043ba7d9379fbe.png', '产品经理、产品爱好者学习交流平台。', 'http://www.woshipm.com/', 1, 200, 0, '2019-01-22 01:25:07', '2019-01-22 01:25:07', NULL);
INSERT INTO `pro_sites` VALUES (17, 2, '互联网早读课', 'images/ecd5eefc4ec4bac49916a91c2da44412.png', '互联网行业深度阅读与学习平台。', 'https://www.zaodula.com/', 1, 200, 0, '2019-01-22 01:25:41', '2019-01-22 01:25:41', NULL);
INSERT INTO `pro_sites` VALUES (18, 2, '产品壹佰', 'images/2f4235fb1eb75822a44903d9894760d7.png', '为产品经理爱好者提供最优质的产品资讯、原创内容和相关视频课程。', 'http://www.chanpin100.com/', 1, 200, 0, '2019-01-22 01:26:27', '2019-01-22 01:26:27', NULL);
INSERT INTO `pro_sites` VALUES (19, 2, 'PMCAFF', 'images/a76e60c2d42f5bbdacbf7dd120810194.png', '中国第一产品经理人气组织，专注于研究互联网产品。', 'http://www.pmcaff.com/', 1, 200, 0, '2019-01-22 01:27:08', '2019-01-22 01:27:08', NULL);
INSERT INTO `pro_sites` VALUES (20, 2, '爱运营', 'images/f84a9e00d63b007ea09df75dbdaf9549.png', '网站运营人员学习交流，专注于网站产品运营管理、淘宝运营。', 'http://www.iyunying.org/', 1, 200, 0, '2019-01-22 01:28:09', '2019-01-22 01:28:09', NULL);
INSERT INTO `pro_sites` VALUES (21, 2, '鸟哥笔记', 'images/e424308a81c187bc42e95addf462b4c8.png', '移动互联网第一干货平台。', 'http://www.niaogebiji.com/', 1, 200, 0, '2019-01-22 01:29:56', '2019-01-22 01:29:56', NULL);
INSERT INTO `pro_sites` VALUES (22, 2, '古田路9号', 'images/e22a54099a69f7e76c471d7f6a253fe8.png', '国内专业品牌创意平台。', 'http://www.gtn9.com/', 1, 200, 0, '2019-01-22 01:30:29', '2019-01-22 01:30:29', NULL);
INSERT INTO `pro_sites` VALUES (23, 2, '优阁网', 'images/74a25f510e403f4ef28212146510dfa7.png', 'UI设计师学习交流社区。', 'http://www.uigreat.com/', 1, 200, 0, '2019-01-22 01:32:17', '2019-01-22 01:32:17', NULL);
INSERT INTO `pro_sites` VALUES (24, 4, 'Producthunt', 'images/a1cc88fa0a3bf74349ba9c08a67abdc7.png', '发现新鲜有趣的产品。', 'https://www.producthunt.com/', 1, 200, 0, '2019-01-22 01:33:37', '2019-01-22 01:33:37', NULL);
INSERT INTO `pro_sites` VALUES (25, 4, 'NEXT', 'images/0e2b6c9a5afd4f83d2e22632b08f56ef.png', '不错过任何一个新产品。', 'http://next.36kr.com/posts', 1, 200, 0, '2019-01-22 01:34:41', '2019-01-22 01:34:41', NULL);
INSERT INTO `pro_sites` VALUES (26, 4, '少数派', 'images/2d01ac82bb496b607c43e7b2b29cd069.png', '高品质数字消费指南。', 'https://sspai.com/', 1, 200, 1, '2019-01-22 01:36:08', '2025-05-09 13:34:56', NULL);
INSERT INTO `pro_sites` VALUES (27, 4, '利器', 'images/98e2ee62a90b6243630f4aa479b4b47b.png', '创造者和他们的工具。', 'http://liqi.io/', 1, 200, 0, '2019-01-22 01:36:53', '2019-01-22 01:36:53', NULL);
INSERT INTO `pro_sites` VALUES (28, 4, 'Today', 'images/1726189292537c3a2733ebc673b7f1d6.png', '为身边的新产品喝彩。', 'http://today.itjuzi.com/', 1, 200, 0, '2019-01-22 01:37:37', '2019-01-22 01:37:37', NULL);
INSERT INTO `pro_sites` VALUES (29, 4, '小众软件', 'images/76b49053ce87ab3c7419c7cdf6fa4f07.png', '在这里发现更多有趣的应用。', 'https://faxian.appinn.com', 1, 200, 1, '2019-01-22 01:38:04', '2025-05-09 13:34:51', NULL);
INSERT INTO `pro_sites` VALUES (30, 5, 'Pttrns', 'images/1c759dc53774e5758a31fee0401e213a.png', 'Check out the finest collection of design patterns, resources, mobile apps and inspiration', 'https://www.pttrns.com/', 1, 200, 0, '2019-01-22 01:39:09', '2019-01-22 01:39:09', NULL);
INSERT INTO `pro_sites` VALUES (31, 5, 'Collect UI', 'images/7e802c77c7bb6c85c1e2bb608a4a13cd.png', 'Daily inspiration collected from daily ui archive and beyond.', 'http://collectui.com/', 1, 200, 0, '2019-01-22 01:39:58', '2019-01-22 01:39:58', NULL);
INSERT INTO `pro_sites` VALUES (32, 5, 'UI uigreat', 'images/d140fe4bd548f273ddd00f35e1ad5ff5.png', 'APP界面截图参考。', 'http://ui.uigreat.com/', 1, 200, 0, '2019-01-22 01:40:40', '2019-01-22 01:40:40', NULL);
INSERT INTO `pro_sites` VALUES (33, 5, 'Android Niceties', 'images/8b6e0af7df3a5d77a14e41a0f5f36dc5.png', 'A collection of screenshots encompassing some of the most beautiful looking Android apps.', 'http://androidniceties.tumblr.com/', 1, 200, 0, '2019-01-22 01:41:21', '2019-01-22 01:41:21', NULL);
INSERT INTO `pro_sites` VALUES (34, 6, 'Awwwards', 'images/bdd6c88417790c97de2c2d0643cc602c.png', 'Awwwards are the Website Awards that recognize and promote the talent and effort of the best developers, designers and web agencies in the world.', 'https://www.awwwards.com/', 1, 200, 0, '2019-01-22 01:44:09', '2019-01-22 01:51:33', NULL);
INSERT INTO `pro_sites` VALUES (35, 6, 'CSS Design Awards', 'images/481219fe4285f1f4ec1311acce7deb06.png', 'Website Awards & Inspiration - CSS Gallery', 'https://www.cssdesignawards.com/', 1, 200, 0, '2019-01-22 01:44:45', '2019-01-22 01:51:41', NULL);
INSERT INTO `pro_sites` VALUES (36, 6, 'The FWA', 'images/8fe5280ff7dc3012fb88781dd9ff4b93.png', 'FWA - showcasing innovation every day since 2000', 'https://thefwa.com/', 1, 200, 0, '2019-01-22 01:45:19', '2019-01-22 01:51:48', NULL);
INSERT INTO `pro_sites` VALUES (37, 6, 'Ecommercefolio', 'images/950d52c71e28f1c9ed964732d6ed18fd.png', 'Only the Best Ecommerce Design Inspiration.', 'http://www.ecommercefolio.com/', 1, 200, 0, '2019-01-22 01:50:41', '2019-01-22 01:50:41', NULL);
INSERT INTO `pro_sites` VALUES (38, 6, 'Lapa', 'images/1824678ec13d01b76df47fc5975178fa.png', 'The best landing page design inspiration from around the web.', 'http://www.lapa.ninja/', 1, 200, 0, '2019-01-22 01:51:15', '2019-01-22 01:51:15', NULL);
INSERT INTO `pro_sites` VALUES (39, 6, 'Reeoo', 'images/5205b768b9b640bfada244ce9d15318d.png', 'web design inspiration and website gallery.', 'http://reeoo.com/', 1, 200, 0, '2019-01-22 01:52:43', '2019-01-22 01:52:43', NULL);
INSERT INTO `pro_sites` VALUES (40, 6, 'Designmunk', 'images/31de409b71235b76d605e98293d68cb3.png', 'Best Homepage Design Inspiration.', 'https://designmunk.com/', 1, 200, 0, '2019-01-22 01:53:28', '2019-01-22 01:53:28', NULL);
INSERT INTO `pro_sites` VALUES (41, 6, 'Best Websites Gallery', 'images/862823249aa701d8bc8af16ae98f1e3a.png', 'Website Showcase Inspiration | Best Websites Gallery.', 'https://bestwebsite.gallery/', 1, 200, 0, '2019-01-22 01:57:32', '2019-01-22 01:57:32', NULL);
INSERT INTO `pro_sites` VALUES (42, 6, 'Pages', 'images/90fd20bd3e7ae7c7fe37ea689dcca32c.png', 'Curated directory of the best Pages.', 'http://www.pages.xyz/', 1, 200, 0, '2019-01-22 01:58:07', '2019-01-22 01:58:07', NULL);
INSERT INTO `pro_sites` VALUES (43, 6, 'SiteSee', 'images/da24d08a597456be98191b4a08eff4d6.png', 'SiteSee is a curated gallery of beautiful, modern websites collections.', 'https://sitesee.co/', 1, 200, 0, '2019-01-22 01:58:42', '2019-01-22 01:58:42', NULL);
INSERT INTO `pro_sites` VALUES (44, 6, 'Site Inspire', 'images/c15c9017ad6874faae0df64bd969115b.png', 'A CSS gallery and showcase of the best web design inspiration.', 'https://www.siteinspire.com/', 1, 200, 0, '2019-01-22 01:59:13', '2019-01-22 01:59:13', NULL);
INSERT INTO `pro_sites` VALUES (45, 6, 'WebInspiration', 'images/f8fe63594e2083755086ee294b036108.png', '网页设计欣赏,全球顶级网页设计。', 'http://web.uedna.com/', 1, 200, 0, '2019-01-22 01:59:54', '2019-01-22 01:59:54', NULL);
INSERT INTO `pro_sites` VALUES (46, 6, 'navnav', 'images/86b9e596068f2a71d2a2444733a4094e.png', 'A ton of CSS, jQuery, and JavaScript responsive navigation examples, demos, and tutorials from all over the web.', 'http://navnav.co/', 1, 200, 0, '2019-01-22 02:00:24', '2019-01-22 02:00:24', NULL);
INSERT INTO `pro_sites` VALUES (47, 6, 'Really Good UX', 'images/948b0f5b62e59ef0a97edf4b9a51c404.png', 'A library of screenshots and examples of really good UX. Brought to you by .', 'https://www.reallygoodux.io/', 1, 200, 0, '2019-01-22 02:01:05', '2019-01-22 02:01:05', NULL);
INSERT INTO `pro_sites` VALUES (48, 8, 'Iconfinder', 'images/e3325f68179436ccfc25b9f0ffff5a39.png', '2,100,000+ free and premium vector icons.', 'https://www.iconfinder.com', 1, 200, 0, '2019-01-22 03:01:41', '2019-01-22 03:01:41', NULL);
INSERT INTO `pro_sites` VALUES (49, 8, 'iconfont', 'images/e1f63337915f79f8bcad1952adb9f6e1.png', '阿里巴巴矢量图标库。', 'http://www.iconfont.cn/', 1, 200, 0, '2019-01-22 03:02:16', '2019-01-22 03:02:16', NULL);
INSERT INTO `pro_sites` VALUES (50, 8, 'iconmonstr', 'images/afd4885651455f12dcac4f214460dd99.png', 'Free simple icons for your next project.', 'https://iconmonstr.com/', 1, 200, 0, '2019-01-22 03:02:46', '2019-01-22 03:02:46', NULL);
INSERT INTO `pro_sites` VALUES (51, 8, 'FindIcons', 'images/0171a46b0f643752aa90aa314a22a546.png', 'Search through 300,000 free icons.', 'https://findicons.com/', 1, 200, 0, '2019-01-22 03:03:24', '2019-01-22 03:03:24', NULL);
INSERT INTO `pro_sites` VALUES (52, 8, 'Icon Archive', 'images/40c43a8932f24370cf456789b2ab51db.png', 'Search 590,912 free icons.', 'http://www.iconarchive.com/', 1, 200, 0, '2019-01-22 03:04:28', '2019-01-22 03:04:28', NULL);
INSERT INTO `pro_sites` VALUES (53, 8, 'IcoMoonApp', 'images/d19c97ead3760f1b70efa4ee9ad6859c.png', 'Icon Font, SVG, PDF & PNG Generator.', 'https://icomoon.io/app/', 1, 200, 1, '2019-01-22 03:05:49', '2025-05-09 13:34:58', NULL);
INSERT INTO `pro_sites` VALUES (54, 8, 'easyicon', 'images/34b4382075e047c6d1456f8fe591a1ef.png', 'PNG、ICO、ICNS格式图标搜索、图标下载服务。', 'http://www.easyicon.net/', 1, 200, 0, '2019-01-22 03:06:47', '2019-01-22 03:06:47', NULL);
INSERT INTO `pro_sites` VALUES (55, 8, 'flaticon', 'images/582cf7361a0b4f444628c68b98e5cfc7.png', '634,000+ Free vector icons in SVG, PSD, PNG, EPS format or as ICON FONT.', 'https://www.flaticon.com/', 1, 200, 0, '2019-01-22 03:07:28', '2019-01-22 03:07:28', NULL);
INSERT INTO `pro_sites` VALUES (56, 8, 'UICloud', 'images/f9840e127d500449da1c5c721f3634c3.png', 'The largest user interface design database in the world.', 'http://ui-cloud.com/', 1, 200, 0, '2019-01-22 03:08:10', '2019-01-22 03:08:10', NULL);
INSERT INTO `pro_sites` VALUES (57, 8, 'Material icons', 'images/32a037ffbdd2f97f6f6e62e56321c519.png', 'Access over 900 material system icons, available in a variety of sizes and densities, and as a web font.', 'https://material.io/icons/', 1, 200, 0, '2019-01-22 03:09:00', '2019-01-22 03:09:00', NULL);
INSERT INTO `pro_sites` VALUES (58, 8, 'Font Awesome Icon', 'images/88440b8b0d5dc43a3f766670e2d11746.png', 'The complete set of 675 icons in Font Awesome.', 'https://fontawesome.com/', 1, 200, 0, '2019-01-22 03:09:59', '2019-01-22 03:09:59', NULL);
INSERT INTO `pro_sites` VALUES (59, 8, 'ion icons', 'images/6d0fd0bf35549f6d61037bd86e2ca242.png', 'The premium icon font for Ionic Framework.', 'http://ionicons.com/', 1, 200, 0, '2019-01-22 03:10:37', '2019-01-22 03:10:37', NULL);
INSERT INTO `pro_sites` VALUES (60, 8, 'Simpleline Icons', 'images/acf446f1af754f863260cc10dd8d546e.png', 'Simple line Icons pack.', 'http://simplelineicons.com/', 1, 200, 0, '2019-01-22 03:11:11', '2019-01-22 03:11:11', NULL);
INSERT INTO `pro_sites` VALUES (61, 9, 'Iconsfeed', 'images/aee21da67d9771c2ebf3f6779afc9649.png', 'iOS icons gallery.', 'http://www.iconsfeed.com/', 1, 200, 0, '2019-01-22 03:12:11', '2025-05-07 17:14:30', NULL);
INSERT INTO `pro_sites` VALUES (62, 9, 'iOS Icon Gallery', 'images/98c9f52ede06a56532d5d16afda9d570.png', 'Showcasing beautiful icon designs from the iOS App Store.', 'http://iosicongallery.com/', 1, 200, 0, '2019-01-22 03:12:59', '2019-01-22 03:12:59', NULL);
INSERT INTO `pro_sites` VALUES (63, 9, 'World Vector Logo', 'images/c8da40d11f726d974293efc40c9acfb5.png', 'Brand logos free to download.', 'https://worldvectorlogo.com/', 1, 200, 0, '2019-01-22 03:14:10', '2019-01-22 03:14:10', NULL);
INSERT INTO `pro_sites` VALUES (64, 9, 'Instant Logo Search', 'images/907f35950eae72526a314306cc59efa7.png', 'Search & download thousands of logos instantly.', 'http://instantlogosearch.com/', 1, 200, 0, '2019-01-22 03:14:50', '2019-01-22 03:14:50', NULL);
INSERT INTO `pro_sites` VALUES (65, 10, 'freepik', 'images/6a96564b2d100bad3674db5e56794a97.png', 'More than a million free vectors, PSD, photos and free icons.', 'https://www.freepik.com/', 1, 200, 0, '2019-01-22 03:17:22', '2019-01-22 03:17:22', NULL);
INSERT INTO `pro_sites` VALUES (66, 10, 'wallhalla', 'images/9354f99621e8530d0f996fe4b96ad2c3.png', 'Find awesome high quality wallpapers for desktop and mobile in one place.', 'https://wallhalla.com/', 1, 200, 0, '2019-01-22 03:17:55', '2019-01-22 03:17:55', NULL);
INSERT INTO `pro_sites` VALUES (67, 10, '365PSD', 'images/13b10a2f9388e83101d7a35b83ff28bc.png', 'Free PSD & Graphics, Illustrations.', 'https://365psd.com/', 1, 200, 0, '2019-01-22 03:18:22', '2019-01-22 03:18:22', NULL);
INSERT INTO `pro_sites` VALUES (68, 10, 'Medialoot', 'images/b117eb768a44d662ded91d1f0a9cb1c2.png', 'Free & Premium Design Resources — Medialoot.', 'https://medialoot.com/', 1, 200, 0, '2019-01-22 03:18:52', '2019-01-22 03:18:52', NULL);
INSERT INTO `pro_sites` VALUES (69, 10, '千图网', 'images/9a24027c0e9d498efb4ad88a330882f8.png', '专注免费设计素材下载的网站。', 'http://www.58pic.com/', 1, 200, 0, '2019-01-22 03:19:35', '2019-01-22 03:19:35', NULL);
INSERT INTO `pro_sites` VALUES (70, 10, '千库网', 'images/15ffa7b3a5cab15c7d23d402be12cc4c.png', '免费png图片背景素材下载。', 'http://588ku.com/', 1, 200, 0, '2019-01-22 03:20:14', '2019-01-22 03:20:14', NULL);
INSERT INTO `pro_sites` VALUES (71, 10, '我图网', 'images/a887a255bbe7fe994e0479ae988372c7.png', '我图网,提供图片素材及模板下载,专注正版设计作品交易。', 'http://www.ooopic.com/', 1, 200, 0, '2019-01-22 03:20:54', '2019-01-22 03:20:54', NULL);
INSERT INTO `pro_sites` VALUES (72, 10, '90设计', 'images/c510c1946d6191a98c6fd3b08ca720ec.png', '电商设计（淘宝美工）千图免费淘宝素材库。', 'http://90sheji.com/', 1, 200, 0, '2019-01-22 03:21:29', '2019-01-22 03:21:29', NULL);
INSERT INTO `pro_sites` VALUES (73, 10, '昵图网', 'images/d4fba2a16c7a1692ea21f4f0a8ae7672.png', '原创素材共享平台。', 'http://www.nipic.com/', 1, 200, 0, '2019-01-22 03:22:11', '2019-01-22 03:22:11', NULL);
INSERT INTO `pro_sites` VALUES (74, 10, '懒人图库', 'images/a7e5f98173ea111df83da146a86436a1.png', '懒人图库专注于提供网页素材下载。', 'http://www.lanrentuku.com/', 1, 200, 1, '2019-01-22 03:23:20', '2025-05-09 13:35:01', NULL);
INSERT INTO `pro_sites` VALUES (75, 10, '素材搜索', 'images/cbca7fabfd7c6d1b117547466bc564ad.png', '设计素材搜索聚合。', 'http://so.ui001.com/', 1, 200, 0, '2019-01-22 03:24:03', '2019-01-22 03:24:03', NULL);
INSERT INTO `pro_sites` VALUES (76, 10, 'PS饭团网', 'images/7ffad2eac8cbad395d33914344d3aa0a.png', '不一样的设计素材库！让自己的设计与众不同！', 'http://psefan.com/', 1, 200, 0, '2019-01-22 03:24:44', '2019-01-22 03:24:44', NULL);
INSERT INTO `pro_sites` VALUES (77, 10, '素材中国', 'images/ced6b2a53069c7d360ba78706244081f.png', '免费素材共享平台。', 'http://www.sccnn.com/', 1, 200, 0, '2019-01-22 03:25:22', '2019-01-22 03:25:22', NULL);
INSERT INTO `pro_sites` VALUES (78, 11, 'Freebiesbug', 'images/4288052485ced84952e206a4acfb92ad.png', 'Hand-picked resources for web designer and developers, constantly updated.', 'https://freebiesbug.com/', 1, 200, 0, '2019-01-22 03:26:32', '2019-01-22 03:26:32', NULL);
INSERT INTO `pro_sites` VALUES (79, 11, 'Freebie Supply', 'images/2ae393ad916a108ba20d21a8b907477e.png', 'Free Resources For Designers.', 'https://freebiesupply.com/', 1, 200, 0, '2019-01-22 03:27:09', '2019-01-22 03:27:09', NULL);
INSERT INTO `pro_sites` VALUES (80, 11, '云瑞', 'images/528f9304b0dab49f5fe2426d4d9d047c.png', '优秀设计资源的分享网站。', 'https://www.yrucd.com/', 1, 200, 0, '2019-01-22 04:20:59', '2019-01-22 04:20:59', NULL);
INSERT INTO `pro_sites` VALUES (81, 11, 'Designmodo', 'images/2061e0ccebfbb1a94a28d86237589b23.png', 'Web Design Blog and Shop.', 'https://designmodo.com/', 1, 200, 0, '2019-01-22 04:21:38', '2019-01-22 04:21:38', NULL);
INSERT INTO `pro_sites` VALUES (82, 11, '稀土区', 'images/4f5171443ad0ec6b13b7f96b8cead4bd.png', '优质设计开发资源分享。', 'https://xituqu.com/', 1, 200, 0, '2019-01-22 04:22:15', '2019-01-22 04:22:15', NULL);
INSERT INTO `pro_sites` VALUES (83, 11, 'ui8', 'images/b815917aad63f449a96900979a16eb4e.png', 'UI Kits, Wireframe Kits, Templates, Icons and More.', 'https://ui8.net/', 1, 200, 0, '2019-01-22 04:22:57', '2019-01-22 04:22:57', NULL);
INSERT INTO `pro_sites` VALUES (84, 11, 'uplabs', 'images/42d3d29c62a19e8d4ca6395586d79ee7.png', 'Daily resources for product designers & developers.', 'https://www.uplabs.com/', 1, 200, 0, '2019-01-22 04:23:39', '2019-01-22 04:23:39', NULL);
INSERT INTO `pro_sites` VALUES (85, 11, 'UIkit.me', 'images/13b4ac8efdc9f92e52e7f271b8034b24.png', '最便捷新鲜的uikit资源下载网站。', 'http://www.uikit.me/', 1, 200, 0, '2019-01-22 04:24:19', '2019-01-22 04:24:19', NULL);
INSERT INTO `pro_sites` VALUES (86, 11, 'Fribbble', 'images/04c1b51de97ceac330358fa7d1685034.png', 'Free PSD files and other free design resources by Dribbblers.', 'http://www.fribbble.com/', 1, 200, 0, '2019-01-22 04:24:54', '2019-01-22 04:24:54', NULL);
INSERT INTO `pro_sites` VALUES (87, 11, 'PrincipleRepo', 'images/e3e93f407dcc94461bea06979e89e4a2.png', 'Free, High Quality Principle Resources.', 'http://principlerepo.com/', 1, 200, 0, '2019-01-22 04:25:30', '2019-01-22 04:25:30', NULL);
INSERT INTO `pro_sites` VALUES (88, 12, 'Sketch', 'images/ff6a2f8afaeb91004416c96788f9da95.png', 'The digital design toolkit.', 'https://sketchapp.com/', 1, 200, 0, '2019-01-22 04:26:17', '2019-01-22 04:26:17', NULL);
INSERT INTO `pro_sites` VALUES (89, 12, 'Sketch Measure', 'images/69bf814d311d932ea13b746ffc1f9f54.png', 'Friendly user interface offers you a more intuitive way of making marks.', 'http://utom.design/measure/', 1, 200, 0, '2019-01-22 04:26:55', '2019-01-22 04:26:55', NULL);
INSERT INTO `pro_sites` VALUES (90, 12, 'Sketch App Sources', 'images/ccf82c5a27a285ba63cf3c4ff8964a25.png', 'Free design resources and plugins - Icons, UI Kits, Wireframes, iOS, Android Templates for Sketch', 'https://www.sketchappsources.com/', 1, 200, 0, '2019-01-22 04:27:43', '2019-01-22 04:27:43', NULL);
INSERT INTO `pro_sites` VALUES (91, 12, 'Sketch.im', 'images/6055276a55b62db423c2b060d3f6b044.png', 'Sketch 相关资源汇聚。', 'http://www.sketch.im/', 1, 200, 0, '2019-01-22 04:28:20', '2019-01-22 04:28:20', NULL);
INSERT INTO `pro_sites` VALUES (92, 12, 'Sketch Hunt', 'images/c4bf007a61d761db1f895672a2519cd0.png', 'Sketch Hunt is an independent blog sharing gems in learning, plugins & design tools for fans of Sketch app.', 'http://sketchhunt.com/', 1, 200, 0, '2019-01-22 04:29:44', '2019-01-22 04:29:44', NULL);
INSERT INTO `pro_sites` VALUES (93, 12, 'Sketch中文网', 'images/a26a90da0d304cd3502cdb53e85995b9.png', '分享最新的Sketch中文手册。', 'http://www.sketchcn.com/', 1, 200, 0, '2019-01-22 04:30:21', '2019-01-22 04:30:21', NULL);
INSERT INTO `pro_sites` VALUES (94, 12, 'Awesome Sketch Plugins', 'images/255cf49affef2fbaba8cd15c3e7329b5.png', 'A collection of really useful Sketch plugins.', 'https://awesome-sket.ch/', 1, 200, 0, '2019-01-22 04:31:24', '2019-01-22 04:31:24', NULL);
INSERT INTO `pro_sites` VALUES (95, 12, 'Sketchcasts', 'images/fa8c8b179ab48ad61e61a18d1720e019.png', 'Learn Sketch Train your design skills with a weekly video tutorial', 'https://www.sketchcasts.net/', 1, 200, 0, '2019-01-22 04:32:00', '2019-01-22 04:32:00', NULL);
INSERT INTO `pro_sites` VALUES (96, 13, 'Google Font', 'images/91c604a4ca98b1bb5719e04c80043419.png', 'Making the web more beautiful, fast, and open through great typography.', 'https://fonts.google.com/', 1, 200, 0, '2019-01-22 04:32:42', '2019-01-22 04:32:42', NULL);
INSERT INTO `pro_sites` VALUES (97, 13, 'Typekit', 'images/7dbc17741d30274995615612dc1d075f.png', 'Quality fonts from the world’s best foundries.', 'https://typekit.com/', 1, 200, 0, '2019-01-22 04:33:14', '2019-01-22 04:33:14', NULL);
INSERT INTO `pro_sites` VALUES (98, 13, '方正字库', 'images/8ffeec1d3ad96a39dd4ede9794756b87.png', '方正字库官方网站。', 'http://www.foundertype.com/', 1, 200, 0, '2019-01-22 04:37:57', '2019-01-22 04:37:57', NULL);
INSERT INTO `pro_sites` VALUES (99, 13, '字体传奇网', 'images/d5fc1ea541fe215ae449a0ae27a09a76.png', '中国首个字体品牌设计师交流网。', 'http://ziticq.com/', 1, 200, 0, '2019-01-22 04:38:51', '2019-01-22 04:38:51', NULL);
INSERT INTO `pro_sites` VALUES (100, 13, '私藏字体', 'images/125e538efd8b3ea68d3655cb81ccc06f.png', '优质字体免费下载站。', 'http://sicangziti.com/', 1, 200, 0, '2019-01-22 04:40:03', '2019-01-22 04:40:03', NULL);
INSERT INTO `pro_sites` VALUES (101, 13, 'Fontsquirrel', 'images/94684e5203623eb5540a4b5a0e0b70b0.png', 'FREE fonts for graphic designers.', 'https://www.fontsquirrel.com/', 1, 200, 0, '2019-01-22 04:40:43', '2019-01-22 04:40:43', NULL);
INSERT INTO `pro_sites` VALUES (102, 13, 'Urban Fonts', 'images/40139afeda032d1a3cd54459d065b31b.png', 'Download Free Fonts and Free Dingbats.', 'https://www.urbanfonts.com/', 1, 200, 0, '2019-01-22 04:41:23', '2019-01-22 04:41:23', NULL);
INSERT INTO `pro_sites` VALUES (103, 13, 'Lost Type', 'images/cfe0904ec3e37914be51687a2b15f5cf.png', 'Lost Type is a Collaborative Digital Type Foundry.', 'http://www.losttype.com/', 1, 200, 0, '2019-01-22 04:41:56', '2019-01-22 04:41:56', NULL);
INSERT INTO `pro_sites` VALUES (104, 13, 'FONTS2U', 'images/19bd844dc123066620d1f6fda7287e48.png', 'Download free fonts for Windows and Macintosh.', 'https://fonts2u.com/', 1, 200, 0, '2019-01-22 04:42:46', '2019-01-22 04:42:46', NULL);
INSERT INTO `pro_sites` VALUES (105, 13, 'Fontex', 'images/1576a7303fb2fa3839016a599418203b.png', 'Free Fonts to Download + Premium Typefaces.', 'http://www.fontex.org/', 1, 200, 0, '2019-01-22 04:43:17', '2019-01-22 04:43:17', NULL);
INSERT INTO `pro_sites` VALUES (106, 13, 'FontM', 'images/5ee459b3c52027eb8dcd9c8c6e9266a0.png', 'Free Fonts.', 'http://fontm.com/', 1, 200, 0, '2019-01-22 04:43:49', '2019-01-22 04:43:49', NULL);
INSERT INTO `pro_sites` VALUES (107, 13, 'My Fonts', 'images/22572b2d9b38ea02f173074d59acf334.png', 'Fonts for Print, Products & Screens.', 'http://www.myfonts.com/', 1, 200, 0, '2019-01-22 04:45:27', '2019-01-22 04:45:27', NULL);
INSERT INTO `pro_sites` VALUES (108, 13, 'Da Font', 'images/d0478f80b89bff215437714e62c6d997.png', 'Archive of freely downloadable fonts.', 'https://www.dafont.com/', 1, 200, 0, '2019-01-22 04:46:04', '2019-01-22 04:46:04', NULL);
INSERT INTO `pro_sites` VALUES (109, 13, 'OnlineWebFonts', 'images/bccc59c04f6f283a63430700273ffdee.png', 'WEB Free Fonts for Windows and Mac / Font free Download.', 'https://www.onlinewebfonts.com/', 1, 200, 0, '2019-01-22 04:46:36', '2019-01-22 04:46:36', NULL);
INSERT INTO `pro_sites` VALUES (110, 13, 'Abstract Fonts', 'images/fbedc66f865056e650a036f042625057.png', 'Abstract Fonts (13,866 free fonts).', 'http://www.abstractfonts.com/', 1, 200, 0, '2019-01-22 04:47:08', '2019-01-22 04:47:08', NULL);
INSERT INTO `pro_sites` VALUES (111, 14, 'MockupZone', 'images/75e599ff2f061dc25fa272de94045ca9.png', 'Mockup Zone is an online store where you can find free and premium PSD mockup files to show your designs in a professional way.', 'https://mockup.zone/', 1, 200, 0, '2019-01-22 05:07:01', '2019-01-22 05:07:01', NULL);
INSERT INTO `pro_sites` VALUES (112, 14, 'Dunnnk', 'images/7949d12743b95779412dd8673c324164.png', 'Generate Product Mockups For Free.', 'http://dunnnk.com/', 1, 200, 0, '2019-01-22 05:08:13', '2019-01-22 05:08:13', NULL);
INSERT INTO `pro_sites` VALUES (113, 14, 'Graphberry', 'images/1216f3642b463e7e9d493e4d00506566.png', 'Free design resources, Mockups, PSD web templates, Icons.', 'http://www.graphberry.com/', 1, 200, 0, '2019-01-22 05:08:51', '2019-01-22 05:08:51', NULL);
INSERT INTO `pro_sites` VALUES (114, 14, 'Threed', 'images/252114418dc086100cd58d10035a9436.png', 'Generate 3D Mockups right in your Browser', 'http://threed.io/', 1, 200, 0, '2019-01-22 05:09:22', '2019-01-22 05:09:22', NULL);
INSERT INTO `pro_sites` VALUES (115, 14, 'Mockup World', 'images/c94ee98e4ada29c0916888820da31744.png', 'The best free Mockups from the Web', 'https://free.lstore.graphics/', 1, 200, 0, '2019-01-22 05:09:54', '2019-01-22 05:09:54', NULL);
INSERT INTO `pro_sites` VALUES (116, 14, 'Lstore', 'images/965f25d08ae3cd33fab21d764a514967.png', 'Exclusive mindblowing freebies for designers and developers.', 'https://free.lstore.graphics/', 1, 200, 0, '2019-01-22 05:11:00', '2019-01-22 05:11:00', NULL);
INSERT INTO `pro_sites` VALUES (117, 14, 'pixeden', 'images/f8b5261bc1d5e5189b9c1216a6de8b3b.png', 'free web resources and graphic design templates.', 'https://www.pixeden.com/', 1, 200, 0, '2019-01-22 05:11:36', '2019-01-22 05:11:36', NULL);
INSERT INTO `pro_sites` VALUES (118, 14, 'For Graphic TM', 'images/20fceec1b9dd6c1183ad73a90becce7f.png', 'High Quality PSD Mockups for Graphic Designers.', 'http://forgraphictm.com/', 1, 200, 0, '2019-01-22 05:12:28', '2019-01-22 05:12:28', NULL);
INSERT INTO `pro_sites` VALUES (119, 15, 'Unsplash', 'images/72880b02dbea40fd84472abc05e6d23b.png', 'Beautiful, free photos.', 'https://unsplash.com/', 1, 200, 0, '2019-01-22 05:16:19', '2019-01-22 05:16:19', NULL);
INSERT INTO `pro_sites` VALUES (120, 15, 'visualhunt', 'images/b2a1a1e4c043858ac2411f02b9236ff3.png', '100% Free High Quality Photos.', 'https://visualhunt.com/', 1, 200, 0, '2019-01-22 05:16:55', '2019-01-22 05:16:55', NULL);
INSERT INTO `pro_sites` VALUES (121, 15, 'librestock', 'images/94c5305f78dfadb241f9edcf3d9b870d.png', '65,084 high quality do-what-ever-you-want stock photos.', 'https://librestock.com/', 1, 200, 0, '2019-01-22 05:17:27', '2019-01-22 05:17:34', NULL);
INSERT INTO `pro_sites` VALUES (122, 15, 'pixabay', 'images/310cb7b52774323c7fdffe67aa0f12aa.png', '可在任何地方使用的免费图片和视频。', 'https://pixabay.com/', 1, 200, 0, '2019-01-22 05:18:10', '2019-01-22 05:18:10', NULL);
INSERT INTO `pro_sites` VALUES (123, 15, 'SplitShire', 'images/0e9933021af7cc4714e900c247010b30.png', 'Free Stock Photos and Videos for commercial use.', 'https://www.splitshire.com/', 1, 200, 0, '2019-01-22 05:19:07', '2019-01-22 05:19:07', NULL);
INSERT INTO `pro_sites` VALUES (124, 15, 'StockSnap', 'images/fabf86558eb3a7c943c124f7f62f3542.png', 'Beautiful free stock photos.', 'https://stocksnap.io/', 1, 200, 0, '2019-01-22 05:19:40', '2019-01-22 05:19:40', NULL);
INSERT INTO `pro_sites` VALUES (125, 15, 'albumarium', 'images/de8b7f26a21ea0b781f93a3163341731.png', 'The best place to find & share beautiful images.', 'http://albumarium.com/', 1, 200, 0, '2019-01-22 05:20:11', '2019-01-22 05:20:11', NULL);
INSERT INTO `pro_sites` VALUES (126, 15, 'myphotopack', 'images/80d85ea59d293bd43731a890f63c5dc9.png', 'A free photo pack just for you. Every month.', 'https://myphotopack.com/', 1, 200, 0, '2019-01-22 05:20:44', '2019-01-22 05:20:44', NULL);
INSERT INTO `pro_sites` VALUES (127, 15, 'Notaselfie', 'images/eb5f9a9661e582883c9d3128bb9b4482.png', 'Photos that happen along the way. You can use the images anyway you like. Have fun!', 'http://notaselfie.com/', 1, 200, 0, '2019-01-22 05:21:31', '2019-01-22 05:21:31', NULL);
INSERT INTO `pro_sites` VALUES (128, 15, 'papers', 'images/3a6396ba24d253502f40432751a11b07.png', 'Wallpapers Every Hour!Hand collected :)', 'http://papers.co/', 1, 200, 0, '2019-01-22 05:22:06', '2019-01-22 05:22:06', NULL);
INSERT INTO `pro_sites` VALUES (129, 15, 'stokpic', 'images/9dce238279b24893eaa20a99fba802ea.png', 'Free Stock Photos For Commercial Use.', 'http://stokpic.com/', 1, 200, 0, '2019-01-22 05:22:55', '2019-01-22 05:22:55', NULL);
INSERT INTO `pro_sites` VALUES (130, 15, '55mm', 'images/dd8adcbc65cc20e8fb6d6335fd57814a.png', 'Use our FREE photos to tell your story!', 'https://55mm.co/visuals', 1, 200, 0, '2019-01-22 05:23:27', '2019-01-22 05:23:27', NULL);
INSERT INTO `pro_sites` VALUES (131, 15, 'thestocks', 'images/2be533b5b00139b9022f09604f3bd136.png', 'Use our FREE photos to tell your story!', 'http://thestocks.im/', 1, 200, 0, '2019-01-22 05:24:11', '2019-01-22 05:24:11', NULL);
INSERT INTO `pro_sites` VALUES (132, 15, 'freenaturestock', 'images/85c87259ac26b4f48b084066b9e3ec8e.png', 'Exclusive mindblowing freebies for designers and developers.', 'http://freenaturestock.com/', 1, 200, 0, '2019-01-22 05:27:20', '2019-01-22 05:27:20', NULL);
INSERT INTO `pro_sites` VALUES (133, 15, 'negativespace', 'images/9b470b26c5e7e6604f3f17d2fe518af7.png', 'Beautiful, High-Resolution Free Stock Photos.', 'https://negativespace.co/', 1, 200, 0, '2019-01-22 05:28:11', '2019-01-22 05:28:11', NULL);
INSERT INTO `pro_sites` VALUES (134, 15, 'gratisography', 'images/37a9bff7f4d756e7b227ef295aa5ff82.png', 'Free high-resolution pictures you can use on your personal and commercial projects, free of copyright restrictions.', 'https://gratisography.com/', 1, 200, 0, '2019-01-22 05:28:53', '2019-01-22 05:28:53', NULL);
INSERT INTO `pro_sites` VALUES (135, 15, 'imcreator', 'images/568ae371ba49ce83463d5833af6a8e88.png', 'A curated collection of free web design resources, all for commercial use.', 'http://imcreator.com/free', 1, 200, 0, '2019-03-12 02:21:55', '2019-03-12 02:21:55', NULL);
INSERT INTO `pro_sites` VALUES (136, 15, 'lifeofpix', 'images/94bf5d51c1367552f337610dbc6aa44b.png', 'Free high resolution photography', 'http://www.lifeofpix.com/', 1, 200, 0, '2019-03-12 02:22:49', '2019-03-12 02:22:49', NULL);
INSERT INTO `pro_sites` VALUES (137, 15, 'skitterphoto', 'images/23663c43cb7025f3bf36e9733bea6171.png', 'Free Stock Photos for Creative Professionals', 'https://skitterphoto.com/', 1, 200, 0, '2019-03-12 02:23:32', '2019-03-12 02:23:32', NULL);
INSERT INTO `pro_sites` VALUES (138, 15, 'mmtstock', 'images/d8d5768d2dc63763480478ae25aa176a.png', 'Free photos for commercial use', 'https://mmtstock.com/', 1, 200, 0, '2019-03-12 02:24:19', '2019-03-12 02:24:19', NULL);
INSERT INTO `pro_sites` VALUES (139, 15, 'magdeleine', 'images/12ca6edef00d1d897eb28c4a8e2f8915.png', 'HAND-PICKED FREE PHOTOS FOR YOUR INSPIRATION', 'https://magdeleine.co/browse/', 1, 200, 0, '2019-03-12 02:25:17', '2019-03-12 02:25:17', NULL);
INSERT INTO `pro_sites` VALUES (140, 15, 'jeshoots', 'images/a016e8d2ae3ee88f0ec136440e92fca8.png', 'New Free Photos & Mockups in to your Inbox!', 'http://jeshoots.com/', 1, 200, 0, '2019-03-12 02:25:49', '2019-03-12 02:25:49', NULL);
INSERT INTO `pro_sites` VALUES (141, 15, 'hdwallpapers', 'images/74db036ddf1bbfc49a22a5a6dcd392ab.png', 'High Definition Wallpapers & Desktop Backgrounds', 'https://www.hdwallpapers.net', 1, 200, 0, '2019-03-12 02:26:19', '2019-03-12 02:26:19', NULL);
INSERT INTO `pro_sites` VALUES (142, 15, 'publicdomainarchive', 'images/3c7427a4bab6bb40c12a77014f809a2a.png', 'New 100% Free Stock Photos. Every. Single. Week.', 'http://publicdomainarchive.com/', 1, 200, 0, '2019-03-12 02:26:49', '2019-03-12 02:26:49', NULL);
INSERT INTO `pro_sites` VALUES (143, 16, 'OfficePLUS', 'images/4773ef0cfcf8c9fd158fc7db0bc2cf0b.png', 'OfficePLUS，微软Office官方在线模板网站！', 'http://www.officeplus.cn/Template/Home.shtml', 1, 200, 0, '2019-03-12 02:27:23', '2019-03-12 02:27:23', NULL);
INSERT INTO `pro_sites` VALUES (144, 16, '优品PPT', 'images/b1d803179735ea628d1d914c63c0b9f7.png', '高质量的模版，而且还有PPT图表，PPT背景图等资源', 'http://www.ypppt.com/', 1, 200, 0, '2019-03-12 02:27:52', '2019-03-12 02:27:52', NULL);
INSERT INTO `pro_sites` VALUES (145, 16, 'PPT+', 'images/bfabed8750869b0214622d158ec9bddf.png', 'PPT加直播、录制和分享—PPT+语音内容分享平台', 'http://www.pptplus.cn/', 1, 200, 0, '2019-03-12 02:28:22', '2019-03-12 02:28:22', NULL);
INSERT INTO `pro_sites` VALUES (146, 16, 'PPTMind', 'images/857bb0f6927c2a8c246653cb41136ce7.png', '分享高端ppt模板与keynote模板的数字作品交易平台', 'http://www.pptmind.com/', 1, 200, 0, '2019-03-12 02:28:53', '2019-03-12 02:28:53', NULL);
INSERT INTO `pro_sites` VALUES (147, 16, 'tretars', 'images/14a77db5ab4af0ba947b1e1707295c5d.png', 'The best free Mockups from the Web', 'http://www.tretars.com/ppt-templates', 1, 200, 0, '2019-03-12 02:29:21', '2019-03-12 02:29:21', NULL);
INSERT INTO `pro_sites` VALUES (148, 16, '5百丁', 'images/3f735ae4b6e18cd6cff3965661289aac.png', '中国领先的PPT模板共享平台', 'http://ppt.500d.me/', 1, 200, 0, '2019-03-12 02:29:51', '2019-03-12 02:29:51', NULL);
INSERT INTO `pro_sites` VALUES (149, 18, 'photoshop', 'images/e7117e80fdb340589bc8969900e2af61.png', 'Photoshop不需要解释', 'https://www.adobe.com/cn/products/photoshop.html', 1, 200, 0, '2019-03-12 02:30:54', '2019-03-12 02:30:54', NULL);
INSERT INTO `pro_sites` VALUES (150, 18, 'Affinity Designer', 'images/290add1cdb3cdb80e6e30af137d48525.png', '专业创意软件', 'https://affinity.serif.com/', 1, 200, 0, '2019-03-12 02:32:06', '2019-03-12 02:32:06', NULL);
INSERT INTO `pro_sites` VALUES (151, 18, 'Illustrator', 'images/6882fdb094820bae95054ea1c38a3baf.png', '矢量图形和插图。', 'https://www.adobe.com/cn/products/illustrator/', 1, 200, 0, '2019-03-12 02:32:51', '2019-03-12 02:32:51', NULL);
INSERT INTO `pro_sites` VALUES (152, 18, 'indesign', 'images/4db54894b6751e253212a690dada0df8.png', '页面设计、布局和出版。', 'http://www.adobe.com/cn/products/indesign.html', 1, 200, 0, '2019-03-12 02:33:19', '2019-03-12 02:33:19', NULL);
INSERT INTO `pro_sites` VALUES (153, 18, 'cinema-4d', 'images/ac0344f03fc1e59b4144fef92a12e211.png', 'Cinema 4D is the perfect package for all 3D artists who want to achieve breathtaking results fast and hassle-free.', 'https://www.maxon.net/en/products/cinema-4d/overview/', 1, 200, 0, '2019-03-12 02:34:04', '2019-03-12 02:34:04', NULL);
INSERT INTO `pro_sites` VALUES (154, 18, '3ds-max', 'images/3aacac5d23583cdc250a970a0e30a9aa.png', '3D modeling, animation, and rendering software', 'https://www.autodesk.com/products/3ds-max/overview', 1, 200, 0, '2019-03-12 02:34:39', '2019-03-12 02:34:39', NULL);
INSERT INTO `pro_sites` VALUES (155, 18, 'Blender', 'images/5d61addac4350caee364f0a3e850a3f7.png', 'Blender is the free and open source 3D creation suite.', 'https://www.blender.org/', 1, 200, 0, '2019-03-12 02:35:09', '2019-03-12 02:35:09', NULL);
INSERT INTO `pro_sites` VALUES (156, 19, 'Sketch', 'images/75cc5b5775361d5f0b471b706a115403.png', 'The digital design toolkit', 'https://sketchapp.com/', 1, 200, 0, '2019-03-12 02:35:55', '2019-03-12 02:35:55', NULL);
INSERT INTO `pro_sites` VALUES (157, 19, 'Adobe XD', 'images/9eda46042e2ad058951fa4e4bb3a9957.png', 'Introducing Adobe XD. Design. Prototype. Experience.', 'http://www.adobe.com/products/xd.html', 1, 200, 0, '2019-03-12 02:36:39', '2019-03-12 02:36:39', NULL);
INSERT INTO `pro_sites` VALUES (158, 19, 'invisionapp', 'images/7d5620f1b4fd85c4a7ea4733deed8823.png', 'Powerful design prototyping tools', 'https://www.invisionapp.com/', 1, 200, 0, '2019-03-12 02:37:36', '2019-03-12 02:37:36', NULL);
INSERT INTO `pro_sites` VALUES (159, 19, 'marvelapp', 'images/28ec81158c67d9783afccf8fcd1bbee6.png', 'Simple design, prototyping and collaboration', 'https://marvelapp.com/', 1, 200, 0, '2019-03-12 02:38:14', '2019-03-12 02:38:14', NULL);
INSERT INTO `pro_sites` VALUES (160, 19, 'Muse CC', 'images/612cf530fe80b5f28dc826c4384087bf.png', '无需利用编码即可进行网站设计。', 'https://creative.adobe.com/zh-cn/products/download/muse', 1, 200, 0, '2019-03-12 02:38:53', '2019-03-12 02:38:53', NULL);
INSERT INTO `pro_sites` VALUES (161, 19, 'figma', 'images/0623aab0bc72437206deca9d4c55df1c.png', 'Design, prototype, and gather feedback all in one place with Figma.', 'https://www.figma.com/', 1, 200, 0, '2019-03-12 02:39:20', '2019-03-12 02:39:20', NULL);
INSERT INTO `pro_sites` VALUES (162, 20, 'Adobe After Effects CC', 'images/01306292e590f37b934785ed67288f80.png', '电影般的视觉效果和动态图形。', 'https://www.adobe.com/cn/products/aftereffects/', 1, 200, 0, '2019-03-12 02:40:17', '2019-03-12 02:40:17', NULL);
INSERT INTO `pro_sites` VALUES (163, 20, 'principle', 'images/485a410f2076ad20856199caa300f548.png', 'Animate Your Ideas, Design Better Apps', 'http://principleformac.com/', 1, 200, 0, '2019-03-12 02:40:48', '2019-03-12 02:40:48', NULL);
INSERT INTO `pro_sites` VALUES (164, 20, 'flinto', 'images/f655d57c7d752c429510e0f649d69666.png', 'Flinto is a Mac app used by top designers around the world to create interactive and animated prototypes of their app designs.', 'https://www.flinto.com/', 1, 200, 0, '2019-03-12 02:41:26', '2019-03-12 02:41:26', NULL);
INSERT INTO `pro_sites` VALUES (165, 20, 'framer', 'images/e64c3cd0283a3bf6a75c9c4ba821049d.png', 'Design everything from detailed icons to high-fidelity interactions—all in one place.', 'https://framer.com/', 1, 200, 0, '2019-03-12 02:42:05', '2019-03-12 02:42:05', NULL);
INSERT INTO `pro_sites` VALUES (166, 20, 'ProtoPie', 'images/bdbb0e0485d816b88c75c9276d273873.png', '高保真交互原型设计', 'http://www.protopie.cn/', 1, 200, 0, '2019-03-12 02:42:41', '2019-03-12 02:42:41', NULL);
INSERT INTO `pro_sites` VALUES (167, 21, 'khroma', 'images/8b158c18b49f0160100086bfcdbe158d.png', 'Khroma is the fastest way to discover, search, and save color combos you\'ll want to use.', 'http://khroma.co/generator/', 1, 200, 0, '2019-03-12 02:45:06', '2019-03-12 02:45:06', NULL);
INSERT INTO `pro_sites` VALUES (168, 21, 'uigradients', 'images/9842ff5c221d6411444d3c13660ba097.png', 'Beautiful colored gradients', 'https://uigradients.com', 1, 200, 0, '2019-03-12 02:45:49', '2019-03-12 02:45:49', NULL);
INSERT INTO `pro_sites` VALUES (169, 21, 'gradients', 'images/64d0ac5dc78b65d83ba500df5b1eab30.png', 'Curated gradients for designers and developers', 'http://gradients.io/', 1, 200, 0, '2019-03-12 02:46:19', '2019-03-12 02:46:19', NULL);
INSERT INTO `pro_sites` VALUES (170, 21, 'Coolest', 'images/9b77eaad5ef27823b9feb3f765b9d593.png', 'Coolest handpicked Gradient Hues for your next super ⚡ amazing stuff', 'https://webkul.github.io/coolhue/', 1, 200, 0, '2019-03-12 02:46:47', '2019-03-12 02:46:47', NULL);
INSERT INTO `pro_sites` VALUES (171, 21, 'webgradients', 'images/49bfc25c217107d7209eea098ad0307c.png', 'WebGradients is a free collection of 180 linear gradients that you can use as content backdrops in any part of your website.', 'https://webgradients.com/', 1, 200, 0, '2019-03-12 02:47:17', '2019-03-12 02:47:17', NULL);
INSERT INTO `pro_sites` VALUES (172, 21, 'grabient', 'images/8ab1a1044ef9bc5c306c60b81d83b0a2.png', '2017 Grabient by unfold', 'https://www.grabient.com/', 1, 200, 0, '2019-03-12 02:48:04', '2019-03-12 02:48:04', NULL);
INSERT INTO `pro_sites` VALUES (173, 21, 'thedayscolor', 'images/6e63366cb896fa19e204cf6b95691062.png', 'The daily color digest', 'http://www.thedayscolor.com/', 1, 200, 0, '2019-03-12 02:48:34', '2019-03-12 02:48:34', NULL);
INSERT INTO `pro_sites` VALUES (174, 21, 'flatuicolors', 'images/0b6e14ae22ff962a96ad66de4fc86aff.png', 'Copy Paste Color Pallette from Flat UI Theme', 'http://flatuicolors.com/', 1, 200, 0, '2019-03-12 02:49:25', '2019-03-12 02:49:25', NULL);
INSERT INTO `pro_sites` VALUES (175, 21, 'coolors', 'images/9176968478c5c42ed20bce8b69f25bf6.png', 'The super fast color schemes generator!', 'https://coolors.co/', 1, 200, 0, '2019-03-12 02:50:11', '2019-03-12 02:50:11', NULL);
INSERT INTO `pro_sites` VALUES (176, 0, 'colorhunt', 'images/37cf035215ac7e51cc0064c207f298e1.png', 'Beautiful Color Palettes', 'http://www.colorhunt.co/', 1, 200, 0, '2019-03-12 02:50:35', '2019-03-12 02:50:35', NULL);
INSERT INTO `pro_sites` VALUES (177, 21, 'Adobe Color CC', 'images/ff4d69bedb642bd132297ed22018369b.png', 'Create color schemes with the color wheel or browse thousands of color combinations from the Color community.', 'https://color.adobe.com/zh/create/color-wheel', 1, 200, 0, '2019-03-12 02:51:03', '2019-03-12 02:51:03', NULL);
INSERT INTO `pro_sites` VALUES (178, 21, 'flatuicolorpicker', 'images/2faf82318597d846e9522c5f52500031.png', 'Best Flat Colors For UI Design', 'http://www.flatuicolorpicker.com/', 1, 200, 0, '2019-03-12 02:51:35', '2019-03-12 02:51:35', NULL);
INSERT INTO `pro_sites` VALUES (179, 21, 'trianglify', 'images/88261a86b35e5b015bbe35ab9141bc8f.png', 'Trianglify Generator', 'http://qrohlf.com/trianglify-generator/', 1, 200, 0, '2019-03-12 02:52:12', '2019-03-12 02:52:12', NULL);
INSERT INTO `pro_sites` VALUES (180, 21, 'klart', 'images/c51065aaec56c7c65aafd40f4797dba0.png', 'Beautiful colors and designs to your inbox every week', 'https://klart.co/colors/', 1, 200, 0, '2019-03-12 02:52:40', '2019-03-12 02:52:40', NULL);
INSERT INTO `pro_sites` VALUES (181, 21, 'vanschneider', 'images/4690e9281c23d5fc9df0e2cfbe018edd.png', 'Color Claim was created in 2012 by Tobias van Schneider with the goal to collect & combine unique colors for my future projects.', 'http://www.vanschneider.com/colors', 1, 200, 0, '2019-03-12 02:53:23', '2019-03-12 02:53:23', NULL);
INSERT INTO `pro_sites` VALUES (182, 22, 'tinypng', 'images/9344c4d9769745c1e63d8f1e7b2f3f25.png', 'Optimize your images with a perfect balance in quality and file size.', 'https://tinypng.com/', 1, 200, 0, '2019-03-12 02:54:39', '2019-03-12 02:54:39', NULL);
INSERT INTO `pro_sites` VALUES (183, 0, 'goqr', 'images/c3abf8084a1699d9a2618e76a90d3935.png', 'create QR codes for free (Logo, T-Shirt, vCard, EPS)', 'http://goqr.me/', 1, 200, 0, '2019-03-12 02:55:04', '2019-03-12 02:55:04', NULL);
INSERT INTO `pro_sites` VALUES (184, 22, 'Android 9 patch', 'images/dc5b75e3455673384a8f738429789d4b.png', 'Android 9-patch shadow generator fully customizable shadows', 'http://inloop.github.io/shadow4android/', 1, 200, 0, '2019-03-12 02:55:38', '2019-03-12 02:55:38', NULL);
INSERT INTO `pro_sites` VALUES (185, 22, 'screen sizes', 'images/d79583290bc400c0e8a2629d0e7f9f63.png', 'Viewport Sizes and Pixel Densities for Popular Devices', 'http://screensiz.es/', 1, 200, 0, '2019-03-12 02:56:06', '2019-03-12 02:56:06', NULL);
INSERT INTO `pro_sites` VALUES (186, 22, 'svgomg', 'images/f573dc81e4689cb9ce482f35a6fb82f1.png', 'SVG在线压缩平台', 'https://jakearchibald.github.io/svgomg/', 1, 200, 0, '2019-03-12 02:56:37', '2019-03-12 02:56:37', NULL);
INSERT INTO `pro_sites` VALUES (187, 22, '稿定抠图', 'images/0a6b1b1ea1d5ca5cb49e8cf95470a3b5.png', '免费在线抠图软件,图片快速换背景-抠白底图', 'https://www.gaoding.com', 1, 200, 0, '2019-03-12 02:56:59', '2019-03-12 02:56:59', NULL);
INSERT INTO `pro_sites` VALUES (188, 23, 'wappalyzer', 'images/60696fcbba523de88eca68121dee7be7.png', 'Identify technology on websites', 'https://www.wappalyzer.com/', 1, 200, 0, '2019-03-12 02:58:27', '2019-03-12 02:58:27', NULL);
INSERT INTO `pro_sites` VALUES (189, 23, 'Panda', 'images/35e1bbf29c1116cb1dbb703b52ea2ae9.png', 'A smart news reader built for productivity.', 'http://usepanda.com/', 1, 200, 0, '2019-03-12 02:58:50', '2019-03-12 02:58:50', NULL);
INSERT INTO `pro_sites` VALUES (190, 23, 'sizzy', 'images/5ca0b65bcc3606640ba1b4aadd25c7df.png', 'A tool for developing responsive websites crazy-fast', 'https://sizzy.co/', 1, 200, 0, '2019-03-12 02:59:17', '2019-03-12 02:59:17', NULL);
INSERT INTO `pro_sites` VALUES (191, 23, 'csspeeper', 'images/84fedbd61bf8c93726b713bae36a88ae.png', 'Smart CSS viewer tailored for Designers.', 'https://csspeeper.com/', 1, 200, 0, '2019-03-12 02:59:48', '2019-03-12 02:59:48', NULL);
INSERT INTO `pro_sites` VALUES (192, 23, 'insight', 'images/fc5a318293079a2674f1d92f3dce7650.png', 'IDE-like code search and navigation, on the cloud', 'http://insight.io/', 1, 200, 0, '2019-03-12 03:00:22', '2019-03-12 03:00:22', NULL);
INSERT INTO `pro_sites` VALUES (193, 23, 'mustsee', 'images/709ff744a41559fa06b8e8dc199206a3.png', 'Discover the world\'s most beautiful places at every opened tab.', 'http://mustsee.earth/', 1, 200, 0, '2019-03-12 03:00:50', '2019-03-12 03:00:50', NULL);
INSERT INTO `pro_sites` VALUES (194, 25, 'Design Guidelines', 'images/cd3c32252bb659437d63d59ca6fec8fb.png', 'Design Guidelines — The way products are built.', 'http://designguidelines.co/', 1, 200, 0, '2019-03-12 03:01:29', '2019-03-12 03:01:29', NULL);
INSERT INTO `pro_sites` VALUES (195, 25, 'Awesome design systems', 'images/3adfef3862ba2083e737bbb0c9b734c1.png', 'A collection of awesome design systems', 'https://github.com/alexpate/awesome-design-systems', 1, 200, 0, '2019-03-12 03:01:55', '2019-03-12 03:01:55', NULL);
INSERT INTO `pro_sites` VALUES (196, 25, 'Material Design', 'images/34061dd29655cfb0781381568b26b1d6.png', 'Introduction - Material Design', 'https://material.io/guidelines/', 1, 200, 0, '2019-03-12 03:02:28', '2019-03-12 03:02:28', NULL);
INSERT INTO `pro_sites` VALUES (197, 25, 'Human Interface Guidelines', 'images/4fa8f4924f62370774915faf0fbc476d.png', 'Human Interface Guidelines iOS', 'https://developer.apple.com/ios/human-interface-guidelines', 1, 200, 0, '2019-03-12 03:02:57', '2019-03-12 03:02:57', NULL);
INSERT INTO `pro_sites` VALUES (198, 25, 'Photoshop Etiquette', 'images/9d6924419746baef1dcc5c203a321e6d.png', 'PS礼仪-WEB设计指南', 'http://viggoz.com/photoshopetiquette/', 1, 200, 0, '2019-03-12 03:03:33', '2019-03-12 03:03:33', NULL);
INSERT INTO `pro_sites` VALUES (199, 26, 'Photoshop Lady', 'images/975585f8d4d7efa6646b50dbc860cf5a.png', 'Your Favourite Photoshop Tutorials in One Place', 'http://www.photoshoplady.com/', 1, 200, 0, '2019-03-12 03:04:09', '2019-03-12 03:04:09', NULL);
INSERT INTO `pro_sites` VALUES (200, 26, 'doyoudo', 'images/d810229b8e5bc36d3ac498fe4ee5ebee.png', '创意设计软件学习平台', 'http://doyoudo.com/', 1, 200, 0, '2019-03-12 03:04:38', '2019-03-12 03:04:38', NULL);
INSERT INTO `pro_sites` VALUES (201, 26, '没位道', 'images/1bb8a33edda0aaf2871ba17e6b265cf9.png', 'WEB UI免费视频公开课', 'http://www.c945.com/web-ui-tutorial/', 1, 200, 0, '2019-03-12 03:05:04', '2019-03-12 03:05:04', NULL);
INSERT INTO `pro_sites` VALUES (202, 26, '慕课网', 'images/806fbd13251a921287ec2a3e815eafc8.png', '程序员的梦工厂（有UI课程）', 'https://www.imooc.com/', 1, 200, 0, '2019-03-12 03:05:29', '2019-03-12 03:05:29', NULL);
INSERT INTO `pro_sites` VALUES (203, 27, '优设网', 'images/03508090a91cb0380760bb568054f31b.png', '设计师交流学习平台', 'http://www.uisdc.com/', 1, 200, 0, '2019-03-12 03:06:02', '2019-03-12 03:06:02', NULL);
INSERT INTO `pro_sites` VALUES (204, 27, 'Web Design Ledger', 'images/29345c700e66d707075758c51421b718.png', 'Web Design Blog', 'https://webdesignledger.com', 1, 200, 0, '2019-03-12 03:06:28', '2019-03-12 03:06:28', NULL);
INSERT INTO `pro_sites` VALUES (205, 27, 'Medium', 'images/f9d1866ec8568b6a7744936842d773ac.png', 'Read, write and share stories that matter', 'https://medium.com/', 1, 200, 0, '2019-03-12 03:06:57', '2019-03-12 03:06:57', NULL);
INSERT INTO `pro_sites` VALUES (206, 28, 'UX Coffee', 'images/c9aae7e06ebabe9549d78c8b0cd0757d.png', '《UX Coffee 设计咖》是一档关于用户体验的播客节目。我们邀请来自硅谷和国内的学者和职人来聊聊「产品设计」、「用户体验」和「个人成长」。', 'http://uxcoffee.co/', 1, 200, 0, '2019-03-12 03:08:40', '2019-03-12 03:08:40', NULL);
INSERT INTO `pro_sites` VALUES (207, 28, 'Anyway.FM', 'images/7fe5dade254de0528e78ce32736ff9f4.png', '设计杂谈 • UI 设计师 JJ 和 Leon 主播的设计播客', 'https://anyway.fm/', 1, 200, 0, '2019-03-12 03:09:19', '2019-03-12 03:09:19', NULL);
INSERT INTO `pro_sites` VALUES (208, 28, '异能电台', 'images/c8e819279d4110794e2588dfb1a4bd64.png', '将全宇宙设计师的故事讲给你听。', 'https://www.yineng.fm', 1, 200, 0, '2019-03-12 03:09:52', '2019-03-12 03:09:52', NULL);
INSERT INTO `pro_sites` VALUES (209, 29, 'Little Big Details', 'images/00f85206df39e19f238ac55782bf11f4.png', 'Little Big Details is a curated collection of the finer details of design, updated every day.', 'http://littlebigdetails.com/', 1, 200, 0, '2019-03-12 03:10:25', '2019-03-12 03:10:25', NULL);
INSERT INTO `pro_sites` VALUES (210, 29, 'Smashing Magazine', 'images/f3869b4a06006186f8366199bfa43559.png', 'Below you’ll find the best tips to take not only your UX design process but also the experiences you craft to the next level.', 'https://www.smashingmagazine.com/category/user-experience', 1, 200, 0, '2019-03-12 03:11:20', '2019-03-12 03:11:20', NULL);
INSERT INTO `pro_sites` VALUES (211, 29, 'nngroup', 'images/16872736678fb982f70cafc9dec18e36.png', 'Evidence-Based User Experience Research, Training, and Consulting', 'https://www.nngroup.com/articles/', 1, 200, 0, '2019-03-12 03:11:50', '2019-03-12 03:11:50', NULL);
INSERT INTO `pro_sites` VALUES (212, 29, 'Boxes and Arrows', 'images/314a442ec053d08277ad8405ea03e42e.png', 'Boxes and Arrows is devoted to the practice, innovation, and discussion of design; including graphic design, interaction design, information architecture and the design of business.', 'http://boxesandarrows.com/', 1, 200, 0, '2019-03-12 03:12:20', '2019-03-12 03:12:20', NULL);
INSERT INTO `pro_sites` VALUES (213, 29, 'UX Design Weekly', 'images/5332d36ac4cd00a40809fdfcb8412ce0.png', 'get a hand picked list of the best user experience design links every week.', 'http://uxdesignweekly.com/', 1, 200, 0, '2019-03-12 03:12:43', '2019-03-12 03:12:43', NULL);
INSERT INTO `pro_sites` VALUES (214, 29, 'UX Ren', 'images/15b0365192ebbe1a96a87594726a2610.png', '用户体验人的专业社区', 'http://uxren.cn/', 1, 200, 0, '2019-03-12 03:13:12', '2019-03-12 03:13:12', NULL);
INSERT INTO `pro_sites` VALUES (215, 30, 'Airbnb Design', 'images/1ca7034320eac5d82fb87012c176abab.png', 'Airbnb Design', 'https://airbnb.design', 1, 200, 0, '2019-03-12 06:41:36', '2019-03-12 06:41:36', NULL);
INSERT INTO `pro_sites` VALUES (216, 30, 'Facebook Design', 'images/b9dd32f84034c07484aa2e873d788504.png', 'Facebook Design', 'http://facebook.design/', 1, 200, 0, '2019-03-12 06:42:01', '2019-03-12 06:42:01', NULL);
INSERT INTO `pro_sites` VALUES (217, 30, 'Google Design', 'images/37a0ba7d9acb398adbefa207c30d5efd.png', 'Google Design', 'https://design.google/', 1, 200, 0, '2019-03-12 06:42:20', '2019-03-12 06:42:20', NULL);
INSERT INTO `pro_sites` VALUES (218, 30, 'eico design', 'images/25221e2badeed41de84e490e9573da12.png', '数字化咨询与产品专家', 'http://eicodesign.com/', 1, 200, 0, '2019-03-12 06:42:43', '2019-03-12 06:42:43', NULL);
INSERT INTO `pro_sites` VALUES (219, 30, 'nice design', 'images/7fbf6d9e22f141c803524181505cdbcb.png', 'nicedesign奈思设计是领先的用户体验设计与互联网品牌建设公司', 'http://www.niceui.cn/', 1, 200, 0, '2019-03-12 06:43:36', '2019-03-12 06:43:36', NULL);
INSERT INTO `pro_sites` VALUES (220, 30, '腾讯CDC', 'images/1fc6faab27b8f86002b558e41d67c09a.png', '腾讯CDC关注于互联网视觉设计、交互设计、用户研究、前端开发。', 'http://cdc.tencent.com/', 1, 200, 0, '2019-03-12 06:43:58', '2019-03-12 06:43:58', NULL);
INSERT INTO `pro_sites` VALUES (221, 30, 'TGideas', 'images/7dd5e8cd5b1cd7b27a977bb7362ab7dd.png', 'TGideas隶属于腾讯公司互动娱乐业务系统的专业推广类设计团队', 'http://tgideas.qq.com/', 1, 200, 0, '2019-03-12 06:44:20', '2019-03-12 06:44:20', NULL);
INSERT INTO `pro_sites` VALUES (222, 30, 'ISUX', 'images/fbf98a9687199d9b1260c659ae0e9a3d.png', '腾讯社交用户体验设计部', 'https://isux.tencent.com/', 1, 200, 0, '2019-03-12 06:44:44', '2019-03-12 06:44:44', NULL);
INSERT INTO `pro_sites` VALUES (223, 30, 'MXD', 'images/8c44149ec037c0bf100f5c6c3a6cf18e.png', '腾讯MIG无线互联网事业群设计团队', 'http://mxd.tencent.com/', 1, 200, 0, '2019-03-12 06:45:19', '2019-03-12 06:45:19', NULL);
INSERT INTO `pro_sites` VALUES (224, 30, 'Aliued', 'images/ffdd45c7f0e765b6b3fe77c6576b3e28.png', '阿里巴巴国际UED团队', 'http://www.aliued.com/', 1, 200, 0, '2019-03-12 06:45:42', '2019-03-12 06:45:42', NULL);
INSERT INTO `pro_sites` VALUES (225, 30, 'U一点', 'images/a6e280bf367accdcb2d6ff5456d9b6cb.png', '阿里巴巴（中国站）用户体验设计部博客U一点设计 UED团队', 'http://www.aliued.cn/', 1, 200, 0, '2019-03-12 06:46:06', '2019-03-12 06:46:06', NULL);
INSERT INTO `pro_sites` VALUES (226, 30, '网易uedc', 'images/76ce6c165d69e7ae46c96200879eecfa.png', '网易用户体验设计中心（User Experience Design Center）', 'http://uedc.163.com/', 1, 200, 0, '2019-03-12 06:46:33', '2019-03-12 06:46:33', NULL);
INSERT INTO `pro_sites` VALUES (227, 30, '百度用户体验中心', 'images/0bf95e0706e7680d4d2ae9999e982b3f.png', '百度用户体验中心', 'http://ued.baidu.com/', 1, 200, 0, '2019-03-12 06:46:54', '2019-03-12 06:46:54', NULL);
INSERT INTO `pro_sites` VALUES (228, 30, '京东设计中心', 'images/ed1c81d060a389d764a16e48fb9f0ca8.png', '京东设计中心', 'http://jdc.jd.com/', 1, 200, 0, '2019-03-12 06:47:14', '2019-03-12 06:47:14', NULL);
INSERT INTO `pro_sites` VALUES (229, 30, '百度企业产品用户体验中心', 'images/3d16b74d5d2a45649f58f63191727509.png', '百度企业产品用户体验中心', 'http://eux.baidu.com/', 1, 200, 0, '2019-03-12 06:47:32', '2019-03-12 06:47:32', NULL);
INSERT INTO `pro_sites` VALUES (230, 30, '携程设计委员会', 'images/e0ea9dd95aa42fd146e775479473891e.png', '携程设计委员会-Ctrip Design Committee', 'http://ued.ctrip.com/', 1, 200, 0, '2019-03-12 06:48:03', '2019-03-12 06:48:03', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
