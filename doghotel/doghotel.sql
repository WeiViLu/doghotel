# Host: localhost  (Version: 5.0.22-community-nt)
# Date: 2017-07-07 12:36:24
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "ads"
#

DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads` (
  `Id` int(11) NOT NULL auto_increment,
  `msg` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "ads"
#

INSERT INTO `ads` VALUES (1,'哈士奇月托管，史上最低价！！'),(2,'微笑天使萨摩耶，1000元/月！！'),(3,'泰迪托管跳楼价，走过路过不要错过！！！');

#
# Structure for table "bgimg"
#

DROP TABLE IF EXISTS `bgimg`;
CREATE TABLE `bgimg` (
  `Id` int(11) NOT NULL auto_increment,
  `src` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "bgimg"
#

INSERT INTO `bgimg` VALUES (1,'http://img15.3lian.com/2015/f2/18/d/41.jpg'),(2,'http://img15.3lian.com/2015/f2/18/d/37.jpg'),(3,'http://img15.3lian.com/2015/f2/18/d/38.jpg'),(4,'http://img15.3lian.com/2015/f2/18/d/36.jpg'),(5,'http://img15.3lian.com/2015/f2/18/d/42.jpg');

#
# Structure for table "likes"
#

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `Id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `likeid` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "likes"
#

INSERT INTO `likes` VALUES (34,'张继科','10'),(35,'张继科','5'),(36,'张继科','15'),(38,'张继科','1'),(39,'张继科','6'),(41,'张继科','3'),(42,'张继科 ','19'),(43,'马龙 ','3'),(44,'马龙 ','2'),(45,'张继科','14');

#
# Structure for table "listall"
#

