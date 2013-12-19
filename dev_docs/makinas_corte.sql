/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : constructor

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2013-12-18 21:04:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `makinas_corte`
-- ----------------------------
DROP TABLE IF EXISTS `makinas_corte`;
CREATE TABLE `makinas_corte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_maquina` int(11) NOT NULL,
  `fk_cliente` int(11) NOT NULL,
  `fk_pdv` int(11) NOT NULL,
  `fk_tecnico` int(11) NOT NULL,
  `cont_entrada` decimal(18,6) NOT NULL,
  `cont_salida` decimal(18,6) NOT NULL,
  `diferencia` decimal(18,6) DEFAULT NULL,
  `saldo_contadores` decimal(18,6) NOT NULL,
  `dato_de_la_placa` char(255) NOT NULL,
  `monto` decimal(18,6) NOT NULL,
  `fecha` datetime NOT NULL,
  `fk_serie` int(11) NOT NULL,
  `folio` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of makinas_corte
-- ----------------------------
INSERT INTO `makinas_corte` VALUES ('27', '1', '1', '1', '1', '0.000000', '0.000000', null, '0.000000', '', '0.000000', '2013-12-18 17:57:00', '1', '5');
INSERT INTO `makinas_corte` VALUES ('28', '1', '1', '1', '1', '0.000000', '0.000000', null, '0.000000', '', '0.000000', '2013-12-18 20:49:00', '1', '6');
