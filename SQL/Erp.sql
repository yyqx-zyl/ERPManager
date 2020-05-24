/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.22-log : Database - erpmanager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`erpmanager` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `erpmanager`;

/*Table structure for table `erp_inbound` */

DROP TABLE IF EXISTS `erp_inbound`;

CREATE TABLE `erp_inbound` (
  `inId` int(11) NOT NULL AUTO_INCREMENT COMMENT '入库编号',
  `productName` varchar(20) NOT NULL COMMENT '商品名称',
  `typeId` int(11) NOT NULL COMMENT '分类id',
  `wareNum` int(11) NOT NULL COMMENT '入库数量',
  `remarks` varchar(50) NOT NULL,
  `wareDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '入库时间',
  `createBy` int(11) DEFAULT NULL COMMENT '入库者',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`inId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `erp_inbound` */

insert  into `erp_inbound`(`inId`,`productName`,`typeId`,`wareNum`,`remarks`,`wareDate`,`createBy`,`modifyBy`,`modifyTime`) values (15,'是对方告诉对方',14,45,'非的故事的分割','2020-05-24 18:52:40',1,NULL,'2020-05-24 18:52:40'),(16,'对方是大法官',7,234,'富商大贾水电费','2020-05-24 18:52:49',1,NULL,'2020-05-24 18:52:49'),(17,'对方告诉对方干',3,76,'恢复规划地方','2020-05-24 18:53:00',1,NULL,'2020-05-24 18:52:59'),(18,'电饭锅和收费贵还是',17,345,'规范化的环境发生过','2020-05-24 18:53:08',1,NULL,'2020-05-24 18:53:08'),(19,'水电费工时费',13,234,'认同与法规和粉丝团','2020-05-24 18:53:17',1,NULL,'2020-05-24 18:53:17');

/*Table structure for table `erp_outbound` */

DROP TABLE IF EXISTS `erp_outbound`;

CREATE TABLE `erp_outbound` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '出库编号',
  `sid` int(11) NOT NULL COMMENT '入库编号',
  `typeId` int(11) NOT NULL COMMENT '分类id',
  `outNum` int(11) NOT NULL COMMENT '出库数量',
  `remarks` varchar(50) NOT NULL COMMENT '备注',
  `createBy` int(11) DEFAULT NULL COMMENT '出库者',
  `createTime` timestamp NULL DEFAULT NULL COMMENT '出库时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `erp_outbound` */

insert  into `erp_outbound`(`oid`,`sid`,`typeId`,`outNum`,`remarks`,`createBy`,`createTime`,`modifyBy`,`modifyTime`) values (16,3,2,3456,'是集合股份的象征',1,'2020-05-24 19:20:57',NULL,'2020-05-24 19:20:56'),(17,3,1,3456,'法国红酒花港饭店',1,'2020-05-24 19:21:04',NULL,'2020-05-24 19:21:04');

/*Table structure for table `erp_stock` */

DROP TABLE IF EXISTS `erp_stock`;

CREATE TABLE `erp_stock` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存id',
  `productName` varchar(100) NOT NULL COMMENT '商品名称',
  `typeId` int(11) NOT NULL COMMENT '分类id',
  `productNum` int(11) NOT NULL COMMENT '商品数量',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `erp_stock` */

insert  into `erp_stock`(`sid`,`productName`,`typeId`,`productNum`,`remarks`,`createBy`,`createTime`,`modifyBy`,`modifyTime`) values (3,'手动蝶阀好贵',10,50,'规划法国恢复个',1,'2020-05-19 09:59:15',NULL,'2020-05-19 09:59:15'),(5,'保湿564564132',8,34,'更待何时发过火',1,'2020-05-19 12:48:43',NULL,'2020-05-19 12:48:43'),(6,'对方告诉对方个',14,34,'的发的发生的',1,'2020-05-23 20:52:11',NULL,'2020-05-23 20:52:11'),(7,'阿萨德放的歌',14,3245,'一句话规范的撒多',1,'2020-05-24 18:58:11',NULL,'2020-05-24 18:58:11');

/*Table structure for table `erp_type` */

DROP TABLE IF EXISTS `erp_type`;

CREATE TABLE `erp_type` (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `typeName` varchar(20) NOT NULL,
  `typeDescribe` varchar(255) DEFAULT NULL,
  `typeNotes` varchar(255) DEFAULT NULL COMMENT '备注',
  `createBy` int(11) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifyBy` int(11) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `erp_type` */

insert  into `erp_type`(`tid`,`typeName`,`typeDescribe`,`typeNotes`,`createBy`,`createTime`,`modifyBy`,`modifyTime`) values (1,'肉类','分公司豆腐干豆腐',' 地方',1,'2020-05-18 11:22:46',1,'2020-05-18 11:22:47'),(2,'鱼类','电风扇','反射地方',1,'2020-05-15 14:43:56',NULL,'2020-05-15 14:43:56'),(3,'发给第三方','股份的说法','反攻倒算',1,'2020-05-15 14:44:02',NULL,'2020-05-15 14:44:02'),(6,'功夫兔阮玉','515561125','而天涯热土人',2,'2020-05-18 11:43:19',2,'2020-05-18 11:43:19'),(7,'的富商大贾十多个','小缸费','规划梵蒂冈',2,'2020-05-18 11:25:06',1,'2020-05-18 11:25:06'),(8,'法规和风格官方换个','5645356451321','官方价格很快会尽快',2,'2020-05-18 11:40:49',1,'2020-05-18 11:40:49'),(10,'_φ(❐_❐✧ 人丑就要多读书','发光时代哈代发货','(。＿ 。） ✎＿学习计划走起',2,'2020-05-18 11:39:13',1,'2020-05-18 11:39:14'),(11,'地方电饭锅电饭锅','非的故事','梵蒂冈发给',1,'2020-05-18 14:26:27',NULL,'2020-05-18 14:26:19'),(13,'现场做D栋法撒旦','的沙发斯蒂芬','说的对方水电费',1,'2020-05-18 14:27:06',NULL,'2020-05-18 14:27:06'),(14,'从VB不超过方式','的非官方个','非的故事的分割',2,'2020-05-18 14:27:16',NULL,'2020-05-18 14:27:16'),(15,'发鬼地方个的双方各','对方告诉对方个','发给电饭锅',1,'2020-05-18 14:27:24',NULL,'2020-05-18 14:27:24'),(16,'非的故事发给第三方','发的广泛地感受到','发的更舒服 ',2,'2020-05-18 14:27:35',NULL,'2020-05-18 14:27:35'),(17,'结了婚就感觉舒服',NULL,'粉红色规范化施工方',1,'2020-05-23 20:51:54',NULL,'2020-05-23 20:51:53');

/*Table structure for table `erp_user` */

DROP TABLE IF EXISTS `erp_user`;

CREATE TABLE `erp_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `uname` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `userName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `userpassword` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户密码',
  `gender` int(11) NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` datetime NOT NULL COMMENT '出生日期',
  `phone` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '联系电话',
  `place` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '籍贯',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `Introg` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `userrole` int(11) NOT NULL DEFAULT '1' COMMENT '权限，0管理员，1员工',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者，为当前用户',
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `erp_user` */

insert  into `erp_user`(`uid`,`uname`,`userName`,`userpassword`,`gender`,`birthday`,`phone`,`place`,`email`,`Introg`,`userrole`,`createBy`,`createTime`,`modifyBy`,`modifyTime`) values (1,'张三','zhangsan','123',0,'1996-03-21 00:00:00','15256789876','四川德阳',NULL,NULL,0,1,'2020-05-23 22:41:40',NULL,'2020-05-23 22:41:40'),(2,'李四','lisi','123',0,'2009-06-11 10:23:41','15632547852','武汉',NULL,NULL,1,1,'2020-05-15 10:27:39',NULL,'2020-05-15 10:27:39');

/*Table structure for table `erp_warning` */

DROP TABLE IF EXISTS `erp_warning`;

CREATE TABLE `erp_warning` (
  `wid` int(11) NOT NULL AUTO_INCREMENT COMMENT '预警id',
  `sid` int(11) NOT NULL COMMENT '库存商品id',
  `typeId` int(11) NOT NULL COMMENT '分类id',
  `remark` varchar(225) COLLATE utf8_bin NOT NULL COMMENT '备注',
  `warnNum` int(11) NOT NULL COMMENT '预警数量',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者',
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `erp_warning` */

insert  into `erp_warning`(`wid`,`sid`,`typeId`,`remark`,`warnNum`,`createBy`,`createTime`,`modifyBy`,`modifyTime`) values (1,2,16,'发丰东股份',34,1,'2020-05-22 11:38:43',NULL,'2020-05-22 11:38:43'),(2,6,1,'798056门口接口i',256,1,'2020-05-24 18:53:27',1,'2020-05-24 18:53:27'),(3,4,6,'大概是大法官',25,1,'2020-05-22 11:39:41',NULL,'2020-05-22 11:39:41'),(4,6,10,'发的更舒服',123,1,'2020-05-23 23:37:32',1,'2020-05-23 23:37:33'),(5,5,8,'成功也库',345,1,'2020-05-23 22:01:09',NULL,'2020-05-23 22:01:09'),(7,3,6,'3456789周星驰VB喊你',34,1,'2020-05-23 23:46:28',1,'2020-05-23 23:46:28'),(8,3,13,'分公司动感',234,1,'2020-05-24 18:54:03',NULL,'2020-05-24 18:54:03'),(9,6,3,'东方故事更好的',234,1,'2020-05-24 18:54:20',NULL,'2020-05-24 18:54:20');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