DROP TABLE IF EXISTS `listall`;
CREATE TABLE `listall` (
  `Id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `img` varchar(255) default NULL,
  `price` int(11) default NULL,
  `w_price` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "listall"
#

INSERT INTO `listall` VALUES (1,'杜宾犬','http://img1.goumin.com/attachments/head/0/0/0/179/45860o2.jpg',3000,'4000'),(2,'阿富汗猎犬','http://www.cndog.net/dog_photo_big/2011-11/9/9114712-5381.jpg',3000,'4000'),(3,'阿拉斯加雪橇犬','http://pic1.win4000.com/wallpaper/7/51aecdac1a9f0.jpg',3500,'4500'),(4,'藏獒','http://docs.ebdoor.com/Image/Company/44/444943_intro1.jpg',3500,'5000'),(5,'杜高犬','http://www.58.com/zp_images/allimg/121114/5_121114153115_1.png',2500,'3500'),(6,'大白熊','http://i.yimg.jp/i/kids/zukan/photo/pet/dog/0079/640_480.jpg',3000,'4500'),(7,'波利犬','http://pic.baike.soso.com/p/20111014/20111014204356-472003066.jpg',2800,'4500'),(8,'斗牛梗','http://pan.xici.com/d171360309.0/200811313171173806.jpg',3000,'4500'),(9,'柴犬','http://img.article.pchome.net/00/26/24/45/pic_lib/wm/rbcg_15.jpg',2700,'3200'),(10,'标准贵宾犬','http://docs.ebdoor.com/Image/ProductImage/0/401/4017392_1.jpg',2000,'3000'),(11,'萨摩耶','http://pic12.nipic.com/20110108/2889686_012150624816_2.jpg',2500,'3000'),(12,'哈士奇','http://pic23.nipic.com/20120808/6608733_131101157000_2.jpg',2500,'4500'),(13,'波士顿梗','http://pic.139zhuti.com/?img_url=http://img2.pclady.com.cn/pclady/1001/15/500436_1066_1256279562hz31.jpg',2700,'3500'),(14,'泰迪','http://www.pet18.com/UploadFiles/FCK/2014-09/20140901XD06TFXXTL.jpg',500,'1000'),(15,'法国斗牛犬','http://up1.goumin.com/attachments/photo/0/0/27/7132/1825900o2.jpg',2500,'3500'),(16,'巴哥犬','http://up1.goumin.com/attachments/photo/0/0/66/17090/4375280o2.jpg',2200,'3000'),(17,'比熊犬','http://pic.baike.soso.com/p/20131220/20131220170911-615709078.jpg',1500,'2500'),(18,'巴吉度犬','http://s2.biyixia.com/sites/dog-breed.biyixia.com/files/files/images/product/life/pets/dogbreeds/QQ%E6%88%AA%E5%9B%BE20131207101422.png',2000,'3000'),(19,'111','111',2,'2');

#
# Structure for table "listbig"
#

DROP TABLE IF EXISTS `listbig`;
CREATE TABLE `listbig` (
  `Id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `img` varchar(255) default NULL,
  `price` int(11) default NULL,
  `w_price` int(11) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "listbig"
#

INSERT INTO `listbig` VALUES (1,'大白熊','http://i.yimg.jp/i/kids/zukan/photo/pet/dog/0079/640_480.jpg',3000,4500),(2,'杜高犬','http://www.58.com/zp_images/allimg/121114/5_121114153115_1.png',2500,3500),(3,'藏獒','http://docs.ebdoor.com/Image/Company/44/444943_intro1.jpg',3500,5000),(4,'阿拉斯加雪橇犬','http://pic1.win4000.com/wallpaper/7/51aecdac1a9f0.jpg',3500,4500),(5,'阿富汗猎犬','http://www.cndog.net/dog_photo_big/2011-11/9/9114712-5381.jpg',3000,4000),(6,'杜宾犬','http://img1.goumin.com/attachments/head/0/0/0/179/45860o2.jpg',3000,4000);

#
# Structure for table "listmiddle"
#

DROP TABLE IF EXISTS `listmiddle`;
CREATE TABLE `listmiddle` (
  `Id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `img` varchar(255) default NULL,
  `price` int(11) default NULL,
  `w_price` int(11) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "listmiddle"
#

INSERT INTO `listmiddle` VALUES (1,'哈士奇','http://pic23.nipic.com/20120808/6608733_131101157000_2.jpg',2500,4500),(2,'萨摩耶','http://pic12.nipic.com/20110108/2889686_012150624816_2.jpg',2500,3000),(3,'标准贵宾犬','http://docs.ebdoor.com/Image/ProductImage/0/401/4017392_1.jpg',2000,3000),(4,'柴犬','http://img.article.pchome.net/00/26/24/45/pic_lib/wm/rbcg_15.jpg',2700,3200),(5,'斗牛梗','http://pan.xici.com/d171360309.0/200811313171173806.jpg',3000,4500),(6,'波利犬','http://pic.baike.soso.com/p/20111014/20111014204356-472003066.jpg',2800,4500);

#
# Structure for table "listsmall"
#

DROP TABLE IF EXISTS `listsmall`;
CREATE TABLE `listsmall` (
  `Id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `img` varchar(255) default NULL,
  `price` int(11) default NULL,
  `w_price` int(11) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "listsmall"
#

INSERT INTO `listsmall` VALUES (1,'巴吉度犬','http://s2.biyixia.com/sites/dog-breed.biyixia.com/files/files/images/product/life/pets/dogbreeds/QQ%E6%88%AA%E5%9B%BE20131207101422.png',2000,3000),(2,'比熊犬','http://pic.baike.soso.com/p/20131220/20131220170911-615709078.jpg',1500,2500),(3,'巴哥犬','http://up1.goumin.com/attachments/photo/0/0/66/17090/4375280o2.jpg',2200,3000),(4,'法国斗牛犬','http://up1.goumin.com/attachments/photo/0/0/27/7132/1825900o2.jpg',2500,3500),(5,'泰迪','http://www.pet18.com/UploadFiles/FCK/2014-09/20140901XD06TFXXTL.jpg',500,1000),(6,'波士顿梗','http://pic.139zhuti.com/?img_url=http://img2.pclady.com.cn/pclady/1001/15/500436_1066_1256279562hz31.jpg',2700,3500);

#
# Structure for table "orders"
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `Id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `orderid` varchar(255) default NULL,
  `count` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES (1,'张继科','1','1'),(2,'张继科','2','1'),(4,'张继科','1','1'),(5,'张继科 ','1','1'),(6,'张继科','1','1');

#
# Structure for table "slider"
#

DROP TABLE IF EXISTS `slider`;
CREATE TABLE `slider` (
  `Id` int(11) NOT NULL auto_increment,
  `src` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "slider"
#

INSERT INTO `slider` VALUES (1,'http://www.tu6.cn/uploads/wallpaper/animal/117-2-1680x1050.jpg'),(2,'http://pic4.bbzhi.com/dongwubizhi/keaixiaogoudiannaozhuomianbizhi/keaixiaogoudiannaozhuomianbizhi_348905_11.jpg'),(3,'http://pic2.bbzhi.com/dongwubizhi/1920xiaogouxiezhen/1920xiaogouxiezhen_106564_11.jpg'),(4,'http://pic4.bbzhi.com/dongwubizhi/keaixiaogoudiannaozhuomianbizhi/keaixiaogoudiannaozhuomianbizhi_349325_11.jpg');

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default '',
  `password` varchar(255) default '',
  `src` varchar(255) default NULL,
  `uid` varchar(255) default NULL,
  `age` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `level` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'张继科','zjk','http://pic4.qqmofasi.com/2014/11/06/508_nEIW0l2wXOloE0s7Yw8i_square.jpg','kekeke','88','1385118888','25'),(2,'许昕','xx','http://pic4.qqmofasi.com/2015/01/04/508_eTxrqTx38Xo242M2Rbjm_square.jpg','xxxx','20','15996420112','20'),(3,'马龙','ml','http://pic4.qqmofasi.com/2015/01/04/508_jpBh4cNz8TNBXHPCX6cW_square.jpg','mlml','20','13851188549','18'),(4,'丁宁','dn','http://pic4.qqmofasi.com/2015/08/28/1793_fGqljXObOkOgQgUxgTRG_square.jpg','dndn','18','15950291926','18'),(7,'','',NULL,NULL,NULL,NULL,NULL),(8,'kkk','123',NULL,NULL,NULL,NULL,NULL),(9,'555','888',NULL,NULL,NULL,NULL,NULL);
