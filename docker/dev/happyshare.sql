-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: forest
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `infra_bank`
--

DROP TABLE IF EXISTS `infra_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_bank`
(
    `id`               bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `bank_name`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '银行名称',
    `bank_owner`       bigint                                  DEFAULT NULL COMMENT '银行负责人',
    `bank_description` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行描述',
    `created_by`       bigint                                  DEFAULT NULL COMMENT '创建人',
    `created_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='银行表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_bank`
--

LOCK
TABLES `infra_bank` WRITE;
/*!40000 ALTER TABLE `infra_bank` DISABLE KEYS */;
INSERT INTO `infra_bank`
VALUES (1, '社区中央银行', 1, '社区中央银行', 1, '2020-11-26 21:24:19'),
       (2, '社区发展与改革银行', 1, '社区发展与改革银行', 1, '2020-11-26 21:31:27');
/*!40000 ALTER TABLE `infra_bank` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `infra_bank_account`
--

DROP TABLE IF EXISTS `infra_bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_bank_account`
(
    `id`              bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `id_bank`         bigint                                 DEFAULT NULL COMMENT '所属银行',
    `bank_account`    varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行账户',
    `account_balance` decimal(32, 8)                         DEFAULT NULL COMMENT '账户余额',
    `account_owner`   bigint                                 DEFAULT NULL COMMENT '账户所有者',
    `created_time`    datetime                               DEFAULT NULL COMMENT '创建时间',
    `account_type`    char(1) COLLATE utf8mb4_unicode_ci     DEFAULT '0' COMMENT '0: 普通账户 1: 银行账户',
    PRIMARY KEY (`id`),
    UNIQUE KEY `forest_bank_account_pk` (`account_owner`,`bank_account`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='银行账户表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_bank_account`
--

LOCK
TABLES `infra_bank_account` WRITE;
/*!40000 ALTER TABLE `infra_bank_account` DISABLE KEYS */;
INSERT INTO `infra_bank_account`
VALUES (1, 1, '100000001', 997500000.00000000, 1, '2020-11-26 21:36:21', '1'),
       (2, 1, '100000002', 1207980.00000000, 2, '2020-11-26 21:37:18', '1');
/*!40000 ALTER TABLE `infra_bank_account` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `infra_currency_issue`
--

DROP TABLE IF EXISTS `infra_currency_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_currency_issue`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `issue_value`  decimal(32, 8) DEFAULT NULL COMMENT '发行数额',
    `created_by`   bigint         DEFAULT NULL COMMENT '发行人',
    `created_time` datetime       DEFAULT NULL COMMENT '发行时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='货币发行表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_currency_issue`
--

LOCK
TABLES `infra_currency_issue` WRITE;
/*!40000 ALTER TABLE `infra_currency_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_currency_issue` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `infra_currency_rule`
--

DROP TABLE IF EXISTS `infra_currency_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_currency_rule`
(
    `id`               bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `rule_name`        varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '规则名称',
    `rule_sign`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '规则标志(与枚举变量对应)',
    `rule_description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规则描述',
    `money`            decimal(32, 8)                           DEFAULT NULL COMMENT '金额',
    `award_status`     char(1) COLLATE utf8mb4_unicode_ci       DEFAULT '0' COMMENT '奖励(0)/消耗(1)状态',
    `maximum_money`    decimal(32, 8)                           DEFAULT NULL COMMENT '上限金额',
    `repeat_days`      int                                      DEFAULT '0' COMMENT '重复(0: 不重复,单位:天)',
    `status`           char(1) COLLATE utf8mb4_unicode_ci       DEFAULT '0' COMMENT '状态',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='货币规则表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_currency_rule`
--

LOCK
TABLES `infra_currency_rule` WRITE;
/*!40000 ALTER TABLE `infra_currency_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_currency_rule` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `infra_file`
--

DROP TABLE IF EXISTS `infra_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_file`
(
    `id`           int unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    `md5_value`    varchar(40) COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '文件md5值',
    `file_path`    varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件上传路径',
    `file_url`     varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '网络访问路径',
    `created_time` datetime                               DEFAULT NULL COMMENT '创建时间',
    `updated_time` datetime                               DEFAULT NULL COMMENT '更新时间',
    `created_by`   int                                    DEFAULT NULL COMMENT '创建人',
    `file_size`    int                                    DEFAULT NULL COMMENT '文件大小',
    `file_type`    varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
    PRIMARY KEY (`id`),
    KEY            `index_md5_value_created_by` (`md5_value`,`created_by`),
    KEY            `index_created_by` (`created_by`),
    KEY            `index_md5_value` (`md5_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文件上传记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_file`
--

LOCK
TABLES `infra_file` WRITE;
/*!40000 ALTER TABLE `infra_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_file` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_article`
--

DROP TABLE IF EXISTS `system_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_article`
(
    `id`                      bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `article_title`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章标题',
    `article_thumbnail_url`   varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章缩略图',
    `article_author_id`       bigint                                  DEFAULT NULL COMMENT '文章作者id',
    `article_type`            char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '文章类型',
    `article_tags`            varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章标签',
    `article_view_count`      int                                     DEFAULT '1' COMMENT '浏览总数',
    `article_preview_content` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '预览内容',
    `article_comment_count`   int                                     DEFAULT '0' COMMENT '评论总数',
    `article_permalink`       varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章永久链接',
    `article_link`            varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '站内链接',
    `created_time`            datetime                                DEFAULT NULL COMMENT '创建时间',
    `updated_time`            datetime                                DEFAULT NULL COMMENT '更新时间',
    `article_perfect`         char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '0:非优选1：优选',
    `article_status`          char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '文章状态',
    `article_thumbs_up_count` int                                     DEFAULT '0' COMMENT '点赞总数',
    `article_sponsor_count`   int                                     DEFAULT '0' COMMENT '赞赏总数',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_article`
--

LOCK
TABLES `system_article` WRITE;
/*!40000 ALTER TABLE `system_article` DISABLE KEYS */;
INSERT INTO `system_article`
VALUES (1, '给新人的一封信', NULL, 1, '0', '公告,新手信', 3277,
        '您好，欢迎来到 RYMCU 社区，RYMCU 是一个嵌入式知识学习交流平台。RY 取自”容易”的首字母，寓意为让电子设计变得 so easy。新手的疑问初学者都有很多疑问，在这里对这些疑问进行一一解答。我英语不好，可以学习编程吗？对于初学者来说，英语不是主要的障碍，国内有着充足的中文教程。但在接下来的学习过程中，需要阅读大量的英文文档，所以还是需要有一些英语基础和理解学习能力，配合翻译工具（如百度',
        0, 'http://localhost:3000/article/1', '/article/1', '2020-01-03 01:27:25', '2022-09-26 15:33:03', '0', '0', 7,
        3);
/*!40000 ALTER TABLE `system_article` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_article_content`
--

DROP TABLE IF EXISTS `system_article_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_article_content`
(
    `id_article`           bigint NOT NULL COMMENT '主键',
    `article_content`      text COLLATE utf8mb4_unicode_ci COMMENT '文章内容原文',
    `article_content_html` text COLLATE utf8mb4_unicode_ci COMMENT '文章内容Html',
    `created_time`         datetime DEFAULT NULL COMMENT '创建时间',
    `updated_time`         datetime DEFAULT NULL COMMENT '更新时间',
    KEY                    `forest_article_content_id_article_index` (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT=' ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_article_content`
--

LOCK
TABLES `system_article_content` WRITE;
/*!40000 ALTER TABLE `system_article_content` DISABLE KEYS */;
INSERT INTO `system_article_content`
VALUES (1,
        '您好，欢迎来到 RYMCU 社区，RYMCU 是一个嵌入式知识学习交流平台。RY 取自”容易”的首字母，寓意为让电子设计变得 so easy。\n\n## 新手的疑问\n\n初学者都有很多疑问，在这里对这些疑问进行一一解答。\n\n- 我英语不好，可以学习编程吗？\n  对于初学者来说，英语不是主要的障碍，国内有着充足的中文教程。但在接下来的学习过程中，需要阅读大量的英文文档，所以还是需要有一些英语基础和理解学习能力，配合翻译工具（如百度翻译）进行理解。\n- 我数学不好，可以学习编程吗？\n  对于初学者来说，有必要掌握数学逻辑思维和解决问题的思路，这些能力都在数学学习中得到锻炼，想必学习编程的人数学成绩肯定不错。初学者不需要多高的数学知识水平，但在未来的学习过程中需要更高级的数学知识，应随时做好接受学习新知识的准备。\n- 我想学习编程，大佬可以教教我吗？\n  一般我是拒绝的，我认为学习是互相促进的过程，而不是单方面的输出，并且我也有很多事情要做。不仅是我，绝大多数人都会拒绝。\n- 学习编程是使用 IDE 好还是 Notepad 好？\n  最近看到有人在争论这个问题，使用 IDE 是新手的不二选择。\n- 好吧，我自学编程，有问题可以问大佬吗？\n  可以，但是我拒绝回答书中的基础问题和可以通过搜索引擎解决的问题。\n- 学习编程是看书好还是看视频好？\n  萝卜青菜，各有所爱，关键是看哪种方式能让你更好理解和学习。我个人是喜爱书本，可以随时查阅资料，非常方便。\n- 我学习了很久，但没有成效，我是不是没有天赋？\n  我个人觉得对于入门的学习来说，天赋对于学习的影响微乎其微，如果你的学习效率低下，考虑是不是以下原因：\n\n  - 单纯的努力不足，三天打鱼两天晒网。如果不能改正，不如考虑干点别的。\n  - 数学逻辑思维和解决问题的能力不足。这个可以学习一些简单易懂的教程，看看视频等，慢慢锻炼，没有任何捷径。\n  - 学习方法不对，主要是练得少。只翻书和看视频是没有用的，必须配合大量的练习。个人推荐的方法是：\n    - 看完书以后把书上给出的例题再敲一遍，不是照着书上写。\n    - 把课后习题都给做了。\n    - 做几个自己感兴趣的项目。\n    - 对于自己不懂的问题，先看看书，再百度谷歌，最后才询问他人。\n\n## 提问的方法\n\n当你遇到**使用搜索引擎、查阅相关文档、进行 Debug**（如果没有做过上述操作的话，请立刻去做）也无法解决的问题的时候，你可能会向别人求助。现在就来讲讲如何正确提问。\n\n当你进行提问时，请保证你准确提供了以下信息：\n\n- 准确的描述你的需求和实际问题情况。\n- 准确的描述你所在的平台的信息。例如：\n  - 开发板型号\n  - 运行程序( IDE 等)名称及其版本\n  - Windows/Linux/MacOS 任一平台及其版本\n  - 依赖的类库及其版本\n- 提供你的源代码，将源代码包括开发环境完整上传至源码托管平台（如 Github）。\n- 提供你的完整日志、异常输出。\n\n如果你在社区提问，请在你的标题也简略的包含问题描述和平台信息。例如 `stm32f103x 开发板` `win10` 运行串口通信程序时，中文显示乱码\n\n如果你想学习更多关于提问的方法、技巧、礼仪，看看[提问的智慧](https://rymcu.com/article/80)会给予你许多帮助。\n\n## 自学的方法\n\n- 每当学习到新知识的时候应该及时的练习和实践\n- 多看看开发文档，每次你都能获得新的收获\n- 多看看别人的源代码，很多问题都能得到解决\n- 搜索引擎是一个好东西\n- 写学习笔记和博客是记录知识的好方式，但不是死记知识点\n- 好的提问方式才能获得正确答案\n- 合理的规划学习时间，而不是三天打鱼两天晒网\n\n## C 语言基础教程\n\n- [C 语言中文教程](https://doc.yonyoucloud.com/doc/wiki/project/c/c-intro.html)\n- [C语言小白变怪兽](http://c.biancheng.net/c/)\n\n## 单片机基础教程\n\n- [51 单片机入门教程(Keil4 版)](https://rymcu.com/portfolio/42)\n- [STM32 独家入门秘籍](https://rymcu.com/portfolio/11)\n- [51 单片机入门教程(VS Code 版)](https://rymcu.com/portfolio/41)\n\n## 其他教程\n\n- [markdown 教程](https://rymcu.com/guides/markdown)\n- [社区编辑器使用教程](https://rymcu.com/guides/vditor)\n\n## 推荐书籍\n\n- 《C 程序设计语言( 第 2 版 ) 》 —— [美] 布莱恩·W.克尼汉（Brian W.Kernighan），[美] 丹尼斯·M.里奇（Dennis M.Ritchie） 著\n- 《软技能: 代码之外的生存指南》—— [美] 约翰 Z.森梅兹（John Z.Sonmez） 著\n- 《大教堂与集市》—— [美] Eric S Raymond 著\n- 《黑客与画家》—— [美] Paul Graham 著\n\n## 愿景\n\n> 关于更多的信息请阅读 [《RYMCU 白皮书》](https://rymcu.com/article/115)\n\n我们致力于构建一个即严谨又活泼、专业又不失有趣的开源嵌入式知识平台。在这里我们可以畅所欲言、以平等、自由的身份获取和分享知识。在这里共同学习、交流、进步、成长。\n\n## 行为准则\n\n> 详细行为准则请参考 [参与者公约](https://rymcu.com/article/20)\n\n无论问题简单与否，欢迎大家积极留言、评论、交流。对他人多一些理解和包容，帮助他人解决问题和自我提升是我们的终极目标。\n欢迎您发表原创文章、分享独到见解、作出有价值的评论。所有原创内容著作权均归作者本人所有。所发表内容不得侵犯企业或个人的合法权益，包括但不限于涉及个人隐私、造谣与诽谤、商业侵权。\n\n## 其他\n\n### 微信公众号\n\n![qrcodeforgh245b3234e782258.jpg](https://static.rymcu.com/article/1642081054095.jpg)\n\n### github\n\n[RYMCU](https://github.com/rymcu)\n\n### gitee\n\n[RYMCU 社区](https://gitee.com/rymcu-community)\n\n',
        '<p>您好，欢迎来到 RYMCU 社区，RYMCU 是一个嵌入式知识学习交流平台。RY 取自”容易”的首字母，寓意为让电子设计变得 so easy。</p>\n<h2 id=\"新手的疑问\">新手的疑问</h2>\n<p>初学者都有很多疑问，在这里对这些疑问进行一一解答。</p>\n<ul>\n<li>\n<p>我英语不好，可以学习编程吗？<br />\n对于初学者来说，英语不是主要的障碍，国内有着充足的中文教程。但在接下来的学习过程中，需要阅读大量的英文文档，所以还是需要有一些英语基础和理解学习能力，配合翻译工具（如百度翻译）进行理解。</p>\n</li>\n<li>\n<p>我数学不好，可以学习编程吗？<br />\n对于初学者来说，有必要掌握数学逻辑思维和解决问题的思路，这些能力都在数学学习中得到锻炼，想必学习编程的人数学成绩肯定不错。初学者不需要多高的数学知识水平，但在未来的学习过程中需要更高级的数学知识，应随时做好接受学习新知识的准备。</p>\n</li>\n<li>\n<p>我想学习编程，大佬可以教教我吗？<br />\n一般我是拒绝的，我认为学习是互相促进的过程，而不是单方面的输出，并且我也有很多事情要做。不仅是我，绝大多数人都会拒绝。</p>\n</li>\n<li>\n<p>学习编程是使用 IDE 好还是 Notepad 好？<br />\n最近看到有人在争论这个问题，使用 IDE 是新手的不二选择。</p>\n</li>\n<li>\n<p>好吧，我自学编程，有问题可以问大佬吗？<br />\n可以，但是我拒绝回答书中的基础问题和可以通过搜索引擎解决的问题。</p>\n</li>\n<li>\n<p>学习编程是看书好还是看视频好？<br />\n萝卜青菜，各有所爱，关键是看哪种方式能让你更好理解和学习。我个人是喜爱书本，可以随时查阅资料，非常方便。</p>\n</li>\n<li>\n<p>我学习了很久，但没有成效，我是不是没有天赋？<br />\n我个人觉得对于入门的学习来说，天赋对于学习的影响微乎其微，如果你的学习效率低下，考虑是不是以下原因：</p>\n<ul>\n<li>单纯的努力不足，三天打鱼两天晒网。如果不能改正，不如考虑干点别的。</li>\n<li>数学逻辑思维和解决问题的能力不足。这个可以学习一些简单易懂的教程，看看视频等，慢慢锻炼，没有任何捷径。</li>\n<li>学习方法不对，主要是练得少。只翻书和看视频是没有用的，必须配合大量的练习。个人推荐的方法是：\n<ul>\n<li>看完书以后把书上给出的例题再敲一遍，不是照着书上写。</li>\n<li>把课后习题都给做了。</li>\n<li>做几个自己感兴趣的项目。</li>\n<li>对于自己不懂的问题，先看看书，再百度谷歌，最后才询问他人。</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n<h2 id=\"提问的方法\">提问的方法</h2>\n<p>当你遇到<strong>使用搜索引擎、查阅相关文档、进行 Debug</strong>（如果没有做过上述操作的话，请立刻去做）也无法解决的问题的时候，你可能会向别人求助。现在就来讲讲如何正确提问。</p>\n<p>当你进行提问时，请保证你准确提供了以下信息：</p>\n<ul>\n<li>准确的描述你的需求和实际问题情况。</li>\n<li>准确的描述你所在的平台的信息。例如：\n<ul>\n<li>开发板型号</li>\n<li>运行程序( IDE 等)名称及其版本</li>\n<li>Windows/Linux/MacOS 任一平台及其版本</li>\n<li>依赖的类库及其版本</li>\n</ul>\n</li>\n<li>提供你的源代码，将源代码包括开发环境完整上传至源码托管平台（如 Github）。</li>\n<li>提供你的完整日志、异常输出。</li>\n</ul>\n<p>如果你在社区提问，请在你的标题也简略的包含问题描述和平台信息。例如 <code>stm32f103x 开发板</code> <code>win10</code> 运行串口通信程序时，中文显示乱码</p>\n<p>如果你想学习更多关于提问的方法、技巧、礼仪，看看<a href=\"https://rymcu.com/article/80\">提问的智慧</a>会给予你许多帮助。</p>\n<h2 id=\"自学的方法\">自学的方法</h2>\n<ul>\n<li>每当学习到新知识的时候应该及时的练习和实践</li>\n<li>多看看开发文档，每次你都能获得新的收获</li>\n<li>多看看别人的源代码，很多问题都能得到解决</li>\n<li>搜索引擎是一个好东西</li>\n<li>写学习笔记和博客是记录知识的好方式，但不是死记知识点</li>\n<li>好的提问方式才能获得正确答案</li>\n<li>合理的规划学习时间，而不是三天打鱼两天晒网</li>\n</ul>\n<h2 id=\"C-语言基础教程\">C 语言基础教程</h2>\n<ul>\n<li><a href=\"https://doc.yonyoucloud.com/doc/wiki/project/c/c-intro.html\">C 语言中文教程</a></li>\n<li><a href=\"http://c.biancheng.net/c/\">C 语言小白变怪兽</a></li>\n</ul>\n<h2 id=\"单片机基础教程\">单片机基础教程</h2>\n<ul>\n<li><a href=\"https://rymcu.com/portfolio/42\">51 单片机入门教程(Keil4 版)</a></li>\n<li><a href=\"https://rymcu.com/portfolio/11\">STM32 独家入门秘籍</a></li>\n<li><a href=\"https://rymcu.com/portfolio/41\">51 单片机入门教程(VS Code 版)</a></li>\n</ul>\n<h2 id=\"其他教程\">其他教程</h2>\n<ul>\n<li><a href=\"https://rymcu.com/guides/markdown\">markdown 教程</a></li>\n<li><a href=\"https://rymcu.com/guides/vditor\">社区编辑器使用教程</a></li>\n</ul>\n<h2 id=\"推荐书籍\">推荐书籍</h2>\n<ul>\n<li>《C 程序设计语言( 第 2 版 ) 》 —— [美] 布莱恩·W.克尼汉（Brian W.Kernighan），[美] 丹尼斯·M.里奇（Dennis M.Ritchie） 著</li>\n<li>《软技能: 代码之外的生存指南》—— [美] 约翰 Z.森梅兹（John Z.Sonmez） 著</li>\n<li>《大教堂与集市》—— [美] Eric S Raymond 著</li>\n<li>《黑客与画家》—— [美] Paul Graham 著</li>\n</ul>\n<h2 id=\"愿景\">愿景</h2>\n<blockquote>\n<p>关于更多的信息请阅读 <a href=\"https://rymcu.com/article/115\">《RYMCU 白皮书》</a></p>\n</blockquote>\n<p>我们致力于构建一个即严谨又活泼、专业又不失有趣的开源嵌入式知识平台。在这里我们可以畅所欲言、以平等、自由的身份获取和分享知识。在这里共同学习、交流、进步、成长。</p>\n<h2 id=\"行为准则\">行为准则</h2>\n<blockquote>\n<p>详细行为准则请参考 <a href=\"https://rymcu.com/article/20\">参与者公约</a></p>\n</blockquote>\n<p>无论问题简单与否，欢迎大家积极留言、评论、交流。对他人多一些理解和包容，帮助他人解决问题和自我提升是我们的终极目标。<br />\n欢迎您发表原创文章、分享独到见解、作出有价值的评论。所有原创内容著作权均归作者本人所有。所发表内容不得侵犯企业或个人的合法权益，包括但不限于涉及个人隐私、造谣与诽谤、商业侵权。</p>\n<h2 id=\"其他\">其他</h2>\n<h3 id=\"微信公众号\">微信公众号</h3>\n<p><img src=\"https://static.rymcu.com/article/1642081054095.jpg\" alt=\"qrcodeforgh245b3234e782258.jpg\" /></p>\n<h3 id=\"github\">github</h3>\n<p><a href=\"https://github.com/rymcu\">RYMCU</a></p>\n<h3 id=\"gitee\">gitee</h3>\n<p><a href=\"https://gitee.com/rymcu-community\">RYMCU 社区</a></p>\n',
        '2020-01-03 15:27:25', '2022-09-26 15:33:02');
/*!40000 ALTER TABLE `system_article_content` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_article_thumbs_up`
--

DROP TABLE IF EXISTS `system_article_thumbs_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_article_thumbs_up`
(
    `id`             bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `id_article`     bigint   DEFAULT NULL COMMENT '文章表主键',
    `id_user`        bigint   DEFAULT NULL COMMENT '用户表主键',
    `thumbs_up_time` datetime DEFAULT NULL COMMENT '点赞时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章点赞表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_article_thumbs_up`
--

LOCK
TABLES `system_article_thumbs_up` WRITE;
/*!40000 ALTER TABLE `system_article_thumbs_up` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_article_thumbs_up` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_comment`
--

DROP TABLE IF EXISTS `system_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_comment`
(
    `id`                          bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `comment_content`             text COLLATE utf8mb4_unicode_ci COMMENT '评论内容',
    `comment_author_id`           bigint                                  DEFAULT NULL COMMENT '作者 id',
    `comment_article_id`          bigint                                  DEFAULT NULL COMMENT '文章 id',
    `comment_sharp_url`           varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '锚点 url',
    `comment_original_comment_id` bigint                                  DEFAULT NULL COMMENT '父评论 id',
    `comment_status`              char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '状态',
    `comment_ip`                  varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论 IP',
    `comment_ua`                  varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'User-Agent',
    `comment_anonymous`           char(1) COLLATE utf8mb4_unicode_ci      DEFAULT NULL COMMENT '0：公开回帖，1：匿名回帖',
    `comment_reply_count`         int                                     DEFAULT NULL COMMENT '回帖计数',
    `comment_visible`             char(1) COLLATE utf8mb4_unicode_ci      DEFAULT NULL COMMENT '0：所有人可见，1：仅楼主和自己可见',
    `created_time`                datetime                                DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_comment`
--

LOCK
TABLES `system_comment` WRITE;
/*!40000 ALTER TABLE `system_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_comment` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_follow`
--

DROP TABLE IF EXISTS `system_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_follow`
(
    `id`             bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `follower_id`    bigint                             DEFAULT NULL COMMENT '关注者 id',
    `following_id`   bigint                             DEFAULT NULL COMMENT '关注数据 id',
    `following_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '0：用户，1：标签，2：帖子收藏，3：帖子关注',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='关注表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_follow`
--

LOCK
TABLES `system_follow` WRITE;
/*!40000 ALTER TABLE `system_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_follow` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_login_record`
--

DROP TABLE IF EXISTS `system_login_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_login_record`
(
    `id`              bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `id_user`         bigint NOT NULL COMMENT '用户表主键',
    `login_ip`        varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录设备IP',
    `login_ua`        varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录设备UA',
    `login_city`      varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录设备所在城市',
    `login_os`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '登录设备操作系统',
    `login_browser`   varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '登录设备浏览器',
    `created_time`    datetime                                DEFAULT NULL COMMENT '登录时间',
    `login_device_id` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录设备/浏览器指纹',
    PRIMARY KEY (`id`),
    UNIQUE KEY `forest_login_record_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='登录记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_login_record`
--

LOCK
TABLES `system_login_record` WRITE;
/*!40000 ALTER TABLE `system_login_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_login_record` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_lucene_user_dic`
--

DROP TABLE IF EXISTS `system_lucene_user_dic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_lucene_user_dic`
(
    `id`  int NOT NULL AUTO_INCREMENT COMMENT '字典编号',
    `dic` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典',
    PRIMARY KEY (`id`),
    UNIQUE KEY `forest_lucene_user_dic_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户扩展字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_lucene_user_dic`
--

LOCK
TABLES `system_lucene_user_dic` WRITE;
/*!40000 ALTER TABLE `system_lucene_user_dic` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_lucene_user_dic` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_notification`
--

DROP TABLE IF EXISTS `system_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notification`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `id_user`      bigint                                  DEFAULT NULL COMMENT '用户id',
    `data_type`    char(1) COLLATE utf8mb4_unicode_ci      DEFAULT NULL COMMENT '数据类型',
    `data_id`      bigint                                  DEFAULT NULL COMMENT '数据id',
    `has_read`     char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '是否已读',
    `data_summary` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据摘要',
    `created_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='通知表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notification`
--

LOCK
TABLES `system_notification` WRITE;
/*!40000 ALTER TABLE `system_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_notification` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_portfolio`
--

DROP TABLE IF EXISTS `system_portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_portfolio`
(
    `id`                         bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `portfolio_head_img_url`     varchar(500) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '作品集头像',
    `portfolio_title`            varchar(32) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '作品集名称',
    `portfolio_author_id`        bigint                                   DEFAULT NULL COMMENT '作品集作者',
    `portfolio_description`      varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作品集介绍',
    `created_time`               datetime                                 DEFAULT NULL COMMENT '创建时间',
    `updated_time`               datetime                                 DEFAULT NULL COMMENT '更新时间',
    `portfolio_description_html` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT ' 作品集介绍HTML',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作品集表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_portfolio`
--

LOCK
TABLES `system_portfolio` WRITE;
/*!40000 ALTER TABLE `system_portfolio` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_portfolio` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_portfolio_article`
--

DROP TABLE IF EXISTS `system_portfolio_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_portfolio_article`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `id_portfolio` bigint DEFAULT NULL COMMENT '作品集表主键',
    `id_article`   bigint DEFAULT NULL COMMENT '文章表主键',
    `sort_no`      int    DEFAULT NULL COMMENT '排序号',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作品集与文章关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_portfolio_article`
--

LOCK
TABLES `system_portfolio_article` WRITE;
/*!40000 ALTER TABLE `system_portfolio_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_portfolio_article` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_product`
--

DROP TABLE IF EXISTS `system_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_product`
(
    `id`                  int NOT NULL AUTO_INCREMENT COMMENT '主键',
    `product_title`       varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名',
    `product_price`       int                                     DEFAULT '0' COMMENT '单价(单位:分)',
    `product_img_url`     varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品主图',
    `product_description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品描述',
    `weights`             tinyint                                 DEFAULT '50' COMMENT '权重,数值越小权限越大;0:无权限',
    `created_time`        datetime                                DEFAULT NULL COMMENT '创建时间',
    `updated_time`        datetime                                DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `forest_product_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_product`
--

LOCK
TABLES `system_product` WRITE;
/*!40000 ALTER TABLE `system_product` DISABLE KEYS */;
INSERT INTO `system_product`
VALUES (1, 'Nebula Pi', 2000000, 'https://static.rymcu.com/article/1648960741563.jpg', '产品描述', 20,
        '2022-06-13 22:35:33', '2022-06-13 22:35:33');
/*!40000 ALTER TABLE `system_product` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_product_content`
--

DROP TABLE IF EXISTS `system_product_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_product_content`
(
    `id_product`           int      DEFAULT NULL COMMENT '产品表主键',
    `product_content`      text COLLATE utf8mb4_unicode_ci COMMENT '产品详情原文',
    `product_content_html` text COLLATE utf8mb4_unicode_ci COMMENT '产品详情 Html',
    `created_time`         datetime DEFAULT NULL COMMENT '创建时间',
    `updated_time`         datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_product_content`
--

LOCK
TABLES `system_product_content` WRITE;
/*!40000 ALTER TABLE `system_product_content` DISABLE KEYS */;
INSERT INTO `system_product_content`
VALUES (1,
        '![nebula pi](https://static.rymcu.com/article/1640531590770)\n\nNebula-Pi 开发板平台\n\n## 1.1主板结构及布局\n\n![](https://static.rymcu.com/article/1640531590844)\n\n图1.1 Nebula-Pi 单片机开发平台\n\n## 1.2主板元件说明\n\n从图1.1可以看出， Nebula-Pi 开发板平台资源丰富，不仅涵盖了 51 单片机所有内部资源，还扩展了大量的外设，单片机的各项功能均可以在平台上得到验证。我们以顺时针的顺序从**①**到**⑳**，分别介绍主要模块的功能。\n\n| 序号 | 元器件 | 功能介绍 |\n| --- | --- | --- |\n| 1 | 迷你 USB 接口 | 给开发板供电，以及计算机与开发板通信 |\n| 2 | 单片机跳线帽 | 开发板上有两块独立的 51 单片机，可以通过这个跳线进行切换，选择你需要使用的单片机。 |\n| 3 | 电源开关 | 开发板电源开关 |\n| 4 |  51 单片机 STC89C52RC | 这套教程的主角， 51 单片机，选用 STC 公司的 STC89C52RC 型号进行讲解 |\n| 5 | 液晶显示器跳线帽 | 液晶显示器的跳线，可以选择 OLED 或者 LCD |\n| 6 | 主板复位按钮 | 复位按钮，相当于电脑的重启按键 |\n| 7 | 数字温度传感器 | 温度传感器，可以测量环境温度 |\n| 8 | 红外接收头 | 接收红外遥控信号专用 |\n| 9 | 液晶显示器接口 | 预留的液晶显示器 1602/12864 等的接口 |\n| 10 | 数码管 | 4 位数码管，可以同时显示 4 个数字等 |\n| 11 | 蜂鸣器 | 相当于开发板的小喇叭，可以发出\"滴滴\"等声音 |\n| 12 | 光敏&热敏电阻 | 两种类型的电阻，分别可以用来测量光强度和温度 |\n| 13 | 步进电机接口 | 预留给电机的接口 |\n| 14 | 8 个 LED 灯 | 8 个 LED 小灯，可实现指示灯，流水灯等效果 |\n| 15 | 增强型 51 单片机 STC12 | 开发板上的另外一块 51 单片机，比主角功能更强大，第一块用来学习，这一块用来做项目，学习、实践两不误 |\n| 16 | 2.4G 无线模块接口 | 为 2.4G 无线通信模块预留的接口，无线通信距离可以达到 1-2Km，大大扩展了开发板的功能 |\n| 17 | 3 个独立按键 | 3 个按键，可以当做开发板的输入设备，相当于迷你版键盘 |\n| 18 | 继电器接口 | 开发板上集成了继电器，这个接口预留给用户接线用的，可以用来控制 220V 设备的开关。因此，可以通过开发板來控制各种类型的家用电器 |\n| 19 | 电源端子 | 预留了 5V 和 3.3V 的电源端子，可以用来给其他设备供电 |\n| 20 | WiFi 模块接口 | WiFi 模块接口，接上 WiFi 模块，开发板可以轻松上网冲浪 |\n\n表 1-1 主板元器件说明\n\n',
        '<p><img src=\"https://static.rymcu.com/article/1640531590770\" alt=\"nebula pi\" /></p>\n<p>Nebula-Pi 开发板平台</p>\n<h2 id=\"1-1主板结构及布局\">1.1 主板结构及布局</h2>\n<p><img src=\"https://static.rymcu.com/article/1640531590844\" alt=\"\" /></p>\n<p>图 1.1 Nebula-Pi 单片机开发平台</p>\n<h2 id=\"1-2主板元件说明\">1.2 主板元件说明</h2>\n<p>从图 1.1 可以看出， Nebula-Pi 开发板平台资源丰富，不仅涵盖了 51 单片机所有内部资源，还扩展了大量的外设，单片机的各项功能均可以在平台上得到验证。我们以顺时针的顺序从 <strong>①</strong> 到 <strong>⑳</strong>，分别介绍主要模块的功能。</p>\n<table>\n<thead>\n<tr>\n<th>序号</th>\n<th>元器件</th>\n<th>功能介绍</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>1</td>\n<td>迷你 USB 接口</td>\n<td>给开发板供电，以及计算机与开发板通信</td>\n</tr>\n<tr>\n<td>2</td>\n<td>单片机跳线帽</td>\n<td>开发板上有两块独立的 51 单片机，可以通过这个跳线进行切换，选择你需要使用的单片机。</td>\n</tr>\n<tr>\n<td>3</td>\n<td>电源开关</td>\n<td>开发板电源开关</td>\n</tr>\n<tr>\n<td>4</td>\n<td>51 单片机 STC89C52RC</td>\n<td>这套教程的主角， 51 单片机，选用 STC 公司的 STC89C52RC 型号进行讲解</td>\n</tr>\n<tr>\n<td>5</td>\n<td>液晶显示器跳线帽</td>\n<td>液晶显示器的跳线，可以选择 OLED 或者 LCD</td>\n</tr>\n<tr>\n<td>6</td>\n<td>主板复位按钮</td>\n<td>复位按钮，相当于电脑的重启按键</td>\n</tr>\n<tr>\n<td>7</td>\n<td>数字温度传感器</td>\n<td>温度传感器，可以测量环境温度</td>\n</tr>\n<tr>\n<td>8</td>\n<td>红外接收头</td>\n<td>接收红外遥控信号专用</td>\n</tr>\n<tr>\n<td>9</td>\n<td>液晶显示器接口</td>\n<td>预留的液晶显示器 1602/12864 等的接口</td>\n</tr>\n<tr>\n<td>10</td>\n<td>数码管</td>\n<td>4 位数码管，可以同时显示 4 个数字等</td>\n</tr>\n<tr>\n<td>11</td>\n<td>蜂鸣器</td>\n<td>相当于开发板的小喇叭，可以发出&quot;滴滴&quot;等声音</td>\n</tr>\n<tr>\n<td>12</td>\n<td>光敏&amp;热敏电阻</td>\n<td>两种类型的电阻，分别可以用来测量光强度和温度</td>\n</tr>\n<tr>\n<td>13</td>\n<td>步进电机接口</td>\n<td>预留给电机的接口</td>\n</tr>\n<tr>\n<td>14</td>\n<td>8 个 LED 灯</td>\n<td>8 个 LED 小灯，可实现指示灯，流水灯等效果</td>\n</tr>\n<tr>\n<td>15</td>\n<td>增强型 51 单片机 STC12</td>\n<td>开发板上的另外一块 51 单片机，比主角功能更强大，第一块用来学习，这一块用来做项目，学习、实践两不误</td>\n</tr>\n<tr>\n<td>16</td>\n<td>2.4G 无线模块接口</td>\n<td>为 2.4G 无线通信模块预留的接口，无线通信距离可以达到 1-2Km，大大扩展了开发板的功能</td>\n</tr>\n<tr>\n<td>17</td>\n<td>3 个独立按键</td>\n<td>3 个按键，可以当做开发板的输入设备，相当于迷你版键盘</td>\n</tr>\n<tr>\n<td>18</td>\n<td>继电器接口</td>\n<td>开发板上集成了继电器，这个接口预留给用户接线用的，可以用来控制 220V 设备的开关。因此，可以通过开发板來控制各种类型的家用电器</td>\n</tr>\n<tr>\n<td>19</td>\n<td>电源端子</td>\n<td>预留了 5V 和 3.3V 的电源端子，可以用来给其他设备供电</td>\n</tr>\n<tr>\n<td>20</td>\n<td>WiFi 模块接口</td>\n<td>WiFi 模块接口，接上 WiFi 模块，开发板可以轻松上网冲浪</td>\n</tr>\n</tbody>\n</table>\n<p>表 1-1 主板元器件说明</p>\n',
        '2022-06-13 22:35:34', '2022-06-13 22:35:34');
/*!40000 ALTER TABLE `system_product_content` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_role`
--

DROP TABLE IF EXISTS `system_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_role`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`         varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
    `input_code`   varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '拼音码',
    `status`       char(1) COLLATE utf8mb4_unicode_ci     DEFAULT '0' COMMENT '状态',
    `created_time` datetime                               DEFAULT NULL COMMENT '创建时间',
    `updated_time` datetime                               DEFAULT NULL COMMENT '更新时间',
    `weights`      tinyint                                DEFAULT '0' COMMENT '权重,数值越小权限越大;0:无权限',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT=' ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role`
--

LOCK
TABLES `system_role` WRITE;
/*!40000 ALTER TABLE `system_role` DISABLE KEYS */;
INSERT INTO `system_role`
VALUES (1, '管理员', 'admin', '0', '2019-11-16 04:22:45', '2019-11-16 04:22:45', 1),
       (2, '社区管理员', 'blog_admin', '0', '2019-12-05 03:10:05', '2019-12-05 17:11:35', 2),
       (3, '作者', 'zz', '0', '2020-03-12 15:07:27', '2020-03-12 15:07:27', 3),
       (4, '普通用户', 'user', '0', '2019-12-05 03:10:59', '2020-03-12 15:13:49', 4);
/*!40000 ALTER TABLE `system_role` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_sponsor`
--

DROP TABLE IF EXISTS `system_sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sponsor`
(
    `id`                bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `data_type`         char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据类型',
    `data_id`           bigint                             DEFAULT NULL COMMENT '数据主键',
    `sponsor`           bigint                             DEFAULT NULL COMMENT '赞赏人',
    `sponsorship_time`  datetime                           DEFAULT NULL COMMENT '赞赏日期',
    `sponsorship_money` decimal(32, 8)                     DEFAULT NULL COMMENT '赞赏金额',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='赞赏表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_sponsor`
--

LOCK
TABLES `system_sponsor` WRITE;
/*!40000 ALTER TABLE `system_sponsor` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_sponsor` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_tag`
--

DROP TABLE IF EXISTS `system_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_tag`
(
    `id`                   bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `tag_title`            varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '标签名',
    `tag_icon_path`        varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签图标',
    `tag_uri`              varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签uri',
    `tag_description`      text COLLATE utf8mb4_unicode_ci COMMENT '描述',
    `tag_view_count`       int                                     DEFAULT '0' COMMENT '浏览量',
    `tag_article_count`    int                                     DEFAULT '0' COMMENT '关联文章总数',
    `tag_ad`               char(1) COLLATE utf8mb4_unicode_ci      DEFAULT NULL COMMENT '标签广告',
    `tag_show_side_ad`     char(1) COLLATE utf8mb4_unicode_ci      DEFAULT NULL COMMENT '是否显示全站侧边栏广告',
    `created_time`         datetime                                DEFAULT NULL COMMENT '创建时间',
    `updated_time`         datetime                                DEFAULT NULL COMMENT '更新时间',
    `tag_status`           char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '标签状态',
    `tag_reservation`      char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '保留标签',
    `tag_description_html` text COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='标签表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_tag`
--

LOCK
TABLES `system_tag` WRITE;
/*!40000 ALTER TABLE `system_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_tag` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_tag_article`
--

DROP TABLE IF EXISTS `system_tag_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_tag_article`
(
    `id`                    bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `id_tag`                bigint                                 DEFAULT NULL COMMENT '标签 id',
    `id_article`            varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '帖子 id',
    `article_comment_count` int                                    DEFAULT '0' COMMENT '帖子评论计数 0',
    `article_perfect`       int                                    DEFAULT '0' COMMENT '0:非优选1：优选 0',
    `created_time`          datetime                               DEFAULT NULL COMMENT '创建时间',
    `updated_time`          datetime                               DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY                     `forest_tag_article_id_tag_index` (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='标签 - 帖子关联表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_tag_article`
--

LOCK
TABLES `system_tag_article` WRITE;
/*!40000 ALTER TABLE `system_tag_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_tag_article` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_topic`
--

DROP TABLE IF EXISTS `system_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_topic`
(
    `id`                     bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `topic_title`            varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '专题标题',
    `topic_uri`              varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '专题路径',
    `topic_description`      text COLLATE utf8mb4_unicode_ci COMMENT '专题描述',
    `topic_type`             varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '专题类型',
    `topic_sort`             int                                     DEFAULT '10' COMMENT '专题序号 10',
    `topic_icon_path`        varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专题图片路径',
    `topic_nva`              char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '0：作为导航1：不作为导航 0',
    `topic_tag_count`        int                                     DEFAULT '0' COMMENT '专题下标签总数 0',
    `topic_status`           char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '0：正常1：禁用 0',
    `created_time`           datetime                                DEFAULT NULL COMMENT '创建时间',
    `updated_time`           datetime                                DEFAULT NULL COMMENT '更新时间',
    `topic_description_html` text COLLATE utf8mb4_unicode_ci COMMENT '专题描述 Html',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='主题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_topic`
--

LOCK
TABLES `system_topic` WRITE;
/*!40000 ALTER TABLE `system_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_topic` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_topic_tag`
--

DROP TABLE IF EXISTS `system_topic_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_topic_tag`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `id_topic`     bigint   DEFAULT NULL COMMENT '专题id',
    `id_tag`       bigint   DEFAULT NULL COMMENT '标签id',
    `created_time` datetime DEFAULT NULL COMMENT '创建时间',
    `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY            `forest_topic_tag_id_topic_index` (`id_topic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='专题- 标签关联表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_topic_tag`
--

LOCK
TABLES `system_topic_tag` WRITE;
/*!40000 ALTER TABLE `system_topic_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_topic_tag` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_transaction_record`
--

DROP TABLE IF EXISTS `system_transaction_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_transaction_record`
(
    `id`                bigint NOT NULL AUTO_INCREMENT COMMENT '交易主键',
    `transaction_no`    varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易流水号',
    `funds`             varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '款项',
    `form_bank_account` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易发起方',
    `to_bank_account`   varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易收款方',
    `money`             decimal(32, 8)                         DEFAULT NULL COMMENT '交易金额',
    `transaction_type`  char(1) COLLATE utf8mb4_unicode_ci     DEFAULT '0' COMMENT '交易类型',
    `transaction_time`  datetime                               DEFAULT NULL COMMENT '交易时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='交易记录表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_transaction_record`
--

LOCK
TABLES `system_transaction_record` WRITE;
/*!40000 ALTER TABLE `system_transaction_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_transaction_record` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user`
(
    `id`               bigint                                 NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `account`          varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '账号',
    `password`         varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
    `nickname`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
    `real_name`        varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `sex`              char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '性别',
    `avatar_type`      char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '头像类型',
    `avatar_url`       varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像路径',
    `email`            varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `phone`            varchar(11) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '电话',
    `status`           char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '状态',
    `created_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `updated_time`     datetime                                DEFAULT NULL COMMENT '更新时间',
    `last_login_time`  datetime                                DEFAULT NULL COMMENT '最后登录时间',
    `signature`        varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签名',
    `last_online_time` datetime                                DEFAULT NULL COMMENT '最后在线时间',
    `bg_img_url`       varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '背景图片',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user`
--

LOCK
TABLES `system_user` WRITE;
/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
INSERT INTO `system_user`
VALUES (1, 'admin', '8ce2dd866238958ac4f07870766813cdaa39a9b83a8c75e26aa50f23', 'admin', 'admin', '0', '0', NULL,
        'admin@rymcu.com', NULL, '0', '2021-01-25 18:21:51', '2021-01-25 18:21:54', NULL, NULL, NULL, NULL),
       (2, 'testUser', '8ce2dd866238958ac4f07870766813cdaa39a9b83a8c75e26aa50f23', 'testUser', 'testUser', '0', '0',
        NULL, 'testUser@rymcu.com', NULL, '0', '2021-01-25 18:21:51', '2021-01-25 18:21:54', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_user_extend`
--

DROP TABLE IF EXISTS `system_user_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_extend`
(
    `id_user` bigint NOT NULL COMMENT '用户表主键',
    `github`  varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'github',
    `weibo`   varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '微博',
    `weixin`  varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '微信',
    `qq`      varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'qq',
    `blog`    varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '博客'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户扩展表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_extend`
--

LOCK
TABLES `system_user_extend` WRITE;
/*!40000 ALTER TABLE `system_user_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_user_extend` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_user_role`
--

DROP TABLE IF EXISTS `system_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_role`
(
    `id_user`      bigint NOT NULL COMMENT '用户表主键',
    `id_role`      bigint NOT NULL COMMENT '角色表主键',
    `created_time` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户权限表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_role`
--

LOCK
TABLES `system_user_role` WRITE;
/*!40000 ALTER TABLE `system_user_role` DISABLE KEYS */;
INSERT INTO `system_user_role`
VALUES (1, 1, '2021-01-25 18:22:12');
/*!40000 ALTER TABLE `system_user_role` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_user_tag`
--

DROP TABLE IF EXISTS `system_user_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_tag`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `id_user`      bigint                                 DEFAULT NULL COMMENT '用户 id',
    `id_tag`       varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签 id',
    `type`         char(1) COLLATE utf8mb4_unicode_ci     DEFAULT NULL COMMENT '0：创建者，1：帖子使用，2：用户自评标签',
    `created_time` datetime                               DEFAULT NULL COMMENT '创建时间',
    `updated_time` datetime                               DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户 - 标签关联表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_tag`
--

LOCK
TABLES `system_user_tag` WRITE;
/*!40000 ALTER TABLE `system_user_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_user_tag` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_visit`
--

DROP TABLE IF EXISTS `system_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_visit`
(
    `id`                bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    `visit_url`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '浏览链接',
    `visit_ip`          varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP',
    `visit_ua`          varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'User-Agent',
    `visit_city`        varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '城市',
    `visit_device_id`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备唯一标识',
    `visit_user_id`     bigint                                  DEFAULT NULL COMMENT '浏览者 id',
    `visit_referer_url` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上游链接',
    `created_time`      datetime                                DEFAULT NULL COMMENT '创建时间',
    `expired_time`      datetime                                DEFAULT NULL COMMENT '过期时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='浏览表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_visit`
--

LOCK
TABLES `system_visit` WRITE;
/*!40000 ALTER TABLE `system_visit` DISABLE KEYS */;
INSERT INTO `system_visit`
VALUES (1, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, 'http://localhost:3000/', '2024-02-27 23:01:58', NULL),
       (2, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, 'http://localhost:3000/', '2024-02-27 23:01:58', NULL),
       (3, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, NULL, '2024-02-27 23:02:07', NULL),
       (4, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, NULL, '2024-02-27 23:02:07', NULL),
       (5, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', '00dc0030003700f2', NULL, 'http://localhost:3000/', '2024-02-27 23:08:14', NULL),
       (6, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', '00dc0030003700f2', NULL, 'http://localhost:3000/topic/news?page=1', '2024-02-27 23:08:18', NULL),
       (7, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', '00dc0030003700f2', NULL, 'http://localhost:3000/', '2024-02-27 23:08:20', NULL),
       (8, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', '00dc0030003700f2', NULL, 'http://localhost:3000/topic/news?page=1', '2024-02-27 23:08:21', NULL),
       (9, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, NULL, '2024-03-22 10:12:12', NULL),
       (10, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, NULL, '2024-03-22 10:12:12', NULL),
       (11, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, 'http://localhost:3000/', '2024-03-22 10:12:40', NULL),
       (12, 'http://localhost:8099/forest/api/v1/console/article/1', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, 'http://localhost:3000/', '2024-03-22 10:12:41', NULL),
       (13, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, 'http://localhost:3000/', '2024-03-22 11:10:21', NULL),
       (14, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, 'http://localhost:3000/', '2024-03-22 11:10:21', NULL),
       (15, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, NULL, '2024-03-22 18:33:11', NULL),
       (16, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, NULL, '2024-03-22 18:33:11', NULL),
       (17, 'http://localhost:8099/forest/api/v1/console/articles', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, 'http://localhost:3000/', '2024-03-22 18:51:21', NULL),
       (18, 'http://localhost:8099/forest/api/v1/console/article/1', '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0',
        '', NULL, NULL, 'http://localhost:3000/', '2024-03-22 18:51:22', NULL);
/*!40000 ALTER TABLE `system_visit` ENABLE KEYS */;
UNLOCK
TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-24 11:09:08
