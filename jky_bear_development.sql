-- MySQL dump 10.13  Distrib 5.7.21, for osx10.13 (x86_64)
--
-- Host: localhost    Database: jky_bear_development
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` bigint(20) NOT NULL,
  `blob_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `active_storage_blobs`
--

DROP TABLE IF EXISTS `active_storage_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_blobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `metadata` text,
  `byte_size` bigint(20) NOT NULL,
  `checksum` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL COMMENT '账户',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `password_digest` varchar(255) DEFAULT NULL COMMENT '密码',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `plan_id` bigint(20) DEFAULT NULL COMMENT '所属计划',
  PRIMARY KEY (`id`),
  KEY `index_admins_on_plan_id` (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assessment_experts`
--

DROP TABLE IF EXISTS `assessment_experts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_experts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assessment_id` bigint(20) DEFAULT NULL COMMENT '所属评测点',
  `role_id` bigint(20) DEFAULT NULL COMMENT '所属角色',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_assessment_experts_on_assessment_id` (`assessment_id`),
  KEY `index_assessment_experts_on_role_id` (`role_id`),
  KEY `index_assessment_experts_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_2df0138790` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_a9e1298f5d` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`),
  CONSTRAINT `fk_rails_cd7b26553a` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评测点绑定专家';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assessment_files`
--

