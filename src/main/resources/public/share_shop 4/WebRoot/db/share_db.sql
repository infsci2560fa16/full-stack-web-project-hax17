/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : share_db

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-12-07 03:09:35
*/
DROP database IF EXISTS share;
create database share;
use share;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for color_table
-- ----------------------------
DROP TABLE IF EXISTS `color_table`;
CREATE TABLE `color_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `color_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of color_table
-- ----------------------------
INSERT INTO `color_table` VALUES ('1', '1', 'red', null);
INSERT INTO `color_table` VALUES ('2', '1', 'blue', null);
INSERT INTO `color_table` VALUES ('3', '1', 'green', null);
INSERT INTO `color_table` VALUES ('4', '2', 'red', null);
INSERT INTO `color_table` VALUES ('5', '3', 'red', null);
INSERT INTO `color_table` VALUES ('6', '3', 'blue', null);
INSERT INTO `color_table` VALUES ('7', '2', 'blue', null);
INSERT INTO `color_table` VALUES ('8', '2', 'green', null);
INSERT INTO `color_table` VALUES ('9', '4', 'red', null);
INSERT INTO `color_table` VALUES ('10', '4', 'blue', null);
INSERT INTO `color_table` VALUES ('11', '4', 'green', null);
INSERT INTO `color_table` VALUES ('12', '5', 'red', null);
INSERT INTO `color_table` VALUES ('13', '5', 'blue', null);
INSERT INTO `color_table` VALUES ('14', '5', 'green', null);
INSERT INTO `color_table` VALUES ('15', '6', 'red', null);
INSERT INTO `color_table` VALUES ('16', '6', 'blue', null);  
INSERT INTO `color_table` VALUES ('17', '6', 'green', null);

-- ----------------------------
-- Table structure for goods_table
-- ----------------------------
DROP TABLE IF EXISTS `goods_table`;
CREATE TABLE `goods_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Name` varchar(255) DEFAULT NULL,
  `Unit_Price` decimal(10,2) DEFAULT NULL,
  `content` text,
  `images` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `Reserves` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_table
-- ----------------------------
INSERT INTO `goods_table` VALUES ('1', 'THE SHARE.LeatherPT', '199.99', '<div class=\"center\"><img src=\"img/product.jpg\" alt=\"\"/></div>\r\n			<div class=\"center\"><img src=\"img/model.jpg\" alt=\"\"/></div>', 'img/mainpic.jpg', '2016-12-07 00:33:09', '199', 'THE SHARE.LeatherPT', '1');
INSERT INTO `goods_table` VALUES ('2', 'THE SHARE.LeatherPT', '199.99', '<div class=\"center\"><img src=\"img/product.jpg\" alt=\"\"/></div>\r\n			<div class=\"center\"><img src=\"img/model.jpg\" alt=\"\"/></div>', 'img/mainpic.jpg', '2016-12-07 00:33:09', '199', 'THE SHARE.LeatherPT', '1');
INSERT INTO `goods_table` VALUES ('3', 'THE SHARE.LeatherPT', '199.99', '<div class=\"center\"><img src=\"img/product.jpg\" alt=\"\"/></div>\r\n			<div class=\"center\"><img src=\"img/model.jpg\" alt=\"\"/></div>', 'img/mainpic.jpg', '2016-12-07 00:33:09', '199', 'THE SHARE.LeatherPT', '1');
INSERT INTO `goods_table` VALUES ('4', 'THE SHARE.LeatherPT', '199.99', '<div class=\"center\"><img src=\"img/product.jpg\" alt=\"\"/></div>\r\n			<div class=\"center\"><img src=\"img/model.jpg\" alt=\"\"/></div>', 'img/mainpic.jpg', '2016-12-07 00:33:09', '199', 'THE SHARE.LeatherPT', '1');
INSERT INTO `goods_table` VALUES ('5', 'THE SHARE.LeatherPT', '199.99', '<div class=\"center\"><img src=\"img/product.jpg\" alt=\"\"/></div>\r\n			<div class=\"center\"><img src=\"img/model.jpg\" alt=\"\"/></div>', 'img/mainpic.jpg', '2016-12-07 00:33:09', '199', 'THE SHARE.LeatherPT', '1');
INSERT INTO `goods_table` VALUES ('6', 'THE SHARE.LeatherPT', '199.99', '<div class=\"center\"><img src=\"img/product.jpg\" alt=\"\"/></div>\r\n			<div class=\"center\"><img src=\"img/model.jpg\" alt=\"\"/></div>', 'img/mainpic.jpg', '2016-12-07 00:33:09', '199', 'THE SHARE.LeatherPT', '1');

