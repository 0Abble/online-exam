/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 18/02/2023 12:23:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exam_clazz
-- ----------------------------
DROP TABLE IF EXISTS `exam_clazz`;
CREATE TABLE `exam_clazz`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班级名称',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除0未删除1以删除',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '年级班级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_clazz
-- ----------------------------
INSERT INTO `exam_clazz` VALUES (1, '2021级1班', '', 0, '5201314', '', NULL, NULL);
INSERT INTO `exam_clazz` VALUES (2, '2021级2班', '', 0, '5201314', '', '2023-01-07 12:58:20', NULL);
INSERT INTO `exam_clazz` VALUES (3, '2021级3班', '', 0, '5201314', '', '2023-01-07 12:58:30', NULL);
INSERT INTO `exam_clazz` VALUES (4, '2021级4班', '', 0, '5201314', '', '2023-01-07 12:58:42', NULL);
INSERT INTO `exam_clazz` VALUES (5, '2021级5班', '', 0, '5201314', '', '2023-01-07 12:58:50', NULL);
INSERT INTO `exam_clazz` VALUES (6, '2021级6班', '', 0, '5201314', '', '2023-01-07 12:58:59', NULL);
INSERT INTO `exam_clazz` VALUES (7, '2021级7班', '', 0, '5201314', '', '2023-01-07 12:59:09', NULL);

-- ----------------------------
-- Table structure for exam_major
-- ----------------------------
DROP TABLE IF EXISTS `exam_major`;
CREATE TABLE `exam_major`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '专业名',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除0未删除1以删除',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '专业' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_major
-- ----------------------------
INSERT INTO `exam_major` VALUES (1, '计算机科学与技术', '', 0, '000000', '', '2023-01-06 23:17:23', NULL);
INSERT INTO `exam_major` VALUES (2, '软件工程', '', 0, '5201314', '', '2023-01-07 09:51:19', NULL);
INSERT INTO `exam_major` VALUES (3, '软件技术', '', 0, '5201314', '', '2023-01-07 10:49:36', NULL);
INSERT INTO `exam_major` VALUES (4, '计算机网络', '', 0, '5201314', '', '2023-01-07 10:49:46', NULL);
INSERT INTO `exam_major` VALUES (5, '工程造价', '', 0, '5201314', '', '2023-01-07 10:51:29', NULL);

-- ----------------------------
-- Table structure for exam_notice
-- ----------------------------
DROP TABLE IF EXISTS `exam_notice`;
CREATE TABLE `exam_notice`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '题目',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '内容',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除0未删除1以删除',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_notice
-- ----------------------------
INSERT INTO `exam_notice` VALUES ('fe598cb804ee3a0ad954b9a8c5ce58b3', '重要通知！！', '<p>重要通知！！寒假提前开学</p>', '', 0, '000000', NULL, '2023-01-24 16:17:23', NULL);

