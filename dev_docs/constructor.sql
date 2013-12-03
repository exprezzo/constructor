/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : constructor

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2013-12-02 23:38:44
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_categoria
-- ----------------------------
INSERT INTO `cms_categoria` VALUES ('1', 'Default', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of constructor_elemento_catalogo
-- ----------------------------
INSERT INTO `constructor_elemento_catalogo` VALUES ('41', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{\"etiqueta\":\"ID\",\"requerido\":\"1\",\"oculto\":\"1\",\"editable\":\"0\"}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('42', '', '', 'titulo', '', 'YES', 'char(255)', 'Text Input', '{\"etiqueta\":\"Titulo\",\"requerido\":\"0\",\"oculto\":\"0\",\"editable\":\"1\"}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('43', '', '', 'autor', '', 'YES', 'text', 'Combo Box', '{\"etiqueta\":\"Autor\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"1\",\"campo_a_mostrar\":\"name\"}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('44', '', '', 'contenido', '', 'YES', 'text', 'Html', '{}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('45', '', '', 'fk_categoria_pagina', '', 'YES', 'int(11)', 'Combo Box', '{\"etiqueta\":\"Categoria\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"5\",\"campo_a_mostrar\":\"nombre\"}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('46', '', '', 'fecha_creacion', '', 'YES', 'datetime', 'Date Input', '{}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('47', '', '', 'ultima_edicion', '', 'YES', 'datetime', 'Date Input', '{}', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('48', '', '', '', '', '', '', '', '', '40');
INSERT INTO `constructor_elemento_catalogo` VALUES ('49', '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{}', '45');
INSERT INTO `constructor_elemento_catalogo` VALUES ('50', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{}', '45');
INSERT INTO `constructor_elemento_catalogo` VALUES ('51', '', '', 'fk_categoria_padre', '', 'YES', 'int(11)', 'Text Input', '{}', '45');
INSERT INTO `constructor_elemento_catalogo` VALUES ('52', '0', '', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{}', '46');
INSERT INTO `constructor_elemento_catalogo` VALUES ('53', '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{}', '46');
INSERT INTO `constructor_elemento_catalogo` VALUES ('54', '', '', 'fk_um', '', 'YES', 'int(255)', 'Combo Box', '{\"etiqueta\":\"UM\",\"requerido\":\"1\",\"oculto\":\"0\",\"editable\":\"1\",\"target\":\"2\",\"campo_a_mostrar\":\"nombre\"}', '46');

-- ----------------------------
-- Table structure for `exp_concepto`
-- ----------------------------
DROP TABLE IF EXISTS `exp_concepto`;
CREATE TABLE `exp_concepto` (
  `id` int(11) NOT NULL DEFAULT '0',
  `nombre` char(255) DEFAULT NULL,
  `fk_um` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exp_concepto
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_catalogos
-- ----------------------------
INSERT INTO `system_catalogos` VALUES ('18', '2', 'Usuarios', 'usuarios', 'Usuario', 'system_users', 'id', 'http://png.findicons.com/files/icons/1620/crystal_project/64/personal.png', 'Nuevo Usuario', '\'Usuario: \' + getValorCampo(\'nombre\')', 'Buscar Usuario', 'Usuario Creado', '', '', '', '', 'nick, email, name');
INSERT INTO `system_catalogos` VALUES ('32', '2', 'Modulos', 'modulos', 'Modulo', 'system_modulos', 'id', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', '', '', '', '', '', '', '', '', '');
INSERT INTO `system_catalogos` VALUES ('33', '1', 'Catalogos', 'catalogos', 'Catalogo', 'system_catalogos', 'id', 'http://png.findicons.com/files/icons/577/refresh_cl/48/windows_view_icon.png', 'Nuevo Catalogo', '\'Catalogo: \' + getValorCampo(\'nombre\')', '\'Buscar Catalogos\'', 'Catalogo Creado', 'Catalogo Actualizado', 'Eliminar Catalogo', 'Catalogo Eliminado', 'Ha hecho cambios en el catalogo, Â¿Guardar antes de salir?', 'nombre');
INSERT INTO `system_catalogos` VALUES ('40', '2', 'Paginas', 'paginas', 'pagina', 'system_pagina', 'id', 'default.png', 'Nueva Pagina', '\'Pagina:  \' + getValorCampo(\'nombre\')', 'Buscar Paginas', 'Pagina Creada', 'Pagina Actualizada', 'Â¿Eliminar Pagina?', 'Pagina Eliminada', 'Desea Guardar los cambios', 'nombre');
INSERT INTO `system_catalogos` VALUES ('41', '2', 'Elemento del Catalogo', 'elementos', 'elemento', 'constructor_elemento_catalogo', 'id', '', 'Nuevo Elemento', '\'Editar Elemento\'', 'Buscar Elemento', 'Elemento Creado', 'Elemento Actualizado', 'Â¿Eliminar Elemento?', 'Elemento Eliminado', 'Â¿Guardar Cambios del Elemento?', 'Field, componente');
INSERT INTO `system_catalogos` VALUES ('42', '2', 'Modelo C', 'modelos', 'modeloc', 'system_modelos', 'id', '', 'Nuevo Modelo', '\'Editando Modelo: \'+ getValorCampo(\'nombre\')', 'Buscar Modelo', '', '', '', '', '', 'nombre');
INSERT INTO `system_catalogos` VALUES ('43', '2', 'Autor', 'autores', 'autor', 'system_users', 'id', '', '', '\'Autor: \'+getValorCampo(\'name\')', 'Busqueda de Autores', '', '', '', '', '', 'name');
INSERT INTO `system_catalogos` VALUES ('44', '2', 'UM', 'unidades', 'unidad', 'exp_um', 'id', '', 'Nueva Unidad de Medida', '\'UM: \' +getValorCampo(\'nombre\')', 'Buscar Unidades de Medida', '', '', '', '', '', 'nombre, abreviacion');
INSERT INTO `system_catalogos` VALUES ('45', '2', 'Categoria', 'categorias', 'categoria', 'cms_categoria', 'id', '', 'Nueva Categoria', '\'Categoria: \' + getValorCampo(\'nombre\')', 'Buscar Cagegoria', '', '', '', '', '', 'nombre');
INSERT INTO `system_catalogos` VALUES ('46', '1', 'Conceptos', 'conceptos', 'concepto', 'exp_concepto', 'id', '', 'Nuevo Concepto', '\'Concepto: \' + getValorCampo(\'nombre\')', 'Conceptos', 'Concepto Creado', 'Concepto Actualizado', 'Â¿Eliminar Concepto?', 'Concepto Eliminado', 'Â¿Guardar antes de salir?', 'nombre');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_modelos
-- ----------------------------
INSERT INTO `system_modelos` VALUES ('1', 'autor', '');
INSERT INTO `system_modelos` VALUES ('2', 'unidad', '');
INSERT INTO `system_modelos` VALUES ('3', 'producto', '');
INSERT INTO `system_modelos` VALUES ('4', 'pagina', '');
INSERT INTO `system_modelos` VALUES ('5', 'categoria', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_modulos
-- ----------------------------
INSERT INTO `system_modulos` VALUES ('1', 'backend', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', 'backend', '/modulos/', '0');
INSERT INTO `system_modulos` VALUES ('2', 'Portal', 'http://png-1.findicons.com/files/icons/2003/business/64/shopping_full.png', 'portal', '/', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_pagina
-- ----------------------------
INSERT INTO `system_pagina` VALUES ('1', 'Cerritos', '', '', '11', '0000-00-00 00:00:00', null);
INSERT INTO `system_pagina` VALUES ('2', 'La machado', '', '', '7', '0000-00-00 00:00:00', null);
INSERT INTO `system_pagina` VALUES ('3', 'Paseo Clausen', '', '', '8', '0000-00-00 00:00:00', null);
INSERT INTO `system_pagina` VALUES ('4', 'olas altas', '', '', '8', '0000-00-00 00:00:00', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_users
-- ----------------------------
INSERT INTO `system_users` VALUES ('1', 'zesar1', 0x5CA0AEC0F3FD23FC70E7C926B1BB53E8, 'cbibriesca@hotmail.com', '2', '0', 'Zesar X', 'pic_1.jpg', 'retro_blue_background.jpg');
