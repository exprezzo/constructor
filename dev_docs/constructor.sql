-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-12-2013 a las 19:40:39
-- Versión del servidor: 5.6.11
-- Versión de PHP: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `constructor`
--
CREATE DATABASE IF NOT EXISTS `constructor` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `constructor`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms_categoria`
--

CREATE TABLE IF NOT EXISTS `cms_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `fk_categoria_padre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cms_categoria`
--

INSERT INTO `cms_categoria` (`id`, `nombre`, `fk_categoria_padre`) VALUES
(1, 'Default', 0),
(2, 'Nueva', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constructor_elemento_catalogo`
--

CREATE TABLE IF NOT EXISTS `constructor_elemento_catalogo` (
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
  KEY `fk_catalogo` (`fk_catalogo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=154 ;

--
-- Volcado de datos para la tabla `constructor_elemento_catalogo`
--

INSERT INTO `constructor_elemento_catalogo` (`id`, `esDefault`, `extras`, `campo`, `llave`, `esNulo`, `tipo`, `componente`, `comp_config`, `fk_catalogo`) VALUES
(58, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 40),
(59, '', '', 'titulo', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Titulo","requerido":"0","editable":"1","oculto":"0" }', 40),
(60, '', '', 'autor', '', 'YES', 'text', 'Combo Box', '{"etiqueta":"Autor","requerido":"0","oculto":"0","editable":"1","target":"1","campo_a_mostrar":"name"}', 40),
(61, '', '', 'contenido', '', 'YES', 'text', 'Text Input', '{"etiqueta":"Contenido","requerido":"0","editable":"1","oculto":"0" }', 40),
(62, '', '', 'fk_categoria_pagina', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Fk_categoria_pagina","requerido":"0","oculto":"0","editable":"1","target":"5","campo_a_mostrar":"nombre"}', 40),
(63, '', '', 'fecha_creacion', '', 'YES', 'datetime', 'Date Input', '{"etiqueta":"Fecha_creacion","requerido":"0","editable":"1","oculto":"0" }', 40),
(64, '', '', 'ultima_edicion', '', 'YES', 'datetime', 'Date Input', '{"etiqueta":"Ultima_edicion","requerido":"0","editable":"1","oculto":"0" }', 40),
(65, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 43),
(66, '', '', 'nick', 'UNI', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Nick","requerido":"0","editable":"1","oculto":"0" }', 43),
(67, '', '', 'pass', '', 'YES', 'blob', 'Text Input', '{"etiqueta":"Pass","requerido":"0","editable":"1","oculto":"0" }', 43),
(68, '', '', 'email', 'UNI', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Email","requerido":"0","editable":"1","oculto":"0" }', 43),
(69, '1', '', 'rol', '', 'YES', 'int(11)', 'Text Input', '{"etiqueta":"Rol","requerido":"0","editable":"1","oculto":"0" }', 43),
(70, '', '', 'fbid', '', 'YES', 'int(11)', 'Text Input', '{"etiqueta":"Fbid","requerido":"0","editable":"1","oculto":"0" }', 43),
(71, '0', '', 'name', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Name","requerido":"0","editable":"1","oculto":"0" }', 43),
(72, '', '', 'picture', '', 'YES', 'varchar(255)', 'Text Input', '{"etiqueta":"Picture","requerido":"0","editable":"1","oculto":"0" }', 43),
(73, '', '', 'originalName', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"OriginalName","requerido":"0","editable":"1","oculto":"0" }', 43),
(74, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 45),
(75, '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 45),
(76, '', '', 'fk_categoria_padre', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Fk_categoria_padre","requerido":"0","oculto":"0","editable":"1","target":"5","campo_a_mostrar":"nombre"}', 45),
(77, '0', '', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 46),
(78, '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 46),
(79, '', '', 'fk_um', '', 'YES', 'int(255)', 'Combo Box', '{"etiqueta":"Fk_um","requerido":"0","oculto":"0","editable":"1","target":"2","campo_a_mostrar":"abreviacion"}', 46),
(80, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 44),
(81, '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 44),
(82, '', '', 'abreviacion', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Abreviacion","requerido":"0","editable":"1","oculto":"0" }', 44),
(93, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 47),
(94, '', '', 'serie', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Serie","requerido":"0","editable":"1","oculto":"0" }', 47),
(95, '', '', 'folio', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Folio","requerido":"0","editable":"1","oculto":"0" }', 47),
(96, '', '', 'notas', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Notas","requerido":"0","editable":"1","oculto":"0" }', 47),
(97, '', '', 'fecha', '', 'YES', 'datetime', 'Text Input', '{"etiqueta":"Fecha","requerido":"0","editable":"1","oculto":"0" }', 47),
(104, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 48),
(105, '', '', 'fk_concepto', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Fk_concepto","requerido":"0","oculto":"0","editable":"1","target":"6","campo_a_mostrar":"nombre"}', 48),
(106, '', '', 'cantidad', '', 'YES', 'decimal(18,6)', 'Text Input', '{"etiqueta":"Cantidad","requerido":"0","editable":"1","oculto":"0" }', 48),
(107, '', '', 'fk_um', '', 'YES', 'decimal(18,6)', 'Combo Box', '{"etiqueta":"Fk_um","requerido":"0","oculto":"0","editable":"1","target":"2","campo_a_mostrar":"nombre"}', 48),
(108, '', '', 'precio_unitario', '', 'YES', 'decimal(18,6)', 'Text Input', '{"etiqueta":"Precio_unitario","requerido":"0","editable":"1","oculto":"0" }', 48),
(109, '', '', 'importe', '', 'YES', 'decimal(18,6)', 'Text Input', '{"etiqueta":"Importe","requerido":"0","editable":"1","oculto":"0" }', 48),
(110, '', '', 'fk_cotizacion', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Fk_cotizacion","requerido":"0","oculto":"0","editable":"1","target":"7","campo_a_mostrar":"folio"}', 48),
(111, '', '', 'conceptos', '', '', '', 'Tabla', '{"titulo":"Conceptos","editable":"","target":"48","llave_foranea":"fk_cotizacion","config_tabla":"[{\\"id\\":\\"104\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"48\\"},{\\"id\\":\\"105\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_concepto\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_concepto\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"6\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"nombre\\\\\\"}\\",\\"fk_catalogo\\":\\"48\\"},{\\"id\\":\\"106\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"cantidad\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"decimal(18,6)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Cantidad\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"48\\"},{\\"id\\":\\"107\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_um\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"decimal(18,6)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_um\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"2\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"nombre\\\\\\"}\\",\\"fk_catalogo\\":\\"48\\"},{\\"id\\":\\"108\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"precio_unitario\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"decimal(18,6)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Precio_unitario\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"48\\"},{\\"id\\":\\"109\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"importe\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"decimal(18,6)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Importe\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"48\\"},{\\"id\\":\\"110\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_cotizacion\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_cotizacion\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"7\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"folio\\\\\\"}\\",\\"fk_catalogo\\":\\"48\\"}]"}', 47),
(113, '', '', 'paginas', '', '', '', 'Tabla', '{"titulo":"Paginas","editable":"1","target":"40","llave_foranea":"autor","config_tabla":"[{\\"id\\":\\"58\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"40\\"},{\\"id\\":\\"59\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"titulo\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Titulo\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"40\\"},{\\"id\\":\\"61\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"contenido\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"text\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Contenido\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"40\\"},{\\"id\\":\\"62\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_categoria_pagina\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_categoria_pagina\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"5\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"nombre\\\\\\"}\\",\\"fk_catalogo\\":\\"40\\"},{\\"id\\":\\"63\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fecha_creacion\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"datetime\\",\\"componente\\":\\"Date Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fecha_creacion\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"40\\"},{\\"id\\":\\"64\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"ultima_edicion\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"datetime\\",\\"componente\\":\\"Date Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Ultima_edicion\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"40\\"}]"}', 43),
(131, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 50),
(132, '', '', 'fk_modulo', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Fk_modulo","requerido":"0","oculto":"0","editable":"1","target":"32","campo_a_mostrar":"nombre"}', 50),
(133, '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 50),
(134, '', '', 'controlador', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Controlador","requerido":"0","editable":"1","oculto":"0" }', 50),
(135, '', '', 'modelo', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Modelo","requerido":"0","editable":"1","oculto":"0" }', 50),
(136, '', '', 'tabla', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Tabla","requerido":"0","editable":"1","oculto":"0" }', 50),
(137, 'id', '', 'pk_tabla', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Pk_tabla","requerido":"0","editable":"1","oculto":"0" }', 50),
(138, '', '', 'icono', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Icono","requerido":"0","editable":"1","oculto":"0" }', 50),
(139, '', '', 'titulo_nuevo', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Titulo_nuevo","requerido":"0","editable":"1","oculto":"0" }', 50),
(140, '', '', 'titulo_edicion', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Titulo_edicion","requerido":"0","editable":"1","oculto":"0" }', 50),
(141, '', '', 'titulo_busqueda', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Titulo_busqueda","requerido":"0","editable":"1","oculto":"0" }', 50),
(142, '', '', 'msg_creado', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Msg_creado","requerido":"0","editable":"1","oculto":"0" }', 50),
(143, '', '', 'msg_actualizado', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Msg_actualizado","requerido":"0","editable":"1","oculto":"0" }', 50),
(144, '', '', 'pregunta_eliminar', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Pregunta_eliminar","requerido":"0","editable":"1","oculto":"0" }', 50),
(145, '', '', 'msg_eliminado', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Msg_eliminado","requerido":"0","editable":"1","oculto":"0" }', 50),
(146, '', '', 'msg_cambios', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Msg_cambios","requerido":"0","editable":"1","oculto":"0" }', 50),
(147, '', '', 'campos_busqueda', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Campos_busqueda","requerido":"0","editable":"1","oculto":"0" }', 50),
(148, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 51),
(149, '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 51),
(150, '', '', 'icono', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Icono","requerido":"0","editable":"1","oculto":"0" }', 51),
(151, '', '', 'nombre_interno', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre_interno","requerido":"0","editable":"1","oculto":"0" }', 51),
(152, '', '', 'ruta_base', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Ruta_base","requerido":"0","editable":"1","oculto":"0" }', 51),
(153, '', '', 'orden', '', 'YES', 'int(11)', 'Text Input', '{"etiqueta":"Orden","requerido":"0","editable":"1","oculto":"0" }', 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exp_concepto`
--

CREATE TABLE IF NOT EXISTS `exp_concepto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `fk_um` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `exp_concepto`
--

INSERT INTO `exp_concepto` (`id`, `nombre`, `fk_um`) VALUES
(1, 'Nuevo Concepto', 1),
(2, 'SSd', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exp_conceptos_cotizacion`
--

CREATE TABLE IF NOT EXISTS `exp_conceptos_cotizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_concepto` int(11) DEFAULT NULL,
  `cantidad` decimal(18,6) DEFAULT NULL,
  `fk_um` decimal(18,6) DEFAULT NULL,
  `precio_unitario` decimal(18,6) DEFAULT NULL,
  `importe` decimal(18,6) DEFAULT NULL,
  `fk_cotizacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `exp_conceptos_cotizacion`
--

INSERT INTO `exp_conceptos_cotizacion` (`id`, `fk_concepto`, `cantidad`, `fk_um`, `precio_unitario`, `importe`, `fk_cotizacion`) VALUES
(1, 1, '0.000000', '0.000000', '0.000000', '0.000000', 2),
(2, 2, '3.000000', '3.000000', '3.000000', '0.000000', 2),
(3, 0, '0.000000', '0.000000', '0.000000', '0.000000', 2),
(4, 0, '0.000000', '0.000000', '0.000000', '0.000000', 2),
(5, 0, '6.000000', '0.000000', '0.000000', '0.000000', 2),
(6, 0, '0.000000', '0.000000', '0.000000', '0.000000', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exp_cotizacion`
--

CREATE TABLE IF NOT EXISTS `exp_cotizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serie` char(255) DEFAULT NULL,
  `folio` char(255) DEFAULT NULL,
  `notas` char(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `exp_cotizacion`
--

INSERT INTO `exp_cotizacion` (`id`, `serie`, `folio`, `notas`, `fecha`) VALUES
(2, 'A', '1', 'Una Cotozacion', '0000-00-00 00:00:00'),
(3, '', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exp_um`
--

CREATE TABLE IF NOT EXISTS `exp_um` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `abreviacion` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `exp_um`
--

INSERT INTO `exp_um` (`id`, `nombre`, `abreviacion`) VALUES
(1, 'Kilo', 'kg'),
(2, 'Pieza', 'pza'),
(3, 'No Aplica', 'NA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_acl`
--

CREATE TABLE IF NOT EXISTS `system_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) DEFAULT NULL,
  `modulo` char(255) DEFAULT NULL,
  `controlador` char(255) DEFAULT NULL,
  `accion` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `system_acl`
--

INSERT INTO `system_acl` (`id`, `fk_user`, `modulo`, `controlador`, `accion`) VALUES
(2, 0, 'asdf', 'asdf', 'asfd'),
(3, 2, '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_catalogos`
--

CREATE TABLE IF NOT EXISTS `system_catalogos` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Volcado de datos para la tabla `system_catalogos`
--

INSERT INTO `system_catalogos` (`id`, `fk_modulo`, `nombre`, `controlador`, `modelo`, `tabla`, `pk_tabla`, `icono`, `titulo_nuevo`, `titulo_edicion`, `titulo_busqueda`, `msg_creado`, `msg_actualizado`, `pregunta_eliminar`, `msg_eliminado`, `msg_cambios`, `campos_busqueda`) VALUES
(18, 2, 'Usuarios', 'usuarios', 'Usuario', 'system_users', 'id', 'http://png.findicons.com/files/icons/1620/crystal_project/64/personal.png', 'Nuevo Usuario', '''Usuario: '' + getValorCampo(''nombre'')', 'Buscar Usuario', 'Usuario Creado', '', '', '', '', 'nick, email, name'),
(32, 2, 'Modulos', 'modulos', 'Modulo', 'system_modulos', 'id', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', '', '', '', '', '', '', '', '', ''),
(33, 1, 'Catalogos', 'catalogos', 'Catalogo', 'system_catalogos', 'id', 'http://png.findicons.com/files/icons/577/refresh_cl/48/windows_view_icon.png', 'Nuevo Catalogo', '''Catalogo: '' + getValorCampo(''nombre'')', '''Buscar Catalogos''', 'Catalogo Creado', 'Catalogo Actualizado', 'Eliminar Catalogo', 'Catalogo Eliminado', 'Ha hecho cambios en el catalogo,¿Guardar antes de salir?', 'nombre'),
(40, 2, 'Paginas', 'paginas', 'pagina', 'system_pagina', 'id', 'default.png', 'Nueva Pagina', '''Pagina:  '' + getValorCampo(''titulo'')', 'Buscar Paginas', 'Pagina Creada', 'Pagina Actualizada', 'Â¿Eliminar Pagina?', 'Pagina Eliminada', 'Desea Guardar los cambios', 'nombre'),
(41, 2, 'Elemento del Catalogo', 'elementos', 'elemento', 'constructor_elemento_catalogo', 'id', '', 'Nuevo Elemento', '''Editar Elemento''', 'Buscar Elemento', 'Elemento Creado', 'Elemento Actualizado', 'Â¿Eliminar Elemento?', 'Elemento Eliminado', 'Â¿Guardar Cambios del Elemento?', 'Field, componente'),
(42, 2, 'Modelo C', 'modelos', 'modeloc', 'system_modelos', 'id', '', 'Nuevo Modelo', '''Editando Modelo: ''+ getValorCampo(''nombre'')', 'Buscar Modelo', '', '', '', '', '', 'nombre'),
(43, 2, 'Autor', 'autores', 'autor', 'system_users', 'id', '', 'Nuevo Autor', '''Autor: ''+getValorCampo(''name'')', 'Busqueda de Autores', 'Autor Creado', 'Autor Actualizado', 'Â¿Eliminar?', 'Eliminado', 'cambios pendientes', 'name'),
(44, 2, 'UM', 'unidades', 'unidad', 'exp_um', 'id', '', 'Nueva Unidad de Medida', '''UM: '' +getValorCampo(''nombre'')', 'Buscar Unidades de Medida', 'UM creada', 'UM actualizada', 'Â¿Eliminar UM?', 'UM eliminada', 'Â¿Guardar los cambios?', 'nombre, abreviacion'),
(45, 2, 'Categoria', 'categorias', 'categoria', 'cms_categoria', 'id', '', 'Nueva Categoria', '''Categoria: '' + getValorCampo(''nombre'')', 'Buscar Categoria', 'Categoria Creada', 'Categoria Actualizada', 'Â¿Eliminar Categoria?', '', '', 'nombre'),
(46, 2, 'Conceptos', 'conceptos', 'concepto', 'exp_concepto', 'id', '', 'Nuevo Concepto', '''Concepto: '' + getValorCampo(''nombre'')', 'Conceptos', 'Concepto Creado', 'Concepto Actualizado', 'Â¿Eliminar Concepto?', 'Concepto Eliminado', 'Â¿Guardar antes de salir?', 'nombre'),
(47, 2, 'Cotizacion', 'cotizaciones', 'cotizacion', 'exp_cotizacion', 'id', '', 'Nueva Cotizacion', '''Cotizacion: ''+getValorCampo(''serie'')+''  ''+getValorCampo(''folio'')', 'Cotizaciones', 'Cotizacion Creada', 'Cotizacion Actualizada', 'Â¿Eliminar Cotizacion?', 'Cotizacion Eliminada', '', ''),
(48, 2, 'concepto_cotizacion', 'conceptos_cotizacion', 'concepto_cotizacion', 'exp_conceptos_cotizacion', 'id', '', 'Nuevo Concepto de Cotizacion', '''Concepto: ''+getValorCampo(''fk_concepto'')', 'Conceptos de Cotizacion', 'Concepto Creado', 'Concepto Actualizado', 'Â¿Eliminar Concepto?', 'Concepto Eliminado', '', ''),
(50, 3, 'Catalogos', 'catalogos', 'Catalogo', 'system_catalogos', 'id', 'http://png.findicons.com/files/icons/577/refresh_cl/48/windows_view_icon.png', 'Nuevo Catalogo', '''Catalogo: '' + getValorCampo(''nombre'')', '''Buscar Catalogos''', 'Catalogo Creado', 'Catalogo Actualizado', 'Eliminar Catalogo', 'Catalogo Eliminado', 'Ha hecho cambios en el catalogo,¿Guardar antes de salir?', 'nombre'),
(51, 3, 'Modulos', 'modulos', 'Modulo', 'system_modulos', 'id', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', 'Nuevo Modulo', '''Modulo:'' + getValorCampo(''nombre'')', 'Modulos', 'Modulo Creado', 'Modulo Actualizado', '¿Eliminar Modulo?', 'Modulo Eliminado', '¿Guardar cambios?', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_categoria_pagina`
--

CREATE TABLE IF NOT EXISTS `system_categoria_pagina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_config`
--

CREATE TABLE IF NOT EXISTS `system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) DEFAULT NULL,
  `tema` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `system_config`
--

INSERT INTO `system_config` (`id`, `fk_user`, `tema`) VALUES
(1, 1, 'artic'),
(2, 20, 'artic');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_modelos`
--

CREATE TABLE IF NOT EXISTS `system_modelos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `tabla` char(255) DEFAULT NULL,
  `llave_primaria` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `system_modelos`
--

INSERT INTO `system_modelos` (`id`, `nombre`, `tabla`, `llave_primaria`) VALUES
(1, 'autor', 'system_users', 'id'),
(2, 'unidad', 'exp_um', 'id'),
(3, 'producto', 'exp_concepto', 'id'),
(4, 'pagina', 'system_pagina', 'id'),
(5, 'categoria', 'cms_categoria', 'id'),
(6, 'concepto', 'exp_concepto', 'id'),
(7, 'cotizacion', 'exp_cotizacion', 'id');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_modulos`
--

CREATE TABLE IF NOT EXISTS `system_modulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `icono` char(255) DEFAULT NULL,
  `nombre_interno` char(255) DEFAULT NULL,
  `ruta_base` char(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `system_modulos`
--

INSERT INTO `system_modulos` (`id`, `nombre`, `icono`, `nombre_interno`, `ruta_base`, `orden`) VALUES
(1, 'backend', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', 'backend', '/modulos/', 0),
(2, 'Portal', 'http://png-1.findicons.com/files/icons/2003/business/64/shopping_full.png', 'portal', '/', 0),
(3, 'Constructor', '', 'constructor', '/', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_pagina`
--

CREATE TABLE IF NOT EXISTS `system_pagina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` char(255) DEFAULT NULL,
  `autor` text,
  `contenido` text,
  `fk_categoria_pagina` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `ultima_edicion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `system_pagina`
--

INSERT INTO `system_pagina` (`id`, `titulo`, `autor`, `contenido`, `fk_categoria_pagina`, `fecha_creacion`, `ultima_edicion`) VALUES
(1, 'Cerritos', '1  ', 'asdfas', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'AAA', '1          ', 'BLA bla bla ble ble ble', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Un Titulo', '1', '', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Nueva Pagina', '1 ', '', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_users`
--

CREATE TABLE IF NOT EXISTS `system_users` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `system_users`
--

INSERT INTO `system_users` (`id`, `nick`, `pass`, `email`, `rol`, `fbid`, `name`, `picture`, `originalName`) VALUES
(1, 'zesar1', 0x5ca0aec0f3fd23fc70e7c926b1bb53e8, 'cbibriesca@hotmail.com', 2, 0, 'Zesar X', 'pic_1.jpg', 'retro_blue_background.jpg'),
(2, '', '', '', 0, 0, '', '', '');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `constructor_elemento_catalogo`
--
ALTER TABLE `constructor_elemento_catalogo`
  ADD CONSTRAINT `fk_catalogo` FOREIGN KEY (`fk_catalogo`) REFERENCES `system_catalogos` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
