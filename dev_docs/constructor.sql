/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : constructor

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2013-12-18 00:23:53
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
) ENGINE=InnoDB AUTO_INCREMENT=702 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of constructor_elemento_catalogo
-- ----------------------------
INSERT INTO `constructor_elemento_catalogo` VALUES ('58', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('59', '', '', 'titulo', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Titulo\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('60', '', '', 'autor', '', 'YES', 'text', 'Combo Box', '{\"etiqueta\":\"Autor\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"1\",\"campo_a_mostrar\":\"name\"}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('61', '', '', 'contenido', '', 'YES', 'text', 'Text Input', '{\"etiqueta\":\"Contenido\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('62', '', '', 'fk_categoria_pagina', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Fk_categoria_pagina\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"5\",\"campo_a_mostrar\":\"nombre\"}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('63', '', '', 'fecha_creacion', '', 'YES', 'datetime', 'Date Input', '{\"etiqueta\":\"Fecha_creacion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('64', '', '', 'ultima_edicion', '', 'YES', 'datetime', 'Date Input', '{\"etiqueta\":\"Ultima_edicion\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('65', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('66', '', '', 'nick', 'UNI', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nick\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('67', '', '', 'pass', '', 'YES', 'blob', 'Text Input', '{\"etiqueta\":\"Pass\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('68', '', '', 'email', 'UNI', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Email\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('69', '1', '', 'rol', '', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Rol\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('70', '', '', 'fbid', '', 'YES', 'int(11)', 'Text Input', '{\"etiqueta\":\"Fbid\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('71', '0', '', 'name', '', 'NO', 'char(255)', 'Text Input', '{\"etiqueta\":\"Name\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('72', '', '', 'picture', '', 'YES', 'varchar(255)', 'Text Input', '{\"etiqueta\":\"Picture\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('73', '', '', 'originalName', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"OriginalName\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '43');
INSERT INTO `constructor_elemento_catalogo` VALUES ('74', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"Id\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '45');
INSERT INTO `constructor_elemento_catalogo` VALUES ('75', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Nombre\",\"requerido\":\"0\",\"editable\":\"1\",\"oculto\":\"0\" }', '45');
INSERT INTO `constructor_elemento_catalogo` VALUES ('76', '', '', 'fk_categoria_padre', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Fk_categoria_padre\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"5\",\"campo_a_mostrar\":\"nombre\"}', '45');
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
INSERT INTO `constructor_elemento_catalogo` VALUES ('113', '', '', 'paginas', '', '', '', 'Tabla', '{\"titulo\":\"Paginas\",\"editable\":\"1\",\"target\":\"40\",\"llave_foranea\":\"autor\",\"config_tabla\":\"[{\\\"id\\\":\\\"58\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"auto_increment\\\",\\\"campo\\\":\\\"id\\\",\\\"llave\\\":\\\"PRI\\\",\\\"esNulo\\\":\\\"NO\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Id\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"40\\\"},{\\\"id\\\":\\\"59\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"titulo\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"char(255)\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Titulo\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"40\\\"},{\\\"id\\\":\\\"61\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"contenido\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"text\\\",\\\"componente\\\":\\\"Text Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Contenido\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"40\\\"},{\\\"id\\\":\\\"62\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fk_categoria_pagina\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"int(11)\\\",\\\"componente\\\":\\\"Combo Box\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fk_categoria_pagina\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"target\\\\\\\":\\\\\\\"5\\\\\\\",\\\\\\\"campo_a_mostrar\\\\\\\":\\\\\\\"nombre\\\\\\\"}\\\",\\\"fk_catalogo\\\":\\\"40\\\"},{\\\"id\\\":\\\"63\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"fecha_creacion\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"datetime\\\",\\\"componente\\\":\\\"Date Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Fecha_creacion\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"40\\\"},{\\\"id\\\":\\\"64\\\",\\\"esDefault\\\":\\\"\\\",\\\"extras\\\":\\\"\\\",\\\"campo\\\":\\\"ultima_edicion\\\",\\\"llave\\\":\\\"\\\",\\\"esNulo\\\":\\\"YES\\\",\\\"tipo\\\":\\\"datetime\\\",\\\"componente\\\":\\\"Date Input\\\",\\\"comp_config\\\":\\\"{\\\\\\\"etiqueta\\\\\\\":\\\\\\\"Ultima_edicion\\\\\\\",\\\\\\\"requerido\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"editable\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"oculto\\\\\\\":\\\\\\\"0\\\\\\\" }\\\",\\\"fk_catalogo\\\":\\\"40\\\"}]\"}', '43');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_catalogos
-- ----------------------------
INSERT INTO `system_catalogos` VALUES ('18', '2', 'Usuarios', 'usuarios', 'Usuario', 'system_users', 'id', 'http://png.findicons.com/files/icons/1620/crystal_project/64/personal.png', 'Nuevo Usuario', '\'Usuario: \' + getValorCampo(\'nombre\')', 'Buscar Usuario', 'Usuario Creado', '', '', '', '', 'nick, email, name');
INSERT INTO `system_catalogos` VALUES ('32', '2', 'Modulos', 'modulos', 'Modulo', 'system_modulos', 'id', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', '', '', '', '', '', '', '', '', '');
INSERT INTO `system_catalogos` VALUES ('33', '1', 'Catalogos', 'catalogos', 'Catalogo', 'system_catalogos', 'id', 'http://png.findicons.com/files/icons/577/refresh_cl/48/windows_view_icon.png', 'Nuevo Catalogo', '\'Catalogo: \' + getValorCampo(\'nombre\')', '\'Buscar Catalogos\'', 'Catalogo Creado', 'Catalogo Actualizado', 'Eliminar Catalogo', 'Catalogo Eliminado', 'Ha hecho cambios en el catalogo,ï¿½Guardar antes de salir?', 'nombre');
INSERT INTO `system_catalogos` VALUES ('40', '2', 'Paginas', 'paginas', 'pagina', 'system_pagina', 'id', 'default.png', 'Nueva Pagina', '\'Pagina:  \' + getValorCampo(\'titulo\')', 'Buscar Paginas', 'Pagina Creada', 'Pagina Actualizada', 'Â¿Eliminar Pagina?', 'Pagina Eliminada', 'Desea Guardar los cambios', 'nombre');
INSERT INTO `system_catalogos` VALUES ('41', '2', 'Elemento del Catalogo', 'elementos', 'elemento', 'constructor_elemento_catalogo', 'id', '', 'Nuevo Elemento', '\'Editar Elemento\'', 'Buscar Elemento', 'Elemento Creado', 'Elemento Actualizado', 'Â¿Eliminar Elemento?', 'Elemento Eliminado', 'Â¿Guardar Cambios del Elemento?', 'Field, componente');
INSERT INTO `system_catalogos` VALUES ('42', '2', 'Modelo C', 'modelos', 'modeloc', 'system_modelos', 'id', '', 'Nuevo Modelo', '\'Editando Modelo: \'+ getValorCampo(\'nombre\')', 'Buscar Modelo', '', '', '', '', '', 'nombre');
INSERT INTO `system_catalogos` VALUES ('43', '2', 'Autor', 'autores', 'autor', 'system_users', 'id', '', 'Nuevo Autor', '\'Autor: \'+getValorCampo(\'name\')', 'Busqueda de Autores', 'Autor Creado', 'Autor Actualizado', 'Â¿Eliminar?', 'Eliminado', 'cambios pendientes', 'name');
INSERT INTO `system_catalogos` VALUES ('44', '2', 'UM', 'unidades', 'unidad', 'exp_um', 'id', '', 'Nueva Unidad de Medida', '\'UM: \' +getValorCampo(\'nombre\')', 'Buscar Unidades de Medida', 'UM creada', 'UM actualizada', 'Â¿Eliminar UM?', 'UM eliminada', 'Â¿Guardar los cambios?', 'nombre, abreviacion');
INSERT INTO `system_catalogos` VALUES ('45', '2', 'Categoria', 'categorias', 'categoria', 'cms_categoria', 'id', '', 'Nueva Categoria', '\'Categoria: \' + getValorCampo(\'nombre\')', 'Buscar Categoria', 'Categoria Creada', 'Categoria Actualizada', 'Â¿Eliminar Categoria?', '', '', 'nombre');
INSERT INTO `system_catalogos` VALUES ('46', '2', 'Conceptos', 'conceptos', 'concepto', 'exp_concepto', 'id', '', 'Nuevo Concepto', '\'Concepto: \' + getValorCampo(\'nombre\')', 'Conceptos', 'Concepto Creado', 'Concepto Actualizado', 'Â¿Eliminar Concepto?', 'Concepto Eliminado', 'Â¿Guardar antes de salir?', 'nombre');
INSERT INTO `system_catalogos` VALUES ('47', '2', 'Cotizacion', 'cotizaciones', 'cotizacion', 'exp_cotizacion', 'id', '', 'Nueva Cotizacion', '\'Cotizacion: \'+getValorCampo(\'serie\')+\'  \'+getValorCampo(\'folio\')', 'Cotizaciones', 'Cotizacion Creada', 'Cotizacion Actualizada', 'Â¿Eliminar Cotizacion?', 'Cotizacion Eliminada', '', '');
INSERT INTO `system_catalogos` VALUES ('48', '2', 'concepto_cotizacion', 'conceptos_cotizacion', 'concepto_cotizacion', 'exp_conceptos_cotizacion', 'id', '', 'Nuevo Concepto de Cotizacion', '\'Concepto: \'+getValorCampo(\'fk_concepto\')', 'Conceptos de Cotizacion', 'Concepto Creado', 'Concepto Actualizado', 'Â¿Eliminar Concepto?', 'Concepto Eliminado', '', '');
INSERT INTO `system_catalogos` VALUES ('50', '4', 'Catalogos', 'catalogos', 'Catalogo', 'system_catalogos', 'id', 'http://png.findicons.com/files/icons/577/refresh_cl/48/windows_view_icon.png', 'Nuevo Catalogo', '\'Catalogo: \' + getValorCampo(\'nombre\')', '\'Buscar Catalogos\'', 'Catalogo Creado', 'Catalogo Actualizado', 'Eliminar Catalogo', 'Catalogo Eliminado', 'Ha hecho cambios en el catalogo,ï¿½Guardar antes de salir?', 'nombre');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_modulos
-- ----------------------------
INSERT INTO `system_modulos` VALUES ('1', 'backend', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', 'backend', '/modulos/', '0');
INSERT INTO `system_modulos` VALUES ('2', 'Portal', 'http://png-1.findicons.com/files/icons/2003/business/64/shopping_full.png', 'portal', '/', '0');
INSERT INTO `system_modulos` VALUES ('3', 'Constructor', '', 'constructor', '/', '0');
INSERT INTO `system_modulos` VALUES ('4', 'Pendienthon', '', 'pendienthon', '/', '0');
INSERT INTO `system_modulos` VALUES ('5', 'Transportes', '', 'transportes', '/', '0');

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
INSERT INTO `system_users` VALUES ('2', '', '', '', '0', '0', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transportes_concepto_documento
-- ----------------------------
INSERT INTO `transportes_concepto_documento` VALUES ('1', '1.000000', 'una cosa', 'UM', '0.000000', '0.000000', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transportes_documento
-- ----------------------------
INSERT INTO `transportes_documento` VALUES ('0000-00-00 00:00:00', '1', '2', '1', '1', '3', '2', '2', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '');

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