-- ----------------------------
-- Table structure for exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper`;
CREATE TABLE `exam_paper`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `major_id` int(11) NULL DEFAULT NULL COMMENT '专业id',
  `subject_id` int(11) NULL DEFAULT NULL COMMENT '课程科目',
  `answer_num` int(10) NULL DEFAULT NULL COMMENT '答题次数',
  `question_num` int(10) NULL DEFAULT NULL COMMENT '题目数量',
  `paper_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '试卷标题',
  `is_checked` tinyint(1) NULL DEFAULT 0 COMMENT '是否审核通过 -1未通过 0审核中 1已通过',
  `is_affirm` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '是否确认 0 未确认 1以确认',
  `difficulty` int(1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '试卷难度',
  `exam_date_start` date NULL DEFAULT NULL COMMENT '试卷开始日期',
  `exam_date_end` date NULL DEFAULT NULL COMMENT '试卷结束日期',
  `total_point` float(10, 2) NULL DEFAULT NULL COMMENT '总分',
  `pass_mark` float(10, 2) NULL DEFAULT NULL COMMENT '及格分数',
  `exam_time` int(10) NULL DEFAULT NULL COMMENT '考试时间（分）',
  `check_msg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '审核信息',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除0未删除1以删除',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '试卷' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_paper
-- ----------------------------
INSERT INTO `exam_paper` VALUES ('8e819b7be9dd5442e9667eb892d931a8', 1, 3, 2, 28, '21级计算机科学6班 编码规范', 1, 1, 3, '2023-01-18', '2023-01-24', 80.00, 45.00, 100, NULL, '21级计算机科学6班 编码规范测试', 0, '5201314', '5201314', '2023-01-18 12:00:20', '2023-01-18 12:05:15');
INSERT INTO `exam_paper` VALUES ('c823454dcb14d842278d010d44db6854', 1, 1, 2, NULL, 'test', -1, 1, 1, '2023-01-10', '2023-01-12', NULL, 30.00, NULL, '<p>总分为空<img src=\"data:image/png;base64,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\" alt=\"data:image/png;base64,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\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p>', 'test', 0, '5201314', '5201314', '2023-01-09 13:32:47', '2023-01-09 17:51:35');
INSERT INTO `exam_paper` VALUES ('d9f43af80eb1b081b3c4cb2efeaf4fde', 1, 1, 1, 11, '测试', 1, 1, 1, '2023-01-21', '2023-01-21', 29.00, 20.00, 10, NULL, '测试试卷', 0, '5201314', '5201314', '2023-01-21 21:31:29', '2023-01-21 21:38:30');
INSERT INTO `exam_paper` VALUES ('e41beaf40708c8450abdce5fa2b051ea', 1, 1, 2, 45, '计科6班2021级计算机网络', 1, 1, 2, '2023-01-04', '2023-01-25', 100.00, 60.00, 120, NULL, '测试', 0, '5201314', '5201314', '2023-01-08 20:35:50', '2023-01-09 17:51:35');

-- ----------------------------
-- Table structure for exam_paper_clazz
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_clazz`;
CREATE TABLE `exam_paper_clazz`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '试卷id',
  `clazz_id` int(11) NULL DEFAULT NULL COMMENT '班级id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '试卷分配给班级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_paper_clazz
-- ----------------------------
INSERT INTO `exam_paper_clazz` VALUES (1, 'e41beaf40708c8450abdce5fa2b051ea', 6);
INSERT INTO `exam_paper_clazz` VALUES (3, 'e41beaf40708c8450abdce5fa2b051ea', 5);
INSERT INTO `exam_paper_clazz` VALUES (5, '8e819b7be9dd5442e9667eb892d931a8', 6);
INSERT INTO `exam_paper_clazz` VALUES (6, 'bb06d6e1bfd16b563b4453d651c83eff', 6);
INSERT INTO `exam_paper_clazz` VALUES (7, 'd9f43af80eb1b081b3c4cb2efeaf4fde', 6);

-- ----------------------------
-- Table structure for exam_paper_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_question`;
CREATE TABLE `exam_paper_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '试卷id',
  `question_id` int(11) NULL DEFAULT NULL COMMENT '题目id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '试卷与题目关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_paper_question
-- ----------------------------
INSERT INTO `exam_paper_question` VALUES (2, 'e41beaf40708c8450abdce5fa2b051ea', 1);
INSERT INTO `exam_paper_question` VALUES (3, 'e41beaf40708c8450abdce5fa2b051ea', 2);
INSERT INTO `exam_paper_question` VALUES (4, 'e41beaf40708c8450abdce5fa2b051ea', 3);
INSERT INTO `exam_paper_question` VALUES (5, 'e41beaf40708c8450abdce5fa2b051ea', 69);
INSERT INTO `exam_paper_question` VALUES (6, 'e41beaf40708c8450abdce5fa2b051ea', 5);
INSERT INTO `exam_paper_question` VALUES (7, 'e41beaf40708c8450abdce5fa2b051ea', 70);
INSERT INTO `exam_paper_question` VALUES (8, 'e41beaf40708c8450abdce5fa2b051ea', 6);
INSERT INTO `exam_paper_question` VALUES (9, 'e41beaf40708c8450abdce5fa2b051ea', 8);
INSERT INTO `exam_paper_question` VALUES (10, 'e41beaf40708c8450abdce5fa2b051ea', 9);
INSERT INTO `exam_paper_question` VALUES (11, 'e41beaf40708c8450abdce5fa2b051ea', 10);
INSERT INTO `exam_paper_question` VALUES (12, 'e41beaf40708c8450abdce5fa2b051ea', 11);
INSERT INTO `exam_paper_question` VALUES (13, 'e41beaf40708c8450abdce5fa2b051ea', 12);
INSERT INTO `exam_paper_question` VALUES (14, 'e41beaf40708c8450abdce5fa2b051ea', 13);
INSERT INTO `exam_paper_question` VALUES (15, 'e41beaf40708c8450abdce5fa2b051ea', 14);
INSERT INTO `exam_paper_question` VALUES (16, 'e41beaf40708c8450abdce5fa2b051ea', 15);
INSERT INTO `exam_paper_question` VALUES (17, 'e41beaf40708c8450abdce5fa2b051ea', 16);
INSERT INTO `exam_paper_question` VALUES (18, 'e41beaf40708c8450abdce5fa2b051ea', 17);
INSERT INTO `exam_paper_question` VALUES (19, 'e41beaf40708c8450abdce5fa2b051ea', 18);
INSERT INTO `exam_paper_question` VALUES (20, 'e41beaf40708c8450abdce5fa2b051ea', 19);
INSERT INTO `exam_paper_question` VALUES (21, 'e41beaf40708c8450abdce5fa2b051ea', 20);
INSERT INTO `exam_paper_question` VALUES (22, 'e41beaf40708c8450abdce5fa2b051ea', 21);
INSERT INTO `exam_paper_question` VALUES (23, 'e41beaf40708c8450abdce5fa2b051ea', 22);
INSERT INTO `exam_paper_question` VALUES (24, 'e41beaf40708c8450abdce5fa2b051ea', 23);
INSERT INTO `exam_paper_question` VALUES (25, 'e41beaf40708c8450abdce5fa2b051ea', 24);
INSERT INTO `exam_paper_question` VALUES (26, 'e41beaf40708c8450abdce5fa2b051ea', 25);
INSERT INTO `exam_paper_question` VALUES (27, 'e41beaf40708c8450abdce5fa2b051ea', 26);
INSERT INTO `exam_paper_question` VALUES (28, 'e41beaf40708c8450abdce5fa2b051ea', 27);
INSERT INTO `exam_paper_question` VALUES (29, 'e41beaf40708c8450abdce5fa2b051ea', 28);
INSERT INTO `exam_paper_question` VALUES (30, 'e41beaf40708c8450abdce5fa2b051ea', 29);
INSERT INTO `exam_paper_question` VALUES (31, 'e41beaf40708c8450abdce5fa2b051ea', 30);
INSERT INTO `exam_paper_question` VALUES (32, 'e41beaf40708c8450abdce5fa2b051ea', 31);
INSERT INTO `exam_paper_question` VALUES (33, 'e41beaf40708c8450abdce5fa2b051ea', 32);
INSERT INTO `exam_paper_question` VALUES (34, 'e41beaf40708c8450abdce5fa2b051ea', 33);
INSERT INTO `exam_paper_question` VALUES (35, 'e41beaf40708c8450abdce5fa2b051ea', 35);
INSERT INTO `exam_paper_question` VALUES (36, 'e41beaf40708c8450abdce5fa2b051ea', 36);
INSERT INTO `exam_paper_question` VALUES (37, 'e41beaf40708c8450abdce5fa2b051ea', 37);
INSERT INTO `exam_paper_question` VALUES (38, 'e41beaf40708c8450abdce5fa2b051ea', 38);
INSERT INTO `exam_paper_question` VALUES (39, 'e41beaf40708c8450abdce5fa2b051ea', 42);
INSERT INTO `exam_paper_question` VALUES (40, 'e41beaf40708c8450abdce5fa2b051ea', 43);
INSERT INTO `exam_paper_question` VALUES (41, 'e41beaf40708c8450abdce5fa2b051ea', 44);
INSERT INTO `exam_paper_question` VALUES (42, 'e41beaf40708c8450abdce5fa2b051ea', 47);
INSERT INTO `exam_paper_question` VALUES (43, 'e41beaf40708c8450abdce5fa2b051ea', 48);
INSERT INTO `exam_paper_question` VALUES (44, 'e41beaf40708c8450abdce5fa2b051ea', 50);
INSERT INTO `exam_paper_question` VALUES (45, 'e41beaf40708c8450abdce5fa2b051ea', 54);
INSERT INTO `exam_paper_question` VALUES (46, 'e41beaf40708c8450abdce5fa2b051ea', 57);
INSERT INTO `exam_paper_question` VALUES (47, 'c823454dcb14d842278d010d44db6854', 32);
INSERT INTO `exam_paper_question` VALUES (48, 'c823454dcb14d842278d010d44db6854', 1);
INSERT INTO `exam_paper_question` VALUES (49, 'c823454dcb14d842278d010d44db6854', 33);
INSERT INTO `exam_paper_question` VALUES (50, 'c823454dcb14d842278d010d44db6854', 34);
INSERT INTO `exam_paper_question` VALUES (51, 'c823454dcb14d842278d010d44db6854', 35);
INSERT INTO `exam_paper_question` VALUES (52, 'c823454dcb14d842278d010d44db6854', 8);
INSERT INTO `exam_paper_question` VALUES (53, 'c823454dcb14d842278d010d44db6854', 10);
INSERT INTO `exam_paper_question` VALUES (54, 'c823454dcb14d842278d010d44db6854', 11);
INSERT INTO `exam_paper_question` VALUES (55, 'c823454dcb14d842278d010d44db6854', 12);
INSERT INTO `exam_paper_question` VALUES (56, 'c823454dcb14d842278d010d44db6854', 13);
INSERT INTO `exam_paper_question` VALUES (57, 'c823454dcb14d842278d010d44db6854', 15);
INSERT INTO `exam_paper_question` VALUES (58, 'c823454dcb14d842278d010d44db6854', 17);
INSERT INTO `exam_paper_question` VALUES (59, 'c823454dcb14d842278d010d44db6854', 19);
INSERT INTO `exam_paper_question` VALUES (60, 'c823454dcb14d842278d010d44db6854', 20);
INSERT INTO `exam_paper_question` VALUES (61, 'c823454dcb14d842278d010d44db6854', 23);
INSERT INTO `exam_paper_question` VALUES (62, 'c823454dcb14d842278d010d44db6854', 25);
INSERT INTO `exam_paper_question` VALUES (63, 'c823454dcb14d842278d010d44db6854', 26);
INSERT INTO `exam_paper_question` VALUES (64, 'c823454dcb14d842278d010d44db6854', 27);
INSERT INTO `exam_paper_question` VALUES (65, 'c823454dcb14d842278d010d44db6854', 28);
INSERT INTO `exam_paper_question` VALUES (66, 'c823454dcb14d842278d010d44db6854', 30);
INSERT INTO `exam_paper_question` VALUES (67, 'fb91684e0e5cf5476fea9d2ac922272c', 71);
INSERT INTO `exam_paper_question` VALUES (68, 'fb91684e0e5cf5476fea9d2ac922272c', 72);
INSERT INTO `exam_paper_question` VALUES (69, 'fb91684e0e5cf5476fea9d2ac922272c', 8);
INSERT INTO `exam_paper_question` VALUES (70, 'fb91684e0e5cf5476fea9d2ac922272c', 73);
INSERT INTO `exam_paper_question` VALUES (71, 'fb91684e0e5cf5476fea9d2ac922272c', 74);
INSERT INTO `exam_paper_question` VALUES (72, 'fb91684e0e5cf5476fea9d2ac922272c', 75);
INSERT INTO `exam_paper_question` VALUES (73, 'fb91684e0e5cf5476fea9d2ac922272c', 76);
INSERT INTO `exam_paper_question` VALUES (74, 'fb91684e0e5cf5476fea9d2ac922272c', 77);
INSERT INTO `exam_paper_question` VALUES (75, 'fb91684e0e5cf5476fea9d2ac922272c', 78);
INSERT INTO `exam_paper_question` VALUES (76, 'fb91684e0e5cf5476fea9d2ac922272c', 80);
INSERT INTO `exam_paper_question` VALUES (77, 'fb91684e0e5cf5476fea9d2ac922272c', 82);
INSERT INTO `exam_paper_question` VALUES (78, 'fb91684e0e5cf5476fea9d2ac922272c', 83);
INSERT INTO `exam_paper_question` VALUES (79, 'fb91684e0e5cf5476fea9d2ac922272c', 84);
INSERT INTO `exam_paper_question` VALUES (80, 'fb91684e0e5cf5476fea9d2ac922272c', 85);
INSERT INTO `exam_paper_question` VALUES (81, 'fb91684e0e5cf5476fea9d2ac922272c', 86);
INSERT INTO `exam_paper_question` VALUES (82, 'fb91684e0e5cf5476fea9d2ac922272c', 87);
INSERT INTO `exam_paper_question` VALUES (83, 'fb91684e0e5cf5476fea9d2ac922272c', 90);
INSERT INTO `exam_paper_question` VALUES (84, 'fb91684e0e5cf5476fea9d2ac922272c', 91);
INSERT INTO `exam_paper_question` VALUES (85, 'fb91684e0e5cf5476fea9d2ac922272c', 27);
INSERT INTO `exam_paper_question` VALUES (86, 'fb91684e0e5cf5476fea9d2ac922272c', 92);
INSERT INTO `exam_paper_question` VALUES (87, 'fb91684e0e5cf5476fea9d2ac922272c', 93);
INSERT INTO `exam_paper_question` VALUES (88, 'fb91684e0e5cf5476fea9d2ac922272c', 94);
INSERT INTO `exam_paper_question` VALUES (89, 'fb91684e0e5cf5476fea9d2ac922272c', 95);
INSERT INTO `exam_paper_question` VALUES (90, 'fb91684e0e5cf5476fea9d2ac922272c', 97);
INSERT INTO `exam_paper_question` VALUES (91, 'fb91684e0e5cf5476fea9d2ac922272c', 98);
INSERT INTO `exam_paper_question` VALUES (92, 'fb91684e0e5cf5476fea9d2ac922272c', 99);
INSERT INTO `exam_paper_question` VALUES (93, 'fb91684e0e5cf5476fea9d2ac922272c', 100);
INSERT INTO `exam_paper_question` VALUES (94, 'fb91684e0e5cf5476fea9d2ac922272c', 36);
INSERT INTO `exam_paper_question` VALUES (95, '44eb4c38abe4af91441912974b0cac92', 2);
INSERT INTO `exam_paper_question` VALUES (96, '44eb4c38abe4af91441912974b0cac92', 72);
INSERT INTO `exam_paper_question` VALUES (97, '44eb4c38abe4af91441912974b0cac92', 74);
INSERT INTO `exam_paper_question` VALUES (98, '44eb4c38abe4af91441912974b0cac92', 75);
INSERT INTO `exam_paper_question` VALUES (99, '44eb4c38abe4af91441912974b0cac92', 76);
INSERT INTO `exam_paper_question` VALUES (100, '44eb4c38abe4af91441912974b0cac92', 77);
INSERT INTO `exam_paper_question` VALUES (101, '44eb4c38abe4af91441912974b0cac92', 78);
INSERT INTO `exam_paper_question` VALUES (102, '44eb4c38abe4af91441912974b0cac92', 79);
INSERT INTO `exam_paper_question` VALUES (103, '44eb4c38abe4af91441912974b0cac92', 80);
INSERT INTO `exam_paper_question` VALUES (104, '44eb4c38abe4af91441912974b0cac92', 82);
INSERT INTO `exam_paper_question` VALUES (105, '44eb4c38abe4af91441912974b0cac92', 84);
INSERT INTO `exam_paper_question` VALUES (106, '44eb4c38abe4af91441912974b0cac92', 85);
INSERT INTO `exam_paper_question` VALUES (107, '44eb4c38abe4af91441912974b0cac92', 86);
INSERT INTO `exam_paper_question` VALUES (108, '44eb4c38abe4af91441912974b0cac92', 87);
INSERT INTO `exam_paper_question` VALUES (109, '44eb4c38abe4af91441912974b0cac92', 23);
INSERT INTO `exam_paper_question` VALUES (110, '44eb4c38abe4af91441912974b0cac92', 88);
INSERT INTO `exam_paper_question` VALUES (111, '44eb4c38abe4af91441912974b0cac92', 24);
INSERT INTO `exam_paper_question` VALUES (112, '44eb4c38abe4af91441912974b0cac92', 89);
INSERT INTO `exam_paper_question` VALUES (113, '44eb4c38abe4af91441912974b0cac92', 90);
INSERT INTO `exam_paper_question` VALUES (114, '44eb4c38abe4af91441912974b0cac92', 91);
INSERT INTO `exam_paper_question` VALUES (115, '44eb4c38abe4af91441912974b0cac92', 92);
INSERT INTO `exam_paper_question` VALUES (116, '44eb4c38abe4af91441912974b0cac92', 93);
INSERT INTO `exam_paper_question` VALUES (117, '44eb4c38abe4af91441912974b0cac92', 94);
INSERT INTO `exam_paper_question` VALUES (118, '44eb4c38abe4af91441912974b0cac92', 95);
INSERT INTO `exam_paper_question` VALUES (119, '44eb4c38abe4af91441912974b0cac92', 97);
INSERT INTO `exam_paper_question` VALUES (120, '44eb4c38abe4af91441912974b0cac92', 98);
INSERT INTO `exam_paper_question` VALUES (121, '44eb4c38abe4af91441912974b0cac92', 99);
INSERT INTO `exam_paper_question` VALUES (122, '44eb4c38abe4af91441912974b0cac92', 100);
INSERT INTO `exam_paper_question` VALUES (123, 'ae5e0afee5fc648c30e8785f4f1218de', 71);
INSERT INTO `exam_paper_question` VALUES (124, 'ae5e0afee5fc648c30e8785f4f1218de', 72);
INSERT INTO `exam_paper_question` VALUES (125, 'ae5e0afee5fc648c30e8785f4f1218de', 73);
INSERT INTO `exam_paper_question` VALUES (126, 'ae5e0afee5fc648c30e8785f4f1218de', 9);
INSERT INTO `exam_paper_question` VALUES (127, 'ae5e0afee5fc648c30e8785f4f1218de', 74);
INSERT INTO `exam_paper_question` VALUES (128, 'ae5e0afee5fc648c30e8785f4f1218de', 75);
INSERT INTO `exam_paper_question` VALUES (129, 'ae5e0afee5fc648c30e8785f4f1218de', 76);
INSERT INTO `exam_paper_question` VALUES (130, 'ae5e0afee5fc648c30e8785f4f1218de', 77);
INSERT INTO `exam_paper_question` VALUES (131, 'ae5e0afee5fc648c30e8785f4f1218de', 78);
INSERT INTO `exam_paper_question` VALUES (132, 'ae5e0afee5fc648c30e8785f4f1218de', 80);
INSERT INTO `exam_paper_question` VALUES (133, 'ae5e0afee5fc648c30e8785f4f1218de', 81);
INSERT INTO `exam_paper_question` VALUES (134, 'ae5e0afee5fc648c30e8785f4f1218de', 82);
INSERT INTO `exam_paper_question` VALUES (135, 'ae5e0afee5fc648c30e8785f4f1218de', 83);
INSERT INTO `exam_paper_question` VALUES (136, 'ae5e0afee5fc648c30e8785f4f1218de', 85);
INSERT INTO `exam_paper_question` VALUES (137, 'ae5e0afee5fc648c30e8785f4f1218de', 86);
INSERT INTO `exam_paper_question` VALUES (138, 'ae5e0afee5fc648c30e8785f4f1218de', 87);
INSERT INTO `exam_paper_question` VALUES (139, 'ae5e0afee5fc648c30e8785f4f1218de', 88);
INSERT INTO `exam_paper_question` VALUES (140, 'ae5e0afee5fc648c30e8785f4f1218de', 90);
INSERT INTO `exam_paper_question` VALUES (141, 'ae5e0afee5fc648c30e8785f4f1218de', 26);
INSERT INTO `exam_paper_question` VALUES (142, 'ae5e0afee5fc648c30e8785f4f1218de', 91);
INSERT INTO `exam_paper_question` VALUES (143, 'ae5e0afee5fc648c30e8785f4f1218de', 92);
INSERT INTO `exam_paper_question` VALUES (144, 'ae5e0afee5fc648c30e8785f4f1218de', 93);
INSERT INTO `exam_paper_question` VALUES (145, 'ae5e0afee5fc648c30e8785f4f1218de', 94);
INSERT INTO `exam_paper_question` VALUES (146, 'ae5e0afee5fc648c30e8785f4f1218de', 95);
INSERT INTO `exam_paper_question` VALUES (147, 'ae5e0afee5fc648c30e8785f4f1218de', 97);
INSERT INTO `exam_paper_question` VALUES (148, 'ae5e0afee5fc648c30e8785f4f1218de', 98);
INSERT INTO `exam_paper_question` VALUES (149, 'ae5e0afee5fc648c30e8785f4f1218de', 99);
INSERT INTO `exam_paper_question` VALUES (150, 'ae5e0afee5fc648c30e8785f4f1218de', 100);
INSERT INTO `exam_paper_question` VALUES (151, '8e819b7be9dd5442e9667eb892d931a8', 71);
INSERT INTO `exam_paper_question` VALUES (152, '8e819b7be9dd5442e9667eb892d931a8', 74);
INSERT INTO `exam_paper_question` VALUES (153, '8e819b7be9dd5442e9667eb892d931a8', 75);
INSERT INTO `exam_paper_question` VALUES (154, '8e819b7be9dd5442e9667eb892d931a8', 76);
INSERT INTO `exam_paper_question` VALUES (155, '8e819b7be9dd5442e9667eb892d931a8', 12);
INSERT INTO `exam_paper_question` VALUES (156, '8e819b7be9dd5442e9667eb892d931a8', 77);
INSERT INTO `exam_paper_question` VALUES (157, '8e819b7be9dd5442e9667eb892d931a8', 78);
INSERT INTO `exam_paper_question` VALUES (158, '8e819b7be9dd5442e9667eb892d931a8', 79);
INSERT INTO `exam_paper_question` VALUES (159, '8e819b7be9dd5442e9667eb892d931a8', 80);
INSERT INTO `exam_paper_question` VALUES (160, '8e819b7be9dd5442e9667eb892d931a8', 82);
INSERT INTO `exam_paper_question` VALUES (161, '8e819b7be9dd5442e9667eb892d931a8', 18);
INSERT INTO `exam_paper_question` VALUES (162, '8e819b7be9dd5442e9667eb892d931a8', 83);
INSERT INTO `exam_paper_question` VALUES (163, '8e819b7be9dd5442e9667eb892d931a8', 84);
INSERT INTO `exam_paper_question` VALUES (164, '8e819b7be9dd5442e9667eb892d931a8', 85);
INSERT INTO `exam_paper_question` VALUES (165, '8e819b7be9dd5442e9667eb892d931a8', 21);
INSERT INTO `exam_paper_question` VALUES (166, '8e819b7be9dd5442e9667eb892d931a8', 86);
INSERT INTO `exam_paper_question` VALUES (167, '8e819b7be9dd5442e9667eb892d931a8', 87);
INSERT INTO `exam_paper_question` VALUES (168, '8e819b7be9dd5442e9667eb892d931a8', 88);
INSERT INTO `exam_paper_question` VALUES (169, '8e819b7be9dd5442e9667eb892d931a8', 90);
INSERT INTO `exam_paper_question` VALUES (170, '8e819b7be9dd5442e9667eb892d931a8', 91);
INSERT INTO `exam_paper_question` VALUES (171, '8e819b7be9dd5442e9667eb892d931a8', 92);
INSERT INTO `exam_paper_question` VALUES (172, '8e819b7be9dd5442e9667eb892d931a8', 28);
INSERT INTO `exam_paper_question` VALUES (173, '8e819b7be9dd5442e9667eb892d931a8', 94);
INSERT INTO `exam_paper_question` VALUES (174, '8e819b7be9dd5442e9667eb892d931a8', 95);
INSERT INTO `exam_paper_question` VALUES (175, '8e819b7be9dd5442e9667eb892d931a8', 97);
INSERT INTO `exam_paper_question` VALUES (176, '8e819b7be9dd5442e9667eb892d931a8', 98);
INSERT INTO `exam_paper_question` VALUES (177, '8e819b7be9dd5442e9667eb892d931a8', 99);
INSERT INTO `exam_paper_question` VALUES (178, '8e819b7be9dd5442e9667eb892d931a8', 100);
INSERT INTO `exam_paper_question` VALUES (179, 'bb06d6e1bfd16b563b4453d651c83eff', 49);
INSERT INTO `exam_paper_question` VALUES (180, 'bb06d6e1bfd16b563b4453d651c83eff', 3);
INSERT INTO `exam_paper_question` VALUES (181, 'bb06d6e1bfd16b563b4453d651c83eff', 69);
INSERT INTO `exam_paper_question` VALUES (182, 'bb06d6e1bfd16b563b4453d651c83eff', 54);
INSERT INTO `exam_paper_question` VALUES (183, 'bb06d6e1bfd16b563b4453d651c83eff', 6);
INSERT INTO `exam_paper_question` VALUES (184, 'bb06d6e1bfd16b563b4453d651c83eff', 89);
INSERT INTO `exam_paper_question` VALUES (185, 'bb06d6e1bfd16b563b4453d651c83eff', 73);
INSERT INTO `exam_paper_question` VALUES (186, 'bb06d6e1bfd16b563b4453d651c83eff', 58);
INSERT INTO `exam_paper_question` VALUES (187, 'bb06d6e1bfd16b563b4453d651c83eff', 27);
INSERT INTO `exam_paper_question` VALUES (188, 'bb06d6e1bfd16b563b4453d651c83eff', 44);
INSERT INTO `exam_paper_question` VALUES (189, 'bb06d6e1bfd16b563b4453d651c83eff', 45);
INSERT INTO `exam_paper_question` VALUES (190, 'd9f43af80eb1b081b3c4cb2efeaf4fde', 2);
INSERT INTO `exam_paper_question` VALUES (191, 'd9f43af80eb1b081b3c4cb2efeaf4fde', 19);
INSERT INTO `exam_paper_question` VALUES (192, 'd9f43af80eb1b081b3c4cb2efeaf4fde', 3);
INSERT INTO `exam_paper_question` VALUES (193, 'd9f43af80eb1b081b3c4cb2efeaf4fde', 53);
INSERT INTO `exam_paper_question` VALUES (194, 'd9f43af80eb1b081b3c4cb2efeaf4fde', 69);
INSERT INTO `exam_paper_question` VALUES (195, 'd9f43af80eb1b081b3c4cb2efeaf4fde', 5);
INSERT INTO `exam_paper_question` VALUES (196, 'd9f43af80eb1b081b3c4cb2efeaf4fde', 6);
INSERT INTO `exam_paper_question` VALUES (197, 'd9f43af80eb1b081b3c4cb2efeaf4fde', 39);
INSERT INTO `exam_paper_question` VALUES (198, 'd9f43af80eb1b081b3c4cb2efeaf4fde', 25);
INSERT INTO `exam_paper_question` VALUES (199, 'd9f43af80eb1b081b3c4cb2efeaf4fde', 58);
INSERT INTO `exam_paper_question` VALUES (200, 'd9f43af80eb1b081b3c4cb2efeaf4fde', 30);

-- ----------------------------
-- Table structure for exam_paper_record
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_record`;
CREATE TABLE `exam_paper_record`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `paper_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '试卷id',
  `stu_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学生学号',
  `correct_num` int(10) NULL DEFAULT NULL COMMENT '正确数',
  `exam_score` float(10, 1) NULL DEFAULT NULL COMMENT '考试得分',
  `is_checked` int(2) NULL DEFAULT 0 COMMENT '0: 改卷中 -1: 未及格 -2 未参加考试， 1 及格',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除0未删除1以删除',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '考试记录 试卷记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_paper_record
-- ----------------------------
INSERT INTO `exam_paper_record` VALUES ('567da1997e65d6c26d483636a9850089', '8e819b7be9dd5442e9667eb892d931a8', '2131010618', 20, 57.0, 1, NULL, 0, NULL, NULL, '2023-01-19 15:39:03', '2023-01-21 20:42:37');
INSERT INTO `exam_paper_record` VALUES ('5bb07ae8f31e1154a7d59bc10326d31a', 'd9f43af80eb1b081b3c4cb2efeaf4fde', '2131010618', 7, 17.0, -1, NULL, 0, NULL, NULL, '2023-01-21 21:40:25', '2023-01-21 23:26:37');
INSERT INTO `exam_paper_record` VALUES ('96264f6231c6551be254bf447472d07c', 'e41beaf40708c8450abdce5fa2b051ea', '2131010618', 0, 0.0, -2, NULL, 0, NULL, NULL, '2023-01-29 11:03:57', NULL);

-- ----------------------------
-- Table structure for exam_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE `exam_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_type_id` int(11) NULL DEFAULT NULL COMMENT '题目类型id',
  `subject_id` int(11) NULL DEFAULT NULL COMMENT '课程科目id',
  `question_title` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '问题题目',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '题目内容',
  `answer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '答案',
  `difficulty` int(10) NULL DEFAULT NULL COMMENT '题目难度',
  `analyse` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '题目分析',
  `score` float(10, 2) NULL DEFAULT NULL COMMENT '题目分数',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除0未删除1以删除',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '题目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_question
-- ----------------------------
INSERT INTO `exam_question` VALUES (1, 1, 1, 'DNS 服务器和DHCP服务器的作用是（）', '将IP地址翻译为计算机名，为客户机分配IP地址∧将IP地址翻译为计算机名、解析计算机的MAC地址∧将计算机名翻译为IP地址、为客户机分配IP地址∧将计算机名翻译为IP地址、解析计算机的MAC地址', '将计算机名翻译为IP地址、为客户机分配IP地址', 2, 'test', 2.00, '', 0, '5201314', '5201314', '2023-01-07 20:49:24', '2023-01-08 13:16:11');
INSERT INTO `exam_question` VALUES (2, 1, 1, 'HTTP协议通常使用什么协议进行传输（）', 'ARP∧DHCP∧UDP∧TCP', 'TCP', 2, '嗨害嗨', 2.00, '', 0, '5201314', NULL, '2023-01-07 21:03:40', NULL);
INSERT INTO `exam_question` VALUES (3, 2, 1, '计算机网络按照工作范围可以分为哪几种', '广域网∧城域网∧局域网∧单域网', '广域网∧城域网∧局域网', 2, '网络工作范围', 4.00, '', 0, '5201314', '5201314', '2023-01-07 21:16:01', '2023-01-08 13:16:29');
INSERT INTO `exam_question` VALUES (4, 3, 1, '复盖一个国家，地区或几个洲的计算机网络称为()，在同一建筑或复盖几公里内范围的网络称为()，而介于两者之间的是()', '', ' 广域网 ∧ 局域网∧城域网', 2, '网络的覆盖范围', 3.00, '', 0, '5201314', '5201314', '2023-01-07 21:29:57', '2023-01-08 13:16:50');
INSERT INTO `exam_question` VALUES (5, 4, 1, '与有线网相比,无线网的数据传输率一般相对较慢', '', '1', 2, '看什么看', 2.00, '', 0, '5201314', NULL, '2023-01-07 21:34:48', NULL);
INSERT INTO `exam_question` VALUES (6, 5, 1, '计算机网络向用户可以提供哪些服务?', '', '计算机网络向用户提供的最重要的功能有两个，连通性和共享。', 2, '计算机网络向用户提供的最重要的功能有两个，连通性和共享。', 4.00, '', 0, '5201314', NULL, '2023-01-07 21:37:35', NULL);
INSERT INTO `exam_question` VALUES (7, 3, 1, '从计算机网络系统组成的角度看，计算机网络可以分为()和()', '', '通信子网∧资源子网', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 13:18:42', NULL);
INSERT INTO `exam_question` VALUES (8, 1, 1, 'HTTP协议通常使用什么协议进行传输（）', 'ARP∧DHCP∧UDP∧TCP', 'TCP', 2, 'HTTP协议', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:30:10', NULL);
INSERT INTO `exam_question` VALUES (9, 1, 1, '查看DNS缓存记录的命令（）', 'ipconfig/displaydns∧nslookup∧ipconfig/release∧ipconfig/flushdns', 'ipconfig/displaydns', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:31:05', NULL);
INSERT INTO `exam_question` VALUES (10, 1, 1, 'DHCP(        )报文的目的IP地址为255.255.255.255', 'DhcpDisover∧DhcpOffer∧DhcpAck∧DhcpNack', 'DhcpDisover', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:31:51', NULL);
INSERT INTO `exam_question` VALUES (11, 1, 1, '下列地址中，（  ）不是DHCP服务器分配的IP地址', '196.254.109.100∧169.254.12.42∧69.254.48.45∧96.254.54.15', '169.254.12.42', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:32:35', NULL);
INSERT INTO `exam_question` VALUES (12, 1, 1, 'DHCP通常可以为客户端自动配置哪些网络参数（）', 'IP，掩码，网关，DNS∧IP，掩码，域名，SMTP∧网关，掩码，浏览器，FTP∧IP，网关，DNS，服务器', 'IP，掩码，网关，DNS', 2, 'DHCP配置参数', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:34:15', NULL);
INSERT INTO `exam_question` VALUES (13, 1, 1, 'DNS服务器在名称解析过程中正确的查询顺序为（）', '本地缓存记录→区域记录→转发域名服务器→根域名服务器∧区域记录→本地缓存记录→转发域名服务器→根域名服务器∧本地缓存记录→区域记录→根域名服务器→转发域名服务器∧区域记录→本地缓存记录→根域名服务器→转发域名服务器', '本地缓存记录→区域记录→转发域名服务器→根域名服务器', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:34:57', NULL);
INSERT INTO `exam_question` VALUES (14, 1, 1, '在TCP/IP协议中，序号小于（  ）的端口称为熟知端口(well-known port)。', '1024∧64∧256∧128', '1024', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:35:57', NULL);
INSERT INTO `exam_question` VALUES (15, 1, 1, '在Internet上用TCP/IP播放视频，想用传输层的最快协议，以减少时延，要使用（ ）', 'UDP协议的低开销特性∧UDP协议的高开销特性∧TCP协议的低开销特性∧TCP协议的高开销特性', 'UDP协议的低开销特性', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:36:42', NULL);
INSERT INTO `exam_question` VALUES (16, 1, 1, '在TCP协议中采用（ ）来区分不同的应用进程', '端口号∧IP地址∧协议类型∧MAC地址', '端口号', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:37:12', NULL);
INSERT INTO `exam_question` VALUES (17, 1, 1, '可靠的传输协议中的“可靠”指的是（ ）', '使用面向连接的会话∧使用“尽力而为”的传输∧使用滑动窗口来维持可靠性∧使用确认重传机制来确保传输的数据不丢失', '使用确认重传机制来确保传输的数据不丢失', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:37:56', NULL);
INSERT INTO `exam_question` VALUES (18, 1, 1, '假设拥塞窗口为50KB，接收窗口为80KB，TCP能够发送的最大字节数为（ ）', '50KB∧80KB∧130KB∧30KB', '50KB', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:38:44', NULL);
INSERT INTO `exam_question` VALUES (19, 1, 1, '主机A向主机B发送一个（SYN=1，seq=2000）的TCP报文，期望与主机B建立连接，若主机B接受连接请求，则主机B发送的正确有TCP报文可能是（ ）', '（SYN=0,ACK=0,seq=2001,ack=2001）∧（SYN=1,ACK=1,seq=2000,ack=2000）∧（SYN=1,ACK=1,seq=2001,ack=2001）∧（SYN=0,ACK=1,seq=2000,ack=2000）', '（SYN=1,ACK=1,seq=2001,ack=2001）', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:39:25', NULL);
INSERT INTO `exam_question` VALUES (20, 1, 1, '主机A向主机B连续发送了两个TCP报文段，其序号分别为70和100。试问： （1）第一个报文段携带了（）个字节的数据？', ' 70∧30∧100∧170', '30', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:40:08', NULL);
INSERT INTO `exam_question` VALUES (21, 1, 1, 'PCM脉码调制的过程（ ）', '采样、量化、编码∧量化、编码、采样∧编码、量化、采样∧采样、编码、量化', '采样、量化、编码', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:41:25', NULL);
INSERT INTO `exam_question` VALUES (22, 1, 1, '若某采用4相位调制的通信链路的数据传输速率为2400bps，则该链路的波特率为（）', '600Baud∧1200Baud∧4800Baud∧9600Baud', '1200Baud', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:41:54', NULL);
INSERT INTO `exam_question` VALUES (23, 1, 1, '以下关于数据传输速率的描述中，错误的是( )', '数据传输速率表示每秒钟传输构成数据代码的二进制比特数∧对于二进制数据，数据传输速率为S=1/T (bps)∧常用的数据传输速率单位有: 1Mbps=1.024×106bps∧数据传输速率是描述数据传输系统性能的重要技术指标之一', '常用的数据传输速率单位有: 1Mbps=1.024×106bps', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:42:29', NULL);
INSERT INTO `exam_question` VALUES (24, 1, 1, '以下关于时分多路复用概念的描述中，错误的是.(  ).', '时分多路复用将线路使用的时间分成多个时间片∧时分多路复用分为同步时分多路复用与统计时分多路复用∧时分多路复用使用“帧”与数据链路层“帧”的概念、作用是不同的∧统计时分多路复用将时间片预先分配给各个信道', '统计时分多路复用将时间片预先分配给各个信道', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:42:58', NULL);
INSERT INTO `exam_question` VALUES (25, 1, 1, '1000BASE-T标准支持的传输介质是（）', '双绞线∧同轴电缆∧光纤∧无线电', '双绞线', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:43:45', NULL);
INSERT INTO `exam_question` VALUES (26, 1, 1, '一个以太网交换机，读取整个数据帧，对数据帧进行差错校验后再转发出去，这种交换方式称为 （）', '直通交换∧无碎片交换∧无差错交换∧存储转发交换', '存储转发交换', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:47:29', NULL);
INSERT INTO `exam_question` VALUES (27, 1, 1, '关于VLAN，下面的描述中正确的是（）', '一个新的交换机没有配置VLAN∧通过配置VLAN减少了冲突域的数量∧一个VLAN不能跨越多个交换机∧各个VLAN属于不同的广播域', '各个VLAN属于不同的广播域', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:48:01', NULL);
INSERT INTO `exam_question` VALUES (28, 1, 1, '以太网协议中使用物理地址作用是什么？', '.用于不同子网中的主机进行通信∧作为第二层设备的唯一标识∧用于区别第二层第三层的协议数据单元∧保存主机可检测未知的远程设备', '作为第二层设备的唯一标识', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:48:38', NULL);
INSERT INTO `exam_question` VALUES (29, 1, 1, '以太网采用的CSMA/CD协议，当冲突发生时要通过二进制指数后退算法计算后退延时， 关于这个算法，以下论述中错误的是 （）', '冲突次数越多，后退的时间越短∧平均后退次数的多少与负载大小有关∧后退时延的平均值与负载大小有关∧重发次数达到一定极限后放弃发送', '冲突次数越多，后退的时间越短', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:49:20', NULL);
INSERT INTO `exam_question` VALUES (30, 1, 1, '以下关于交换机获取与其端口连接设备的MAC地址的叙述中，正确的是（）', '交换机从路由表中提取设备的MAC地址∧交换机检查端口流入分组的源地址∧交换机之间互相交换地址表∧网络管理员手工输入设备的MAC地址', '交换机检查端口流入分组的源地址', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:49:45', NULL);
INSERT INTO `exam_question` VALUES (31, 1, 1, '如果G (x）为11010010，以下4个CRC校验比特序列中只有哪个可能是正确的 ？', '1101011001∧101011011∧11011011∧1011001', '101011011', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:50:16', NULL);
INSERT INTO `exam_question` VALUES (32, 1, 1, '以下关于Ethernet物理地址的描述中，错误的是', 'Ethernet物理地址又叫做MAC地址∧48位的Ethernet物理地址允许分配的地址数达到247个∧网卡的物理地址写入主机的EPROM中∧每一块网卡的物理地址在全世界是唯一的', '网卡的物理地址写入主机的EPROM中', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:50:45', NULL);
INSERT INTO `exam_question` VALUES (33, 1, 1, '下列帧类型中，不属于HDLC帧类型的是（）', '信息帧∧确认帧∧监控帧∧无编号帧', '确认帧', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:51:12', NULL);
INSERT INTO `exam_question` VALUES (34, 1, 1, '通过交换机连接的一组站点，关于它们的广播域和冲突域说法正确的是（）', '组成一个冲突域，但不是一个广播域∧组成一个广播域，但不是一个冲突域∧组成一个冲突域，也是一个广播域∧既不一个冲突域，也不是一个广播域', '组成一个广播域，但不是一个冲突域', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:51:39', NULL);
INSERT INTO `exam_question` VALUES (35, 1, 1, '数据链路层的数据单位是（）', '帧∧字节∧比特∧分组', '帧', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:52:08', NULL);
INSERT INTO `exam_question` VALUES (36, 1, 1, 'LAN参考模型可分为物理层、（ ）', 'MAC，LLC等三层∧LLC，MHS等三层∧MAC，FTAM等三层∧LLC，VT等三层', 'MAC，LLC等三层', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:52:50', NULL);
INSERT INTO `exam_question` VALUES (37, 4, 1, 'OSI参考模型中,不同节点的同等层具有不同的功能', '', '0', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:53:32', NULL);
INSERT INTO `exam_question` VALUES (38, 4, 1, '普通电脑不能作为服务器', '', '0', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:54:05', NULL);
INSERT INTO `exam_question` VALUES (39, 4, 1, '没有网线的电脑不能连入互联网', '', '0', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:54:22', NULL);
INSERT INTO `exam_question` VALUES (40, 4, 1, '网卡必须安装驱动程序', '', '1', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:54:38', NULL);
INSERT INTO `exam_question` VALUES (41, 4, 1, 'UTP为屏蔽双绞线', '', '0', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:54:51', NULL);
INSERT INTO `exam_question` VALUES (42, 4, 1, '网络接口卡又称为网卡,它是构成网络的基本部件', '', '1', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:55:11', NULL);
INSERT INTO `exam_question` VALUES (43, 4, 1, '无线AP可以成倍地扩展网络覆盖范围', '', '1', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:55:25', NULL);
INSERT INTO `exam_question` VALUES (44, 4, 1, 'SMTP是一组用于由源地址到目的地址传送邮件的协议', '', '1', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:55:38', NULL);
INSERT INTO `exam_question` VALUES (45, 4, 1, '任务管理器可以关闭所有的进程', '', '0', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:55:54', NULL);
INSERT INTO `exam_question` VALUES (46, 4, 1, '利用BT下载时,用户越多,下载速度越快', '', '1', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:56:07', NULL);
INSERT INTO `exam_question` VALUES (47, 4, 1, 'INTERNET上向朋友发送电子邮件,必须知道对方的真实姓名和家庭住址', '', '0', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:56:24', NULL);
INSERT INTO `exam_question` VALUES (48, 3, 1, '收发电子邮件，属于ISO/OSI RM中 ()层的功能。', '', '应用', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 13:57:30', NULL);
INSERT INTO `exam_question` VALUES (49, 3, 1, '在TCP/IP层次模型中与OSI参考模型第四层相对应的主要协议有()和(),其中后者提供无连接的不可靠传输服', '', 'TCP（传输控制协议）∧ UDP（用户数据报协议） ', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 13:58:10', NULL);
INSERT INTO `exam_question` VALUES (50, 3, 1, '计算机网络中常用的三种有线媒体是 (),()和 ()', '', '同轴电缆∧双绞线∧光纤', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 13:59:00', NULL);
INSERT INTO `exam_question` VALUES (51, 3, 1, '国内最早的四大网络包括原邮电部的ChinaNet. 原电子部的ChinaGBN. 教育部的()和中科院的CSTnet', '', 'CERnet (或中国教育科研网)', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 13:59:29', NULL);
INSERT INTO `exam_question` VALUES (52, 3, 1, 'Outlook等常用电子邮件软件接收邮件使用的协议是(),发送邮件时使用的协议是()', '', 'POP3∧SMTP ', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 14:00:02', NULL);
INSERT INTO `exam_question` VALUES (53, 3, 1, '通信系统中，称调制前的电信号为()信号，调制后的信号为调制信号', '', '基带', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 14:00:28', NULL);
INSERT INTO `exam_question` VALUES (54, 3, 1, '按照IPV4标准,IP地址205.3.127.13属于()类地址', '', 'C', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 14:00:46', NULL);
INSERT INTO `exam_question` VALUES (55, 3, 1, '计算机网络采用()技术，而传统电话网络则采用()技术', '', '分组交换∧电路交换', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 14:01:23', NULL);
INSERT INTO `exam_question` VALUES (56, 3, 1, '计算机内传输的信号是()，而公用电话系统的传输系统只能传输()', '', '数字信号∧模拟信号', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 14:01:48', NULL);
INSERT INTO `exam_question` VALUES (57, 3, 1, '通信系统中，称调制前的电信号为()，调制后的信号叫()。', '', '基带信号∧调制信号', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 14:02:16', NULL);
INSERT INTO `exam_question` VALUES (58, 3, 1, 'IP地址分()和()两个部分', '', '网络号∧主机号', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 14:03:09', NULL);
INSERT INTO `exam_question` VALUES (59, 3, 1, ' IP地址协议作网间网中()层协议，提供无连接的数据报传输机制，IP数据报也分为()和()两个部分', '', '网络报头∧数据区', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 14:04:52', NULL);
INSERT INTO `exam_question` VALUES (60, 3, 1, '()是一个简单的远程终端协议。', '', 'TELNET', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 14:05:08', NULL);
INSERT INTO `exam_question` VALUES (61, 3, 1, '在同一个系统内，相邻层之间交换信息的连接点称之为()，而低层模块向高层提供功能性的支持称之为()。', '', '接口∧服务', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 14:05:46', NULL);
INSERT INTO `exam_question` VALUES (62, 3, 1, 'Internet广泛使用的电子邮件传送协议是()', '', 'SMTP', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-08 14:06:03', NULL);
INSERT INTO `exam_question` VALUES (63, 3, 1, '按交换方式来分类，计算机网络可以分为电路交换网，  报文交换网  和()三种', '', '分组交换网', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 14:06:23', NULL);
INSERT INTO `exam_question` VALUES (64, 3, 1, 'Intranet分层结构包括网络、(),应用三个层次。', '', '服务', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 14:06:40', NULL);
INSERT INTO `exam_question` VALUES (65, 3, 1, 'WWW上的每一个网页都有一个独立的地址，这些地址称为  ()', '', '统一资源定位器/URL ', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 14:06:59', NULL);
INSERT INTO `exam_question` VALUES (66, 3, 1, '分组交换网中，附加信息用来在网络中进行路由选择、() 和流量控制', '', '差错纠正  ', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 14:07:18', NULL);
INSERT INTO `exam_question` VALUES (67, 3, 1, '根据IEEE802模型的标准将数据链路层划分为LLC子层和 ()子层。', '', ' MAC ', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 14:07:34', NULL);
INSERT INTO `exam_question` VALUES (68, 3, 1, '据交换的路由信息的不同，路由算法可以分为两大类：  ()  和链路状态算法', '', '距离向量算法', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-08 14:07:55', NULL);
INSERT INTO `exam_question` VALUES (69, 3, 1, '假定某信道受奈氏准则限制的最高码元速率为2000码元/秒。如果采用振幅调制，把码元的振幅划分为16个不同等级来传送，那么可以获得的数据率为 () b/s。', '', '80000 ', 2, '', 4.00, '', 0, '5201314', NULL, '2023-01-08 14:08:14', NULL);
INSERT INTO `exam_question` VALUES (70, 3, 1, '交换型以太网系统中的 ()  ，以其为核心联接站点或者网段，端口之间帧的输入和输出已不再受到CSMA/CD媒体访问控制协议的约束。', '', '以太网交换器 ', 2, '', 4.00, '', 0, '5201314', NULL, '2023-01-08 14:08:31', NULL);
INSERT INTO `exam_question` VALUES (71, 2, 3, '关于多线程并行处理定时任务的情况，下列哪些说法符合', '推荐使用Timer方式处理。∧推荐使用ScheduledExecutorService方式处理∧Timer运行多个TimeTask时，只要其中之一没有捕获抛出的异常，其它任务便会自动终止运行∧ScheduledExecutorService并发运行多个定时任务时，其中某线程抛出异常，不会影响到其它线程的继续运行', '推荐使用ScheduledExecutorService方式处理∧Timer运行多个TimeTask时，只要其中之一没有捕获抛出的异常，其它任务便会自动终止运行∧ScheduledExecutorService并发运行多个定时任务时，其中某线程抛出异常，不会影响到其它线程的继续运行', 2, '《阿里巴巴Java开发手册》', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:22:39', NULL);
INSERT INTO `exam_question` VALUES (72, 2, 3, '关于数据库中表相关的命名，下列哪些说法符合', '表名、字段名禁止出现数字开头，禁止两个下划线中间只出现数字∧表名不使用复数名词∧表必备三字段命名：id, gmt_create, gmt_modify∧表必备三字段命名：id, gmt_create, gmt_modified', '表名、字段名禁止出现数字开头，禁止两个下划线中间只出现数字∧表名不使用复数名词∧表必备三字段命名：id, gmt_create, gmt_modified', 2, '阿里巴巴Java开发手册', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:30:15', NULL);
INSERT INTO `exam_question` VALUES (73, 1, 3, 'KV结构的集合，在处理null值的存储上有细微的区别，下列哪些说法是正确的', 'TreeMap的key不可以为null∧TreeMap的key可以为null∧ConcurrentHashMap的key可以为null∧ConcurrentHashMap的value可以为null', 'TreeMap的key不可以为null', 2, 'HashMap的key/value均可以为null，但是TreeMap的key不能为空，value可以为空', 2.00, '', 0, '5201314', NULL, '2023-01-17 17:37:49', NULL);
INSERT INTO `exam_question` VALUES (74, 2, 3, '关于二方库依赖的解析命令，下列哪些说法是正确的', 'mvn dependency:resolve 打印出已仲裁依赖的列表∧mvn dependency:tree 打印工程整个的依赖树结构∧mvn dependency:tree -Dverbose -Dincludes=commons-lang 打印出与commons-lang相关的详细依赖∧mvn clean install 打印工程整个的依赖树结构，并部署到本地仓库中', 'mvn dependency:resolve 打印出已仲裁依赖的列表∧mvn dependency:tree 打印工程整个的依赖树结构∧mvn dependency:tree -Dverbose -Dincludes=commons-lang 打印出与commons-lang相关的详细依赖', 2, '阿里巴巴Java开发手册', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:39:08', NULL);
INSERT INTO `exam_question` VALUES (75, 2, 3, '关于变量和常量定义，下列哪些符合', 'Long a=2L；//大写的L∧Long a=2l; //小写的l∧常量只定义一次，不再赋值，所以不需要命名规范∧不要使用一个常量类维护所有常量，应该按常量功能进行归类，分开维护', 'Long a=2L；//大写的L∧不要使用一个常量类维护所有常量，应该按常量功能进行归类，分开维护', 2, '阿里巴巴Java开发手册', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:41:19', NULL);
INSERT INTO `exam_question` VALUES (76, 2, 3, '关于线程安全，下列哪些说法是正确的', 'SimpleDateFormat 是线程不安全的类∧SimpleDateFormat 是线程安全的类∧一般不要定义SimpleDateFormat的static变量，如果定义为static，必须保证线程安全∧推荐使用Apache封装好的DateUtils和DateFormatUtils工具类，来处理时间日期转换问题', 'SimpleDateFormat 是线程不安全的类∧一般不要定义SimpleDateFormat的static变量，如果定义为static，必须保证线程安全∧推荐使用Apache封装好的DateUtils和DateFormatUtils工具类，来处理时间日期转换问题', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:42:29', NULL);
INSERT INTO `exam_question` VALUES (77, 2, 3, '以下关于格式规约的说法，正确的有哪些', '代码块缩进4个空格，如果使用tab缩进，请设置成1个tab为4个空格∧代码块缩进5个空格，如果使用tab缩进，请设置成1个tab为5个空格∧为了保持代码美观，《手册》强烈推荐增加若干空格，使某一行的变量与相邻对应位置的变量对齐∧方法体内的执行语句组、变量的定义语句组、不同的业务逻辑之间或者不同的语义之间推荐插入一个空行；相同业务逻辑和语义之间不需要插入空行', '代码块缩进4个空格，如果使用tab缩进，请设置成1个tab为4个空格∧方法体内的执行语句组、变量的定义语句组、不同的业务逻辑之间或者不同的语义之间推荐插入一个空行；相同业务逻辑和语义之间不需要插入空行', 2, '', 3.00, '', 0, '5201314', '5201314', '2023-01-17 17:43:30', '2023-01-17 17:44:12');
INSERT INTO `exam_question` VALUES (78, 2, 3, '数组使用Arrays.asList转化为集合，下列说法哪些正确的', '数组元素的修改，会影响到转化过来的集合∧数组元素的修改，不会影响到转化过来的集合∧对于转换过来的集合，它的 add/remove/clear 方法会抛出: UnsupportedOperationException∧Arrays.asList 体现的是适配器模式，只是转换接口，后台的数据仍是数组', '数组元素的修改，会影响到转化过来的集合∧对于转换过来的集合，它的 add/remove/clear 方法会抛出: UnsupportedOperationException∧Arrays.asList 体现的是适配器模式，只是转换接口，后台的数据仍是数组', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:45:18', NULL);
INSERT INTO `exam_question` VALUES (79, 2, 3, '关于异常的处理方式，下列哪些说法是正确的', '为防止obj对象本身空指针异常，书写代码时应该注意加异常捕获处理，例如：try { obj.method() } catch(NullPointerException e){……} ∧方法签名中，抛给调用者的关键字为throws∧方法内部，抛出异常实例对象为throws∧自定义异常要做到“认知对等”，即：抛出者和接收者要保持对自定义异常的认知统一，接收方需要知道这种异常的含义和对应的处理方案', '方法签名中，抛给调用者的关键字为throws∧自定义异常要做到“认知对等”，即：抛出者和接收者要保持对自定义异常的认知统一，接收方需要知道这种异常的含义和对应的处理方案', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:46:11', NULL);
INSERT INTO `exam_question` VALUES (80, 2, 2, 'Hash，HashMap, ConcurrentHashMap都是Map的实现类，它们在处理null值的存储上有细微的区别，下列哪些说法是正确的', 'Hashtable的KV都不可以为null∧HashMap的KV都可以为null∧HashMap的K不可以为null，V可以为null∧ConcurrentHashMap的KV都不可以为null', 'Hashtable的KV都不可以为null∧HashMap的KV都可以为null∧ConcurrentHashMap的KV都不可以为null', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:47:05', NULL);
INSERT INTO `exam_question` VALUES (81, 1, 3, '关于测试代码的覆盖率，下列哪些说法是正确的', '路径覆盖是最强覆盖，符合路径覆盖且测试全部通过，程序绝对没有问题∧语句覆盖度是最弱的覆盖度量方式∧分支覆盖与条件覆盖其实是一回事∧判定条件覆盖与路径覆盖其实是一回事', '语句覆盖度是最弱的覆盖度量方式', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-17 17:47:47', NULL);
INSERT INTO `exam_question` VALUES (82, 2, 3, '关于checked/unchecked exception，下列哪些说法是正确的', '继承java.lang.Error的类属于checked exception∧checked异常继承java.lang.Exception类∧unchecked异常继承java.lang.RuntimeException类∧NullPointerException , IllegalArgumentException属于unchecked exception', 'checked异常继承java.lang.Exception类∧unchecked异常继承java.lang.RuntimeException类∧NullPointerException , IllegalArgumentException属于unchecked exception', 2, '', 3.00, '', 0, '5201314', '5201314', '2023-01-17 17:48:35', '2023-01-17 17:51:41');
INSERT INTO `exam_question` VALUES (83, 2, 3, '以下关于命名规约内容说明，正确的是', '【强制】包名统一使用小写，点分隔符之间有且仅有一个自然语义的英语单词，并且使用复数形式，例如：应用工具类包名为com.alibaba.mpp.utils∧【强制】类名使用UpperCamelCase，必须遵从驼峰形式，但以下情形例外：（领域模型的相关命名）DO / DTO / VO / DAO等∧【强制】抽象类命名使用Abstract或Base开头；异常类命名使用Exception结尾；测试类命名以它要测试的类的名称开始，以Test结尾∧【强制】枚举类名建议带上Enum后缀，枚举成员名称需要全大写，单词间用下划线隔开∧如果使用到了设计模式，建议在类名中体现出具体模式。例如代理模式的类命名：LoginProxy；观察者模式命名：ResourceObserver', '【强制】类名使用UpperCamelCase，必须遵从驼峰形式，但以下情形例外：（领域模型的相关命名）DO / DTO / VO / DAO等∧【强制】抽象类命名使用Abstract或Base开头；异常类命名使用Exception结尾；测试类命名以它要测试的类的名称开始，以Test结尾∧【强制】枚举类名建议带上Enum后缀，枚举成员名称需要全大写，单词间用下划线隔开∧如果使用到了设计模式，建议在类名中体现出具体模式。例如代理模式的类命名：LoginProxy；观察者模式命名：ResourceObserver', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:50:12', NULL);
INSERT INTO `exam_question` VALUES (84, 2, 3, '关于MySQL性能优化的描述，下列哪些说法是正确的', '主键查询优先于二级索引查询∧表连接有一定的代价，故表连接数量越少越好∧一般情况下，二级索引扫描优先于全表扫描∧.可以使用通过索引避免排序代价', '主键查询优先于二级索引查询∧表连接有一定的代价，故表连接数量越少越好∧一般情况下，二级索引扫描优先于全表扫描∧.可以使用通过索引避免排序代价', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:51:09', NULL);
INSERT INTO `exam_question` VALUES (85, 2, 3, '关于生产环境的日志文件，下列哪些说法符合', '异常信息应该包括两类信息：案发现场信息和异常堆栈信息∧日志文件推荐至少保存15天，因为有些异常具备以“周”为频次发生的特点∧避免重复打印日志，浪费磁盘空间，务必在log4j.xml中设置additivity=false∧错误日志和业务日志尽量分开存放', '异常信息应该包括两类信息：案发现场信息和异常堆栈信息∧日志文件推荐至少保存15天，因为有些异常具备以“周”为频次发生的特点∧避免重复打印日志，浪费磁盘空间，务必在log4j.xml中设置additivity=false∧错误日志和业务日志尽量分开存放', 3, '阿里巴巴Java开发手册', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:53:43', NULL);
INSERT INTO `exam_question` VALUES (86, 2, 3, '关于索引的使用，下列哪些说法是正确的', '查询语句 WHERE a+1 = 5 可以利用a索引∧查询语句WHERE date_format(gmt_create, ‘%Y-%m-%d’) = \'2016-11-11’无法利用gmt_create索引∧当 c 列类型为 char 时，查询语句 WHERE c = 5 无法利用c索引∧索引字段使用时不能进行函数运算', '查询语句WHERE date_format(gmt_create, ‘%Y-%m-%d’) = \'2016-11-11’无法利用gmt_create索引∧当 c 列类型为 char 时，查询语句 WHERE c = 5 无法利用c索引∧索引字段使用时不能进行函数运算', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:55:11', NULL);
INSERT INTO `exam_question` VALUES (87, 2, 3, '关于索引的设计，下列哪些说法符合《阿里巴巴Java开发手册》', '对varchar类型的字段建立索引，必须指定索引长度∧对varchar类型的字段建立索引，不需要指定索引长度，这样索引区分度最好∧业务上具有唯一特性的字段（含组合字段），必须指定唯一索引∧建复合索引时，一般选择区分度高的字段放在最左列', '对varchar类型的字段建立索引，必须指定索引长度∧业务上具有唯一特性的字段（含组合字段），必须指定唯一索引∧建复合索引时，一般选择区分度高的字段放在最左列', 2, '阿里巴巴Java开发手册》', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:56:04', NULL);
INSERT INTO `exam_question` VALUES (88, 2, 3, '关于Java的接口描述，下列哪些说法符合《阿里巴巴Java开发手册》', '在接口类中的方法和属性使用public修饰符∧对于Service类，内部的实现类加Impl的后缀与接口区别。例如：ProductServiceImpl实现ProductService接口∧对于Service类，基于SOA的理念，是以接口方式暴露服务∧尽量不在接口里定义变量，如果一定要定义变量，肯定是与接口方法相关，而且是整个应用的基础常量', '对于Service类，内部的实现类加Impl的后缀与接口区别。例如：ProductServiceImpl实现ProductService接口∧对于Service类，基于SOA的理念，是以接口方式暴露服务∧尽量不在接口里定义变量，如果一定要定义变量，肯定是与接口方法相关，而且是整个应用的基础常量', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:56:46', NULL);
INSERT INTO `exam_question` VALUES (89, 1, 3, '关于类的序列化，下列说法哪些是正确的', '类的序列化与serialVersionUID毫无关系∧如果完全不兼容升级，不需要修改serialVersionUID值∧POJO类的serialVersionUID不一致会编译出错∧POJO类的serialVersionUID不一致会抛出序列化运行时异常', 'POJO类的serialVersionUID不一致会抛出序列化运行时异常', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-17 17:57:31', NULL);
INSERT INTO `exam_question` VALUES (90, 2, 3, '关于接口使用抛异常还是返回错误码，下列哪些说法符合《阿里巴巴Java开发手册》', '向公司外部提供的http/api接口，推荐使用“错误码”方式返回异常或者错误信息∧对于应用内部的方法调用，推荐使用“抛出异常”的方式处理异常或者错误信息∧跨应用的RPC调用，推荐使用将“错误码”和“错误简短信息”封装成Result的方式进行返回∧对外提供的接口，一定要保证逻辑健壮性：尽量避免空指针等技术类异常；对于业务类异常要做好错误码或者异常信息的封装', '向公司外部提供的http/api接口，推荐使用“错误码”方式返回异常或者错误信息∧对于应用内部的方法调用，推荐使用“抛出异常”的方式处理异常或者错误信息∧跨应用的RPC调用，推荐使用将“错误码”和“错误简短信息”封装成Result的方式进行返回∧对外提供的接口，一定要保证逻辑健壮性：尽量避免空指针等技术类异常；对于业务类异常要做好错误码或者异常信息的封装', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:58:20', NULL);
INSERT INTO `exam_question` VALUES (91, 2, 3, '根据《阿里巴巴Java开发手册》，以下功能必须进行水平权限控制校验的有', '订单详情页面∧类目管理后台∧店铺装修后台∧订单付款页面', '订单详情页面∧类目管理后台∧店铺装修后台∧订单付款页面', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 17:59:11', NULL);
INSERT INTO `exam_question` VALUES (92, 2, 3, '关于分页查询，下列哪些说法符合《阿里巴巴Java开发手册》', '分页查询，当统计的count为0时，应该直接返回，不要再执行分页查询语句∧iBATIS自带的queryForList(String statementName,int start,int size)分页接口有性能隐患，不允许使用∧定义明确的sql查询语句，通过传入参数start和size来实现分页逻辑∧可使用存储过程写分页逻辑，提高效率', '分页查询，当统计的count为0时，应该直接返回，不要再执行分页查询语句∧iBATIS自带的queryForList(String statementName,int start,int size)分页接口有性能隐患，不允许使用∧定义明确的sql查询语句，通过传入参数start和size来实现分页逻辑', 3, '【强制】有 try 块放到了事务代码中，catch 异常后，如果需要回滚事务，一定要注意手动回滚事务。', 3.00, '', 0, '5201314', NULL, '2023-01-17 18:00:22', NULL);
INSERT INTO `exam_question` VALUES (93, 2, 3, '关于Java代码的设计和开发注意事项，下列哪些说法符合《阿里巴巴Java开发手册》', '所有的覆写方法，必须是强制加 @Override∧setter方法中，参数名称与类成员变量名称一致，this.成员名=参数名∧在getter方法中，尽量不要增加逻辑判断，因为添加了逻辑判断后，会增加排查问题难度∧避免用BeanUtil进行属性的copy。', '所有的覆写方法，必须是强制加 @Override∧setter方法中，参数名称与类成员变量名称一致，this.成员名=参数名∧在getter方法中，尽量不要增加逻辑判断，因为添加了逻辑判断后，会增加排查问题难度', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 18:01:08', NULL);
INSERT INTO `exam_question` VALUES (94, 2, 3, '在多线程并发读写的情况下，下列哪些处理方式能保证对象的线程安全', '使用volatile关键字∧使用synchronized关键字给对象的读写操作加锁∧如果是基本类型，推荐使用java.util.concurrent.atomic包下面提供的线程安全的基本类型包装类，例如AtomicInteger∧如果是集合，推荐使用java.util.concurrent提供的并发集合类，例如：ConcurrentHashMap', '使用synchronized关键字给对象的读写操作加锁∧如果是基本类型，推荐使用java.util.concurrent.atomic包下面提供的线程安全的基本类型包装类，例如AtomicInteger∧如果是集合，推荐使用java.util.concurrent提供的并发集合类，例如：ConcurrentHashMap', 2, 'volatile 解决多线程内存不可见问题。对于一写多读，是可以解决变量同步问题，但是如果多写，同样无法解决线程安全问题。', 3.00, '', 0, '5201314', NULL, '2023-01-17 18:02:13', NULL);
INSERT INTO `exam_question` VALUES (95, 2, 3, '关于代码书写格式，下列哪些说法符合《阿里巴巴Java开发手册》', '换行时相对上一行缩进2个空格∧运算符与下文一起换行，方法调用的点符号与下文一起换行。 .append()∧在多个参数超长，逗号后进行换行∧在括号前不要换行', '运算符与下文一起换行，方法调用的点符号与下文一起换行。 .append()∧在多个参数超长，逗号后进行换行∧在括号前不要换行', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 18:04:03', NULL);
INSERT INTO `exam_question` VALUES (96, 1, 3, '关于使用explain对数据库性能进行优化分析，下列哪些说法符合《阿里巴巴Java开发手册》', 'SQL性能优化的目标：至少要达到 range 级别，要求是ref级别，如果可以是consts最好∧index级别走的是扫描索引，所以速度会比ref快∧range级别是指对表进行范围索引∧ref级别是指使用主键或者唯一索引', 'SQL性能优化的目标：至少要达到 range 级别，要求是ref级别，如果可以是consts最好', 2, ' 查询使用了何种类型的索引：效率（const>eq_ref>ref>range>index>all）', 2.00, '', 0, '5201314', '5201314', '2023-01-17 18:18:27', '2023-01-25 14:05:56');
INSERT INTO `exam_question` VALUES (97, 2, 3, '关于索引效率，下列哪些说法符合《阿里巴巴Java开发手册》', '使用索引的效率一定高于全表扫描的效率∧关于explain的结果，type=index的索引效率好于type=ref∧sql查询条件 where a like ‘%阿里%’ ，不会走索引∧sql查询条件 where a like ‘阿里%’ ,a列创建了索引，一般会使用索引进行检索', 'sql查询条件 where a like ‘%阿里%’ ，不会走索引∧sql查询条件 where a like ‘阿里%’ ,a列创建了索引，一般会使用索引进行检索', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 18:19:14', NULL);
INSERT INTO `exam_question` VALUES (98, 2, 3, '关于线程池管理线程的好处，下列哪些说法是正确的', '能够减少在创建和销毁线程上所花的时间以及系统资源的开销∧使用线程池一定能避免OOM问题∧线程资源必须通过线程池提供，不允许在应用中自行显式创建线程∧线程池能够根据资源等待情况，自动调整线程优先级并解决死锁问题', '能够减少在创建和销毁线程上所花的时间以及系统资源的开销∧线程资源必须通过线程池提供，不允许在应用中自行显式创建线程', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 18:19:58', NULL);
INSERT INTO `exam_question` VALUES (99, 2, 3, '关于MySQL性能优化的描述，下列哪些说法是正确的', '主键查询优先于二级索引查询。∧表连接有一定的代价，故表连接数量越少越好∧一般情况下，二级索引扫描优先于全表扫描∧可以使用通过索引避免排序代价', '主键查询优先于二级索引查询。∧表连接有一定的代价，故表连接数量越少越好∧一般情况下，二级索引扫描优先于全表扫描∧可以使用通过索引避免排序代价', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-17 18:20:45', NULL);
INSERT INTO `exam_question` VALUES (100, 2, 3, '不要对单元测试存在如下误解', '那是测试同学干的事情。本文是开发手册，凡是本文内容都是与开发同学强相关的∧单元测试代码是多余的。系统的整体功能与各单元部件的测试正常与否是强相关的∧单元测试代码不需要维护。一年半载后，那么单元测试几乎处于废弃状态∧单元测试与线上故障没有辩证关系。好的单元测试能够最大限度地规避线上故障', '那是测试同学干的事情。本文是开发手册，凡是本文内容都是与开发同学强相关的∧单元测试代码是多余的。系统的整体功能与各单元部件的测试正常与否是强相关的∧单元测试代码不需要维护。一年半载后，那么单元测试几乎处于废弃状态∧单元测试与线上故障没有辩证关系。好的单元测试能够最大限度地规避线上故障', 2, '', 3.00, '', 0, '5201314', '5201314', '2023-01-17 18:21:43', '2023-01-18 10:24:51');
INSERT INTO `exam_question` VALUES (101, 2, 3, '关于用日志记录异常信息，下列哪些说法符合', '日志尽量记录案发现场信息和异常堆栈信息∧如果日志中输出POJO类，POJO类需要重写toString方法，避免只输出hashCode∧不建议输出任何日志，因为日志记录消耗性能∧捕获异常后，一律抛给调用者去处理', '日志尽量记录案发现场信息和异常堆栈信息∧如果日志中输出POJO类，POJO类需要重写toString方法，避免只输出hashCode', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:07:13', NULL);
INSERT INTO `exam_question` VALUES (102, 2, 3, '关于ORM的规则，下列哪些说法符合', '数据库中，表达是与否概念的字段，必须使用is_xxx的方式命名∧推荐使用iBATIS自带的queryForList(String statementName,int start,int size)进行分页查询。(不推荐)∧为避免写resultMap，可以直接拿HashMap与HashTable作为查询结果集的输出∧不要用resultClass当返回参数，即使所有类属性名与数据库字段一一对应，也需要定义', '数据库中，表达是与否概念的字段，必须使用is_xxx的方式命名∧不要用resultClass当返回参数，即使所有类属性名与数据库字段一一对应，也需要定义', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:10:08', NULL);
INSERT INTO `exam_question` VALUES (103, 2, 3, '关于注释，下列哪些说法符合', '方法头定义签名上的注释可以使用//（双划线）简单说明，不必要遵守javadoc规范。（/** */）∧类定义开始部分，一般都用Javadoc注释 程序的总体描述以及作者信息。∧方法头定义签名上的注释必须遵守javadoc规范，使用/**回车来生成，不得在方法定义上方使用//（双划线）简单说明。∧方法头定义签名上的注释，可以使用// xxx 的形式', '类定义开始部分，一般都用Javadoc注释 程序的总体描述以及作者信息。∧方法头定义签名上的注释必须遵守javadoc规范，使用/**回车来生成，不得在方法定义上方使用//（双划线）简单说明。', 1, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:12:22', NULL);
INSERT INTO `exam_question` VALUES (104, 2, 3, '关于常量的命名，下列哪些说法符合', '常量命名应该全部大写，单词间用下划线隔开。∧常量的定义要力求语义表达完整清楚，让别人能从常量名称上大致了解含义，例如：MAX_STOCK_COUNT。∧常量命名，可以使用拼音与英文的混合方式。∧在使用缩写时要注意：杜绝不规范的缩写。', '常量命名应该全部大写，单词间用下划线隔开。∧常量的定义要力求语义表达完整清楚，让别人能从常量名称上大致了解含义，例如：MAX_STOCK_COUNT。∧在使用缩写时要注意：杜绝不规范的缩写。', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:14:14', NULL);
INSERT INTO `exam_question` VALUES (105, 2, 3, '关于二方库使用枚举类型，下列哪些说法符合', '二方库里可以定义。∧二方库里接口的入参可以使用枚举类型。∧二方库里接口的返回值不能使用枚举类型，但可以包含枚举类型。∧二方库里接口的返回值是枚举类型或包含枚举类型时，当二方库的枚举值升级（增加枚举值）时，可能会导致接口调用时出现枚举对象序列化异常。', '二方库里可以定义。∧二方库里接口的入参可以使用枚举类型。∧二方库里接口的返回值是枚举类型或包含枚举类型时，当二方库的枚举值升级（增加枚举值）时，可能会导致接口调用时出现枚举对象序列化异常。', 3, '二方库里可以定义枚举类型，参数可以使用枚举类型，但是接口返回值不允许使用枚举类型或者包含枚举的POJO对象', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:15:32', NULL);
INSERT INTO `exam_question` VALUES (106, 2, 3, '关于hashcode和equals，下列哪些说法是正确的', 'hashcode是Class的方法，equals是Object的方法。∧hashcode决定（如：HashMap）存储位置；equals决定是否需要覆盖（同一hash下）集合元素。∧类重写hashcode，必须重写equals∧两者是否需要重写，没有必然联系。', 'hashcode决定（如：HashMap）存储位置；equals决定是否需要覆盖（同一hash下）集合元素。∧类重写hashcode，必须重写equals', 3, 'equals 为true，hashcode值相同 但是hashcode值相同，equals可能为false', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:18:35', NULL);
INSERT INTO `exam_question` VALUES (107, 2, 3, '关于常量定义，下列哪些说法符合', '跨应用共享常量：放置在二方库中，通常是client.jar中的const目录下。∧应用内共享常量：通常放置在一方库的子模块中的const目录下。∧子工程内部共享常量：即在当前子工程的const目录下。∧类内常量：直接在类内部private static final定义。', '跨应用共享常量：放置在二方库中，通常是client.jar中的const目录下。∧应用内共享常量：通常放置在一方库的子模块中的const目录下。∧子工程内部共享常量：即在当前子工程的const目录下。∧类内常量：直接在类内部private static final定义。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:20:05', NULL);
INSERT INTO `exam_question` VALUES (108, 2, 3, '针对tcp协议，下列哪些说法是正确的', 'tcp链接主动关闭的一方，在完成四次挥手协议后，即会立即关闭并释放socket。∧处于time_wait状态的socket，其实是已经关闭状态，当需要新建连接时，可以被马上复用。∧当大量socket处于time_wait状态时，会导致可用socket资源稀缺，从而导致服务器并发能力下降。∧通过修改/etc/sysctl.conf配置文件，减小time_wait的超时时间，可以降低time_wait状态的socket数量，从而提升服务器并发能力。', '当大量socket处于time_wait状态时，会导致可用socket资源稀缺，从而导致服务器并发能力下降。∧通过修改/etc/sysctl.conf配置文件，减小time_wait的超时时间，可以降低time_wait状态的socket数量，从而提升服务器并发能力。', 4, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:21:29', NULL);
INSERT INTO `exam_question` VALUES (109, 2, 3, '关于try-catch的使用方式，下列哪些说法是正确的', '推荐用try-catch来做流程控制、条件控制。∧捕获异常与抛异常，必须是完全匹配，或者捕获异常是抛异常的父类。∧对大段代码进行try-catch，利用Throwable来捕捉，万无一失。∧对大段代码进行try-catch，这是不负责任的表现，分清稳定代码和非稳定代码，对非稳定的代码做对应的异常处理。', '捕获异常与抛异常，必须是完全匹配，或者捕获异常是抛异常的父类。∧对大段代码进行try-catch，这是不负责任的表现，分清稳定代码和非稳定代码，对非稳定的代码做对应的异常处理。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:25:25', NULL);
INSERT INTO `exam_question` VALUES (110, 2, 3, '关于加锁，下列哪些说法符合', '可以只锁代码区块的情况下，就不要锁整个方法体。∧高并发的业务场景下，要考虑加锁及同步处理带来的性能损耗，能用无锁数据结构，就不要用锁。∧能用对象锁的情况下，就不要用类锁。∧加锁时需要保持一致的加锁顺序，否则可能会造成死锁。', '可以只锁代码区块的情况下，就不要锁整个方法体。∧高并发的业务场景下，要考虑加锁及同步处理带来的性能损耗，能用无锁数据结构，就不要用锁。∧能用对象锁的情况下，就不要用类锁。∧加锁时需要保持一致的加锁顺序，否则可能会造成死锁。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:26:27', NULL);
INSERT INTO `exam_question` VALUES (111, 2, 3, '关于系统安全，下列哪些说法符合', '表单、AJAX提交不需要进行CSRF安全过滤。∧表单、AJAX提交必须执行CSRF安全过滤。∧URL外部重定向传入的目标地址必须执行白名单过滤。∧用户输入的SQL参数严格使用参数绑定或者METADATA字段值限定，防止SQL注入，禁止字符串拼接SQL访问数据库。', '表单、AJAX提交必须执行CSRF安全过滤。∧URL外部重定向传入的目标地址必须执行白名单过滤。∧用户输入的SQL参数严格使用参数绑定或者METADATA字段值限定，防止SQL注入，禁止字符串拼接SQL访问数据库。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:29:15', NULL);
INSERT INTO `exam_question` VALUES (112, 2, 3, '关于应用与数据库之间的操作，下列哪些说法符合', '对外提供一个大而全的接口进行POJO的update更新，这样比较省事，省代码。∧使用事务回滚的地方需要考虑各方面的回滚方案，包括缓存回滚、搜索引擎回滚、消息补偿、统计修正等。∧应用服务器与数据库之间是短连接。∧应用服务器与数据库之间是长连接。', '使用事务回滚的地方需要考虑各方面的回滚方案，包括缓存回滚、搜索引擎回滚、消息补偿、统计修正等。∧应用服务器与数据库之间是短连接。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:30:33', NULL);
INSERT INTO `exam_question` VALUES (113, 2, 3, '关于二方库的依赖处理，下列哪些说法符合', '依赖于一个二方库群时，必须定义一个统一版本变量，避免各子二方库版本号不一致。∧可以允许子项目的pom依赖中出现相同的GroupId，相同的ArtifactId，但是不同的Version。∧所有pom文件中的依赖声明放在语句块中，所有版本仲裁放在语句块中。∧线上应用不要依赖SNAPSHOT版本（安全包除外）。', '依赖于一个二方库群时，必须定义一个统一版本变量，避免各子二方库版本号不一致。∧所有pom文件中的依赖声明放在语句块中，所有版本仲裁放在语句块中。∧线上应用不要依赖SNAPSHOT版本（安全包除外）。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:34:26', NULL);
INSERT INTO `exam_question` VALUES (114, 1, 3, 'sort表示元素在存入集合时进行了排序，数据遍历的结果是按某个排序规则输出的； 而order表示每次遍历的序列都是一样的，元素前后关系每次遍历都是确定的，那么下列哪些集合既是sort，又是order的', 'HashSet∧LinkedList∧HashMap∧TreeSet', 'TreeSet', 3, '', 2.00, '', 0, '5201314', NULL, '2023-01-25 14:36:03', NULL);
INSERT INTO `exam_question` VALUES (115, 2, 3, '关于工具类二方库已经提供的，尽量不要在本应用中编程实现，下列哪些说法符合', 'json操作使用fastjson。∧md5操作使用commons-codec。∧ArrayUtils、NumberUtils、DateFormatUtils、DateUtils等优先使用org.apache.commons.lang包。∧CollectionUtils优先使用org.apache.commons.collections4包。', 'json操作使用fastjson。∧md5操作使用commons-codec。∧CollectionUtils优先使用org.apache.commons.collections4包。', 3, '备注：(org.apache.commons.lang3.time.DateFormatUtils)', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:37:21', NULL);
INSERT INTO `exam_question` VALUES (116, 2, 3, '关于接口使用抛异常还是返回错误码，下列哪些说法符合', '向公司外部提供的http/api接口，推荐使用“错误码”方式返回异常或者错误信息。∧对于应用内部的方法调用，推荐使用“抛出异常”的方式处理异常或者错误信息。∧跨应用的RPC调用，推荐使用将“错误码”和“错误简短信息”封装成Result的方式进行返回。∧对外提供的接口，一定要保证逻辑健壮性：尽量避免空指针等技术类异常；对于业务类异常要做好错误码或者异常信息的封装。', '向公司外部提供的http/api接口，推荐使用“错误码”方式返回异常或者错误信息。∧对于应用内部的方法调用，推荐使用“抛出异常”的方式处理异常或者错误信息。∧跨应用的RPC调用，推荐使用将“错误码”和“错误简短信息”封装成Result的方式进行返回。∧对外提供的接口，一定要保证逻辑健壮性：尽量避免空指针等技术类异常；对于业务类异常要做好错误码或者异常信息的封装。', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:38:31', NULL);
INSERT INTO `exam_question` VALUES (117, 1, 3, '关于测试代码的覆盖率，下列哪些说法是正确的？', '路径覆盖是最强覆盖，符合路径覆盖且测试全部通过，程序绝对没有问题。∧语句覆盖度是最弱的覆盖度量方式。∧分支覆盖与条件覆盖其实是一回事。∧判定条件覆盖与路径覆盖其实是一回事。', '语句覆盖度是最弱的覆盖度量方式。', 2, '', 2.00, '', 0, '5201314', NULL, '2023-01-25 14:39:26', NULL);
INSERT INTO `exam_question` VALUES (118, 2, 3, '关于类和方法的命名，下列哪些说法符合', '类名使用UpperCamelCase命名法，但是领域模型命名除外，如：ProductDO的命名是规范的。∧方法名命名应该使用lowerCamelCase命名法，如方法名：getHttpMessage() 是符合命名规范的。∧为了方便理解，方法名或参数名可以使用拼音与英文混合的方式。∧所有编程相关的命名均不能以下划线或美元符号开始，也不能以下划线或美元符号结束。', '类名使用UpperCamelCase命名法，但是领域模型命名除外，如：ProductDO的命名是规范的。∧方法名命名应该使用lowerCamelCase命名法，如方法名：getHttpMessage() 是符合命名规范的。∧所有编程相关的命名均不能以下划线或美元符号开始，也不能以下划线或美元符号结束。', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:40:43', NULL);
INSERT INTO `exam_question` VALUES (119, 2, 3, '对于索引(a, b, c)，下列哪些说法是正确的', '查询语句 where a between 5 and 10 可以使用该索引。∧查询语句 where a = 5 and b between 5 and 10 可以使用该索引。∧查询语句 where a in (5, 6, 7, 8, 9) and b = 5 可以使用该索引。∧查询语句 where b = 5 and c = 10 可以使用该索引。', '查询语句 where a between 5 and 10 可以使用该索引。∧查询语句 where a = 5 and b between 5 and 10 可以使用该索引。∧查询语句 where a in (5, 6, 7, 8, 9) and b = 5 可以使用该索引。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:41:58', NULL);
INSERT INTO `exam_question` VALUES (120, 2, 3, '根据《阿里巴巴Java开发手册》，以下哪些字段属于表的必备字段', 'id∧gmt_modified∧parent_id∧gmt_create', 'id∧gmt_modified∧gmt_create', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:43:39', NULL);
INSERT INTO `exam_question` VALUES (121, 1, 3, '单元测试代码写在Java工程的哪个地方最为合适？', '写在业务代码体里边，方便调试。∧写在业务代码同一个包下，方便归类查找。∧写在src/test/java目录下。∧写在src/java目录下。', '写在src/test/java目录下。', 3, '', 2.00, '', 0, '5201314', NULL, '2023-01-25 14:44:36', NULL);
INSERT INTO `exam_question` VALUES (122, 2, 3, '编写单元测试代码遵守BCDE原则，以保证被测试模块的交付质量，那么下列说法正确的是', 'Border，边界值测试，包括循环边界、特殊取值、特殊时间点、数据顺序等∧Correct，正确的输入，并得到预期的结果。∧Design，与设计文档相结合，来编写单元测试。∧Equal， 单元测试环境必须与线上生产环境一致。(Error)', 'Border，边界值测试，包括循环边界、特殊取值、特殊时间点、数据顺序等∧Correct，正确的输入，并得到预期的结果。∧Design，与设计文档相结合，来编写单元测试。', 3, 'Border，边界值测试，包括循环边界、特殊取值、特殊时间点等。Correct，正确的输入，并得到预期的结果。Design，与设计文档相结合，来编写单元测试。Error，强制错误信息输入，并得到预期的结果。', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:47:52', NULL);
INSERT INTO `exam_question` VALUES (123, 2, 3, '关于领域模型命名，下列哪些说法符合', '数据对象命名：xxxDO，xxx即为数据表名，例如：ResellerAccountDO。∧数据传输对象：xxxDTO，xxx为业务领域相关的名称，例如ProductDTO。∧展示层对象：xxxVO，xxx一般为网页名称，例如RecommendProductVO。∧POJO是DO/DTO/BO/VO的统称，命名成xxxPOJO。', '数据对象命名：xxxDO，xxx即为数据表名，例如：ResellerAccountDO。∧数据传输对象：xxxDTO，xxx为业务领域相关的名称，例如ProductDTO。∧展示层对象：xxxVO，xxx一般为网页名称，例如RecommendProductVO。', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:48:50', NULL);
INSERT INTO `exam_question` VALUES (124, 2, 3, '关于客户数据展示，下列哪些说法符合', '客户的密码，密钥及密保问题答案等信息禁止展示。∧客户的银行卡号只显示后四位。∧客户的证件号码只显示第一位和最后一位，在必要业务场景下，经多因子强验证后可完整展示。∧涉及有完整展示客户信息的页面均需要接入防爬系统', '客户的密码，密钥及密保问题答案等信息禁止展示。∧客户的银行卡号只显示后四位。∧客户的证件号码只显示第一位和最后一位，在必要业务场景下，经多因子强验证后可完整展示。∧涉及有完整展示客户信息的页面均需要接入防爬系统', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:50:22', NULL);
INSERT INTO `exam_question` VALUES (125, 2, 3, '如何处理单元测试产生的数据，下列哪些说法是正确的？', '测试数据入库时加特殊前缀标识。∧测试数据使用独立的测试库。∧自动回滚单元测试产生的脏数据∧无须区别，统一在业务代码中进行判断和识别。', '测试数据入库时加特殊前缀标识。∧测试数据使用独立的测试库。∧自动回滚单元测试产生的脏数据', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:51:20', NULL);
INSERT INTO `exam_question` VALUES (126, 2, 3, '关于并发处理，下列哪些说法符合', '线程资源必须通过线程池提供，不允许在应用中自行显式创建线程。∧同步处理时，能锁部分代码区块的情况下不要锁整个方法；高并发时，同步调用应该考虑到性能损耗。∧创建线程或线程池时，推荐给线程指定一个有意义的名称，方便出错时回溯。∧推荐使用Executors.newFixedThreadPool(int x)生成指定大小的线程池。', '线程资源必须通过线程池提供，不允许在应用中自行显式创建线程。∧同步处理时，能锁部分代码区块的情况下不要锁整个方法；高并发时，同步调用应该考虑到性能损耗。∧创建线程或线程池时，推荐给线程指定一个有意义的名称，方便出错时回溯。', 4, '备注：(线程池不允许使用 Executors 去创建，而是通过 ThreadPoolExecutor 的方式)', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:52:29', NULL);
INSERT INTO `exam_question` VALUES (127, 2, 3, '下列哪些说法符合', '对于“明确停止使用的代码和配置”，如方法、变量、类、配置文件、动态配置属性等要坚决从程序中清理出去，避免造成过多垃圾。∧永久弃用的代码段注释掉即可，即不用加任何注释。∧对于暂时被注释掉，后续可能恢复使用的代码片断，在注释代码上方，统一规定使用三 个斜杠(///)来说明注释掉代码的理由。∧不要在视图模板中加入任何复杂的逻辑。', '对于“明确停止使用的代码和配置”，如方法、变量、类、配置文件、动态配置属性等要坚决从程序中清理出去，避免造成过多垃圾。∧对于暂时被注释掉，后续可能恢复使用的代码片断，在注释代码上方，统一规定使用三 个斜杠(///)来说明注释掉代码的理由。∧不要在视图模板中加入任何复杂的逻辑。', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:53:48', NULL);
INSERT INTO `exam_question` VALUES (128, 2, 3, '关于数据库中NULL的描述，下列哪些说法符合', 'NULL=NULL的返回结果为true。∧NULL与任何值的比较结果都为NULL。∧NULL<>1的返回结果为true。∧当某一列的值全是NULL时，sum(col)的返回结果为NULL。', 'NULL与任何值的比较结果都为NULL。∧当某一列的值全是NULL时，sum(col)的返回结果为NULL。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:56:18', NULL);
INSERT INTO `exam_question` VALUES (129, 1, 3, '集合在遍历过程中，有时需要对符合一定条件的元素进行删除，下列哪些说法是正确的', '在 foreach 循环里进行元素的 remove操作。∧使用Iterator方式，如果有并发，需要对Iterator对象加锁。∧Iterator进行元素的删除操作，绝对是线程安全的。∧Java无法实现在遍历时，进行删除元素操作。', '使用Iterator方式，如果有并发，需要对Iterator对象加锁。', 3, '', 2.00, '', 0, '5201314', NULL, '2023-01-25 14:57:32', NULL);
INSERT INTO `exam_question` VALUES (130, 2, 3, '关于基本数据类型与包装数据类型的使用标准，下列哪些说法符合', '.所有的POJO类属性必须使用包装数据类型。∧RPC方法的返回值和参数必须使用包装数据类型。∧因为JAVA的自动装箱与拆箱机制，不需要根据场景来区分数据类型。∧所有的局部变量推荐使用基本数据类型。', '.所有的POJO类属性必须使用包装数据类型。∧RPC方法的返回值和参数必须使用包装数据类型。∧所有的局部变量推荐使用基本数据类型。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:58:24', NULL);
INSERT INTO `exam_question` VALUES (131, 2, 3, '关于二方库版本号的命名方式，下列哪些说法符合', '版本号命名格式：主版本号.次版本号.修订号。∧主版本号:产品方向改变，或者大规模API不兼容，或者架构不兼容升级。∧次版本号:保持相对兼容性，增加主要功能特性，影响范围极小的API不兼容修改。∧修订号:保持完全兼容性，修复BUG、新增次要功能特性等。', '版本号命名格式：主版本号.次版本号.修订号。∧主版本号:产品方向改变，或者大规模API不兼容，或者架构不兼容升级。∧次版本号:保持相对兼容性，增加主要功能特性，影响范围极小的API不兼容修改。∧修订号:保持完全兼容性，修复BUG、新增次要功能特性等。', 4, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 14:59:30', NULL);
INSERT INTO `exam_question` VALUES (132, 2, 3, '关于代码注释，下列哪些说法符合', '特殊注明标记人与标记时间。∧待办事宜（TODO）:（ [标记人，标记时间，[预计处理时间]）∧在注释中用FIXME标记某代码虽然实现了功能，但是实现的方法有待商榷，希望将来能改进∧在注释中用FIXME标记某代码是错误的，而且不能工作，需要及时纠正的情况', '特殊注明标记人与标记时间。∧待办事宜（TODO）:（ [标记人，标记时间，[预计处理时间]）∧在注释中用FIXME标记某代码是错误的，而且不能工作，需要及时纠正的情况', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:01:10', NULL);
INSERT INTO `exam_question` VALUES (133, 2, 3, '关于索引的设计和使用，下列哪些说法是正确的', '若查询条件中不包含索引的最左列，则无法使用索引。∧对于范围查询，只能利用索引的最左列。∧对于order by A或group by A语句，在A上建立索引，可以避免排序。∧对于多列排序，需要所有所有列排序方向一致，才能利用索引。', '若查询条件中不包含索引的最左列，则无法使用索引。∧对于多列排序，需要所有所有列排序方向一致，才能利用索引。', 3, '设计高效索引：\n查询，更新，删除where条件中必须有索引，处理行数不能超过1w\n若查询条件中不包含索引的最左列， 无法使用索引\n对于范围查询， 只能利用索引的最左列\n对于group by/order by A语句，在A上建立索引， 可以避免排序\n对于多列排序， 需要所有所有列排序方向一致， 才能利用索引。', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:03:39', NULL);
INSERT INTO `exam_question` VALUES (134, 2, 3, '关于类命名，下列哪些说法符合', '抽象类命名使用Abstract或Base开头。∧异常类命名使用Exception结尾。∧测试类命名以它要测试的类的名称开始，以Test结尾。∧如果使用到了设计模式，建议在类名中体现出具体模式。例如代理模式的类命名：LoginProxy；观察者模式命名：ResourceObserver。', '抽象类命名使用Abstract或Base开头。∧异常类命名使用Exception结尾。∧测试类命名以它要测试的类的名称开始，以Test结尾。∧如果使用到了设计模式，建议在类名中体现出具体模式。例如代理模式的类命名：LoginProxy；观察者模式命名：ResourceObserver。', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:04:14', NULL);
INSERT INTO `exam_question` VALUES (135, 2, 3, '关于数据库模糊检索的描述，下列哪些说法符合', '绝对禁止左模糊。∧绝对禁止全模糊。∧绝对禁止右模糊。∧全模糊或左模糊查询需求，优先使用搜索引擎。', '绝对禁止左模糊。∧绝对禁止全模糊。∧全模糊或左模糊查询需求，优先使用搜索引擎。', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:05:03', NULL);
INSERT INTO `exam_question` VALUES (136, 2, 3, '关于代码注释，下列哪些说法符合', '所有的抽象方法（包括接口中的方法）必须要用javadoc注释。∧所有的方法，包括私有方法，最好都增加注释，有总比没有强。∧过多过滥的注释，代码的逻辑一旦修改，修改注释是相当大的负担。∧我的命名和代码结构非常好，可以减少注释的内容。', '所有的抽象方法（包括接口中的方法）必须要用javadoc注释。∧过多过滥的注释，代码的逻辑一旦修改，修改注释是相当大的负担。∧我的命名和代码结构非常好，可以减少注释的内容。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:06:31', NULL);
INSERT INTO `exam_question` VALUES (137, 2, 3, '关于变量、方法名、包的命名，下列哪些说法符合', 'POJO类中的任何布尔类型的变量，都不要加is，因为部分框架解析时有可能会出现序列化错误。∧包名统一使用单数形式，如：com.alibaba.mpp.util。∧中括号是数组类型的一部分，数组定义如下：String[] args; 不要误写为String args[]；∧Service/DAO层方法命名可以参考规约，例如：删除的方法推荐使用remove或delete做前缀。', 'POJO类中的任何布尔类型的变量，都不要加is，因为部分框架解析时有可能会出现序列化错误。∧包名统一使用单数形式，如：com.alibaba.mpp.util。∧中括号是数组类型的一部分，数组定义如下：String[] args; 不要误写为String args[]；∧Service/DAO层方法命名可以参考规约，例如：删除的方法推荐使用remove或delete做前缀。', 2, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:07:34', NULL);
INSERT INTO `exam_question` VALUES (138, 2, 3, '关于常量定义，下列哪些说法符合', '不允许出现任何魔法值（即未经预先定义的常量）直接出现在代码中。∧魔法值是指程序中随意定义并赋值的变量值，如果代码编写者明白变量值意义是可以任意使用的，例如在代码中写if(status == 3) return error;符合规范。∧如果变量值仅在一个范围内变化推荐用Enum类。∧在程序中，一律禁止使用枚举类型。', '不允许出现任何魔法值（即未经预先定义的常量）直接出现在代码中。∧如果变量值仅在一个范围内变化推荐用Enum类。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:08:28', NULL);
INSERT INTO `exam_question` VALUES (139, 2, 3, '关于maven依赖、仲裁、规则，下列哪些说法是正确的', '<dependencies>的依赖会默认传递给子项目。∧<dependencies>的依赖绝对不会传递给子项目。∧在<dependencyManagement>中指定版本号。∧避免在不同的子项目，声明同一个二方库的不同版本号。', '<dependencies>的依赖会默认传递给子项目。∧在<dependencyManagement>中指定版本号。∧避免在不同的子项目，声明同一个二方库的不同版本号。', 4, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:09:23', NULL);
INSERT INTO `exam_question` VALUES (140, 1, 3, '关于二方库升级，下列哪些说法是正确的', '升级二方库只是改个版本号，不需要关联功能的回归。∧升级二方库需要比对仲裁结果的差异，谨慎评估。∧升级二方库，绝对不会影响到其它二方库的版本号。∧只要此二方库负责人保证说不会有任何影响，即可大胆升级，直接发布上线。', '升级二方库需要比对仲裁结果的差异，谨慎评估。', 4, '备注：【强制】二方库的新增或升级，保持除功能点之外的其它 jar 包仲裁结果不变。如果有改变，\n必须明确评估和验证，建议进行 dependency:resolve 前后信息比对，如果仲裁结果完全不一\n致，那么通过 dependency:tree 命令，找出差异点，进行<excludes>排除 jar 包。', 2.00, '', 0, '5201314', NULL, '2023-01-25 15:10:26', NULL);
INSERT INTO `exam_question` VALUES (141, 2, 3, '关于表字段和索引，下列哪些说法符合', '表字段注释，如果修改字段含义或对字段表示的状态追加时，需要及时更新。∧合适的字符存储长度，不但节约数据库表空间、节约索引存储，更重要的是提升检索速度。∧针对表的每个字段都增加索引，加快查询速度。∧字段的区分度越高，索引的查找速度越快。', '表字段注释，如果修改字段含义或对字段表示的状态追加时，需要及时更新。∧合适的字符存储长度，不但节约数据库表空间、节约索引存储，更重要的是提升检索速度。∧字段的区分度越高，索引的查找速度越快。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:11:46', NULL);
INSERT INTO `exam_question` VALUES (142, 2, 3, '.关于数据库命名规则，下列哪些说法符合', '数据库库名和表名没有规定，可任意取名，只要方便记忆即可。∧库名应该尽量与应用名称保持一致，表的命名最好是业务名称_表名的方式。∧无论是库名还是表名都禁用保留字，如desc、match、range等。∧表名、字段名必须使用小写字母或数字。', '库名应该尽量与应用名称保持一致，表的命名最好是业务名称_表名的方式。∧无论是库名还是表名都禁用保留字，如desc、match、range等。∧表名、字段名必须使用小写字母或数字。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:12:50', NULL);
INSERT INTO `exam_question` VALUES (143, 2, 3, '关于数据库是与否概念的列的命名方式，下列哪些说法符合', '对于是与否概念的列名，必须使用can_abc 来表示。∧对于是与否概念的列名，必须使用is_abc 来表示。∧数据类型是varchar(1)（ Y表示是，N表示否）。∧数据类型是unsigned tiny int.（ 1表示是，0表示否）。', '对于是与否概念的列名，必须使用is_abc 来表示。∧数据类型是unsigned tiny int.（ 1表示是，0表示否）。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:13:50', NULL);
INSERT INTO `exam_question` VALUES (144, 2, 3, '通过集合A.subList()获取子集合B，下列说法哪些是正确的', '返回的集合B没有实现Serializable接口，不能被序列化，所以不能应用于RPC场景。∧在B集合中添加某个元素，那么A集合也会添加进去此元素。∧集合A中元素的修改不会影响到集合B的任何操作。∧对A元素个数的修改，会导致集合B的遍历产生ConcurrentModificationException 异常。', '返回的集合B没有实现Serializable接口，不能被序列化，所以不能应用于RPC场景。∧在B集合中添加某个元素，那么A集合也会添加进去此元素。∧对A元素个数的修改，会导致集合B的遍历产生ConcurrentModificationException 异常。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:15:11', NULL);
INSERT INTO `exam_question` VALUES (145, 2, 3, '关于捕获异常和抛异常，下列哪些说法符合', '如果需要捕获不同类型异常，为了方便处理，可以使用catch(Exception e){...}。∧不要捕获异常后不处理，丢弃异常信息。∧捕获异常与抛异常，必须是完全匹配，或者捕获异常是抛异常的父类。∧异常定义时区分unchecked / checked 异常，避免直接使用RuntimeException抛出。', '不要捕获异常后不处理，丢弃异常信息。∧捕获异常与抛异常，必须是完全匹配，或者捕获异常是抛异常的父类。∧异常定义时区分unchecked / checked 异常，避免直接使用RuntimeException抛出。', 4, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:16:35', NULL);
INSERT INTO `exam_question` VALUES (146, 2, 3, '为了更方便地进行单元测试，被测试的业务代码应避免以下哪些情况？', '构造方法中做的事情过多。∧存在过多的全局变量和静态方法。∧存在过多的外部依赖。∧存在过多的条件语句。', '构造方法中做的事情过多。∧存在过多的全局变量和静态方法。∧存在过多的外部依赖。∧存在过多的条件语句。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:17:27', NULL);
INSERT INTO `exam_question` VALUES (147, 2, 3, '关于控制语句，下列哪些说法符合', '推荐 if-else的方式可以改写成卫语句的形式。∧尽量减少try-catch 块内的逻辑，定义对象、变量、获取数据库连接等操作可以移到try-catch块外处理∧if ( condition) statements; 单行语句不需要使用大括号。∧在一个switch块内，都必须包含一个default语句并且放在最后，即使它什么代码也没有。', '推荐 if-else的方式可以改写成卫语句的形式。∧尽量减少try-catch 块内的逻辑，定义对象、变量、获取数据库连接等操作可以移到try-catch块外处理∧在一个switch块内，都必须包含一个default语句并且放在最后，即使它什么代码也没有。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:18:43', NULL);
INSERT INTO `exam_question` VALUES (148, 2, 3, '关于参数有效性验证，下列哪些说法符合', '防止page size过大导致内存溢出。∧防止正则输入源串拒绝服务ReDOS。∧防止任意重定向。∧预防 SQL 注入。', '防止page size过大导致内存溢出。∧防止正则输入源串拒绝服务ReDOS。∧防止任意重定向。∧预防 SQL 注入。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:20:18', NULL);
INSERT INTO `exam_question` VALUES (149, 1, 3, '在定义DO/DTO/VO/等POJO类时，对属性默认值的设定，下列哪些说法符合', 'String类型的默认值设定为空字符串。∧Date类型的默认值设定为new Date()。∧集合类型的默认值设定为Collections.EMPTY_LIST。∧不要设定任何属性默认值。', '不要设定任何属性默认值。', 3, '备注: 【强制】定义 DO/DTO/VO 等 POJO 类时，不要设定任何属性默认值。\n反例：POJO 类的 gmtCreate 默认值为 new Date()，但是这个属性在数据提取时并没有置入具\n体值，在更新其它字段时又附带更新了此字段，导致创建时间被修改成当前时间。', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:21:42', NULL);
INSERT INTO `exam_question` VALUES (150, 2, 3, '关于Java代码的设计和开发注意事项，下列哪些说法符合', '禁止将URL、文件名、系统参数、数据库连接地址、业务规则的可变参数，硬编码在工程中。∧long或者Long初始赋值时，必须是大写的L，不能小写。∧当一个类有多个构造方法，或是多个同名方法，这些方法应该按顺序放置在一起，便于阅读。∧相同参数类型，同等业务含义，才可以使用Java的可变参数，参数的类型尽量避免使用Object。', '禁止将URL、文件名、系统参数、数据库连接地址、业务规则的可变参数，硬编码在工程中。∧long或者Long初始赋值时，必须是大写的L，不能小写。∧当一个类有多个构造方法，或是多个同名方法，这些方法应该按顺序放置在一起，便于阅读。∧相同参数类型，同等业务含义，才可以使用Java的可变参数，参数的类型尽量避免使用Object。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:24:11', NULL);
INSERT INTO `exam_question` VALUES (151, 2, 3, '关于数据库索引的命名，下列哪些说法符合', '主键索引(primary key)，字段类型为unsigned bigint、单表时推荐自增、步长为1。∧主键索引(primary key)，字段类型为unsigned bigint、单表时推荐自增、步长为2。∧唯一索引（unique key），命名规则为uk_字段名（如果多个字段继续下划线）。∧普通索引(normal index)，标记成idx_字段名（如果多个继续下划线）。', '主键索引(primary key)，字段类型为unsigned bigint、单表时推荐自增、步长为1。∧唯一索引（unique key），命名规则为uk_字段名（如果多个字段继续下划线）。∧普通索引(normal index)，标记成idx_字段名（如果多个继续下划线）。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:24:58', NULL);
INSERT INTO `exam_question` VALUES (152, 2, 3, '关于加锁，下列哪些说法符合', '可以只锁代码区块的情况下，就不要锁整个方法体。∧高并发的业务场景下，要考虑加锁及同步处理带来的性能损耗，能用无锁数据结构，就不要用锁。∧能用对象锁的情况下，就不要用类锁。∧加锁时需要保持一致的加锁顺序，否则可能会造成死锁。', '可以只锁代码区块的情况下，就不要锁整个方法体。∧高并发的业务场景下，要考虑加锁及同步处理带来的性能损耗，能用无锁数据结构，就不要用锁。∧能用对象锁的情况下，就不要用类锁。∧加锁时需要保持一致的加锁顺序，否则可能会造成死锁。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:27:04', NULL);
INSERT INTO `exam_question` VALUES (153, 2, 3, '二方库的snapshot与release的区别，下列哪些说法是正确的', 'snapshot在本地编译时，都会到中央库下载最新的二方库∧release在本地编译时，如果已经存在相同的版本号，即使中央仓库有最新相同版本的二方库也不会拉取∧应用使用了A的release版本的二方库，A依赖了B的snapshot二方库，应用本地编译时，并不会拉取B最新的snapshot的jar∧应用发布尽量使用release版本的二方库，此举是为了保证发布的冥等性', 'snapshot在本地编译时，都会到中央库下载最新的二方库∧release在本地编译时，如果已经存在相同的版本号，即使中央仓库有最新相同版本的二方库也不会拉取∧应用发布尽量使用release版本的二方库，此举是为了保证发布的冥等性', 4, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:31:25', NULL);
INSERT INTO `exam_question` VALUES (154, 2, 3, '二方库GroupID和ArtifactID格式，下列哪些说法符合', 'GroupID格式为：com.{公司/子公司}.业务线{子业务线}。∧GroupID格式为：com.{公司/子公司}.业务线.子业务线.子模块。∧ ArtifactID格式为：产品线名_模块名或者产品线.模块名。∧ArtifactID格式为：产品线名-模块名。', 'GroupID格式为：com.{公司/子公司}.业务线{子业务线}。∧ArtifactID格式为：产品线名-模块名。', 4, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:32:44', NULL);
INSERT INTO `exam_question` VALUES (155, 2, 3, '利用索引进行排序,下列哪些说法是正确的', '查询语句 WHERE a = 10 ORDER BYb,可以利用索引(a，b)来进行索引排序。∧查询语句WHERE a > 10 ORDER BY b,不可以利用索引(a，b)进行索引排序。∧查询语句WHERE a IN(10, 11) ODER BY b.可以利用索引(a，b)来进行索引排序。∧查询语句WHER a>10AND b=20 ORDER BY a,可以利用索引(b，a)来进行素引排序。', '查询语句 WHERE a = 10 ORDER BYb,可以利用索引(a，b)来进行索引排序。∧查询语句WHERE a > 10 ORDER BY b,不可以利用索引(a，b)进行索引排序。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:34:20', NULL);
INSERT INTO `exam_question` VALUES (156, 1, 3, 'sont表示元素在存入集合时进行了排序,数据遍历的结果是按某个排序规则输出的;而order表示每次遍历的序列都是一样的,元素前后关系每次遍历都是确定的,那么下列哪些集合既是sort,又是order的', 'HashSet∧LinkedList∧HashMap∧TreeMap', 'TreeMap', 3, '', 2.00, '', 0, '5201314', NULL, '2023-01-25 15:35:15', NULL);
INSERT INTO `exam_question` VALUES (157, 2, 3, '关于类和方法,下列哪些符合', '任何类、方法、严控访问范围。因为过宽泛的访问范围,不利于模块解耦。∧对外暴露的接口签名,原则上不允许修改,宁可新增,避免对依赖端产生影响。∧如果新增一个功能完全相同的新接口,过时接口必须加@deprecated注释。∧所有过时的类与方法不得使用。', '任何类、方法、严控访问范围。因为过宽泛的访问范围,不利于模块解耦。∧对外暴露的接口签名,原则上不允许修改,宁可新增,避免对依赖端产生影响。∧如果新增一个功能完全相同的新接口,过时接口必须加@deprecated注释。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:36:04', NULL);
INSERT INTO `exam_question` VALUES (158, 2, 3, '关于异常处理的注意事项,下列哪些说法符合', '事务场景中,抛出异常核catch后,如果需要回滚,一定要手动回滚事务。∧在finally对文件流进行关闭。∧推荐在finally使用return语句。∧在try块内,可以不用对可能为null的对象做非空判断,因为如果抛掷NPE,会被catch块捕获井处理', '事务场景中,抛出异常核catch后,如果需要回滚,一定要手动回滚事务。∧在finally对文件流进行关闭。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:36:51', NULL);
INSERT INTO `exam_question` VALUES (159, 2, 3, '下列哪些说法符合', '对于“明确停止使用的代码和配置”，如方法、变量、类、配置文件、动态配置属性等要坚决从程序中清理出去，避免造成过多垃圾。∧永久弃用的代码段注释掉即可，即不用加任何注释。∧对于暂时被注释掉，后续可能恢复使用的代码片断，在注释代码上方，统一规定使用三 个斜杠(///)来说明注释掉代码的理由。∧不要在视图模板中加入任何复杂的逻辑。', '对于“明确停止使用的代码和配置”，如方法、变量、类、配置文件、动态配置属性等要坚决从程序中清理出去，避免造成过多垃圾。∧对于暂时被注释掉，后续可能恢复使用的代码片断，在注释代码上方，统一规定使用三 个斜杠(///)来说明注释掉代码的理由。∧不要在视图模板中加入任何复杂的逻辑。', 3, '', 3.00, '', 0, '5201314', NULL, '2023-01-25 15:39:02', NULL);

-- ----------------------------
-- Table structure for exam_question_record
-- ----------------------------
DROP TABLE IF EXISTS `exam_question_record`;
CREATE TABLE `exam_question_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_record_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '考试记录试卷id',
  `question_id` int(11) NULL DEFAULT NULL COMMENT '题目id',
  `stu_answer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学生答案',
  `is_right` tinyint(1) NULL DEFAULT 0 COMMENT '是否正确 1正确 0 不正确',
  `score` float(10, 2) NULL DEFAULT 0.00 COMMENT '得分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '考试记录 题目记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_question_record
-- ----------------------------
INSERT INTO `exam_question_record` VALUES (1065, '567da1997e65d6c26d483636a9850089', 12, 'IP，掩码，网关，DNS', 1, 2.00);
INSERT INTO `exam_question_record` VALUES (1066, '567da1997e65d6c26d483636a9850089', 18, '130KB', 0, 0.00);
INSERT INTO `exam_question_record` VALUES (1067, '567da1997e65d6c26d483636a9850089', 21, '采样、量化、编码', 1, 2.00);
INSERT INTO `exam_question_record` VALUES (1068, '567da1997e65d6c26d483636a9850089', 28, '作为第二层设备的唯一标识', 1, 2.00);
INSERT INTO `exam_question_record` VALUES (1069, '567da1997e65d6c26d483636a9850089', 71, 'ScheduledExecutorService并发运行多个定时任务时，其中某线程抛出异常，不会影响到其它线程的继续运行∧Timer运行多个TimeTask时，只要其中之一没有捕获抛出的异常，其它任务便会自动终止运行∧推荐使用ScheduledExecutorService方式处理', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1070, '567da1997e65d6c26d483636a9850089', 74, 'mvn clean install 打印工程整个的依赖树结构，并部署到本地仓库中∧mvn dependency:tree -Dverbose -Dincludes=commons-lang 打印出与commons-lang相关的详细依赖∧mvn dependency:tree 打印工程整个的依赖树结构∧mvn dependency:resolve 打印出已仲裁依赖的列表', 0, 0.00);
INSERT INTO `exam_question_record` VALUES (1071, '567da1997e65d6c26d483636a9850089', 75, 'Long a=2L；//大写的L∧不要使用一个常量类维护所有常量，应该按常量功能进行归类，分开维护', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1072, '567da1997e65d6c26d483636a9850089', 76, 'SimpleDateFormat 是线程不安全的类∧一般不要定义SimpleDateFormat的static变量，如果定义为static，必须保证线程安全∧推荐使用Apache封装好的DateUtils和DateFormatUtils工具类，来处理时间日期转换问题', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1073, '567da1997e65d6c26d483636a9850089', 77, '代码块缩进4个空格，如果使用tab缩进，请设置成1个tab为4个空格∧方法体内的执行语句组、变量的定义语句组、不同的业务逻辑之间或者不同的语义之间推荐插入一个空行；相同业务逻辑和语义之间不需要插入空行', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1074, '567da1997e65d6c26d483636a9850089', 78, 'Arrays.asList 体现的是适配器模式，只是转换接口，后台的数据仍是数组∧对于转换过来的集合，它的 add/remove/clear 方法会抛出: UnsupportedOperationException∧数组元素的修改，会影响到转化过来的集合', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1075, '567da1997e65d6c26d483636a9850089', 79, '为防止obj对象本身空指针异常，书写代码时应该注意加异常捕获处理，例如：try { obj.method() } catch(NullPointerException e){……} ∧方法签名中，抛给调用者的关键字为throws∧自定义异常要做到“认知对等”，即：抛出者和接收者要保持对自定义异常的认知统一，接收方需要知道这种异常的含义和对应的处理方案', 0, 0.00);
INSERT INTO `exam_question_record` VALUES (1076, '567da1997e65d6c26d483636a9850089', 80, 'HashMap的KV都可以为null∧ConcurrentHashMap的KV都不可以为null', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1077, '567da1997e65d6c26d483636a9850089', 82, 'NullPointerException , IllegalArgumentException属于unchecked exception∧unchecked异常继承java.lang.RuntimeException类∧继承java.lang.Error的类属于checked exception', 0, 0.00);
INSERT INTO `exam_question_record` VALUES (1078, '567da1997e65d6c26d483636a9850089', 83, '【强制】包名统一使用小写，点分隔符之间有且仅有一个自然语义的英语单词，并且使用复数形式，例如：应用工具类包名为com.alibaba.mpp.utils∧【强制】类名使用UpperCamelCase，必须遵从驼峰形式，但以下情形例外：（领域模型的相关命名）DO / DTO / VO / DAO等∧【强制】抽象类命名使用Abstract或Base开头；异常类命名使用Exception结尾；测试类命名以它要测试的类的名称开始，以Test结尾∧【强制】枚举类名建议带上Enum后缀，枚举成员名称需要全大写，单词间用下划线隔开∧如果使用到了设计模式，建议在类名中体现出具体模式。例如代理模式的类命名：LoginProxy；观察者模式命名：ResourceObserver', 0, 0.00);
INSERT INTO `exam_question_record` VALUES (1079, '567da1997e65d6c26d483636a9850089', 84, '主键查询优先于二级索引查询∧一般情况下，二级索引扫描优先于全表扫描∧.可以使用通过索引避免排序代价', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1080, '567da1997e65d6c26d483636a9850089', 85, '异常信息应该包括两类信息：案发现场信息和异常堆栈信息∧日志文件推荐至少保存15天，因为有些异常具备以“周”为频次发生的特点∧避免重复打印日志，浪费磁盘空间，务必在log4j.xml中设置additivity=false∧错误日志和业务日志尽量分开存放', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1081, '567da1997e65d6c26d483636a9850089', 86, '查询语句WHERE date_format(gmt_create, ‘%Y-%m-%d’) = \'2016-11-11’无法利用gmt_create索引∧索引字段使用时不能进行函数运算', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1082, '567da1997e65d6c26d483636a9850089', 87, '对varchar类型的字段建立索引，必须指定索引长度∧业务上具有唯一特性的字段（含组合字段），必须指定唯一索引∧建复合索引时，一般选择区分度高的字段放在最左列', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1083, '567da1997e65d6c26d483636a9850089', 88, '对于Service类，内部的实现类加Impl的后缀与接口区别。例如：ProductServiceImpl实现ProductService接口∧对于Service类，基于SOA的理念，是以接口方式暴露服务∧尽量不在接口里定义变量，如果一定要定义变量，肯定是与接口方法相关，而且是整个应用的基础常量', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1084, '567da1997e65d6c26d483636a9850089', 90, '向公司外部提供的http/api接口，推荐使用“错误码”方式返回异常或者错误信息∧对于应用内部的方法调用，推荐使用“抛出异常”的方式处理异常或者错误信息∧跨应用的RPC调用，推荐使用将“错误码”和“错误简短信息”封装成Result的方式进行返回∧对外提供的接口，一定要保证逻辑健壮性：尽量避免空指针等技术类异常；对于业务类异常要做好错误码或者异常信息的封装', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1085, '567da1997e65d6c26d483636a9850089', 91, '订单详情页面∧类目管理后台∧店铺装修后台∧订单付款页面', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1086, '567da1997e65d6c26d483636a9850089', 92, '定义明确的sql查询语句，通过传入参数start和size来实现分页逻辑∧分页查询，当统计的count为0时，应该直接返回，不要再执行分页查询语句', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1087, '567da1997e65d6c26d483636a9850089', 94, '使用volatile关键字∧使用synchronized关键字给对象的读写操作加锁∧如果是基本类型，推荐使用java.util.concurrent.atomic包下面提供的线程安全的基本类型包装类，例如AtomicInteger∧如果是集合，推荐使用java.util.concurrent提供的并发集合类，例如：ConcurrentHashMap', 0, 0.00);
INSERT INTO `exam_question_record` VALUES (1088, '567da1997e65d6c26d483636a9850089', 95, '运算符与下文一起换行，方法调用的点符号与下文一起换行。 .append()∧在多个参数超长，逗号后进行换行∧在括号前不要换行', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1089, '567da1997e65d6c26d483636a9850089', 97, 'sql查询条件 where a like ‘阿里%’ ,a列创建了索引，一般会使用索引进行检索∧sql查询条件 where a like ‘%阿里%’ ，不会走索引∧关于explain的结果，type=index的索引效率好于type=ref∧使用索引的效率一定高于全表扫描的效率', 0, 0.00);
INSERT INTO `exam_question_record` VALUES (1090, '567da1997e65d6c26d483636a9850089', 98, '能够减少在创建和销毁线程上所花的时间以及系统资源的开销∧线程资源必须通过线程池提供，不允许在应用中自行显式创建线程∧线程池能够根据资源等待情况，自动调整线程优先级并解决死锁问题', 0, 0.00);
INSERT INTO `exam_question_record` VALUES (1091, '567da1997e65d6c26d483636a9850089', 99, '主键查询优先于二级索引查询。∧一般情况下，二级索引扫描优先于全表扫描∧可以使用通过索引避免排序代价', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1092, '567da1997e65d6c26d483636a9850089', 100, '那是测试同学干的事情。本文是开发手册，凡是本文内容都是与开发同学强相关的∧单元测试代码是多余的。系统的整体功能与各单元部件的测试正常与否是强相关的∧单元测试代码不需要维护。一年半载后，那么单元测试几乎处于废弃状态∧单元测试与线上故障没有辩证关系。好的单元测试能够最大限度地规避线上故障', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1126, '5bb07ae8f31e1154a7d59bc10326d31a', 2, 'TCP', 1, 2.00);
INSERT INTO `exam_question_record` VALUES (1127, '5bb07ae8f31e1154a7d59bc10326d31a', 19, '（SYN=1,ACK=1,seq=2001,ack=2001）', 1, 2.00);
INSERT INTO `exam_question_record` VALUES (1128, '5bb07ae8f31e1154a7d59bc10326d31a', 25, '双绞线', 1, 2.00);
INSERT INTO `exam_question_record` VALUES (1129, '5bb07ae8f31e1154a7d59bc10326d31a', 30, '交换机从路由表中提取设备的MAC地址', 0, 0.00);
INSERT INTO `exam_question_record` VALUES (1130, '5bb07ae8f31e1154a7d59bc10326d31a', 3, '广域网∧城域网∧局域网', 1, 4.00);
INSERT INTO `exam_question_record` VALUES (1131, '5bb07ae8f31e1154a7d59bc10326d31a', 5, '1', 1, 2.00);
INSERT INTO `exam_question_record` VALUES (1132, '5bb07ae8f31e1154a7d59bc10326d31a', 39, '0', 1, 2.00);
INSERT INTO `exam_question_record` VALUES (1133, '5bb07ae8f31e1154a7d59bc10326d31a', 53, '我tm中的吗', 0, 0.00);
INSERT INTO `exam_question_record` VALUES (1134, '5bb07ae8f31e1154a7d59bc10326d31a', 58, '网络号∧主机号', 1, 3.00);
INSERT INTO `exam_question_record` VALUES (1135, '5bb07ae8f31e1154a7d59bc10326d31a', 69, '不知呀', 0, 0.00);
INSERT INTO `exam_question_record` VALUES (1136, '5bb07ae8f31e1154a7d59bc10326d31a', 6, '上网打游戏', 0, 0.00);

-- ----------------------------
-- Table structure for exam_question_type
-- ----------------------------
DROP TABLE IF EXISTS `exam_question_type`;
CREATE TABLE `exam_question_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '分类名称',
  `sort` int(10) NULL DEFAULT 0 COMMENT '排序字段',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除0未删除1以删除',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '题目类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_question_type
-- ----------------------------
INSERT INTO `exam_question_type` VALUES (1, '单选题', 1, '单选题', 0, '000000', NULL, '2023-01-07 13:37:34', NULL);
INSERT INTO `exam_question_type` VALUES (2, '多选题', 2, '多选题', 0, '000000', NULL, '2023-01-07 13:37:37', NULL);
INSERT INTO `exam_question_type` VALUES (3, '填空题', 4, '填空题', 0, '000000', NULL, '2023-01-07 13:37:39', NULL);
INSERT INTO `exam_question_type` VALUES (4, '判断题', 3, '判断题', 0, '000000', NULL, '2023-01-07 13:37:42', NULL);
INSERT INTO `exam_question_type` VALUES (5, '简答题', 5, '简答题', 0, '000000', NULL, '2023-01-07 13:37:44', NULL);

-- ----------------------------
-- Table structure for exam_stu_score
-- ----------------------------
DROP TABLE IF EXISTS `exam_stu_score`;
CREATE TABLE `exam_stu_score`  (
  `id` int(11) NOT NULL,
  `stu_no` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学号',
  `paper_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '试卷id',
  `score` float(10, 0) NULL DEFAULT NULL COMMENT '得分',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除0未删除1以删除',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '学生分数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_stu_score
-- ----------------------------

-- ----------------------------
-- Table structure for exam_student
-- ----------------------------
DROP TABLE IF EXISTS `exam_student`;
CREATE TABLE `exam_student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stu_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学号',
  `stu_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '年级',
  `major` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专业',
  `clazz` int(11) NULL DEFAULT NULL COMMENT '班级',
  `institute` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学院',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话号码',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电子邮件',
  `pwd` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `cardId` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除0未删除1以删除',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '学生信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_student
-- ----------------------------
INSERT INTO `exam_student` VALUES (1, '2131010618', '木子', '2021级', '1', 6, '人工智能与大数据', '12012012012', '142079466@exam.niubi', '123456', '111111111111111111', '女', '测试', 0, '5201314', '5201314', '2023-01-07 11:35:34', '2023-01-07 13:23:03');
INSERT INTO `exam_student` VALUES (2, '2131010617', '荒', '', '1', 6, '人工智能与大数据', '11111111111', '111@exam.test', '123456', '11', '男', '', 0, '5201314', '', '2023-01-07 13:22:29', NULL);
INSERT INTO `exam_student` VALUES (3, '2131010100', '伊邪那岐', '', '1', 1, '人工智能与大数据', '123', '666@test.test', '123456', '456', '女', '', 0, '5201314', '', '2023-01-07 13:26:47', NULL);
INSERT INTO `exam_student` VALUES (4, '2131010101', '季', '', '1', 1, '人工智能与大数据', '111', '111', '123456', '111', '女', '', 0, '5201314', '', '2023-01-07 13:34:34', NULL);

-- ----------------------------
-- Table structure for exam_subject
-- ----------------------------
DROP TABLE IF EXISTS `exam_subject`;
CREATE TABLE `exam_subject`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '课程名称',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '逻辑删除0未删除1以删除',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '课程科目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_subject
-- ----------------------------
INSERT INTO `exam_subject` VALUES (1, '计算机网络', '测试', 0, '5201314', '', '2023-01-07 13:54:28', NULL);
INSERT INTO `exam_subject` VALUES (2, '数据结构', '', 0, '5201314', '', '2023-01-07 13:55:08', NULL);
INSERT INTO `exam_subject` VALUES (3, '编码规范', '阿里编码规范', 0, '5201314', '', '2023-01-17 16:14:31', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018586F364407874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'LAPTOP-LOIKAIFV1675042585334', 1675062058266, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1675063800000, 1675062000000, 5, 'WAITING', 'CRON', 1673006532000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018586F364407874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2023-01-06 19:59:36');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 340 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-06 20:30:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-06 21:00:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-06 22:00:00');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-06 22:30:00');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-06 23:00:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-06 23:30:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 89, '2023-01-07 00:00:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 00:30:00');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 01:00:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 01:30:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 02:00:00');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 02:30:00');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 03:00:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 03:30:00');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 04:00:00');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 04:30:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 05:00:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 05:30:00');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 06:00:00');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 06:30:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 07:00:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 07:30:00');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 08:00:00');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 08:30:00');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 09:00:00');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 09:30:00');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 10:00:00');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 10:30:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 11:00:00');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 11:30:00');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 12:00:00');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 12:30:00');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 13:00:00');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 13:30:00');
INSERT INTO `schedule_job_log` VALUES (35, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 14:00:00');
INSERT INTO `schedule_job_log` VALUES (36, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 14:30:00');
INSERT INTO `schedule_job_log` VALUES (37, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 15:00:00');
INSERT INTO `schedule_job_log` VALUES (38, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 15:30:00');
INSERT INTO `schedule_job_log` VALUES (39, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 16:00:00');
INSERT INTO `schedule_job_log` VALUES (40, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 16:30:00');
INSERT INTO `schedule_job_log` VALUES (41, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 17:00:00');
INSERT INTO `schedule_job_log` VALUES (42, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 17:30:00');
INSERT INTO `schedule_job_log` VALUES (43, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 18:00:00');
INSERT INTO `schedule_job_log` VALUES (44, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 18:30:00');
INSERT INTO `schedule_job_log` VALUES (45, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 19:00:00');
INSERT INTO `schedule_job_log` VALUES (46, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 19:30:00');
INSERT INTO `schedule_job_log` VALUES (47, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 20:00:00');
INSERT INTO `schedule_job_log` VALUES (48, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 20:30:00');
INSERT INTO `schedule_job_log` VALUES (49, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 21:00:00');
INSERT INTO `schedule_job_log` VALUES (50, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 21:30:00');
INSERT INTO `schedule_job_log` VALUES (51, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 22:00:00');
INSERT INTO `schedule_job_log` VALUES (52, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-07 22:30:00');
INSERT INTO `schedule_job_log` VALUES (53, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 23:00:00');
INSERT INTO `schedule_job_log` VALUES (54, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-07 23:30:00');
INSERT INTO `schedule_job_log` VALUES (55, 1, 'testTask', 'renren', 0, NULL, 82, '2023-01-08 00:00:00');
INSERT INTO `schedule_job_log` VALUES (56, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 00:30:00');
INSERT INTO `schedule_job_log` VALUES (57, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 01:00:00');
INSERT INTO `schedule_job_log` VALUES (58, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 01:30:00');
INSERT INTO `schedule_job_log` VALUES (59, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 02:00:00');
INSERT INTO `schedule_job_log` VALUES (60, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 02:30:00');
INSERT INTO `schedule_job_log` VALUES (61, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 03:00:00');
INSERT INTO `schedule_job_log` VALUES (62, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 03:30:00');
INSERT INTO `schedule_job_log` VALUES (63, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 04:00:00');
INSERT INTO `schedule_job_log` VALUES (64, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 04:30:00');
INSERT INTO `schedule_job_log` VALUES (65, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 05:00:00');
INSERT INTO `schedule_job_log` VALUES (66, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 05:30:00');
INSERT INTO `schedule_job_log` VALUES (67, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 06:00:00');
INSERT INTO `schedule_job_log` VALUES (68, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 06:30:00');
INSERT INTO `schedule_job_log` VALUES (69, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 07:00:00');
INSERT INTO `schedule_job_log` VALUES (70, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 07:30:00');
INSERT INTO `schedule_job_log` VALUES (71, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 08:00:00');
INSERT INTO `schedule_job_log` VALUES (72, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 08:30:00');
INSERT INTO `schedule_job_log` VALUES (73, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 09:00:00');
INSERT INTO `schedule_job_log` VALUES (74, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 09:30:00');
INSERT INTO `schedule_job_log` VALUES (75, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 10:00:00');
INSERT INTO `schedule_job_log` VALUES (76, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 10:30:00');
INSERT INTO `schedule_job_log` VALUES (77, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 11:00:00');
INSERT INTO `schedule_job_log` VALUES (78, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 11:30:00');
INSERT INTO `schedule_job_log` VALUES (79, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 12:00:00');
INSERT INTO `schedule_job_log` VALUES (80, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 12:30:00');
INSERT INTO `schedule_job_log` VALUES (81, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 13:00:00');
INSERT INTO `schedule_job_log` VALUES (82, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 13:30:00');
INSERT INTO `schedule_job_log` VALUES (83, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 14:00:00');
INSERT INTO `schedule_job_log` VALUES (84, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 14:30:00');
INSERT INTO `schedule_job_log` VALUES (85, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 15:00:00');
INSERT INTO `schedule_job_log` VALUES (86, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 15:30:00');
INSERT INTO `schedule_job_log` VALUES (87, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 16:00:00');
INSERT INTO `schedule_job_log` VALUES (88, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 16:30:00');
INSERT INTO `schedule_job_log` VALUES (89, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 17:30:00');
INSERT INTO `schedule_job_log` VALUES (90, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 18:00:00');
INSERT INTO `schedule_job_log` VALUES (91, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 18:30:00');
INSERT INTO `schedule_job_log` VALUES (92, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-08 19:00:00');
INSERT INTO `schedule_job_log` VALUES (93, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 19:30:00');
INSERT INTO `schedule_job_log` VALUES (94, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 20:00:00');
INSERT INTO `schedule_job_log` VALUES (95, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 20:30:00');
INSERT INTO `schedule_job_log` VALUES (96, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-08 21:00:00');
INSERT INTO `schedule_job_log` VALUES (97, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 09:00:00');
INSERT INTO `schedule_job_log` VALUES (98, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 09:30:00');
INSERT INTO `schedule_job_log` VALUES (99, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 10:30:00');
INSERT INTO `schedule_job_log` VALUES (100, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 11:00:00');
INSERT INTO `schedule_job_log` VALUES (101, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 11:30:00');
INSERT INTO `schedule_job_log` VALUES (102, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-09 12:00:00');
INSERT INTO `schedule_job_log` VALUES (103, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-09 12:30:00');
INSERT INTO `schedule_job_log` VALUES (104, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 13:00:00');
INSERT INTO `schedule_job_log` VALUES (105, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 13:30:00');
INSERT INTO `schedule_job_log` VALUES (106, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-09 14:00:00');
INSERT INTO `schedule_job_log` VALUES (107, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 14:30:00');
INSERT INTO `schedule_job_log` VALUES (108, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 15:30:00');
INSERT INTO `schedule_job_log` VALUES (109, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-09 16:00:00');
INSERT INTO `schedule_job_log` VALUES (110, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 16:30:00');
INSERT INTO `schedule_job_log` VALUES (111, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 17:00:00');
INSERT INTO `schedule_job_log` VALUES (112, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 17:30:00');
INSERT INTO `schedule_job_log` VALUES (113, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 18:00:00');
INSERT INTO `schedule_job_log` VALUES (114, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-09 18:30:00');
INSERT INTO `schedule_job_log` VALUES (115, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-09 19:00:00');
INSERT INTO `schedule_job_log` VALUES (116, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-13 21:00:00');
INSERT INTO `schedule_job_log` VALUES (117, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-13 21:30:00');
INSERT INTO `schedule_job_log` VALUES (118, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-13 22:00:00');
INSERT INTO `schedule_job_log` VALUES (119, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-13 22:30:00');
INSERT INTO `schedule_job_log` VALUES (120, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-15 11:00:00');
INSERT INTO `schedule_job_log` VALUES (121, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-15 11:30:00');
INSERT INTO `schedule_job_log` VALUES (122, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-15 12:00:00');
INSERT INTO `schedule_job_log` VALUES (123, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-15 12:30:00');
INSERT INTO `schedule_job_log` VALUES (124, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-15 13:00:00');
INSERT INTO `schedule_job_log` VALUES (125, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-15 13:30:00');
INSERT INTO `schedule_job_log` VALUES (126, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-15 14:00:00');
INSERT INTO `schedule_job_log` VALUES (127, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-15 14:30:00');
INSERT INTO `schedule_job_log` VALUES (128, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-15 15:00:00');
INSERT INTO `schedule_job_log` VALUES (129, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-15 15:30:00');
INSERT INTO `schedule_job_log` VALUES (130, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-15 16:00:00');
INSERT INTO `schedule_job_log` VALUES (131, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-15 16:30:00');
INSERT INTO `schedule_job_log` VALUES (132, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-15 17:00:00');
INSERT INTO `schedule_job_log` VALUES (133, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-15 17:30:00');
INSERT INTO `schedule_job_log` VALUES (134, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-15 18:00:00');
INSERT INTO `schedule_job_log` VALUES (135, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-15 18:30:00');
INSERT INTO `schedule_job_log` VALUES (136, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 10:00:00');
INSERT INTO `schedule_job_log` VALUES (137, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 10:30:00');
INSERT INTO `schedule_job_log` VALUES (138, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 11:00:00');
INSERT INTO `schedule_job_log` VALUES (139, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 11:30:00');
INSERT INTO `schedule_job_log` VALUES (140, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 12:00:00');
INSERT INTO `schedule_job_log` VALUES (141, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 12:30:00');
INSERT INTO `schedule_job_log` VALUES (142, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 13:00:00');
INSERT INTO `schedule_job_log` VALUES (143, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 13:30:00');
INSERT INTO `schedule_job_log` VALUES (144, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 14:00:00');
INSERT INTO `schedule_job_log` VALUES (145, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 14:30:00');
INSERT INTO `schedule_job_log` VALUES (146, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 15:00:00');
INSERT INTO `schedule_job_log` VALUES (147, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 15:30:00');
INSERT INTO `schedule_job_log` VALUES (148, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 16:00:00');
INSERT INTO `schedule_job_log` VALUES (149, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 16:30:00');
INSERT INTO `schedule_job_log` VALUES (150, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 17:00:00');
INSERT INTO `schedule_job_log` VALUES (151, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 17:30:00');
INSERT INTO `schedule_job_log` VALUES (152, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 18:00:00');
INSERT INTO `schedule_job_log` VALUES (153, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 18:30:00');
INSERT INTO `schedule_job_log` VALUES (154, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 19:00:00');
INSERT INTO `schedule_job_log` VALUES (155, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 19:30:00');
INSERT INTO `schedule_job_log` VALUES (156, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 20:00:00');
INSERT INTO `schedule_job_log` VALUES (157, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 20:30:00');
INSERT INTO `schedule_job_log` VALUES (158, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 21:00:00');
INSERT INTO `schedule_job_log` VALUES (159, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 21:30:00');
INSERT INTO `schedule_job_log` VALUES (160, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 22:00:00');
INSERT INTO `schedule_job_log` VALUES (161, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-17 22:30:00');
INSERT INTO `schedule_job_log` VALUES (162, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 23:00:00');
INSERT INTO `schedule_job_log` VALUES (163, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-17 23:30:00');
INSERT INTO `schedule_job_log` VALUES (164, 1, 'testTask', 'renren', 0, NULL, 6, '2023-01-18 00:00:00');
INSERT INTO `schedule_job_log` VALUES (165, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 00:30:00');
INSERT INTO `schedule_job_log` VALUES (166, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 01:00:00');
INSERT INTO `schedule_job_log` VALUES (167, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 01:30:00');
INSERT INTO `schedule_job_log` VALUES (168, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 02:00:00');
INSERT INTO `schedule_job_log` VALUES (169, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 02:30:00');
INSERT INTO `schedule_job_log` VALUES (170, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 03:00:00');
INSERT INTO `schedule_job_log` VALUES (171, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 03:30:00');
INSERT INTO `schedule_job_log` VALUES (172, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 04:00:00');
INSERT INTO `schedule_job_log` VALUES (173, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 04:30:00');
INSERT INTO `schedule_job_log` VALUES (174, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 05:00:00');
INSERT INTO `schedule_job_log` VALUES (175, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 05:30:00');
INSERT INTO `schedule_job_log` VALUES (176, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 06:00:00');
INSERT INTO `schedule_job_log` VALUES (177, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 06:30:00');
INSERT INTO `schedule_job_log` VALUES (178, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 07:00:00');
INSERT INTO `schedule_job_log` VALUES (179, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 07:30:00');
INSERT INTO `schedule_job_log` VALUES (180, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 08:00:00');
INSERT INTO `schedule_job_log` VALUES (181, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 08:30:00');
INSERT INTO `schedule_job_log` VALUES (182, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 09:00:00');
INSERT INTO `schedule_job_log` VALUES (183, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 09:30:00');
INSERT INTO `schedule_job_log` VALUES (184, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 10:00:00');
INSERT INTO `schedule_job_log` VALUES (185, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 10:30:00');
INSERT INTO `schedule_job_log` VALUES (186, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 11:00:00');
INSERT INTO `schedule_job_log` VALUES (187, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 11:30:00');
INSERT INTO `schedule_job_log` VALUES (188, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 12:00:00');
INSERT INTO `schedule_job_log` VALUES (189, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 12:30:00');
INSERT INTO `schedule_job_log` VALUES (190, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 13:00:00');
INSERT INTO `schedule_job_log` VALUES (191, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 13:30:00');
INSERT INTO `schedule_job_log` VALUES (192, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 14:00:00');
INSERT INTO `schedule_job_log` VALUES (193, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 14:30:00');
INSERT INTO `schedule_job_log` VALUES (194, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 15:00:00');
INSERT INTO `schedule_job_log` VALUES (195, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 15:30:00');
INSERT INTO `schedule_job_log` VALUES (196, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 16:00:00');
INSERT INTO `schedule_job_log` VALUES (197, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 16:30:00');
INSERT INTO `schedule_job_log` VALUES (198, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 17:00:00');
INSERT INTO `schedule_job_log` VALUES (199, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 17:30:00');
INSERT INTO `schedule_job_log` VALUES (200, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 18:00:00');
INSERT INTO `schedule_job_log` VALUES (201, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 18:30:00');
INSERT INTO `schedule_job_log` VALUES (202, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 19:00:00');
INSERT INTO `schedule_job_log` VALUES (203, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 19:30:00');
INSERT INTO `schedule_job_log` VALUES (204, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 20:00:00');
INSERT INTO `schedule_job_log` VALUES (205, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 20:30:00');
INSERT INTO `schedule_job_log` VALUES (206, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 21:00:00');
INSERT INTO `schedule_job_log` VALUES (207, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 21:30:00');
INSERT INTO `schedule_job_log` VALUES (208, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 22:00:00');
INSERT INTO `schedule_job_log` VALUES (209, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 22:30:00');
INSERT INTO `schedule_job_log` VALUES (210, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-18 23:00:00');
INSERT INTO `schedule_job_log` VALUES (211, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-18 23:30:00');
INSERT INTO `schedule_job_log` VALUES (212, 1, 'testTask', 'renren', 0, NULL, 6, '2023-01-19 00:00:00');
INSERT INTO `schedule_job_log` VALUES (213, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-19 00:30:00');
INSERT INTO `schedule_job_log` VALUES (214, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-19 01:00:00');
INSERT INTO `schedule_job_log` VALUES (215, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 01:30:00');
INSERT INTO `schedule_job_log` VALUES (216, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 02:00:00');
INSERT INTO `schedule_job_log` VALUES (217, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 02:30:00');
INSERT INTO `schedule_job_log` VALUES (218, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 03:00:00');
INSERT INTO `schedule_job_log` VALUES (219, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 03:30:00');
INSERT INTO `schedule_job_log` VALUES (220, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 04:00:00');
INSERT INTO `schedule_job_log` VALUES (221, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-19 04:30:00');
INSERT INTO `schedule_job_log` VALUES (222, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 05:00:00');
INSERT INTO `schedule_job_log` VALUES (223, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-19 05:30:00');
INSERT INTO `schedule_job_log` VALUES (224, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-19 06:00:00');
INSERT INTO `schedule_job_log` VALUES (225, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-19 06:30:00');
INSERT INTO `schedule_job_log` VALUES (226, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 07:00:00');
INSERT INTO `schedule_job_log` VALUES (227, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-19 07:30:00');
INSERT INTO `schedule_job_log` VALUES (228, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-19 08:00:00');
INSERT INTO `schedule_job_log` VALUES (229, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-19 08:30:00');
INSERT INTO `schedule_job_log` VALUES (230, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 09:00:00');
INSERT INTO `schedule_job_log` VALUES (231, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 09:30:00');
INSERT INTO `schedule_job_log` VALUES (232, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 10:00:00');
INSERT INTO `schedule_job_log` VALUES (233, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 10:30:00');
INSERT INTO `schedule_job_log` VALUES (234, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 11:00:00');
INSERT INTO `schedule_job_log` VALUES (235, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 11:30:00');
INSERT INTO `schedule_job_log` VALUES (236, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-19 12:00:00');
INSERT INTO `schedule_job_log` VALUES (237, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 12:30:00');
INSERT INTO `schedule_job_log` VALUES (238, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 13:00:00');
INSERT INTO `schedule_job_log` VALUES (239, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 13:30:00');
INSERT INTO `schedule_job_log` VALUES (240, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 14:00:00');
INSERT INTO `schedule_job_log` VALUES (241, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES (242, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES (243, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES (244, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 16:00:00');
INSERT INTO `schedule_job_log` VALUES (245, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES (246, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES (247, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES (248, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-19 18:00:00');
INSERT INTO `schedule_job_log` VALUES (249, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-20 09:30:00');
INSERT INTO `schedule_job_log` VALUES (250, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-20 10:00:00');
INSERT INTO `schedule_job_log` VALUES (251, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-20 10:30:00');
INSERT INTO `schedule_job_log` VALUES (252, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-20 11:00:00');
INSERT INTO `schedule_job_log` VALUES (253, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-20 11:30:00');
INSERT INTO `schedule_job_log` VALUES (254, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-20 12:00:00');
INSERT INTO `schedule_job_log` VALUES (255, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-20 12:30:00');
INSERT INTO `schedule_job_log` VALUES (256, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-20 13:00:00');
INSERT INTO `schedule_job_log` VALUES (257, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-20 13:30:00');
INSERT INTO `schedule_job_log` VALUES (258, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-21 15:30:00');
INSERT INTO `schedule_job_log` VALUES (259, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-21 16:00:00');
INSERT INTO `schedule_job_log` VALUES (260, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-21 16:30:00');
INSERT INTO `schedule_job_log` VALUES (261, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-21 17:00:00');
INSERT INTO `schedule_job_log` VALUES (262, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-21 17:30:00');
INSERT INTO `schedule_job_log` VALUES (263, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-21 18:00:00');
INSERT INTO `schedule_job_log` VALUES (264, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-21 18:30:00');
INSERT INTO `schedule_job_log` VALUES (265, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-21 19:00:00');
INSERT INTO `schedule_job_log` VALUES (266, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-21 19:30:00');
INSERT INTO `schedule_job_log` VALUES (267, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-21 20:30:00');
INSERT INTO `schedule_job_log` VALUES (268, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-21 21:00:00');
INSERT INTO `schedule_job_log` VALUES (269, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-21 21:30:00');
INSERT INTO `schedule_job_log` VALUES (270, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-21 22:00:00');
INSERT INTO `schedule_job_log` VALUES (271, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-21 22:30:00');
INSERT INTO `schedule_job_log` VALUES (272, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-21 23:00:00');
INSERT INTO `schedule_job_log` VALUES (273, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-22 10:30:00');
INSERT INTO `schedule_job_log` VALUES (274, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-22 11:00:00');
INSERT INTO `schedule_job_log` VALUES (275, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-22 11:30:00');
INSERT INTO `schedule_job_log` VALUES (276, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-22 12:00:00');
INSERT INTO `schedule_job_log` VALUES (277, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-22 12:30:00');
INSERT INTO `schedule_job_log` VALUES (278, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-22 13:00:00');
INSERT INTO `schedule_job_log` VALUES (279, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-22 13:30:00');
INSERT INTO `schedule_job_log` VALUES (280, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-22 14:00:00');
INSERT INTO `schedule_job_log` VALUES (281, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-22 14:30:00');
INSERT INTO `schedule_job_log` VALUES (282, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-22 15:00:00');
INSERT INTO `schedule_job_log` VALUES (283, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-22 15:30:00');
INSERT INTO `schedule_job_log` VALUES (284, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-22 16:00:00');
INSERT INTO `schedule_job_log` VALUES (285, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-22 16:30:00');
INSERT INTO `schedule_job_log` VALUES (286, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-22 17:00:00');
INSERT INTO `schedule_job_log` VALUES (287, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-22 17:30:00');
INSERT INTO `schedule_job_log` VALUES (288, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-22 18:00:00');
INSERT INTO `schedule_job_log` VALUES (289, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-22 18:30:00');
INSERT INTO `schedule_job_log` VALUES (290, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-22 19:00:00');
INSERT INTO `schedule_job_log` VALUES (291, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-22 19:30:00');
INSERT INTO `schedule_job_log` VALUES (292, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-24 15:30:00');
INSERT INTO `schedule_job_log` VALUES (293, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-24 16:00:00');
INSERT INTO `schedule_job_log` VALUES (294, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-24 16:30:00');
INSERT INTO `schedule_job_log` VALUES (295, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-25 14:30:00');
INSERT INTO `schedule_job_log` VALUES (296, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-25 15:00:00');
INSERT INTO `schedule_job_log` VALUES (297, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-25 15:30:00');
INSERT INTO `schedule_job_log` VALUES (298, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-28 09:00:00');
INSERT INTO `schedule_job_log` VALUES (299, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-28 09:30:00');
INSERT INTO `schedule_job_log` VALUES (300, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-28 10:00:00');
INSERT INTO `schedule_job_log` VALUES (301, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-28 10:30:00');
INSERT INTO `schedule_job_log` VALUES (302, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-28 11:00:00');
INSERT INTO `schedule_job_log` VALUES (303, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-28 11:30:00');
INSERT INTO `schedule_job_log` VALUES (304, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-28 12:00:00');
INSERT INTO `schedule_job_log` VALUES (305, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-28 12:30:00');
INSERT INTO `schedule_job_log` VALUES (306, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-28 13:00:00');
INSERT INTO `schedule_job_log` VALUES (307, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-28 13:30:00');
INSERT INTO `schedule_job_log` VALUES (308, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-28 14:00:00');
INSERT INTO `schedule_job_log` VALUES (309, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-28 14:30:00');
INSERT INTO `schedule_job_log` VALUES (310, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-28 15:00:00');
INSERT INTO `schedule_job_log` VALUES (311, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-28 16:00:00');
INSERT INTO `schedule_job_log` VALUES (312, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-29 09:30:00');
INSERT INTO `schedule_job_log` VALUES (313, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-29 10:00:00');
INSERT INTO `schedule_job_log` VALUES (314, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-29 11:30:00');
INSERT INTO `schedule_job_log` VALUES (315, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-29 12:00:00');
INSERT INTO `schedule_job_log` VALUES (316, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-29 12:30:00');
INSERT INTO `schedule_job_log` VALUES (317, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-29 13:00:00');
INSERT INTO `schedule_job_log` VALUES (318, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-29 13:30:00');
INSERT INTO `schedule_job_log` VALUES (319, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-29 14:00:00');
INSERT INTO `schedule_job_log` VALUES (320, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-29 14:30:00');
INSERT INTO `schedule_job_log` VALUES (321, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-29 15:00:00');
INSERT INTO `schedule_job_log` VALUES (322, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-29 15:30:00');
INSERT INTO `schedule_job_log` VALUES (323, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-29 16:00:00');
INSERT INTO `schedule_job_log` VALUES (324, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-29 16:30:00');
INSERT INTO `schedule_job_log` VALUES (325, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-29 17:00:00');
INSERT INTO `schedule_job_log` VALUES (326, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-29 17:30:00');
INSERT INTO `schedule_job_log` VALUES (327, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-29 18:00:00');
INSERT INTO `schedule_job_log` VALUES (328, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-30 09:00:00');
INSERT INTO `schedule_job_log` VALUES (329, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-30 09:30:00');
INSERT INTO `schedule_job_log` VALUES (330, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-30 10:00:00');
INSERT INTO `schedule_job_log` VALUES (331, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-30 10:30:00');
INSERT INTO `schedule_job_log` VALUES (332, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-30 11:00:00');
INSERT INTO `schedule_job_log` VALUES (333, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-30 11:30:00');
INSERT INTO `schedule_job_log` VALUES (334, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-30 12:00:00');
INSERT INTO `schedule_job_log` VALUES (335, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-30 12:30:00');
INSERT INTO `schedule_job_log` VALUES (336, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-30 13:00:00');
INSERT INTO `schedule_job_log` VALUES (337, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-30 13:30:00');
INSERT INTO `schedule_job_log` VALUES (338, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-30 14:00:00');
INSERT INTO `schedule_job_log` VALUES (339, 1, 'testTask', 'renren', 0, NULL, 1, '2023-01-30 14:30:00');
INSERT INTO `schedule_job_log` VALUES (340, 1, 'testTask', 'renren', 0, NULL, 0, '2023-01-30 15:00:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('19e97c18-4c82-4f6d-8844-b6673eab1d69', 'mfgnn', '2023-01-07 11:09:10');
INSERT INTO `sys_captcha` VALUES ('7c511a60-031a-4b41-89d2-5d6d28f0c410', 'fnfpb', '2023-01-24 15:09:27');
INSERT INTO `sys_captcha` VALUES ('aabcdbfb-9d04-4e27-8a59-19d2f249904f', '5cp44', '2023-01-07 11:35:51');
INSERT INTO `sys_captcha` VALUES ('e2acb26c-36df-4235-8192-5f3d533503a9', 'gwby2', '2023-01-29 10:02:38');
INSERT INTO `sys_captcha` VALUES ('f961d28c-5593-42b2-80ed-8cc7fd8b2264', '8e2e6', '2023-01-07 12:39:47');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"学生管理\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0,\"list\":[]}]', 9, '0:0:0:0:0:0:0:1', '2023-01-06 22:30:13');
INSERT INTO `sys_log` VALUES (2, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"学生列表\",\"url\":\"exam/student\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 10, '0:0:0:0:0:0:0:1', '2023-01-06 22:31:37');
INSERT INTO `sys_log` VALUES (3, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":31,\"name\":\"专业列表\",\"url\":\"exam/major\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 9, '0:0:0:0:0:0:0:1', '2023-01-06 22:32:21');
INSERT INTO `sys_log` VALUES (4, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":0,\"name\":\"试卷管理\",\"type\":0,\"icon\":\"log\",\"orderNum\":0,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2023-01-06 22:39:33');
INSERT INTO `sys_log` VALUES (5, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":34,\"name\":\"试卷列表\",\"url\":\"exam/paper\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 10, '0:0:0:0:0:0:0:1', '2023-01-06 22:40:28');
INSERT INTO `sys_log` VALUES (6, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":34,\"name\":\"题目列表\",\"url\":\"exam/question\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2023-01-06 22:41:27');
INSERT INTO `sys_log` VALUES (7, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":37,\"parentId\":34,\"name\":\"题目分类\",\"url\":\"exam/questiontype\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 9, '0:0:0:0:0:0:0:1', '2023-01-06 22:41:54');
INSERT INTO `sys_log` VALUES (8, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":31,\"name\":\"学分分数列表\",\"url\":\"exam/stuscore\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2023-01-06 22:43:18');
INSERT INTO `sys_log` VALUES (9, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":31,\"name\":\"课程科目\",\"url\":\"exam/subject\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2023-01-06 22:48:35');
INSERT INTO `sys_log` VALUES (10, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":40,\"parentId\":32,\"name\":\"新增\",\"url\":\"\",\"perms\":\"exam:student:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 12, '0:0:0:0:0:0:0:1', '2023-01-06 23:01:32');
INSERT INTO `sys_log` VALUES (11, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":32,\"name\":\"删除\",\"url\":\"\",\"perms\":\"exam:student:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 10, '0:0:0:0:0:0:0:1', '2023-01-06 23:02:04');
INSERT INTO `sys_log` VALUES (12, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":42,\"parentId\":33,\"name\":\"新增\",\"url\":\"\",\"perms\":\"exam:major:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 14, '0:0:0:0:0:0:0:1', '2023-01-06 23:14:31');
INSERT INTO `sys_log` VALUES (13, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":43,\"parentId\":33,\"name\":\"删除\",\"url\":\"\",\"perms\":\"exam:major:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 9, '0:0:0:0:0:0:0:1', '2023-01-06 23:14:42');
INSERT INTO `sys_log` VALUES (14, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"管理员\",\"remark\":\"管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,31,32,40,41,33,42,43,38,39,34,35,36,37,-666666],\"createTime\":\"Jan 7, 2023 9:44:28 AM\"}]', 264, '0:0:0:0:0:0:0:1', '2023-01-07 09:44:29');
INSERT INTO `sys_log` VALUES (15, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"教师\",\"remark\":\"出题教师\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,34,35,36,37,-666666],\"createTime\":\"Jan 7, 2023 9:46:51 AM\"}]', 25, '0:0:0:0:0:0:0:1', '2023-01-07 09:46:51');
INSERT INTO `sys_log` VALUES (16, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":3,\"roleName\":\"审核人\",\"remark\":\"试卷审核人\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,34,35,36,37,-666666],\"createTime\":\"Jan 7, 2023 9:47:40 AM\"}]', 23, '0:0:0:0:0:0:0:1', '2023-01-07 09:47:40');
INSERT INTO `sys_log` VALUES (17, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"5201314\",\"password\":\"fce916ecbc40f78c37f3b226c395b7da2aa0b8c000dc4ad3ede64d49eba838f8\",\"salt\":\"slHW7OHjvLygNvD8Uwvu\",\"email\":\"1420794684@qq.com\",\"mobile\":\"12012012012\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Jan 7, 2023 9:48:48 AM\"}]', 126, '0:0:0:0:0:0:0:1', '2023-01-07 09:48:49');
INSERT INTO `sys_log` VALUES (18, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"5201314\",\"salt\":\"slHW7OHjvLygNvD8Uwvu\",\"email\":\"1420794684@qq.com\",\"mobile\":\"12012012012\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]', 81, '0:0:0:0:0:0:0:1', '2023-01-07 10:29:18');
INSERT INTO `sys_log` VALUES (19, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"5201314\",\"salt\":\"slHW7OHjvLygNvD8Uwvu\",\"email\":\"1420794684@qq.com\",\"mobile\":\"12012012012\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]', 82, '0:0:0:0:0:0:0:1', '2023-01-07 10:31:43');
INSERT INTO `sys_log` VALUES (20, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"5201314\",\"workNo\":\"5201314\",\"realName\":\"栗子\",\"salt\":\"slHW7OHjvLygNvD8Uwvu\",\"email\":\"1420794684@qq.com\",\"mobile\":\"12012012012\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]', 14, '0:0:0:0:0:0:0:1', '2023-01-07 10:33:37');
INSERT INTO `sys_log` VALUES (21, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":44,\"parentId\":31,\"name\":\"年级课程\",\"url\":\"exam/class\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 7, '0:0:0:0:0:0:0:1', '2023-01-07 12:36:03');
INSERT INTO `sys_log` VALUES (22, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"教师\",\"remark\":\"出题教师\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,44,34,35,36,37,-666666]}]', 198, '0:0:0:0:0:0:0:1', '2023-01-07 12:37:49');
INSERT INTO `sys_log` VALUES (23, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"审核人\",\"remark\":\"试卷审核人\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,44,34,35,36,37,-666666]}]', 20, '0:0:0:0:0:0:0:1', '2023-01-07 12:37:56');
INSERT INTO `sys_log` VALUES (24, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":44,\"parentId\":31,\"name\":\"年级课程\",\"url\":\"exam/clazz\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-01-07 12:46:32');
INSERT INTO `sys_log` VALUES (25, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":45,\"parentId\":44,\"name\":\"新增\",\"url\":\"\",\"perms\":\"exam:clazz:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 10, '0:0:0:0:0:0:0:1', '2023-01-07 12:49:16');
INSERT INTO `sys_log` VALUES (26, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":46,\"parentId\":44,\"name\":\"删除\",\"url\":\"\",\"perms\":\"exam:clazz:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2023-01-07 12:49:28');
INSERT INTO `sys_log` VALUES (27, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"教师\",\"remark\":\"出题教师\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,44,45,46,34,35,36,37,-666666]}]', 91, '0:0:0:0:0:0:0:1', '2023-01-07 12:49:37');
INSERT INTO `sys_log` VALUES (28, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"审核人\",\"remark\":\"试卷审核人\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,44,45,46,34,35,36,37,-666666]}]', 30, '0:0:0:0:0:0:0:1', '2023-01-07 12:49:43');
INSERT INTO `sys_log` VALUES (29, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":47,\"parentId\":39,\"name\":\"新增\",\"url\":\"\",\"perms\":\"exam:subject:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-01-07 13:38:48');
INSERT INTO `sys_log` VALUES (30, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":48,\"parentId\":39,\"name\":\"删除\",\"url\":\"\",\"perms\":\"exam:subject:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 9, '0:0:0:0:0:0:0:1', '2023-01-07 13:39:02');
INSERT INTO `sys_log` VALUES (31, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"教师\",\"remark\":\"出题教师\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,47,48,44,45,46,34,35,36,37,-666666]}]', 85, '0:0:0:0:0:0:0:1', '2023-01-07 13:39:08');
INSERT INTO `sys_log` VALUES (32, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"审核人\",\"remark\":\"试卷审核人\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,47,48,44,45,46,34,35,36,37,-666666]}]', 30, '0:0:0:0:0:0:0:1', '2023-01-07 13:39:11');
INSERT INTO `sys_log` VALUES (33, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":49,\"parentId\":36,\"name\":\"新增\",\"url\":\"\",\"perms\":\"exam:question:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 12, '0:0:0:0:0:0:0:1', '2023-01-07 13:57:10');
INSERT INTO `sys_log` VALUES (34, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":50,\"parentId\":36,\"name\":\"删除\",\"url\":\"\",\"perms\":\"exam:question:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 25, '0:0:0:0:0:0:0:1', '2023-01-07 13:57:22');
INSERT INTO `sys_log` VALUES (35, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"教师\",\"remark\":\"出题教师\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,47,48,44,45,46,34,35,36,49,50,37,-666666]}]', 91, '0:0:0:0:0:0:0:1', '2023-01-07 13:57:28');
INSERT INTO `sys_log` VALUES (36, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"审核人\",\"remark\":\"试卷审核人\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,47,48,44,45,46,34,35,36,49,50,37,-666666]}]', 37, '0:0:0:0:0:0:0:1', '2023-01-07 13:57:32');
INSERT INTO `sys_log` VALUES (37, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":51,\"parentId\":35,\"name\":\"新增\",\"url\":\"\",\"perms\":\"exam:paper:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 16, '0:0:0:0:0:0:0:1', '2023-01-08 14:14:39');
INSERT INTO `sys_log` VALUES (38, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":52,\"parentId\":35,\"name\":\"删除\",\"url\":\"\",\"perms\":\"exam:paper:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2023-01-08 14:14:52');
INSERT INTO `sys_log` VALUES (39, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"教师\",\"remark\":\"出题教师\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,47,48,44,45,46,34,35,51,52,36,49,50,37,-666666]}]', 368, '0:0:0:0:0:0:0:1', '2023-01-08 14:14:58');
INSERT INTO `sys_log` VALUES (40, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"审核人\",\"remark\":\"试卷审核人\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,47,48,44,45,46,34,35,51,52,36,49,50,37,-666666]}]', 35, '0:0:0:0:0:0:0:1', '2023-01-08 14:15:02');
INSERT INTO `sys_log` VALUES (41, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":53,\"parentId\":34,\"name\":\"试卷审核\",\"url\":\"exam/checkPaper\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 10, '0:0:0:0:0:0:0:1', '2023-01-09 13:19:51');
INSERT INTO `sys_log` VALUES (42, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":54,\"parentId\":34,\"name\":\"批改试卷\",\"url\":\"/exam/correcting\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 13, '0:0:0:0:0:0:0:1', '2023-01-20 11:02:39');
INSERT INTO `sys_log` VALUES (43, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":54,\"parentId\":34,\"name\":\"批改试卷\",\"url\":\"exam/correcting\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 14, '0:0:0:0:0:0:0:1', '2023-01-20 11:02:56');
INSERT INTO `sys_log` VALUES (44, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":55,\"parentId\":54,\"name\":\"exam:correcting:save\",\"url\":\"\",\"perms\":\"新增\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-01-20 11:03:39');
INSERT INTO `sys_log` VALUES (45, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":56,\"parentId\":54,\"name\":\"删除\",\"url\":\"\",\"perms\":\"exam:correcting:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-01-20 11:03:52');
INSERT INTO `sys_log` VALUES (46, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":55,\"parentId\":54,\"name\":\"新增\",\"url\":\"\",\"perms\":\"exam:correcting:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-01-20 11:04:23');
INSERT INTO `sys_log` VALUES (47, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"教师\",\"remark\":\"出题教师\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,47,48,44,45,46,34,35,51,52,36,49,50,37,53,54,55,56,-666666]}]', 158, '0:0:0:0:0:0:0:1', '2023-01-20 11:04:30');
INSERT INTO `sys_log` VALUES (48, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"教师\",\"remark\":\"出题教师\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,47,48,44,45,46,35,51,52,36,49,50,37,54,55,56,-666666,34]}]', 129, '0:0:0:0:0:0:0:1', '2023-01-21 20:51:04');
INSERT INTO `sys_log` VALUES (49, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":57,\"parentId\":31,\"name\":\"公告管理\",\"url\":\"exam/notice\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 27, '0:0:0:0:0:0:0:1', '2023-01-24 15:54:14');
INSERT INTO `sys_log` VALUES (50, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":58,\"parentId\":57,\"name\":\"新增\",\"url\":\"\",\"perms\":\"exam:notice:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 12, '0:0:0:0:0:0:0:1', '2023-01-24 15:54:59');
INSERT INTO `sys_log` VALUES (51, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":59,\"parentId\":57,\"name\":\"删除\",\"url\":\"\",\"perms\":\"exam:notice:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2023-01-24 15:55:14');
INSERT INTO `sys_log` VALUES (52, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"教师\",\"remark\":\"出题教师\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,33,42,43,38,39,47,48,44,45,46,57,58,59,35,51,52,36,49,50,37,54,55,56,-666666,34]}]', 319, '0:0:0:0:0:0:0:1', '2023-01-24 15:55:43');
INSERT INTO `sys_log` VALUES (53, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":38,\"parentId\":31,\"name\":\"学生分数列表\",\"url\":\"exam/stuscore\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 18, '0:0:0:0:0:0:0:1', '2023-01-29 14:14:15');
INSERT INTO `sys_log` VALUES (54, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":44,\"parentId\":31,\"name\":\"年级列表\",\"url\":\"exam/clazz\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 10, '0:0:0:0:0:0:0:1', '2023-01-29 14:19:05');
INSERT INTO `sys_log` VALUES (55, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":3,\"username\":\"月读\",\"password\":\"af22e2acccad42dcc4cb7d489f63cb1264916631bba437907e38bd7a643cbdf7\",\"workNo\":\"2131010618\",\"realName\":\"月读\",\"salt\":\"L6Dao2S3pN5ffqVazU2g\",\"email\":\"14@qq.com\",\"mobile\":\"18375741256\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Jan 30, 2023 9:22:15 AM\"}]', 164, '0:0:0:0:0:0:0:1', '2023-01-30 09:22:15');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (31, 0, '学生管理', NULL, NULL, 0, 'admin', 0);
INSERT INTO `sys_menu` VALUES (32, 31, '学生列表', 'exam/student', NULL, 1, '', 0);
INSERT INTO `sys_menu` VALUES (33, 31, '专业列表', 'exam/major', NULL, 1, '', 0);
INSERT INTO `sys_menu` VALUES (34, 0, '试卷管理', NULL, NULL, 0, 'log', 0);
INSERT INTO `sys_menu` VALUES (35, 34, '试卷列表', 'exam/paper', NULL, 1, '', 0);
INSERT INTO `sys_menu` VALUES (36, 34, '题目列表', 'exam/question', NULL, 1, '', 0);
INSERT INTO `sys_menu` VALUES (37, 34, '题目分类', 'exam/questiontype', NULL, 1, '', 0);
INSERT INTO `sys_menu` VALUES (38, 31, '学生分数列表', 'exam/stuscore', NULL, 1, '', 0);
INSERT INTO `sys_menu` VALUES (39, 31, '课程科目', 'exam/subject', NULL, 1, '', 0);
INSERT INTO `sys_menu` VALUES (40, 32, '新增', '', 'exam:student:save', 2, '', 0);
INSERT INTO `sys_menu` VALUES (41, 32, '删除', '', 'exam:student:delete', 2, '', 0);
INSERT INTO `sys_menu` VALUES (42, 33, '新增', '', 'exam:major:save', 2, '', 0);
INSERT INTO `sys_menu` VALUES (43, 33, '删除', '', 'exam:major:delete', 2, '', 0);
INSERT INTO `sys_menu` VALUES (44, 31, '年级列表', 'exam/clazz', '', 1, '', 0);
INSERT INTO `sys_menu` VALUES (45, 44, '新增', '', 'exam:clazz:save', 2, '', 0);
INSERT INTO `sys_menu` VALUES (46, 44, '删除', '', 'exam:clazz:delete', 2, '', 0);
INSERT INTO `sys_menu` VALUES (47, 39, '新增', '', 'exam:subject:save', 2, '', 0);
INSERT INTO `sys_menu` VALUES (48, 39, '删除', '', 'exam:subject:delete', 2, '', 0);
INSERT INTO `sys_menu` VALUES (49, 36, '新增', '', 'exam:question:save', 2, '', 0);
INSERT INTO `sys_menu` VALUES (50, 36, '删除', '', 'exam:question:delete', 2, '', 0);
INSERT INTO `sys_menu` VALUES (51, 35, '新增', '', 'exam:paper:save', 2, '', 0);
INSERT INTO `sys_menu` VALUES (52, 35, '删除', '', 'exam:paper:delete', 2, '', 0);
INSERT INTO `sys_menu` VALUES (53, 34, '试卷审核', 'exam/checkPaper', '', 1, '', 0);
INSERT INTO `sys_menu` VALUES (54, 34, '批改试卷', 'exam/correcting', '', 1, '', 0);
INSERT INTO `sys_menu` VALUES (55, 54, '新增', '', 'exam:correcting:save', 2, '', 0);
INSERT INTO `sys_menu` VALUES (56, 54, '删除', '', 'exam:correcting:delete', 2, '', 0);
INSERT INTO `sys_menu` VALUES (57, 31, '公告管理', 'exam/notice', '', 1, '', 0);
INSERT INTO `sys_menu` VALUES (58, 57, '新增', '', 'exam:notice:save', 2, '', 0);
INSERT INTO `sys_menu` VALUES (59, 57, '删除', '', 'exam:notice:delete', 2, '', 0);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员', 1, '2023-01-07 09:44:29');
INSERT INTO `sys_role` VALUES (2, '教师', '出题教师', 1, '2023-01-07 09:46:51');
INSERT INTO `sys_role` VALUES (3, '审核人', '试卷审核人', 1, '2023-01-07 09:47:40');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 343 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1, 2);
INSERT INTO `sys_role_menu` VALUES (3, 1, 15);
INSERT INTO `sys_role_menu` VALUES (4, 1, 16);
INSERT INTO `sys_role_menu` VALUES (5, 1, 17);
INSERT INTO `sys_role_menu` VALUES (6, 1, 18);
INSERT INTO `sys_role_menu` VALUES (7, 1, 3);
INSERT INTO `sys_role_menu` VALUES (8, 1, 19);
INSERT INTO `sys_role_menu` VALUES (9, 1, 20);
INSERT INTO `sys_role_menu` VALUES (10, 1, 21);
INSERT INTO `sys_role_menu` VALUES (11, 1, 22);
INSERT INTO `sys_role_menu` VALUES (12, 1, 4);
INSERT INTO `sys_role_menu` VALUES (13, 1, 23);
INSERT INTO `sys_role_menu` VALUES (14, 1, 24);
INSERT INTO `sys_role_menu` VALUES (15, 1, 25);
INSERT INTO `sys_role_menu` VALUES (16, 1, 26);
INSERT INTO `sys_role_menu` VALUES (17, 1, 5);
INSERT INTO `sys_role_menu` VALUES (18, 1, 6);
INSERT INTO `sys_role_menu` VALUES (19, 1, 7);
INSERT INTO `sys_role_menu` VALUES (20, 1, 8);
INSERT INTO `sys_role_menu` VALUES (21, 1, 9);
INSERT INTO `sys_role_menu` VALUES (22, 1, 10);
INSERT INTO `sys_role_menu` VALUES (23, 1, 11);
INSERT INTO `sys_role_menu` VALUES (24, 1, 12);
INSERT INTO `sys_role_menu` VALUES (25, 1, 13);
INSERT INTO `sys_role_menu` VALUES (26, 1, 14);
INSERT INTO `sys_role_menu` VALUES (27, 1, 27);
INSERT INTO `sys_role_menu` VALUES (28, 1, 30);
INSERT INTO `sys_role_menu` VALUES (29, 1, 29);
INSERT INTO `sys_role_menu` VALUES (30, 1, 31);
INSERT INTO `sys_role_menu` VALUES (31, 1, 32);
INSERT INTO `sys_role_menu` VALUES (32, 1, 40);
INSERT INTO `sys_role_menu` VALUES (33, 1, 41);
INSERT INTO `sys_role_menu` VALUES (34, 1, 33);
INSERT INTO `sys_role_menu` VALUES (35, 1, 42);
INSERT INTO `sys_role_menu` VALUES (36, 1, 43);
INSERT INTO `sys_role_menu` VALUES (37, 1, 38);
INSERT INTO `sys_role_menu` VALUES (38, 1, 39);
INSERT INTO `sys_role_menu` VALUES (39, 1, 34);
INSERT INTO `sys_role_menu` VALUES (40, 1, 35);
INSERT INTO `sys_role_menu` VALUES (41, 1, 36);
INSERT INTO `sys_role_menu` VALUES (42, 1, 37);
INSERT INTO `sys_role_menu` VALUES (43, 1, -666666);
INSERT INTO `sys_role_menu` VALUES (239, 3, 31);
INSERT INTO `sys_role_menu` VALUES (240, 3, 32);
INSERT INTO `sys_role_menu` VALUES (241, 3, 40);
INSERT INTO `sys_role_menu` VALUES (242, 3, 41);
INSERT INTO `sys_role_menu` VALUES (243, 3, 33);
INSERT INTO `sys_role_menu` VALUES (244, 3, 42);
INSERT INTO `sys_role_menu` VALUES (245, 3, 43);
INSERT INTO `sys_role_menu` VALUES (246, 3, 38);
INSERT INTO `sys_role_menu` VALUES (247, 3, 39);
INSERT INTO `sys_role_menu` VALUES (248, 3, 47);
INSERT INTO `sys_role_menu` VALUES (249, 3, 48);
INSERT INTO `sys_role_menu` VALUES (250, 3, 44);
INSERT INTO `sys_role_menu` VALUES (251, 3, 45);
INSERT INTO `sys_role_menu` VALUES (252, 3, 46);
INSERT INTO `sys_role_menu` VALUES (253, 3, 34);
INSERT INTO `sys_role_menu` VALUES (254, 3, 35);
INSERT INTO `sys_role_menu` VALUES (255, 3, 51);
INSERT INTO `sys_role_menu` VALUES (256, 3, 52);
INSERT INTO `sys_role_menu` VALUES (257, 3, 36);
INSERT INTO `sys_role_menu` VALUES (258, 3, 49);
INSERT INTO `sys_role_menu` VALUES (259, 3, 50);
INSERT INTO `sys_role_menu` VALUES (260, 3, 37);
INSERT INTO `sys_role_menu` VALUES (261, 3, -666666);
INSERT INTO `sys_role_menu` VALUES (315, 2, 31);
INSERT INTO `sys_role_menu` VALUES (316, 2, 32);
INSERT INTO `sys_role_menu` VALUES (317, 2, 40);
INSERT INTO `sys_role_menu` VALUES (318, 2, 41);
INSERT INTO `sys_role_menu` VALUES (319, 2, 33);
INSERT INTO `sys_role_menu` VALUES (320, 2, 42);
INSERT INTO `sys_role_menu` VALUES (321, 2, 43);
INSERT INTO `sys_role_menu` VALUES (322, 2, 38);
INSERT INTO `sys_role_menu` VALUES (323, 2, 39);
INSERT INTO `sys_role_menu` VALUES (324, 2, 47);
INSERT INTO `sys_role_menu` VALUES (325, 2, 48);
INSERT INTO `sys_role_menu` VALUES (326, 2, 44);
INSERT INTO `sys_role_menu` VALUES (327, 2, 45);
INSERT INTO `sys_role_menu` VALUES (328, 2, 46);
INSERT INTO `sys_role_menu` VALUES (329, 2, 57);
INSERT INTO `sys_role_menu` VALUES (330, 2, 58);
INSERT INTO `sys_role_menu` VALUES (331, 2, 59);
INSERT INTO `sys_role_menu` VALUES (332, 2, 35);
INSERT INTO `sys_role_menu` VALUES (333, 2, 51);
INSERT INTO `sys_role_menu` VALUES (334, 2, 52);
INSERT INTO `sys_role_menu` VALUES (335, 2, 36);
INSERT INTO `sys_role_menu` VALUES (336, 2, 49);
INSERT INTO `sys_role_menu` VALUES (337, 2, 50);
INSERT INTO `sys_role_menu` VALUES (338, 2, 37);
INSERT INTO `sys_role_menu` VALUES (339, 2, 54);
INSERT INTO `sys_role_menu` VALUES (340, 2, 55);
INSERT INTO `sys_role_menu` VALUES (341, 2, 56);
INSERT INTO `sys_role_menu` VALUES (342, 2, -666666);
INSERT INTO `sys_role_menu` VALUES (343, 2, 34);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `work_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工号',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', '000000', 'admin', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (2, '5201314', 'fce916ecbc40f78c37f3b226c395b7da2aa0b8c000dc4ad3ede64d49eba838f8', '5201314', '栗子', 'slHW7OHjvLygNvD8Uwvu', '1420794684@qq.com', '12012012012', 1, 1, '2023-01-07 09:48:49');
INSERT INTO `sys_user` VALUES (3, '月读', 'af22e2acccad42dcc4cb7d489f63cb1264916631bba437907e38bd7a643cbdf7', '2131010618', '月读', 'L6Dao2S3pN5ffqVazU2g', '14@qq.com', '18375741256', 1, 1, '2023-01-30 09:22:15');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (4, 2, 2);
INSERT INTO `sys_user_role` VALUES (5, 3, 2);

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, 'e06d2a32addf585ffc5c2355f5d3325e', '2023-01-30 21:18:15', '2023-01-30 09:18:15');
INSERT INTO `sys_user_token` VALUES (2, 'aa42de9cb1ef005d7766569c1f5097a6', '2023-01-26 02:04:38', '2023-01-25 14:04:38');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

SET FOREIGN_KEY_CHECKS = 1;
