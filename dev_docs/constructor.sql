/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : constructor

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2014-01-02 16:15:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_categoria`
-- ----------------------------
DROP TABLE IF EXISTS `cms_categoria`;
CREATE TABLE `cms_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `fk_categoria_padre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_categoria
-- ----------------------------
INSERT INTO `cms_categoria` VALUES ('1', 'Default', '0');
INSERT INTO `cms_categoria` VALUES ('2', 'Nueva', '1');

-- ----------------------------
-- Table structure for `constructor_app`
-- ----------------------------
DROP TABLE IF EXISTS `constructor_app`;
CREATE TABLE `constructor_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `ubicacion` char(255) DEFAULT NULL,
  `logo` char(255) DEFAULT NULL,
  `favicon` char(255) DEFAULT NULL,
  `descripcion` char(255) DEFAULT NULL,
  `tags` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of constructor_app
-- ----------------------------
INSERT INTO `constructor_app` VALUES ('1', 'Backend', '../', '', '', '', '');
INSERT INTO `constructor_app` VALUES ('2', 'Constructor', '/portal', '', '', '', '');
INSERT INTO `constructor_app` VALUES ('3', 'TEST', '/test', '', '', '', '');
INSERT INTO `constructor_app` VALUES ('4', 'Soporte', '/soporte', '', '', '', '');
INSERT INTO `constructor_app` VALUES ('5', 'Transportes', '/transportes', '', '', '', '');
INSERT INTO `constructor_app` VALUES ('6', 'Maquinas', '/maquinas', '', '', '', '');
INSERT INTO `constructor_app` VALUES ('7', 'Nominas', '/nominas', '', '', '', '');

-- ----------------------------
-- Table structure for `constructor_db_config`
-- ----------------------------
DROP TABLE IF EXISTS `constructor_db_config`;
CREATE TABLE `constructor_db_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` char(255) DEFAULT NULL,
  `db_name` char(255) DEFAULT NULL,
  `user` char(255) DEFAULT NULL,
  `pass` char(255) DEFAULT NULL,
  `fk_app` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of constructor_db_config
-- ----------------------------
INSERT INTO `constructor_db_config` VALUES ('1', 'localhost', 'nominas', 'root', '', null);
INSERT INTO `constructor_db_config` VALUES ('2', 'localhost', 'transportes', 'root', '', '5');
INSERT INTO `constructor_db_config` VALUES ('3', 'localhost', 'maquinas', 'root', '', '6');
INSERT INTO `constructor_db_config` VALUES ('4', 'localhot', 'nominas', 'root', '', '7');
INSERT INTO `constructor_db_config` VALUES ('5', 'localhost', 'soporte', 'root', '', '4');
INSERT INTO `constructor_db_config` VALUES ('6', 'localhot', 'constructor', 'root', '', '2');

-- ----------------------------
-- Table structure for `constructor_elemento_catalogo`
-- ----------------------------
DROP TABLE IF EXISTS `constructor_elemento_catalogo`;
CREATE TABLE `constructor_elemento_catalogo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `esDefault` char(255) DEFAULT NULL,
  `extras` char(255) DEFAULT NULL,
  `campo` char(255) DEFAULT NULL,
  `llave` char(255) DEFAULT NULL,
  `esNulo` char(255) DEFAULT NULL,
  `tipo` char(255) DEFAULT NULL,
  `componente` char(255) DEFAULT NULL,
  `comp_config` text,
  `fk_catalogo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_catalogo` (`fk_catalogo`),
  CONSTRAINT `fk_catalogo` FOREIGN KEY (`fk_catalogo`) REFERENCES `system_catalogos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1084 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of constructor_elemento_catalogo
