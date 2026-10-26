/*
 Navicat Premium Data Transfer

 Source Server         : NEWWAVE
 Source Server Type    : MySQL
 Source Server Version : 120302
 Source Host           : localhost:3306
 Source Schema         : streetkings_4ae6b7

 Target Server Type    : MySQL
 Target Server Version : 120302
 File Encoding         : 65001

 Date: 06/07/2026 08:00:36
*/

-- Copiando estrutura do banco de dados para bigsmoker
CREATE DATABASE IF NOT EXISTS `nwmidnightclub` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `nwmidnightclub`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for event_leaderboards
-- ----------------------------
DROP TABLE IF EXISTS `event_leaderboards`;
CREATE TABLE `event_leaderboards`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `license` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_class` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `score_value` int NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp,
  `vehicle_model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_event_created`(`event_id` ASC, `created_at` ASC) USING BTREE,
  INDEX `idx_event_score`(`event_id` ASC, `score_value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for player_avatars
-- ----------------------------
DROP TABLE IF EXISTS `player_avatars`;
CREATE TABLE `player_avatars`  (
  `owner_identifier` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schema_version` smallint UNSIGNED NOT NULL,
  `document_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`owner_identifier`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for player_saves
-- ----------------------------
DROP TABLE IF EXISTS `player_saves`;
CREATE TABLE `player_saves`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_identifier` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slot_index` tinyint UNSIGNED NOT NULL,
  `display_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Save',
  `schema_version` smallint UNSIGNED NOT NULL,
  `document_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_played_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_owner_slot`(`owner_identifier` ASC, `slot_index` ASC) USING BTREE,
  INDEX `idx_owner`(`owner_identifier` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stunt_jumps
-- ----------------------------
DROP TABLE IF EXISTS `stunt_jumps`;
CREATE TABLE `stunt_jumps`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
