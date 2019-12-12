/*
 Navicat Premium Data Transfer

 Source Server         : Zzhiren_xiuxiu
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : 47.111.191.55:3306
 Source Schema         : xiuxiu

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 13/12/2019 01:05:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `goods_brand`;
CREATE TABLE `goods_brand` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) NOT NULL COMMENT '品牌名称',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌表';

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL COMMENT '分类名称',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Table structure for goods_safeguard
-- ----------------------------
DROP TABLE IF EXISTS `goods_safeguard`;
CREATE TABLE `goods_safeguard` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `safeguard_name` varchar(50) NOT NULL COMMENT '保障名称',
  `price` decimal(9,2) NOT NULL COMMENT '保障价格',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='增值保障';

-- ----------------------------
-- Table structure for goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku`;
CREATE TABLE `goods_sku` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sku_no` varchar(50) NOT NULL COMMENT 'sku编号,唯一',
  `sku_name` varchar(50) NOT NULL COMMENT 'sku名称(冗余spu_name)',
  `price` decimal(9,2) NOT NULL COMMENT '售价',
  `stock` int(11) NOT NULL COMMENT '库存',
  `shop_id` bigint(20) NOT NULL COMMENT '商铺id,为0表示自营',
  `spu_id` bigint(20) NOT NULL COMMENT 'spu_id',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku表';

-- ----------------------------
-- Table structure for goods_sku_safeguard
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_safeguard`;
CREATE TABLE `goods_sku_safeguard` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `safeguard_id` bigint(20) NOT NULL COMMENT 'safeguard_id',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku增值保障';

-- ----------------------------
-- Table structure for goods_sku_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_spec_value`;
CREATE TABLE `goods_sku_spec_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `spec_value_id` bigint(20) NOT NULL COMMENT '规格值id',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku规格值';

-- ----------------------------
-- Table structure for goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `goods_spec`;
CREATE TABLE `goods_spec` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `spec_no` varchar(50) NOT NULL COMMENT '规格编号',
  `spec_name` varchar(50) NOT NULL COMMENT '规格名称',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规格表';

-- ----------------------------
-- Table structure for goods_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `goods_spec_value`;
CREATE TABLE `goods_spec_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `spec_id` bigint(20) NOT NULL COMMENT '规格id',
  `spec_value` varchar(50) NOT NULL COMMENT '规格值',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规格值表';

-- ----------------------------
-- Table structure for goods_spu
-- ----------------------------
DROP TABLE IF EXISTS `goods_spu`;
CREATE TABLE `goods_spu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `spu_no` varchar(50) NOT NULL COMMENT '商品编号，唯一',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `low_price` decimal(9,2) NOT NULL COMMENT '最低售价',
  `category_id` bigint(20) NOT NULL COMMENT '分类id',
  `brand_id` bigint(20) NOT NULL COMMENT '品牌id',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_spu_no` (`spu_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='spu表';

-- ----------------------------
-- Table structure for goods_spu_spec
-- ----------------------------
DROP TABLE IF EXISTS `goods_spu_spec`;
CREATE TABLE `goods_spu_spec` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `spu_id` bigint(20) NOT NULL COMMENT 'spu_id',
  `spec_id` bigint(20) NOT NULL COMMENT 'spec_id',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='spu规格表';

-- ----------------------------
-- Table structure for order_cart
-- ----------------------------
DROP TABLE IF EXISTS `order_cart`;
CREATE TABLE `order_cart` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `spu_id` bigint(20) NOT NULL COMMENT 'spu_id',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `user_id` bigint(20) NOT NULL COMMENT 'user_id',
  `shop_id` bigint(20) NOT NULL COMMENT 'shop_id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_count` smallint(20) NOT NULL COMMENT '商品数量',
  `goods_price` decimal(9,2) NOT NULL COMMENT '商品价格',
  `order_state` tinyint(10) NOT NULL COMMENT '订单状态',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` bigint(20) NOT NULL COMMENT '订单编号',
  `item_count` bigint(20) NOT NULL COMMENT '商品项数量，不是商品个数，比如手机*2，鼠标*1，这里应该是2',
  `user_id` bigint(20) NOT NULL COMMENT 'user_id',
  `shop_id` bigint(20) NOT NULL COMMENT 'shop_id',
  `order_time` varchar(50) NOT NULL COMMENT '下单时间',
  `payment_method` tinyint(2) NOT NULL COMMENT '支付方式, 1-支付宝，2-微信，3-银行卡',
  `payment_time` varchar(50) NOT NULL COMMENT '支付时间',
  `wechart_pay_order_no` bigint(20) NOT NULL COMMENT '微信支付订单编号',
  `alipay_order_no` bigint(20) NOT NULL COMMENT '支付宝支付订单编号',
  `delivery_method` varchar(20) NOT NULL COMMENT '配送方式，英文：例如：EMS, SF',
  `order_total` decimal(9,2) NOT NULL COMMENT '商品总额',
  `freight` decimal(9,2) NOT NULL COMMENT '运费',
  `expected_delivery_date` tinyint(10) NOT NULL COMMENT '期望配送日期',
  `actual_payment` decimal(9,2) NOT NULL COMMENT '实际付款',
  `order_state` tinyint(2) NOT NULL COMMENT '订单状态',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Table structure for order_pay_history
-- ----------------------------
DROP TABLE IF EXISTS `order_pay_history`;
CREATE TABLE `order_pay_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` bigint(20) NOT NULL COMMENT '订单编号',
  `payment_method` varchar(20) NOT NULL COMMENT '支付方式, wechart_pay, alipay',
  `order_total` decimal(9,2) NOT NULL COMMENT '商品总额',
  `actual_payment` decimal(9,2) NOT NULL COMMENT '实际付款',
  `pay_json` varchar(255) NOT NULL COMMENT '第三方支付平台参数信息，可使用josn方式保存',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付记录表';

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` bigint(20) NOT NULL COMMENT '订单编号',
  `spu_id` bigint(20) NOT NULL COMMENT 'spu_id',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `shop_id` bigint(20) NOT NULL COMMENT 'shop_id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_count` smallint(20) NOT NULL COMMENT '商品数量',
  `goods_price` decimal(9,2) NOT NULL COMMENT '商品价格',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单商品表';

-- ----------------------------
-- Table structure for order_product_comment
-- ----------------------------
DROP TABLE IF EXISTS `order_product_comment`;
CREATE TABLE `order_product_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `spu_id` bigint(20) NOT NULL COMMENT 'spu_id',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `user_id` bigint(20) NOT NULL COMMENT 'user_id',
  `likes_count` smallint(100) NOT NULL COMMENT '商品总额',
  `comment` varchar(255) NOT NULL COMMENT '评论内容',
  `comment_score` tinyint(20) NOT NULL COMMENT '评论分数, 1,2,3,4,5 星',
  `product_info_json` varchar(255) NOT NULL COMMENT '评论的商品信息',
  `image_json` varchar(255) NOT NULL COMMENT '评论图片',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单评论表';

-- ----------------------------
-- Table structure for shop_info
-- ----------------------------
DROP TABLE IF EXISTS `shop_info`;
CREATE TABLE `shop_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺表';

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(20) NOT NULL COMMENT '手机号码',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `email` varchar(20) NOT NULL COMMENT '邮箱',
  `nick_name` varchar(20) NOT NULL COMMENT '昵称',
  `auatar_url` varchar(255) NOT NULL COMMENT '头像图片',
  `registration_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `default_address_id` varchar(255) NOT NULL COMMENT '默认收货地址',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

SET FOREIGN_KEY_CHECKS = 1;