DROP TABLE IF EXISTS `assessment_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assessment_id` bigint(20) DEFAULT NULL COMMENT '评测项',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  `plan_id` bigint(20) DEFAULT NULL COMMENT '计划',
  `file` varchar(255) DEFAULT NULL COMMENT '文件',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_code` varchar(255) DEFAULT NULL COMMENT '文件号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `normal` tinyint(1) DEFAULT '0' COMMENT '保密',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_assessment_files_on_assessment_id` (`assessment_id`),
  KEY `index_assessment_files_on_user_id` (`user_id`),
  KEY `index_assessment_files_on_plan_id` (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assessment_opts`
--

DROP TABLE IF EXISTS `assessment_opts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_opts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assessment_id` bigint(20) DEFAULT NULL COMMENT '评测项',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色',
  `plan_id` bigint(20) DEFAULT NULL COMMENT '计划',
  `province` varchar(6) DEFAULT NULL COMMENT '省份',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `assessment_std_id` int(11) DEFAULT NULL,
  `content` text COMMENT '简述',
  PRIMARY KEY (`id`),
  KEY `index_assessment_opts_on_assessment_id` (`assessment_id`),
  KEY `index_assessment_opts_on_user_id` (`user_id`),
  KEY `index_assessment_opts_on_role_id` (`role_id`),
  KEY `index_assessment_opts_on_plan_id` (`plan_id`),
  KEY `index_assessment_opts_on_province` (`province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assessment_stds`
--

DROP TABLE IF EXISTS `assessment_stds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_stds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flag` varchar(255) DEFAULT NULL COMMENT '标识',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `assessment_id` int(11) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_assessment_stds_on_role_id` (`role_id`),
  CONSTRAINT `fk_rails_16581a4304` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评测项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assessments`
--

DROP TABLE IF EXISTS `assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL COMMENT '评测内容',
  `plan_id` bigint(20) DEFAULT NULL COMMENT '所属工作计划',
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `children_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `import_status` tinyint(1) DEFAULT '0' COMMENT '重要性',
  `expert_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_assessments_on_plan_id` (`plan_id`),
  KEY `index_assessments_on_parent_id` (`parent_id`),
  KEY `index_assessments_on_lft` (`lft`),
  KEY `index_assessments_on_rgt` (`rgt`),
  KEY `index_assessments_on_expert_group_id` (`expert_group_id`),
  CONSTRAINT `fk_rails_b39b4003b6` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  CONSTRAINT `fk_rails_e2ac400ddd` FOREIGN KEY (`expert_group_id`) REFERENCES `expert_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评测点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `captchas`
--

DROP TABLE IF EXISTS `captchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captchas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL COMMENT '验证字符串',
  `identifier` varchar(255) DEFAULT NULL COMMENT '标识符',
  `generated_at` datetime DEFAULT NULL COMMENT '生成时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '验证码状态',
  PRIMARY KEY (`id`),
  KEY `index_captchas_on_identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expert_groups`
--

DROP TABLE IF EXISTS `expert_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expert_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '小组名称',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网评专家组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `completed_at` datetime DEFAULT NULL COMMENT '归档时间',
  PRIMARY KEY (`id`),
  KEY `index_plans_on_completed_at` (`completed_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='工作计划';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinces` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_provinces_on_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flag` varchar(20) DEFAULT NULL COMMENT '标识',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `province` varchar(6) DEFAULT NULL COMMENT '所属用户',
  `user_id` bigint(20) DEFAULT NULL COMMENT '所属用户',
  `plan_id` bigint(20) DEFAULT NULL COMMENT '所属计划',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reports_on_user_id` (`user_id`),
  KEY `index_reports_on_plan_id` (`plan_id`),
  KEY `index_reports_on_flag` (`flag`),
  KEY `index_reports_on_province` (`province`),
  CONSTRAINT `fk_rails_0dd2e09b67` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  CONSTRAINT `fk_rails_c7699d537d` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自评总报告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `plan_id` bigint(20) DEFAULT NULL COMMENT '所属计划',
  `province` tinyint(1) DEFAULT NULL COMMENT '成员关联省份控制',
  `begin_at` datetime DEFAULT NULL COMMENT '开始时间',
  `end_at` datetime DEFAULT NULL COMMENT '结束时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `users_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_roles_on_plan_id` (`plan_id`),
  CONSTRAINT `fk_rails_a1ce6c2772` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) DEFAULT NULL COMMENT '所属计划',
  `province` varchar(6) DEFAULT NULL COMMENT '省份',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_ids` varchar(255) DEFAULT NULL COMMENT '用户组长id',
  PRIMARY KEY (`id`),
  KEY `index_teams_on_plan_id` (`plan_id`),
  KEY `index_teams_on_province` (`province`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(30) DEFAULT NULL COMMENT '账号',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机',
  `password_digest` varchar(255) DEFAULT NULL COMMENT '密码',
  `plan_id` bigint(20) DEFAULT NULL COMMENT '所属工作计划',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `province` varchar(6) DEFAULT NULL,
  `discarded_at` datetime DEFAULT NULL COMMENT '删除时间',
  `role_id` bigint(20) DEFAULT NULL COMMENT '用户角色',
  `expert_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_plan_id` (`plan_id`),
  KEY `index_users_on_account` (`account`),
  KEY `index_users_on_name` (`name`),
  KEY `index_users_on_mobile` (`mobile`),
  KEY `index_users_on_province` (`province`),
  KEY `index_users_on_discarded_at` (`discarded_at`),
  KEY `index_users_on_role_id` (`role_id`),
  KEY `index_users_on_expert_group_id` (`expert_group_id`),
  CONSTRAINT `fk_rails_642f17018b` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_rails_c7d01481e8` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  CONSTRAINT `fk_rails_de26b090d7` FOREIGN KEY (`expert_group_id`) REFERENCES `expert_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wangping_reports`
--

DROP TABLE IF EXISTS `wangping_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wangping_reports` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '网评专家',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `address` varchar(255) DEFAULT NULL COMMENT '所属地',
  `expert_group_id` bigint(20) DEFAULT NULL COMMENT '所属分组',
  `expert_group_xuhao` int(11) DEFAULT NULL COMMENT '分组序号',
  `assessment_task` varchar(255) DEFAULT NULL COMMENT '测评点任务',
  `assessment_xuhao` int(11) DEFAULT NULL COMMENT '测评点序号',
  `assessment_id` bigint(20) DEFAULT NULL COMMENT '测评点',
  `total` int(11) DEFAULT NULL COMMENT '完成数量',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `_110000` varchar(255) DEFAULT NULL COMMENT '北京市',
  `_120000` varchar(255) DEFAULT NULL COMMENT '天津市',
  `_130000` varchar(255) DEFAULT NULL COMMENT '河北省',
  `_140000` varchar(255) DEFAULT NULL COMMENT '山西省',
  `_150000` varchar(255) DEFAULT NULL COMMENT '内蒙古自治区',
  `_210000` varchar(255) DEFAULT NULL COMMENT '辽宁省',
  `_220000` varchar(255) DEFAULT NULL COMMENT '吉林省',
  `_230000` varchar(255) DEFAULT NULL COMMENT '黑龙江省',
  `_310000` varchar(255) DEFAULT NULL COMMENT '上海市',
  `_320000` varchar(255) DEFAULT NULL COMMENT '江苏省',
  `_330000` varchar(255) DEFAULT NULL COMMENT '浙江省',
  `_340000` varchar(255) DEFAULT NULL COMMENT '安徽省',
  `_350000` varchar(255) DEFAULT NULL COMMENT '福建省',
  `_360000` varchar(255) DEFAULT NULL COMMENT '江西省',
  `_370000` varchar(255) DEFAULT NULL COMMENT '山东省',
  `_410000` varchar(255) DEFAULT NULL COMMENT '河南省',
  `_420000` varchar(255) DEFAULT NULL COMMENT '湖北省',
  `_430000` varchar(255) DEFAULT NULL COMMENT '湖南省',
  `_440000` varchar(255) DEFAULT NULL COMMENT '广东省',
  `_450000` varchar(255) DEFAULT NULL COMMENT '广西壮族自治区',
  `_460000` varchar(255) DEFAULT NULL COMMENT '海南省',
  `_500000` varchar(255) DEFAULT NULL COMMENT '重庆市',
  `_510000` varchar(255) DEFAULT NULL COMMENT '四川省',
  `_520000` varchar(255) DEFAULT NULL COMMENT '贵州省',
  `_530000` varchar(255) DEFAULT NULL COMMENT '云南省',
  `_540000` varchar(255) DEFAULT NULL COMMENT '西藏自治区',
  `_610000` varchar(255) DEFAULT NULL COMMENT '陕西省',
  `_620000` varchar(255) DEFAULT NULL COMMENT '甘肃省',
  `_630000` varchar(255) DEFAULT NULL COMMENT '青海省',
  `_640000` varchar(255) DEFAULT NULL COMMENT '宁夏回族自治区',
  `_650000` varchar(255) DEFAULT NULL COMMENT '新疆维吾尔自治区',
  `_830000` varchar(255) DEFAULT NULL COMMENT '新疆建设兵团',
  PRIMARY KEY (`id`),
  KEY `index_wangping_reports_on_user_id` (`user_id`),
  KEY `index_wangping_reports_on_assessment_id` (`assessment_id`),
  KEY `index_wangping_reports_on_expert_group_id` (`expert_group_id`),
  CONSTRAINT `fk_rails_b065aeb91d` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_b6bb4cc707` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`),
  CONSTRAINT `fk_rails_cf3369435c` FOREIGN KEY (`expert_group_id`) REFERENCES `expert_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网评专家评价报告';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-28 10:37:36