-- ----------------------------
-- Table structure for goods_type_table
-- ----------------------------
DROP TABLE IF EXISTS `goods_type_table`;
CREATE TABLE `goods_type_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_type_name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_type_table
-- ----------------------------
INSERT INTO `goods_type_table` VALUES ('1', '\r\n最新商品', '士大夫', '2016-11-26 07:43:10', '0');
INSERT INTO `goods_type_table` VALUES ('2', '\r\n特价商品', '士大夫', '2016-11-26 07:43:10', '0');
INSERT INTO `goods_type_table` VALUES ('3', '\r\n精品礼盒', '士大夫', '2016-11-26 07:43:10', '0');
INSERT INTO `goods_type_table` VALUES ('4', '爱情鲜花', '士大夫', '2016-11-26 07:43:10', '0');
INSERT INTO `goods_type_table` VALUES ('5', '\r\n节日礼物', '士大夫', '2016-11-26 07:43:10', '0');
INSERT INTO `goods_type_table` VALUES ('6', '测试题', '士大夫', '2016-11-26 07:43:10', '0');

-- ----------------------------
-- Table structure for order_table
-- ----------------------------
DROP TABLE IF EXISTS `order_table`;
CREATE TABLE `order_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `QUATITY` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `user_id`int(11) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_table
-- ----------------------------
INSERT INTO `order_table` VALUES ('1', '1', '1', '1', '1', '2016-12-07 01:39:08', '1', null, '1','a30fdc606c6cb2d3');
INSERT INTO `order_table` VALUES ('2', '1', '1', '1', '1', '2016-12-07 01:39:34', '0', null, '1',null);
INSERT INTO `order_table` VALUES ('3', '1', '1', '1', '1', '2016-12-07 01:39:42', '1', null, '1','869cf98df9455b84');
INSERT INTO `order_table` VALUES ('4', '1', '1', '1', '1', '2016-12-07 01:39:48', '0', null, '1',null);
INSERT INTO `order_table` VALUES ('5', '1', '1', '1', '1', '2016-12-07 01:40:57', '1', null, '1','b9c4e79d23d58fd7');
INSERT INTO `order_table` VALUES ('12', '4', '1', '1', '1', '2016-12-07 02:46:36', '0', null, '1',null);
INSERT INTO `order_table` VALUES ('13', '1', '1', '2', '1', '2016-12-07 02:48:39', '1', null, '1','8685b843de5c8868');
INSERT INTO `order_table` VALUES ('14', '2', '1', '1', '1', '2016-12-07 03:07:56', '1', null, '1','a19c27a36200e9fe');

-- ----------------------------
-- Table structure for size_table
-- ----------------------------
DROP TABLE IF EXISTS `size_table`;
CREATE TABLE `size_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of size_table
-- ----------------------------
INSERT INTO `size_table` VALUES ('1', 'M', null, '1');
INSERT INTO `size_table` VALUES ('2', 'S', null, '1');
INSERT INTO `size_table` VALUES ('3', 'L', null, '1');
INSERT INTO `size_table` VALUES ('4', 'M', null, '2');
INSERT INTO `size_table` VALUES ('5', 'S', null, '2');
INSERT INTO `size_table` VALUES ('6', 'L', null, '2');
INSERT INTO `size_table` VALUES ('7', 'M', null, '3');
INSERT INTO `size_table` VALUES ('8', 'S', null, '3');
INSERT INTO `size_table` VALUES ('9', 'L', null, '3');
INSERT INTO `size_table` VALUES ('10', 'M', null, '4');
INSERT INTO `size_table` VALUES ('11', 'S', null, '4');
INSERT INTO `size_table` VALUES ('12', 'L', null, '4');
INSERT INTO `size_table` VALUES ('13', 'M', null, '5');
INSERT INTO `size_table` VALUES ('14', 'S', null, '5');
INSERT INTO `size_table` VALUES ('15', 'L', null, '5');
INSERT INTO `size_table` VALUES ('16', 'M', null, '6');
INSERT INTO `size_table` VALUES ('17', 'S', null, '6');
INSERT INTO `size_table` VALUES ('18', 'L', null, '6');

-- ----------------------------
-- Table structure for user_table
-- ----------------------------
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE `user_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_table
-- ----------------------------
INSERT INTO `user_table` VALUES ('1', 'admin', 'admin123', null, '1');

-- ----------------------------
-- Records of address_table
-- ----------------------------
DROP TABLE IF EXISTS `address_table`;
CREATE TABLE `address_table` (
  `recipients` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL COMMENT '收货地址',
  `tel` int(11) NOT NULL COMMENT '收货人联系方式',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `address_table` VALUES ('test1', '北京省北京市', 11111122, 1);
INSERT INTO `address_table` VALUES ('test2', '河北省石家庄', 22222267, 1);
INSERT INTO `address_table` VALUES ('test3', '河南省郑州市', 23456780, 1);

-- ----------------------------
-- Records of order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_id` varchar(255) NOT NULL,
  `recipients` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `tel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `order_detail` VALUES ('a30fdc606c6cb2d3', 'test1', '北京市', 12345678);
INSERT INTO `order_detail` VALUES ('869cf98df9455b84', 'test2', '河北省石家庄市', 22222222);
INSERT INTO `order_detail` VALUES ('b9c4e79d23d58fd7', 'test3', '河南省郑州市', 66666666);
INSERT INTO `order_detail` VALUES ('8685b843de5c8868', 'test2', '河北省石家庄市', 22222222);
INSERT INTO `order_detail` VALUES ('a19c27a36200e9fe', 'test4', '湖南省长沙市', 33333333);


