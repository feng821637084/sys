/*
SQLyog v10.2 
MySQL - 5.6.13 : Database - test_sysdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test_sysdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test_sysdb`;

/*Table structure for table `tb_info` */

DROP TABLE IF EXISTS `tb_info`;

CREATE TABLE `tb_info` (
  `info_id` int(10) NOT NULL AUTO_INCREMENT,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `tb_info` */

insert  into `tb_info`(`info_id`,`info1`,`info2`,`info3`) values (1,'a1','a3','a3'),(2,'b1','b2','b3'),(3,'c1','c2','c3'),(4,'d1','d2','d3'),(5,'e1','e2','e3'),(6,'f1','f2','f3'),(7,'g1','g2','g3'),(8,'h1','h2','h3'),(9,'i1','i2','i3'),(10,'j1','j2','j3'),(11,'k1','k2','k3'),(12,'l1','l2','l3'),(13,'m1','m2','m3'),(14,'n1','n2','n3'),(15,'o1','o2','o3'),(16,'p1','p2','p3'),(17,'q1','q2','q3'),(18,'r1','r2','r3'),(19,'s1','s2','s3'),(20,'t1','t2','t3'),(21,'u1','u2','u3'),(22,'v1','v2','v3'),(23,'w1','w2','w3'),(24,'x1','x2','x3'),(25,'y1','y2','y3'),(26,'z1','z2','z3');

/*Table structure for table `tb_menu` */

DROP TABLE IF EXISTS `tb_menu`;

CREATE TABLE `tb_menu` (
  `menu_id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(20) DEFAULT NULL,
  `menu_url` varchar(100) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `tb_menu` */

insert  into `tb_menu`(`menu_id`,`menu_name`,`menu_url`,`parent_id`) values (1,'系统管理','',NULL),(5,'用户管理','user.html',1),(6,'角色管理','role.html',1),(7,'菜单管理','menu.html',1),(21,'数据统计','',NULL),(22,'按渠道录入数据','qd/setQdData.html',21),(23,'数据查询','qd/showQdData.html',21),(24,'结款对账','',NULL),(25,'结款对账','qdMoney/moneyApply.html',24),(26,'财务对账','',NULL),(27,'财务对账','qdMoney/financeConfirm.html',26),(28,'渠道信息','',NULL),(29,'渠道商信息','qd/qdUserInfo.html',28),(30,'CP管理','',NULL),(32,'CP信息','cp/cpInfo.html',30),(33,'CP产品','cpProdect/info.html',30),(35,'渠道信息管理','qd/qdMainInfo.html',28),(36,'按CP录入数据','qd/setQdDataByCp.html',21),(37,'产品维护','',NULL),(38,'商务产品维护','cpProdect/info.html',37),(39,'媒介产品分配','cpProdect/infoByMj.html',37),(40,'修改密码','',NULL),(41,'修改密码','pwd/updataPassword.html',40),(42,'商务对账','mj/showQdDataBySw.html',21),(43,'所有商务对账','mj/showQdDataBySws.html',21),(44,'所有商务数据','mj/showQdDataBySwAll.html',21);

/*Table structure for table `tb_role` */

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL,
  `rights` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tb_role` */

insert  into `tb_role`(`role_id`,`role_name`,`rights`) values (1,'系统管理员','4309745926370'),(3,'商务用户','8183001120768'),(4,'渠道用户','3299350675456'),(5,'媒介用户','4089091981312'),(8,'超级商务','30477371047936');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `rights` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`loginname`,`password`,`username`,`rights`,`status`,`role_id`,`last_login`) values (1,'admin','6677386','管理员','38894',0,1,'2014-05-19 17:44:29'),(2,'xy','adsl00594783','晓燕',NULL,0,8,'2014-05-20 12:42:50'),(3,'XL','5757124c','昕玲',NULL,0,3,'2014-03-07 20:08:46'),(4,'xh','6677386','小虎',NULL,0,3,'2014-05-09 00:22:08'),(5,'qdtest','test','渠道测试',NULL,0,4,'2014-04-17 15:52:12'),(9,'rjg','rjg','阮建光',NULL,0,3,'2014-04-14 16:05:57'),(10,'xiaoxiao_','marykayliuyu_','小小',NULL,0,3,'2014-05-09 02:25:59'),(12,'x','x','x',NULL,0,4,'2014-04-17 18:07:39'),(20,'xiaoxiao','marykayliuyu',NULL,NULL,0,4,'2014-05-09 02:45:12'),(21,'cmq360','cmq360',NULL,NULL,0,4,'2014-05-09 02:45:44'),(22,'lly','123456',NULL,NULL,0,4,NULL),(23,'XIAJIA','qwqw',NULL,NULL,0,4,NULL),(24,'chenlin','chenlin5566','陈玲',NULL,0,3,'2014-05-13 14:58:27'),(25,'sw001','1','sw001',NULL,0,3,'2014-05-09 01:45:15'),(26,'sw002','1','sw002',NULL,0,3,NULL),(27,'mj001','1','mj001',NULL,0,5,'2014-05-09 02:22:19'),(28,'mj002','1','mj002',NULL,0,5,'2014-05-09 01:58:03'),(29,'sx','sx',NULL,NULL,0,4,NULL),(30,'sx22','sx22',NULL,NULL,0,4,'2014-05-08 15:06:39'),(31,'qd001','1',NULL,NULL,0,4,'2014-05-08 17:11:52'),(32,'qd00','1',NULL,NULL,0,4,'2014-05-09 02:49:21');

/*Table structure for table `true` */

DROP TABLE IF EXISTS `true`;

CREATE TABLE `true` (
  `a` char(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `true` */

/*Table structure for table `ws_cp_app_data` */

DROP TABLE IF EXISTS `ws_cp_app_data`;

CREATE TABLE `ws_cp_app_data` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_data_id` int(11) NOT NULL COMMENT '所属CP ID',
  `app_name` varchar(128) NOT NULL COMMENT '产品名称',
  `cp_price` double(11,1) NOT NULL DEFAULT '0.0' COMMENT 'CP给出的价格',
  `app_ht_url` varchar(1024) DEFAULT '' COMMENT '登录地址',
  `app_ht_pwd` varchar(128) DEFAULT '' COMMENT '用户名/密码',
  `app_fzr` varchar(128) NOT NULL COMMENT '商务名字',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `qd_id` int(11) DEFAULT '0' COMMENT '分配给的渠道ID',
  `qd_operator` varchar(128) DEFAULT '' COMMENT '分配给的渠道名字',
  `qd_price` double(11,1) DEFAULT '0.0' COMMENT '给出到渠道的价格',
  `app_fzr_id` int(11) NOT NULL COMMENT '商务ID',
  `p_data_name` varchar(128) NOT NULL COMMENT '所属CP名字',
  `is_del` int(1) DEFAULT '1' COMMENT '1 正常 2删除',
  `app_jszq` int(1) NOT NULL DEFAULT '0' COMMENT '结算周期 0 双周 1单周 2月结',
  `mj_id` int(11) NOT NULL DEFAULT '-1' COMMENT '媒介ID',
  `mj_name` varchar(64) DEFAULT NULL COMMENT '媒介名字',
  `sj_time` timestamp NULL DEFAULT NULL COMMENT '上架时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='cp产品列表';

/*Data for the table `ws_cp_app_data` */

insert  into `ws_cp_app_data`(`app_id`,`p_data_id`,`app_name`,`cp_price`,`app_ht_url`,`app_ht_pwd`,`app_fzr`,`create_time`,`qd_id`,`qd_operator`,`qd_price`,`app_fzr_id`,`p_data_name`,`is_del`,`app_jszq`,`mj_id`,`mj_name`,`sj_time`,`update_time`) values (109,19,'101099',1.7,'用户名：s101099\r\n密码： 443133   [李留洋 1.7]',NULL,'小虎','2014-05-20 10:33:54',20,'小小',1.6,2,'江苏-许庆',2,1,-1,NULL,'2014-05-16 10:41:37','2014-05-16 10:41:37'),(110,19,'101156',1.7,'用户名：s101156\r\n密码：  786007【李留洋1.7】',NULL,'小虎','2014-05-20 10:33:55',21,'陈鸣晓',1.6,2,'江苏-许庆',1,0,-1,NULL,'2014-05-16 10:41:37','2014-05-16 10:41:37'),(111,21,'106196',1.8,'',NULL,'小虎','2014-05-20 10:33:58',21,'陈鸣晓',1.6,2,'东梅',1,0,-1,NULL,'2014-05-16 10:41:37','2014-05-16 10:41:37'),(112,19,'106180',1.8,'用户名s106180 密码：286888后台http://data.m.360.cn',NULL,'小虎','2014-05-09 00:44:28',23,'下架渠道-禁用',1.8,4,'江苏-许庆',1,0,-1,NULL,'2014-05-16 10:41:37','2014-05-16 10:41:37'),(113,19,'101290',1.7,'用户名：s101290\r\n密码：  18084',NULL,'小虎','2014-05-09 00:44:28',20,'小小',1.6,4,'江苏-许庆',1,0,-1,NULL,'2014-05-16 10:41:37','2014-05-16 10:41:37'),(114,21,'105986',1.7,'',NULL,'小虎','2014-05-09 00:44:29',21,'陈鸣晓',1.6,4,'东梅',1,0,-1,NULL,'2014-05-16 10:41:37','2014-05-16 10:41:37'),(115,19,'100843',1.7,'用户名：s100843\r\n密码： 903765',NULL,'小虎','2014-05-09 01:57:20',21,'陈鸣晓',1.7,4,'江苏-许庆',1,0,27,'mj001','2014-05-16 10:41:37','2014-05-16 10:41:37'),(116,20,'106275',1.7,'',NULL,'小虎','2014-05-09 00:44:31',-1,'',0.0,4,'小盼',2,0,-1,NULL,'2014-05-16 10:41:37','2014-05-16 10:41:37'),(117,19,'200253',1.7,'',NULL,'小虎','2014-05-09 00:44:31',22,'李刘阳',1.6,4,'江苏-许庆',2,0,-1,NULL,'2014-05-16 10:41:37','2014-05-16 10:41:37'),(118,18,'a',1.0,'a',NULL,'小虎','2014-05-09 00:44:32',-1,'',0.0,4,'杭州真趣网络科技有限公司',2,0,-1,NULL,'2014-05-16 10:41:37','2014-05-16 10:41:37'),(119,19,'截图_80043',1.6,'',NULL,'小虎','2014-05-09 00:44:32',-1,'',0.0,4,'江苏-许庆',2,0,-1,NULL,'2014-05-16 10:41:37','2014-05-16 10:41:37'),(120,22,'cp001',1.8,'aa',NULL,'小虎','2014-05-09 01:59:10',30,'sx22',1.8,4,'CP亭子@CP亭子',1,0,28,'mj002','2014-05-16 10:41:37','2014-05-16 10:41:37'),(121,24,'cpgs201',1.7,'',NULL,'sw001','2014-05-09 01:55:47',31,'qd001',1.6,25,'gs002',1,0,27,'mj001','2014-05-16 10:41:37','2014-05-16 10:41:37'),(122,23,'cpgs101',1.7,'cpgs101',NULL,'sw001','2014-05-09 01:04:00',20,'小小',1.5,25,'gs001',1,0,27,'mj001','2014-05-16 10:41:37','2014-05-16 10:41:37');

/*Table structure for table `ws_cp_data` */

DROP TABLE IF EXISTS `ws_cp_data`;

CREATE TABLE `ws_cp_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cp_company_name` varchar(128) NOT NULL COMMENT '公司名',
  `cp_contact` varchar(128) NOT NULL COMMENT '联系人',
  `cp_email` varchar(64) DEFAULT NULL COMMENT 'email',
  `cp_phone` varchar(128) DEFAULT NULL,
  `cp_qq` varchar(128) DEFAULT NULL,
  `cp_ht_url` varchar(128) DEFAULT NULL COMMENT '登录URL',
  `cp_ht_pwd` varchar(128) DEFAULT NULL COMMENT '用户名/密码',
  `cp_address` varchar(512) DEFAULT NULL COMMENT '地址',
  `cp_note` varchar(1000) DEFAULT NULL COMMENT '备注',
  `cp_fzr` varchar(128) DEFAULT NULL COMMENT 'CP负责人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_del` int(1) DEFAULT '1' COMMENT '2删除标记 1正常',
  `sw_id` int(11) DEFAULT NULL COMMENT '商务ID',
  `sw_name` varchar(64) DEFAULT NULL COMMENT '商务名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='cp数据表';

/*Data for the table `ws_cp_data` */

insert  into `ws_cp_data`(`id`,`cp_company_name`,`cp_contact`,`cp_email`,`cp_phone`,`cp_qq`,`cp_ht_url`,`cp_ht_pwd`,`cp_address`,`cp_note`,`cp_fzr`,`create_time`,`is_del`,`sw_id`,`sw_name`) values (18,'杭州真趣网络科技有限公司','廖伟秘',NULL,NULL,NULL,NULL,NULL,NULL,'廖伟秘          \r\n杭州真趣网络科技有限公司\r\n地址：杭州市文一西路75号数字娱乐产业园一号楼501室 \r\n邮编：310011\r\nQ  Q: 1589407946\r\n手机：15858282694\r\n座机：0571-87966269\r\n网址：www.joyreach.com\r\n邮箱：weimi.liao@joyreach.com \r\n我们做单机游戏的 短信付费  没暗扣','管理员','2014-05-15 11:47:26',1,2,NULL),(19,'江苏-许庆','许庆',NULL,NULL,NULL,NULL,NULL,NULL,'','管理员','2014-05-15 11:47:27',1,2,NULL),(20,'小盼','小盼',NULL,NULL,NULL,NULL,NULL,NULL,'？？','小虎','2014-05-15 11:47:27',1,2,NULL),(21,'东梅','东梅',NULL,NULL,NULL,NULL,NULL,NULL,'东梅','小虎','2014-05-15 11:47:28',1,2,NULL),(22,'CP亭子','CP亭子',NULL,NULL,NULL,NULL,NULL,NULL,'','小虎','2014-05-15 11:47:46',1,2,NULL),(23,'gs001','gs001',NULL,NULL,NULL,NULL,NULL,NULL,'gs001','sw001','2014-05-08 15:33:54',1,25,'sw001'),(24,'gs002','gs002',NULL,NULL,NULL,NULL,NULL,NULL,'gs002','sw001','2014-05-08 15:59:16',1,25,'sw001');

/*Table structure for table `ws_jiesuan` */

DROP TABLE IF EXISTS `ws_jiesuan`;

CREATE TABLE `ws_jiesuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qd_id` int(11) NOT NULL COMMENT '渠道ID',
  `qd_name` varchar(126) NOT NULL COMMENT '渠道名字',
  `qd_money` double(11,1) NOT NULL COMMENT 'qd_count * qd_price',
  `cp_money` double(11,1) NOT NULL COMMENT 'cp_count * cp_price',
  `lilun` double(11,1) NOT NULL COMMENT 'cp_money-qd_money',
  `operator_name` varchar(126) NOT NULL COMMENT '谁结算的',
  `operator_id` int(11) NOT NULL COMMENT 'ID',
  `number` int(1) NOT NULL COMMENT '结算编号 +1',
  `begin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '结算状态 1 生成 2结算完毕',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='结算表';

/*Data for the table `ws_jiesuan` */

insert  into `ws_jiesuan`(`id`,`qd_id`,`qd_name`,`qd_money`,`cp_money`,`lilun`,`operator_name`,`operator_id`,`number`,`begin_time`,`end_time`,`status`,`create_time`) values (1,0,'',0.0,0.0,0.0,'',0,0,'2014-02-21 21:57:28','0000-00-00 00:00:00',1,'0000-00-00 00:00:00'),(2,0,'',0.0,0.0,0.0,'',0,0,'2014-02-21 21:57:30','0000-00-00 00:00:00',1,'0000-00-00 00:00:00');

/*Table structure for table `ws_jiesuan_detail` */

DROP TABLE IF EXISTS `ws_jiesuan_detail`;

CREATE TABLE `ws_jiesuan_detail` (
  `id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL COMMENT '所属结算表ID',
  `app_id` int(11) NOT NULL,
  `app_name` varchar(126) NOT NULL,
  `qd_id` int(11) NOT NULL,
  `cp_id` int(11) NOT NULL,
  `qd_count` int(11) NOT NULL COMMENT '渠道结算count',
  `cp_count` int(11) NOT NULL COMMENT 'CP结算COUNT',
  `cp_price` double(11,1) NOT NULL COMMENT 'cp价格',
  `qd_price` double(11,1) NOT NULL COMMENT '渠道价格',
  `qd_money` double(11,1) NOT NULL COMMENT 'qd_price*qd_count',
  `cp_money` double(11,1) NOT NULL COMMENT 'cp_price*cp_count',
  `lilun` double(11,1) NOT NULL COMMENT '利润',
  `begin_time` datetime NOT NULL COMMENT '结算开始时间',
  `end_time` datetime NOT NULL COMMENT '结算结束时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算子表';

/*Data for the table `ws_jiesuan_detail` */

/*Table structure for table `ws_qd_data` */

DROP TABLE IF EXISTS `ws_qd_data`;

CREATE TABLE `ws_qd_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qd_id` int(11) NOT NULL COMMENT '渠道ID',
  `app_id` int(11) NOT NULL COMMENT '应用ID',
  `cp_count` int(11) NOT NULL COMMENT 'CP后台推广量',
  `qd_count` int(11) NOT NULL COMMENT '给渠道的推广量',
  `bj_id` int(11) NOT NULL COMMENT '谁录入的ID',
  `bj_name` varchar(64) NOT NULL COMMENT '谁录入的NAME',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `cp_price` double(11,1) NOT NULL COMMENT 'CP给出的价格',
  `qd_price` double(11,1) NOT NULL COMMENT '给到渠道价格',
  `cp_money` double(11,1) NOT NULL COMMENT 'cp计算得到的总价',
  `qd_money` double(11,1) NOT NULL COMMENT '渠道计算得到总价',
  `cp_status` int(1) DEFAULT NULL COMMENT '1未录入/2已录入',
  `index_time` datetime NOT NULL COMMENT '数据对应时间',
  `mj_id` int(11) DEFAULT NULL COMMENT '媒介ID 放包',
  `sw_id` int(11) DEFAULT NULL COMMENT '商务ID 接包',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;

/*Data for the table `ws_qd_data` */

insert  into `ws_qd_data`(`id`,`qd_id`,`app_id`,`cp_count`,`qd_count`,`bj_id`,`bj_name`,`update_time`,`cp_price`,`qd_price`,`cp_money`,`qd_money`,`cp_status`,`index_time`,`mj_id`,`sw_id`) values (1,20,109,0,0,4,'小虎','2014-04-23 11:14:14',1.7,1.6,0.0,0.0,1,'2014-04-23 00:00:00',NULL,NULL),(2,20,109,286,286,4,'小虎','2014-04-23 11:14:14',1.7,1.6,486.2,457.6,2,'2014-04-22 00:00:00',NULL,NULL),(3,20,109,326,326,4,'小虎','2014-04-23 11:14:14',1.7,1.6,554.2,521.6,2,'2014-04-21 00:00:00',NULL,NULL),(4,20,109,175,175,4,'小虎','2014-04-23 11:14:14',1.7,1.6,297.5,280.0,2,'2014-04-20 00:00:00',NULL,NULL),(5,20,110,0,0,4,'小虎','2014-04-23 11:14:14',1.7,1.6,0.0,0.0,1,'2014-04-23 00:00:00',NULL,NULL),(6,20,110,1138,1138,4,'小虎','2014-04-23 11:14:14',1.7,1.6,1934.6,1820.8,2,'2014-04-22 00:00:00',NULL,NULL),(7,20,110,818,818,4,'小虎','2014-04-23 11:14:14',1.7,1.6,1390.6,1308.8,2,'2014-04-21 00:00:00',NULL,NULL),(8,20,110,681,681,4,'小虎','2014-04-23 11:14:14',1.7,1.6,1157.7,1089.6,2,'2014-04-20 00:00:00',NULL,NULL),(9,20,112,0,0,4,'小虎','2014-04-23 11:14:15',1.7,1.6,0.0,0.0,1,'2014-04-23 00:00:00',NULL,NULL),(10,20,112,298,298,4,'小虎','2014-04-23 11:14:15',1.7,1.6,506.6,476.8,2,'2014-04-22 00:00:00',NULL,NULL),(11,20,112,289,289,4,'小虎','2014-04-23 11:14:15',1.7,1.6,491.3,462.4,2,'2014-04-21 00:00:00',NULL,NULL),(12,20,112,324,324,4,'小虎','2014-04-23 11:14:15',1.7,1.6,550.8,518.4,2,'2014-04-20 00:00:00',NULL,NULL),(13,20,113,0,0,4,'小虎','2014-04-23 11:14:15',1.7,1.6,0.0,0.0,1,'2014-04-23 00:00:00',NULL,NULL),(14,20,113,430,430,4,'小虎','2014-04-23 11:14:15',1.7,1.6,731.0,688.0,2,'2014-04-22 00:00:00',NULL,NULL),(15,20,113,401,401,4,'小虎','2014-04-23 11:14:15',1.7,1.6,681.7,641.6,2,'2014-04-21 00:00:00',NULL,NULL),(16,20,113,535,535,4,'小虎','2014-04-23 11:14:15',1.7,1.6,909.5,856.0,2,'2014-04-20 00:00:00',NULL,NULL),(17,20,115,0,0,4,'小虎','2014-04-23 11:14:15',1.7,1.6,0.0,0.0,1,'2014-04-23 00:00:00',NULL,NULL),(18,20,115,253,253,4,'小虎','2014-04-23 11:14:15',1.7,1.6,430.1,404.8,2,'2014-04-22 00:00:00',NULL,NULL),(19,20,115,114,114,4,'小虎','2014-04-23 11:14:15',1.7,1.6,193.8,182.4,2,'2014-04-21 00:00:00',NULL,NULL),(20,20,115,134,134,4,'小虎','2014-04-23 11:14:15',1.7,1.6,227.8,214.4,2,'2014-04-20 00:00:00',NULL,NULL),(21,20,116,0,0,4,'小虎','2014-04-23 11:14:15',1.7,1.6,0.0,0.0,1,'2014-04-23 00:00:00',NULL,NULL),(22,20,116,2718,2718,4,'小虎','2014-04-23 11:14:15',1.7,1.6,4620.6,4348.8,2,'2014-04-22 00:00:00',NULL,NULL),(23,20,116,429,429,4,'小虎','2014-04-23 11:14:15',1.7,1.6,729.3,686.4,2,'2014-04-21 00:00:00',NULL,NULL),(24,20,116,0,0,4,'小虎','2014-04-23 11:14:15',1.7,1.6,0.0,0.0,1,'2014-04-20 00:00:00',NULL,NULL),(25,20,109,205,205,4,'小虎','2014-04-23 11:17:12',1.7,1.6,348.5,328.0,2,'2014-04-19 00:00:00',NULL,NULL),(26,20,109,88,88,4,'小虎','2014-04-23 11:17:12',1.7,1.6,149.6,140.8,2,'2014-04-18 00:00:00',NULL,NULL),(27,20,109,296,296,4,'小虎','2014-04-23 11:17:12',1.7,1.6,503.2,473.6,2,'2014-04-17 00:00:00',NULL,NULL),(28,20,109,1,1,4,'小虎','2014-04-23 11:17:12',1.7,1.6,1.7,1.6,2,'2014-04-16 00:00:00',NULL,NULL),(29,20,110,849,849,4,'小虎','2014-04-23 11:17:12',1.7,1.6,1443.3,1358.4,2,'2014-04-19 00:00:00',NULL,NULL),(30,20,110,1701,1701,4,'小虎','2014-04-23 11:17:12',1.7,1.6,2891.7,2721.6,2,'2014-04-18 00:00:00',NULL,NULL),(31,20,110,352,352,4,'小虎','2014-04-23 11:17:12',1.7,1.6,598.4,563.2,2,'2014-04-17 00:00:00',NULL,NULL),(32,20,110,0,0,4,'小虎','2014-04-23 11:17:12',1.7,1.6,0.0,0.0,1,'2014-04-16 00:00:00',NULL,NULL),(33,20,112,120,120,4,'小虎','2014-04-23 11:17:12',1.7,1.6,204.0,192.0,2,'2014-04-19 00:00:00',NULL,NULL),(34,20,112,253,253,4,'小虎','2014-04-23 11:17:12',1.7,1.6,430.1,404.8,2,'2014-04-18 00:00:00',NULL,NULL),(35,20,112,259,259,4,'小虎','2014-04-23 11:17:12',1.7,1.6,440.3,414.4,2,'2014-04-17 00:00:00',NULL,NULL),(36,20,112,175,175,4,'小虎','2014-04-23 11:17:12',1.7,1.6,297.5,280.0,2,'2014-04-16 00:00:00',NULL,NULL),(37,20,113,540,540,4,'小虎','2014-04-23 11:17:12',1.7,1.6,918.0,864.0,2,'2014-04-19 00:00:00',NULL,NULL),(38,20,113,631,631,4,'小虎','2014-04-23 11:17:12',1.7,1.6,1072.7,1009.6,2,'2014-04-18 00:00:00',NULL,NULL),(39,20,113,653,653,4,'小虎','2014-04-23 11:17:12',1.7,1.6,1110.1,1044.8,2,'2014-04-17 00:00:00',NULL,NULL),(40,20,113,546,546,4,'小虎','2014-04-23 11:17:12',1.7,1.6,928.2,873.6,2,'2014-04-16 00:00:00',NULL,NULL),(41,20,115,170,170,4,'小虎','2014-04-23 11:17:12',1.7,1.6,289.0,272.0,2,'2014-04-19 00:00:00',NULL,NULL),(42,20,115,178,178,4,'小虎','2014-04-23 11:17:12',1.7,1.6,302.6,284.8,2,'2014-04-18 00:00:00',NULL,NULL),(43,20,115,186,186,4,'小虎','2014-04-23 11:17:12',1.7,1.6,316.2,297.6,2,'2014-04-17 00:00:00',NULL,NULL),(44,20,115,194,194,4,'小虎','2014-04-23 11:17:12',1.7,1.6,329.8,310.4,2,'2014-04-16 00:00:00',NULL,NULL),(45,20,116,0,0,4,'小虎','2014-04-23 11:17:12',1.7,1.6,0.0,0.0,1,'2014-04-19 00:00:00',NULL,NULL),(46,20,116,0,0,4,'小虎','2014-04-23 11:17:12',1.7,1.6,0.0,0.0,1,'2014-04-18 00:00:00',NULL,NULL),(47,20,116,0,0,4,'小虎','2014-04-23 11:17:12',1.7,1.6,0.0,0.0,1,'2014-04-17 00:00:00',NULL,NULL),(48,20,116,0,0,4,'小虎','2014-04-23 11:17:12',1.7,1.6,0.0,0.0,1,'2014-04-16 00:00:00',NULL,NULL),(49,20,109,0,0,4,'小虎','2014-04-23 13:39:49',1.7,1.6,0.0,0.0,1,'2014-04-15 00:00:00',NULL,NULL),(50,20,109,0,0,4,'小虎','2014-04-23 13:39:49',1.7,1.6,0.0,0.0,1,'2014-04-14 00:00:00',NULL,NULL),(51,20,110,0,0,4,'小虎','2014-04-23 13:39:49',1.7,1.6,0.0,0.0,1,'2014-04-15 00:00:00',NULL,NULL),(52,20,110,0,0,4,'小虎','2014-04-23 13:39:49',1.7,1.6,0.0,0.0,1,'2014-04-14 00:00:00',NULL,NULL),(53,20,112,155,155,4,'小虎','2014-04-23 13:39:49',1.7,1.6,263.5,248.0,2,'2014-04-15 00:00:00',NULL,NULL),(54,20,112,44,44,4,'小虎','2014-04-23 13:39:49',1.7,1.6,74.8,70.4,2,'2014-04-14 00:00:00',NULL,NULL),(55,20,113,573,573,4,'小虎','2014-04-23 13:39:49',1.7,1.6,974.1,916.8,2,'2014-04-15 00:00:00',NULL,NULL),(56,20,113,163,163,4,'小虎','2014-04-23 13:39:49',1.7,1.6,277.1,260.8,2,'2014-04-14 00:00:00',NULL,NULL),(57,20,115,197,197,4,'小虎','2014-04-23 13:39:49',1.7,1.6,334.9,315.2,2,'2014-04-15 00:00:00',NULL,NULL),(58,20,115,199,199,4,'小虎','2014-04-23 13:39:49',1.7,1.6,338.3,318.4,2,'2014-04-14 00:00:00',NULL,NULL),(59,20,116,0,0,4,'小虎','2014-04-23 13:39:49',1.7,1.6,0.0,0.0,1,'2014-04-15 00:00:00',NULL,NULL),(60,20,116,0,0,4,'小虎','2014-04-23 13:39:49',1.7,1.6,0.0,0.0,1,'2014-04-14 00:00:00',NULL,NULL),(61,21,111,140,140,4,'小虎','2014-04-23 14:11:47',1.7,1.6,238.0,224.0,2,'2014-04-22 00:00:00',NULL,NULL),(62,21,111,298,298,4,'小虎','2014-04-23 14:11:47',1.7,1.6,506.6,476.8,2,'2014-04-21 00:00:00',NULL,NULL),(63,21,111,266,266,4,'小虎','2014-04-23 14:11:47',1.7,1.6,452.2,425.6,2,'2014-04-20 00:00:00',NULL,NULL),(64,21,114,140,140,4,'小虎','2014-04-23 14:11:47',1.7,1.6,238.0,224.0,2,'2014-04-22 00:00:00',NULL,NULL),(65,21,114,115,115,4,'小虎','2014-04-23 14:11:47',1.7,1.6,195.5,184.0,2,'2014-04-21 00:00:00',NULL,NULL),(66,21,114,207,207,4,'小虎','2014-04-23 14:11:47',1.7,1.6,351.9,331.2,2,'2014-04-20 00:00:00',NULL,NULL),(67,21,111,288,288,4,'小虎','2014-04-23 14:12:06',1.7,1.6,489.6,460.8,2,'2014-04-19 00:00:00',NULL,NULL),(68,21,111,235,235,4,'小虎','2014-04-23 14:12:06',1.7,1.6,399.5,376.0,2,'2014-04-18 00:00:00',NULL,NULL),(69,21,111,290,290,4,'小虎','2014-04-23 14:12:06',1.7,1.6,493.0,464.0,2,'2014-04-17 00:00:00',NULL,NULL),(70,21,111,143,143,4,'小虎','2014-04-23 14:12:06',1.7,1.6,243.1,228.8,2,'2014-04-16 00:00:00',NULL,NULL),(71,21,114,268,268,4,'小虎','2014-04-23 14:12:06',1.7,1.6,455.6,428.8,2,'2014-04-19 00:00:00',NULL,NULL),(72,21,114,166,166,4,'小虎','2014-04-23 14:12:06',1.7,1.6,282.2,265.6,2,'2014-04-18 00:00:00',NULL,NULL),(73,21,114,0,0,4,'小虎','2014-04-23 14:12:06',1.7,1.6,0.0,0.0,1,'2014-04-17 00:00:00',NULL,NULL),(74,21,114,0,0,4,'小虎','2014-04-23 14:12:06',1.7,1.6,0.0,0.0,1,'2014-04-16 00:00:00',NULL,NULL),(75,22,117,268,268,4,'小虎','2014-04-24 10:53:13',1.7,1.6,455.6,428.8,2,'2014-04-23 00:00:00',NULL,NULL),(76,22,117,367,367,4,'小虎','2014-04-24 10:53:13',1.7,1.6,623.9,587.2,2,'2014-04-22 00:00:00',NULL,NULL),(77,22,117,318,318,4,'小虎','2014-04-24 10:53:13',1.7,1.6,540.6,508.8,2,'2014-04-21 00:00:00',NULL,NULL),(78,22,117,305,305,4,'小虎','2014-04-24 10:53:18',1.7,1.6,518.5,488.0,2,'2014-04-20 00:00:00',NULL,NULL),(79,22,117,452,452,4,'小虎','2014-04-24 10:53:18',1.7,1.6,768.4,723.2,2,'2014-04-19 00:00:00',NULL,NULL),(80,22,117,463,463,4,'小虎','2014-04-24 10:53:18',1.7,1.6,787.1,740.8,2,'2014-04-18 00:00:00',NULL,NULL),(81,22,117,572,572,4,'小虎','2014-04-24 10:53:18',1.7,1.6,972.4,915.2,2,'2014-04-17 00:00:00',NULL,NULL),(82,22,117,389,389,4,'小虎','2014-04-24 10:53:18',1.7,1.6,661.3,622.4,2,'2014-04-16 00:00:00',NULL,NULL),(83,22,117,247,247,4,'小虎','2014-04-24 10:53:18',1.7,1.6,419.9,395.2,2,'2014-04-15 00:00:00',NULL,NULL),(84,22,117,24,24,4,'小虎','2014-04-24 10:53:18',1.7,1.6,40.8,38.4,2,'2014-04-14 00:00:00',NULL,NULL),(85,22,117,0,0,24,'陈玲','2014-04-28 11:04:59',1.7,1.6,0.0,0.0,1,'2014-04-27 00:00:00',NULL,NULL),(86,22,117,0,0,24,'陈玲','2014-04-28 11:04:59',1.7,1.6,0.0,0.0,1,'2014-04-26 00:00:00',NULL,NULL),(87,22,117,0,0,24,'陈玲','2014-04-28 11:04:59',1.7,1.6,0.0,0.0,1,'2014-04-25 00:00:00',NULL,NULL),(88,20,109,0,0,4,'小虎','2014-04-28 14:00:28',1.7,1.6,0.0,0.0,1,'2014-04-27 00:00:00',NULL,NULL),(89,20,109,0,0,4,'小虎','2014-04-28 14:00:28',1.7,1.6,0.0,0.0,1,'2014-04-26 00:00:00',NULL,NULL),(90,20,109,0,0,4,'小虎','2014-04-28 14:00:28',1.7,1.6,0.0,0.0,1,'2014-04-25 00:00:00',NULL,NULL),(91,20,110,0,0,4,'小虎','2014-04-28 14:00:28',1.7,1.6,0.0,0.0,1,'2014-04-27 00:00:00',NULL,NULL),(92,20,110,0,0,4,'小虎','2014-04-28 14:00:28',1.7,1.6,0.0,0.0,1,'2014-04-26 00:00:00',NULL,NULL),(93,20,110,0,0,4,'小虎','2014-04-28 14:00:28',1.7,1.6,0.0,0.0,1,'2014-04-25 00:00:00',NULL,NULL),(94,20,113,0,0,4,'小虎','2014-04-28 14:00:28',1.7,1.6,0.0,0.0,1,'2014-04-27 00:00:00',NULL,NULL),(95,20,113,0,0,4,'小虎','2014-04-28 14:00:28',1.7,1.6,0.0,0.0,1,'2014-04-26 00:00:00',NULL,NULL),(96,20,113,0,0,4,'小虎','2014-04-28 14:00:28',1.7,1.6,0.0,0.0,1,'2014-04-25 00:00:00',NULL,NULL),(97,20,116,0,0,4,'小虎','2014-04-28 14:00:28',1.7,1.6,0.0,0.0,1,'2014-04-27 00:00:00',NULL,NULL),(98,20,116,0,0,4,'小虎','2014-04-28 14:00:28',1.7,1.6,0.0,0.0,1,'2014-04-26 00:00:00',NULL,NULL),(99,20,116,0,0,4,'小虎','2014-04-28 14:00:28',1.7,1.6,0.0,0.0,1,'2014-04-25 00:00:00',NULL,NULL),(100,20,109,0,0,4,'小虎','2014-04-28 14:00:37',1.7,1.6,0.0,0.0,1,'2014-04-24 00:00:00',NULL,NULL),(101,20,110,0,0,4,'小虎','2014-04-28 14:00:37',1.7,1.6,0.0,0.0,1,'2014-04-24 00:00:00',NULL,NULL),(102,20,113,0,0,4,'小虎','2014-04-28 14:00:37',1.7,1.6,0.0,0.0,1,'2014-04-24 00:00:00',NULL,NULL),(103,20,116,0,0,4,'小虎','2014-04-28 14:00:37',1.7,1.6,0.0,0.0,1,'2014-04-24 00:00:00',NULL,NULL),(104,20,109,0,0,4,'小虎','2014-04-30 19:14:19',1.7,1.6,0.0,0.0,1,'2014-04-29 00:00:00',NULL,NULL),(105,20,110,0,0,4,'小虎','2014-04-30 19:14:29',1.7,1.6,0.0,0.0,1,'2014-04-29 00:00:00',NULL,NULL),(106,21,111,0,0,4,'小虎','2014-04-30 19:14:30',1.8,1.6,0.0,0.0,1,'2014-04-29 00:00:00',NULL,NULL),(107,23,112,0,0,4,'小虎','2014-04-30 19:14:31',1.8,1.8,0.0,0.0,1,'2014-04-29 00:00:00',NULL,NULL),(108,20,113,0,0,4,'小虎','2014-04-30 19:14:31',1.7,1.6,0.0,0.0,1,'2014-04-29 00:00:00',NULL,NULL),(109,21,114,0,0,4,'小虎','2014-04-30 19:14:32',1.7,1.6,0.0,0.0,1,'2014-04-29 00:00:00',NULL,NULL),(110,23,115,0,0,4,'小虎','2014-04-30 19:14:33',1.7,1.7,0.0,0.0,1,'2014-04-29 00:00:00',NULL,NULL),(111,20,116,0,0,4,'小虎','2014-04-30 19:14:33',1.7,1.6,0.0,0.0,1,'2014-04-29 00:00:00',NULL,NULL),(112,22,117,0,0,4,'小虎','2014-04-30 19:14:34',1.7,1.6,0.0,0.0,1,'2014-04-29 00:00:00',NULL,NULL),(113,-1,119,0,0,4,'小虎','2014-04-30 19:36:20',1.6,0.0,0.0,0.0,1,'2014-04-29 00:00:00',NULL,NULL),(114,20,109,0,0,4,'小虎','2014-05-04 18:02:53',1.7,1.6,0.0,0.0,1,'2014-05-03 00:00:00',NULL,NULL),(115,20,110,0,0,4,'小虎','2014-05-04 18:02:53',1.7,1.6,0.0,0.0,1,'2014-05-03 00:00:00',NULL,NULL),(116,21,111,0,0,4,'小虎','2014-05-04 18:02:54',1.8,1.6,0.0,0.0,1,'2014-05-03 00:00:00',NULL,NULL),(117,23,112,0,0,4,'小虎','2014-05-04 18:02:54',1.8,1.8,0.0,0.0,1,'2014-05-03 00:00:00',NULL,NULL),(118,20,113,0,0,4,'小虎','2014-05-04 18:02:55',1.7,1.6,0.0,0.0,1,'2014-05-03 00:00:00',NULL,NULL),(119,21,114,0,0,4,'小虎','2014-05-04 18:02:56',1.7,1.6,0.0,0.0,1,'2014-05-03 00:00:00',NULL,NULL),(120,23,115,0,0,4,'小虎','2014-05-04 18:02:56',1.7,1.7,0.0,0.0,1,'2014-05-03 00:00:00',NULL,NULL),(121,20,116,2,2,4,'小虎','2014-05-04 18:02:57',1.7,1.6,3.4,3.2,2,'2014-05-03 00:00:00',NULL,NULL),(122,22,117,0,0,4,'小虎','2014-05-04 18:02:58',1.7,1.6,0.0,0.0,1,'2014-05-03 00:00:00',NULL,NULL),(123,-1,119,0,0,4,'小虎','2014-05-04 18:02:58',1.6,0.0,0.0,0.0,1,'2014-05-03 00:00:00',NULL,NULL),(124,20,109,0,0,4,'小虎','2014-05-05 00:02:36',1.7,1.6,0.0,0.0,1,'2014-05-04 00:00:00',NULL,NULL),(125,20,110,0,0,4,'小虎','2014-05-05 00:02:36',1.7,1.6,0.0,0.0,1,'2014-05-04 00:00:00',NULL,NULL),(126,21,111,0,0,4,'小虎','2014-05-05 00:02:37',1.8,1.6,0.0,0.0,1,'2014-05-04 00:00:00',NULL,NULL),(127,23,112,0,0,4,'小虎','2014-05-05 00:02:37',1.8,1.8,0.0,0.0,1,'2014-05-04 00:00:00',NULL,NULL),(128,20,113,0,0,4,'小虎','2014-05-05 00:02:37',1.7,1.6,0.0,0.0,1,'2014-05-04 00:00:00',NULL,NULL),(129,21,114,0,0,4,'小虎','2014-05-05 00:02:38',1.7,1.6,0.0,0.0,1,'2014-05-04 00:00:00',NULL,NULL),(130,23,115,0,0,4,'小虎','2014-05-05 00:02:38',1.7,1.7,0.0,0.0,1,'2014-05-04 00:00:00',NULL,NULL),(131,20,116,0,0,4,'小虎','2014-05-05 00:02:39',1.7,1.6,0.0,0.0,1,'2014-05-04 00:00:00',NULL,NULL),(132,22,117,0,0,4,'小虎','2014-05-05 00:02:39',1.7,1.6,0.0,0.0,1,'2014-05-04 00:00:00',NULL,NULL),(133,-1,119,0,0,4,'小虎','2014-05-05 00:02:40',1.6,0.0,0.0,0.0,1,'2014-05-04 00:00:00',NULL,NULL),(134,20,109,0,0,4,'小虎','2014-05-06 17:57:06',1.7,1.6,0.0,0.0,1,'2014-05-05 00:00:00',NULL,NULL),(135,20,110,3,3,4,'小虎','2014-05-06 17:57:06',1.7,1.6,5.1,4.8,2,'2014-05-05 00:00:00',NULL,NULL),(136,21,111,0,0,4,'小虎','2014-05-06 17:57:07',1.8,1.6,0.0,0.0,1,'2014-05-05 00:00:00',NULL,NULL),(137,23,112,0,0,4,'小虎','2014-05-06 17:57:07',1.8,1.8,0.0,0.0,1,'2014-05-05 00:00:00',NULL,NULL),(138,20,113,0,0,4,'小虎','2014-05-06 17:57:08',1.7,1.6,0.0,0.0,1,'2014-05-05 00:00:00',NULL,NULL),(139,21,114,0,0,4,'小虎','2014-05-06 17:57:08',1.7,1.6,0.0,0.0,1,'2014-05-05 00:00:00',NULL,NULL),(140,23,115,0,0,4,'小虎','2014-05-06 17:57:09',1.7,1.7,0.0,0.0,1,'2014-05-05 00:00:00',NULL,NULL),(141,20,116,0,0,4,'小虎','2014-05-06 17:57:09',1.7,1.6,0.0,0.0,1,'2014-05-05 00:00:00',NULL,NULL),(142,0,119,0,0,4,'小虎','2014-05-06 17:57:09',1.6,0.0,0.0,0.0,1,'2014-05-05 00:00:00',NULL,NULL),(143,21,111,0,0,4,'小虎','2014-05-07 00:26:02',1.8,1.6,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(144,23,112,0,0,4,'小虎','2014-05-07 00:26:03',1.8,1.8,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(145,20,113,2,2,4,'小虎','2014-05-07 00:26:03',1.7,1.6,3.4,3.2,2,'2014-05-06 00:00:00',NULL,NULL),(146,21,114,0,0,4,'小虎','2014-05-07 00:26:04',1.7,1.6,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(147,23,115,0,0,4,'小虎','2014-05-07 00:26:04',1.7,1.7,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(148,20,116,0,0,4,'小虎','2014-05-07 00:26:05',1.7,1.6,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(149,0,119,0,0,4,'小虎','2014-05-07 00:26:05',1.6,0.0,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(150,21,110,0,0,4,'小虎','2014-05-07 00:48:03',1.7,1.6,0.0,0.0,2,'2014-05-06 00:00:00',NULL,NULL),(151,21,110,2,2,4,'小虎','2014-05-07 01:00:05',1.7,1.6,3.4,3.2,2,'2014-05-06 00:00:00',NULL,NULL),(152,21,111,0,0,4,'小虎','2014-05-07 01:00:06',1.8,1.6,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(153,23,112,0,0,4,'小虎','2014-05-07 01:00:06',1.8,1.8,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(154,20,113,0,0,4,'小虎','2014-05-07 01:00:06',1.7,1.6,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(155,21,114,0,0,4,'小虎','2014-05-07 01:00:07',1.7,1.6,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(156,23,115,0,0,4,'小虎','2014-05-07 01:00:07',1.7,1.7,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(157,20,116,0,0,4,'小虎','2014-05-07 01:00:08',1.7,1.6,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(158,0,119,0,0,4,'小虎','2014-05-07 01:00:08',1.6,0.0,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(159,21,110,0,0,4,'小虎','2014-05-07 17:51:28',1.7,1.6,0.0,0.0,1,'2014-05-01 00:00:00',NULL,NULL),(160,21,110,0,0,4,'小虎','2014-05-07 17:54:50',1.7,1.6,0.0,0.0,1,'2014-05-02 00:00:00',NULL,NULL),(161,23,112,0,0,4,'小虎','2014-05-07 18:01:17',1.8,1.8,0.0,0.0,1,'2014-05-01 00:00:00',NULL,NULL),(162,23,112,0,0,4,'小虎','2014-05-07 18:01:22',1.8,1.8,0.0,0.0,1,'2014-05-02 00:00:00',NULL,NULL),(163,20,109,44,44,27,'mj001','2014-05-07 18:34:34',1.7,1.6,74.8,70.4,2,'2014-05-06 00:00:00',NULL,NULL),(164,22,117,0,0,4,'小虎','2014-05-07 18:34:35',1.7,1.6,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(165,0,118,0,0,4,'小虎','2014-05-07 18:34:36',1.0,0.0,0.0,0.0,1,'2014-05-06 00:00:00',NULL,NULL),(166,20,109,3,3,27,'mj001','2014-05-08 00:24:20',1.7,1.6,5.1,4.8,2,'2014-05-07 00:00:00',NULL,NULL),(167,21,110,0,0,4,'小虎','2014-05-08 00:24:20',1.7,1.6,0.0,0.0,1,'2014-05-07 00:00:00',NULL,NULL),(168,21,111,0,0,4,'小虎','2014-05-08 00:24:21',1.8,1.6,0.0,0.0,1,'2014-05-07 00:00:00',NULL,NULL),(169,23,112,0,0,4,'小虎','2014-05-08 00:24:22',1.8,1.8,0.0,0.0,1,'2014-05-07 00:00:00',NULL,NULL),(170,20,113,0,0,4,'小虎','2014-05-08 00:24:22',1.7,1.6,0.0,0.0,1,'2014-05-07 00:00:00',NULL,NULL),(171,21,114,0,0,4,'小虎','2014-05-08 00:24:23',1.7,1.6,0.0,0.0,1,'2014-05-07 00:00:00',NULL,NULL),(172,21,115,0,0,4,'小虎','2014-05-08 00:24:23',1.7,1.7,0.0,0.0,1,'2014-05-07 00:00:00',NULL,NULL),(173,-1,116,0,0,4,'小虎','2014-05-08 00:24:24',1.7,0.0,0.0,0.0,1,'2014-05-07 00:00:00',NULL,NULL),(174,22,117,0,0,4,'小虎','2014-05-08 00:24:24',1.7,1.6,0.0,0.0,1,'2014-05-07 00:00:00',NULL,NULL),(175,-1,118,0,0,4,'小虎','2014-05-08 00:24:25',1.0,0.0,0.0,0.0,1,'2014-05-07 00:00:00',NULL,NULL),(176,-1,119,0,0,4,'小虎','2014-05-08 00:24:25',1.6,0.0,0.0,0.0,1,'2014-05-07 00:00:00',NULL,NULL),(177,0,120,0,0,-1,'自动生成','2014-05-08 14:48:51',1.8,0.0,0.0,0.0,1,'2014-05-07 00:00:00',-1,4),(178,20,122,2,2,27,'mj001','2014-05-09 01:42:45',1.7,1.7,3.4,3.4,2,'2014-05-07 00:00:00',-1,25),(179,20,109,3,3,27,'mj001','2014-05-09 00:17:19',1.7,1.6,5.1,4.8,2,'2014-05-08 00:00:00',-1,4),(180,21,110,0,0,-1,'自动生成','2014-05-09 00:17:25',1.7,1.6,0.0,0.0,1,'2014-05-08 00:00:00',-1,4),(181,21,111,0,0,-1,'自动生成','2014-05-09 00:17:33',1.8,1.6,0.0,0.0,1,'2014-05-08 00:00:00',-1,4),(182,23,112,0,0,-1,'自动生成','2014-05-09 00:17:34',1.8,1.8,0.0,0.0,1,'2014-05-08 00:00:00',-1,4),(183,20,113,0,0,-1,'自动生成','2014-05-09 00:17:34',1.7,1.6,0.0,0.0,1,'2014-05-08 00:00:00',-1,4),(184,21,114,0,0,-1,'自动生成','2014-05-09 00:17:35',1.7,1.6,0.0,0.0,1,'2014-05-08 00:00:00',-1,4),(185,21,115,0,0,-1,'自动生成','2014-05-09 00:17:35',1.7,1.7,0.0,0.0,1,'2014-05-08 00:00:00',-1,4),(186,-1,116,0,0,-1,'自动生成','2014-05-09 00:17:36',1.7,0.0,0.0,0.0,1,'2014-05-08 00:00:00',-1,4),(187,22,117,0,0,-1,'自动生成','2014-05-09 00:17:36',1.7,1.6,0.0,0.0,1,'2014-05-08 00:00:00',-1,4),(188,-1,118,0,0,-1,'自动生成','2014-05-09 00:17:37',1.0,0.0,0.0,0.0,1,'2014-05-08 00:00:00',-1,4),(189,-1,119,0,0,-1,'自动生成','2014-05-09 00:17:37',1.6,0.0,0.0,0.0,1,'2014-05-08 00:00:00',-1,4),(190,0,120,0,0,-1,'自动生成','2014-05-09 00:17:38',1.8,0.0,0.0,0.0,1,'2014-05-08 00:00:00',-1,4),(191,20,121,2,2,27,'mj001','2014-05-09 01:52:02',1.7,0.0,3.4,0.0,2,'2014-05-08 00:00:00',-1,25),(192,20,122,0,0,27,'mj001','2014-05-09 01:42:55',1.7,0.0,0.0,0.0,1,'2014-05-08 00:00:00',-1,25),(193,20,122,23,23,27,'mj001','2014-05-09 01:13:34',1.7,1.5,39.1,34.5,2,'2014-05-05 00:00:00',-1,25),(194,20,122,0,0,27,'mj001','2014-05-09 01:14:37',1.7,1.5,0.0,0.0,1,'2014-05-06 00:00:00',-1,25),(195,20,121,0,0,27,'mj001','2014-05-09 01:51:42',1.7,0.0,0.0,0.0,1,'2014-05-05 00:00:00',-1,25),(196,20,121,3,3,27,'mj001','2014-05-09 01:51:46',1.7,0.0,5.1,0.0,2,'2014-05-06 00:00:00',-1,25),(197,20,121,2,2,27,'mj001','2014-05-09 01:51:53',1.7,0.0,3.4,0.0,2,'2014-05-07 00:00:00',-1,25),(198,20,109,0,0,-1,'自动生成','2014-05-15 00:02:39',1.7,1.6,0.0,0.0,1,'2014-05-14 00:00:00',-1,4),(199,21,110,0,0,-1,'自动生成','2014-05-15 00:02:39',1.7,1.6,0.0,0.0,1,'2014-05-14 00:00:00',-1,4),(200,21,111,0,0,-1,'自动生成','2014-05-15 00:02:40',1.8,1.6,0.0,0.0,1,'2014-05-14 00:00:00',-1,4),(201,23,112,0,0,-1,'自动生成','2014-05-15 00:02:40',1.8,1.8,0.0,0.0,1,'2014-05-14 00:00:00',-1,4),(202,20,113,0,0,-1,'自动生成','2014-05-15 00:02:41',1.7,1.6,0.0,0.0,1,'2014-05-14 00:00:00',-1,4),(203,21,114,0,0,-1,'自动生成','2014-05-15 00:02:41',1.7,1.6,0.0,0.0,1,'2014-05-14 00:00:00',-1,4),(204,21,115,0,0,-1,'自动生成','2014-05-15 00:02:41',1.7,1.7,0.0,0.0,1,'2014-05-14 00:00:00',-1,4),(205,-1,116,0,0,-1,'自动生成','2014-05-15 00:02:42',1.7,0.0,0.0,0.0,1,'2014-05-14 00:00:00',-1,4),(206,22,117,0,0,-1,'自动生成','2014-05-15 00:02:42',1.7,1.6,0.0,0.0,1,'2014-05-14 00:00:00',-1,4),(207,-1,118,0,0,-1,'自动生成','2014-05-15 00:02:43',1.0,0.0,0.0,0.0,1,'2014-05-14 00:00:00',-1,4),(208,-1,119,0,0,-1,'自动生成','2014-05-15 00:02:43',1.6,0.0,0.0,0.0,1,'2014-05-14 00:00:00',-1,4),(209,30,120,0,0,-1,'自动生成','2014-05-15 00:02:44',1.8,1.8,0.0,0.0,1,'2014-05-14 00:00:00',-1,4),(210,31,121,0,0,-1,'自动生成','2014-05-15 00:02:44',1.7,1.6,0.0,0.0,1,'2014-05-14 00:00:00',-1,25),(211,20,122,0,0,-1,'自动生成','2014-05-15 00:02:45',1.7,1.5,0.0,0.0,1,'2014-05-14 00:00:00',-1,25),(212,20,109,0,0,-1,'自动生成','2014-05-20 00:03:04',1.7,1.6,0.0,0.0,1,'2014-05-19 00:00:00',-1,4),(213,21,110,0,0,-1,'自动生成','2014-05-20 00:03:04',1.7,1.6,0.0,0.0,1,'2014-05-19 00:00:00',-1,4),(214,21,111,0,0,-1,'自动生成','2014-05-20 00:03:05',1.8,1.6,0.0,0.0,1,'2014-05-19 00:00:00',-1,4),(215,23,112,0,0,-1,'自动生成','2014-05-20 00:03:05',1.8,1.8,0.0,0.0,1,'2014-05-19 00:00:00',-1,4),(216,20,113,0,0,-1,'自动生成','2014-05-20 00:03:06',1.7,1.6,0.0,0.0,1,'2014-05-19 00:00:00',-1,4),(217,21,114,0,0,-1,'自动生成','2014-05-20 00:03:06',1.7,1.6,0.0,0.0,1,'2014-05-19 00:00:00',-1,4),(218,21,115,0,0,-1,'自动生成','2014-05-20 00:03:07',1.7,1.7,0.0,0.0,1,'2014-05-19 00:00:00',-1,4),(219,-1,116,0,0,-1,'自动生成','2014-05-20 00:03:07',1.7,0.0,0.0,0.0,1,'2014-05-19 00:00:00',-1,4),(220,22,117,0,0,-1,'自动生成','2014-05-20 00:03:07',1.7,1.6,0.0,0.0,1,'2014-05-19 00:00:00',-1,4),(221,-1,118,0,0,-1,'自动生成','2014-05-20 00:03:08',1.0,0.0,0.0,0.0,1,'2014-05-19 00:00:00',-1,4),(222,-1,119,0,0,-1,'自动生成','2014-05-20 00:03:08',1.6,0.0,0.0,0.0,1,'2014-05-19 00:00:00',-1,4),(223,30,120,0,0,-1,'自动生成','2014-05-20 00:03:09',1.8,1.8,0.0,0.0,1,'2014-05-19 00:00:00',-1,4),(224,31,121,0,0,-1,'自动生成','2014-05-20 00:03:09',1.7,1.6,0.0,0.0,1,'2014-05-19 00:00:00',-1,25),(225,20,122,0,0,-1,'自动生成','2014-05-20 00:03:10',1.7,1.5,0.0,0.0,1,'2014-05-19 00:00:00',-1,25);

/*Table structure for table `ws_qd_user_detail` */

DROP TABLE IF EXISTS `ws_qd_user_detail`;

CREATE TABLE `ws_qd_user_detail` (
  `p_user_id` int(11) NOT NULL COMMENT '所属登录ID',
  `qd_type` int(1) NOT NULL DEFAULT '1' COMMENT '渠道类型 1公司/2个人 ',
  `qd_name` varchar(64) DEFAULT NULL COMMENT '渠道名称',
  `qd_contact` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人',
  `qd_email` varchar(64) DEFAULT '@' COMMENT '邮箱',
  `qd_phone` varchar(64) NOT NULL DEFAULT '' COMMENT '联系号码',
  `qd_qq` varchar(64) NOT NULL DEFAULT '' COMMENT '联系QQ',
  `qd_yh` varchar(64) DEFAULT '' COMMENT '银行',
  `qd_khk` varchar(128) DEFAULT '' COMMENT '支行信息',
  `qd_khr` varchar(64) DEFAULT '' COMMENT '开户登记名',
  `qd_zh` varchar(64) DEFAULT '' COMMENT '开户帐号',
  `qd_address` varchar(128) DEFAULT '' COMMENT '地址',
  `qd_note` varchar(512) DEFAULT '' COMMENT '备注',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `status` varchar(1) DEFAULT NULL COMMENT '状态 1未分配/2已分配/3禁用',
  `list_app` varchar(3000) DEFAULT '' COMMENT '被下架的数据',
  `login_name` varchar(64) DEFAULT NULL COMMENT 'loginname',
  `mj_id` int(11) DEFAULT '-1',
  `mj_name` varchar(64) DEFAULT '',
  PRIMARY KEY (`p_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ws_qd_user_detail` */

insert  into `ws_qd_user_detail`(`p_user_id`,`qd_type`,`qd_name`,`qd_contact`,`qd_email`,`qd_phone`,`qd_qq`,`qd_yh`,`qd_khk`,`qd_khr`,`qd_zh`,`qd_address`,`qd_note`,`create_time`,`status`,`list_app`,`login_name`,`mj_id`,`mj_name`) values (18,1,'6677384','6677384','6677384@qq.com','66773842','6677384','','','','','','','2014-04-18','3','',NULL,-1,''),(19,1,'6677388','6677388','6677388@ss.com','6677388','6677388','','','','',NULL,NULL,NULL,'3','',NULL,-1,''),(20,1,'小小','小小','547105825@qq.com','13618363143','547105825','','','','',NULL,NULL,NULL,'2',';121@cpgs201','xiaoxiao',27,'mj001'),(21,1,'陈鸣晓','陈鸣晓','1@1.com','1','1','','','','',NULL,NULL,NULL,'2','','cmq360',27,'mj001'),(22,1,'李刘阳','李刘阳','1@1.com','1','1','','','','',NULL,NULL,NULL,'2','','lly',-1,''),(23,1,'下架渠道-禁用','下架渠道-禁用','a@1.com','1','1','','','','',NULL,NULL,NULL,'2',';115@100843','XIAJIA',-1,''),(30,1,'sx22','xoiu','6677385@qq.com','6677385','6677385','','','','',NULL,NULL,NULL,'2','','sx22',28,'mj002'),(31,1,'qd001','qd001','6677384@qq.com','6677385','2222','','','','',NULL,NULL,NULL,'2','','qd001',27,'mj001'),(32,1,'qd001','qd001','6677388@ss.com','12ss','6677384','xx','as','ruanxiaohu','23','',NULL,NULL,'2','','qd00',28,'mj002');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