-- ----------------------------
INSERT INTO `constructor_elemento_catalogo` VALUES ('58', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('59', '', '', 'titulo', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Titulo\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('60', '', '', 'autor', '', 'YES', 'text', 'Combo Box', '{\"etiqueta\":\"Autor\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"18\",\"campo_a_mostrar\":\"name\"}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('61', '', '', 'contenido', '', 'YES', 'text', 'Text Input', '{\"etiqueta\":\"Contenido\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('62', '', '', 'fk_categoria_pagina', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Fk_categoria_pagina\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"18\",\"campo_a_mostrar\":\"nombre\"}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('63', '', '', 'fecha_creacion', '', 'YES', 'datetime', 'Text Input', '{\"etiqueta\":\"Fecha Creacion\",\"ayuda\":\"\",\"requerido\":\"\",\"oculto\":\"1\",\"editable\":\"\"}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('64', '', '', 'ultima_edicion', '', 'YES', 'datetime', 'Text Input', '{\"etiqueta\":\"\",\"ayuda\":\"\",\"requerido\":\"\",\"oculto\":\"\",\"editable\":\"\"}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('65', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('66', '', '', 'nick', 'UNI', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nick\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('67', '', '', 'pass', '', 'YES', 'blob', 'Text Input', '{\"etiqueta\":\"Pass\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('68', '', '', 'email', 'UNI', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Email\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('69', '1', '', 'rol', '', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Rol\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('70', '', '', 'fbid', '', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fbid\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('71', '0', '', 'name', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Name\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('72', '', '', 'picture', '', 'YES', 'varchar(255)', 'Text Input', '{\"etiqueta\":\"Picture\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('73', '', '', 'originalName', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"OriginalName\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('74', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '45');
INSERT INTO `constructor_elemento_catalogo` VALUES ('75', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '45');
INSERT INTO `constructor_elemento_catalogo` VALUES ('76', '', '', 'fk_categoria_padre', '', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fk_categoria_padre\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '45');
INSERT INTO `constructor_elemento_catalogo` VALUES ('77', '0', '', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '46');
INSERT INTO `constructor_elemento_catalogo` VALUES ('78', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '46');
INSERT INTO `constructor_elemento_catalogo` VALUES ('79', '', '', 'fk_um', '', 'YES', 'int(255)', 'Combo Box', '{\"etiqueta\":\"Fk_um\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"2\",\"campo_a_mostrar\":\"abreviacion\"}', '46');
INSERT INTO `constructor_elemento_catalogo` VALUES ('80', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '44');
INSERT INTO `constructor_elemento_catalogo` VALUES ('81', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '44');
INSERT INTO `constructor_elemento_catalogo` VALUES ('82', '', '', 'abreviacion', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Abreviacion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '44');
INSERT INTO `constructor_elemento_catalogo` VALUES ('93', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '47');
INSERT INTO `constructor_elemento_catalogo` VALUES ('94', '', '', 'serie', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Serie\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '47');
INSERT INTO `constructor_elemento_catalogo` VALUES ('95', '', '', 'folio', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Folio\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '47');
INSERT INTO `constructor_elemento_catalogo` VALUES ('96', '', '', 'notas', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Notas\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '47');
INSERT INTO `constructor_elemento_catalogo` VALUES ('97', '', '', 'fecha', '', 'YES', 'datetime', 'Text Input', '{\"etiqueta\":\"Fecha\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '47');
INSERT INTO `constructor_elemento_catalogo` VALUES ('104', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '48');
INSERT INTO `constructor_elemento_catalogo` VALUES ('105', '', '', 'fk_concepto', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Fk_concepto\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"6\",\"campo_a_mostrar\":\"nombre\"}', '48');
INSERT INTO `constructor_elemento_catalogo` VALUES ('106', '', '', 'cantidad', '', 'YES', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Cantidad\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '48');
INSERT INTO `constructor_elemento_catalogo` VALUES ('107', '', '', 'fk_um', '', 'YES', 'decimal(18,6)', 'Combo Box', '{\"etiqueta\":\"Fk_um\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"2\",\"campo_a_mostrar\":\"nombre\"}', '48');
INSERT INTO `constructor_elemento_catalogo` VALUES ('108', '', '', 'precio_unitario', '', 'YES', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Precio_unitario\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '48');
INSERT INTO `constructor_elemento_catalogo` VALUES ('109', '', '', 'importe', '', 'YES', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Importe\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '48');
INSERT INTO `constructor_elemento_catalogo` VALUES ('110', '', '', 'fk_cotizacion', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Fk_cotizacion\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"7\",\"campo_a_mostrar\":\"folio\"}', '48');
INSERT INTO `constructor_elemento_catalogo` VALUES ('111', '', '', 'conceptos', '', '', '', 'Tabla', '{\"titulo\":\"Conceptos\",\"editable\":\"\",\"target\":\"48\",\"llave_foranea\":\"fk_cotizacion\",\"config_tabla\":\"[{\\\"id\\\":\\\"104\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"48\\\"},{\\\"id\\\":\\\"105\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_concepto\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fk_concepto\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"6\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"48\\\"},{\\\"id\\\":\\\"106\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"cantidad\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Cantidad\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"48\\\"},{\\\"id\\\":\\\"107\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_um\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fk_um\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"2\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"48\\\"},{\\\"id\\\":\\\"108\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"precio_unitario\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Precio_unitario\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"48\\\"},{\\\"id\\\":\\\"109\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"importe\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Importe\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"48\\\"},{\\\"id\\\":\\\"110\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_cotizacion\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fk_cotizacion\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"7\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"folio\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"48\\\"}]\"}', '47');
INSERT INTO `constructor_elemento_catalogo` VALUES ('131', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('132', '', '', 'fk_modulo', '', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fk_modulo\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"32\",\"campo_a_mostrar\":\"nombre\"}', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('133', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('134', '', '', 'controlador', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Controlador\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('135', '', '', 'modelo', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Modelo\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('136', '', '', 'tabla', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Tabla\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"52\",\"campo_a_mostrar\":\"nombre\"}', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('137', 'id', '', 'pk_tabla', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Pk_tabla\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('138', '', '', 'icono', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Icono\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('139', '', '', 'titulo_nuevo', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Titulo_nuevo\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('140', '', '', 'titulo_edicion', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Titulo_edicion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('141', '', '', 'titulo_busqueda', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Titulo_busqueda\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('142', '', '', 'msg_creado', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Msg_creado\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('143', '', '', 'msg_actualizado', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Msg_actualizado\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('144', '', '', 'pregunta_eliminar', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Pregunta_eliminar\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('145', '', '', 'msg_eliminado', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Msg_eliminado\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('146', '', '', 'msg_cambios', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Msg_cambios\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('147', '', '', 'campos_busqueda', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Campos_busqueda\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '50');
INSERT INTO `constructor_elemento_catalogo` VALUES ('148', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '51');
INSERT INTO `constructor_elemento_catalogo` VALUES ('149', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '51');
INSERT INTO `constructor_elemento_catalogo` VALUES ('150', '', '', 'icono', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Icono\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '51');
INSERT INTO `constructor_elemento_catalogo` VALUES ('151', '', '', 'nombre_interno', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre_interno\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '51');
INSERT INTO `constructor_elemento_catalogo` VALUES ('152', '', '', 'ruta_base', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Ruta_base\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '51');
INSERT INTO `constructor_elemento_catalogo` VALUES ('153', '', '', 'orden', '', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Orden\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '51');
INSERT INTO `constructor_elemento_catalogo` VALUES ('154', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '52');
INSERT INTO `constructor_elemento_catalogo` VALUES ('155', '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '52');
INSERT INTO `constructor_elemento_catalogo` VALUES ('156', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '53');
INSERT INTO `constructor_elemento_catalogo` VALUES ('157', '', '', 'esDefault', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"EsDefault\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '53');
INSERT INTO `constructor_elemento_catalogo` VALUES ('158', '', '', 'extras', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Extras\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '53');
INSERT INTO `constructor_elemento_catalogo` VALUES ('159', '', '', 'campo', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Campo\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '53');
INSERT INTO `constructor_elemento_catalogo` VALUES ('160', '', '', 'llave', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Llave\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '53');
INSERT INTO `constructor_elemento_catalogo` VALUES ('161', '', '', 'esNulo', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"EsNulo\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '53');
INSERT INTO `constructor_elemento_catalogo` VALUES ('162', '', '', 'tipo', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Tipo\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '53');
INSERT INTO `constructor_elemento_catalogo` VALUES ('163', '', '', 'componente', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Componente\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '53');
INSERT INTO `constructor_elemento_catalogo` VALUES ('164', '', '', 'comp_config', '', 'YES', 'text', 'Text Input', '{\"etiqueta\":\"Comp_config\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '53');
INSERT INTO `constructor_elemento_catalogo` VALUES ('165', '', '', 'fk_catalogo', 'MUL', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fk_catalogo\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '53');
INSERT INTO `constructor_elemento_catalogo` VALUES ('167', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '54');
INSERT INTO `constructor_elemento_catalogo` VALUES ('168', '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '54');
INSERT INTO `constructor_elemento_catalogo` VALUES ('169', '', '', 'descripcion', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '54');
INSERT INTO `constructor_elemento_catalogo` VALUES ('170', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '55');
INSERT INTO `constructor_elemento_catalogo` VALUES ('171', '', '', 'nick', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nick\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '55');
INSERT INTO `constructor_elemento_catalogo` VALUES ('172', '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '55');
INSERT INTO `constructor_elemento_catalogo` VALUES ('173', '', '', 'email', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Email\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '55');
INSERT INTO `constructor_elemento_catalogo` VALUES ('174', '', '', 'pass', '', 'NO', 'text', 'Text Input', '{\"etiqueta\":\"Pass\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '55');
INSERT INTO `constructor_elemento_catalogo` VALUES ('175', '', '', 'ip_login', '', 'NO', 'char(50)', 'Text Input', '{\"etiqueta\":\"Ip_login\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '55');
INSERT INTO `constructor_elemento_catalogo` VALUES ('176', '', '', 'last_login', '', 'NO', 'datetime', 'Text Input', '{\"etiqueta\":\"Last_login\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '55');
INSERT INTO `constructor_elemento_catalogo` VALUES ('177', '', '', 'fk_rol', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Fk_rol\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"54\",\"campo_a_mostrar\":\"nombre\"}', '55');
INSERT INTO `constructor_elemento_catalogo` VALUES ('178', '', '', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '56');
INSERT INTO `constructor_elemento_catalogo` VALUES ('179', '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '56');
INSERT INTO `constructor_elemento_catalogo` VALUES ('180', '', '', 'contacto', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Contacto\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '56');
INSERT INTO `constructor_elemento_catalogo` VALUES ('181', '', '', 'logo', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Logo\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '56');
INSERT INTO `constructor_elemento_catalogo` VALUES ('182', '', '', 'fk_empresa', '', '', '', 'Combo Box', '{\"etiqueta\":\"Empresa\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"56\",\"campo_a_mostrar\":\"nombre\"}', '55');
INSERT INTO `constructor_elemento_catalogo` VALUES ('183', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '57');
INSERT INTO `constructor_elemento_catalogo` VALUES ('184', '', '', 'descripcion', '', 'NO', 'text', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '57');
INSERT INTO `constructor_elemento_catalogo` VALUES ('185', '', '', 'num_reporte', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"No de Reporte\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '57');
INSERT INTO `constructor_elemento_catalogo` VALUES ('186', '', '', 'fk_autor', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Autor\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"55\",\"campo_a_mostrar\":\"nombre\"}', '57');
INSERT INTO `constructor_elemento_catalogo` VALUES ('187', '', '', 'fk_solicitante', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Solicitante\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"55\",\"campo_a_mostrar\":\"nombre\"}', '57');
INSERT INTO `constructor_elemento_catalogo` VALUES ('188', '', '', 'fk_empresa', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Empresa\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"56\",\"campo_a_mostrar\":\"nombre\"}', '57');
INSERT INTO `constructor_elemento_catalogo` VALUES ('189', '', '', 'status', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Status\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '57');
INSERT INTO `constructor_elemento_catalogo` VALUES ('190', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '58');
INSERT INTO `constructor_elemento_catalogo` VALUES ('191', '', '', 'fecha', '', 'NO', 'datetime', 'Text Input', '{\"etiqueta\":\"Fecha\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '58');
INSERT INTO `constructor_elemento_catalogo` VALUES ('192', '', '', 'descripcion', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '58');
INSERT INTO `constructor_elemento_catalogo` VALUES ('193', '', '', 'fk_autor', '', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fk_autor\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '58');
INSERT INTO `constructor_elemento_catalogo` VALUES ('194', '', '', 'estado', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Estado\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '58');
INSERT INTO `constructor_elemento_catalogo` VALUES ('195', '', '', 'fk_reporte', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Fk_reporte\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"57\",\"campo_a_mostrar\":\"num_reporte\"}', '58');
INSERT INTO `constructor_elemento_catalogo` VALUES ('196', '', '', 'eventos', '', '', '', 'Tabla', '{\"titulo\":\"Eventos\",\"editable\":\"1\",\"target\":\"58\",\"llave_foranea\":\"fk_reporte\",\"config_tabla\":\"[{\\\"id\\\":\\\"190\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"58\\\"},{\\\"id\\\":\\\"191\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fecha\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"datetime\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fecha\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"58\\\"},{\\\"id\\\":\\\"192\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"descripcion\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Descripcion\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"58\\\"},{\\\"id\\\":\\\"193\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_autor\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Autor\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"55\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"58\\\"},{\\\"id\\\":\\\"194\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"estado\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Estado\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"58\\\"},{\\\"id\\\":\\\"195\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_reporte\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Reporte\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"57\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"num_reporte\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"58\\\"}]\"}', '57');
INSERT INTO `constructor_elemento_catalogo` VALUES ('197', '', '', 'usuarios', '', '', '', 'Tabla', '{\"titulo\":\"Usuarios\",\"editable\":\"1\",\"target\":\"55\",\"llave_foranea\":\"fk_empresa\",\"config_tabla\":\"[{\\\"id\\\":\\\"170\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"55\\\"},{\\\"id\\\":\\\"171\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"nick\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Nick\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"55\\\"},{\\\"id\\\":\\\"172\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"nombre\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Nombre\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"55\\\"},{\\\"id\\\":\\\"173\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"email\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Email\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"55\\\"},{\\\"id\\\":\\\"174\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"pass\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"text\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Pass\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"55\\\"},{\\\"id\\\":\\\"175\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"ip_login\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(50)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Ip_login\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"55\\\"},{\\\"id\\\":\\\"176\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"last_login\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"datetime\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Last_login\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"55\\\"},{\\\"id\\\":\\\"177\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_rol\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fk_rol\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"54\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"55\\\"},{\\\"id\\\":\\\"182\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_empresa\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"\\\",\\\"tipo\\\":\\\"\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Empresa\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"56\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"55\\\"}]\"}', '56');
INSERT INTO `constructor_elemento_catalogo` VALUES ('233', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '60');
INSERT INTO `constructor_elemento_catalogo` VALUES ('234', '', '', 'cantidad', '', 'YES', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Cantidad\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '60');
INSERT INTO `constructor_elemento_catalogo` VALUES ('235', '', '', 'concepto', '', 'YES', 'char(100)', 'Text Input', '{\"etiqueta\":\"Concepto\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '60');
INSERT INTO `constructor_elemento_catalogo` VALUES ('236', '', '', 'um', '', 'YES', 'char(100)', 'Text Input', '{\"etiqueta\":\"Um\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '60');
INSERT INTO `constructor_elemento_catalogo` VALUES ('237', '', '', 'precio_u', '', 'YES', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Precio_u\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '60');
INSERT INTO `constructor_elemento_catalogo` VALUES ('238', '', '', 'importe', '', 'YES', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Importe\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '60');
INSERT INTO `constructor_elemento_catalogo` VALUES ('239', '', '', 'fk_documento', '', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fk_documento\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '60');
INSERT INTO `constructor_elemento_catalogo` VALUES ('455', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '61');
INSERT INTO `constructor_elemento_catalogo` VALUES ('456', '', '', 'nombre', '', 'YES', 'char(50)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '61');
INSERT INTO `constructor_elemento_catalogo` VALUES ('678', '', '', 'fecha_creacion', '', 'YES', 'datetime', 'Text Input', '{\"etiqueta\":\"Creado\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('679', '', '', 'fk_tipo_de_documento', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Tipo de Doc.\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"61\",\"campo_a_mostrar\":\"nombre\"}', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('680', '', '', 'fk_serie', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Serie\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"62\",\"campo_a_mostrar\":\"nombre\"}', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('681', '', '', 'folio', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Folio\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('682', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('683', '', '', 'fk_transportador', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Transportador\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"63\",\"campo_a_mostrar\":\"nombre\"}', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('684', '', '', 'fk_remitente', '', 'YES', 'char(100)', 'Combo Box', '{\"etiqueta\":\"Remitente\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"63\",\"campo_a_mostrar\":\"nombre\"}', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('685', '', '', 'fk_destinatario', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Destinatario\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"63\",\"campo_a_mostrar\":\"nombre\"}', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('686', '', '', 'fecha_entregar', '', 'YES', 'datetime', 'Text Input', '{\"etiqueta\":\"Fecha_entregar\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('687', '', '', 'origen', '', 'YES', 'char(50)', 'Text Input', '{\"etiqueta\":\"Origen\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('688', '', '', 'destino', '', 'YES', 'char(50)', 'Text Input', '{\"etiqueta\":\"Destino\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('689', '', '', 'fecha_vencimiento', '', 'YES', 'datetime', 'Text Input', '{\"etiqueta\":\"Fecha_vencimiento\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('690', '', '', 'fecha_cargar', '', 'YES', 'datetime', 'Text Input', '{\"etiqueta\":\"Fecha_cargar\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('691', '', '', 'fecha_cargado', '', 'YES', 'datetime', 'Text Input', '{\"etiqueta\":\"Fecha_cargado\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('692', '', '', 'medio_de_transporte', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Medio_de_transporte\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('693', '', '', 'datos_del_vehiculo', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Datos_del_vehiculo\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('694', '', '', 'datos_del_chofer', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Datos_del_chofer\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('695', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '62');
INSERT INTO `constructor_elemento_catalogo` VALUES ('696', '', '', 'nombre', '', 'YES', 'char(50)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '62');
INSERT INTO `constructor_elemento_catalogo` VALUES ('697', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '63');
INSERT INTO `constructor_elemento_catalogo` VALUES ('698', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '63');
INSERT INTO `constructor_elemento_catalogo` VALUES ('699', '', '', 'domicilio', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Domicilio\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '63');
INSERT INTO `constructor_elemento_catalogo` VALUES ('700', '', '', 'email', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Email\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '63');
INSERT INTO `constructor_elemento_catalogo` VALUES ('701', '', '', 'contacto', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Contacto\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '63');
INSERT INTO `constructor_elemento_catalogo` VALUES ('702', '', '', 'conceptos', '', '', '', 'Tabla', '{\"titulo\":\"Conceptos\",\"editable\":\"1\",\"target\":\"60\",\"llave_foranea\":\"fk_documento\",\"config_tabla\":\"[{\\\"id\\\":\\\"233\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"60\\\"},{\\\"id\\\":\\\"234\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"cantidad\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Cantidad\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"60\\\"},{\\\"id\\\":\\\"235\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"concepto\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"char(100)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Concepto\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"60\\\"},{\\\"id\\\":\\\"236\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"um\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"char(100)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Um\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"60\\\"},{\\\"id\\\":\\\"237\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"precio_u\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Precio_u\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"60\\\"},{\\\"id\\\":\\\"238\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"importe\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Importe\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"60\\\"},{\\\"id\\\":\\\"239\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_documento\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fk_documento\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"60\\\"}]\"}', '59');
INSERT INTO `constructor_elemento_catalogo` VALUES ('703', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '64');
INSERT INTO `constructor_elemento_catalogo` VALUES ('704', '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '64');
INSERT INTO `constructor_elemento_catalogo` VALUES ('705', '', '', 'ganancias', '', 'NO', 'decimal(18,2)', 'Text Input', '{\"etiqueta\":\"Ganancias\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '64');
INSERT INTO `constructor_elemento_catalogo` VALUES ('706', '', '', 'gastos', '', 'NO', 'decimal(18,2)', 'Text Input', '{\"etiqueta\":\"Gastos\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '64');
INSERT INTO `constructor_elemento_catalogo` VALUES ('707', '', '', 'saldo', '', 'NO', 'decimal(18,2)', 'Text Input', '{\"etiqueta\":\"Saldo\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '64');
INSERT INTO `constructor_elemento_catalogo` VALUES ('708', '', '', 'descripcion', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '64');
INSERT INTO `constructor_elemento_catalogo` VALUES ('709', '', '', 'fk_owner', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Dueño\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"65\",\"campo_a_mostrar\":\"nombre\"}', '64');
INSERT INTO `constructor_elemento_catalogo` VALUES ('710', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '65');
INSERT INTO `constructor_elemento_catalogo` VALUES ('711', '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '65');
INSERT INTO `constructor_elemento_catalogo` VALUES ('712', '', '', 'email', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Email\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '65');
INSERT INTO `constructor_elemento_catalogo` VALUES ('713', '', '', 'datos_de_contacto', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Contacto\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '65');
INSERT INTO `constructor_elemento_catalogo` VALUES ('714', '', '', 'calle', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Calle\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '65');
INSERT INTO `constructor_elemento_catalogo` VALUES ('715', '', '', 'numero_interior', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"No Int\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '65');
INSERT INTO `constructor_elemento_catalogo` VALUES ('716', '', '', 'numero_exterior', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"No Ext\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '65');
INSERT INTO `constructor_elemento_catalogo` VALUES ('717', '', '', 'colonia', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Colonia\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '65');
INSERT INTO `constructor_elemento_catalogo` VALUES ('718', '', '', 'localidad', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Localidad\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '65');
INSERT INTO `constructor_elemento_catalogo` VALUES ('719', '', '', 'referencia', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Referencia\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '65');
INSERT INTO `constructor_elemento_catalogo` VALUES ('720', '', '', 'fk_pais', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Pais\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"66\",\"campo_a_mostrar\":\"nombre\"}', '65');
INSERT INTO `constructor_elemento_catalogo` VALUES ('721', '', '', 'fk_estado', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Estado\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"67\",\"campo_a_mostrar\":\"nombre\"}', '65');
INSERT INTO `constructor_elemento_catalogo` VALUES ('722', '', '', 'fk_municipio', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Municipio\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"68\",\"campo_a_mostrar\":\"nombre\"}', '65');
INSERT INTO `constructor_elemento_catalogo` VALUES ('724', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '66');
INSERT INTO `constructor_elemento_catalogo` VALUES ('725', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"ayuda\":\"Nombre\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '66');
INSERT INTO `constructor_elemento_catalogo` VALUES ('726', '', '', 'bandera', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Bandera\",\"ayuda\":\"Bandera\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '66');
INSERT INTO `constructor_elemento_catalogo` VALUES ('727', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '67');
INSERT INTO `constructor_elemento_catalogo` VALUES ('728', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"ayuda\":\"Nombre\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '67');
INSERT INTO `constructor_elemento_catalogo` VALUES ('729', '', '', 'fk_pais', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Pais\",\"ayuda\":\"Pais\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"66\",\"campo_a_mostrar\":\"nombre\"}', '67');
INSERT INTO `constructor_elemento_catalogo` VALUES ('730', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '68');
INSERT INTO `constructor_elemento_catalogo` VALUES ('731', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"ayuda\":\"Nombre\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '68');
INSERT INTO `constructor_elemento_catalogo` VALUES ('732', '', '', 'clave_sepomex', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Clave_sepomex\",\"ayuda\":\"Clave Sepomex\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '68');
INSERT INTO `constructor_elemento_catalogo` VALUES ('733', '', '', 'fk_estado', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Estado\",\"ayuda\":\"Estado\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"67\",\"campo_a_mostrar\":\"nombre\"}', '68');
INSERT INTO `constructor_elemento_catalogo` VALUES ('734', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('735', '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('736', '', '', 'email', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Email\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('737', '', '', 'datos_de_contacto', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Contacto\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('738', '', '', 'calle', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Calle\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('739', '', '', 'numero_interior', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"No Int\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('740', '', '', 'numero_exterior', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"No Ext\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('741', '', '', 'colonia', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Colonia\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('742', '', '', 'localidad', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Localidad\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('743', '', '', 'referencia', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Referencia\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('744', '', '', 'fk_pais', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Pais\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"66\",\"campo_a_mostrar\":\"nombre\"}', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('745', '', '', 'fk_estado', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Estado\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"67\",\"campo_a_mostrar\":\"nombre\"}', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('746', '', '', 'fk_municipio', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Municipio\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"68\",\"campo_a_mostrar\":\"nombre\"}', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('747', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '70');
INSERT INTO `constructor_elemento_catalogo` VALUES ('748', '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '70');
INSERT INTO `constructor_elemento_catalogo` VALUES ('749', '', '', 'email', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Email\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '70');
INSERT INTO `constructor_elemento_catalogo` VALUES ('750', '', '', 'datos_de_contacto', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Contacto\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '70');
INSERT INTO `constructor_elemento_catalogo` VALUES ('751', '', '', 'calle', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Calle\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '70');
INSERT INTO `constructor_elemento_catalogo` VALUES ('752', '', '', 'numero_interior', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"No Int\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '70');
INSERT INTO `constructor_elemento_catalogo` VALUES ('753', '', '', 'numero_exterior', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"No Ext\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '70');
INSERT INTO `constructor_elemento_catalogo` VALUES ('754', '', '', 'colonia', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Colonia\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '70');
INSERT INTO `constructor_elemento_catalogo` VALUES ('755', '', '', 'localidad', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Localidad\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '70');
INSERT INTO `constructor_elemento_catalogo` VALUES ('756', '', '', 'referencia', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Referencia\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '70');
INSERT INTO `constructor_elemento_catalogo` VALUES ('757', '', '', 'fk_pais', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Pais\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"66\",\"campo_a_mostrar\":\"nombre\"}', '70');
INSERT INTO `constructor_elemento_catalogo` VALUES ('758', '', '', 'fk_estado', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Estado\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"67\",\"campo_a_mostrar\":\"nombre\"}', '70');
INSERT INTO `constructor_elemento_catalogo` VALUES ('759', '', '', 'fk_municipio', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Municipio\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"68\",\"campo_a_mostrar\":\"nombre\"}', '70');
INSERT INTO `constructor_elemento_catalogo` VALUES ('760', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '71');
INSERT INTO `constructor_elemento_catalogo` VALUES ('761', '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '71');
INSERT INTO `constructor_elemento_catalogo` VALUES ('762', '', '', 'datos_de_contacto', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Contacto\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '71');
INSERT INTO `constructor_elemento_catalogo` VALUES ('763', '', '', 'calle', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Calle\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '71');
INSERT INTO `constructor_elemento_catalogo` VALUES ('764', '', '', 'numero_interior', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"No Int\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '71');
INSERT INTO `constructor_elemento_catalogo` VALUES ('765', '', '', 'numero_exterior', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"No Ext\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '71');
INSERT INTO `constructor_elemento_catalogo` VALUES ('766', '', '', 'colonia', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Colonia\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '71');
INSERT INTO `constructor_elemento_catalogo` VALUES ('767', '', '', 'localidad', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Localidad\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '71');
INSERT INTO `constructor_elemento_catalogo` VALUES ('768', '', '', 'referencia', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Referencia\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '71');
INSERT INTO `constructor_elemento_catalogo` VALUES ('769', '', '', 'fk_pais', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Pais\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"66\",\"campo_a_mostrar\":\"nombre\"}', '71');
INSERT INTO `constructor_elemento_catalogo` VALUES ('770', '', '', 'fk_estado', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Estado\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"67\",\"campo_a_mostrar\":\"nombre\"}', '71');
INSERT INTO `constructor_elemento_catalogo` VALUES ('771', '', '', 'fk_municipio', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Municipio\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"68\",\"campo_a_mostrar\":\"nombre\"}', '71');
INSERT INTO `constructor_elemento_catalogo` VALUES ('772', '', '', 'fk_cliente', '', '', '', 'Combo Box', '{\"etiqueta\":\"Cliente\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"69\",\"campo_a_mostrar\":\"nombre\"}', '71');
INSERT INTO `constructor_elemento_catalogo` VALUES ('773', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '72');
INSERT INTO `constructor_elemento_catalogo` VALUES ('774', '', '', 'fk_maquina', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Maquina\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"64\",\"campo_a_mostrar\":\"nombre\"}', '72');
INSERT INTO `constructor_elemento_catalogo` VALUES ('775', '', '', 'fk_cliente', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Cliente\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"69\",\"campo_a_mostrar\":\"nombre\"}', '72');
INSERT INTO `constructor_elemento_catalogo` VALUES ('776', '', '', 'fk_pdv', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"PDV\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"71\",\"campo_a_mostrar\":\"nombre\"}', '72');
INSERT INTO `constructor_elemento_catalogo` VALUES ('777', '', '', 'fk_tecnico', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Tecnico\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"70\",\"campo_a_mostrar\":\"nombre\"}', '72');
INSERT INTO `constructor_elemento_catalogo` VALUES ('778', '', '', 'cont_entrada', '', 'NO', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Cont Entrada\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '72');
INSERT INTO `constructor_elemento_catalogo` VALUES ('779', '', '', 'cont_salida', '', 'NO', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Cont Salida\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '72');
INSERT INTO `constructor_elemento_catalogo` VALUES ('780', '', '', 'saldo_contadores', '', 'NO', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Saldo\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '72');
INSERT INTO `constructor_elemento_catalogo` VALUES ('781', '', '', 'dato_de_la_placa', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Dato De La Placa\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '72');
INSERT INTO `constructor_elemento_catalogo` VALUES ('782', '', '', 'monto', '', 'NO', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Monto\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '72');
INSERT INTO `constructor_elemento_catalogo` VALUES ('783', '', '', 'fecha', '', 'NO', 'datetime', 'Text Input', '{\"etiqueta\":\"Fecha\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '72');
INSERT INTO `constructor_elemento_catalogo` VALUES ('784', '', '', 'pdvs', '', '', '', 'Tabla', '{\"titulo\":\"Puntos de Venta\",\"editable\":\"1\",\"target\":\"71\",\"llave_foranea\":\"fk_cliente\",\"config_tabla\":\"[{\\\"id\\\":\\\"760\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"71\\\"},{\\\"id\\\":\\\"761\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"nombre\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Nombre\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"71\\\"},{\\\"id\\\":\\\"762\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"datos_de_contacto\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Contacto\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"71\\\"},{\\\"id\\\":\\\"763\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"calle\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(100)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Calle\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"71\\\"},{\\\"id\\\":\\\"764\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"numero_interior\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(20)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"No Int\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"71\\\"},{\\\"id\\\":\\\"765\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"numero_exterior\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(20)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"No Ext\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"71\\\"},{\\\"id\\\":\\\"766\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"colonia\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(100)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Colonia\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"71\\\"},{\\\"id\\\":\\\"767\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"localidad\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(100)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Localidad\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"71\\\"},{\\\"id\\\":\\\"768\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"referencia\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(100)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Referencia\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"71\\\"},{\\\"id\\\":\\\"769\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_pais\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Pais\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"66\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"71\\\"},{\\\"id\\\":\\\"770\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_estado\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Estado\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"67\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"71\\\"},{\\\"id\\\":\\\"771\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_municipio\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Municipio\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"68\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"71\\\"},{\\\"id\\\":\\\"772\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_cliente\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"\\\",\\\"tipo\\\":\\\"\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Cliente\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"69\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"71\\\"}]\"}', '69');
INSERT INTO `constructor_elemento_catalogo` VALUES ('785', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '73');
INSERT INTO `constructor_elemento_catalogo` VALUES ('786', '', '', 'serie', '', 'NO', 'char(50)', 'Text Input', '{\"etiqueta\":\"Serie\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '73');
INSERT INTO `constructor_elemento_catalogo` VALUES ('787', '', '', 'fk_owner', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Dueño\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"65\",\"campo_a_mostrar\":\"nombre\"}', '73');
INSERT INTO `constructor_elemento_catalogo` VALUES ('788', '', '', 'folio_sig', '', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Folio_sig\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '73');
INSERT INTO `constructor_elemento_catalogo` VALUES ('789', '', '', 'fk_serie', '', '', '', 'Combo Box', '{\"etiqueta\":\"Serie\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"73\",\"campo_a_mostrar\":\"serie\"}', '72');
INSERT INTO `constructor_elemento_catalogo` VALUES ('790', '', '', 'folio', '', '', '', 'Text Input', '{\"etiqueta\":\"Folio\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '72');
INSERT INTO `constructor_elemento_catalogo` VALUES ('791', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '32');
INSERT INTO `constructor_elemento_catalogo` VALUES ('792', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '32');
INSERT INTO `constructor_elemento_catalogo` VALUES ('793', '', '', 'icono', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Icono\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '32');
INSERT INTO `constructor_elemento_catalogo` VALUES ('794', '', '', 'nombre_interno', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre_interno\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '32');
INSERT INTO `constructor_elemento_catalogo` VALUES ('795', '', '', 'ruta_base', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Ruta_base\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '32');
INSERT INTO `constructor_elemento_catalogo` VALUES ('796', '', '', 'orden', '', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Orden\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '32');
INSERT INTO `constructor_elemento_catalogo` VALUES ('815', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '18');
INSERT INTO `constructor_elemento_catalogo` VALUES ('816', '', '', 'username', 'UNI', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Username\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '18');
INSERT INTO `constructor_elemento_catalogo` VALUES ('817', '', '', 'pass', '', 'YES', 'text', 'Text Input', '{\"etiqueta\":\"Pass\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '18');
INSERT INTO `constructor_elemento_catalogo` VALUES ('818', '', '', 'email', 'UNI', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Email\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '18');
INSERT INTO `constructor_elemento_catalogo` VALUES ('819', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '18');
INSERT INTO `constructor_elemento_catalogo` VALUES ('820', '', '', 'ultima_conexion', '', 'YES', 'datetime', 'Text Input', '{\"etiqueta\":\"Ultima_conexion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '18');
INSERT INTO `constructor_elemento_catalogo` VALUES ('821', '', '', 'creado', '', 'YES', 'datetime', 'Text Input', '{\"etiqueta\":\"Creado\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '18');
INSERT INTO `constructor_elemento_catalogo` VALUES ('822', '', '', 'fk_rol', '', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fk_rol\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '18');
INSERT INTO `constructor_elemento_catalogo` VALUES ('823', '', '', 'ip', '', 'NO', 'char(50)', 'Text Input', '{\"etiqueta\":\"Ip\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '18');
INSERT INTO `constructor_elemento_catalogo` VALUES ('828', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '74');
INSERT INTO `constructor_elemento_catalogo` VALUES ('829', '', '', 'clave', '', 'NO', 'char(4)', 'Text Input', '{\"etiqueta\":\"Clave\",\"ayuda\":\"Clave Asignada por el Sat\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '74');
INSERT INTO `constructor_elemento_catalogo` VALUES ('830', '', '', 'nombre', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"ayuda\":\"Nombre asignado por el SAT\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '74');
INSERT INTO `constructor_elemento_catalogo` VALUES ('831', '', '', 'descripcion', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"ayuda\":\"Campo adicional para usarlo como mejor le parezca\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '74');
INSERT INTO `constructor_elemento_catalogo` VALUES ('832', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '75');
INSERT INTO `constructor_elemento_catalogo` VALUES ('833', '', '', 'clave', '', 'NO', 'char(5)', 'Text Input', '{\"etiqueta\":\"Clave\",\"ayuda\":\"Clave SAT\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '75');
INSERT INTO `constructor_elemento_catalogo` VALUES ('834', '', '', 'nombre_corto', '', 'NO', 'char(50)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"ayuda\":\"Nombre Corto\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '75');
INSERT INTO `constructor_elemento_catalogo` VALUES ('835', '', '', 'nombre_o_razon_social', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre o RS\",\"ayuda\":\"Nombre o Razon Social del Banco\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '75');
INSERT INTO `constructor_elemento_catalogo` VALUES ('836', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '76');
INSERT INTO `constructor_elemento_catalogo` VALUES ('837', '', '', 'clave', '', 'NO', 'char(5)', 'Text Input', '{\"etiqueta\":\"Clave\",\"ayuda\":\"Clave SAT\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '76');
INSERT INTO `constructor_elemento_catalogo` VALUES ('838', '', '', 'descripcion', '', 'NO', 'char(50)', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"ayuda\":\"Descripcion\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '76');
INSERT INTO `constructor_elemento_catalogo` VALUES ('839', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '77');
INSERT INTO `constructor_elemento_catalogo` VALUES ('840', '', '', 'clave', '', 'NO', 'char(50)', 'Text Input', '{\"etiqueta\":\"Clave\",\"ayuda\":\"Clave SAT\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '77');
INSERT INTO `constructor_elemento_catalogo` VALUES ('841', '', '', 'descripcion', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"ayuda\":\"Descripción\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '77');
INSERT INTO `constructor_elemento_catalogo` VALUES ('842', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '78');
INSERT INTO `constructor_elemento_catalogo` VALUES ('843', '', '', 'clave', '', 'NO', 'char(5)', 'Text Input', '{\"etiqueta\":\"Clave\",\"ayuda\":\"Clave SAT\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '78');
INSERT INTO `constructor_elemento_catalogo` VALUES ('844', '', '', 'descripcion', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"ayuda\":\"Descripcion\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '78');
INSERT INTO `constructor_elemento_catalogo` VALUES ('845', '', '', 'comentario', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Comentario\",\"ayuda\":\"Comentarios\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '78');
INSERT INTO `constructor_elemento_catalogo` VALUES ('846', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '79');
INSERT INTO `constructor_elemento_catalogo` VALUES ('847', '', '', 'clave', '', 'NO', 'char(5)', 'Text Input', '{\"etiqueta\":\"Clave\",\"ayuda\":\"Clave SAT\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '79');
INSERT INTO `constructor_elemento_catalogo` VALUES ('848', '', '', 'descripcion', '', 'NO', 'int(100)', 'Text Input', '{\"etiqueta\":\"Descripción\",\"ayuda\":\"Descripción\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '79');
INSERT INTO `constructor_elemento_catalogo` VALUES ('849', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('850', '', '', 'nombre', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('851', '', '', 'rfc', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"Rfc\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Rfc\" }', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('852', '', '', 'email', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Email\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Email\" }', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('853', '', '', 'CURP', '', 'NO', 'char(30)', 'Text Input', '{\"etiqueta\":\"CURP\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"CURP\" }', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('854', '', '', 'fk_TipoRegimen', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Tipo Regimen\",\"ayuda\":\"Tipo Regimen\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"74\",\"campo_a_mostrar\":\"nombre\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('855', '', '', 'NumSeguridadSocial', '', 'NO', 'char(50)', 'Text Input', '{\"etiqueta\":\"NumSeguridadSocial\",\"ayuda\":\"Numero de Seguridad Social\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('856', '', '', 'calle', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Calle\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Calle\" }', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('857', '', '', 'noExterior', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"NoExterior\",\"ayuda\":\"Numero Exterior\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('858', '', '', 'noInterior', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"NoInterior\",\"ayuda\":\"Numero Interior\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('859', '', '', 'colonia', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Colonia\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Colonia\" }', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('860', '', '', 'localidad', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Localidad\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Localidad\" }', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('861', '', '', 'referencia', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Referencia\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Referencia\" }', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('862', '', '', 'fk_pais', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Pais\",\"ayuda\":\"Pais\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"66\",\"campo_a_mostrar\":\"nombre\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('863', '', '', 'fk_estado', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Estado\",\"ayuda\":\"Estado\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"67\",\"campo_a_mostrar\":\"nombre\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('864', '', '', 'fk_municipio', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Municipio\",\"ayuda\":\"Municipio\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"68\",\"campo_a_mostrar\":\"nombre\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('865', '', '', 'codigoPostal', '', 'NO', 'char(10)', 'Text Input', '{\"etiqueta\":\"Codigo Postal\",\"ayuda\":\"Codigo Postal\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('866', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '81');
INSERT INTO `constructor_elemento_catalogo` VALUES ('867', '', '', 'regimen', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Regimen\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Regimen\" }', '81');
INSERT INTO `constructor_elemento_catalogo` VALUES ('868', '', '', 'fk_razon_social', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Razon Social\",\"ayuda\":\"Razon Social\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"84\",\"campo_a_mostrar\":\"nombre_comercial\"}', '81');
INSERT INTO `constructor_elemento_catalogo` VALUES ('869', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '82');
INSERT INTO `constructor_elemento_catalogo` VALUES ('870', '', '', 'fk_razon_social', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Razon Social\",\"ayuda\":\"Razon Social\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"84\",\"campo_a_mostrar\":\"nombre_comercial\"}', '82');
INSERT INTO `constructor_elemento_catalogo` VALUES ('871', '', '', 'no_serie', 'UNI', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"No Serie\",\"ayuda\":\"Numero de  Serie\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '82');
INSERT INTO `constructor_elemento_catalogo` VALUES ('872', '', '', 'cer_pem', '', 'YES', 'text', 'Text Input', '{\"etiqueta\":\"Cer_pem\",\"ayuda\":\"Cer_pem\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '82');
INSERT INTO `constructor_elemento_catalogo` VALUES ('873', '', '', 'key_pem', '', 'YES', 'text', 'Text Input', '{\"etiqueta\":\"Key_pem\",\"ayuda\":\"Key_pem\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '82');
INSERT INTO `constructor_elemento_catalogo` VALUES ('874', '', '', 'pass', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Pass\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Pass\" }', '82');
INSERT INTO `constructor_elemento_catalogo` VALUES ('875', '', '', 'valido_desde', '', 'YES', 'datetime', 'Text Input', '{\"etiqueta\":\"Valido Desde\",\"ayuda\":\"Valido Desde\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '82');
INSERT INTO `constructor_elemento_catalogo` VALUES ('876', '', '', 'valido_hasta', '', 'YES', 'datetime', 'Text Input', '{\"etiqueta\":\"Valido Hasta\",\"ayuda\":\"Valido Hasta\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '82');
INSERT INTO `constructor_elemento_catalogo` VALUES ('877', '0', '', 'es_default', '', 'YES', 'int(1)', 'Text Input', '{\"etiqueta\":\"Es Default\",\"ayuda\":\"Es Default\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '82');
INSERT INTO `constructor_elemento_catalogo` VALUES ('878', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '83');
INSERT INTO `constructor_elemento_catalogo` VALUES ('879', '', '', 'serie', '', 'NO', 'char(5)', 'Text Input', '{\"etiqueta\":\"Serie\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Serie\" }', '83');
INSERT INTO `constructor_elemento_catalogo` VALUES ('880', '', '', 'sig_folio', '', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Folio Sig\",\"ayuda\":\"Este es el folio a ser usado en el proximo documento\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '83');
INSERT INTO `constructor_elemento_catalogo` VALUES ('881', '', '', 'es_default', '', 'YES', 'bit(1)', 'Text Input', '{\"etiqueta\":\"Es Default\",\"ayuda\":\"Serie predeterminada al crear un nuevo documento\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '83');
INSERT INTO `constructor_elemento_catalogo` VALUES ('882', '', '', 'documento', '', 'NO', 'varchar(50)', 'Text Input', '{\"etiqueta\":\"Documento\",\"ayuda\":\"Documento\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '83');
INSERT INTO `constructor_elemento_catalogo` VALUES ('883', '', '', 'fk_razon_social', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Razon Social\",\"ayuda\":\"Razon Social\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"84\",\"campo_a_mostrar\":\"nombre_comercial\"}', '83');
INSERT INTO `constructor_elemento_catalogo` VALUES ('884', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('885', '', '', 'rfc', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Rfc\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Rfc\" }', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('886', '', '', 'razon_social', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Razon Social\",\"ayuda\":\"Razon Social\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('887', '', '', 'nombre_comercial', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre Comercial\",\"ayuda\":\"Nombre Comercial\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('888', '', '', 'datos_de_contacto', '', 'YES', 'text', 'Text Input', '{\"etiqueta\":\"Datos de Contacto\",\"ayuda\":\"Datos de Contacto\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('889', '', '', 'logo_factura', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Logotipo\",\"ayuda\":\"Logotipo\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('890', '', '', 'fk_pais', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Pais\",\"ayuda\":\"Pais\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"66\",\"campo_a_mostrar\":\"nombre\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('891', '', '', 'fk_estado', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Fk_estado\",\"ayuda\":\"Fk_estado\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"67\",\"campo_a_mostrar\":\"nombre\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('892', '', '', 'fk_ciudad', '', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fk_ciudad\",\"ayuda\":\"Fk_ciudad\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('893', '', '', 'fk_municipio', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Fk_municipio\",\"ayuda\":\"Fk_municipio\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"68\",\"campo_a_mostrar\":\"nombre\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('894', '', '', 'calle', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Calle\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Calle\" }', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('895', '', '', 'noExterior', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"No Exterior\",\"ayuda\":\"Numero Exterior\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('896', '', '', 'noInterior', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"No Interior\",\"ayuda\":\"Numero Interior\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('897', '', '', 'colonia', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Colonia\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Colonia\" }', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('898', '', '', 'localidad', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Localidad\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Localidad\" }', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('899', '', '', 'referencia', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Referencia\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Referencia\" }', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('900', '', '', 'codigoPostal', '', 'YES', 'char(20)', 'Text Input', '{\"etiqueta\":\"Codigo Postal\",\"ayuda\":\"Codigo Postal\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('901', '', '', 'email_bcc', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Email\",\"ayuda\":\"Email\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('902', '', '|', 'Regimen_Fiscal', '', '', '', 'Tabla', '{\"titulo\":\"Regimen Fiscal\",\"ayuda\":\"Regimen Fiscal\",\"editable\":\"1\",\"target\":\"81\",\"llave_foranea\":\"fk_razon_social\",\"config_tabla\":\"[{\\\"id\\\":\\\"866\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"81\\\"},{\\\"id\\\":\\\"867\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"regimen\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Regimen\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Regimen\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"81\\\"},{\\\"id\\\":\\\"868\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_razon_social\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fk_razon_social\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Fk_razon_social\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"81\\\"}]\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('903', '', '', 'RegistroPatronal', '', '', '', 'Text Input', '{\"etiqueta\":\"Registro Patronal\",\"ayuda\":\"Registro Patronal\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '84');
INSERT INTO `constructor_elemento_catalogo` VALUES ('904', '', '', 'NoEmpleado', '', '', '', 'Text Input', '{\"etiqueta\":\"No Empleado\",\"ayuda\":\"Numero De Empleado\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('905', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '85');
INSERT INTO `constructor_elemento_catalogo` VALUES ('906', '', '', 'nombre', '', 'NO', 'char(50)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '85');
INSERT INTO `constructor_elemento_catalogo` VALUES ('907', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '86');
INSERT INTO `constructor_elemento_catalogo` VALUES ('908', '', '', 'descripcion', '', 'NO', 'char(50)', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Descripcion\" }', '86');
INSERT INTO `constructor_elemento_catalogo` VALUES ('909', '', '', 'dias', '', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Dias\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Dias\" }', '86');
INSERT INTO `constructor_elemento_catalogo` VALUES ('910', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '87');
INSERT INTO `constructor_elemento_catalogo` VALUES ('911', '', '', 'nombre', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '87');
INSERT INTO `constructor_elemento_catalogo` VALUES ('912', '', '', 'codigo', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"Codigo\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Codigo\" }', '87');
INSERT INTO `constructor_elemento_catalogo` VALUES ('913', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('914', '', '', 'fk_patron', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Patron\",\"ayuda\":\"Patron\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"84\",\"campo_a_mostrar\":\"razon_social\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('915', '', '', 'fk_empleado', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Empleado\",\"ayuda\":\"Empleado\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"80\",\"campo_a_mostrar\":\"nombre\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('916', '', '', 'fk_serie', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Serie\",\"ayuda\":\"Serie\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"83\",\"campo_a_mostrar\":\"serie\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('917', '', '', 'serie', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"Serie\",\"ayuda\":\"Serie\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('918', '', '', 'folio', '', 'NO', 'char(10)', 'Text Input', '{\"etiqueta\":\"Folio\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Folio\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('919', '', '', 'Version', '', 'NO', 'char(5)', 'Text Input', '{\"etiqueta\":\"Version\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Version\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('920', '', '', 'RegistroPatronal', '', 'NO', 'char(20)', 'Text Input', '{\"etiqueta\":\"RegistroPatronal\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"RegistroPatronal\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('921', '', '', 'NumEmpleado', '', 'NO', 'char(15)', 'Text Input', '{\"etiqueta\":\"NumEmpleado\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"NumEmpleado\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('922', '', '', 'CURP', '', 'NO', 'int(50)', 'Text Input', '{\"etiqueta\":\"CURP\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"CURP\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('923', '', '', 'fk_TipoRegimen', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Tipo Regimen\",\"ayuda\":\"Tipo Regimen\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"74\",\"campo_a_mostrar\":\"nombre\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('924', '', '', 'TipoRegimen', '', 'NO', 'char(10)', 'Text Input', '{\"etiqueta\":\"TipoRegimen\",\"ayuda\":\"TipoRegimen\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('925', '', '', 'NumSeguridadSocial', '', 'NO', 'char(15)', 'Text Input', '{\"etiqueta\":\"NumSeguridadSocial\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"NumSeguridadSocial\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('926', '', '', 'FechaPago', '', 'NO', 'datetime', 'Text Input', '{\"etiqueta\":\"FechaPago\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"FechaPago\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('927', '', '', 'FechaInicialPago', '', 'NO', 'datetime', 'Text Input', '{\"etiqueta\":\"FechaInicialPago\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"FechaInicialPago\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('928', '', '', 'FechaFinalPago', '', 'NO', 'datetime', 'Text Input', '{\"etiqueta\":\"FechaFinalPago\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"FechaFinalPago\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('929', '', '', 'NumDiasPagados', '', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"NumDiasPagados\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"NumDiasPagados\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('930', '', '', 'fk_Departamento', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Departamento\",\"ayuda\":\"Departamento\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"87\",\"campo_a_mostrar\":\"nombre\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('931', '', '', 'Departamento', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Departamento\",\"ayuda\":\"Departamento\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('932', '', '', 'CLABE', '', 'NO', 'char(50)', 'Text Input', '{\"etiqueta\":\"CLABE\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"CLABE\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('933', '', '', 'Banco', '', 'NO', 'char(10)', 'Text Input', '{\"etiqueta\":\"Banco\",\"ayuda\":\"Banco\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('934', '', '', 'FechaInicioRelLaboral', '', 'NO', 'datetime', 'Text Input', '{\"etiqueta\":\"FechaInicioRelLaboral\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"FechaInicioRelLaboral\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('935', '', '', 'Antiguedad', '', 'NO', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Antiguedad\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Antiguedad\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('936', '', '', 'Puesto', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Puesto\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Puesto\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('937', '', '', 'TipoContrato', '', 'NO', 'char(100)', 'Combo Box', '{\"etiqueta\":\"TipoContrato\",\"ayuda\":\"TipoContrato\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"107\",\"campo_a_mostrar\":\"nombre\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('938', '', '', 'TipoJornada', '', 'NO', 'char(100)', 'Combo Box', '{\"etiqueta\":\"Tipo Jornada\",\"ayuda\":\"Tipo Jornada\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"85\",\"campo_a_mostrar\":\"nombre\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('939', '', '', 'PeriodicidadPago', '', 'NO', 'char(100)', 'Combo Box', '{\"etiqueta\":\"Periodicidad Pago\",\"ayuda\":\"Periodicidad del Pago\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"86\",\"campo_a_mostrar\":\"descripcion\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('940', '', '', 'SalarioBaseCotApor', '', 'NO', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"SalarioBaseCotApor\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"SalarioBaseCotApor\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('941', '', '', 'RiesgoPuesto', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"RiesgoPuesto\",\"ayuda\":\"RiesgoPuesto\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('942', '', '', 'SalarioDiarioIntegrado', '', 'NO', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"SalarioDiarioIntegrado\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"SalarioDiarioIntegrado\" }', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('943', '', '', 'fk_banco', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Banco\",\"ayuda\":\"Banco\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"75\",\"campo_a_mostrar\":\"nombre_corto\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('944', '', '', 'fk_RiesgoPuesto', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Riesgo Puesto\",\"ayuda\":\"Riesgo Puesto\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"76\",\"campo_a_mostrar\":\"descripcion\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('945', '', '', 'percepcionesTotalGravado', '', '', '', 'Text Input', '{\"etiqueta\":\"P. Tot. Gravado\",\"ayuda\":\"Percepciones Total Gravado\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('946', '', '', 'percepcionesTotalExcento', '', '', '', 'Text Input', '{\"etiqueta\":\"P. Tot. Excento\",\"ayuda\":\"Percepciones Total Excento\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('947', '', '', 'deduccionesTotalGravado', '', '', '', 'Text Input', '{\"etiqueta\":\"D Tot. Gravado\",\"ayuda\":\"Deducciones Total Gravado\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('948', '', '', 'deduccionesTotalExcento', '', '', '', 'Text Input', '{\"etiqueta\":\"D. Tot. Excento\",\"ayuda\":\"Deducciones\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('949', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '89');
INSERT INTO `constructor_elemento_catalogo` VALUES ('950', '', '', 'fk_TipoPercepcion', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Tipo Percepcion\",\"ayuda\":\"Tipo Percepcion\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"77\",\"campo_a_mostrar\":\"descripcion\"}', '89');
INSERT INTO `constructor_elemento_catalogo` VALUES ('951', '', '', 'Clave', '', 'NO', 'char(15)', 'Text Input', '{\"etiqueta\":\"Clave\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Clave\" }', '89');
INSERT INTO `constructor_elemento_catalogo` VALUES ('952', '', '', 'Concepto', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Concepto\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Concepto\" }', '89');
INSERT INTO `constructor_elemento_catalogo` VALUES ('953', '', '', 'ImporteGravado', '', 'NO', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"ImporteGravado\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"ImporteGravado\" }', '89');
INSERT INTO `constructor_elemento_catalogo` VALUES ('954', '', '', 'ImporteExcento', '', 'NO', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"ImporteExcento\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"ImporteExcento\" }', '89');
INSERT INTO `constructor_elemento_catalogo` VALUES ('955', '', '', 'TipoPercepcion', '', 'NO', 'char(50)', 'Text Input', '{\"etiqueta\":\"TipoPercepcion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"TipoPercepcion\" }', '89');
INSERT INTO `constructor_elemento_catalogo` VALUES ('956', '', '', 'fk_nomina', '', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fk_nomina\",\"ayuda\":\"Fk_nomina\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '89');
INSERT INTO `constructor_elemento_catalogo` VALUES ('957', '', '', 'percepciones', '', '', '', 'Tabla', '{\"titulo\":\"Percepciones\",\"ayuda\":\"Percepciones\",\"editable\":\"1\",\"target\":\"89\",\"llave_foranea\":\"fk_nomina\",\"config_tabla\":\"[{\\\"id\\\":\\\"949\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"89\\\"},{\\\"id\\\":\\\"950\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_TipoPercepcion\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Tipo Percepcion\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Tipo Percepcion\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"77\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"descripcion\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"89\\\"},{\\\"id\\\":\\\"951\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"Clave\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(15)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Clave\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Clave\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"89\\\"},{\\\"id\\\":\\\"952\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"Concepto\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(100)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Concepto\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Concepto\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"89\\\"},{\\\"id\\\":\\\"953\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"ImporteGravado\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"ImporteGravado\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"ImporteGravado\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"89\\\"},{\\\"id\\\":\\\"954\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"ImporteExcento\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"ImporteExcento\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"ImporteExcento\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"89\\\"},{\\\"id\\\":\\\"955\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"TipoPercepcion\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(50)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"TipoPercepcion\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"TipoPercepcion\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"89\\\"},{\\\"id\\\":\\\"956\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_nomina\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fk_nomina\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Fk_nomina\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"89\\\"}]\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('958', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '90');
INSERT INTO `constructor_elemento_catalogo` VALUES ('959', '', '', 'fk_TipoDeduccion', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Tipo Deduccion\",\"ayuda\":\"Tipo Deduccion\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"78\",\"campo_a_mostrar\":\"descripcion\"}', '90');
INSERT INTO `constructor_elemento_catalogo` VALUES ('960', '', '', 'TipoDeduccion', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"TipoDeduccion\",\"ayuda\":\"TipoDeduccion\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '90');
INSERT INTO `constructor_elemento_catalogo` VALUES ('961', '', '', 'Clave', '', 'NO', 'int(15)', 'Text Input', '{\"etiqueta\":\"Clave\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Clave\" }', '90');
INSERT INTO `constructor_elemento_catalogo` VALUES ('962', '', '', 'Concepto', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Concepto\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Concepto\" }', '90');
INSERT INTO `constructor_elemento_catalogo` VALUES ('963', '', '', 'ImporteGravado', '', 'NO', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"ImporteGravado\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"ImporteGravado\" }', '90');
INSERT INTO `constructor_elemento_catalogo` VALUES ('964', '', '', 'ImporteExcento', '', 'NO', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"ImporteExcento\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"ImporteExcento\" }', '90');
INSERT INTO `constructor_elemento_catalogo` VALUES ('965', '', '', 'fk_nomina', '', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fk_nomina\",\"ayuda\":\"Fk_nomina\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '90');
INSERT INTO `constructor_elemento_catalogo` VALUES ('966', '', '', 'deducciones', '', '', '', 'Tabla', '{\"titulo\":\"Deducciones\",\"ayuda\":\"Deducciones\",\"editable\":\"1\",\"target\":\"90\",\"llave_foranea\":\"fk_nomina\",\"config_tabla\":\"[{\\\"id\\\":\\\"958\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"90\\\"},{\\\"id\\\":\\\"959\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_TipoDeduccion\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Tipo Deduccion\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Tipo Deduccion\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"78\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"descripcion\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"90\\\"},{\\\"id\\\":\\\"960\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"TipoDeduccion\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(100)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"TipoDeduccion\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"TipoDeduccion\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"90\\\"},{\\\"id\\\":\\\"961\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"Clave\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(15)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Clave\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Clave\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"90\\\"},{\\\"id\\\":\\\"962\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"Concepto\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(100)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Concepto\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Concepto\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"90\\\"},{\\\"id\\\":\\\"963\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"ImporteGravado\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"ImporteGravado\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"ImporteGravado\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"90\\\"},{\\\"id\\\":\\\"964\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"ImporteExcento\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"ImporteExcento\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"ImporteExcento\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"90\\\"},{\\\"id\\\":\\\"965\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_nomina\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fk_nomina\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Fk_nomina\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"90\\\"}]\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('967', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '91');
INSERT INTO `constructor_elemento_catalogo` VALUES ('968', '', '', 'DiasIncapacidad', '', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"DiasIncapacidad\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"DiasIncapacidad\" }', '91');
INSERT INTO `constructor_elemento_catalogo` VALUES ('969', '', '', 'fk_TipoIncapacidad', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Tipo Incapacidad\",\"ayuda\":\"Tipo Incapacidad\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"79\",\"campo_a_mostrar\":\"descripcion\"}', '91');
INSERT INTO `constructor_elemento_catalogo` VALUES ('970', '', '', 'TipoIncapacidad', '', 'NO', 'char(15)', 'Text Input', '{\"etiqueta\":\"TipoIncapacidad\",\"ayuda\":\"TipoIncapacidad\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '91');
INSERT INTO `constructor_elemento_catalogo` VALUES ('971', '', '', 'Descuento', '', 'NO', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Descuento\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Descuento\" }', '91');
INSERT INTO `constructor_elemento_catalogo` VALUES ('972', '', '', 'fk_nomina', '', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fk_nomina\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Fk_nomina\" }', '91');
INSERT INTO `constructor_elemento_catalogo` VALUES ('973', '', '', 'incapacidades', '', '', '', 'Tabla', '{\"titulo\":\"Incapacidades\",\"ayuda\":\"Incapacidades\",\"editable\":\"1\",\"target\":\"91\",\"llave_foranea\":\"fk_nomina\",\"config_tabla\":\"[{\\\"id\\\":\\\"967\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"91\\\"},{\\\"id\\\":\\\"968\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"DiasIncapacidad\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"DiasIncapacidad\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"DiasIncapacidad\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"91\\\"},{\\\"id\\\":\\\"969\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_TipoIncapacidad\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Tipo Incapacidad\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Tipo Incapacidad\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"79\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"descripcion\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"91\\\"},{\\\"id\\\":\\\"970\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"TipoIncapacidad\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(15)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"TipoIncapacidad\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"TipoIncapacidad\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"91\\\"},{\\\"id\\\":\\\"971\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"Descuento\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Descuento\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Descuento\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"91\\\"},{\\\"id\\\":\\\"972\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_nomina\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fk_nomina\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Fk_nomina\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"91\\\"}]\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('974', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(1)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '92');
INSERT INTO `constructor_elemento_catalogo` VALUES ('975', '', '', 'nombre', '', 'NO', 'char(100)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '92');
INSERT INTO `constructor_elemento_catalogo` VALUES ('976', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '93');
INSERT INTO `constructor_elemento_catalogo` VALUES ('977', '', '', 'Dias', '', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Dias\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Dias\" }', '93');
INSERT INTO `constructor_elemento_catalogo` VALUES ('978', '', '', 'TipoHoras', '', 'NO', 'char(50)', 'Text Input', '{\"etiqueta\":\"TipoHoras\",\"ayuda\":\"TipoHoras\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '93');
INSERT INTO `constructor_elemento_catalogo` VALUES ('979', '', '', 'fk_TipoHoras', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Tipo Horas\",\"ayuda\":\"Tipo Horas\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"92\",\"campo_a_mostrar\":\"nombre\"}', '93');
INSERT INTO `constructor_elemento_catalogo` VALUES ('980', '', '', 'HorasExtra', '', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"HorasExtra\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"HorasExtra\" }', '93');
INSERT INTO `constructor_elemento_catalogo` VALUES ('981', '', '', 'ImportePagado', '', 'NO', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"ImportePagado\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"ImportePagado\" }', '93');
INSERT INTO `constructor_elemento_catalogo` VALUES ('982', '', '', 'fk_nomina', '', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fk_nomina\",\"ayuda\":\"Fk_nomina\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '93');
INSERT INTO `constructor_elemento_catalogo` VALUES ('983', '', '', 'horas_extra', '', '', '', 'Tabla', '{\"titulo\":\"Horas Extra\",\"ayuda\":\"Horas Extra\",\"editable\":\"1\",\"target\":\"93\",\"llave_foranea\":\"fk_nomina\",\"config_tabla\":\"[{\\\"id\\\":\\\"976\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"93\\\"},{\\\"id\\\":\\\"977\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"Dias\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Dias\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Dias\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"93\\\"},{\\\"id\\\":\\\"978\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"TipoHoras\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"char(50)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"TipoHoras\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"TipoHoras\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"93\\\"},{\\\"id\\\":\\\"979\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_TipoHoras\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Tipo Horas\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Tipo Horas\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"92\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"93\\\"},{\\\"id\\\":\\\"980\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"HorasExtra\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"HorasExtra\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"HorasExtra\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"93\\\"},{\\\"id\\\":\\\"981\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"ImportePagado\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"ImportePagado\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"ImportePagado\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"93\\\"},{\\\"id\\\":\\\"982\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_nomina\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fk_nomina\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Fk_nomina\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"93\\\"}]\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('984', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '94');
INSERT INTO `constructor_elemento_catalogo` VALUES ('985', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '94');
INSERT INTO `constructor_elemento_catalogo` VALUES ('986', '', '', 'ubicacion', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Ubicacion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Ubicacion\" }', '94');
INSERT INTO `constructor_elemento_catalogo` VALUES ('987', '', '', 'logo', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Logo\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Logo\" }', '94');
INSERT INTO `constructor_elemento_catalogo` VALUES ('988', '', '', 'favicon', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Favicon\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Favicon\" }', '94');
INSERT INTO `constructor_elemento_catalogo` VALUES ('989', '', '', 'descripcion', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Descripcion\" }', '94');
INSERT INTO `constructor_elemento_catalogo` VALUES ('990', '', '', 'tags', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Tags\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Tags\" }', '94');
INSERT INTO `constructor_elemento_catalogo` VALUES ('991', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '95');
INSERT INTO `constructor_elemento_catalogo` VALUES ('992', '', '', 'host', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Host\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Host\" }', '95');
INSERT INTO `constructor_elemento_catalogo` VALUES ('993', '', '', 'db_name', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"DB Name\",\"ayuda\":\"Nombre de la base de datos\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '95');
INSERT INTO `constructor_elemento_catalogo` VALUES ('994', '', '', 'user', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"User\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"User\" }', '95');
INSERT INTO `constructor_elemento_catalogo` VALUES ('995', '', '', 'pass', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Pass\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Pass\" }', '95');
INSERT INTO `constructor_elemento_catalogo` VALUES ('997', '', '', 'conexiones', '', '', '', 'Tabla', '{\"titulo\":\"Conexiones\",\"ayuda\":\"Conexiones\",\"editable\":\"1\",\"target\":\"95\",\"llave_foranea\":\"fk_app\",\"config_tabla\":\"[{\\\"id\\\":\\\"991\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"95\\\"},{\\\"id\\\":\\\"992\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"host\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Host\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Host\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"95\\\"},{\\\"id\\\":\\\"993\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"db_name\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"DB Name\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Nombre de la base de datos\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"95\\\"},{\\\"id\\\":\\\"994\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"user\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"User\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"User\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"95\\\"},{\\\"id\\\":\\\"995\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"pass\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Pass\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Pass\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"95\\\"}]\"}', '94');
INSERT INTO `constructor_elemento_catalogo` VALUES ('998', '', '', 'fk_app', '', '', '', 'Text Input', '{\"etiqueta\":\"App\",\"ayuda\":\"\",\"requerido\":\"1\",\"oculto\":\"1\",\"editable\":\"1\"}', '95');
INSERT INTO `constructor_elemento_catalogo` VALUES ('999', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '96');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1000', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '96');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1001', '', '', 'ruta', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Ruta\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Ruta\" }', '96');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1002', '', '', 'fk_forma_pago', '', '', '', 'Combo Box', '{\"etiqueta\":\"Forma de Pago\",\"ayuda\":\"Forma de Pago\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"97\",\"campo_a_mostrar\":\"nombre\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1003', '', '', 'fk_certificado', '', '', '', 'Combo Box', '{\"etiqueta\":\"Certificado\",\"ayuda\":\"Certificado\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"82\",\"campo_a_mostrar\":\"no_serie\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1004', '', '', 'condiciones_de_pago', '', '', '', 'Text Input', '{\"etiqueta\":\"Condiciones De Pago\",\"ayuda\":\"Condiciones De Pago\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1005', '', '', 'subTotal', '', '', '', 'Text Input', '{\"etiqueta\":\"Subtotal\",\"ayuda\":\"Subtotal\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1006', '', '', 'descuento', '', '', '', 'Text Input', '{\"etiqueta\":\"Descuento\",\"ayuda\":\"Descuento\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1007', '', '', 'motivo_descuento', '', '', '', 'Text Input', '{\"etiqueta\":\"Motivo de descuento\",\"ayuda\":\"Motivo de descuento\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1008', '', '', 'tipo_cambio', '', '', '', 'Text Input', '{\"etiqueta\":\"Tipo de Cambio\",\"ayuda\":\"Tipo de Cambio\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1009', '', '', 'fk_moneda', '', '', '', 'Combo Box', '{\"etiqueta\":\"Moneda\",\"ayuda\":\"Moneda\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"99\",\"campo_a_mostrar\":\"moneda\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1010', '', '', 'total', '', '', '', 'Text Input', '{\"etiqueta\":\"Total\",\"ayuda\":\"Total\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1011', '', '', 'tipo_comprobante', '', '', '', 'Text Input', '{\"etiqueta\":\"Tipo De Comprobante\",\"ayuda\":\"Tipo De Comprobante\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1012', '', '', 'fk_metodo_pago', '', '', '', 'Combo Box', '{\"etiqueta\":\"Método de Pago\",\"ayuda\":\"Método de Pago\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"98\",\"campo_a_mostrar\":\"nombre\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1013', '', '', 'num_cta_pago', '', '', '', 'Text Input', '{\"etiqueta\":\"Num Cta Pago\",\"ayuda\":\"Ultimos 4 digitos de la cuenta\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1014', '', '', 'totImpRet', '', '', '', 'Text Input', '{\"etiqueta\":\"Tot Imp Ret\",\"ayuda\":\"Total de Impuestos Retenidos\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1015', '', '', 'totImpTras', '', '', '', 'Text Input', '{\"etiqueta\":\"Tot Imp Tras\",\"ayuda\":\"Total de Impuestos Trasladados\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1016', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '97');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1017', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '97');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1018', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '98');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1019', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '98');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1020', '0', '', 'es_pago_con_tarjeta', '', 'YES', 'int(1)', 'Text Input', '{\"etiqueta\":\"Usa Tarjeta\",\"ayuda\":\"Si es un pago con tarjeta, marque esta casilla\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '98');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1021', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '99');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1022', '', '', 'codigo', '', 'YES', 'char(5)', 'Text Input', '{\"etiqueta\":\"Codigo\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Codigo\" }', '99');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1023', '', '', 'moneda', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Moneda\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Moneda\" }', '99');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1024', '', '', 'descripcion', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Descripcion\" }', '99');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1025', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '100');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1026', '', '', 'cantidad', '', 'YES', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Cantidad\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Cantidad\" }', '100');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1027', '', '', 'unidad', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Unidad\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Unidad\" }', '100');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1028', '', '', 'fk_um', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"UM\",\"ayuda\":\"Unidad de Medida\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"101\",\"campo_a_mostrar\":\"nombre\"}', '100');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1029', '', '', 'fk_concepto', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Concepto\",\"ayuda\":\"Concepto\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"102\",\"campo_a_mostrar\":\"nombre\"}', '100');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1030', '', '', 'descripcion', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Descripcion\" }', '100');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1031', '', '', 'valorUnitario', '', 'YES', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"ValorUnitario\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"ValorUnitario\" }', '100');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1032', '', '', 'importe', '', 'YES', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Importe\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Importe\" }', '100');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1033', '', '', 'noIdentificacion', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"NoIdentificacion\",\"ayuda\":\"NoIdentificacion\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '100');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1034', '', '', 'fk_nomina', '', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fk_nomina\",\"ayuda\":\"Fk_nomina\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '100');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1035', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '101');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1036', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '101');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1037', '', '', 'abreviacion', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Abreviacion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Abreviacion\" }', '101');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1038', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '102');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1039', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '102');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1040', '', '', 'descripcion', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Descripcion\" }', '102');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1041', '', '', 'precio', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Precio\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Precio\" }', '102');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1042', '', '', 'fk_unidad', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"UM\",\"ayuda\":\"Unidad De Medida\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"101\",\"campo_a_mostrar\":\"abreviacion\"}', '102');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1043', '', '', 'conceptos', '', '', '', 'Tabla', '{\"titulo\":\"Conceptos\",\"ayuda\":\"Conceptos\",\"editable\":\"1\",\"target\":\"100\",\"llave_foranea\":\"fk_nomina\",\"config_tabla\":\"[{\\\"id\\\":\\\"1025\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"100\\\"},{\\\"id\\\":\\\"1026\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"cantidad\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Cantidad\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Cantidad\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"100\\\"},{\\\"id\\\":\\\"1027\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"unidad\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Unidad\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Unidad\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"100\\\"},{\\\"id\\\":\\\"1028\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_um\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"UM\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Unidad de Medida\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"101\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"100\\\"},{\\\"id\\\":\\\"1029\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_concepto\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Concepto\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Concepto\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"102\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"100\\\"},{\\\"id\\\":\\\"1030\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"descripcion\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Descripcion\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Descripcion\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"100\\\"},{\\\"id\\\":\\\"1031\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"valorUnitario\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"ValorUnitario\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"ValorUnitario\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"100\\\"},{\\\"id\\\":\\\"1032\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"importe\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Importe\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Importe\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"100\\\"},{\\\"id\\\":\\\"1033\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"noIdentificacion\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"NoIdentificacion\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"NoIdentificacion\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"100\\\"},{\\\"id\\\":\\\"1034\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_nomina\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fk_nomina\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Fk_nomina\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"100\\\"}]\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1044', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '103');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1045', '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '103');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1046', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '104');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1047', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '104');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1048', '', '', 'tasa', '', 'YES', 'float(18,4)', 'Text Input', '{\"etiqueta\":\"Tasa\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Tasa\" }', '104');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1049', '', '', 'fk_naturaleza', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Naturaleza\",\"ayuda\":\"Naturaleza\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"103\",\"campo_a_mostrar\":\"nombre\"}', '104');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1050', '', '', 'detalles', '', 'YES', 'text', 'Text Input', '{\"etiqueta\":\"Detalles\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Detalles\" }', '104');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1051', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '105');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1052', '', '', 'fk_impuesto', 'MUL', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Impuesto\",\"ayuda\":\"Impuesto\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"104\",\"campo_a_mostrar\":\"nombre\"}', '105');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1053', '', '', 'fk_nomina', 'MUL', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fk_nomina\",\"ayuda\":\"Fk_nomina\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '105');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1054', '0.000000', '', 'importe', '', 'YES', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Importe\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Importe\" }', '105');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1055', '', '', 'tasai', '', 'YES', 'decimal(18,6)', 'Text Input', '{\"etiqueta\":\"Tasai\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Tasai\" }', '105');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1056', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '105');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1057', '', '', 'fk_tipo_impuesto', '', 'YES', 'char(255)', 'Combo Box', '{\"etiqueta\":\"Tipo Impuesto\",\"ayuda\":\"Tipo De Impuesto\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"103\",\"campo_a_mostrar\":\"nombre\"}', '105');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1058', '', '', 'impuestos', '', '', '', 'Tabla', '{\"titulo\":\"Impuestos\",\"ayuda\":\"Impuestos\",\"editable\":\"1\",\"target\":\"105\",\"llave_foranea\":\"fk_nomina\",\"config_tabla\":\"[{\\\"id\\\":\\\"1051\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"105\\\"},{\\\"id\\\":\\\"1052\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_impuesto\\\",\\\"llave\\\":\\\"MUL\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Impuesto\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Impuesto\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"104\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"105\\\"},{\\\"id\\\":\\\"1053\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_nomina\\\",\\\"llave\\\":\\\"MUL\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fk_nomina\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Fk_nomina\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"105\\\"},{\\\"id\\\":\\\"1054\\\",\\\"esDefault\\\":\\\"0.000000\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"importe\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Importe\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Importe\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"105\\\"},{\\\"id\\\":\\\"1055\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"tasai\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"decimal(18,6)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Tasai\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Tasai\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"105\\\"},{\\\"id\\\":\\\"1056\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"nombre\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Nombre\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Nombre\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"105\\\"},{\\\"id\\\":\\\"1057\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_tipo_impuesto\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Tipo Impuesto\\\\\\\",\\\\\\\"ayuda\\\\\\\":\\\\\\\"Tipo De Impuesto\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"103\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"105\\\"}]\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1059', '', '', 'fecha_emision', '', '', '', 'Text Input', '{\"etiqueta\":\"Fecha Emision\",\"ayuda\":\"Fecha Emision\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '88');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1060', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Id\" }', '106');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1061', '', '', 'title', '', 'NO', 'varchar(50)', 'Text Input', '{\"etiqueta\":\"Title\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Title\" }', '106');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1062', '0', '', 'lft', '', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Lft\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Lft\" }', '106');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1063', '0', '', 'rgt', '', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Rgt\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Rgt\" }', '106');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1064', '0', '', 'parent', '', 'NO', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Parent\",\"ayuda\":\"Parent\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"106\",\"campo_a_mostrar\":\"title\"}', '106');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1065', '', '', 'SalarioDiarioIntegrado', '', '', '', 'Text Input', '{\"etiqueta\":\"Salario Diario Integrado\",\"ayuda\":\"Salario Diario Integrado\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1066', '', '', 'SalarioBaseCotApor', '', '', '', 'Text Input', '{\"etiqueta\":\"Salario Base Cot\",\"ayuda\":\"Salario Base \",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1067', '', '', 'FechaInicioRelLaboral', '', '', '', 'Text Input', '{\"etiqueta\":\"Fecha Contratación\",\"ayuda\":\"Fecha De Inicio De La Relación Laboral\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1068', '', '', 'puesto', '', '', '', 'Text Input', '{\"etiqueta\":\"Puesto\",\"ayuda\":\"Puesto\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1069', '', '', 'fk_TipoContrato', '', '', '', 'Combo Box', '{\"etiqueta\":\"Tipo Contrato\",\"ayuda\":\"Tipo De Contrato\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"107\",\"campo_a_mostrar\":\"nombre\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1070', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '107');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1071', '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '107');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1072', '', '', 'descripcion', '', '', '', 'Text Input', '{\"etiqueta\":\"Descripcion\",\"ayuda\":\"Descripcion\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '107');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1073', '', '', 'fk_departamento', '', '', '', 'Combo Box', '{\"etiqueta\":\"Departamento\",\"ayuda\":\"Departamento\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"87\",\"campo_a_mostrar\":\"nombre\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1075', '', '', 'fk_TipoJornada', '', '', '', 'Combo Box', '{\"etiqueta\":\"Tipo Jornada\",\"ayuda\":\"Tipo Jornada\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"85\",\"campo_a_mostrar\":\"nombre\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1076', '', '', 'fk_PeriodicidadPago', '', '', '', 'Combo Box', '{\"etiqueta\":\"Periodicidad Pago\",\"ayuda\":\"Periodicidad Pago\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"86\",\"campo_a_mostrar\":\"descripcion\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1077', '', '', 'fk_RiesgoPuesto', '', '', '', 'Combo Box', '{\"etiqueta\":\"Riesgo Puesto\",\"ayuda\":\"Riesgo Puesto\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"76\",\"campo_a_mostrar\":\"descripcion\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1078', '', '', 'fk_banco', '', '', '', 'Combo Box', '{\"etiqueta\":\"Banco\",\"ayuda\":\"Banco\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"75\",\"campo_a_mostrar\":\"nombre_corto\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1079', '', '', 'CLABE', '', '', '', 'Text Input', '{\"etiqueta\":\"CLABE\",\"ayuda\":\"Clave interbancaria\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '80');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1080', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"ayuda\":\"Id\",\"requerido\":\"0\",\"oculto\":\"1\",\"editable\":\"1\"}', '42');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1081', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Nombre\" }', '42');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1082', '', '', 'tabla', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Tabla\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Tabla\" }', '42');
INSERT INTO `constructor_elemento_catalogo` VALUES ('1083', '', '', 'llave_primaria', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Llave_primaria\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\",\"ayuda\":\"Llave_primaria\" }', '42');

-- ----------------------------
-- Table structure for `constructor_tabla`
-- ----------------------------
DROP TABLE IF EXISTS `constructor_tabla`;
CREATE TABLE `constructor_tabla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of constructor_tabla
-- ----------------------------

-- ----------------------------
-- Table structure for `exp_concepto`
-- ----------------------------
DROP TABLE IF EXISTS `exp_concepto`;
CREATE TABLE `exp_concepto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `fk_um` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exp_concepto
-- ----------------------------
INSERT INTO `exp_concepto` VALUES ('1', 'Nuevo Concepto', '1');
INSERT INTO `exp_concepto` VALUES ('2', 'SSd', '3');

-- ----------------------------
-- Table structure for `exp_conceptos_cotizacion`
-- ----------------------------
DROP TABLE IF EXISTS `exp_conceptos_cotizacion`;
CREATE TABLE `exp_conceptos_cotizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_concepto` int(11) DEFAULT NULL,
  `cantidad` decimal(18,6) DEFAULT NULL,
  `fk_um` decimal(18,6) DEFAULT NULL,
  `precio_unitario` decimal(18,6) DEFAULT NULL,
  `importe` decimal(18,6) DEFAULT NULL,
  `fk_cotizacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exp_conceptos_cotizacion
-- ----------------------------
INSERT INTO `exp_conceptos_cotizacion` VALUES ('1', '1', '0.000000', '0.000000', '0.000000', '0.000000', '2');
INSERT INTO `exp_conceptos_cotizacion` VALUES ('2', '2', '3.000000', '3.000000', '3.000000', '0.000000', '2');
INSERT INTO `exp_conceptos_cotizacion` VALUES ('3', '0', '0.000000', '0.000000', '0.000000', '0.000000', '2');
INSERT INTO `exp_conceptos_cotizacion` VALUES ('4', '0', '0.000000', '0.000000', '0.000000', '0.000000', '2');
INSERT INTO `exp_conceptos_cotizacion` VALUES ('5', '0', '6.000000', '0.000000', '0.000000', '0.000000', '2');
INSERT INTO `exp_conceptos_cotizacion` VALUES ('6', '0', '0.000000', '0.000000', '0.000000', '0.000000', '2');

-- ----------------------------
-- Table structure for `exp_cotizacion`
-- ----------------------------
DROP TABLE IF EXISTS `exp_cotizacion`;
CREATE TABLE `exp_cotizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serie` char(255) DEFAULT NULL,
  `folio` char(255) DEFAULT NULL,
  `notas` char(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exp_cotizacion
-- ----------------------------
INSERT INTO `exp_cotizacion` VALUES ('2', 'A', '1', 'Una Cotozacion', '0000-00-00 00:00:00');
INSERT INTO `exp_cotizacion` VALUES ('3', '', '', '', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `exp_um`
-- ----------------------------
DROP TABLE IF EXISTS `exp_um`;
CREATE TABLE `exp_um` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `abreviacion` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exp_um
-- ----------------------------
INSERT INTO `exp_um` VALUES ('1', 'Kilo', 'kg');
INSERT INTO `exp_um` VALUES ('2', 'Pieza', 'pza');
INSERT INTO `exp_um` VALUES ('3', 'No Aplica', 'NA');

-- ----------------------------
-- Table structure for `facturacion_certificados`
-- ----------------------------
DROP TABLE IF EXISTS `facturacion_certificados`;
CREATE TABLE `facturacion_certificados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_razon_social` int(11) DEFAULT NULL,
  `no_serie` char(255) DEFAULT NULL,
  `cer_pem` text,
  `key_pem` text,
  `pass` char(255) DEFAULT NULL,
  `valido_desde` datetime DEFAULT NULL,
  `valido_hasta` datetime DEFAULT NULL,
  `es_default` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_serie` (`no_serie`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of facturacion_certificados
-- ----------------------------
INSERT INTO `facturacion_certificados` VALUES ('1', '1', '20001000000100005867', '-----BEGIN CERTIFICATE-----\r\nMIIEdDCCA1ygAwIBAgIUMjAwMDEwMDAwMDAxMDAwMDU4NjcwDQYJKoZIhvcNAQEF\r\nBQAwggFvMRgwFgYDVQQDDA9BLkMuIGRlIHBydWViYXMxLzAtBgNVBAoMJlNlcnZp\r\nY2lvIGRlIEFkbWluaXN0cmFjacOzbiBUcmlidXRhcmlhMTgwNgYDVQQLDC9BZG1p\r\nbmlzdHJhY2nDs24gZGUgU2VndXJpZGFkIGRlIGxhIEluZm9ybWFjacOzbjEpMCcG\r\nCSqGSIb3DQEJARYaYXNpc25ldEBwcnVlYmFzLnNhdC5nb2IubXgxJjAkBgNVBAkM\r\nHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDEL\r\nMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxEjAQBgNVBAcM\r\nCUNveW9hY8OhbjEVMBMGA1UELRMMU0FUOTcwNzAxTk4zMTIwMAYJKoZIhvcNAQkC\r\nDCNSZXNwb25zYWJsZTogSMOpY3RvciBPcm5lbGFzIEFyY2lnYTAeFw0xMjA3Mjcx\r\nNzAyMDBaFw0xNjA3MjcxNzAyMDBaMIHbMSkwJwYDVQQDEyBBQ0NFTSBTRVJWSUNJ\r\nT1MgRU1QUkVTQVJJQUxFUyBTQzEpMCcGA1UEKRMgQUNDRU0gU0VSVklDSU9TIEVN\r\nUFJFU0FSSUFMRVMgU0MxKTAnBgNVBAoTIEFDQ0VNIFNFUlZJQ0lPUyBFTVBSRVNB\r\nUklBTEVTIFNDMSUwIwYDVQQtExxBQUEwMTAxMDFBQUEgLyBIRUdUNzYxMDAzNFMy\r\nMR4wHAYDVQQFExUgLyBIRUdUNzYxMDAzTURGUk5OMDkxETAPBgNVBAsTCFVuaWRh\r\nZCAxMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC2TTQSPONBOVxpXv9wLYo8\r\njezBrb34i/tLx8jGdtyy27BcesOav2c1NS/Gdv10u9SkWtwdy34uRAVe7H0a3VMR\r\nLHAkvp2qMCHaZc4T8k47Jtb9wrOEh/XFS8LgT4y5OQYo6civfXXdlvxWU/gdM/e6\r\nI2lg6FGorP8H4GPAJ/qCNwIDAQABox0wGzAMBgNVHRMBAf8EAjAAMAsGA1UdDwQE\r\nAwIGwDANBgkqhkiG9w0BAQUFAAOCAQEATxMecTpMbdhSHo6KVUg4QVF4Op2IBhiM\r\naOrtrXBdJgzGotUFcJgdBCMjtTZXSlq1S4DG1jr8p4NzQlzxsdTxaB8nSKJ4KEMg\r\nIT7E62xRUj15jI49qFz7f2uMttZLNThipunsN/NF1XtvESMTDwQFvas/Ugig6qwE\r\nfSZc0MDxMpKLEkEePmQwtZD+zXFSMVa6hmOu4M+FzGiRXbj4YJXn9Myjd8xbL/c+\r\n9UIcrYoZskxDvMxc6/6M3rNNDY3OFhBK+V/sPMzWWGt8S1yjmtPfXgFs1t65AZ2h\r\ncTwTAuHrKwDatJ1ZPfa482ZBROAAX1waz7WwXp0gso7sDCm2/yUVww==\r\n-----END CERTIFICATE-----\r\n', '-----BEGIN PRIVATE KEY-----\r\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALZNNBI840E5XGle\r\n/3AtijyN7MGtvfiL+0vHyMZ23LLbsFx6w5q/ZzU1L8Z2/XS71KRa3B3Lfi5EBV7s\r\nfRrdUxEscCS+naowIdplzhPyTjsm1v3Cs4SH9cVLwuBPjLk5BijpyK99dd2W/FZT\r\n+B0z97ojaWDoUais/wfgY8An+oI3AgMBAAECgYAyEeJLYA3KzEZlaoId/WQKXbC5\r\nQU78BPZwSd8LI3paZZx6yf0Pc6KVKpaEnAnhFfXBbnMme82cR3JyL+Hsjv1RMxz2\r\naOQFmj1lSJAth3w4aAYx2gZzo0Hqg9Qjn/Bew/ChaDAwvDGqpbVfOeZkVuF36hqd\r\ngvXh4nD3POLnoXctgQJBAOrygWhspAauyzBsy8ZhHBS84iwlJbZ64RE+95d3sMGC\r\nIuW00+FOUxtD4bz0xbCaV3zkbGAntpjcGx5r1fN2ucMCQQDGowycldpEtqZyvgm2\r\nXnIRcHA8U3d71xVMguSQqIHrk+BYBdmdB9A86jhMS4CDDfxQPWT6k3ZlydAdwbFB\r\nDBp9AkBVqLDRt7pdzWC7eQ8adtFcJjl3yttjGo3wUbrHeJXzF1VN1o3heUMHj8o/\r\nsCZbawo2uLlinVgPh0BD6SEKMOEtAkAEVlUVKjR84Zwaz0l5APDurozU1GG8g4LE\r\ni+sfuX40vaLdaStKQXxriBW4nMFumySSP/Tvf77LFDAGJk+PgwslAkEArlH6rpml\r\ndpCH70qPwOeqd8a+5qikPTfg5e9z+uEjtT1aA0VksKtKo7lfeCSqV9Xk+5QZ4nZR\r\nw6djgyVGmEtdaw==\r\n-----END PRIVATE KEY-----\r\n', '12345678a', '2012-07-27 11:02:00', '2016-07-27 11:02:00', '1');

-- ----------------------------
-- Table structure for `facturacion_config`
-- ----------------------------
DROP TABLE IF EXISTS `facturacion_config`;
CREATE TABLE `facturacion_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timbres_disponibles` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of facturacion_config
-- ----------------------------
INSERT INTO `facturacion_config` VALUES ('1', '0');

-- ----------------------------
-- Table structure for `facturacion_formas_de_pago`
-- ----------------------------
DROP TABLE IF EXISTS `facturacion_formas_de_pago`;
CREATE TABLE `facturacion_formas_de_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of facturacion_formas_de_pago
-- ----------------------------
INSERT INTO `facturacion_formas_de_pago` VALUES ('1', 'Pago en una sola exhibición');
INSERT INTO `facturacion_formas_de_pago` VALUES ('2', 'Parcialidades');

-- ----------------------------
-- Table structure for `facturacion_metodos_de_pago`
-- ----------------------------
DROP TABLE IF EXISTS `facturacion_metodos_de_pago`;
CREATE TABLE `facturacion_metodos_de_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `es_pago_con_tarjeta` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of facturacion_metodos_de_pago
-- ----------------------------
INSERT INTO `facturacion_metodos_de_pago` VALUES ('2', 'efectivo', '0');
INSERT INTO `facturacion_metodos_de_pago` VALUES ('3', 'tarjeta de crédito o debito', '1');
INSERT INTO `facturacion_metodos_de_pago` VALUES ('4', 'depósito en cuenta', '0');

-- ----------------------------
-- Table structure for `facturacion_moneda`
-- ----------------------------
DROP TABLE IF EXISTS `facturacion_moneda`;
CREATE TABLE `facturacion_moneda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` char(5) DEFAULT NULL,
  `moneda` char(255) DEFAULT NULL,
  `descripcion` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of facturacion_moneda
-- ----------------------------
INSERT INTO `facturacion_moneda` VALUES ('1', 'MXN', 'pesos', 'Peso mexicano');
INSERT INTO `facturacion_moneda` VALUES ('2', 'USD', 'dolares', 'Dólar estadounidense');
INSERT INTO `facturacion_moneda` VALUES ('3', 'USN', 'dolares', 'Dólar estadounidense (Siguiente día) (código de fondos)');
INSERT INTO `facturacion_moneda` VALUES ('4', 'USS', 'Dolares', 'Dólar estadounidense (Mismo día) (código de fondos)');

-- ----------------------------
-- Table structure for `facturacion_razones_sociales`
-- ----------------------------
DROP TABLE IF EXISTS `facturacion_razones_sociales`;
CREATE TABLE `facturacion_razones_sociales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rfc` char(255) DEFAULT NULL,
  `razon_social` char(255) DEFAULT NULL,
  `nombre_comercial` char(255) DEFAULT NULL,
  `RegistroPatronal` char(100) NOT NULL,
  `datos_de_contacto` text,
  `logo_factura` char(255) DEFAULT NULL,
  `fk_pais` int(11) DEFAULT NULL,
  `fk_estado` int(11) DEFAULT NULL,
  `fk_ciudad` int(11) DEFAULT NULL,
  `fk_municipio` int(11) DEFAULT NULL,
  `calle` char(255) DEFAULT NULL,
  `noExterior` char(255) DEFAULT NULL,
  `noInterior` char(255) DEFAULT NULL,
  `colonia` char(255) DEFAULT NULL,
  `localidad` char(255) DEFAULT NULL,
  `referencia` char(255) DEFAULT NULL,
  `codigoPostal` char(20) DEFAULT NULL,
  `email_bcc` char(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of facturacion_razones_sociales
-- ----------------------------
INSERT INTO `facturacion_razones_sociales` VALUES ('1', 'AAA010101AAA', 'Razon Social Prueba', 'Nombre Comercial Prueba', '452345', '', 'triples.jpg', '1', '25', '0', '2844', 'conocida', '000', 'Ext 000', 'Fracc. Conocido', 'mazatlan', '', '82180', 'email@email.com');

-- ----------------------------
-- Table structure for `facturacion_regimenes`
-- ----------------------------
DROP TABLE IF EXISTS `facturacion_regimenes`;
CREATE TABLE `facturacion_regimenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regimen` char(255) DEFAULT NULL,
  `fk_razon_social` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of facturacion_regimenes
-- ----------------------------
INSERT INTO `facturacion_regimenes` VALUES ('1', 'Regimen Prueba', '1');
INSERT INTO `facturacion_regimenes` VALUES ('2', 'Otro Regimen', '1');

-- ----------------------------
-- Table structure for `facturacion_um`
-- ----------------------------
DROP TABLE IF EXISTS `facturacion_um`;
CREATE TABLE `facturacion_um` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `abreviacion` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of facturacion_um
-- ----------------------------
INSERT INTO `facturacion_um` VALUES ('1', 'Kilogramo', 'KG');
INSERT INTO `facturacion_um` VALUES ('2', 'pieza', 'pza');
INSERT INTO `facturacion_um` VALUES ('3', 'Servicio', 'Servicio');

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
  `saldo_contadores` decimal(18,6) NOT NULL,
  `dato_de_la_placa` char(255) NOT NULL,
  `monto` decimal(18,6) NOT NULL,
  `fecha` datetime NOT NULL,
  `fk_serie` int(11) NOT NULL,
  `folio` int(11) NOT NULL,
  `diferencia` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of makinas_corte
-- ----------------------------
INSERT INTO `makinas_corte` VALUES ('27', '1', '1', '1', '1', '23.000000', '32.000000', '32.000000', '', '43.000000', '2013-12-18 17:57:00', '1', '5', '23');
INSERT INTO `makinas_corte` VALUES ('28', '1', '1', '1', '1', '0.000000', '0.000000', '0.000000', '', '0.000000', '2013-12-19 09:26:00', '1', '6', '0');
INSERT INTO `makinas_corte` VALUES ('29', '1', '1', '1', '1', '0.000000', '0.000000', '0.000000', '', '0.000000', '2013-12-19 09:26:00', '1', '7', '0');
INSERT INTO `makinas_corte` VALUES ('30', '1', '1', '1', '1', '0.000000', '0.000000', '0.000000', '', '0.000000', '2013-12-19 15:11:00', '1', '8', '0');
INSERT INTO `makinas_corte` VALUES ('31', '1', '1', '1', '1', '35466435.000000', '3456.000000', '3455.000000', '', '4567.000000', '2013-12-19 15:11:00', '1', '9', '3456');

-- ----------------------------
-- Table structure for `makinas_maquina`
-- ----------------------------
DROP TABLE IF EXISTS `makinas_maquina`;
CREATE TABLE `makinas_maquina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  `ganancias` decimal(18,2) NOT NULL,
  `gastos` decimal(18,2) NOT NULL,
  `saldo` decimal(18,2) NOT NULL,
  `descripcion` char(255) NOT NULL,
  `fk_owner` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of makinas_maquina
-- ----------------------------
INSERT INTO `makinas_maquina` VALUES ('1', 'Garage', '0.00', '0.00', '0.00', 'Esta es la descripcion de la maquina', '1');

-- ----------------------------
-- Table structure for `makinas_serie`
-- ----------------------------
DROP TABLE IF EXISTS `makinas_serie`;
CREATE TABLE `makinas_serie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serie` char(50) NOT NULL,
  `fk_owner` int(11) NOT NULL,
  `folio_sig` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of makinas_serie
-- ----------------------------
INSERT INTO `makinas_serie` VALUES ('1', 'A', '1', '10');
INSERT INTO `makinas_serie` VALUES ('2', 'B', '1', '1');

-- ----------------------------
-- Table structure for `makina_cliente`
-- ----------------------------
DROP TABLE IF EXISTS `makina_cliente`;
CREATE TABLE `makina_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  `email` char(255) NOT NULL,
  `datos_de_contacto` char(255) NOT NULL,
  `calle` char(100) NOT NULL,
  `numero_interior` char(20) NOT NULL,
  `numero_exterior` char(20) NOT NULL,
  `colonia` char(100) NOT NULL,
  `localidad` char(100) NOT NULL,
  `referencia` char(100) NOT NULL,
  `fk_pais` int(11) NOT NULL,
  `fk_estado` int(11) NOT NULL,
  `fk_municipio` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of makina_cliente
-- ----------------------------
INSERT INTO `makina_cliente` VALUES ('1', 'Cliente Test', '', '', '', '', '', '', '', '', '1', '1', '2489');

-- ----------------------------
-- Table structure for `makina_owner`
-- ----------------------------
DROP TABLE IF EXISTS `makina_owner`;
CREATE TABLE `makina_owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  `email` char(255) NOT NULL,
  `datos_de_contacto` char(255) NOT NULL,
  `calle` char(100) NOT NULL,
  `numero_interior` char(20) NOT NULL,
  `numero_exterior` char(20) NOT NULL,
  `colonia` char(100) NOT NULL,
  `localidad` char(100) NOT NULL,
  `referencia` char(100) NOT NULL,
  `fk_pais` int(11) NOT NULL,
  `fk_estado` int(11) NOT NULL,
  `fk_municipio` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of makina_owner
-- ----------------------------
INSERT INTO `makina_owner` VALUES ('1', 'Don Julio', '', '', '', '', '', '', '', '', '1', '0', '0');

-- ----------------------------
-- Table structure for `makina_punto_de_venta`
-- ----------------------------
DROP TABLE IF EXISTS `makina_punto_de_venta`;
CREATE TABLE `makina_punto_de_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  `datos_de_contacto` char(255) NOT NULL,
  `calle` char(100) NOT NULL,
  `numero_interior` char(20) NOT NULL,
  `numero_exterior` char(20) NOT NULL,
  `colonia` char(100) NOT NULL,
  `localidad` char(100) NOT NULL,
  `referencia` char(100) NOT NULL,
  `fk_pais` int(11) NOT NULL,
  `fk_estado` int(11) NOT NULL,
  `fk_municipio` int(11) NOT NULL,
  `fk_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of makina_punto_de_venta
-- ----------------------------
INSERT INTO `makina_punto_de_venta` VALUES ('1', 'Un Punto', 'una', '125', '00', '', 'libertad', '', '', '1', '25', '2844', '1');
INSERT INTO `makina_punto_de_venta` VALUES ('2', '', '', '', '', '', '', '', '', '1', '3', '0', '2');

-- ----------------------------
-- Table structure for `makina_tecnico`
-- ----------------------------
DROP TABLE IF EXISTS `makina_tecnico`;
CREATE TABLE `makina_tecnico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  `email` char(255) NOT NULL,
  `datos_de_contacto` char(255) NOT NULL,
  `calle` char(100) NOT NULL,
  `numero_interior` char(20) NOT NULL,
  `numero_exterior` char(20) NOT NULL,
  `colonia` char(100) NOT NULL,
  `localidad` char(100) NOT NULL,
  `referencia` char(100) NOT NULL,
  `fk_pais` int(11) NOT NULL,
  `fk_estado` int(11) NOT NULL,
  `fk_municipio` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of makina_tecnico
-- ----------------------------
INSERT INTO `makina_tecnico` VALUES ('1', 'Tecnico Test', '', '', '', '', '', '', '', '', '1', '1', '2489');

-- ----------------------------
-- Table structure for `mptt`
-- ----------------------------
DROP TABLE IF EXISTS `mptt`;
CREATE TABLE `mptt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mptt
-- ----------------------------
INSERT INTO `mptt` VALUES ('17', 'Menu Nomina', '1', '18', '0');
INSERT INTO `mptt` VALUES ('18', 'Nomina', '2', '3', '17');
INSERT INTO `mptt` VALUES ('19', 'Catalogos', '4', '13', '17');
INSERT INTO `mptt` VALUES ('20', 'Catalogos SAT', '14', '15', '17');
INSERT INTO `mptt` VALUES ('21', 'Ayuda', '16', '17', '17');
INSERT INTO `mptt` VALUES ('22', 'Ubicaciones', '5', '12', '19');
INSERT INTO `mptt` VALUES ('23', 'Paises', '6', '7', '22');
INSERT INTO `mptt` VALUES ('24', 'Estados', '8', '9', '22');
INSERT INTO `mptt` VALUES ('25', 'Municipios', '10', '11', '22');

-- ----------------------------
-- Table structure for `nomina_bancos`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_bancos`;
CREATE TABLE `nomina_bancos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` char(5) NOT NULL,
  `nombre_corto` char(50) NOT NULL,
  `nombre_o_razon_social` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_bancos
-- ----------------------------
INSERT INTO `nomina_bancos` VALUES ('1', '002', 'BANAMEX', 'Banco Nacional de México, S.A., Institución de banca Múltiple, Grupo Financiero Banamex');

-- ----------------------------
-- Table structure for `nomina_conceptos`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_conceptos`;
CREATE TABLE `nomina_conceptos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `descripcion` char(255) DEFAULT NULL,
  `precio` char(255) DEFAULT NULL,
  `fk_unidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of nomina_conceptos
-- ----------------------------
INSERT INTO `nomina_conceptos` VALUES ('1', 'Pago de Nomina', '', '0', '3');
INSERT INTO `nomina_conceptos` VALUES ('2', 'Aguinaldo', '', '', '3');
INSERT INTO `nomina_conceptos` VALUES ('3', 'Prima Vacacional', '', '', '1');
INSERT INTO `nomina_conceptos` VALUES ('4', 'Fondo De Ahorro', '', '', '3');
INSERT INTO `nomina_conceptos` VALUES ('5', 'Liquidacion', '', '', '3');
INSERT INTO `nomina_conceptos` VALUES ('6', 'Finiquito', '', '', '3');

-- ----------------------------
-- Table structure for `nomina_deducciones`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_deducciones`;
CREATE TABLE `nomina_deducciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_TipoDeduccion` int(11) NOT NULL,
  `TipoDeduccion` char(100) NOT NULL,
  `Clave` int(15) NOT NULL,
  `Concepto` char(100) NOT NULL,
  `ImporteGravado` decimal(18,6) NOT NULL,
  `ImporteExcento` decimal(18,6) NOT NULL,
  `fk_nomina` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_deducciones
-- ----------------------------
INSERT INTO `nomina_deducciones` VALUES ('1', '1', '', '0', '', '0.000000', '0.000000', '0');
INSERT INTO `nomina_deducciones` VALUES ('2', '1', '', '4', '214sf', '123.000000', '123.000000', '1');
INSERT INTO `nomina_deducciones` VALUES ('3', '1', '001', '123', 'Concepto', '0.000000', '0.000000', '2');
INSERT INTO `nomina_deducciones` VALUES ('4', '0', '', '0', '', '0.000000', '0.000000', '3');
INSERT INTO `nomina_deducciones` VALUES ('5', '0', '', '0', '', '0.000000', '0.000000', '4');
INSERT INTO `nomina_deducciones` VALUES ('6', '0', '', '0', '', '0.000000', '0.000000', '5');
INSERT INTO `nomina_deducciones` VALUES ('7', '1', '', '0', '', '0.000000', '0.000000', '6');

-- ----------------------------
-- Table structure for `nomina_departamento`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_departamento`;
CREATE TABLE `nomina_departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(100) NOT NULL,
  `codigo` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_departamento
-- ----------------------------
INSERT INTO `nomina_departamento` VALUES ('1', 'Sistemas', '');
INSERT INTO `nomina_departamento` VALUES ('2', 'Soporte Técnico', '');
INSERT INTO `nomina_departamento` VALUES ('3', 'Diseño', '');

-- ----------------------------
-- Table structure for `nomina_horas_extra`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_horas_extra`;
CREATE TABLE `nomina_horas_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Dias` int(11) NOT NULL,
  `TipoHoras` char(50) NOT NULL,
  `fk_TipoHoras` int(11) NOT NULL,
  `HorasExtra` int(11) NOT NULL,
  `ImportePagado` decimal(18,6) NOT NULL,
  `fk_nomina` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_horas_extra
-- ----------------------------
INSERT INTO `nomina_horas_extra` VALUES ('1', '2', '', '1', '3', '100.000000', '1');
INSERT INTO `nomina_horas_extra` VALUES ('3', '0', '', '0', '0', '0.000000', '3');
INSERT INTO `nomina_horas_extra` VALUES ('5', '0', '', '0', '0', '0.000000', '5');
INSERT INTO `nomina_horas_extra` VALUES ('6', '0', '', '0', '0', '0.000000', '6');
INSERT INTO `nomina_horas_extra` VALUES ('8', '12', 'Triples', '2', '123', '123.000000', '2');

-- ----------------------------
-- Table structure for `nomina_impuesto`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_impuesto`;
CREATE TABLE `nomina_impuesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `tasa` float(18,4) DEFAULT NULL,
  `fk_naturaleza` int(11) DEFAULT NULL,
  `detalles` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_impuesto
-- ----------------------------
INSERT INTO `nomina_impuesto` VALUES ('1', 'IVA', '16.0000', '1', '');
INSERT INTO `nomina_impuesto` VALUES ('2', 'ISR', '10.6667', '2', '');

-- ----------------------------
-- Table structure for `nomina_incapacidades`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_incapacidades`;
CREATE TABLE `nomina_incapacidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DiasIncapacidad` int(11) NOT NULL,
  `fk_TipoIncapacidad` int(11) NOT NULL,
  `TipoIncapacidad` char(15) NOT NULL,
  `Descuento` decimal(18,6) NOT NULL,
  `fk_nomina` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_incapacidades
-- ----------------------------
INSERT INTO `nomina_incapacidades` VALUES ('1', '0', '1', '', '0.000000', '0');
INSERT INTO `nomina_incapacidades` VALUES ('2', '4', '2', '', '0.000000', '1');
INSERT INTO `nomina_incapacidades` VALUES ('3', '1', '2', '2', '0.000000', '2');
INSERT INTO `nomina_incapacidades` VALUES ('4', '0', '0', '', '0.000000', '3');
INSERT INTO `nomina_incapacidades` VALUES ('5', '0', '0', '', '0.000000', '4');
INSERT INTO `nomina_incapacidades` VALUES ('6', '0', '0', '', '0.000000', '5');
INSERT INTO `nomina_incapacidades` VALUES ('7', '0', '2', '', '0.000000', '6');
INSERT INTO `nomina_incapacidades` VALUES ('8', '4', '3', '3', '0.000000', '2');

-- ----------------------------
-- Table structure for `nomina_jornada`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_jornada`;
CREATE TABLE `nomina_jornada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_jornada
-- ----------------------------
INSERT INTO `nomina_jornada` VALUES ('1', 'Diurna');
INSERT INTO `nomina_jornada` VALUES ('2', 'Nocturna');
INSERT INTO `nomina_jornada` VALUES ('3', 'Mixta');

-- ----------------------------
-- Table structure for `nomina_menu`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_menu`;
CREATE TABLE `nomina_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto` char(255) DEFAULT NULL,
  `target` char(255) DEFAULT NULL,
  `left` int(11) DEFAULT NULL,
  `right` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `nomina_naturaleza_impuesto`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_naturaleza_impuesto`;
CREATE TABLE `nomina_naturaleza_impuesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nomina_naturaleza_impuesto
-- ----------------------------
INSERT INTO `nomina_naturaleza_impuesto` VALUES ('1', 'Traslado');
INSERT INTO `nomina_naturaleza_impuesto` VALUES ('2', 'Retencion');

-- ----------------------------
-- Table structure for `nomina_nomina`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_nomina`;
CREATE TABLE `nomina_nomina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_patron` int(11) NOT NULL,
  `fk_empleado` int(11) NOT NULL,
  `fk_serie` int(11) NOT NULL,
  `serie` char(20) NOT NULL,
  `folio` char(10) NOT NULL,
  `Version` char(5) NOT NULL,
  `RegistroPatronal` char(20) NOT NULL,
  `NumEmpleado` char(15) NOT NULL,
  `CURP` char(50) NOT NULL,
  `fk_TipoRegimen` int(11) NOT NULL,
  `TipoRegimen` char(10) NOT NULL,
  `NumSeguridadSocial` char(15) NOT NULL,
  `FechaPago` datetime NOT NULL,
  `FechaInicialPago` datetime NOT NULL,
  `FechaFinalPago` datetime NOT NULL,
  `NumDiasPagados` int(11) NOT NULL,
  `fk_Departamento` int(11) NOT NULL,
  `Departamento` char(100) NOT NULL,
  `CLABE` char(50) NOT NULL,
  `Banco` char(10) NOT NULL,
  `FechaInicioRelLaboral` datetime NOT NULL,
  `Antiguedad` int(11) NOT NULL,
  `Puesto` char(255) NOT NULL,
  `TipoContrato` char(100) NOT NULL,
  `TipoJornada` char(100) NOT NULL,
  `PeriodicidadPago` char(100) NOT NULL,
  `SalarioBaseCotApor` decimal(18,6) NOT NULL,
  `RiesgoPuesto` char(100) NOT NULL,
  `SalarioDiarioIntegrado` decimal(18,6) NOT NULL,
  `fk_banco` int(11) NOT NULL,
  `fk_RiesgoPuesto` int(11) NOT NULL,
  `percepcionesTotalGravado` decimal(18,6) NOT NULL,
  `percepcionesTotalExcento` decimal(18,6) NOT NULL,
  `deduccionesTotalGravado` decimal(18,6) NOT NULL,
  `deduccionesTotalExcento` decimal(18,6) NOT NULL,
  `fecha_expedicion` datetime NOT NULL,
  `fk_forma_pago` int(11) NOT NULL,
  `fk_certificado` int(11) NOT NULL,
  `condiciones_de_pago` char(50) NOT NULL,
  `subTotal` decimal(18,6) NOT NULL,
  `descuento` decimal(18,6) NOT NULL,
  `motivo_descuento` char(100) NOT NULL,
  `tipo_cambio` decimal(18,6) NOT NULL,
  `fk_moneda` int(11) NOT NULL,
  `total` decimal(18,6) NOT NULL,
  `tipo_comprobante` char(20) NOT NULL,
  `fk_metodo_pago` int(11) NOT NULL,
  `num_cta_pago` char(10) NOT NULL,
  `totImpRet` decimal(18,6) NOT NULL,
  `totImpTras` decimal(18,6) NOT NULL,
  `fecha_emision` datetime NOT NULL,
  `archivosGenerados` int(1) NOT NULL,
  `modo_prueba` int(11) NOT NULL,
  `folio_fiscal` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_nomina
-- ----------------------------
INSERT INTO `nomina_nomina` VALUES ('1', '1', '1', '1', '', '1', '1.1', '', '', '0', '4', '', '', '2013-12-27 15:16:17', '2013-12-27 15:16:17', '2013-12-27 15:16:17', '0', '1', '', '', '', '2013-12-27 15:16:17', '0', '', '1', '1', '1', '0.000000', '', '0.000000', '1', '1', '0.000000', '0.000000', '0.000000', '0.000000', '0000-00-00 00:00:00', '0', '0', '', '0.000000', '0.000000', '', '0.000000', '0', '0.000000', '', '0', '', '0.000000', '0.000000', '2013-12-27 15:16:17', '0', '0', '');
INSERT INTO `nomina_nomina` VALUES ('2', '1', '1', '1', 'A', '1', '1.1', 'xxx2038', '050', 'BIAC810830HSLBLS02', '1', '', '001', '2013-12-26 15:19:50', '2013-12-15 15:19:50', '2013-12-26 15:19:50', '10', '1', '', '000000000000000000', '', '2013-12-26 15:19:50', '1', 'programador', '3', '1', '1', '0.000000', '', '0.000000', '1', '1', '1.000000', '2.000000', '3.000000', '4.000000', '0000-00-00 00:00:00', '1', '1', '', '758.000000', '0.000000', '', '0.000000', '1', '0.000000', '', '2', '55561', '0.000000', '0.000000', '2014-01-24 15:19:50', '1', '1', 'DDCBEA25-7E57-47E3-A9BD-A439BB32DD76');
INSERT INTO `nomina_nomina` VALUES ('3', '1', '1', '1', '', '1', '', '', '', '0', '1', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '1', '', '', '', '0000-00-00 00:00:00', '0', '', '1', '1', '1', '0.000000', '', '0.000000', '1', '1', '0.000000', '0.000000', '0.000000', '0.000000', '0000-00-00 00:00:00', '0', '0', '', '0.000000', '0.000000', '', '0.000000', '0', '0.000000', '', '0', '', '0.000000', '0.000000', '0000-00-00 00:00:00', '0', '0', '');
INSERT INTO `nomina_nomina` VALUES ('4', '1', '1', '1', '', '1', '', '', '', '0', '1', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '1', '', '', '', '0000-00-00 00:00:00', '0', '', '1', '1', '1', '0.000000', '', '0.000000', '1', '1', '0.000000', '0.000000', '0.000000', '0.000000', '0000-00-00 00:00:00', '0', '0', '', '0.000000', '0.000000', '', '0.000000', '0', '0.000000', '', '0', '', '0.000000', '0.000000', '0000-00-00 00:00:00', '0', '0', '');
INSERT INTO `nomina_nomina` VALUES ('5', '1', '1', '1', '', '1', '', '', '', '0', '1', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '1', '', '', '', '0000-00-00 00:00:00', '0', '', '1', '1', '1', '0.000000', '', '0.000000', '1', '1', '0.000000', '0.000000', '0.000000', '0.000000', '0000-00-00 00:00:00', '0', '0', '', '0.000000', '0.000000', '', '0.000000', '0', '0.000000', '', '0', '', '0.000000', '0.000000', '0000-00-00 00:00:00', '0', '0', '');
INSERT INTO `nomina_nomina` VALUES ('6', '1', '1', '1', '', '', '', '', '', '0', '1', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '1', '', '', '', '0000-00-00 00:00:00', '0', '', '1', '1', '1', '0.000000', '', '0.000000', '1', '1', '0.000000', '0.000000', '0.000000', '0.000000', '0000-00-00 00:00:00', '1', '1', '', '0.000000', '0.000000', '', '0.000000', '1', '0.000000', '', '2', '', '0.000000', '0.000000', '0000-00-00 00:00:00', '0', '0', '');
INSERT INTO `nomina_nomina` VALUES ('7', '1', '1', '1', '', '1', '', 'asfasdf', '1234', 'BIAC810830HSLBLS02', '1', '', '23028127597', '2013-12-27 12:28:49', '2013-12-27 12:28:49', '2013-12-27 12:28:49', '0', '1', '', '', '', '2013-12-27 12:28:49', '0', '', '1', '1', '1', '0.000000', '', '0.000000', '1', '1', '0.000000', '0.000000', '0.000000', '0.000000', '0000-00-00 00:00:00', '1', '1', '', '0.000000', '0.000000', '', '0.000000', '1', '0.000000', '', '2', '', '0.000000', '0.000000', '2014-12-27 12:28:49', '1', '1', '33C9257A-7E57-42E6-802D-85BB7E4B1D11');
INSERT INTO `nomina_nomina` VALUES ('8', '1', '2', '1', '', '', '1.1', '', '007', 'OUGD890424HSLSRG03', '1', '', '23098925151', '2013-12-27 17:15:03', '2013-12-27 17:15:03', '2013-12-27 17:15:03', '0', '1', '', '111111111122222522', '', '2013-12-27 17:15:03', '0', 'Diseñador', '1', '1', '1', '400.000000', '', '400.000000', '1', '1', '0.000000', '0.000000', '0.000000', '0.000000', '0000-00-00 00:00:00', '1', '1', '', '0.000000', '0.000000', '', '0.000000', '1', '0.000000', '', '2', '', '0.000000', '0.000000', '2014-12-27 17:15:03', '1', '1', '95990E54-7E57-4D9C-B74E-D2E506097728');

-- ----------------------------
-- Table structure for `nomina_nomina_conceptos`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_nomina_conceptos`;
CREATE TABLE `nomina_nomina_conceptos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(18,6) DEFAULT NULL,
  `unidad` char(255) DEFAULT NULL,
  `fk_um` int(11) DEFAULT NULL,
  `fk_concepto` int(11) DEFAULT NULL,
  `descripcion` char(255) DEFAULT NULL,
  `valorUnitario` decimal(18,6) DEFAULT NULL,
  `importe` decimal(18,6) DEFAULT NULL,
  `noIdentificacion` char(255) DEFAULT NULL,
  `fk_nomina` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_nomina_conceptos
-- ----------------------------
INSERT INTO `nomina_nomina_conceptos` VALUES ('1', '1.000000', '', '0', '1', '', '580.000000', '580.000000', '', '6');
INSERT INTO `nomina_nomina_conceptos` VALUES ('2', '1.000000', '', '0', '3', '', '0.000000', '0.000000', '', '2');
INSERT INTO `nomina_nomina_conceptos` VALUES ('3', '0.000000', '', '0', '3', '', '0.000000', '0.000000', '', '7');
INSERT INTO `nomina_nomina_conceptos` VALUES ('4', '0.000000', '', '0', '3', '', '0.000000', '0.000000', '', '8');

-- ----------------------------
-- Table structure for `nomina_nomina_impuesto`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_nomina_impuesto`;
CREATE TABLE `nomina_nomina_impuesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_impuesto` int(11) DEFAULT NULL,
  `fk_nomina` int(11) DEFAULT NULL,
  `importe` decimal(18,6) DEFAULT '0.000000',
  `tasai` decimal(18,6) DEFAULT NULL,
  `nombre` char(255) DEFAULT NULL,
  `fk_tipo_impuesto` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_impuesto` (`fk_impuesto`),
  KEY `fk_nomina` (`fk_nomina`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nomina_nomina_impuesto
-- ----------------------------
INSERT INTO `nomina_nomina_impuesto` VALUES ('1', '1', '2', '12.000000', '16.000000', '', '1');
INSERT INTO `nomina_nomina_impuesto` VALUES ('3', '0', '8', '0.000000', '0.000000', '', '');

-- ----------------------------
-- Table structure for `nomina_percepciones`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_percepciones`;
CREATE TABLE `nomina_percepciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_TipoPercepcion` int(11) NOT NULL,
  `Clave` char(15) NOT NULL,
  `Concepto` char(100) NOT NULL,
  `ImporteGravado` decimal(18,6) NOT NULL,
  `ImporteExcento` decimal(18,6) NOT NULL,
  `TipoPercepcion` char(50) NOT NULL,
  `fk_nomina` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_percepciones
-- ----------------------------
INSERT INTO `nomina_percepciones` VALUES ('1', '1', '', 'sdfg', '0.000000', '0.000000', '', '0');
INSERT INTO `nomina_percepciones` VALUES ('2', '1', '', '', '0.000000', '0.000000', '', '0');
INSERT INTO `nomina_percepciones` VALUES ('3', '1', 'asdf', 'asdf', '234.000000', '2434.000000', '234', '1');
INSERT INTO `nomina_percepciones` VALUES ('4', '1', '550', 'Quincena', '550.000000', '0.000000', '001', '2');
INSERT INTO `nomina_percepciones` VALUES ('5', '0', '', '', '0.000000', '0.000000', '', '3');
INSERT INTO `nomina_percepciones` VALUES ('6', '0', '', '', '0.000000', '0.000000', '', '4');
INSERT INTO `nomina_percepciones` VALUES ('8', '2', '550', '15', '580.000000', '590.000000', 'Gratificación Anual (Aguinaldo)', '6');
INSERT INTO `nomina_percepciones` VALUES ('9', '1', '560', 'asdf', '1.000000', '1.000000', '001', '2');
INSERT INTO `nomina_percepciones` VALUES ('10', '1', '123', 'asdfasdf', '0.000000', '0.000000', '001', '7');

-- ----------------------------
-- Table structure for `nomina_periodicidad_pago`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_periodicidad_pago`;
CREATE TABLE `nomina_periodicidad_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` char(50) NOT NULL,
  `dias` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_periodicidad_pago
-- ----------------------------
INSERT INTO `nomina_periodicidad_pago` VALUES ('1', 'Diario', '1');
INSERT INTO `nomina_periodicidad_pago` VALUES ('2', 'Semanal', '7');
INSERT INTO `nomina_periodicidad_pago` VALUES ('3', 'Quincenal', '15');

-- ----------------------------
-- Table structure for `nomina_regimen_contratacion`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_regimen_contratacion`;
CREATE TABLE `nomina_regimen_contratacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` char(4) NOT NULL,
  `nombre` char(100) NOT NULL,
  `descripcion` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_regimen_contratacion
-- ----------------------------
INSERT INTO `nomina_regimen_contratacion` VALUES ('1', '1', 'Asimilados a salarios', '');
INSERT INTO `nomina_regimen_contratacion` VALUES ('2', '2', 'Sueldos y salarios', '');
INSERT INTO `nomina_regimen_contratacion` VALUES ('3', '3', 'Jubilados', '');
INSERT INTO `nomina_regimen_contratacion` VALUES ('4', '4', 'Pensiones', '');

-- ----------------------------
-- Table structure for `nomina_riesgo_puesto`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_riesgo_puesto`;
CREATE TABLE `nomina_riesgo_puesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` char(5) NOT NULL,
  `descripcion` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_riesgo_puesto
-- ----------------------------
INSERT INTO `nomina_riesgo_puesto` VALUES ('1', '1', 'Clase I');
INSERT INTO `nomina_riesgo_puesto` VALUES ('2', '2', 'Clase II');
INSERT INTO `nomina_riesgo_puesto` VALUES ('3', '3', 'Clase III');
INSERT INTO `nomina_riesgo_puesto` VALUES ('4', '4', 'Clase IV');
INSERT INTO `nomina_riesgo_puesto` VALUES ('5', '5', 'Clase V');

-- ----------------------------
-- Table structure for `nomina_series`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_series`;
CREATE TABLE `nomina_series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serie` char(5) NOT NULL,
  `sig_folio` int(11) DEFAULT NULL,
  `es_default` bit(1) DEFAULT NULL,
  `documento` varchar(50) NOT NULL,
  `fk_razon_social` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of nomina_series
-- ----------------------------
INSERT INTO `nomina_series` VALUES ('1', 'A', '13', '', '', '1');

-- ----------------------------
-- Table structure for `nomina_tipo_contrato`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_tipo_contrato`;
CREATE TABLE `nomina_tipo_contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  `descripcion` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_tipo_contrato
-- ----------------------------
INSERT INTO `nomina_tipo_contrato` VALUES ('1', 'Base', '');
INSERT INTO `nomina_tipo_contrato` VALUES ('2', 'Eventual', '');
INSERT INTO `nomina_tipo_contrato` VALUES ('3', 'Sindicalizado', '');
INSERT INTO `nomina_tipo_contrato` VALUES ('4', 'a prueba', '');

-- ----------------------------
-- Table structure for `nomina_tipo_deduccion`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_tipo_deduccion`;
CREATE TABLE `nomina_tipo_deduccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` char(5) NOT NULL,
  `descripcion` char(100) NOT NULL,
  `comentario` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_tipo_deduccion
-- ----------------------------
INSERT INTO `nomina_tipo_deduccion` VALUES ('1', '001', 'Seguridad Social', '');
INSERT INTO `nomina_tipo_deduccion` VALUES ('2', '002', 'ISR', '');

-- ----------------------------
-- Table structure for `nomina_tipo_horas`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_tipo_horas`;
CREATE TABLE `nomina_tipo_horas` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `nombre` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_tipo_horas
-- ----------------------------
INSERT INTO `nomina_tipo_horas` VALUES ('1', 'Dobles');
INSERT INTO `nomina_tipo_horas` VALUES ('2', 'Triples');

-- ----------------------------
-- Table structure for `nomina_tipo_incapacidad`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_tipo_incapacidad`;
CREATE TABLE `nomina_tipo_incapacidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` char(5) NOT NULL,
  `descripcion` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_tipo_incapacidad
-- ----------------------------
INSERT INTO `nomina_tipo_incapacidad` VALUES ('1', '1', 'Riesgo de trabajo');
INSERT INTO `nomina_tipo_incapacidad` VALUES ('2', '2', 'Enfermedad en general');
INSERT INTO `nomina_tipo_incapacidad` VALUES ('3', '3', 'Maternidad');

-- ----------------------------
-- Table structure for `nomina_tipo_percepcion`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_tipo_percepcion`;
CREATE TABLE `nomina_tipo_percepcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` char(50) NOT NULL,
  `descripcion` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_tipo_percepcion
-- ----------------------------
INSERT INTO `nomina_tipo_percepcion` VALUES ('1', '001', 'Sueldos, Salarios, Rayas y Jornales');
INSERT INTO `nomina_tipo_percepcion` VALUES ('2', '002', 'Gratificación Anual (Aguinaldo)');

-- ----------------------------
-- Table structure for `nomina_trabajador`
-- ----------------------------
DROP TABLE IF EXISTS `nomina_trabajador`;
CREATE TABLE `nomina_trabajador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(100) NOT NULL,
  `rfc` char(20) NOT NULL,
  `NoEmpleado` char(15) NOT NULL,
  `fk_RiesgoPuesto` int(11) NOT NULL,
  `fk_Puesto` int(11) NOT NULL,
  `FechaInicioRelLaboral` datetime NOT NULL,
  `fk_TipoContrato` int(11) NOT NULL,
  `fk_PeriodicidadPago` int(11) NOT NULL,
  `fk_TipoJornada` int(11) NOT NULL,
  `Salario` decimal(18,6) NOT NULL,
  `email` char(100) NOT NULL,
  `CURP` char(30) NOT NULL,
  `fk_TipoRegimen` int(11) NOT NULL,
  `NumSeguridadSocial` char(50) NOT NULL,
  `calle` char(100) NOT NULL,
  `noExterior` char(20) NOT NULL,
  `noInterior` char(20) NOT NULL,
  `colonia` char(100) NOT NULL,
  `localidad` char(100) NOT NULL,
  `referencia` char(100) NOT NULL,
  `fk_pais` int(11) NOT NULL,
  `fk_estado` int(11) NOT NULL,
  `fk_municipio` int(11) NOT NULL,
  `codigoPostal` char(10) NOT NULL,
  `SalarioDiarioIntegrado` decimal(18,6) NOT NULL,
  `SalarioBaseCotApor` decimal(18,6) NOT NULL,
  `puesto` char(255) NOT NULL,
  `fk_banco` int(11) NOT NULL,
  `CLABE` char(50) NOT NULL,
  `fk_departamento` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nomina_trabajador
-- ----------------------------
INSERT INTO `nomina_trabajador` VALUES ('1', 'Cesar Octavio', 'BIAC810830TH2', '001', '1', '0', '2013-11-01 12:00:00', '1', '3', '1', '0.000000', 'cbibriesca@hotmail.com', 'BIAC810830HSLBLS02', '1', '23028127597', 'calle', '1050', '', 'juarez', 'mazatlan', '', '1', '25', '2844', '82180', '500.000000', '500.000000', 'programador', '1', '0000000000', '1');
INSERT INTO `nomina_trabajador` VALUES ('2', 'Diego Osuna', 'OUGD890424DV9', '007', '3', '0', '2012-01-01 01:12:00', '3', '2', '2', '0.000000', 'diego.osunag@hotmail.com', 'OUGD890424HSLSRG03', '4', '23098925151', '', '', '', '', '', '', '1', '25', '2844', '82180', '400.000000', '400.000000', 'Diseñador', '1', '1111111111', '3');
INSERT INTO `nomina_trabajador` VALUES ('3', 'Carlos Cañedo Robles', 'CARC860922MH5', '002', '0', '0', '0000-00-00 00:00:00', '0', '0', '0', '0.000000', 'ccanedo@solucionestriples.mx', '', '1', '', '', '', '', '', '', '', '1', '1', '2489', '19180', '600.000000', '600.000000', '', '0', '', '0');

-- ----------------------------
-- Table structure for `pendienthon_empresa`
-- ----------------------------
DROP TABLE IF EXISTS `pendienthon_empresa`;
CREATE TABLE `pendienthon_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  `contacto` char(255) NOT NULL,
  `logo` char(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pendienthon_empresa
-- ----------------------------
INSERT INTO `pendienthon_empresa` VALUES ('1', 'Soluciones Triples', '', '');
INSERT INTO `pendienthon_empresa` VALUES ('2', 'Demo', '', '');

-- ----------------------------
-- Table structure for `pendienthon_evento`
-- ----------------------------
DROP TABLE IF EXISTS `pendienthon_evento`;
CREATE TABLE `pendienthon_evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `descripcion` char(255) NOT NULL,
  `fk_autor` int(11) NOT NULL,
  `estado` char(255) NOT NULL,
  `fk_reporte` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pendienthon_evento
-- ----------------------------
INSERT INTO `pendienthon_evento` VALUES ('1', '0000-00-00 00:00:00', 'wqasdf', '0', '', '2');
INSERT INTO `pendienthon_evento` VALUES ('2', '0000-00-00 00:00:00', 'sadf', '0', '', '2');
INSERT INTO `pendienthon_evento` VALUES ('3', '0000-00-00 00:00:00', '', '2', '', '2');
INSERT INTO `pendienthon_evento` VALUES ('4', '0000-00-00 00:00:00', '', '3', '', '2');

-- ----------------------------
-- Table structure for `pendienthon_reporte`
-- ----------------------------
DROP TABLE IF EXISTS `pendienthon_reporte`;
CREATE TABLE `pendienthon_reporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `num_reporte` char(255) NOT NULL,
  `fk_autor` int(11) NOT NULL,
  `fk_solicitante` int(11) NOT NULL,
  `fk_empresa` int(11) NOT NULL,
  `status` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pendienthon_reporte
-- ----------------------------
INSERT INTO `pendienthon_reporte` VALUES ('1', 'Las camaras no funcionan', '150', '3', '2', '2', 'A');
INSERT INTO `pendienthon_reporte` VALUES ('2', 'asdf', '150', '1', '2', '1', '');

-- ----------------------------
-- Table structure for `pendienthon_usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `pendienthon_usuarios`;
CREATE TABLE `pendienthon_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` char(255) NOT NULL,
  `nombre` char(255) NOT NULL,
  `email` char(255) NOT NULL,
  `pass` text NOT NULL,
  `ip_login` char(50) NOT NULL,
  `last_login` datetime NOT NULL,
  `fk_rol` int(11) NOT NULL,
  `fk_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pendienthon_usuarios
-- ----------------------------
INSERT INTO `pendienthon_usuarios` VALUES ('1', 'cesar', 'Cesar', 'email@cesar.com', '', '', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `pendienthon_usuarios` VALUES ('2', 'diego', 'Diego', '', '', '', '0000-00-00 00:00:00', '1', '1');
INSERT INTO `pendienthon_usuarios` VALUES ('3', 'carlos', 'Carlos', '', '', '', '0000-00-00 00:00:00', '1', '1');
INSERT INTO `pendienthon_usuarios` VALUES ('4', 'secre', 'secre', '', '', '', '0000-00-00 00:00:00', '4', '2');
INSERT INTO `pendienthon_usuarios` VALUES ('5', '', '', '', '', '', '0000-00-00 00:00:00', '0', '1');

-- ----------------------------
-- Table structure for `pentienthon_rol`
-- ----------------------------
DROP TABLE IF EXISTS `pentienthon_rol`;
CREATE TABLE `pentienthon_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  `descripcion` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pentienthon_rol
-- ----------------------------
INSERT INTO `pentienthon_rol` VALUES ('1', 'Tecnico', '');
INSERT INTO `pentienthon_rol` VALUES ('2', 'Supervisor', '');
INSERT INTO `pentienthon_rol` VALUES ('3', 'Auxiliar', '');
INSERT INTO `pentienthon_rol` VALUES ('4', 'Trabajador', '');

-- ----------------------------
-- Table structure for `system_acl`
-- ----------------------------
DROP TABLE IF EXISTS `system_acl`;
CREATE TABLE `system_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) DEFAULT NULL,
  `modulo` char(255) DEFAULT NULL,
  `controlador` char(255) DEFAULT NULL,
  `accion` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_acl
-- ----------------------------
INSERT INTO `system_acl` VALUES ('2', '0', 'asdf', 'asdf', 'asfd');
INSERT INTO `system_acl` VALUES ('3', '2', '', '', '');

-- ----------------------------
-- Table structure for `system_catalogos`
-- ----------------------------
DROP TABLE IF EXISTS `system_catalogos`;
CREATE TABLE `system_catalogos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_modulo` int(11) DEFAULT NULL,
  `nombre` char(255) DEFAULT NULL,
  `controlador` char(255) DEFAULT NULL,
  `modelo` char(255) DEFAULT NULL,
  `tabla` char(255) DEFAULT NULL,
  `pk_tabla` char(255) DEFAULT 'id',
  `icono` char(255) DEFAULT NULL,
  `titulo_nuevo` char(255) DEFAULT NULL,
  `titulo_edicion` char(255) DEFAULT NULL,
  `titulo_busqueda` char(255) DEFAULT NULL,
  `msg_creado` char(255) DEFAULT NULL,
  `msg_actualizado` char(255) DEFAULT NULL,
  `pregunta_eliminar` char(255) DEFAULT NULL,
  `msg_eliminado` char(255) DEFAULT NULL,
  `msg_cambios` char(255) DEFAULT NULL,
  `campos_busqueda` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_catalogos
-- ----------------------------
INSERT INTO `system_catalogos` VALUES ('18', '2', 'Usuarios', 'usuarios', 'Usuario', 'system_usuarios', 'id', 'http://png.findicons.com/files/icons/1620/crystal_project/64/personal.png', 'Nuevo Usuario', '\'Usuario: \' + getValorCampo(\'nombre\')', 'Buscar Usuario', 'Usuario Creado', 'Usuario Actualizado', '¿Eliminar Usuario?', '', '', 'nick, email, name');
INSERT INTO `system_catalogos` VALUES ('32', '2', 'Modulos', 'modulos', 'modulo', 'system_modulos', 'id', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', 'Nuevo Modulo', '\'Modulo: \' + getValorCampo(\'nombre\')', 'Modulos', 'Modulo Creado', 'Modulo Actualizado', '¿Eliminar Modulo?', '', '', '');
INSERT INTO `system_catalogos` VALUES ('33', '2', 'Catalogos', 'catalogos', 'Catalogo', 'system_catalogos', 'id', 'http://png.findicons.com/files/icons/577/refresh_cl/48/windows_view_icon.png', 'Nuevo Catalogo', '\'Catalogo: \' + getValorCampo(\'nombre\')', '\'Buscar Catalogos\'', 'Catalogo Creado', 'Catalogo Actualizado', 'Eliminar Catalogo', 'Catalogo Eliminado', 'Ha hecho cambios en el catalogo,ï¿½Guardar antes de salir?', 'nombre');
INSERT INTO `system_catalogos` VALUES ('40', '8', 'Paginas', 'paginas', 'pagina', 'system_pagina', 'id', 'default.png', 'Nueva Pagina', 'Pagina:  {titulo}', 'Buscar Paginas', 'Pagina Creada', 'Pagina Actualizada', 'Â¿Eliminar Pagina?', 'Pagina Eliminada', 'Desea Guardar los cambios', 'nombre');
INSERT INTO `system_catalogos` VALUES ('41', '2', 'Elemento del Catalogo', 'elementos', 'elemento', 'constructor_elemento_catalogo', 'id', '', 'Nuevo Elemento', '\'Editar Elemento\'', 'Buscar Elemento', 'Elemento Creado', 'Elemento Actualizado', 'Â¿Eliminar Elemento?', 'Elemento Eliminado', 'Â¿Guardar Cambios del Elemento?', 'Field, componente');
INSERT INTO `system_catalogos` VALUES ('42', '8', 'Modelo C', 'modelos', 'modeloc', 'system_modelos', 'id', '', 'Nuevo Modelo', '\'Editando Modelo: \'+ getValorCampo(\'nombre\')', 'Buscar Modelo', '', '', '', '', '', 'nombre');
INSERT INTO `system_catalogos` VALUES ('43', '8', 'Autor', 'autores', 'autor', 'system_users', 'id', '', 'Nuevo Autor', 'Autor:  {name}', 'Busqueda de Autores', 'Autor Creado', 'Autor Actualizado', 'Â¿Eliminar?', 'Eliminado', 'cambios pendientes', 'name');
INSERT INTO `system_catalogos` VALUES ('44', '2', 'UM', 'unidades', 'unidad', 'exp_um', 'id', '', 'Nueva Unidad de Medida', '\'UM: \' +getValorCampo(\'nombre\')', 'Buscar Unidades de Medida', 'UM creada', 'UM actualizada', 'Â¿Eliminar UM?', 'UM eliminada', 'Â¿Guardar los cambios?', 'nombre, abreviacion');
INSERT INTO `system_catalogos` VALUES ('45', '8', 'Categoria', 'categorias', 'categoria', 'cms_categoria', 'id', '', 'Nueva Categoria', 'Categoria: {nombre}', 'Buscar Categoria', 'Categoria Creada', 'Categoria Actualizada', 'Â¿Eliminar Categoria?', '', '', 'nombre');
INSERT INTO `system_catalogos` VALUES ('46', '2', 'Conceptos', 'conceptos', 'concepto', 'exp_concepto', 'id', '', 'Nuevo Concepto', '\'Concepto: \' + getValorCampo(\'nombre\')', 'Conceptos', 'Concepto Creado', 'Concepto Actualizado', 'Â¿Eliminar Concepto?', 'Concepto Eliminado', 'Â¿Guardar antes de salir?', 'nombre');
INSERT INTO `system_catalogos` VALUES ('47', '2', 'Cotizacion', 'cotizaciones', 'cotizacion', 'exp_cotizacion', 'id', '', 'Nueva Cotizacion', '\'Cotizacion: \'+getValorCampo(\'serie\')+\'  \'+getValorCampo(\'folio\')', 'Cotizaciones', 'Cotizacion Creada', 'Cotizacion Actualizada', 'Â¿Eliminar Cotizacion?', 'Cotizacion Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('48', '2', 'concepto_cotizacion', 'conceptos_cotizacion', 'concepto_cotizacion', 'exp_conceptos_cotizacion', 'id', '', 'Nuevo Concepto de Cotizacion', '\'Concepto: \'+getValorCampo(\'fk_concepto\')', 'Conceptos de Cotizacion', 'Concepto Creado', 'Concepto Actualizado', 'Â¿Eliminar Concepto?', 'Concepto Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('50', '3', 'Catalogos', 'catalogos', 'Catalogo', 'system_catalogos', 'id', 'http://png.findicons.com/files/icons/577/refresh_cl/48/windows_view_icon.png', 'Nuevo Catalogo', '\'Catalogo: \' + getValorCampo(\'nombre\')', '\'Buscar Catalogos\'', 'Catalogo Creado', 'Catalogo Actualizado', 'Eliminar Catalogo', 'Catalogo Eliminado', 'Ha hecho cambios en el catalogo,ï¿½Guardar antes de salir?', 'nombre');
INSERT INTO `system_catalogos` VALUES ('51', '3', 'Modulos', 'modulos', 'Modulo', 'system_modulos', 'id', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', 'Nuevo Modulo', '\'Modulo:\' + getValorCampo(\'nombre\')', 'Modulos', 'Modulo Creado', 'Modulo Actualizado', '¿Eliminar Modulo?', 'Modulo Eliminado', '¿Guardar cambios?', '');
INSERT INTO `system_catalogos` VALUES ('52', '3', 'Tablas', 'tablas', 'tabla', 'constructor_elemento_catalogo', 'id', '', 'Nueva Tabla', '\'Tabla: \' + getValorCampo(\'nombre\')', 'Tablas', 'Tabla Creada', 'Tabla Actualizada', '¿Eliminar Tabla?', 'Tabla Eliminada', '¿Guardar los cambios en la tabla?', '');
INSERT INTO `system_catalogos` VALUES ('53', '3', 'Elementos De Catalogo', 'elementos_de_catalogo', 'elemento_de_catalogo', 'constructor_elemento_catalogo', 'id', '', 'Nuevo Elemento', '\'Elemento: \' + getValorCampo(\'nombre\')', 'Elementos de Catalogo', 'Elemento Creado', 'Elemento Actualizado', '¿Eliminar Elemento?', 'Elemento eliminado', '¿Guardar los cambios en el elemento?', '');
INSERT INTO `system_catalogos` VALUES ('54', '4', 'Roles', 'roles', 'rol', 'pentienthon_rol', 'id', '', 'Nuevo Rol', '\'Rol: \' + getValorCampo(\'nombre\')', 'Roles', 'Rol Creado', 'Rol Actualizado', '¿Eliminar Rol?', 'Rol Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('55', '4', 'Usuario Pendienthon', 'usuarios', 'usuario', 'pendienthon_usuarios', 'id', '', 'Nuevo Usuario', '\'Usuario: \' + getValorCampo(\'nombre\')', 'Usuarios', 'Usuario Creado', 'Usuario Actualizado', '¿Eliminar Usuario?', 'Usuario Eliminado', '¿Guardar Cambios en el Usuario?', '');
INSERT INTO `system_catalogos` VALUES ('56', '4', 'Empresa', 'empresas', 'empresa', 'pendienthon_empresa', 'id', '', 'Nueva Empresa', '\'Empresa: \' + getValorCampo(\'nombre\')', 'Empresas', 'Empresa Creada', 'Empresa Actualizada', '¿Eliminar Empresa?', 'Empresa Eliminada', '¿Guardar Cambios en la Empresa?', '');
INSERT INTO `system_catalogos` VALUES ('57', '4', 'Reporte', 'reportes', 'reporte', 'pendienthon_reporte', 'id', '', 'Nuevo Reporte', '\'Reporte: \' + getValorCampo(\'num_reporte\')', 'Reportes', 'Nuevo Reporte', 'Reporte Actualizado', 'Â¿Eliminar Reporte?', 'Reporte Eliminado', 'Â¿Guardar Cambios en el Reporte?', '');
INSERT INTO `system_catalogos` VALUES ('58', '4', 'Evento', 'eventos', 'evento', 'pendienthon_evento', 'id', '', 'Nuevo Evento', '\'Evento: \' + getValorCampo(\'descripcion\')', 'Eventos', 'Evento Creado', 'Evento Actualizado', '¿Eliminar Evento ?', 'Evento Eliminado', '¿Guardar cambios en el Evento ?', '');
INSERT INTO `system_catalogos` VALUES ('59', '5', 'Documento', 'documentos', 'documento', 'transportes_documento', 'id', '', 'Nuevo Documento', '\'Documento: \' + getValorCampo(\'id\')', 'Documentos', 'Documento Creado', 'Documento Actualizado', 'Â¿Eliminar Documento?', 'Documento Eliminado', 'Â¿Guardar Cambios en el documento?', '');
INSERT INTO `system_catalogos` VALUES ('60', '5', 'concepto_documento', 'conceptos_documento', 'concepto_documento', 'transportes_concepto_documento', 'id', '', 'Nuevo Concepto de Documento', '\'Concepto: \' + getValorCampo(\'id\')', ' Conceptos De Documento', 'Concepto Creado', 'Concepto Actualizado', 'Â¿Eliminar Concepto?', 'Concepto Eliminado', 'Â¿Guardar Cambios en Concepto?', '');
INSERT INTO `system_catalogos` VALUES ('61', '5', 'Tipo de Documento', 'tipos_de_documento', 'tipo_de_documento', 'transportes_tipo_documento', 'id', '', 'Nuevo Tipo de Documento', '\'Tipo: \' + getValorCampo(\'nombre\')', 'Tipos de Documento', 'Tipo de Documento Creado', 'Tipo de Documento Actualizado', 'Â¿ Eliminar Tipo de Documento  ?', 'Tipo  de Documento Eliminado', 'Â¿Guardar Cambios en Tipo de Documento?', '');
INSERT INTO `system_catalogos` VALUES ('62', '5', 'Series', 'series', 'serie', 'transportes_serie', 'id', '', 'Nueva Serie', '\'Serie: \' + getValorCampo(\'nombre\')', 'Series', 'Serie Creada', 'Serie Actualzada', 'Â¿Eliminar Serie?', 'Serie Elimnada', 'Â¿Guardar Cambios?', '');
INSERT INTO `system_catalogos` VALUES ('63', '5', 'Socios', 'socios', 'socio', 'transportes_socio', 'id', '', 'Nuevo Socio', '\'Socio: \' + getValorCampo(\'nombre\')', 'Socios', 'Socio Creado', 'Socio Actualizado', '', '', '', '');
INSERT INTO `system_catalogos` VALUES ('64', '6', 'Maquinas', 'maquinas', 'maquina', 'makinas_maquina', 'id', '', 'Nueva Maquina', '\'Maquina: \' + getValorCampo(\'nombre\')', 'Maquinas', 'Maquina Creada', 'Maquina Actualizada', '', '', '', '');
INSERT INTO `system_catalogos` VALUES ('65', '6', 'Dueño', 'owners', 'owner', 'makina_owner', 'id', '', 'Nuevo Dueño', '\'Dueño: \' + getValorCampo(\'nombre\')', 'Dueños', 'Dueño Creado', 'Dueño Actualizado', '', '', '', '');
INSERT INTO `system_catalogos` VALUES ('66', '7', 'Pais', 'paises', 'pais', 'system_ubicacion_paises', 'id', '', 'Nuevo Pais', '\'Pais: \' + getValorCampo(\'nombre\')', 'Paises', 'Pais Creado', 'Pais Actualizado', '¿Eliminar Pais?', 'Pais Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('67', '7', 'Estados', 'estados', 'estado', 'system_ubicacion_estados', 'id', '', 'Nuevo Estado', '\'Estado: \' + getValorCampo(\'nombre\')', 'Estados', 'Estado Creado', 'Estado Actualizado', '', '', '', '');
INSERT INTO `system_catalogos` VALUES ('68', '7', 'Municipio', 'municipios', 'municipio', 'system_ubicacion_municipios', 'id', '', 'Nuevo Municipio', '\'Municipio: \' + getValorCampo(\'nombre\')', 'Municipios', 'Municipio Creado', 'Municipio Actualizado', '¿Eliminar Municipio?', 'Municipio Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('69', '6', 'Cliente', 'clientes', 'cliente', 'makina_cliente', 'id', '', 'Nuevo Cliente', '\'Cliente: \'+getValorCampo(\'nombre\')', 'Clientes', 'Cliente Creado', 'Cliente Actualizado', '', '', '', '');
INSERT INTO `system_catalogos` VALUES ('70', '6', 'Tecnico', 'tecnicos', 'tecnico', 'makina_tecnico', 'id', '', 'Nuevo Tecnico', '\'Tecnico: \' + getValorCampo(\'nombre\')', 'Tecnicos', 'Tecnico Creado', 'Tecnico Actualizado', '', '', '', '');
INSERT INTO `system_catalogos` VALUES ('71', '6', 'Punto de Venta', 'puntos_de_venta', 'punto_de_venta', 'makina_punto_de_venta', 'id', '', 'Nuevo Punto de Venta', '\'Punto de Venta: \' + getValorCampo(\'nombre\')', 'Puntos de Venta', 'Punto de Venta Creada', 'Punto de Venta Actualizada', '', '', '', '');
INSERT INTO `system_catalogos` VALUES ('72', '6', 'Cortes', 'cortes', 'corte', 'makinas_corte', 'id', '', 'Nuevo Corte', '\'Corte: \' + getValorCampo(\'fecha\')', 'Cortes', 'Corte Creado', 'Corte Actualizado', '¿Eliminar Corte?', '', '', '');
INSERT INTO `system_catalogos` VALUES ('73', '6', 'Series', 'series', 'serie', 'makinas_serie', 'id', '', 'Nueva Serie', '\'Serie: \' + getValorCampo(\'serie\')', 'Series', 'Serie Creada', 'Serie Actualizada', '¿Eliminar Serie?', '', '', '');
INSERT INTO `system_catalogos` VALUES ('74', '7', 'Régimen de Contratato', 'regimenes_contratacion', 'regimen_contratacion', 'nomina_regimen_contratacion', 'id', '', 'Nuevo Regimen de contratación', 'Régimen de Contratación: {nombre}', 'Regímenes de Contratación', 'Régimen de Contratación Creado', 'Régimen de Contratación Actualizado', '¿Eliminar Régimen de Contratación ?', 'Régimen de Contratación Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('75', '7', 'Bancos', 'bancos', 'banco', 'nomina_bancos', 'id', '', 'Nuevo Banco', '\'Banco: \' + getValorCampo(\'nombre_corto\')', 'Bancos', 'Banco Creado', 'Banco Actualizado', '¿Eliminar Banco?', 'Banco Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('76', '7', 'Nivel de Riesgo', 'riesgos', 'riesgo', 'nomina_riesgo_puesto', 'id', '', 'Nuevo Riesgo Puesto', '\'Nuevo Riesgo: \' + getValorCampo(\'descripcion\')', 'Riesgos', 'Riesgo Creado', 'Riesgo Actualizado', '¿Eliminar Riesgo?', 'Riesgo Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('77', '7', 'Tipo de Percepción', 'tipos_percepcion', 'tipo_percepcion', 'nomina_tipo_percepcion', 'id', '', 'Nuevo Tipo de Percepción', '\'Tipo de Percepcion: \' + getValorCampo(\'descripcion\')', 'Tipos de Percepción', 'Tipo de Percepción Creada', 'Tipo de Percepción Actualizada', '¿Eliminar Tipo de Percepción?', 'Tipo de Percepción Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('78', '7', 'Tipo de Deduccion', 'tipos_deduccion', 'tipo_deduccion', 'nomina_tipo_deduccion', 'id', '', 'Nuevo Tipo de Deducción', '\'Tipo de Deducción: \' +getValorCampo(\'descripcion\')', 'Tipos de Deducción', 'Tipo de Deducción Creada', 'Tipo de Deducción Actualizada', '¿Eliminar Tipo de Deducción?', 'Tipo de Deducción Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('79', '7', 'Tipo de Incapacidad', 'tipos_incapacidad', 'tipo_incapacidad', 'nomina_tipo_incapacidad', 'id', '', 'Nuevo Tipo De Incapacidad', '\'Tipo De Incapacidad: \' + getValorCampo(\'descripcion\')', 'Tipos De Incapacidad', 'Tipo De Incapacidad Creada', 'Tipo De Incapacidad Actualizada', '¿Eliminar Tipo De Incapacidad?', 'Tipo De Incapacidad Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('80', '7', 'Trabajador', 'trabajadores', 'trabajador', 'nomina_trabajador', 'id', '', 'Nuevo Trabajador', 'Trabajador:  {nombre}', 'Trabajadores', 'Trabajador Creado', 'Trabajador Actualizado', '¿Eliminar Trabajador?', 'Trabajador Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('81', '7', 'Regimen Fiscal', 'regimenes', 'regimen', 'facturacion_regimenes', 'id', '', 'Nuevo Regimen Fiscal', '\'Regimen Fiscal: \' + getValorCampo(\'regimen\')', 'Regímenes Fiscales', 'Régimen Fiscal Creado', 'Régimen Fiscal Actualizado', '¿Eliminar Régimen Fiscal?', 'Régimen Fiscal Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('82', '7', 'Certificados', 'certificados', 'certificado', 'facturacion_certificados', 'id', '', 'Nuevo Certificado', 'Certificado: {no_serie}', 'Certificados', 'Certificado Creado', 'Certificado Actualizado', '¿Eliminar Certificado?', 'Certificado Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('83', '7', 'Serie Nomina', 'series_nomina', 'serie_nomina', 'nomina_series', 'id', '', 'Nueva Serie Para Nomina', '\'Serie Para Nomina: \' + getValorCampo(\'serie\')', 'Series Para Nomina', 'Serie Para Nomina Creada', 'Serie Para Nomina Actualizada', '¿Eliminar Serie Para Nomina?', 'Serie Para Nomina Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('84', '7', 'Empresa', 'empresas', 'empresa', 'facturacion_razones_sociales', 'id', '', 'Nueva Empresa', 'Empresa: {nombre_comercial}', 'Empresas', 'Empresa Creada', 'Empresa Actualizada', 'ï¿½Eliminar Empresa?', 'Empresa Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('85', '7', 'Jornada', 'jornadas', 'jornada', 'nomina_jornada', 'id', '', 'Nueva Jornada', '\'Jornada: \'+getValorCampo(\'nombre\')', 'Jornadas', 'Jornada Creada', 'Jornada Actualizada', '¿Eliminar Jornada?', 'Jornada Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('86', '7', 'Periodo de Pago', 'periodo_pagos', 'periodo_pago', 'nomina_periodicidad_pago', 'id', '', 'Nuevo Periodo de Pago', '\'Periodo de Pago: \' + getValorCampo(\'descripcion\')', 'Periodos de  Pago', 'Periodo de Pago Creado', 'Periodo de Pago Actualizado', '¿Eliminar Periodo de Pago?', 'Periodo de Pago Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('87', '7', 'Departamento', 'departamentos', 'departamento', 'nomina_departamento', 'id', '', 'Nuevo Departamento', '\'Departamento: \' + getValorCampo(\'nombre\')', 'Departamentos', 'Departamento Creado', 'Departamento Actualizado', '¿Eliminar Departamento ?', 'Departamento Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('88', '7', 'Nomina', 'nominas', 'nomina', 'nomina_nomina', 'id', '', 'Nueva Nomina', 'Nomina: {serie}  {folio}', 'Nominas', 'Nomina Creada', 'Nomina Actualizada', '¿Eliminar Nomina?', 'Nomina Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('89', '7', 'Percepciones', 'percepciones_nomina', 'percepcion_nomina', 'nomina_percepciones', 'id', '', 'Nueva Percepcion', '\'Percepcion: \' + getValorCampo(\'Concepto\')', 'Percepciones', 'Percepcion Creada', 'Percepcion Actualizada', '¿Eliminar Percepcion?', 'Percepcion Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('90', '7', 'Deducciones', 'deducciones_nomina', 'deduccion_nomina', 'nomina_deducciones', 'id', '', 'Nueva Deducción', '\'Deducción: \' + getValorCampo(\'Concepto\')', 'Deducciónes', 'Deducción Creada', 'Deducción Actualizada', '¿Eliminar Deducción?', 'Deducción Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('91', '7', 'Incapacidades', 'incapacidades', 'incapacidad', 'nomina_incapacidades', 'id', '', 'Nueva Incapacidad', '\'Incapacidad\'', 'Incapacidades', 'Incapacidad Creada', 'Incapacidad Actualizada', '¿Eliminar Incapacidad?', 'Incapacidad Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('92', '7', 'Tipo Horas', 'tipos_hora', 'tipo_hora', 'nomina_tipo_horas', 'id', '', 'Nuevo Tipo de Hora Extra', '\'Tipo de Hora Extra: \' + getValorCampo(\'nombre\')', 'Tipos de Horas Extra', 'Tipo de Hora Extra Creado', 'Tipo de Hora Extra Actualizado', '¿Eliminar Tipo de Hora Extra?', 'Tipo de Hora Extra Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('93', '7', 'Horas Extra', 'horas_extra_nomina', 'hora_extra_nomina', 'nomina_horas_extra', 'id', '', 'Nueva Hora Extra', '\'Hora Extra\'', 'Horas Extra', 'Hora Extra Creada', 'Hora Extra Actualizada', '¿Eliminar Hora Extra ?', 'Hora Extra Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('94', '2', 'App', 'apps', 'app', 'constructor_app', 'id', '', 'Nueva App', 'Aplicacion: {nombre}', 'Aplicaciones', 'Aplicacion Creada', 'Aplicacion Actualizada', 'Â¿Eliminar Aplicacion?', 'Aplicacion Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('95', '2', 'Conexion', 'conexiones', 'conexion', 'constructor_db_config', 'id', '', 'Nueva Conexion', 'Conexion: {db_host} - {db_name}', 'Conexiones', 'Conexion Creada', 'Conexion Actualizada', 'Â¿Eliminar?', 'Conexion Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('96', '2', 'Temas', 'temas', 'tema', 'system_tema', 'id', '', 'Nuevo Tema', 'Tema: {nombre}', 'Temas', 'Tema Creado', 'Tema Actualizado', 'Â¿Eliminar Tema?', 'Tema Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('97', '7', 'Formas De Pago', 'formas_de_pago', 'forma_de_pago', 'facturacion_formas_de_pago', 'id', '', 'NuevaForma de Pago', 'Forma de Pago: {nombre}', 'Formas de Pago', 'Forma de Pago Creada', 'Forma de Pago Actualizada', '¿Eliminar Forma de Pago?', 'Forma de Pago Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('98', '7', 'Métodos de Pago', 'metodos_de_pago', 'metodo_de_pago', 'facturacion_metodos_de_pago', 'id', '', 'Nuevo Método De Pago', 'Método De Pago: {nombre}', 'Métodos De Pago', 'Método De Pago Creado', 'Método De Pago Actualizado', '¿Eliminar Método De Pago?', 'Método De Pago Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('99', '7', 'Monedas', 'monedas', 'moneda', 'facturacion_moneda', 'id', '', 'Nueva Moneda', 'Moneda: {moneda} ({codigo})', 'Monedas', 'Moneda Creada', 'Moneda Actualizada', '¿Eliminar Moneda?', 'Moneda Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('100', '7', 'Conceptos de Nomina', 'conceptos_de_nomina', 'concepto_de_nomina', 'nomina_nomina_conceptos', 'id', '', 'Nuevo Concepto De Nomina', 'Concepto De Nomina: {descripcion}', 'Conceptos De Nomina', 'Concepto De Nomina Creado', 'Concepto De Nomina Actualizado', '¿Eliminar Concepto De Nomina?', 'Concepto De Nomina Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('101', '7', 'Unidades De Medida', 'unidades_de_medida', 'unidad_de_medida', 'facturacion_um', 'id', '', 'Nueva Unidad De Medida', 'Unidad De Medida: {nombre}', 'Unidades De Medida', 'Unidad De Medida Creada', 'Unidad De Medida Actualizada', '¿Eliminar Unidad De Medida?', 'Unidad De Medida Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('102', '7', 'Conceptos Para Nomina', 'conceptos_para_nomina', 'concepto_para_nomina', 'nomina_conceptos', 'id', '', 'Nuevo Concepto Para Nomina', 'Concepto Para Nomina: {nombre}', 'Conceptos Para Nomina', 'Concepto Para Nomina Creado', 'Concepto Para Nomina Actualizado', '¿Eliminar Concepto Para Nomina?', 'Concepto Para Nomina Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('103', '7', 'Naturaleza del Impuesto', 'tipos_de_impuesto', 'tipo_de_impuesto', 'nomina_naturaleza_impuesto', 'id', '', 'Nuevo Tipo De Impuesto', 'Tipo De Impuesto: {nombre}', 'Tipos De Impuestos', 'Nuevo Tipo De Impuesto', 'Tipo De Impuesto Actualizado', '¿Eliminar Tipo De Impuesto?', 'Tipo De Impuesto Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('104', '7', 'Impuestos', 'impuestos', 'impuesto', 'nomina_impuesto', 'id', '', 'Nuevo Impuesto', 'Impuesto: {nombre}', 'Impuestos', 'Impuesto Creado', 'Impuesto Actualizado', '¿Eliminar Impuesto?', 'Impuesto Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('105', '7', 'Impuestos De Nomina', 'impuestos_de_nomina', 'impuesto_de_nomina', 'nomina_nomina_impuesto', 'id', '', 'Nuevo Impuesto De Nomina', 'Impuesto De Nomina: {nombre}', 'Impuestos De Nomina', 'Impuesto De Nomina Creado', 'Impuesto De Nomina Actualizado', '¿Eliminar Impuesto De Nomina?', 'Impuesto De Nomina Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('106', '7', 'Arbol', 'arboles', 'arbol', 'mptt', 'id', '', 'Nuevo Nodo', 'Nodo: {title}', 'Nodos', 'Nodo Creado', 'Nodo Actualizado', 'Â¿Actualizar Nodo?', 'Nodo Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('107', '7', 'Tipo De Contrato', 'tipos_de_contrato', 'tipo_de_contrato', 'nomina_tipo_contrato', 'id', '', 'Nuevo Tipo De Contrato', 'Tipo De Contrato: {nombre}', 'Tipos De Contrato', 'Tipo De Contrato Creado', 'Tipo De Contrato Actualizado', 'Tipo De Contrato Eliminado', '¿Eliminar Tipo De Contrato?', '', '');

-- ----------------------------
-- Table structure for `system_categoria_pagina`
-- ----------------------------
DROP TABLE IF EXISTS `system_categoria_pagina`;
CREATE TABLE `system_categoria_pagina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_categoria_pagina
-- ----------------------------

-- ----------------------------
-- Table structure for `system_config`
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) DEFAULT NULL,
  `tema` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES ('1', '1', 'artic');
INSERT INTO `system_config` VALUES ('2', '20', 'artic');

-- ----------------------------
-- Table structure for `system_modelos`
-- ----------------------------
DROP TABLE IF EXISTS `system_modelos`;
CREATE TABLE `system_modelos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `tabla` char(255) DEFAULT NULL,
  `llave_primaria` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_modelos
-- ----------------------------
INSERT INTO `system_modelos` VALUES ('1', 'autor', 'system_users', 'id');
INSERT INTO `system_modelos` VALUES ('2', 'unidad', 'exp_um', 'id');
INSERT INTO `system_modelos` VALUES ('3', 'producto', 'exp_concepto', 'id');
INSERT INTO `system_modelos` VALUES ('4', 'pagina', 'system_pagina', 'id');
INSERT INTO `system_modelos` VALUES ('5', 'categoria', 'cms_categoria', 'id');
INSERT INTO `system_modelos` VALUES ('6', 'concepto', 'exp_concepto', 'id');
INSERT INTO `system_modelos` VALUES ('7', 'cotizacion', 'exp_cotizacion', 'id');

-- ----------------------------
-- Table structure for `system_modulos`
-- ----------------------------
DROP TABLE IF EXISTS `system_modulos`;
CREATE TABLE `system_modulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `icono` char(255) DEFAULT NULL,
  `nombre_interno` char(255) DEFAULT NULL,
  `ruta_base` char(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_modulos
-- ----------------------------
INSERT INTO `system_modulos` VALUES ('1', 'backend', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', 'backend', '/modulos/', '0');
INSERT INTO `system_modulos` VALUES ('2', 'Constructor', 'http://png-1.findicons.com/files/icons/2003/business/64/shopping_full.png', 'portal', '/', '0');
INSERT INTO `system_modulos` VALUES ('4', 'Pendienthon', '', 'pendienthon', '/', '0');
INSERT INTO `system_modulos` VALUES ('5', 'Transportes', '', 'transportes', '/', '0');
INSERT INTO `system_modulos` VALUES ('6', 'Makinas', '', 'makinas', '/', '0');
INSERT INTO `system_modulos` VALUES ('7', 'Nominas', '', 'nomina', '/', '0');
INSERT INTO `system_modulos` VALUES ('8', 'Suite Marina', '', 'suitemarina', '/', '0');

-- ----------------------------
-- Table structure for `system_pagina`
-- ----------------------------
DROP TABLE IF EXISTS `system_pagina`;
CREATE TABLE `system_pagina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` char(255) DEFAULT NULL,
  `autor` text,
  `contenido` text,
  `fk_categoria_pagina` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `ultima_edicion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_pagina
-- ----------------------------
INSERT INTO `system_pagina` VALUES ('1', 'Cerritos', '1  ', 'asdfas', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `system_pagina` VALUES ('6', 'AAA', '1          ', 'BLA bla bla ble ble ble', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `system_pagina` VALUES ('7', 'Un Titulo', '1', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `system_pagina` VALUES ('18', 'Nueva Pagina', '1 ', '', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `system_tema`
-- ----------------------------
DROP TABLE IF EXISTS `system_tema`;
CREATE TABLE `system_tema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `ruta` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_tema
-- ----------------------------
INSERT INTO `system_tema` VALUES ('1', 'Artic', 'http://cdn.wijmo.com/themes/arctic/jquery-wijmo.css');
INSERT INTO `system_tema` VALUES ('2', 'Midnight', 'http://cdn.wijmo.com/themes/midnight/jquery-wijmo.css');
INSERT INTO `system_tema` VALUES ('3', 'aristo', 'http://cdn.wijmo.com/themes/aristo/jquery-wijmo.css');
INSERT INTO `system_tema` VALUES ('4', 'rocket', 'http://cdn.wijmo.com/themes/rocket/jquery-wijmo.css');
INSERT INTO `system_tema` VALUES ('5', 'cobalt', 'http://cdn.wijmo.com/themes/cobalt/jquery-wijmo.css');
INSERT INTO `system_tema` VALUES ('6', 'Sterling', 'http://cdn.wijmo.com/themes/sterling/jquery-wijmo.css');
INSERT INTO `system_tema` VALUES ('7', 'Black Tie', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/black-tie/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('8', 'Blitzer', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/blitzer/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('9', 'Cupertino', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/cupertino/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('10', 'Dark Hive', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/dark-hive/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('11', 'Dot Luv', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/dot-luv/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('12', 'Eggplant', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/eggplant/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('13', 'Excite Bike', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/excite-bike/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('14', 'Flick', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/flick/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('15', 'Humanity', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/humanity/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('16', 'Le Frog', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/le-frog/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('17', 'Mint Chocolate', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/mint-choc/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('18', 'Overcast', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/overcast/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('19', 'Pepper Grinder', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/pepper-grinder/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('20', 'Redmond', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/redmond/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('21', 'Smoothness', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/smoothness/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('22', 'South Street', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/south-street/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('23', 'Start', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/start/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('24', 'Sunny', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/sunny/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('25', 'Swanky Purse', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/swanky-purse/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('26', 'Trontasic', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/trontastic/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('27', 'UI Darkness', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/ui-darkness/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('28', 'UI Lightness', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/ui-lightness/jquery-ui.css');
INSERT INTO `system_tema` VALUES ('29', 'Vader', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/vader/jquery-ui.css');

-- ----------------------------
-- Table structure for `system_ubicacion_estados`
-- ----------------------------
DROP TABLE IF EXISTS `system_ubicacion_estados`;
CREATE TABLE `system_ubicacion_estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `fk_pais` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of system_ubicacion_estados
-- ----------------------------
INSERT INTO `system_ubicacion_estados` VALUES ('1', 'Aguascalientes', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('2', 'Baja California', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('3', 'Baja California Sur', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('4', 'Campeche', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('5', 'Coahuila de Zaragoza', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('6', 'Colima', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('7', 'Chiapas', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('8', 'Chihuahua', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('9', 'Distrito Federal', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('10', 'Durango', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('11', 'Guanajuato', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('12', 'Guerrero', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('13', 'Hidalgo', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('14', 'Jalisco', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('15', 'México', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('16', 'Michoacán de Ocampo', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('17', 'Morelos', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('18', 'Nayarit', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('19', 'Nuevo León', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('20', 'Oaxaca', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('21', 'Puebla', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('22', 'Querétaro', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('23', 'Quintana Roo', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('24', 'San Luis Potosí', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('25', 'Sinaloa', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('26', 'Sonora', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('27', 'Tabasco', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('28', 'Tamaulipas', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('29', 'Tlaxcala', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('30', 'Veracruz de Ignacio de la Llave', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('31', 'Yucatán', '1');
INSERT INTO `system_ubicacion_estados` VALUES ('32', 'Zacatecas', '1');

-- ----------------------------
-- Table structure for `system_ubicacion_municipios`
-- ----------------------------
DROP TABLE IF EXISTS `system_ubicacion_municipios`;
CREATE TABLE `system_ubicacion_municipios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `clave_sepomex` char(255) DEFAULT NULL,
  `fk_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4946 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of system_ubicacion_municipios
-- ----------------------------
INSERT INTO `system_ubicacion_municipios` VALUES ('2489', 'Aguascalientes', '001', '1');
INSERT INTO `system_ubicacion_municipios` VALUES ('2490', 'Ensenada', '001', '2');
INSERT INTO `system_ubicacion_municipios` VALUES ('2491', 'Comondú', '001', '3');
INSERT INTO `system_ubicacion_municipios` VALUES ('2492', 'Calkiní', '001', '4');
INSERT INTO `system_ubicacion_municipios` VALUES ('2493', 'Abasolo', '001', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2494', 'Armería', '001', '6');
INSERT INTO `system_ubicacion_municipios` VALUES ('2495', 'Acacoyagua', '001', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2496', 'Ahumada', '001', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2497', 'Canatlán', '001', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2498', 'Abasolo', '001', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2499', 'Acapulco de Juárez', '001', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2500', 'Acatlán', '001', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2501', 'Acatic', '001', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2502', 'Acambay de Ruíz Castañeda', '001', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2503', 'Acuitzio', '001', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2504', 'Amacuzac', '001', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2505', 'Acaponeta', '001', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2506', 'Abasolo', '001', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2507', 'Abejones', '001', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2508', 'Acajete', '001', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2509', 'Amealco de Bonfil', '001', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2510', 'Cozumel', '001', '23');
INSERT INTO `system_ubicacion_municipios` VALUES ('2511', 'Ahualulco', '001', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2512', 'Ahome', '001', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2513', 'Aconchi', '001', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2514', 'Balancán', '001', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2515', 'Abasolo', '001', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2516', 'Amaxac de Guerrero', '001', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2517', 'Acajete', '001', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2518', 'Abalá', '001', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2519', 'Apozol', '001', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2520', 'Asientos', '002', '1');
INSERT INTO `system_ubicacion_municipios` VALUES ('2521', 'Mexicali', '002', '2');
INSERT INTO `system_ubicacion_municipios` VALUES ('2522', 'Mulegé', '002', '3');
INSERT INTO `system_ubicacion_municipios` VALUES ('2523', 'Campeche', '002', '4');
INSERT INTO `system_ubicacion_municipios` VALUES ('2524', 'Acuña', '002', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2525', 'Colima', '002', '6');
INSERT INTO `system_ubicacion_municipios` VALUES ('2526', 'Acala', '002', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2527', 'Aldama', '002', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2528', 'Azcapotzalco', '002', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2529', 'Canelas', '002', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2530', 'Acámbaro', '002', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2531', 'Ahuacuotzingo', '002', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2532', 'Acaxochitlán', '002', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2533', 'Acatlán de Juárez', '002', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2534', 'Acolman', '002', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2535', 'Aguililla', '002', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2536', 'Atlatlahucan', '002', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2537', 'Ahuacatlán', '002', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2538', 'Agualeguas', '002', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2539', 'Acatlán de Pérez Figueroa', '002', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2540', 'Acateno', '002', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2541', 'Pinal de Amoles', '002', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2542', 'Felipe Carrillo Puerto', '002', '23');
INSERT INTO `system_ubicacion_municipios` VALUES ('2543', 'Alaquines', '002', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2544', 'Angostura', '002', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2545', 'Agua Prieta', '002', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2546', 'Cárdenas', '002', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2547', 'Aldama', '002', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2548', 'Apetatitlán de Antonio Carvajal', '002', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2549', 'Acatlán', '002', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2550', 'Acanceh', '002', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2551', 'Apulco', '002', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2552', 'Calvillo', '003', '1');
INSERT INTO `system_ubicacion_municipios` VALUES ('2553', 'Tecate', '003', '2');
INSERT INTO `system_ubicacion_municipios` VALUES ('2554', 'La Paz', '003', '3');
INSERT INTO `system_ubicacion_municipios` VALUES ('2555', 'Carmen', '003', '4');
INSERT INTO `system_ubicacion_municipios` VALUES ('2556', 'Allende', '003', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2557', 'Comala', '003', '6');
INSERT INTO `system_ubicacion_municipios` VALUES ('2558', 'Acapetahua', '003', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2559', 'Allende', '003', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2560', 'Coyoacán', '003', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2561', 'Coneto de Comonfort', '003', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2562', 'San Miguel de Allende', '003', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2563', 'Ajuchitlán del Progreso', '003', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2564', 'Actopan', '003', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2565', 'Ahualulco de Mercado', '003', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2566', 'Aculco', '003', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2567', 'Álvaro Obregón', '003', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2568', 'Axochiapan', '003', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2569', 'Amatlán de Cañas', '003', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2570', 'Los Aldamas', '003', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2571', 'Asunción Cacalotepec', '003', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2572', 'Acatlán', '003', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2573', 'Arroyo Seco', '003', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2574', 'Isla Mujeres', '003', '23');
INSERT INTO `system_ubicacion_municipios` VALUES ('2575', 'Aquismón', '003', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2576', 'Badiraguato', '003', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2577', 'Alamos', '003', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2578', 'Centla', '003', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2579', 'Altamira', '003', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2580', 'Atlangatepec', '003', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2581', 'Acayucan', '003', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2582', 'Akil', '003', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2583', 'Atolinga', '003', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2584', 'Cosío', '004', '1');
INSERT INTO `system_ubicacion_municipios` VALUES ('2585', 'Tijuana', '004', '2');
INSERT INTO `system_ubicacion_municipios` VALUES ('2586', 'Champotón', '004', '4');
INSERT INTO `system_ubicacion_municipios` VALUES ('2587', 'Arteaga', '004', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2588', 'Coquimatlán', '004', '6');
INSERT INTO `system_ubicacion_municipios` VALUES ('2589', 'Altamirano', '004', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2590', 'Aquiles Serdán', '004', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2591', 'Cuajimalpa de Morelos', '004', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2592', 'Cuencamé', '004', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2593', 'Apaseo el Alto', '004', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2594', 'Alcozauca de Guerrero', '004', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2595', 'Agua Blanca de Iturbide', '004', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2596', 'Amacueca', '004', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2597', 'Almoloya de Alquisiras', '004', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2598', 'Angamacutiro', '004', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2599', 'Ayala', '004', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2600', 'Compostela', '004', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2601', 'Allende', '004', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2602', 'Asunción Cuyotepeji', '004', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2603', 'Acatzingo', '004', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2604', 'Cadereyta de Montes', '004', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2605', 'Othón P. Blanco', '004', '23');
INSERT INTO `system_ubicacion_municipios` VALUES ('2606', 'Armadillo de los Infante', '004', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2607', 'Concordia', '004', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2608', 'Altar', '004', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2609', 'Centro', '004', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2610', 'Antiguo Morelos', '004', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2611', 'Atltzayanca', '004', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2612', 'Actopan', '004', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2613', 'Baca', '004', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2614', 'Benito Juárez', '004', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2615', 'Jesús María', '005', '1');
INSERT INTO `system_ubicacion_municipios` VALUES ('2616', 'Playas de Rosarito', '005', '2');
INSERT INTO `system_ubicacion_municipios` VALUES ('2617', 'Hecelchakán', '005', '4');
INSERT INTO `system_ubicacion_municipios` VALUES ('2618', 'Candela', '005', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2619', 'Cuauhtémoc', '005', '6');
INSERT INTO `system_ubicacion_municipios` VALUES ('2620', 'Amatán', '005', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2621', 'Ascensión', '005', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2622', 'Gustavo A. Madero', '005', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2623', 'Durango', '005', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2624', 'Apaseo el Grande', '005', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2625', 'Alpoyeca', '005', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2626', 'Ajacuba', '005', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2627', 'Amatitán', '005', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2628', 'Almoloya de Juárez', '005', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2629', 'Angangueo', '005', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2630', 'Coatlán del Río', '005', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2631', 'Huajicori', '005', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2632', 'Anáhuac', '005', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2633', 'Asunción Ixtaltepec', '005', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2634', 'Acteopan', '005', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2635', 'Colón', '005', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2636', 'Benito Juárez', '005', '23');
INSERT INTO `system_ubicacion_municipios` VALUES ('2637', 'Cárdenas', '005', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2638', 'Cosalá', '005', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2639', 'Arivechi', '005', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2640', 'Comalcalco', '005', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2641', 'Burgos', '005', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2642', 'Apizaco', '005', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2643', 'Acula', '005', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2644', 'Bokobá', '005', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2645', 'Calera', '005', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2646', 'Pabellón de Arteaga', '006', '1');
INSERT INTO `system_ubicacion_municipios` VALUES ('2647', 'Hopelchén', '006', '4');
INSERT INTO `system_ubicacion_municipios` VALUES ('2648', 'Castaños', '006', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2649', 'Ixtlahuacán', '006', '6');
INSERT INTO `system_ubicacion_municipios` VALUES ('2650', 'Amatenango de la Frontera', '006', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2651', 'Bachíniva', '006', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2652', 'Iztacalco', '006', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2653', 'General Simón Bolívar', '006', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2654', 'Atarjea', '006', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2655', 'Apaxtla', '006', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2656', 'Alfajayucan', '006', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2657', 'Ameca', '006', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2658', 'Almoloya del Río', '006', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2659', 'Apatzingán', '006', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2660', 'Cuautla', '006', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2661', 'Ixtlán del Río', '006', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2662', 'Apodaca', '006', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2663', 'Asunción Nochixtlán', '006', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2664', 'Ahuacatlán', '006', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2665', 'Corregidora', '006', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2666', 'José María Morelos', '006', '23');
INSERT INTO `system_ubicacion_municipios` VALUES ('2667', 'Catorce', '006', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2668', 'Culiacán', '006', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2669', 'Arizpe', '006', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2670', 'Cunduacán', '006', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2671', 'Bustamante', '006', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2672', 'Calpulalpan', '006', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2673', 'Acultzingo', '006', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2674', 'Buctzotz', '006', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2675', 'Cañitas de Felipe Pescador', '006', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2676', 'Rincón de Romos', '007', '1');
INSERT INTO `system_ubicacion_municipios` VALUES ('2677', 'Palizada', '007', '4');
INSERT INTO `system_ubicacion_municipios` VALUES ('2678', 'Cuatro Ciénegas', '007', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2679', 'Manzanillo', '007', '6');
INSERT INTO `system_ubicacion_municipios` VALUES ('2680', 'Amatenango del Valle', '007', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2681', 'Balleza', '007', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2682', 'Iztapalapa', '007', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2683', 'Gómez Palacio', '007', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2684', 'Celaya', '007', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2685', 'Arcelia', '007', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2686', 'Almoloya', '007', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2687', 'San Juanito de Escobedo', '007', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2688', 'Amanalco', '007', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2689', 'Aporo', '007', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2690', 'Cuernavaca', '007', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2691', 'Jala', '007', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2692', 'Aramberri', '007', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2693', 'Asunción Ocotlán', '007', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2694', 'Ahuatlán', '007', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2695', 'Ezequiel Montes', '007', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2696', 'Lázaro Cárdenas', '007', '23');
INSERT INTO `system_ubicacion_municipios` VALUES ('2697', 'Cedral', '007', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2698', 'Choix', '007', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2699', 'Atil', '007', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2700', 'Emiliano Zapata', '007', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2701', 'Camargo', '007', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2702', 'El Carmen Tequexquitla', '007', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2703', 'Camarón de Tejeda', '007', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2704', 'Cacalchén', '007', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2705', 'Concepción del Oro', '007', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2706', 'San José de Gracia', '008', '1');
INSERT INTO `system_ubicacion_municipios` VALUES ('2707', 'Los Cabos', '008', '3');
INSERT INTO `system_ubicacion_municipios` VALUES ('2708', 'Tenabo', '008', '4');
INSERT INTO `system_ubicacion_municipios` VALUES ('2709', 'Escobedo', '008', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2710', 'Minatitlán', '008', '6');
INSERT INTO `system_ubicacion_municipios` VALUES ('2711', 'Angel Albino Corzo', '008', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2712', 'Batopilas', '008', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2713', 'La Magdalena Contreras', '008', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2714', 'Guadalupe Victoria', '008', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2715', 'Manuel Doblado', '008', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2716', 'Atenango del Río', '008', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2717', 'Apan', '008', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2718', 'Arandas', '008', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2719', 'Amatepec', '008', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2720', 'Aquila', '008', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2721', 'Emiliano Zapata', '008', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2722', 'Xalisco', '008', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2723', 'Bustamante', '008', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2724', 'Asunción Tlacolulita', '008', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2725', 'Ahuazotepec', '008', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2726', 'Huimilpan', '008', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2727', 'Solidaridad', '008', '23');
INSERT INTO `system_ubicacion_municipios` VALUES ('2728', 'Cerritos', '008', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2729', 'Elota', '008', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2730', 'Bacadéhuachi', '008', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2731', 'Huimanguillo', '008', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2732', 'Casas', '008', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2733', 'Cuapiaxtla', '008', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2734', 'Alpatláhuac', '008', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2735', 'Calotmul', '008', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2736', 'Cuauhtémoc', '008', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2737', 'Tepezalá', '009', '1');
INSERT INTO `system_ubicacion_municipios` VALUES ('2738', 'Loreto', '009', '3');
INSERT INTO `system_ubicacion_municipios` VALUES ('2739', 'Escárcega', '009', '4');
INSERT INTO `system_ubicacion_municipios` VALUES ('2740', 'Francisco I. Madero', '009', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2741', 'Tecomán', '009', '6');
INSERT INTO `system_ubicacion_municipios` VALUES ('2742', 'Arriaga', '009', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2743', 'Bocoyna', '009', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2744', 'Milpa Alta', '009', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2745', 'Guanaceví', '009', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2746', 'Comonfort', '009', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2747', 'Atlamajalcingo del Monte', '009', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2748', 'El Arenal', '009', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2749', 'El Arenal', '009', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2750', 'Amecameca', '009', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2751', 'Ario', '009', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2752', 'Huitzilac', '009', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2753', 'Del Nayar', '009', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2754', 'Cadereyta Jiménez', '009', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2755', 'Ayotzintepec', '009', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2756', 'Ahuehuetitla', '009', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2757', 'Jalpan de Serra', '009', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2758', 'Tulum', '009', '23');
INSERT INTO `system_ubicacion_municipios` VALUES ('2759', 'Cerro de San Pedro', '009', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2760', 'Escuinapa', '009', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2761', 'Bacanora', '009', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2762', 'Jalapa', '009', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2763', 'Ciudad Madero', '009', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2764', 'Cuaxomulco', '009', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2765', 'Alto Lucero de Gutiérrez Barrios', '009', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2766', 'Cansahcab', '009', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2767', 'Chalchihuites', '009', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2768', 'El Llano', '010', '1');
INSERT INTO `system_ubicacion_municipios` VALUES ('2769', 'Calakmul', '010', '4');
INSERT INTO `system_ubicacion_municipios` VALUES ('2770', 'Frontera', '010', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2771', 'Villa de Álvarez', '010', '6');
INSERT INTO `system_ubicacion_municipios` VALUES ('2772', 'Bejucal de Ocampo', '010', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2773', 'Buenaventura', '010', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2774', 'Álvaro Obregón', '010', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2775', 'Hidalgo', '010', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2776', 'Coroneo', '010', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2777', 'Atlixtac', '010', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2778', 'Atitalaquia', '010', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2779', 'Atemajac de Brizuela', '010', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2780', 'Apaxco', '010', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2781', 'Arteaga', '010', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2782', 'Jantetelco', '010', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2783', 'Rosamorada', '010', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2784', 'El Carmen', '010', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2785', 'El Barrio de la Soledad', '010', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2786', 'Ajalpan', '010', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2787', 'Landa de Matamoros', '010', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2788', 'Bacalar', '010', '23');
INSERT INTO `system_ubicacion_municipios` VALUES ('2789', 'Ciudad del Maíz', '010', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2790', 'El Fuerte', '010', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2791', 'Bacerac', '010', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2792', 'Jalpa de Méndez', '010', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2793', 'Cruillas', '010', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2794', 'Chiautempan', '010', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2795', 'Altotonga', '010', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2796', 'Cantamayec', '010', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2797', 'Fresnillo', '010', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2798', 'San Francisco de los Romo', '011', '1');
INSERT INTO `system_ubicacion_municipios` VALUES ('2799', 'Candelaria', '011', '4');
INSERT INTO `system_ubicacion_municipios` VALUES ('2800', 'General Cepeda', '011', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2801', 'Bella Vista', '011', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2802', 'Camargo', '011', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2803', 'Tláhuac', '011', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2804', 'Indé', '011', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2805', 'Cortazar', '011', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2806', 'Atoyac de Álvarez', '011', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2807', 'Atlapexco', '011', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2808', 'Atengo', '011', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2809', 'Atenco', '011', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2810', 'Briseñas', '011', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2811', 'Jiutepec', '011', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2812', 'Ruíz', '011', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2813', 'Cerralvo', '011', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2814', 'Calihualá', '011', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2815', 'Albino Zertuche', '011', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2816', 'El Marqués', '011', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2817', 'Ciudad Fernández', '011', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2818', 'Guasave', '011', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2819', 'Bacoachi', '011', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2820', 'Jonuta', '011', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2821', 'Gómez Farías', '011', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2822', 'Muñoz de Domingo Arenas', '011', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2823', 'Alvarado', '011', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2824', 'Celestún', '011', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2825', 'Trinidad García de la Cadena', '011', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2826', 'Guerrero', '012', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2827', 'Berriozábal', '012', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2828', 'Carichí', '012', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2829', 'Tlalpan', '012', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2830', 'Lerdo', '012', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2831', 'Cuerámaro', '012', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2832', 'Ayutla de los Libres', '012', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2833', 'Atotonilco el Grande', '012', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2834', 'Atenguillo', '012', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2835', 'Atizapán', '012', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2836', 'Buenavista', '012', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2837', 'Jojutla', '012', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2838', 'San Blas', '012', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2839', 'Ciénega de Flores', '012', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2840', 'Candelaria Loxicha', '012', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2841', 'Aljojuca', '012', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2842', 'Pedro Escobedo', '012', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2843', 'Tancanhuitz', '012', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2844', 'Mazatlán', '012', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2845', 'Bácum', '012', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2846', 'Macuspana', '012', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2847', 'González', '012', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2848', 'Españita', '012', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2849', 'Amatitlán', '012', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2850', 'Cenotillo', '012', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2851', 'Genaro Codina', '012', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2852', 'Hidalgo', '013', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2853', 'Bochil', '013', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2854', 'Casas Grandes', '013', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2855', 'Xochimilco', '013', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2856', 'Mapimí', '013', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2857', 'Doctor Mora', '013', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2858', 'Azoyú', '013', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2859', 'Atotonilco de Tula', '013', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2860', 'Atotonilco el Alto', '013', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2861', 'Atizapán de Zaragoza', '013', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2862', 'Carácuaro', '013', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2863', 'Jonacatepec', '013', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2864', 'San Pedro Lagunillas', '013', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2865', 'China', '013', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2866', 'Ciénega de Zimatlán', '013', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2867', 'Altepexi', '013', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2868', 'Peñamiller', '013', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2869', 'Ciudad Valles', '013', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2870', 'Mocorito', '013', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2871', 'Banámichi', '013', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2872', 'Nacajuca', '013', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2873', 'Güémez', '013', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2874', 'Huamantla', '013', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2875', 'Naranjos Amatlán', '013', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2876', 'Conkal', '013', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2877', 'General Enrique Estrada', '013', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2878', 'Jiménez', '014', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2879', 'El Bosque', '014', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2880', 'Coronado', '014', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2881', 'Benito Juárez', '014', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2882', 'Mezquital', '014', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2883', 'Dolores Hidalgo Cuna de la Independencia Nacional', '014', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2884', 'Benito Juárez', '014', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2885', 'Calnali', '014', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2886', 'Atoyac', '014', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2887', 'Atlacomulco', '014', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2888', 'Coahuayana', '014', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2889', 'Mazatepec', '014', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2890', 'Santa María del Oro', '014', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2891', 'Doctor Arroyo', '014', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2892', 'Ciudad Ixtepec', '014', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2893', 'Amixtlán', '014', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2894', 'Querétaro', '014', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2895', 'Coxcatlán', '014', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2896', 'Rosario', '014', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2897', 'Baviácora', '014', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2898', 'Paraíso', '014', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2899', 'Guerrero', '014', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2900', 'Hueyotlipan', '014', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2901', 'Amatlán de los Reyes', '014', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2902', 'Cuncunul', '014', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2903', 'General Francisco R. Murguía', '014', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2904', 'Juárez', '015', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2905', 'Cacahoatán', '015', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2906', 'Coyame del Sotol', '015', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2907', 'Cuauhtémoc', '015', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2908', 'Nazas', '015', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2909', 'Guanajuato', '015', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2910', 'Buenavista de Cuéllar', '015', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2911', 'Cardonal', '015', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2912', 'Autlán de Navarro', '015', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2913', 'Atlautla', '015', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2914', 'Coalcomán de Vázquez Pallares', '015', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2915', 'Miacatlán', '015', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2916', 'Santiago Ixcuintla', '015', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2917', 'Doctor Coss', '015', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2918', 'Coatecas Altas', '015', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2919', 'Amozoc', '015', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2920', 'San Joaquín', '015', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2921', 'Charcas', '015', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2922', 'Salvador Alvarado', '015', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2923', 'Bavispe', '015', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2924', 'Tacotalpa', '015', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2925', 'Gustavo Díaz Ordaz', '015', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2926', 'Ixtacuixtla de Mariano Matamoros', '015', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2927', 'Angel R. Cabada', '015', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2928', 'Cuzamá', '015', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2929', 'El Plateado de Joaquín Amaro', '015', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2930', 'Lamadrid', '016', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2931', 'Catazajá', '016', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2932', 'La Cruz', '016', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2933', 'Miguel Hidalgo', '016', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2934', 'Nombre de Dios', '016', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2935', 'Huanímaro', '016', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2936', 'Coahuayutla de José María Izazaga', '016', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2937', 'Cuautepec de Hinojosa', '016', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2938', 'Ayotlán', '016', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2939', 'Axapusco', '016', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2940', 'Coeneo', '016', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2941', 'Ocuituco', '016', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2942', 'Tecuala', '016', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2943', 'Doctor González', '016', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2944', 'Coicoyán de las Flores', '016', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2945', 'Aquixtla', '016', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2946', 'San Juan del Río', '016', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2947', 'Ebano', '016', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2948', 'San Ignacio', '016', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2949', 'Benjamín Hill', '016', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2950', 'Teapa', '016', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2951', 'Hidalgo', '016', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2952', 'Ixtenco', '016', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2953', 'La Antigua', '016', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2954', 'Chacsinkín', '016', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2955', 'General Pánfilo Natera', '016', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2956', 'Matamoros', '017', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2957', 'Cintalapa', '017', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2958', 'Cuauhtémoc', '017', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2959', 'Venustiano Carranza', '017', '9');
INSERT INTO `system_ubicacion_municipios` VALUES ('2960', 'Ocampo', '017', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2961', 'Irapuato', '017', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2962', 'Cocula', '017', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2963', 'Chapantongo', '017', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2964', 'Ayutla', '017', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2965', 'Ayapango', '017', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2966', 'Contepec', '017', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2967', 'Puente de Ixtla', '017', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2968', 'Tepic', '017', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2969', 'Galeana', '017', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2970', 'La Compañía', '017', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2971', 'Atempan', '017', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2972', 'Tequisquiapan', '017', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2973', 'Guadalcázar', '017', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2974', 'Sinaloa', '017', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('2975', 'Caborca', '017', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('2976', 'Tenosique', '017', '27');
INSERT INTO `system_ubicacion_municipios` VALUES ('2977', 'Jaumave', '017', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('2978', 'Mazatecochco de José María Morelos', '017', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('2979', 'Apazapan', '017', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('2980', 'Chankom', '017', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('2981', 'Guadalupe', '017', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('2982', 'Monclova', '018', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('2983', 'Coapilla', '018', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('2984', 'Cusihuiriachi', '018', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('2985', 'El Oro', '018', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('2986', 'Jaral del Progreso', '018', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('2987', 'Copala', '018', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('2988', 'Chapulhuacán', '018', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('2989', 'La Barca', '018', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('2990', 'Calimaya', '018', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('2991', 'Copándaro', '018', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('2992', 'Temixco', '018', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('2993', 'Tuxpan', '018', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('2994', 'García', '018', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('2995', 'Concepción Buenavista', '018', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('2996', 'Atexcal', '018', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('2997', 'Tolimán', '018', '22');
INSERT INTO `system_ubicacion_municipios` VALUES ('2998', 'Huehuetlán', '018', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('2999', 'Navolato', '018', '25');
INSERT INTO `system_ubicacion_municipios` VALUES ('3000', 'Cajeme', '018', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3001', 'Jiménez', '018', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3002', 'Contla de Juan Cuamatzi', '018', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3003', 'Aquila', '018', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3004', 'Chapab', '018', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3005', 'Huanusco', '018', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3006', 'Morelos', '019', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3007', 'Comitán de Domínguez', '019', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3008', 'Chihuahua', '019', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3009', 'Otáez', '019', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3010', 'Jerécuaro', '019', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3011', 'Copalillo', '019', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3012', 'Chilcuautla', '019', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3013', 'Bolaños', '019', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3014', 'Capulhuac', '019', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3015', 'Cotija', '019', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3016', 'Tepalcingo', '019', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3017', 'La Yesca', '019', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('3018', 'San Pedro Garza García', '019', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3019', 'Concepción Pápalo', '019', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3020', 'Atlixco', '019', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3021', 'Lagunillas', '019', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3022', 'Cananea', '019', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3023', 'Llera', '019', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3024', 'Tepetitla de Lardizábal', '019', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3025', 'Astacinga', '019', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3026', 'Chemax', '019', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3027', 'Jalpa', '019', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3028', 'Múzquiz', '020', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3029', 'La Concordia', '020', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3030', 'Chínipas', '020', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3031', 'Pánuco de Coronado', '020', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3032', 'León', '020', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3033', 'Copanatoyac', '020', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3034', 'Eloxochitlán', '020', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3035', 'Cabo Corrientes', '020', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3036', 'Coacalco de Berriozábal', '020', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3037', 'Cuitzeo', '020', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3038', 'Tepoztlán', '020', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3039', 'Bahía de Banderas', '020', '18');
INSERT INTO `system_ubicacion_municipios` VALUES ('3040', 'General Bravo', '020', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3041', 'Constancia del Rosario', '020', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3042', 'Atoyatempan', '020', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3043', 'Matehuala', '020', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3044', 'Carbó', '020', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3045', 'Mainero', '020', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3046', 'Sanctórum de Lázaro Cárdenas', '020', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3047', 'Atlahuilco', '020', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3048', 'Chicxulub Pueblo', '020', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3049', 'Jerez', '020', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3050', 'Nadadores', '021', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3051', 'Copainalá', '021', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3052', 'Delicias', '021', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3053', 'Peñón Blanco', '021', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3054', 'Moroleón', '021', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3055', 'Coyuca de Benítez', '021', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3056', 'Emiliano Zapata', '021', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3057', 'Casimiro Castillo', '021', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3058', 'Coatepec Harinas', '021', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3059', 'Charapan', '021', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3060', 'Tetecala', '021', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3061', 'General Escobedo', '021', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3062', 'Cosolapa', '021', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3063', 'Atzala', '021', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3064', 'Mexquitic de Carmona', '021', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3065', 'La Colorada', '021', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3066', 'El Mante', '021', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3067', 'Nanacamilpa de Mariano Arista', '021', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3068', 'Atoyac', '021', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3069', 'Chichimilá', '021', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3070', 'Jiménez del Teul', '021', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3071', 'Nava', '022', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3072', 'Chalchihuitán', '022', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3073', 'Dr. Belisario Domínguez', '022', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3074', 'Poanas', '022', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3075', 'Ocampo', '022', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3076', 'Coyuca de Catalán', '022', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3077', 'Epazoyucan', '022', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3078', 'Cihuatlán', '022', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3079', 'Cocotitlán', '022', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3080', 'Charo', '022', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3081', 'Tetela del Volcán', '022', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3082', 'General Terán', '022', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3083', 'Cosoltepec', '022', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3084', 'Atzitzihuacán', '022', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3085', 'Moctezuma', '022', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3086', 'Cucurpe', '022', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3087', 'Matamoros', '022', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3088', 'Acuamanala de Miguel Hidalgo', '022', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3089', 'Atzacan', '022', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3090', 'Chikindzonot', '022', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3091', 'Juan Aldama', '022', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3092', 'Ocampo', '023', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3093', 'Chamula', '023', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3094', 'Galeana', '023', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3095', 'Pueblo Nuevo', '023', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3096', 'Pénjamo', '023', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3097', 'Cuajinicuilapa', '023', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3098', 'Francisco I. Madero', '023', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3099', 'Zapotlán el Grande', '023', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3100', 'Coyotepec', '023', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3101', 'Chavinda', '023', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3102', 'Tlalnepantla', '023', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3103', 'General Treviño', '023', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3104', 'Cuilápam de Guerrero', '023', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3105', 'Atzitzintla', '023', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3106', 'Rayón', '023', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3107', 'Cumpas', '023', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3108', 'Méndez', '023', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3109', 'Natívitas', '023', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3110', 'Atzalan', '023', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3111', 'Chocholá', '023', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3112', 'Juchipila', '023', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3113', 'Parras', '024', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3114', 'Chanal', '024', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3115', 'Santa Isabel', '024', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3116', 'Rodeo', '024', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3117', 'Pueblo Nuevo', '024', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3118', 'Cualác', '024', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3119', 'Huasca de Ocampo', '024', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3120', 'Cocula', '024', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3121', 'Cuautitlán', '024', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3122', 'Cherán', '024', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3123', 'Tlaltizapán de Zapata', '024', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3124', 'General Zaragoza', '024', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3125', 'Cuyamecalco Villa de Zaragoza', '024', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3126', 'Axutla', '024', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3127', 'Rioverde', '024', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3128', 'Divisaderos', '024', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3129', 'Mier', '024', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3130', 'Panotla', '024', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3131', 'Tlaltetela', '024', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3132', 'Chumayel', '024', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3133', 'Loreto', '024', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3134', 'Piedras Negras', '025', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3135', 'Chapultenango', '025', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3136', 'Gómez Farías', '025', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3137', 'San Bernardo', '025', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3138', 'Purísima del Rincón', '025', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3139', 'Cuautepec', '025', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3140', 'Huautla', '025', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3141', 'Colotlán', '025', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3142', 'Chalco', '025', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3143', 'Chilchota', '025', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3144', 'Tlaquiltenango', '025', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3145', 'General Zuazua', '025', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3146', 'Chahuites', '025', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3147', 'Ayotoxco de Guerrero', '025', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3148', 'Salinas', '025', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3149', 'Empalme', '025', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3150', 'Miguel Alemán', '025', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3151', 'San Pablo del Monte', '025', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3152', 'Ayahualulco', '025', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3153', 'Dzán', '025', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3154', 'Luis Moya', '025', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3155', 'Progreso', '026', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3156', 'Chenalhó', '026', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3157', 'Gran Morelos', '026', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3158', 'San Dimas', '026', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3159', 'Romita', '026', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3160', 'Cuetzala del Progreso', '026', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3161', 'Huazalingo', '026', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3162', 'Concepción de Buenos Aires', '026', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3163', 'Chapa de Mota', '026', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3164', 'Chinicuila', '026', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3165', 'Tlayacapan', '026', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3166', 'Guadalupe', '026', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3167', 'Chalcatongo de Hidalgo', '026', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3168', 'Calpan', '026', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3169', 'San Antonio', '026', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3170', 'Etchojoa', '026', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3171', 'Miquihuana', '026', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3172', 'Santa Cruz Tlaxcala', '026', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3173', 'Banderilla', '026', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3174', 'Dzemul', '026', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3175', 'Mazapil', '026', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3176', 'Ramos Arizpe', '027', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3177', 'Chiapa de Corzo', '027', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3178', 'Guachochi', '027', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3179', 'San Juan de Guadalupe', '027', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3180', 'Salamanca', '027', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3181', 'Cutzamala de Pinzón', '027', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3182', 'Huehuetla', '027', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3183', 'Cuautitlán de García Barragán', '027', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3184', 'Chapultepec', '027', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3185', 'Chucándiro', '027', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3186', 'Totolapan', '027', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3187', 'Los Herreras', '027', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3188', 'Chiquihuitlán de Benito Juárez', '027', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3189', 'Caltepec', '027', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3190', 'San Ciro de Acosta', '027', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3191', 'Fronteras', '027', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3192', 'Nuevo Laredo', '027', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3193', 'Tenancingo', '027', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3194', 'Benito Juárez', '027', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3195', 'Dzidzantún', '027', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3196', 'Melchor Ocampo', '027', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3197', 'Sabinas', '028', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3198', 'Chiapilla', '028', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3199', 'Guadalupe', '028', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3200', 'San Juan del Río', '028', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3201', 'Salvatierra', '028', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3202', 'Chilapa de Álvarez', '028', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3203', 'Huejutla de Reyes', '028', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3204', 'Cuautla', '028', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3205', 'Chiautla', '028', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3206', 'Churintzio', '028', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3207', 'Xochitepec', '028', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3208', 'Higueras', '028', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3209', 'Heroica Ciudad de Ejutla de Crespo', '028', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3210', 'Camocuautla', '028', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3211', 'San Luis Potosí', '028', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3212', 'Granados', '028', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3213', 'Nuevo Morelos', '028', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3214', 'Teolocholco', '028', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3215', 'Boca del Río', '028', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3216', 'Dzilam de Bravo', '028', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3217', 'Mezquital del Oro', '028', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3218', 'Sacramento', '029', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3219', 'Chicoasén', '029', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3220', 'Guadalupe y Calvo', '029', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3221', 'San Luis del Cordero', '029', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3222', 'San Diego de la Unión', '029', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3223', 'Chilpancingo de los Bravo', '029', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3224', 'Huichapan', '029', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3225', 'Cuquío', '029', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3226', 'Chicoloapan', '029', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3227', 'Churumuco', '029', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3228', 'Yautepec', '029', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3229', 'Hualahuises', '029', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3230', 'Eloxochitlán de Flores Magón', '029', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3231', 'Caxhuacan', '029', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3232', 'San Martín Chalchicuautla', '029', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3233', 'Guaymas', '029', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3234', 'Ocampo', '029', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3235', 'Tepeyanco', '029', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3236', 'Calcahualco', '029', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3237', 'Dzilam González', '029', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3238', 'Miguel Auza', '029', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3239', 'Saltillo', '030', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3240', 'Chicomuselo', '030', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3241', 'Guazapares', '030', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3242', 'San Pedro del Gallo', '030', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3243', 'San Felipe', '030', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3244', 'Florencio Villarreal', '030', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3245', 'Ixmiquilpan', '030', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3246', 'Chapala', '030', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3247', 'Chiconcuac', '030', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3248', 'Ecuandureo', '030', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3249', 'Yecapixtla', '030', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3250', 'Iturbide', '030', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3251', 'El Espinal', '030', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3252', 'Coatepec', '030', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3253', 'San Nicolás Tolentino', '030', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3254', 'Hermosillo', '030', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3255', 'Padilla', '030', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3256', 'Terrenate', '030', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3257', 'Camerino Z. Mendoza', '030', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3258', 'Dzitás', '030', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3259', 'Momax', '030', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3260', 'San Buenaventura', '031', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3261', 'Chilón', '031', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3262', 'Guerrero', '031', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3263', 'Santa Clara', '031', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3264', 'San Francisco del Rincón', '031', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3265', 'General Canuto A. Neri', '031', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3266', 'Jacala de Ledezma', '031', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3267', 'Chimaltitán', '031', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3268', 'Chimalhuacán', '031', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3269', 'Epitacio Huerta', '031', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3270', 'Zacatepec', '031', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3271', 'Juárez', '031', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3272', 'Tamazulápam del Espíritu Santo', '031', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3273', 'Coatzingo', '031', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3274', 'Santa Catarina', '031', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3275', 'Huachinera', '031', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3276', 'Palmillas', '031', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3277', 'Tetla de la Solidaridad', '031', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3278', 'Carrillo Puerto', '031', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3279', 'Dzoncauich', '031', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3280', 'Monte Escobedo', '031', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3281', 'San Juan de Sabinas', '032', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3282', 'Escuintla', '032', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3283', 'Hidalgo del Parral', '032', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3284', 'Santiago Papasquiaro', '032', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3285', 'San José Iturbide', '032', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3286', 'General Heliodoro Castillo', '032', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3287', 'Jaltocán', '032', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3288', 'Chiquilistlán', '032', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3289', 'Donato Guerra', '032', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3290', 'Erongarícuaro', '032', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3291', 'Zacualpan', '032', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3292', 'Lampazos de Naranjo', '032', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3293', 'Fresnillo de Trujano', '032', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3294', 'Cohetzala', '032', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3295', 'Santa María del Río', '032', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3296', 'Huásabas', '032', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3297', 'Reynosa', '032', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3298', 'Tetlatlahuca', '032', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3299', 'Catemaco', '032', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3300', 'Espita', '032', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3301', 'Morelos', '032', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3302', 'San Pedro', '033', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3303', 'Francisco León', '033', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3304', 'Huejotitán', '033', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3305', 'Súchil', '033', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3306', 'San Luis de la Paz', '033', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3307', 'Huamuxtitlán', '033', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3308', 'Juárez Hidalgo', '033', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3309', 'Degollado', '033', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3310', 'Ecatepec de Morelos', '033', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3311', 'Gabriel Zamora', '033', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3312', 'Temoac', '033', '17');
INSERT INTO `system_ubicacion_municipios` VALUES ('3313', 'Linares', '033', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3314', 'Guadalupe Etla', '033', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3315', 'Cohuecan', '033', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3316', 'Santo Domingo', '033', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3317', 'Huatabampo', '033', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3318', 'Río Bravo', '033', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3319', 'Tlaxcala', '033', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3320', 'Cazones de Herrera', '033', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3321', 'Halachó', '033', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3322', 'Moyahua de Estrada', '033', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3323', 'Sierra Mojada', '034', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3324', 'Frontera Comalapa', '034', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3325', 'Ignacio Zaragoza', '034', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3326', 'Tamazula', '034', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3327', 'Santa Catarina', '034', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3328', 'Huitzuco de los Figueroa', '034', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3329', 'Lolotla', '034', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3330', 'Ejutla', '034', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3331', 'Ecatzingo', '034', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3332', 'Hidalgo', '034', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3333', 'Marín', '034', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3334', 'Guadalupe de Ramírez', '034', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3335', 'Coronango', '034', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3336', 'San Vicente Tancuayalab', '034', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3337', 'Huépac', '034', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3338', 'San Carlos', '034', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3339', 'Tlaxco', '034', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3340', 'Cerro Azul', '034', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3341', 'Hocabá', '034', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3342', 'Nochistlán de Mejía', '034', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3343', 'Torreón', '035', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3344', 'Frontera Hidalgo', '035', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3345', 'Janos', '035', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3346', 'Tepehuanes', '035', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3347', 'Santa Cruz de Juventino Rosas', '035', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3348', 'Iguala de la Independencia', '035', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3349', 'Metepec', '035', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3350', 'Encarnación de Díaz', '035', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3351', 'Huehuetoca', '035', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3352', 'La Huacana', '035', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3353', 'Melchor Ocampo', '035', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3354', 'Guelatao de Juárez', '035', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3355', 'Coxcatlán', '035', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3356', 'Soledad de Graciano Sánchez', '035', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3357', 'Imuris', '035', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3358', 'San Fernando', '035', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3359', 'Tocatlán', '035', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3360', 'Citlaltépetl', '035', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3361', 'Hoctún', '035', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3362', 'Noria de Ángeles', '035', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3363', 'Viesca', '036', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3364', 'La Grandeza', '036', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3365', 'Jiménez', '036', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3366', 'Tlahualilo', '036', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3367', 'Santiago Maravatío', '036', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3368', 'Igualapa', '036', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3369', 'San Agustín Metzquititlán', '036', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3370', 'Etzatlán', '036', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3371', 'Hueypoxtla', '036', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3372', 'Huandacareo', '036', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3373', 'Mier y Noriega', '036', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3374', 'Guevea de Humboldt', '036', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3375', 'Coyomeapan', '036', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3376', 'Tamasopo', '036', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3377', 'Magdalena', '036', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3378', 'San Nicolás', '036', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3379', 'Totolac', '036', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3380', 'Coacoatzintla', '036', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3381', 'Homún', '036', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3382', 'Ojocaliente', '036', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3383', 'Villa Unión', '037', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3384', 'Huehuetán', '037', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3385', 'Juárez', '037', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3386', 'Topia', '037', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3387', 'Silao de la Victoria', '037', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3388', 'Ixcateopan de Cuauhtémoc', '037', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3389', 'Metztitlán', '037', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3390', 'El Grullo', '037', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3391', 'Huixquilucan', '037', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3392', 'Huaniqueo', '037', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3393', 'Mina', '037', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3394', 'Mesones Hidalgo', '037', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3395', 'Coyotepec', '037', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3396', 'Tamazunchale', '037', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3397', 'Mazatán', '037', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3398', 'Soto la Marina', '037', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3399', 'Ziltlaltépec de Trinidad Sánchez Santos', '037', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3400', 'Coahuitlán', '037', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3401', 'Huhí', '037', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3402', 'Pánuco', '037', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3403', 'Zaragoza', '038', '5');
INSERT INTO `system_ubicacion_municipios` VALUES ('3404', 'Huixtán', '038', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3405', 'Julimes', '038', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3406', 'Vicente Guerrero', '038', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3407', 'Tarandacuao', '038', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3408', 'Zihuatanejo de Azueta', '038', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3409', 'Mineral del Chico', '038', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3410', 'Guachinango', '038', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3411', 'Isidro Fabela', '038', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3412', 'Huetamo', '038', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3413', 'Montemorelos', '038', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3414', 'Villa Hidalgo', '038', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3415', 'Cuapiaxtla de Madero', '038', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3416', 'Tampacán', '038', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3417', 'Moctezuma', '038', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3418', 'Tampico', '038', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3419', 'Tzompantepec', '038', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3420', 'Coatepec', '038', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3421', 'Hunucmá', '038', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3422', 'Pinos', '038', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3423', 'Huitiupán', '039', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3424', 'López', '039', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3425', 'Nuevo Ideal', '039', '10');
INSERT INTO `system_ubicacion_municipios` VALUES ('3426', 'Tarimoro', '039', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3427', 'Juan R. Escudero', '039', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3428', 'Mineral del Monte', '039', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3429', 'Guadalajara', '039', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3430', 'Ixtapaluca', '039', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3431', 'Huiramba', '039', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3432', 'Monterrey', '039', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3433', 'Heroica Ciudad de Huajuapan de León', '039', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3434', 'Cuautempan', '039', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3435', 'Tampamolón Corona', '039', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3436', 'Naco', '039', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3437', 'Tula', '039', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3438', 'Xaloztoc', '039', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3439', 'Coatzacoalcos', '039', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3440', 'Ixil', '039', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3441', 'Río Grande', '039', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3442', 'Huixtla', '040', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3443', 'Madera', '040', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3444', 'Tierra Blanca', '040', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3445', 'Leonardo Bravo', '040', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3446', 'La Misión', '040', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3447', 'Hostotipaquillo', '040', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3448', 'Ixtapan de la Sal', '040', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3449', 'Indaparapeo', '040', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3450', 'Parás', '040', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3451', 'Huautepec', '040', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3452', 'Cuautinchán', '040', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3453', 'Tamuín', '040', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3454', 'Nácori Chico', '040', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3455', 'Valle Hermoso', '040', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3456', 'Xaltocan', '040', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3457', 'Coatzintla', '040', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3458', 'Izamal', '040', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3459', 'Sain Alto', '040', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3460', 'La Independencia', '041', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3461', 'Maguarichi', '041', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3462', 'Uriangato', '041', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3463', 'Malinaltepec', '041', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3464', 'Mixquiahuala de Juárez', '041', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3465', 'Huejúcar', '041', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3466', 'Ixtapan del Oro', '041', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3467', 'Irimbo', '041', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3468', 'Pesquería', '041', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3469', 'Huautla de Jiménez', '041', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3470', 'Cuautlancingo', '041', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3471', 'Tanlajás', '041', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3472', 'Nacozari de García', '041', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3473', 'Victoria', '041', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3474', 'Papalotla de Xicohténcatl', '041', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3475', 'Coetzala', '041', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3476', 'Kanasín', '041', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3477', 'El Salvador', '041', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3478', 'Ixhuatán', '042', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3479', 'Manuel Benavides', '042', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3480', 'Valle de Santiago', '042', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3481', 'Mártir de Cuilapan', '042', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3482', 'Molango de Escamilla', '042', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3483', 'Huejuquilla el Alto', '042', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3484', 'Ixtlahuaca', '042', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3485', 'Ixtlán', '042', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3486', 'Los Ramones', '042', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3487', 'Ixtlán de Juárez', '042', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3488', 'Cuayuca de Andrade', '042', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3489', 'Tanquián de Escobedo', '042', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3490', 'Navojoa', '042', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3491', 'Villagrán', '042', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3492', 'Xicohtzinco', '042', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3493', 'Colipa', '042', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3494', 'Kantunil', '042', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3495', 'Sombrerete', '042', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3496', 'Ixtacomitán', '043', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3497', 'Matachí', '043', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3498', 'Victoria', '043', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3499', 'Metlatónoc', '043', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3500', 'Nicolás Flores', '043', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3501', 'La Huerta', '043', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3502', 'Xalatlaco', '043', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3503', 'Jacona', '043', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3504', 'Rayones', '043', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3505', 'Heroica Ciudad de Juchitán de Zaragoza', '043', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3506', 'Cuetzalan del Progreso', '043', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3507', 'Tierra Nueva', '043', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3508', 'Nogales', '043', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3509', 'Xicoténcatl', '043', '28');
INSERT INTO `system_ubicacion_municipios` VALUES ('3510', 'Yauhquemehcan', '043', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3511', 'Comapa', '043', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3512', 'Kaua', '043', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3513', 'Susticacán', '043', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3514', 'Ixtapa', '044', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3515', 'Matamoros', '044', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3516', 'Villagrán', '044', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3517', 'Mochitlán', '044', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3518', 'Nopala de Villagrán', '044', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3519', 'Ixtlahuacán de los Membrillos', '044', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3520', 'Jaltenco', '044', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3521', 'Jiménez', '044', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3522', 'Sabinas Hidalgo', '044', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3523', 'Loma Bonita', '044', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3524', 'Cuyoaco', '044', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3525', 'Vanegas', '044', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3526', 'Onavas', '044', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3527', 'Zacatelco', '044', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3528', 'Córdoba', '044', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3529', 'Kinchil', '044', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3530', 'Tabasco', '044', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3531', 'Ixtapangajoya', '045', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3532', 'Meoqui', '045', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3533', 'Xichú', '045', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3534', 'Olinalá', '045', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3535', 'Omitlán de Juárez', '045', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3536', 'Ixtlahuacán del Río', '045', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3537', 'Jilotepec', '045', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3538', 'Jiquilpan', '045', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3539', 'Salinas Victoria', '045', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3540', 'Magdalena Apasco', '045', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3541', 'Chalchicomula de Sesma', '045', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3542', 'Venado', '045', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3543', 'Opodepe', '045', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3544', 'Benito Juárez', '045', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3545', 'Cosamaloapan de Carpio', '045', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3546', 'Kopomá', '045', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3547', 'Tepechitlán', '045', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3548', 'Jiquipilas', '046', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3549', 'Morelos', '046', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3550', 'Yuriria', '046', '11');
INSERT INTO `system_ubicacion_municipios` VALUES ('3551', 'Ometepec', '046', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3552', 'San Felipe Orizatlán', '046', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3553', 'Jalostotitlán', '046', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3554', 'Jilotzingo', '046', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3555', 'Juárez', '046', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3556', 'San Nicolás de los Garza', '046', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3557', 'Magdalena Jaltepec', '046', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3558', 'Chapulco', '046', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3559', 'Villa de Arriaga', '046', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3560', 'Oquitoa', '046', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3561', 'Emiliano Zapata', '046', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3562', 'Cosautlán de Carvajal', '046', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3563', 'Mama', '046', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3564', 'Tepetongo', '046', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3565', 'Jitotol', '047', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3566', 'Moris', '047', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3567', 'Pedro Ascencio Alquisiras', '047', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3568', 'Pacula', '047', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3569', 'Jamay', '047', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3570', 'Jiquipilco', '047', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3571', 'Jungapeo', '047', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3572', 'Hidalgo', '047', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3573', 'Santa Magdalena Jicotlán', '047', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3574', 'Chiautla', '047', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3575', 'Villa de Guadalupe', '047', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3576', 'Pitiquito', '047', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3577', 'Lázaro Cárdenas', '047', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3578', 'Coscomatepec', '047', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3579', 'Maní', '047', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3580', 'Teúl de González Ortega', '047', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3581', 'Juárez', '048', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3582', 'Namiquipa', '048', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3583', 'Petatlán', '048', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3584', 'Pachuca de Soto', '048', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3585', 'Jesús María', '048', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3586', 'Jocotitlán', '048', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3587', 'Lagunillas', '048', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3588', 'Santa Catarina', '048', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3589', 'Magdalena Mixtepec', '048', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3590', 'Chiautzingo', '048', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3591', 'Villa de la Paz', '048', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3592', 'Puerto Peñasco', '048', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3593', 'La Magdalena Tlaltelulco', '048', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3594', 'Cosoleacaque', '048', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3595', 'Maxcanú', '048', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3596', 'Tlaltenango de Sánchez Román', '048', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3597', 'Larráinzar', '049', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3598', 'Nonoava', '049', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3599', 'Pilcaya', '049', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3600', 'Pisaflores', '049', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3601', 'Jilotlán de los Dolores', '049', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3602', 'Joquicingo', '049', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3603', 'Madero', '049', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3604', 'Santiago', '049', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3605', 'Magdalena Ocotlán', '049', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3606', 'Chiconcuautla', '049', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3607', 'Villa de Ramos', '049', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3608', 'Quiriego', '049', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3609', 'San Damián Texóloc', '049', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3610', 'Cotaxtla', '049', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3611', 'Mayapán', '049', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3612', 'Valparaíso', '049', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3613', 'La Libertad', '050', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3614', 'Nuevo Casas Grandes', '050', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3615', 'Pungarabato', '050', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3616', 'Progreso de Obregón', '050', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3617', 'Jocotepec', '050', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3618', 'Juchitepec', '050', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3619', 'Maravatío', '050', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3620', 'Vallecillo', '050', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3621', 'Magdalena Peñasco', '050', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3622', 'Chichiquila', '050', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3623', 'Villa de Reyes', '050', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3624', 'Rayón', '050', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3625', 'San Francisco Tetlanohcan', '050', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3626', 'Coxquihui', '050', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3627', 'Mérida', '050', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3628', 'Vetagrande', '050', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3629', 'Mapastepec', '051', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3630', 'Ocampo', '051', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3631', 'Quechultenango', '051', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3632', 'Mineral de la Reforma', '051', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3633', 'Juanacatlán', '051', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3634', 'Lerma', '051', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3635', 'Marcos Castellanos', '051', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3636', 'Villaldama', '051', '19');
INSERT INTO `system_ubicacion_municipios` VALUES ('3637', 'Magdalena Teitipac', '051', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3638', 'Chietla', '051', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3639', 'Villa Hidalgo', '051', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3640', 'Rosario', '051', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3641', 'San Jerónimo Zacualpan', '051', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3642', 'Coyutla', '051', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3643', 'Mocochá', '051', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3644', 'Villa de Cos', '051', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3645', 'Las Margaritas', '052', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3646', 'Ojinaga', '052', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3647', 'San Luis Acatlán', '052', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3648', 'San Agustín Tlaxiaca', '052', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3649', 'Juchitlán', '052', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3650', 'Malinalco', '052', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3651', 'Lázaro Cárdenas', '052', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3652', 'Magdalena Tequisistlán', '052', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3653', 'Chigmecatitlán', '052', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3654', 'Villa Juárez', '052', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3655', 'Sahuaripa', '052', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3656', 'San José Teacalco', '052', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3657', 'Cuichapa', '052', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3658', 'Motul', '052', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3659', 'Villa García', '052', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3660', 'Mazapa de Madero', '053', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3661', 'Praxedis G. Guerrero', '053', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3662', 'San Marcos', '053', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3663', 'San Bartolo Tutotepec', '053', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3664', 'Lagos de Moreno', '053', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3665', 'Melchor Ocampo', '053', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3666', 'Morelia', '053', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3667', 'Magdalena Tlacotepec', '053', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3668', 'Chignahuapan', '053', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3669', 'Axtla de Terrazas', '053', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3670', 'San Felipe de Jesús', '053', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3671', 'San Juan Huactzinco', '053', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3672', 'Cuitláhuac', '053', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3673', 'Muna', '053', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3674', 'Villa González Ortega', '053', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3675', 'Mazatán', '054', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3676', 'Riva Palacio', '054', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3677', 'San Miguel Totolapan', '054', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3678', 'San Salvador', '054', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3679', 'El Limón', '054', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3680', 'Metepec', '054', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3681', 'Morelos', '054', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3682', 'Magdalena Zahuatlán', '054', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3683', 'Chignautla', '054', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3684', 'Xilitla', '054', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3685', 'San Javier', '054', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3686', 'San Lorenzo Axocomanitla', '054', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3687', 'Chacaltianguis', '054', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3688', 'Muxupip', '054', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3689', 'Villa Hidalgo', '054', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3690', 'Metapa', '055', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3691', 'Rosales', '055', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3692', 'Taxco de Alarcón', '055', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3693', 'Santiago de Anaya', '055', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3694', 'Magdalena', '055', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3695', 'Mexicaltzingo', '055', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3696', 'Múgica', '055', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3697', 'Mariscala de Juárez', '055', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3698', 'Chila', '055', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3699', 'Zaragoza', '055', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3700', 'San Luis Río Colorado', '055', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3701', 'San Lucas Tecopilco', '055', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3702', 'Chalma', '055', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3703', 'Opichén', '055', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3704', 'Villanueva', '055', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3705', 'Mitontic', '056', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3706', 'Rosario', '056', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3707', 'Tecoanapa', '056', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3708', 'Santiago Tulantepec de Lugo Guerrero', '056', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3709', 'Santa María del Oro', '056', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3710', 'Morelos', '056', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3711', 'Nahuatzen', '056', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3712', 'Mártires de Tacubaya', '056', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3713', 'Chila de la Sal', '056', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3714', 'Villa de Arista', '056', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3715', 'San Miguel de Horcasitas', '056', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3716', 'Santa Ana Nopalucan', '056', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3717', 'Chiconamel', '056', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3718', 'Oxkutzcab', '056', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3719', 'Zacatecas', '056', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3720', 'Motozintla', '057', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3721', 'San Francisco de Borja', '057', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3722', 'Técpan de Galeana', '057', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3723', 'Singuilucan', '057', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3724', 'La Manzanilla de la Paz', '057', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3725', 'Naucalpan de Juárez', '057', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3726', 'Nocupétaro', '057', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3727', 'Matías Romero Avendaño', '057', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3728', 'Honey', '057', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3729', 'Matlapa', '057', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3730', 'San Pedro de la Cueva', '057', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3731', 'Santa Apolonia Teacalco', '057', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3732', 'Chiconquiaco', '057', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3733', 'Panabá', '057', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3734', 'Trancoso', '057', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3735', 'Nicolás Ruíz', '058', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3736', 'San Francisco de Conchos', '058', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3737', 'Teloloapan', '058', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3738', 'Tasquillo', '058', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3739', 'Mascota', '058', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3740', 'Nezahualcóyotl', '058', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3741', 'Nuevo Parangaricutiro', '058', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3742', 'Mazatlán Villa de Flores', '058', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3743', 'Chilchotla', '058', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3744', 'El Naranjo', '058', '24');
INSERT INTO `system_ubicacion_municipios` VALUES ('3745', 'Santa Ana', '058', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3746', 'Santa Catarina Ayometla', '058', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3747', 'Chicontepec', '058', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3748', 'Peto', '058', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3749', 'Santa María de la Paz', '058', '32');
INSERT INTO `system_ubicacion_municipios` VALUES ('3750', 'Ocosingo', '059', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3751', 'San Francisco del Oro', '059', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3752', 'Tepecoacuilco de Trujano', '059', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3753', 'Tecozautla', '059', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3754', 'Mazamitla', '059', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3755', 'Nextlalpan', '059', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3756', 'Nuevo Urecho', '059', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3757', 'Miahuatlán de Porfirio Díaz', '059', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3758', 'Chinantla', '059', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3759', 'Santa Cruz', '059', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3760', 'Santa Cruz Quilehtla', '059', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3761', 'Chinameca', '059', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3762', 'Progreso', '059', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3763', 'Ocotepec', '060', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3764', 'Santa Bárbara', '060', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3765', 'Tetipac', '060', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3766', 'Tenango de Doria', '060', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3767', 'Mexticacán', '060', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3768', 'Nicolás Romero', '060', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3769', 'Numarán', '060', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3770', 'Mixistlán de la Reforma', '060', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3771', 'Domingo Arenas', '060', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3772', 'Sáric', '060', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3773', 'Santa Isabel Xiloxoxtla', '060', '29');
INSERT INTO `system_ubicacion_municipios` VALUES ('3774', 'Chinampa de Gorostiza', '060', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3775', 'Quintana Roo', '060', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3776', 'Ocozocoautla de Espinosa', '061', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3777', 'Satevó', '061', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3778', 'Tixtla de Guerrero', '061', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3779', 'Tepeapulco', '061', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3780', 'Mezquitic', '061', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3781', 'Nopaltepec', '061', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3782', 'Ocampo', '061', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3783', 'Monjas', '061', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3784', 'Eloxochitlán', '061', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3785', 'Soyopa', '061', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3786', 'Las Choapas', '061', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3787', 'Río Lagartos', '061', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3788', 'Ostuacán', '062', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3789', 'Saucillo', '062', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3790', 'Tlacoachistlahuaca', '062', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3791', 'Tepehuacán de Guerrero', '062', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3792', 'Mixtlán', '062', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3793', 'Ocoyoacac', '062', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3794', 'Pajacuarán', '062', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3795', 'Natividad', '062', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3796', 'Epatlán', '062', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3797', 'Suaqui Grande', '062', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3798', 'Chocamán', '062', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3799', 'Sacalum', '062', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3800', 'Osumacinta', '063', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3801', 'Temósachic', '063', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3802', 'Tlacoapa', '063', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3803', 'Tepeji del Río de Ocampo', '063', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3804', 'Ocotlán', '063', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3805', 'Ocuilan', '063', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3806', 'Panindícuaro', '063', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3807', 'Nazareno Etla', '063', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3808', 'Esperanza', '063', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3809', 'Tepache', '063', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3810', 'Chontla', '063', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3811', 'Samahil', '063', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3812', 'Oxchuc', '064', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3813', 'El Tule', '064', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3814', 'Tlalchapa', '064', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3815', 'Tepetitlán', '064', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3816', 'Ojuelos de Jalisco', '064', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3817', 'El Oro', '064', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3818', 'Parácuaro', '064', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3819', 'Nejapa de Madero', '064', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3820', 'Francisco Z. Mena', '064', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3821', 'Trincheras', '064', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3822', 'Chumatlán', '064', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3823', 'Sanahcat', '064', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3824', 'Palenque', '065', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3825', 'Urique', '065', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3826', 'Tlalixtaquilla de Maldonado', '065', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3827', 'Tetepango', '065', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3828', 'Pihuamo', '065', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3829', 'Otumba', '065', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3830', 'Paracho', '065', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3831', 'Ixpantepec Nieves', '065', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3832', 'General Felipe Ángeles', '065', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3833', 'Tubutama', '065', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3834', 'Emiliano Zapata', '065', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3835', 'San Felipe', '065', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3836', 'Pantelhó', '066', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3837', 'Uruachi', '066', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3838', 'Tlapa de Comonfort', '066', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3839', 'Villa de Tezontepec', '066', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3840', 'Poncitlán', '066', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3841', 'Otzoloapan', '066', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3842', 'Pátzcuaro', '066', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3843', 'Santiago Niltepec', '066', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3844', 'Guadalupe', '066', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3845', 'Ures', '066', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3846', 'Espinal', '066', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3847', 'Santa Elena', '066', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3848', 'Pantepec', '067', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3849', 'Valle de Zaragoza', '067', '8');
INSERT INTO `system_ubicacion_municipios` VALUES ('3850', 'Tlapehuala', '067', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3851', 'Tezontepec de Aldama', '067', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3852', 'Puerto Vallarta', '067', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3853', 'Otzolotepec', '067', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3854', 'Penjamillo', '067', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3855', 'Oaxaca de Juárez', '067', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3856', 'Guadalupe Victoria', '067', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3857', 'Villa Hidalgo', '067', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3858', 'Filomeno Mata', '067', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3859', 'Seyé', '067', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3860', 'Pichucalco', '068', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3861', 'La Unión de Isidoro Montes de Oca', '068', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3862', 'Tianguistengo', '068', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3863', 'Villa Purificación', '068', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3864', 'Ozumba', '068', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3865', 'Peribán', '068', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3866', 'Ocotlán de Morelos', '068', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3867', 'Hermenegildo Galeana', '068', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3868', 'Villa Pesqueira', '068', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3869', 'Fortín', '068', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3870', 'Sinanché', '068', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3871', 'Pijijiapan', '069', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3872', 'Xalpatláhuac', '069', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3873', 'Tizayuca', '069', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3874', 'Quitupan', '069', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3875', 'Papalotla', '069', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3876', 'La Piedad', '069', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3877', 'La Pe', '069', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3878', 'Huaquechula', '069', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3879', 'Yécora', '069', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3880', 'Gutiérrez Zamora', '069', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3881', 'Sotuta', '069', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3882', 'El Porvenir', '070', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3883', 'Xochihuehuetlán', '070', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3884', 'Tlahuelilpan', '070', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3885', 'El Salto', '070', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3886', 'La Paz', '070', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3887', 'Purépero', '070', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3888', 'Pinotepa de Don Luis', '070', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3889', 'Huatlatlauca', '070', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3890', 'General Plutarco Elías Calles', '070', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3891', 'Hidalgotitlán', '070', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3892', 'Sucilá', '070', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3893', 'Villa Comaltitlán', '071', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3894', 'Xochistlahuaca', '071', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3895', 'Tlahuiltepa', '071', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3896', 'San Cristóbal de la Barranca', '071', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3897', 'Polotitlán', '071', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3898', 'Puruándiro', '071', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3899', 'Pluma Hidalgo', '071', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3900', 'Huauchinango', '071', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3901', 'Benito Juárez', '071', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3902', 'Huatusco', '071', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3903', 'Sudzal', '071', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3904', 'Pueblo Nuevo Solistahuacán', '072', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3905', 'Zapotitlán Tablas', '072', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3906', 'Tlanalapa', '072', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3907', 'San Diego de Alejandría', '072', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3908', 'Rayón', '072', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3909', 'Queréndaro', '072', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3910', 'San José del Progreso', '072', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3911', 'Huehuetla', '072', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3912', 'San Ignacio Río Muerto', '072', '26');
INSERT INTO `system_ubicacion_municipios` VALUES ('3913', 'Huayacocotla', '072', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3914', 'Suma', '072', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3915', 'Rayón', '073', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3916', 'Zirándaro', '073', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3917', 'Tlanchinol', '073', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3918', 'San Juan de los Lagos', '073', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3919', 'San Antonio la Isla', '073', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3920', 'Quiroga', '073', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3921', 'Putla Villa de Guerrero', '073', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3922', 'Huehuetlán el Chico', '073', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3923', 'Hueyapan de Ocampo', '073', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3924', 'Tahdziú', '073', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3925', 'Reforma', '074', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3926', 'Zitlala', '074', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3927', 'Tlaxcoapan', '074', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3928', 'San Julián', '074', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3929', 'San Felipe del Progreso', '074', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3930', 'Cojumatlán de Régules', '074', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3931', 'Santa Catarina Quioquitani', '074', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3932', 'Huejotzingo', '074', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3933', 'Huiloapan de Cuauhtémoc', '074', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3934', 'Tahmek', '074', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3935', 'Las Rosas', '075', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3936', 'Eduardo Neri', '075', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3937', 'Tolcayuca', '075', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3938', 'San Marcos', '075', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3939', 'San Martín de las Pirámides', '075', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3940', 'Los Reyes', '075', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3941', 'Reforma de Pineda', '075', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3942', 'Hueyapan', '075', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3943', 'Ignacio de la Llave', '075', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3944', 'Teabo', '075', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3945', 'Sabanilla', '076', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3946', 'Acatepec', '076', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3947', 'Tula de Allende', '076', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3948', 'San Martín de Bolaños', '076', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3949', 'San Mateo Atenco', '076', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3950', 'Sahuayo', '076', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3951', 'La Reforma', '076', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3952', 'Hueytamalco', '076', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3953', 'Ilamatlán', '076', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3954', 'Tecoh', '076', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3955', 'Salto de Agua', '077', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3956', 'Marquelia', '077', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3957', 'Tulancingo de Bravo', '077', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3958', 'San Martín Hidalgo', '077', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3959', 'San Simón de Guerrero', '077', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3960', 'San Lucas', '077', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3961', 'Reyes Etla', '077', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3962', 'Hueytlalpan', '077', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3963', 'Isla', '077', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3964', 'Tekal de Venegas', '077', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3965', 'San Cristóbal de las Casas', '078', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3966', 'Cochoapa el Grande', '078', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3967', 'Xochiatipan', '078', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3968', 'San Miguel el Alto', '078', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3969', 'Santo Tomás', '078', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3970', 'Santa Ana Maya', '078', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3971', 'Rojas de Cuauhtémoc', '078', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3972', 'Huitzilan de Serdán', '078', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3973', 'Ixcatepec', '078', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3974', 'Tekantó', '078', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3975', 'San Fernando', '079', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3976', 'José Joaquín de Herrera', '079', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3977', 'Xochicoatlán', '079', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3978', 'Gómez Farías', '079', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3979', 'Soyaniquilpan de Juárez', '079', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3980', 'Salvador Escalante', '079', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3981', 'Salina Cruz', '079', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3982', 'Huitziltepec', '079', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3983', 'Ixhuacán de los Reyes', '079', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3984', 'Tekax', '079', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3985', 'Siltepec', '080', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3986', 'Juchitán', '080', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3987', 'Yahualica', '080', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3988', 'San Sebastián del Oeste', '080', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3989', 'Sultepec', '080', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('3990', 'Senguio', '080', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('3991', 'San Agustín Amatengo', '080', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('3992', 'Atlequizayan', '080', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('3993', 'Ixhuatlán del Café', '080', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('3994', 'Tekit', '080', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('3995', 'Simojovel', '081', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('3996', 'Iliatenco', '081', '12');
INSERT INTO `system_ubicacion_municipios` VALUES ('3997', 'Zacualtipán de Ángeles', '081', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('3998', 'Santa María de los Ángeles', '081', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('3999', 'Tecámac', '081', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4000', 'Susupuato', '081', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4001', 'San Agustín Atenango', '081', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4002', 'Ixcamilpa de Guerrero', '081', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4003', 'Ixhuatlancillo', '081', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4004', 'Tekom', '081', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4005', 'Sitalá', '082', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4006', 'Zapotlán de Juárez', '082', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('4007', 'Sayula', '082', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4008', 'Tejupilco', '082', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4009', 'Tacámbaro', '082', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4010', 'San Agustín Chayuco', '082', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4011', 'Ixcaquixtla', '082', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4012', 'Ixhuatlán del Sureste', '082', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4013', 'Telchac Pueblo', '082', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4014', 'Socoltenango', '083', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4015', 'Zempoala', '083', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('4016', 'Tala', '083', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4017', 'Temamatla', '083', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4018', 'Tancítaro', '083', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4019', 'San Agustín de las Juntas', '083', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4020', 'Ixtacamaxtitlán', '083', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4021', 'Ixhuatlán de Madero', '083', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4022', 'Telchac Puerto', '083', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4023', 'Solosuchiapa', '084', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4024', 'Zimapán', '084', '13');
INSERT INTO `system_ubicacion_municipios` VALUES ('4025', 'Talpa de Allende', '084', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4026', 'Temascalapa', '084', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4027', 'Tangamandapio', '084', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4028', 'San Agustín Etla', '084', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4029', 'Ixtepec', '084', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4030', 'Ixmatlahuacan', '084', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4031', 'Temax', '084', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4032', 'Soyaló', '085', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4033', 'Tamazula de Gordiano', '085', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4034', 'Temascalcingo', '085', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4035', 'Tangancícuaro', '085', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4036', 'San Agustín Loxicha', '085', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4037', 'Izúcar de Matamoros', '085', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4038', 'Ixtaczoquitlán', '085', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4039', 'Temozón', '085', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4040', 'Suchiapa', '086', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4041', 'Tapalpa', '086', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4042', 'Temascaltepec', '086', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4043', 'Tanhuato', '086', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4044', 'San Agustín Tlacotepec', '086', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4045', 'Jalpan', '086', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4046', 'Jalacingo', '086', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4047', 'Tepakán', '086', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4048', 'Suchiate', '087', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4049', 'Tecalitlán', '087', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4050', 'Temoaya', '087', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4051', 'Taretan', '087', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4052', 'San Agustín Yatareni', '087', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4053', 'Jolalpan', '087', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4054', 'Xalapa', '087', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4055', 'Tetiz', '087', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4056', 'Sunuapa', '088', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4057', 'Tecolotlán', '088', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4058', 'Tenancingo', '088', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4059', 'Tarímbaro', '088', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4060', 'San Andrés Cabecera Nueva', '088', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4061', 'Jonotla', '088', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4062', 'Jalcomulco', '088', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4063', 'Teya', '088', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4064', 'Tapachula', '089', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4065', 'Techaluta de Montenegro', '089', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4066', 'Tenango del Aire', '089', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4067', 'Tepalcatepec', '089', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4068', 'San Andrés Dinicuiti', '089', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4069', 'Jopala', '089', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4070', 'Jáltipan', '089', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4071', 'Ticul', '089', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4072', 'Tapalapa', '090', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4073', 'Tenamaxtlán', '090', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4074', 'Tenango del Valle', '090', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4075', 'Tingambato', '090', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4076', 'San Andrés Huaxpaltepec', '090', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4077', 'Juan C. Bonilla', '090', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4078', 'Jamapa', '090', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4079', 'Timucuy', '090', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4080', 'Tapilula', '091', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4081', 'Teocaltiche', '091', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4082', 'Teoloyucan', '091', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4083', 'Tingüindín', '091', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4084', 'San Andrés Huayápam', '091', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4085', 'Juan Galindo', '091', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4086', 'Jesús Carranza', '091', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4087', 'Tinum', '091', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4088', 'Tecpatán', '092', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4089', 'Teocuitatlán de Corona', '092', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4090', 'Teotihuacán', '092', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4091', 'Tiquicheo de Nicolás Romero', '092', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4092', 'San Andrés Ixtlahuaca', '092', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4093', 'Juan N. Méndez', '092', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4094', 'Xico', '092', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4095', 'Tixcacalcupul', '092', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4096', 'Tenejapa', '093', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4097', 'Tepatitlán de Morelos', '093', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4098', 'Tepetlaoxtoc', '093', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4099', 'Tlalpujahua', '093', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4100', 'San Andrés Lagunas', '093', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4101', 'Lafragua', '093', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4102', 'Jilotepec', '093', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4103', 'Tixkokob', '093', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4104', 'Teopisca', '094', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4105', 'Tequila', '094', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4106', 'Tepetlixpa', '094', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4107', 'Tlazazalca', '094', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4108', 'San Andrés Nuxiño', '094', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4109', 'Libres', '094', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4110', 'Juan Rodríguez Clara', '094', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4111', 'Tixmehuac', '094', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4112', 'Teuchitlán', '095', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4113', 'Tepotzotlán', '095', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4114', 'Tocumbo', '095', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4115', 'San Andrés Paxtlán', '095', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4116', 'La Magdalena Tlatlauquitepec', '095', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4117', 'Juchique de Ferrer', '095', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4118', 'Tixpéhual', '095', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4119', 'Tila', '096', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4120', 'Tizapán el Alto', '096', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4121', 'Tequixquiac', '096', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4122', 'Tumbiscatío', '096', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4123', 'San Andrés Sinaxtla', '096', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4124', 'Mazapiltepec de Juárez', '096', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4125', 'Landero y Coss', '096', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4126', 'Tizimín', '096', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4127', 'Tonalá', '097', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4128', 'Tlajomulco de Zúñiga', '097', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4129', 'Texcaltitlán', '097', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4130', 'Turicato', '097', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4131', 'San Andrés Solaga', '097', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4132', 'Mixtla', '097', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4133', 'Lerdo de Tejada', '097', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4134', 'Tunkás', '097', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4135', 'Totolapa', '098', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4136', 'San Pedro Tlaquepaque', '098', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4137', 'Texcalyacac', '098', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4138', 'Tuxpan', '098', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4139', 'San Andrés Teotilálpam', '098', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4140', 'Molcaxac', '098', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4141', 'Magdalena', '098', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4142', 'Tzucacab', '098', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4143', 'La Trinitaria', '099', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4144', 'Tolimán', '099', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4145', 'Texcoco', '099', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4146', 'Tuzantla', '099', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4147', 'San Andrés Tepetlapa', '099', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4148', 'Cañada Morelos', '099', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4149', 'Maltrata', '099', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4150', 'Uayma', '099', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4151', 'Tumbalá', '100', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4152', 'Tomatlán', '100', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4153', 'Tezoyuca', '100', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4154', 'Tzintzuntzan', '100', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4155', 'San Andrés Yaá', '100', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4156', 'Naupan', '100', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4157', 'Manlio Fabio Altamirano', '100', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4158', 'Ucú', '100', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4159', 'Tuxtla Gutiérrez', '101', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4160', 'Tonalá', '101', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4161', 'Tianguistenco', '101', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4162', 'Tzitzio', '101', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4163', 'San Andrés Zabache', '101', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4164', 'Nauzontla', '101', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4165', 'Mariano Escobedo', '101', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4166', 'Umán', '101', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4167', 'Tuxtla Chico', '102', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4168', 'Tonaya', '102', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4169', 'Timilpan', '102', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4170', 'Uruapan', '102', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4171', 'San Andrés Zautla', '102', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4172', 'Nealtican', '102', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4173', 'Martínez de la Torre', '102', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4174', 'Valladolid', '102', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4175', 'Tuzantán', '103', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4176', 'Tonila', '103', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4177', 'Tlalmanalco', '103', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4178', 'Venustiano Carranza', '103', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4179', 'San Antonino Castillo Velasco', '103', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4180', 'Nicolás Bravo', '103', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4181', 'Mecatlán', '103', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4182', 'Xocchel', '103', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4183', 'Tzimol', '104', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4184', 'Totatiche', '104', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4185', 'Tlalnepantla de Baz', '104', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4186', 'Villamar', '104', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4187', 'San Antonino el Alto', '104', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4188', 'Nopalucan', '104', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4189', 'Mecayapan', '104', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4190', 'Yaxcabá', '104', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4191', 'Unión Juárez', '105', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4192', 'Tototlán', '105', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4193', 'Tlatlaya', '105', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4194', 'Vista Hermosa', '105', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4195', 'San Antonino Monte Verde', '105', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4196', 'Ocotepec', '105', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4197', 'Medellín', '105', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4198', 'Yaxkukul', '105', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4199', 'Venustiano Carranza', '106', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4200', 'Tuxcacuesco', '106', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4201', 'Toluca', '106', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4202', 'Yurécuaro', '106', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4203', 'San Antonio Acutla', '106', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4204', 'Ocoyucan', '106', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4205', 'Miahuatlán', '106', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4206', 'Yobaín', '106', '31');
INSERT INTO `system_ubicacion_municipios` VALUES ('4207', 'Villa Corzo', '107', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4208', 'Tuxcueca', '107', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4209', 'Tonatico', '107', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4210', 'Zacapu', '107', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4211', 'San Antonio de la Cal', '107', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4212', 'Olintla', '107', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4213', 'Las Minas', '107', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4214', 'Villaflores', '108', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4215', 'Tuxpan', '108', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4216', 'Tultepec', '108', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4217', 'Zamora', '108', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4218', 'San Antonio Huitepec', '108', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4219', 'Oriental', '108', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4220', 'Minatitlán', '108', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4221', 'Yajalón', '109', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4222', 'Unión de San Antonio', '109', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4223', 'Tultitlán', '109', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4224', 'Zináparo', '109', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4225', 'San Antonio Nanahuatípam', '109', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4226', 'Pahuatlán', '109', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4227', 'Misantla', '109', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4228', 'San Lucas', '110', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4229', 'Unión de Tula', '110', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4230', 'Valle de Bravo', '110', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4231', 'Zinapécuaro', '110', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4232', 'San Antonio Sinicahua', '110', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4233', 'Palmar de Bravo', '110', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4234', 'Mixtla de Altamirano', '110', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4235', 'Zinacantán', '111', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4236', 'Valle de Guadalupe', '111', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4237', 'Villa de Allende', '111', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4238', 'Ziracuaretiro', '111', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4239', 'San Antonio Tepetlapa', '111', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4240', 'Pantepec', '111', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4241', 'Moloacán', '111', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4242', 'San Juan Cancuc', '112', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4243', 'Valle de Juárez', '112', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4244', 'Villa del Carbón', '112', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4245', 'Zitácuaro', '112', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4246', 'San Baltazar Chichicápam', '112', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4247', 'Petlalcingo', '112', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4248', 'Naolinco', '112', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4249', 'Aldama', '113', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4250', 'San Gabriel', '113', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4251', 'Villa Guerrero', '113', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4252', 'José Sixto Verduzco', '113', '16');
INSERT INTO `system_ubicacion_municipios` VALUES ('4253', 'San Baltazar Loxicha', '113', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4254', 'Piaxtla', '113', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4255', 'Naranjal', '113', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4256', 'Benemérito de las Américas', '114', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4257', 'Villa Corona', '114', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4258', 'Villa Victoria', '114', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4259', 'San Baltazar Yatzachi el Bajo', '114', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4260', 'Puebla', '114', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4261', 'Nautla', '114', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4262', 'Maravilla Tenejapa', '115', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4263', 'Villa Guerrero', '115', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4264', 'Xonacatlán', '115', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4265', 'San Bartolo Coyotepec', '115', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4266', 'Quecholac', '115', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4267', 'Nogales', '115', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4268', 'Marqués de Comillas', '116', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4269', 'Villa Hidalgo', '116', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4270', 'Zacazonapan', '116', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4271', 'San Bartolomé Ayautla', '116', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4272', 'Quimixtlán', '116', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4273', 'Oluta', '116', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4274', 'Montecristo de Guerrero', '117', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4275', 'Cañadas de Obregón', '117', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4276', 'Zacualpan', '117', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4277', 'San Bartolomé Loxicha', '117', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4278', 'Rafael Lara Grajales', '117', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4279', 'Omealca', '117', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4280', 'San Andrés Duraznal', '118', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4281', 'Yahualica de González Gallo', '118', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4282', 'Zinacantepec', '118', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4283', 'San Bartolomé Quialana', '118', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4284', 'Los Reyes de Juárez', '118', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4285', 'Orizaba', '118', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4286', 'Santiago el Pinar', '119', '7');
INSERT INTO `system_ubicacion_municipios` VALUES ('4287', 'Zacoalco de Torres', '119', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4288', 'Zumpahuacán', '119', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4289', 'San Bartolomé Yucuañe', '119', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4290', 'San Andrés Cholula', '119', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4291', 'Otatitlán', '119', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4292', 'Zapopan', '120', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4293', 'Zumpango', '120', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4294', 'San Bartolomé Zoogocho', '120', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4295', 'San Antonio Cañada', '120', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4296', 'Oteapan', '120', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4297', 'Zapotiltic', '121', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4298', 'Cuautitlán Izcalli', '121', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4299', 'San Bartolo Soyaltepec', '121', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4300', 'San Diego la Mesa Tochimiltzingo', '121', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4301', 'Ozuluama de Mascareñas', '121', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4302', 'Zapotitlán de Vadillo', '122', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4303', 'Valle de Chalco Solidaridad', '122', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4304', 'San Bartolo Yautepec', '122', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4305', 'San Felipe Teotlalcingo', '122', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4306', 'Pajapan', '122', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4307', 'Zapotlán del Rey', '123', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4308', 'Luvianos', '123', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4309', 'San Bernardo Mixtepec', '123', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4310', 'San Felipe Tepatlán', '123', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4311', 'Pánuco', '123', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4312', 'Zapotlanejo', '124', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4313', 'San José del Rincón', '124', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4314', 'San Blas Atempa', '124', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4315', 'San Gabriel Chilac', '124', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4316', 'Papantla', '124', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4317', 'San Ignacio Cerro Gordo', '125', '14');
INSERT INTO `system_ubicacion_municipios` VALUES ('4318', 'Tonanitla', '125', '15');
INSERT INTO `system_ubicacion_municipios` VALUES ('4319', 'San Carlos Yautepec', '125', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4320', 'San Gregorio Atzompa', '125', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4321', 'Paso del Macho', '125', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4322', 'San Cristóbal Amatlán', '126', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4323', 'San Jerónimo Tecuanipan', '126', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4324', 'Paso de Ovejas', '126', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4325', 'San Cristóbal Amoltepec', '127', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4326', 'San Jerónimo Xayacatlán', '127', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4327', 'La Perla', '127', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4328', 'San Cristóbal Lachirioag', '128', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4329', 'San José Chiapa', '128', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4330', 'Perote', '128', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4331', 'San Cristóbal Suchixtlahuaca', '129', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4332', 'San José Miahuatlán', '129', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4333', 'Platón Sánchez', '129', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4334', 'San Dionisio del Mar', '130', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4335', 'San Juan Atenco', '130', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4336', 'Playa Vicente', '130', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4337', 'San Dionisio Ocotepec', '131', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4338', 'San Juan Atzompa', '131', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4339', 'Poza Rica de Hidalgo', '131', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4340', 'San Dionisio Ocotlán', '132', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4341', 'San Martín Texmelucan', '132', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4342', 'Las Vigas de Ramírez', '132', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4343', 'San Esteban Atatlahuca', '133', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4344', 'San Martín Totoltepec', '133', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4345', 'Pueblo Viejo', '133', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4346', 'San Felipe Jalapa de Díaz', '134', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4347', 'San Matías Tlalancaleca', '134', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4348', 'Puente Nacional', '134', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4349', 'San Felipe Tejalápam', '135', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4350', 'San Miguel Ixitlán', '135', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4351', 'Rafael Delgado', '135', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4352', 'San Felipe Usila', '136', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4353', 'San Miguel Xoxtla', '136', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4354', 'Rafael Lucio', '136', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4355', 'San Francisco Cahuacuá', '137', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4356', 'San Nicolás Buenos Aires', '137', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4357', 'Los Reyes', '137', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4358', 'San Francisco Cajonos', '138', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4359', 'San Nicolás de los Ranchos', '138', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4360', 'Río Blanco', '138', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4361', 'San Francisco Chapulapa', '139', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4362', 'San Pablo Anicano', '139', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4363', 'Saltabarranca', '139', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4364', 'San Francisco Chindúa', '140', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4365', 'San Pedro Cholula', '140', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4366', 'San Andrés Tenejapan', '140', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4367', 'San Francisco del Mar', '141', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4368', 'San Pedro Yeloixtlahuaca', '141', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4369', 'San Andrés Tuxtla', '141', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4370', 'San Francisco Huehuetlán', '142', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4371', 'San Salvador el Seco', '142', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4372', 'San Juan Evangelista', '142', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4373', 'San Francisco Ixhuatán', '143', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4374', 'San Salvador el Verde', '143', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4375', 'Santiago Tuxtla', '143', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4376', 'San Francisco Jaltepetongo', '144', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4377', 'San Salvador Huixcolotla', '144', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4378', 'Sayula de Alemán', '144', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4379', 'San Francisco Lachigoló', '145', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4380', 'San Sebastián Tlacotepec', '145', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4381', 'Soconusco', '145', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4382', 'San Francisco Logueche', '146', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4383', 'Santa Catarina Tlaltempan', '146', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4384', 'Sochiapa', '146', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4385', 'San Francisco Nuxaño', '147', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4386', 'Santa Inés Ahuatempan', '147', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4387', 'Soledad Atzompa', '147', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4388', 'San Francisco Ozolotepec', '148', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4389', 'Santa Isabel Cholula', '148', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4390', 'Soledad de Doblado', '148', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4391', 'San Francisco Sola', '149', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4392', 'Santiago Miahuatlán', '149', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4393', 'Soteapan', '149', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4394', 'San Francisco Telixtlahuaca', '150', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4395', 'Huehuetlán el Grande', '150', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4396', 'Tamalín', '150', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4397', 'San Francisco Teopan', '151', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4398', 'Santo Tomás Hueyotlipan', '151', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4399', 'Tamiahua', '151', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4400', 'San Francisco Tlapancingo', '152', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4401', 'Soltepec', '152', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4402', 'Tampico Alto', '152', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4403', 'San Gabriel Mixtepec', '153', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4404', 'Tecali de Herrera', '153', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4405', 'Tancoco', '153', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4406', 'San Ildefonso Amatlán', '154', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4407', 'Tecamachalco', '154', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4408', 'Tantima', '154', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4409', 'San Ildefonso Sola', '155', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4410', 'Tecomatlán', '155', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4411', 'Tantoyuca', '155', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4412', 'San Ildefonso Villa Alta', '156', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4413', 'Tehuacán', '156', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4414', 'Tatatila', '156', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4415', 'San Jacinto Amilpas', '157', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4416', 'Tehuitzingo', '157', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4417', 'Castillo de Teayo', '157', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4418', 'San Jacinto Tlacotepec', '158', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4419', 'Tenampulco', '158', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4420', 'Tecolutla', '158', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4421', 'San Jerónimo Coatlán', '159', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4422', 'Teopantlán', '159', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4423', 'Tehuipango', '159', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4424', 'San Jerónimo Silacayoapilla', '160', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4425', 'Teotlalco', '160', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4426', 'Álamo Temapache', '160', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4427', 'San Jerónimo Sosola', '161', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4428', 'Tepanco de López', '161', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4429', 'Tempoal', '161', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4430', 'San Jerónimo Taviche', '162', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4431', 'Tepango de Rodríguez', '162', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4432', 'Tenampa', '162', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4433', 'San Jerónimo Tecóatl', '163', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4434', 'Tepatlaxco de Hidalgo', '163', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4435', 'Tenochtitlán', '163', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4436', 'San Jorge Nuchita', '164', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4437', 'Tepeaca', '164', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4438', 'Teocelo', '164', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4439', 'San José Ayuquila', '165', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4440', 'Tepemaxalco', '165', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4441', 'Tepatlaxco', '165', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4442', 'San José Chiltepec', '166', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4443', 'Tepeojuma', '166', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4444', 'Tepetlán', '166', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4445', 'San José del Peñasco', '167', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4446', 'Tepetzintla', '167', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4447', 'Tepetzintla', '167', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4448', 'San José Estancia Grande', '168', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4449', 'Tepexco', '168', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4450', 'Tequila', '168', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4451', 'San José Independencia', '169', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4452', 'Tepexi de Rodríguez', '169', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4453', 'José Azueta', '169', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4454', 'San José Lachiguiri', '170', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4455', 'Tepeyahualco', '170', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4456', 'Texcatepec', '170', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4457', 'San José Tenango', '171', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4458', 'Tepeyahualco de Cuauhtémoc', '171', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4459', 'Texhuacán', '171', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4460', 'San Juan Achiutla', '172', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4461', 'Tetela de Ocampo', '172', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4462', 'Texistepec', '172', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4463', 'San Juan Atepec', '173', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4464', 'Teteles de Avila Castillo', '173', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4465', 'Tezonapa', '173', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4466', 'Ánimas Trujano', '174', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4467', 'Teziutlán', '174', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4468', 'Tierra Blanca', '174', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4469', 'San Juan Bautista Atatlahuca', '175', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4470', 'Tianguismanalco', '175', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4471', 'Tihuatlán', '175', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4472', 'San Juan Bautista Coixtlahuaca', '176', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4473', 'Tilapa', '176', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4474', 'Tlacojalpan', '176', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4475', 'San Juan Bautista Cuicatlán', '177', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4476', 'Tlacotepec de Benito Juárez', '177', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4477', 'Tlacolulan', '177', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4478', 'San Juan Bautista Guelache', '178', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4479', 'Tlacuilotepec', '178', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4480', 'Tlacotalpan', '178', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4481', 'San Juan Bautista Jayacatlán', '179', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4482', 'Tlachichuca', '179', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4483', 'Tlacotepec de Mejía', '179', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4484', 'San Juan Bautista Lo de Soto', '180', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4485', 'Tlahuapan', '180', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4486', 'Tlachichilco', '180', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4487', 'San Juan Bautista Suchitepec', '181', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4488', 'Tlaltenango', '181', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4489', 'Tlalixcoyan', '181', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4490', 'San Juan Bautista Tlacoatzintepec', '182', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4491', 'Tlanepantla', '182', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4492', 'Tlalnelhuayocan', '182', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4493', 'San Juan Bautista Tlachichilco', '183', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4494', 'Tlaola', '183', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4495', 'Tlapacoyan', '183', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4496', 'San Juan Bautista Tuxtepec', '184', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4497', 'Tlapacoya', '184', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4498', 'Tlaquilpa', '184', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4499', 'San Juan Cacahuatepec', '185', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4500', 'Tlapanalá', '185', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4501', 'Tlilapan', '185', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4502', 'San Juan Cieneguilla', '186', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4503', 'Tlatlauquitepec', '186', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4504', 'Tomatlán', '186', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4505', 'San Juan Coatzóspam', '187', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4506', 'Tlaxco', '187', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4507', 'Tonayán', '187', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4508', 'San Juan Colorado', '188', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4509', 'Tochimilco', '188', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4510', 'Totutla', '188', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4511', 'San Juan Comaltepec', '189', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4512', 'Tochtepec', '189', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4513', 'Tuxpan', '189', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4514', 'San Juan Cotzocón', '190', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4515', 'Totoltepec de Guerrero', '190', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4516', 'Tuxtilla', '190', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4517', 'San Juan Chicomezúchil', '191', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4518', 'Tulcingo', '191', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4519', 'Ursulo Galván', '191', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4520', 'San Juan Chilateca', '192', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4521', 'Tuzamapan de Galeana', '192', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4522', 'Vega de Alatorre', '192', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4523', 'San Juan del Estado', '193', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4524', 'Tzicatlacoyan', '193', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4525', 'Veracruz', '193', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4526', 'San Juan del Río', '194', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4527', 'Venustiano Carranza', '194', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4528', 'Villa Aldama', '194', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4529', 'San Juan Diuxi', '195', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4530', 'Vicente Guerrero', '195', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4531', 'Xoxocotla', '195', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4532', 'San Juan Evangelista Analco', '196', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4533', 'Xayacatlán de Bravo', '196', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4534', 'Yanga', '196', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4535', 'San Juan Guelavía', '197', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4536', 'Xicotepec', '197', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4537', 'Yecuatla', '197', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4538', 'San Juan Guichicovi', '198', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4539', 'Xicotlán', '198', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4540', 'Zacualpan', '198', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4541', 'San Juan Ihualtepec', '199', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4542', 'Xiutetelco', '199', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4543', 'Zaragoza', '199', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4544', 'San Juan Juquila Mixes', '200', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4545', 'Xochiapulco', '200', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4546', 'Zentla', '200', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4547', 'San Juan Juquila Vijanos', '201', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4548', 'Xochiltepec', '201', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4549', 'Zongolica', '201', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4550', 'San Juan Lachao', '202', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4551', 'Xochitlán de Vicente Suárez', '202', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4552', 'Zontecomatlán de López y Fuentes', '202', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4553', 'San Juan Lachigalla', '203', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4554', 'Xochitlán Todos Santos', '203', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4555', 'Zozocolco de Hidalgo', '203', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4556', 'San Juan Lajarcia', '204', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4557', 'Yaonáhuac', '204', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4558', 'Agua Dulce', '204', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4559', 'San Juan Lalana', '205', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4560', 'Yehualtepec', '205', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4561', 'El Higo', '205', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4562', 'San Juan de los Cués', '206', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4563', 'Zacapala', '206', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4564', 'Nanchital de Lázaro Cárdenas del Río', '206', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4565', 'San Juan Mazatlán', '207', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4566', 'Zacapoaxtla', '207', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4567', 'Tres Valles', '207', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4568', 'San Juan Mixtepec -Dto. 08 -', '208', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4569', 'Zacatlán', '208', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4570', 'Carlos A. Carrillo', '208', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4571', 'San Juan Mixtepec -Dto. 26 -', '209', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4572', 'Zapotitlán', '209', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4573', 'Tatahuicapan de Juárez', '209', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4574', 'San Juan Ñumí', '210', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4575', 'Zapotitlán de Méndez', '210', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4576', 'Uxpanapa', '210', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4577', 'San Juan Ozolotepec', '211', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4578', 'Zaragoza', '211', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4579', 'San Rafael', '211', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4580', 'San Juan Petlapa', '212', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4581', 'Zautla', '212', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4582', 'Santiago Sochiapan', '212', '30');
INSERT INTO `system_ubicacion_municipios` VALUES ('4583', 'San Juan Quiahije', '213', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4584', 'Zihuateutla', '213', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4585', 'San Juan Quiotepec', '214', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4586', 'Zinacatepec', '214', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4587', 'San Juan Sayultepec', '215', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4588', 'Zongozotla', '215', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4589', 'San Juan Tabaá', '216', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4590', 'Zoquiapan', '216', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4591', 'San Juan Tamazola', '217', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4592', 'Zoquitlán', '217', '21');
INSERT INTO `system_ubicacion_municipios` VALUES ('4593', 'San Juan Teita', '218', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4594', 'San Juan Teitipac', '219', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4595', 'San Juan Tepeuxila', '220', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4596', 'San Juan Teposcolula', '221', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4597', 'San Juan Yaeé', '222', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4598', 'San Juan Yatzona', '223', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4599', 'San Juan Yucuita', '224', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4600', 'San Lorenzo', '225', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4601', 'San Lorenzo Albarradas', '226', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4602', 'San Lorenzo Cacaotepec', '227', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4603', 'San Lorenzo Cuaunecuiltitla', '228', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4604', 'San Lorenzo Texmelúcan', '229', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4605', 'San Lorenzo Victoria', '230', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4606', 'San Lucas Camotlán', '231', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4607', 'San Lucas Ojitlán', '232', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4608', 'San Lucas Quiaviní', '233', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4609', 'San Lucas Zoquiápam', '234', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4610', 'San Luis Amatlán', '235', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4611', 'San Marcial Ozolotepec', '236', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4612', 'San Marcos Arteaga', '237', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4613', 'San Martín de los Cansecos', '238', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4614', 'San Martín Huamelúlpam', '239', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4615', 'San Martín Itunyoso', '240', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4616', 'San Martín Lachilá', '241', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4617', 'San Martín Peras', '242', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4618', 'San Martín Tilcajete', '243', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4619', 'San Martín Toxpalan', '244', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4620', 'San Martín Zacatepec', '245', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4621', 'San Mateo Cajonos', '246', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4622', 'Capulálpam de Méndez', '247', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4623', 'San Mateo del Mar', '248', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4624', 'San Mateo Yoloxochitlán', '249', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4625', 'San Mateo Etlatongo', '250', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4626', 'San Mateo Nejápam', '251', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4627', 'San Mateo Peñasco', '252', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4628', 'San Mateo Piñas', '253', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4629', 'San Mateo Río Hondo', '254', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4630', 'San Mateo Sindihui', '255', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4631', 'San Mateo Tlapiltepec', '256', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4632', 'San Melchor Betaza', '257', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4633', 'San Miguel Achiutla', '258', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4634', 'San Miguel Ahuehuetitlán', '259', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4635', 'San Miguel Aloápam', '260', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4636', 'San Miguel Amatitlán', '261', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4637', 'San Miguel Amatlán', '262', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4638', 'San Miguel Coatlán', '263', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4639', 'San Miguel Chicahua', '264', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4640', 'San Miguel Chimalapa', '265', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4641', 'San Miguel del Puerto', '266', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4642', 'San Miguel del Río', '267', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4643', 'San Miguel Ejutla', '268', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4644', 'San Miguel el Grande', '269', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4645', 'San Miguel Huautla', '270', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4646', 'San Miguel Mixtepec', '271', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4647', 'San Miguel Panixtlahuaca', '272', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4648', 'San Miguel Peras', '273', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4649', 'San Miguel Piedras', '274', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4650', 'San Miguel Quetzaltepec', '275', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4651', 'San Miguel Santa Flor', '276', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4652', 'Villa Sola de Vega', '277', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4653', 'San Miguel Soyaltepec', '278', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4654', 'San Miguel Suchixtepec', '279', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4655', 'Villa Talea de Castro', '280', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4656', 'San Miguel Tecomatlán', '281', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4657', 'San Miguel Tenango', '282', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4658', 'San Miguel Tequixtepec', '283', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4659', 'San Miguel Tilquiápam', '284', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4660', 'San Miguel Tlacamama', '285', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4661', 'San Miguel Tlacotepec', '286', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4662', 'San Miguel Tulancingo', '287', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4663', 'San Miguel Yotao', '288', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4664', 'San Nicolás', '289', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4665', 'San Nicolás Hidalgo', '290', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4666', 'San Pablo Coatlán', '291', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4667', 'San Pablo Cuatro Venados', '292', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4668', 'San Pablo Etla', '293', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4669', 'San Pablo Huitzo', '294', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4670', 'San Pablo Huixtepec', '295', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4671', 'San Pablo Macuiltianguis', '296', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4672', 'San Pablo Tijaltepec', '297', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4673', 'San Pablo Villa de Mitla', '298', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4674', 'San Pablo Yaganiza', '299', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4675', 'San Pedro Amuzgos', '300', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4676', 'San Pedro Apóstol', '301', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4677', 'San Pedro Atoyac', '302', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4678', 'San Pedro Cajonos', '303', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4679', 'San Pedro Coxcaltepec Cántaros', '304', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4680', 'San Pedro Comitancillo', '305', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4681', 'San Pedro el Alto', '306', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4682', 'San Pedro Huamelula', '307', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4683', 'San Pedro Huilotepec', '308', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4684', 'San Pedro Ixcatlán', '309', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4685', 'San Pedro Ixtlahuaca', '310', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4686', 'San Pedro Jaltepetongo', '311', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4687', 'San Pedro Jicayán', '312', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4688', 'San Pedro Jocotipac', '313', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4689', 'San Pedro Juchatengo', '314', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4690', 'San Pedro Mártir', '315', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4691', 'San Pedro Mártir Quiechapa', '316', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4692', 'San Pedro Mártir Yucuxaco', '317', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4693', 'San Pedro Mixtepec -Dto. 22 -', '318', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4694', 'San Pedro Mixtepec -Dto. 26 -', '319', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4695', 'San Pedro Molinos', '320', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4696', 'San Pedro Nopala', '321', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4697', 'San Pedro Ocopetatillo', '322', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4698', 'San Pedro Ocotepec', '323', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4699', 'San Pedro Pochutla', '324', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4700', 'San Pedro Quiatoni', '325', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4701', 'San Pedro Sochiápam', '326', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4702', 'San Pedro Tapanatepec', '327', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4703', 'San Pedro Taviche', '328', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4704', 'San Pedro Teozacoalco', '329', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4705', 'San Pedro Teutila', '330', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4706', 'San Pedro Tidaá', '331', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4707', 'San Pedro Topiltepec', '332', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4708', 'San Pedro Totolápam', '333', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4709', 'Villa de Tututepec de Melchor Ocampo', '334', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4710', 'San Pedro Yaneri', '335', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4711', 'San Pedro Yólox', '336', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4712', 'San Pedro y San Pablo Ayutla', '337', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4713', 'Villa de Etla', '338', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4714', 'San Pedro y San Pablo Teposcolula', '339', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4715', 'San Pedro y San Pablo Tequixtepec', '340', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4716', 'San Pedro Yucunama', '341', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4717', 'San Raymundo Jalpan', '342', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4718', 'San Sebastián Abasolo', '343', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4719', 'San Sebastián Coatlán', '344', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4720', 'San Sebastián Ixcapa', '345', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4721', 'San Sebastián Nicananduta', '346', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4722', 'San Sebastián Río Hondo', '347', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4723', 'San Sebastián Tecomaxtlahuaca', '348', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4724', 'San Sebastián Teitipac', '349', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4725', 'San Sebastián Tutla', '350', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4726', 'San Simón Almolongas', '351', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4727', 'San Simón Zahuatlán', '352', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4728', 'Santa Ana', '353', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4729', 'Santa Ana Ateixtlahuaca', '354', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4730', 'Santa Ana Cuauhtémoc', '355', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4731', 'Santa Ana del Valle', '356', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4732', 'Santa Ana Tavela', '357', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4733', 'Santa Ana Tlapacoyan', '358', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4734', 'Santa Ana Yareni', '359', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4735', 'Santa Ana Zegache', '360', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4736', 'Santa Catalina Quierí', '361', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4737', 'Santa Catarina Cuixtla', '362', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4738', 'Santa Catarina Ixtepeji', '363', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4739', 'Santa Catarina Juquila', '364', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4740', 'Santa Catarina Lachatao', '365', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4741', 'Santa Catarina Loxicha', '366', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4742', 'Santa Catarina Mechoacán', '367', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4743', 'Santa Catarina Minas', '368', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4744', 'Santa Catarina Quiané', '369', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4745', 'Santa Catarina Tayata', '370', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4746', 'Santa Catarina Ticuá', '371', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4747', 'Santa Catarina Yosonotú', '372', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4748', 'Santa Catarina Zapoquila', '373', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4749', 'Santa Cruz Acatepec', '374', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4750', 'Santa Cruz Amilpas', '375', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4751', 'Santa Cruz de Bravo', '376', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4752', 'Santa Cruz Itundujia', '377', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4753', 'Santa Cruz Mixtepec', '378', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4754', 'Santa Cruz Nundaco', '379', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4755', 'Santa Cruz Papalutla', '380', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4756', 'Santa Cruz Tacache de Mina', '381', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4757', 'Santa Cruz Tacahua', '382', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4758', 'Santa Cruz Tayata', '383', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4759', 'Santa Cruz Xitla', '384', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4760', 'Santa Cruz Xoxocotlán', '385', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4761', 'Santa Cruz Zenzontepec', '386', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4762', 'Santa Gertrudis', '387', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4763', 'Santa Inés del Monte', '388', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4764', 'Santa Inés Yatzeche', '389', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4765', 'Santa Lucía del Camino', '390', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4766', 'Santa Lucía Miahuatlán', '391', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4767', 'Santa Lucía Monteverde', '392', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4768', 'Santa Lucía Ocotlán', '393', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4769', 'Santa María Alotepec', '394', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4770', 'Santa María Apazco', '395', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4771', 'Santa María la Asunción', '396', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4772', 'Heroica Ciudad de Tlaxiaco', '397', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4773', 'Ayoquezco de Aldama', '398', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4774', 'Santa María Atzompa', '399', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4775', 'Santa María Camotlán', '400', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4776', 'Santa María Colotepec', '401', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4777', 'Santa María Cortijo', '402', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4778', 'Santa María Coyotepec', '403', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4779', 'Santa María Chachoápam', '404', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4780', 'Villa de Chilapa de Díaz', '405', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4781', 'Santa María Chilchotla', '406', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4782', 'Santa María Chimalapa', '407', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4783', 'Santa María del Rosario', '408', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4784', 'Santa María del Tule', '409', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4785', 'Santa María Ecatepec', '410', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4786', 'Santa María Guelacé', '411', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4787', 'Santa María Guienagati', '412', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4788', 'Santa María Huatulco', '413', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4789', 'Santa María Huazolotitlán', '414', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4790', 'Santa María Ipalapa', '415', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4791', 'Santa María Ixcatlán', '416', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4792', 'Santa María Jacatepec', '417', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4793', 'Santa María Jalapa del Marqués', '418', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4794', 'Santa María Jaltianguis', '419', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4795', 'Santa María Lachixío', '420', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4796', 'Santa María Mixtequilla', '421', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4797', 'Santa María Nativitas', '422', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4798', 'Santa María Nduayaco', '423', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4799', 'Santa María Ozolotepec', '424', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4800', 'Santa María Pápalo', '425', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4801', 'Santa María Peñoles', '426', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4802', 'Santa María Petapa', '427', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4803', 'Santa María Quiegolani', '428', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4804', 'Santa María Sola', '429', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4805', 'Santa María Tataltepec', '430', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4806', 'Santa María Tecomavaca', '431', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4807', 'Santa María Temaxcalapa', '432', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4808', 'Santa María Temaxcaltepec', '433', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4809', 'Santa María Teopoxco', '434', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4810', 'Santa María Tepantlali', '435', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4811', 'Santa María Texcatitlán', '436', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4812', 'Santa María Tlahuitoltepec', '437', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4813', 'Santa María Tlalixtac', '438', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4814', 'Santa María Tonameca', '439', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4815', 'Santa María Totolapilla', '440', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4816', 'Santa María Xadani', '441', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4817', 'Santa María Yalina', '442', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4818', 'Santa María Yavesía', '443', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4819', 'Santa María Yolotepec', '444', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4820', 'Santa María Yosoyúa', '445', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4821', 'Santa María Yucuhiti', '446', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4822', 'Santa María Zacatepec', '447', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4823', 'Santa María Zaniza', '448', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4824', 'Santa María Zoquitlán', '449', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4825', 'Santiago Amoltepec', '450', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4826', 'Santiago Apoala', '451', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4827', 'Santiago Apóstol', '452', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4828', 'Santiago Astata', '453', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4829', 'Santiago Atitlán', '454', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4830', 'Santiago Ayuquililla', '455', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4831', 'Santiago Cacaloxtepec', '456', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4832', 'Santiago Camotlán', '457', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4833', 'Santiago Comaltepec', '458', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4834', 'Santiago Chazumba', '459', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4835', 'Santiago Choápam', '460', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4836', 'Santiago del Río', '461', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4837', 'Santiago Huajolotitlán', '462', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4838', 'Santiago Huauclilla', '463', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4839', 'Santiago Ihuitlán Plumas', '464', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4840', 'Santiago Ixcuintepec', '465', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4841', 'Santiago Ixtayutla', '466', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4842', 'Santiago Jamiltepec', '467', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4843', 'Santiago Jocotepec', '468', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4844', 'Santiago Juxtlahuaca', '469', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4845', 'Santiago Lachiguiri', '470', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4846', 'Santiago Lalopa', '471', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4847', 'Santiago Laollaga', '472', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4848', 'Santiago Laxopa', '473', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4849', 'Santiago Llano Grande', '474', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4850', 'Santiago Matatlán', '475', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4851', 'Santiago Miltepec', '476', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4852', 'Santiago Minas', '477', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4853', 'Santiago Nacaltepec', '478', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4854', 'Santiago Nejapilla', '479', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4855', 'Santiago Nundiche', '480', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4856', 'Santiago Nuyoó', '481', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4857', 'Santiago Pinotepa Nacional', '482', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4858', 'Santiago Suchilquitongo', '483', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4859', 'Santiago Tamazola', '484', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4860', 'Santiago Tapextla', '485', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4861', 'Villa Tejúpam de la Unión', '486', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4862', 'Santiago Tenango', '487', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4863', 'Santiago Tepetlapa', '488', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4864', 'Santiago Tetepec', '489', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4865', 'Santiago Texcalcingo', '490', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4866', 'Santiago Textitlán', '491', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4867', 'Santiago Tilantongo', '492', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4868', 'Santiago Tillo', '493', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4869', 'Santiago Tlazoyaltepec', '494', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4870', 'Santiago Xanica', '495', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4871', 'Santiago Xiacuí', '496', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4872', 'Santiago Yaitepec', '497', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4873', 'Santiago Yaveo', '498', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4874', 'Santiago Yolomécatl', '499', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4875', 'Santiago Yosondúa', '500', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4876', 'Santiago Yucuyachi', '501', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4877', 'Santiago Zacatepec', '502', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4878', 'Santiago Zoochila', '503', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4879', 'Nuevo Zoquiápam', '504', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4880', 'Santo Domingo Ingenio', '505', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4881', 'Santo Domingo Albarradas', '506', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4882', 'Santo Domingo Armenta', '507', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4883', 'Santo Domingo Chihuitán', '508', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4884', 'Santo Domingo de Morelos', '509', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4885', 'Santo Domingo Ixcatlán', '510', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4886', 'Santo Domingo Nuxaá', '511', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4887', 'Santo Domingo Ozolotepec', '512', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4888', 'Santo Domingo Petapa', '513', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4889', 'Santo Domingo Roayaga', '514', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4890', 'Santo Domingo Tehuantepec', '515', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4891', 'Santo Domingo Teojomulco', '516', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4892', 'Santo Domingo Tepuxtepec', '517', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4893', 'Santo Domingo Tlatayápam', '518', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4894', 'Santo Domingo Tomaltepec', '519', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4895', 'Santo Domingo Tonalá', '520', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4896', 'Santo Domingo Tonaltepec', '521', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4897', 'Santo Domingo Xagacía', '522', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4898', 'Santo Domingo Yanhuitlán', '523', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4899', 'Santo Domingo Yodohino', '524', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4900', 'Santo Domingo Zanatepec', '525', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4901', 'Santos Reyes Nopala', '526', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4902', 'Santos Reyes Pápalo', '527', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4903', 'Santos Reyes Tepejillo', '528', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4904', 'Santos Reyes Yucuná', '529', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4905', 'Santo Tomás Jalieza', '530', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4906', 'Santo Tomás Mazaltepec', '531', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4907', 'Santo Tomás Ocotepec', '532', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4908', 'Santo Tomás Tamazulapan', '533', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4909', 'San Vicente Coatlán', '534', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4910', 'San Vicente Lachixío', '535', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4911', 'San Vicente Nuñú', '536', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4912', 'Silacayoápam', '537', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4913', 'Sitio de Xitlapehua', '538', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4914', 'Soledad Etla', '539', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4915', 'Villa de Tamazulápam del Progreso', '540', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4916', 'Tanetze de Zaragoza', '541', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4917', 'Taniche', '542', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4918', 'Tataltepec de Valdés', '543', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4919', 'Teococuilco de Marcos Pérez', '544', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4920', 'Teotitlán de Flores Magón', '545', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4921', 'Teotitlán del Valle', '546', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4922', 'Teotongo', '547', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4923', 'Tepelmeme Villa de Morelos', '548', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4924', 'Tezoatlán de Segura y Luna', '549', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4925', 'San Jerónimo Tlacochahuaya', '550', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4926', 'Tlacolula de Matamoros', '551', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4927', 'Tlacotepec Plumas', '552', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4928', 'Tlalixtac de Cabrera', '553', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4929', 'Totontepec Villa de Morelos', '554', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4930', 'Trinidad Zaachila', '555', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4931', 'La Trinidad Vista Hermosa', '556', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4932', 'Unión Hidalgo', '557', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4933', 'Valerio Trujano', '558', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4934', 'San Juan Bautista Valle Nacional', '559', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4935', 'Villa Díaz Ordaz', '560', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4936', 'Yaxe', '561', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4937', 'Magdalena Yodocono de Porfirio Díaz', '562', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4938', 'Yogana', '563', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4939', 'Yutanduchi de Guerrero', '564', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4940', 'Villa de Zaachila', '565', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4941', 'San Mateo Yucutindoo', '566', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4942', 'Zapotitlán Lagunas', '567', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4943', 'Zapotitlán Palmas', '568', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4944', 'Santa Inés de Zaragoza', '569', '20');
INSERT INTO `system_ubicacion_municipios` VALUES ('4945', 'Zimatlán de Álvarez', '570', '20');

-- ----------------------------
-- Table structure for `system_ubicacion_paises`
-- ----------------------------
DROP TABLE IF EXISTS `system_ubicacion_paises`;
CREATE TABLE `system_ubicacion_paises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `bandera` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of system_ubicacion_paises
-- ----------------------------
INSERT INTO `system_ubicacion_paises` VALUES ('1', 'México', 'http://png.findicons.com/files/icons/282/flags/32/mexico.png');
INSERT INTO `system_ubicacion_paises` VALUES ('2', 'USA', 'http://png.findicons.com/files/icons/282/flags/32/united_states_of_america_usa.png');

-- ----------------------------
-- Table structure for `system_users`
-- ----------------------------
DROP TABLE IF EXISTS `system_users`;
CREATE TABLE `system_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` char(255) NOT NULL,
  `pass` blob,
  `email` char(255) NOT NULL,
  `rol` int(11) DEFAULT '1',
  `fbid` int(11) DEFAULT NULL,
  `name` char(255) NOT NULL DEFAULT '0',
  `picture` varchar(255) DEFAULT NULL,
  `originalName` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nick` (`nick`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_users
-- ----------------------------
INSERT INTO `system_users` VALUES ('1', 'zesar1', 0x5CA0AEC0F3FD23FC70E7C926B1BB53E8, 'cbibriesca@hotmail.com', '2', '0', 'Zesar X', 'pic_1.jpg', 'retro_blue_background.jpg');
INSERT INTO `system_users` VALUES ('2', '', 0x5CA0AEC0F3FD23FC70E7C926B1BB53E8, '', '0', '0', '', '', '');

-- ----------------------------
-- Table structure for `system_usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `system_usuarios`;
CREATE TABLE `system_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(255) DEFAULT NULL,
  `pass` text,
  `email` char(255) DEFAULT NULL,
  `nombre` char(255) DEFAULT NULL,
  `ultima_conexion` datetime DEFAULT NULL,
  `creado` datetime DEFAULT NULL,
  `fk_rol` int(11) DEFAULT NULL,
  `ip` char(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nick` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of system_usuarios
-- ----------------------------
INSERT INTO `system_usuarios` VALUES ('16', 'admin', '098f6bcd4621d373cade4e832627b4f6', 'email@webmaster.com', 'Administrador del sistema', '2013-12-13 17:43:45', '0000-00-00 00:00:00', '1', '');
INSERT INTO `system_usuarios` VALUES ('102', 'demo', '098f6bcd4621d373cade4e832627b4f6', 'demo', 'Usuario Demo', '2014-01-02 16:08:04', '0000-00-00 00:00:00', '2', '');
INSERT INTO `system_usuarios` VALUES ('103', null, '098f6bcd4621d373cade4e832627b4f6', null, null, null, null, null, '');
INSERT INTO `system_usuarios` VALUES ('104', null, null, null, null, '2013-12-19 17:34:19', null, null, '');
INSERT INTO `system_usuarios` VALUES ('105', null, null, null, null, '2013-12-19 17:34:28', null, null, '');
INSERT INTO `system_usuarios` VALUES ('106', null, null, null, null, '2013-12-19 17:34:51', null, null, '');
INSERT INTO `system_usuarios` VALUES ('107', '', '912ec803b2ce49e4a541068d495ab570', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '<br /><b>Notice</b>:  Undefined index: ip in <b>C:');
INSERT INTO `system_usuarios` VALUES ('110', 'asdfg', '81dc9bdb52d04dc20036dbd8313ed055', 'email@hotmail.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '');
INSERT INTO `system_usuarios` VALUES ('111', 'aasdfasdf', '6b9260b1e02041a665d4e4a5117cfe16', 'fdsa', 'Nombre de Usuario', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '');
INSERT INTO `system_usuarios` VALUES ('112', 'fff', '343d9040a671c45832ee5381860e2996', 'fff', 'fff', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '');
INSERT INTO `system_usuarios` VALUES ('115', 'cesar', '81dc9bdb52d04dc20036dbd8313ed055', 'email', 'Cesar Octavio', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '');

-- ----------------------------
-- Table structure for `transportes_concepto_documento`
-- ----------------------------
DROP TABLE IF EXISTS `transportes_concepto_documento`;
CREATE TABLE `transportes_concepto_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(18,6) DEFAULT NULL,
  `concepto` char(100) DEFAULT NULL,
  `um` char(100) DEFAULT NULL,
  `precio_u` decimal(18,6) DEFAULT NULL,
  `importe` decimal(18,6) DEFAULT NULL,
  `fk_documento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transportes_concepto_documento
-- ----------------------------
INSERT INTO `transportes_concepto_documento` VALUES ('1', '1.000000', 'una cosa', 'UM', '0.000000', '0.000000', '1');
INSERT INTO `transportes_concepto_documento` VALUES ('2', '3.000000', 'otra cosa', 'pza', '5.000000', '5.000000', '1');
INSERT INTO `transportes_concepto_documento` VALUES ('3', '0.000000', '', '', '0.000000', '0.000000', '2');
INSERT INTO `transportes_concepto_documento` VALUES ('4', '0.000000', '', '', '0.000000', '0.000000', '3');

-- ----------------------------
-- Table structure for `transportes_documento`
-- ----------------------------
DROP TABLE IF EXISTS `transportes_documento`;
CREATE TABLE `transportes_documento` (
  `fecha_creacion` datetime DEFAULT NULL,
  `fk_tipo_de_documento` int(11) DEFAULT NULL,
  `fk_serie` int(11) DEFAULT NULL,
  `folio` char(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_transportador` int(11) DEFAULT NULL,
  `fk_remitente` char(100) DEFAULT NULL,
  `fk_destinatario` int(11) DEFAULT NULL,
  `fecha_entregar` datetime DEFAULT NULL,
  `origen` char(50) DEFAULT NULL,
  `destino` char(50) DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL COMMENT 'corresponde a la fecha de carga del camión e ',
  `fecha_cargar` datetime DEFAULT NULL,
  `fecha_cargado` datetime DEFAULT NULL,
  `medio_de_transporte` char(255) DEFAULT NULL,
  `datos_del_vehiculo` char(255) DEFAULT NULL,
  `datos_del_chofer` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transportes_documento
-- ----------------------------
INSERT INTO `transportes_documento` VALUES ('0000-00-00 00:00:00', '1', '2', '1', '1', '3', '2', '1', '0000-00-00 00:00:00', '																																																		', '																																																		', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'd', 'asdf', 'a');
INSERT INTO `transportes_documento` VALUES ('0000-00-00 00:00:00', '1', '2', '1', '2', '1', '1', '1', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '');
INSERT INTO `transportes_documento` VALUES ('0000-00-00 00:00:00', '1', '2', '', '3', '1', '1', '1', '0000-00-00 00:00:00', '											', '											', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '');

-- ----------------------------
-- Table structure for `transportes_serie`
-- ----------------------------
DROP TABLE IF EXISTS `transportes_serie`;
CREATE TABLE `transportes_serie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transportes_serie
-- ----------------------------
INSERT INTO `transportes_serie` VALUES ('2', 'A');

-- ----------------------------
-- Table structure for `transportes_socio`
-- ----------------------------
DROP TABLE IF EXISTS `transportes_socio`;
CREATE TABLE `transportes_socio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `domicilio` char(255) DEFAULT NULL,
  `email` char(255) DEFAULT NULL,
  `contacto` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transportes_socio
-- ----------------------------
INSERT INTO `transportes_socio` VALUES ('1', 'Cesar', '', '', '');
INSERT INTO `transportes_socio` VALUES ('2', 'Rancho Grande', '', '', '');
INSERT INTO `transportes_socio` VALUES ('3', 'Transportes Demo', '', '', '');

-- ----------------------------
-- Table structure for `transportes_tipo_documento`
-- ----------------------------
DROP TABLE IF EXISTS `transportes_tipo_documento`;
CREATE TABLE `transportes_tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transportes_tipo_documento
-- ----------------------------
INSERT INTO `transportes_tipo_documento` VALUES ('1', 'CARTA PORTE');
