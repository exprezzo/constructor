-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-12-2013 a las 22:14:27
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=984 ;

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
(132, '', '', 'fk_modulo', '', 'YES', 'int(11)', 'Text Input', '{"etiqueta":"Fk_modulo","requerido":"0","oculto":"0","editable":"1","target":"32","campo_a_mostrar":"nombre"}', 50),
(133, '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 50),
(134, '', '', 'controlador', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Controlador","requerido":"0","editable":"1","oculto":"0" }', 50),
(135, '', '', 'modelo', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Modelo","requerido":"0","editable":"1","oculto":"0" }', 50),
(136, '', '', 'tabla', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Tabla","requerido":"0","oculto":"0","editable":"1","target":"52","campo_a_mostrar":"nombre"}', 50),
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
(153, '', '', 'orden', '', 'YES', 'int(11)', 'Text Input', '{"etiqueta":"Orden","requerido":"0","editable":"1","oculto":"0" }', 51),
(154, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 52),
(155, '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 52),
(156, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 53),
(157, '', '', 'esDefault', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"EsDefault","requerido":"0","editable":"1","oculto":"0" }', 53),
(158, '', '', 'extras', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Extras","requerido":"0","editable":"1","oculto":"0" }', 53),
(159, '', '', 'campo', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Campo","requerido":"0","editable":"1","oculto":"0" }', 53),
(160, '', '', 'llave', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Llave","requerido":"0","editable":"1","oculto":"0" }', 53),
(161, '', '', 'esNulo', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"EsNulo","requerido":"0","editable":"1","oculto":"0" }', 53),
(162, '', '', 'tipo', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Tipo","requerido":"0","editable":"1","oculto":"0" }', 53),
(163, '', '', 'componente', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Componente","requerido":"0","editable":"1","oculto":"0" }', 53),
(164, '', '', 'comp_config', '', 'YES', 'text', 'Text Input', '{"etiqueta":"Comp_config","requerido":"0","editable":"1","oculto":"0" }', 53),
(165, '', '', 'fk_catalogo', 'MUL', 'YES', 'int(11)', 'Text Input', '{"etiqueta":"Fk_catalogo","requerido":"0","editable":"1","oculto":"0" }', 53),
(167, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 54),
(168, '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 54),
(169, '', '', 'descripcion', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Descripcion","requerido":"0","editable":"1","oculto":"0" }', 54),
(170, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 55),
(171, '', '', 'nick', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Nick","requerido":"0","editable":"1","oculto":"0" }', 55),
(172, '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 55),
(173, '', '', 'email', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Email","requerido":"0","editable":"1","oculto":"0" }', 55),
(174, '', '', 'pass', '', 'NO', 'text', 'Text Input', '{"etiqueta":"Pass","requerido":"0","editable":"1","oculto":"0" }', 55),
(175, '', '', 'ip_login', '', 'NO', 'char(50)', 'Text Input', '{"etiqueta":"Ip_login","requerido":"0","editable":"1","oculto":"0" }', 55),
(176, '', '', 'last_login', '', 'NO', 'datetime', 'Text Input', '{"etiqueta":"Last_login","requerido":"0","editable":"1","oculto":"0" }', 55),
(177, '', '', 'fk_rol', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Fk_rol","requerido":"0","oculto":"0","editable":"1","target":"54","campo_a_mostrar":"nombre"}', 55),
(178, '', '', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 56),
(179, '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 56),
(180, '', '', 'contacto', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Contacto","requerido":"0","editable":"1","oculto":"0" }', 56),
(181, '', '', 'logo', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Logo","requerido":"0","editable":"1","oculto":"0" }', 56),
(182, '', '', 'fk_empresa', '', '', '', 'Combo Box', '{"etiqueta":"Empresa","requerido":"1","oculto":"0","editable":"1","target":"56","campo_a_mostrar":"nombre"}', 55),
(183, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","oculto":"1","editable":"1"}', 57),
(184, '', '', 'descripcion', '', 'NO', 'text', 'Text Input', '{"etiqueta":"Descripcion","requerido":"0","editable":"1","oculto":"0" }', 57),
(185, '', '', 'num_reporte', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"No de Reporte","requerido":"0","oculto":"0","editable":"1"}', 57),
(186, '', '', 'fk_autor', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Autor","requerido":"0","oculto":"0","editable":"1","target":"55","campo_a_mostrar":"nombre"}', 57),
(187, '', '', 'fk_solicitante', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Solicitante","requerido":"0","oculto":"0","editable":"1","target":"55","campo_a_mostrar":"nombre"}', 57),
(188, '', '', 'fk_empresa', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Empresa","requerido":"0","oculto":"0","editable":"1","target":"56","campo_a_mostrar":"nombre"}', 57),
(189, '', '', 'status', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Status","requerido":"0","editable":"1","oculto":"0" }', 57),
(190, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 58),
(191, '', '', 'fecha', '', 'NO', 'datetime', 'Text Input', '{"etiqueta":"Fecha","requerido":"0","editable":"1","oculto":"0" }', 58),
(192, '', '', 'descripcion', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Descripcion","requerido":"0","editable":"1","oculto":"0" }', 58),
(193, '', '', 'fk_autor', '', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Fk_autor","requerido":"0","editable":"1","oculto":"0" }', 58),
(194, '', '', 'estado', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Estado","requerido":"0","editable":"1","oculto":"0" }', 58),
(195, '', '', 'fk_reporte', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Fk_reporte","requerido":"0","oculto":"0","editable":"1","target":"57","campo_a_mostrar":"num_reporte"}', 58),
(196, '', '', 'eventos', '', '', '', 'Tabla', '{"titulo":"Eventos","editable":"1","target":"58","llave_foranea":"fk_reporte","config_tabla":"[{\\"id\\":\\"190\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"58\\"},{\\"id\\":\\"191\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fecha\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"datetime\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fecha\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"58\\"},{\\"id\\":\\"192\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"descripcion\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Descripcion\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"58\\"},{\\"id\\":\\"193\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_autor\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Autor\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"55\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"nombre\\\\\\"}\\",\\"fk_catalogo\\":\\"58\\"},{\\"id\\":\\"194\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"estado\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Estado\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"58\\"},{\\"id\\":\\"195\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_reporte\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Reporte\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"57\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"num_reporte\\\\\\"}\\",\\"fk_catalogo\\":\\"58\\"}]"}', 57),
(197, '', '', 'usuarios', '', '', '', 'Tabla', '{"titulo":"Usuarios","editable":"1","target":"55","llave_foranea":"fk_empresa","config_tabla":"[{\\"id\\":\\"170\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"171\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"nick\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Nick\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"172\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"nombre\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Nombre\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"173\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"email\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Email\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"174\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"pass\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"text\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Pass\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"175\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"ip_login\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(50)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Ip_login\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"176\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"last_login\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"datetime\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Last_login\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"177\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_rol\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_rol\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"54\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"nombre\\\\\\"}\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"182\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_empresa\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"\\",\\"tipo\\":\\"\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Empresa\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"56\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"nombre\\\\\\"}\\",\\"fk_catalogo\\":\\"55\\"}]"}', 56),
(233, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 60),
(234, '', '', 'cantidad', '', 'YES', 'decimal(18,6)', 'Text Input', '{"etiqueta":"Cantidad","requerido":"0","editable":"1","oculto":"0" }', 60),
(235, '', '', 'concepto', '', 'YES', 'char(100)', 'Text Input', '{"etiqueta":"Concepto","requerido":"0","editable":"1","oculto":"0" }', 60),
(236, '', '', 'um', '', 'YES', 'char(100)', 'Text Input', '{"etiqueta":"Um","requerido":"0","editable":"1","oculto":"0" }', 60),
(237, '', '', 'precio_u', '', 'YES', 'decimal(18,6)', 'Text Input', '{"etiqueta":"Precio_u","requerido":"0","editable":"1","oculto":"0" }', 60),
(238, '', '', 'importe', '', 'YES', 'decimal(18,6)', 'Text Input', '{"etiqueta":"Importe","requerido":"0","editable":"1","oculto":"0" }', 60),
(239, '', '', 'fk_documento', '', 'YES', 'int(11)', 'Text Input', '{"etiqueta":"Fk_documento","requerido":"0","editable":"1","oculto":"0" }', 60),
(455, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","oculto":"1","editable":"1"}', 61),
(456, '', '', 'nombre', '', 'YES', 'char(50)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","oculto":"0","editable":"1"}', 61),
(678, '', '', 'fecha_creacion', '', 'YES', 'datetime', 'Text Input', '{"etiqueta":"Creado","requerido":"0","oculto":"0","editable":"1"}', 59),
(679, '', '', 'fk_tipo_de_documento', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Tipo de Doc.","requerido":"0","oculto":"0","editable":"1","target":"61","campo_a_mostrar":"nombre"}', 59),
(680, '', '', 'fk_serie', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Serie","requerido":"0","oculto":"0","editable":"1","target":"62","campo_a_mostrar":"nombre"}', 59),
(681, '', '', 'folio', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Folio","requerido":"0","editable":"1","oculto":"0" }', 59),
(682, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","oculto":"1","editable":"1"}', 59),
(683, '', '', 'fk_transportador', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Transportador","requerido":"0","oculto":"0","editable":"1","target":"63","campo_a_mostrar":"nombre"}', 59),
(684, '', '', 'fk_remitente', '', 'YES', 'char(100)', 'Combo Box', '{"etiqueta":"Remitente","requerido":"0","oculto":"0","editable":"1","target":"63","campo_a_mostrar":"nombre"}', 59),
(685, '', '', 'fk_destinatario', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Destinatario","requerido":"0","oculto":"0","editable":"1","target":"63","campo_a_mostrar":"nombre"}', 59),
(686, '', '', 'fecha_entregar', '', 'YES', 'datetime', 'Text Input', '{"etiqueta":"Fecha_entregar","requerido":"0","editable":"1","oculto":"0" }', 59),
(687, '', '', 'origen', '', 'YES', 'char(50)', 'Text Input', '{"etiqueta":"Origen","requerido":"0","editable":"1","oculto":"0" }', 59),
(688, '', '', 'destino', '', 'YES', 'char(50)', 'Text Input', '{"etiqueta":"Destino","requerido":"0","editable":"1","oculto":"0" }', 59),
(689, '', '', 'fecha_vencimiento', '', 'YES', 'datetime', 'Text Input', '{"etiqueta":"Fecha_vencimiento","requerido":"0","editable":"1","oculto":"0" }', 59),
(690, '', '', 'fecha_cargar', '', 'YES', 'datetime', 'Text Input', '{"etiqueta":"Fecha_cargar","requerido":"0","editable":"1","oculto":"0" }', 59),
(691, '', '', 'fecha_cargado', '', 'YES', 'datetime', 'Text Input', '{"etiqueta":"Fecha_cargado","requerido":"0","editable":"1","oculto":"0" }', 59),
(692, '', '', 'medio_de_transporte', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Medio_de_transporte","requerido":"0","editable":"1","oculto":"0" }', 59),
(693, '', '', 'datos_del_vehiculo', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Datos_del_vehiculo","requerido":"0","editable":"1","oculto":"0" }', 59),
(694, '', '', 'datos_del_chofer', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Datos_del_chofer","requerido":"0","editable":"1","oculto":"0" }', 59),
(695, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 62),
(696, '', '', 'nombre', '', 'YES', 'char(50)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 62),
(697, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","oculto":"1","editable":"1"}', 63),
(698, '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 63),
(699, '', '', 'domicilio', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Domicilio","requerido":"0","editable":"1","oculto":"0" }', 63),
(700, '', '', 'email', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Email","requerido":"0","editable":"1","oculto":"0" }', 63),
(701, '', '', 'contacto', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Contacto","requerido":"0","editable":"1","oculto":"0" }', 63),
(702, '', '', 'conceptos', '', '', '', 'Tabla', '{"titulo":"Conceptos","editable":"1","target":"60","llave_foranea":"fk_documento","config_tabla":"[{\\"id\\":\\"233\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"60\\"},{\\"id\\":\\"234\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"cantidad\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"decimal(18,6)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Cantidad\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"60\\"},{\\"id\\":\\"235\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"concepto\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"char(100)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Concepto\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"60\\"},{\\"id\\":\\"236\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"um\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"char(100)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Um\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"60\\"},{\\"id\\":\\"237\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"precio_u\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"decimal(18,6)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Precio_u\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"60\\"},{\\"id\\":\\"238\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"importe\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"decimal(18,6)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Importe\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"60\\"},{\\"id\\":\\"239\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_documento\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_documento\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"60\\"}]"}', 59),
(703, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","oculto":"1","editable":"1"}', 64),
(704, '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 64),
(705, '', '', 'ganancias', '', 'NO', 'decimal(18,2)', 'Text Input', '{"etiqueta":"Ganancias","requerido":"0","editable":"1","oculto":"0" }', 64),
(706, '', '', 'gastos', '', 'NO', 'decimal(18,2)', 'Text Input', '{"etiqueta":"Gastos","requerido":"0","editable":"1","oculto":"0" }', 64),
(707, '', '', 'saldo', '', 'NO', 'decimal(18,2)', 'Text Input', '{"etiqueta":"Saldo","requerido":"0","editable":"1","oculto":"0" }', 64),
(708, '', '', 'descripcion', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Descripcion","requerido":"0","editable":"1","oculto":"0" }', 64),
(709, '', '', 'fk_owner', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Dueño","requerido":"0","oculto":"0","editable":"1","target":"65","campo_a_mostrar":"nombre"}', 64),
(710, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","oculto":"1","editable":"1"}', 65),
(711, '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 65),
(712, '', '', 'email', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Email","requerido":"0","editable":"1","oculto":"0" }', 65),
(713, '', '', 'datos_de_contacto', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Contacto","requerido":"0","oculto":"0","editable":"1"}', 65),
(714, '', '', 'calle', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Calle","requerido":"0","editable":"1","oculto":"0" }', 65),
(715, '', '', 'numero_interior', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"No Int","requerido":"0","oculto":"0","editable":"1"}', 65),
(716, '', '', 'numero_exterior', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"No Ext","requerido":"0","oculto":"0","editable":"1"}', 65),
(717, '', '', 'colonia', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Colonia","requerido":"0","editable":"1","oculto":"0" }', 65),
(718, '', '', 'localidad', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Localidad","requerido":"0","editable":"1","oculto":"0" }', 65),
(719, '', '', 'referencia', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Referencia","requerido":"0","editable":"1","oculto":"0" }', 65),
(720, '', '', 'fk_pais', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Pais","requerido":"0","oculto":"0","editable":"1","target":"66","campo_a_mostrar":"nombre"}', 65),
(721, '', '', 'fk_estado', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Estado","requerido":"0","oculto":"0","editable":"1","target":"67","campo_a_mostrar":"nombre"}', 65),
(722, '', '', 'fk_municipio', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Municipio","requerido":"0","oculto":"0","editable":"1","target":"68","campo_a_mostrar":"nombre"}', 65),
(724, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 66),
(725, '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","ayuda":"Nombre","requerido":"0","oculto":"0","editable":"1"}', 66),
(726, '', '', 'bandera', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Bandera","ayuda":"Bandera","requerido":"0","oculto":"0","editable":"1"}', 66),
(727, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 67),
(728, '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","ayuda":"Nombre","requerido":"0","oculto":"0","editable":"1"}', 67),
(729, '', '', 'fk_pais', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Pais","ayuda":"Pais","requerido":"0","oculto":"0","editable":"1","target":"66","campo_a_mostrar":"nombre"}', 67),
(730, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 68),
(731, '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","ayuda":"Nombre","requerido":"0","oculto":"0","editable":"1"}', 68),
(732, '', '', 'clave_sepomex', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Clave_sepomex","ayuda":"Clave Sepomex","requerido":"0","oculto":"1","editable":"1"}', 68),
(733, '', '', 'fk_estado', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Estado","ayuda":"Estado","requerido":"0","oculto":"0","editable":"1","target":"67","campo_a_mostrar":"nombre"}', 68),
(734, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","oculto":"1","editable":"1"}', 69),
(735, '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 69),
(736, '', '', 'email', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Email","requerido":"0","editable":"1","oculto":"0" }', 69),
(737, '', '', 'datos_de_contacto', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Contacto","requerido":"0","oculto":"0","editable":"1"}', 69),
(738, '', '', 'calle', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Calle","requerido":"0","editable":"1","oculto":"0" }', 69),
(739, '', '', 'numero_interior', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"No Int","requerido":"0","oculto":"0","editable":"1"}', 69),
(740, '', '', 'numero_exterior', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"No Ext","requerido":"0","oculto":"0","editable":"1"}', 69),
(741, '', '', 'colonia', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Colonia","requerido":"0","editable":"1","oculto":"0" }', 69),
(742, '', '', 'localidad', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Localidad","requerido":"0","editable":"1","oculto":"0" }', 69),
(743, '', '', 'referencia', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Referencia","requerido":"0","editable":"1","oculto":"0" }', 69),
(744, '', '', 'fk_pais', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Pais","requerido":"0","oculto":"0","editable":"1","target":"66","campo_a_mostrar":"nombre"}', 69),
(745, '', '', 'fk_estado', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Estado","requerido":"0","oculto":"0","editable":"1","target":"67","campo_a_mostrar":"nombre"}', 69),
(746, '', '', 'fk_municipio', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Municipio","requerido":"0","oculto":"0","editable":"1","target":"68","campo_a_mostrar":"nombre"}', 69),
(747, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","oculto":"1","editable":"1"}', 70),
(748, '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 70),
(749, '', '', 'email', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Email","requerido":"0","editable":"1","oculto":"0" }', 70),
(750, '', '', 'datos_de_contacto', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Contacto","requerido":"0","oculto":"0","editable":"1"}', 70),
(751, '', '', 'calle', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Calle","requerido":"0","editable":"1","oculto":"0" }', 70),
(752, '', '', 'numero_interior', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"No Int","requerido":"0","oculto":"0","editable":"1"}', 70),
(753, '', '', 'numero_exterior', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"No Ext","requerido":"0","oculto":"0","editable":"1"}', 70),
(754, '', '', 'colonia', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Colonia","requerido":"0","editable":"1","oculto":"0" }', 70),
(755, '', '', 'localidad', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Localidad","requerido":"0","editable":"1","oculto":"0" }', 70),
(756, '', '', 'referencia', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Referencia","requerido":"0","editable":"1","oculto":"0" }', 70),
(757, '', '', 'fk_pais', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Pais","requerido":"0","oculto":"0","editable":"1","target":"66","campo_a_mostrar":"nombre"}', 70),
(758, '', '', 'fk_estado', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Estado","requerido":"0","oculto":"0","editable":"1","target":"67","campo_a_mostrar":"nombre"}', 70),
(759, '', '', 'fk_municipio', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Municipio","requerido":"0","oculto":"0","editable":"1","target":"68","campo_a_mostrar":"nombre"}', 70),
(760, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","oculto":"1","editable":"1"}', 71),
(761, '', '', 'nombre', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 71),
(762, '', '', 'datos_de_contacto', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Contacto","requerido":"0","oculto":"0","editable":"1"}', 71),
(763, '', '', 'calle', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Calle","requerido":"0","editable":"1","oculto":"0" }', 71),
(764, '', '', 'numero_interior', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"No Int","requerido":"0","oculto":"0","editable":"1"}', 71),
(765, '', '', 'numero_exterior', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"No Ext","requerido":"0","oculto":"0","editable":"1"}', 71),
(766, '', '', 'colonia', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Colonia","requerido":"0","editable":"1","oculto":"0" }', 71),
(767, '', '', 'localidad', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Localidad","requerido":"0","editable":"1","oculto":"0" }', 71),
(768, '', '', 'referencia', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Referencia","requerido":"0","editable":"1","oculto":"0" }', 71),
(769, '', '', 'fk_pais', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Pais","requerido":"0","oculto":"0","editable":"1","target":"66","campo_a_mostrar":"nombre"}', 71),
(770, '', '', 'fk_estado', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Estado","requerido":"0","oculto":"0","editable":"1","target":"67","campo_a_mostrar":"nombre"}', 71),
(771, '', '', 'fk_municipio', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Municipio","requerido":"0","oculto":"0","editable":"1","target":"68","campo_a_mostrar":"nombre"}', 71),
(772, '', '', 'fk_cliente', '', '', '', 'Combo Box', '{"etiqueta":"Cliente","requerido":"0","oculto":"0","editable":"1","target":"69","campo_a_mostrar":"nombre"}', 71),
(773, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","oculto":"1","editable":"1"}', 72),
(774, '', '', 'fk_maquina', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Maquina","requerido":"0","oculto":"0","editable":"1","target":"64","campo_a_mostrar":"nombre"}', 72),
(775, '', '', 'fk_cliente', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Cliente","requerido":"0","oculto":"0","editable":"1","target":"69","campo_a_mostrar":"nombre"}', 72),
(776, '', '', 'fk_pdv', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"PDV","requerido":"0","oculto":"0","editable":"1","target":"71","campo_a_mostrar":"nombre"}', 72),
(777, '', '', 'fk_tecnico', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Tecnico","requerido":"0","oculto":"0","editable":"1","target":"70","campo_a_mostrar":"nombre"}', 72),
(778, '', '', 'cont_entrada', '', 'NO', 'decimal(18,6)', 'Text Input', '{"etiqueta":"Cont Entrada","requerido":"0","oculto":"0","editable":"1"}', 72),
(779, '', '', 'cont_salida', '', 'NO', 'decimal(18,6)', 'Text Input', '{"etiqueta":"Cont Salida","requerido":"0","oculto":"0","editable":"1"}', 72),
(780, '', '', 'saldo_contadores', '', 'NO', 'decimal(18,6)', 'Text Input', '{"etiqueta":"Saldo","requerido":"0","oculto":"0","editable":"1"}', 72),
(781, '', '', 'dato_de_la_placa', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Dato De La Placa","requerido":"0","oculto":"0","editable":"1"}', 72),
(782, '', '', 'monto', '', 'NO', 'decimal(18,6)', 'Text Input', '{"etiqueta":"Monto","requerido":"0","editable":"1","oculto":"0" }', 72),
(783, '', '', 'fecha', '', 'NO', 'datetime', 'Text Input', '{"etiqueta":"Fecha","requerido":"0","editable":"1","oculto":"0" }', 72);
INSERT INTO `constructor_elemento_catalogo` (`id`, `esDefault`, `extras`, `campo`, `llave`, `esNulo`, `tipo`, `componente`, `comp_config`, `fk_catalogo`) VALUES
(784, '', '', 'pdvs', '', '', '', 'Tabla', '{"titulo":"Puntos de Venta","editable":"1","target":"71","llave_foranea":"fk_cliente","config_tabla":"[{\\"id\\":\\"760\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"71\\"},{\\"id\\":\\"761\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"nombre\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Nombre\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"71\\"},{\\"id\\":\\"762\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"datos_de_contacto\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Contacto\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"71\\"},{\\"id\\":\\"763\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"calle\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(100)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Calle\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"71\\"},{\\"id\\":\\"764\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"numero_interior\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(20)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"No Int\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"71\\"},{\\"id\\":\\"765\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"numero_exterior\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(20)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"No Ext\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"71\\"},{\\"id\\":\\"766\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"colonia\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(100)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Colonia\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"71\\"},{\\"id\\":\\"767\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"localidad\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(100)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Localidad\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"71\\"},{\\"id\\":\\"768\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"referencia\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(100)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Referencia\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"71\\"},{\\"id\\":\\"769\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_pais\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Pais\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"66\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"nombre\\\\\\"}\\",\\"fk_catalogo\\":\\"71\\"},{\\"id\\":\\"770\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_estado\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Estado\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"67\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"nombre\\\\\\"}\\",\\"fk_catalogo\\":\\"71\\"},{\\"id\\":\\"771\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_municipio\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Municipio\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"68\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"nombre\\\\\\"}\\",\\"fk_catalogo\\":\\"71\\"},{\\"id\\":\\"772\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_cliente\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"\\",\\"tipo\\":\\"\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Cliente\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"69\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"nombre\\\\\\"}\\",\\"fk_catalogo\\":\\"71\\"}]"}', 69),
(785, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","oculto":"1","editable":"1"}', 73),
(786, '', '', 'serie', '', 'NO', 'char(50)', 'Text Input', '{"etiqueta":"Serie","requerido":"0","editable":"1","oculto":"0" }', 73),
(787, '', '', 'fk_owner', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Dueño","requerido":"0","oculto":"0","editable":"1","target":"65","campo_a_mostrar":"nombre"}', 73),
(788, '', '', 'folio_sig', '', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Folio_sig","requerido":"0","editable":"1","oculto":"0" }', 73),
(789, '', '', 'fk_serie', '', '', '', 'Combo Box', '{"etiqueta":"Serie","requerido":"1","oculto":"0","editable":"1","target":"73","campo_a_mostrar":"serie"}', 72),
(790, '', '', 'folio', '', '', '', 'Text Input', '{"etiqueta":"Folio","requerido":"1","oculto":"0","editable":"1"}', 72),
(791, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","oculto":"1","editable":"1"}', 32),
(792, '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 32),
(793, '', '', 'icono', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Icono","requerido":"0","editable":"1","oculto":"0" }', 32),
(794, '', '', 'nombre_interno', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre_interno","requerido":"0","editable":"1","oculto":"0" }', 32),
(795, '', '', 'ruta_base', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Ruta_base","requerido":"0","editable":"1","oculto":"0" }', 32),
(796, '', '', 'orden', '', 'YES', 'int(11)', 'Text Input', '{"etiqueta":"Orden","requerido":"0","editable":"1","oculto":"0" }', 32),
(815, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"","requerido":"0","oculto":"1","editable":"1"}', 18),
(816, '', '', 'username', 'UNI', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Username","requerido":"0","editable":"1","oculto":"0" }', 18),
(817, '', '', 'pass', '', 'YES', 'text', 'Text Input', '{"etiqueta":"Pass","requerido":"0","editable":"1","oculto":"0" }', 18),
(818, '', '', 'email', 'UNI', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Email","requerido":"0","editable":"1","oculto":"0" }', 18),
(819, '', '', 'nombre', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0" }', 18),
(820, '', '', 'ultima_conexion', '', 'YES', 'datetime', 'Text Input', '{"etiqueta":"Ultima_conexion","requerido":"0","editable":"1","oculto":"0" }', 18),
(821, '', '', 'creado', '', 'YES', 'datetime', 'Text Input', '{"etiqueta":"Creado","requerido":"0","editable":"1","oculto":"0" }', 18),
(822, '', '', 'fk_rol', '', 'YES', 'int(11)', 'Text Input', '{"etiqueta":"Fk_rol","requerido":"0","editable":"1","oculto":"0" }', 18),
(823, '', '', 'ip', '', 'NO', 'char(50)', 'Text Input', '{"etiqueta":"Ip","requerido":"0","editable":"1","oculto":"0" }', 18),
(828, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"","requerido":"0","oculto":"1","editable":"1"}', 74),
(829, '', '', 'clave', '', 'NO', 'char(4)', 'Text Input', '{"etiqueta":"Clave","ayuda":"Clave Asignada por el Sat","requerido":"0","oculto":"0","editable":"1"}', 74),
(830, '', '', 'nombre', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Nombre","ayuda":"Nombre asignado por el SAT","requerido":"0","oculto":"0","editable":"1"}', 74),
(831, '', '', 'descripcion', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Descripcion","ayuda":"Campo adicional para usarlo como mejor le parezca","requerido":"0","oculto":"0","editable":"1"}', 74),
(832, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"","requerido":"0","oculto":"1","editable":"1"}', 75),
(833, '', '', 'clave', '', 'NO', 'char(5)', 'Text Input', '{"etiqueta":"Clave","ayuda":"Clave SAT","requerido":"0","oculto":"0","editable":"1"}', 75),
(834, '', '', 'nombre_corto', '', 'NO', 'char(50)', 'Text Input', '{"etiqueta":"Nombre","ayuda":"Nombre Corto","requerido":"0","oculto":"0","editable":"1"}', 75),
(835, '', '', 'nombre_o_razon_social', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Nombre o RS","ayuda":"Nombre o Razon Social del Banco","requerido":"0","oculto":"0","editable":"1"}', 75),
(836, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"","requerido":"0","oculto":"1","editable":"1"}', 76),
(837, '', '', 'clave', '', 'NO', 'char(5)', 'Text Input', '{"etiqueta":"Clave","ayuda":"Clave SAT","requerido":"0","oculto":"0","editable":"1"}', 76),
(838, '', '', 'descripcion', '', 'NO', 'char(50)', 'Text Input', '{"etiqueta":"Descripcion","ayuda":"Descripcion","requerido":"0","oculto":"0","editable":"1"}', 76),
(839, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"","requerido":"0","oculto":"1","editable":"1"}', 77),
(840, '', '', 'clave', '', 'NO', 'char(50)', 'Text Input', '{"etiqueta":"Clave","ayuda":"Clave SAT","requerido":"0","oculto":"0","editable":"1"}', 77),
(841, '', '', 'descripcion', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Descripcion","ayuda":"Descripción","requerido":"0","oculto":"0","editable":"1"}', 77),
(842, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"","requerido":"0","oculto":"1","editable":"1"}', 78),
(843, '', '', 'clave', '', 'NO', 'char(5)', 'Text Input', '{"etiqueta":"Clave","ayuda":"Clave SAT","requerido":"0","oculto":"0","editable":"1"}', 78),
(844, '', '', 'descripcion', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Descripcion","ayuda":"Descripcion","requerido":"0","oculto":"0","editable":"1"}', 78),
(845, '', '', 'comentario', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Comentario","ayuda":"Comentarios","requerido":"0","oculto":"0","editable":"1"}', 78),
(846, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 79),
(847, '', '', 'clave', '', 'NO', 'char(5)', 'Text Input', '{"etiqueta":"Clave","ayuda":"Clave SAT","requerido":"0","oculto":"0","editable":"1"}', 79),
(848, '', '', 'descripcion', '', 'NO', 'int(100)', 'Text Input', '{"etiqueta":"Descripción","ayuda":"Descripción","requerido":"0","oculto":"0","editable":"1"}', 79),
(849, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 80),
(850, '', '', 'nombre', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0","ayuda":"Nombre" }', 80),
(851, '', '', 'rfc', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"Rfc","requerido":"0","editable":"1","oculto":"0","ayuda":"Rfc" }', 80),
(852, '', '', 'email', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Email","requerido":"0","editable":"1","oculto":"0","ayuda":"Email" }', 80),
(853, '', '', 'CURP', '', 'NO', 'char(30)', 'Text Input', '{"etiqueta":"CURP","requerido":"0","editable":"1","oculto":"0","ayuda":"CURP" }', 80),
(854, '', '', 'fk_TipoRegimen', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Tipo Regimen","ayuda":"Tipo Regimen","requerido":"0","oculto":"0","editable":"1","target":"74","campo_a_mostrar":"nombre"}', 80),
(855, '', '', 'NumSeguridadSocial', '', 'NO', 'char(50)', 'Text Input', '{"etiqueta":"NumSeguridadSocial","ayuda":"Numero de Seguridad Social","requerido":"0","oculto":"0","editable":"1"}', 80),
(856, '', '', 'calle', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Calle","requerido":"0","editable":"1","oculto":"0","ayuda":"Calle" }', 80),
(857, '', '', 'noExterior', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"NoExterior","ayuda":"Numero Exterior","requerido":"0","oculto":"0","editable":"1"}', 80),
(858, '', '', 'noInterior', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"NoInterior","ayuda":"Numero Interior","requerido":"0","oculto":"0","editable":"1"}', 80),
(859, '', '', 'colonia', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Colonia","requerido":"0","editable":"1","oculto":"0","ayuda":"Colonia" }', 80),
(860, '', '', 'localidad', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Localidad","requerido":"0","editable":"1","oculto":"0","ayuda":"Localidad" }', 80),
(861, '', '', 'referencia', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Referencia","requerido":"0","editable":"1","oculto":"0","ayuda":"Referencia" }', 80),
(862, '', '', 'fk_pais', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Pais","ayuda":"Pais","requerido":"0","oculto":"0","editable":"1","target":"66","campo_a_mostrar":"nombre"}', 80),
(863, '', '', 'fk_estado', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Estado","ayuda":"Estado","requerido":"0","oculto":"0","editable":"1","target":"67","campo_a_mostrar":"nombre"}', 80),
(864, '', '', 'fk_municipio', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Municipio","ayuda":"Municipio","requerido":"0","oculto":"0","editable":"1","target":"68","campo_a_mostrar":"nombre"}', 80),
(865, '', '', 'codigoPostal', '', 'NO', 'char(10)', 'Text Input', '{"etiqueta":"Codigo Postal","ayuda":"Codigo Postal","requerido":"0","oculto":"0","editable":"1"}', 80),
(866, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 81),
(867, '', '', 'regimen', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Regimen","requerido":"0","editable":"1","oculto":"0","ayuda":"Regimen" }', 81),
(868, '', '', 'fk_razon_social', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Razon Social","ayuda":"Razon Social","requerido":"0","oculto":"0","editable":"1","target":"84","campo_a_mostrar":"nombre_comercial"}', 81),
(869, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 82),
(870, '', '', 'fk_razon_social', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Razon Social","ayuda":"Razon Social","requerido":"0","oculto":"0","editable":"1","target":"84","campo_a_mostrar":"nombre_comercial"}', 82),
(871, '', '', 'no_serie', 'UNI', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"No Serie","ayuda":"Numero de  Serie","requerido":"0","oculto":"0","editable":"1"}', 82),
(872, '', '', 'cer_pem', '', 'YES', 'text', 'Text Input', '{"etiqueta":"Cer_pem","ayuda":"Cer_pem","requerido":"0","oculto":"1","editable":"1"}', 82),
(873, '', '', 'key_pem', '', 'YES', 'text', 'Text Input', '{"etiqueta":"Key_pem","ayuda":"Key_pem","requerido":"0","oculto":"1","editable":"1"}', 82),
(874, '', '', 'pass', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Pass","requerido":"0","editable":"1","oculto":"0","ayuda":"Pass" }', 82),
(875, '', '', 'valido_desde', '', 'YES', 'datetime', 'Text Input', '{"etiqueta":"Valido Desde","ayuda":"Valido Desde","requerido":"0","oculto":"0","editable":"1"}', 82),
(876, '', '', 'valido_hasta', '', 'YES', 'datetime', 'Text Input', '{"etiqueta":"Valido Hasta","ayuda":"Valido Hasta","requerido":"0","oculto":"0","editable":"1"}', 82),
(877, '0', '', 'es_default', '', 'YES', 'int(1)', 'Text Input', '{"etiqueta":"Es Default","ayuda":"Es Default","requerido":"0","oculto":"0","editable":"1"}', 82),
(878, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 83),
(879, '', '', 'serie', '', 'NO', 'char(5)', 'Text Input', '{"etiqueta":"Serie","requerido":"0","editable":"1","oculto":"0","ayuda":"Serie" }', 83),
(880, '', '', 'sig_folio', '', 'YES', 'int(11)', 'Text Input', '{"etiqueta":"Folio Sig","ayuda":"Este es el folio a ser usado en el proximo documento","requerido":"0","oculto":"0","editable":"1"}', 83),
(881, '', '', 'es_default', '', 'YES', 'bit(1)', 'Text Input', '{"etiqueta":"Es Default","ayuda":"Serie predeterminada al crear un nuevo documento","requerido":"0","oculto":"0","editable":"1"}', 83),
(882, '', '', 'documento', '', 'NO', 'varchar(50)', 'Text Input', '{"etiqueta":"Documento","ayuda":"Documento","requerido":"0","oculto":"1","editable":"1"}', 83),
(883, '', '', 'fk_razon_social', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Razon Social","ayuda":"Razon Social","requerido":"0","oculto":"0","editable":"1","target":"84","campo_a_mostrar":"nombre_comercial"}', 83),
(884, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 84),
(885, '', '', 'rfc', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Rfc","requerido":"0","editable":"1","oculto":"0","ayuda":"Rfc" }', 84),
(886, '', '', 'razon_social', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Razon Social","ayuda":"Razon Social","requerido":"0","oculto":"0","editable":"1"}', 84),
(887, '', '', 'nombre_comercial', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Nombre Comercial","ayuda":"Nombre Comercial","requerido":"0","oculto":"0","editable":"1"}', 84),
(888, '', '', 'datos_de_contacto', '', 'YES', 'text', 'Text Input', '{"etiqueta":"Datos de Contacto","ayuda":"Datos de Contacto","requerido":"0","oculto":"0","editable":"1"}', 84),
(889, '', '', 'logo_factura', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Logotipo","ayuda":"Logotipo","requerido":"0","oculto":"0","editable":"1"}', 84),
(890, '', '', 'fk_pais', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Pais","ayuda":"Pais","requerido":"0","oculto":"0","editable":"1","target":"66","campo_a_mostrar":"nombre"}', 84),
(891, '', '', 'fk_estado', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Fk_estado","ayuda":"Fk_estado","requerido":"0","oculto":"0","editable":"1","target":"67","campo_a_mostrar":"nombre"}', 84),
(892, '', '', 'fk_ciudad', '', 'YES', 'int(11)', 'Text Input', '{"etiqueta":"Fk_ciudad","ayuda":"Fk_ciudad","requerido":"0","oculto":"1","editable":"1"}', 84),
(893, '', '', 'fk_municipio', '', 'YES', 'int(11)', 'Combo Box', '{"etiqueta":"Fk_municipio","ayuda":"Fk_municipio","requerido":"0","oculto":"0","editable":"1","target":"68","campo_a_mostrar":"nombre"}', 84),
(894, '', '', 'calle', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Calle","requerido":"0","editable":"1","oculto":"0","ayuda":"Calle" }', 84),
(895, '', '', 'noExterior', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"No Exterior","ayuda":"Numero Exterior","requerido":"0","oculto":"0","editable":"1"}', 84),
(896, '', '', 'noInterior', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"No Interior","ayuda":"Numero Interior","requerido":"0","oculto":"0","editable":"1"}', 84),
(897, '', '', 'colonia', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Colonia","requerido":"0","editable":"1","oculto":"0","ayuda":"Colonia" }', 84),
(898, '', '', 'localidad', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Localidad","requerido":"0","editable":"1","oculto":"0","ayuda":"Localidad" }', 84),
(899, '', '', 'referencia', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Referencia","requerido":"0","editable":"1","oculto":"0","ayuda":"Referencia" }', 84),
(900, '', '', 'codigoPostal', '', 'YES', 'char(20)', 'Text Input', '{"etiqueta":"Codigo Postal","ayuda":"Codigo Postal","requerido":"0","oculto":"0","editable":"1"}', 84),
(901, '', '', 'email_bcc', '', 'YES', 'char(255)', 'Text Input', '{"etiqueta":"Email","ayuda":"Email","requerido":"0","oculto":"0","editable":"1"}', 84),
(902, '', '|', 'Regimen_Fiscal', '', '', '', 'Tabla', '{"titulo":"Regimen Fiscal","ayuda":"Regimen Fiscal","editable":"1","target":"81","llave_foranea":"fk_razon_social","config_tabla":"[{\\"id\\":\\"866\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"81\\"},{\\"id\\":\\"867\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"regimen\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Regimen\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Regimen\\\\\\" }\\",\\"fk_catalogo\\":\\"81\\"},{\\"id\\":\\"868\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_razon_social\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_razon_social\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Fk_razon_social\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"81\\"}]"}', 84),
(903, '', '', 'RegistroPatronal', '', '', '', 'Text Input', '{"etiqueta":"Registro Patronal","ayuda":"Registro Patronal","requerido":"0","oculto":"0","editable":"1"}', 84),
(904, '', '', 'NoEmpleado', '', '', '', 'Text Input', '{"etiqueta":"No Empleado","ayuda":"Numero De Empleado","requerido":"0","oculto":"0","editable":"1"}', 80),
(905, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 85),
(906, '', '', 'nombre', '', 'NO', 'char(50)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0","ayuda":"Nombre" }', 85),
(907, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 86),
(908, '', '', 'descripcion', '', 'NO', 'char(50)', 'Text Input', '{"etiqueta":"Descripcion","requerido":"0","editable":"1","oculto":"0","ayuda":"Descripcion" }', 86),
(909, '', '', 'dias', '', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Dias","requerido":"0","editable":"1","oculto":"0","ayuda":"Dias" }', 86),
(910, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 87),
(911, '', '', 'nombre', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0","ayuda":"Nombre" }', 87),
(912, '', '', 'codigo', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"Codigo","requerido":"0","editable":"1","oculto":"0","ayuda":"Codigo" }', 87),
(913, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 88),
(914, '', '', 'fk_patron', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Patron","ayuda":"Patron","requerido":"0","oculto":"0","editable":"1","target":"84","campo_a_mostrar":"razon_social"}', 88),
(915, '', '', 'fk_empleado', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Empleado","ayuda":"Empleado","requerido":"0","oculto":"0","editable":"1","target":"80","campo_a_mostrar":"nombre"}', 88),
(916, '', '', 'fk_serie', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Serie","ayuda":"Serie","requerido":"0","oculto":"0","editable":"1","target":"83","campo_a_mostrar":"serie"}', 88),
(917, '', '', 'serie', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"Serie","ayuda":"Serie","requerido":"0","oculto":"1","editable":"1"}', 88),
(918, '', '', 'folio', '', 'NO', 'char(10)', 'Text Input', '{"etiqueta":"Folio","requerido":"0","editable":"1","oculto":"0","ayuda":"Folio" }', 88),
(919, '', '', 'Version', '', 'NO', 'char(5)', 'Text Input', '{"etiqueta":"Version","requerido":"0","editable":"1","oculto":"0","ayuda":"Version" }', 88),
(920, '', '', 'RegistroPatronal', '', 'NO', 'char(20)', 'Text Input', '{"etiqueta":"RegistroPatronal","requerido":"0","editable":"1","oculto":"0","ayuda":"RegistroPatronal" }', 88),
(921, '', '', 'NumEmpleado', '', 'NO', 'char(15)', 'Text Input', '{"etiqueta":"NumEmpleado","requerido":"0","editable":"1","oculto":"0","ayuda":"NumEmpleado" }', 88),
(922, '', '', 'CURP', '', 'NO', 'int(50)', 'Text Input', '{"etiqueta":"CURP","requerido":"0","editable":"1","oculto":"0","ayuda":"CURP" }', 88),
(923, '', '', 'fk_TipoRegimen', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Tipo Regimen","ayuda":"Tipo Regimen","requerido":"0","oculto":"0","editable":"1","target":"74","campo_a_mostrar":"nombre"}', 88),
(924, '', '', 'TipoRegimen', '', 'NO', 'char(10)', 'Text Input', '{"etiqueta":"TipoRegimen","ayuda":"TipoRegimen","requerido":"0","oculto":"1","editable":"1"}', 88),
(925, '', '', 'NumSeguridadSocial', '', 'NO', 'char(15)', 'Text Input', '{"etiqueta":"NumSeguridadSocial","requerido":"0","editable":"1","oculto":"0","ayuda":"NumSeguridadSocial" }', 88),
(926, '', '', 'FechaPago', '', 'NO', 'datetime', 'Text Input', '{"etiqueta":"FechaPago","requerido":"0","editable":"1","oculto":"0","ayuda":"FechaPago" }', 88),
(927, '', '', 'FechaInicialPago', '', 'NO', 'datetime', 'Text Input', '{"etiqueta":"FechaInicialPago","requerido":"0","editable":"1","oculto":"0","ayuda":"FechaInicialPago" }', 88),
(928, '', '', 'FechaFinalPago', '', 'NO', 'datetime', 'Text Input', '{"etiqueta":"FechaFinalPago","requerido":"0","editable":"1","oculto":"0","ayuda":"FechaFinalPago" }', 88),
(929, '', '', 'NumDiasPagados', '', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"NumDiasPagados","requerido":"0","editable":"1","oculto":"0","ayuda":"NumDiasPagados" }', 88),
(930, '', '', 'fk_Departamento', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Departamento","ayuda":"Departamento","requerido":"0","oculto":"0","editable":"1","target":"87","campo_a_mostrar":"nombre"}', 88),
(931, '', '', 'Departamento', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Departamento","ayuda":"Departamento","requerido":"0","oculto":"1","editable":"1"}', 88),
(932, '', '', 'CLABE', '', 'NO', 'char(50)', 'Text Input', '{"etiqueta":"CLABE","requerido":"0","editable":"1","oculto":"0","ayuda":"CLABE" }', 88),
(933, '', '', 'Banco', '', 'NO', 'char(10)', 'Text Input', '{"etiqueta":"Banco","ayuda":"Banco","requerido":"0","oculto":"1","editable":"1"}', 88),
(934, '', '', 'FechaInicioRelLaboral', '', 'NO', 'datetime', 'Text Input', '{"etiqueta":"FechaInicioRelLaboral","requerido":"0","editable":"1","oculto":"0","ayuda":"FechaInicioRelLaboral" }', 88),
(935, '', '', 'Antiguedad', '', 'NO', 'decimal(18,6)', 'Text Input', '{"etiqueta":"Antiguedad","requerido":"0","editable":"1","oculto":"0","ayuda":"Antiguedad" }', 88),
(936, '', '', 'Puesto', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Puesto","requerido":"0","editable":"1","oculto":"0","ayuda":"Puesto" }', 88),
(937, '', '', 'TipoContrato', '', 'NO', 'char(100)', 'Combo Box', '{"etiqueta":"TipoContrato","ayuda":"TipoContrato","requerido":"0","oculto":"0","editable":"1","target":"74","campo_a_mostrar":"nombre"}', 88),
(938, '', '', 'TipoJornada', '', 'NO', 'char(100)', 'Combo Box', '{"etiqueta":"Tipo Jornada","ayuda":"Tipo Jornada","requerido":"0","oculto":"0","editable":"1","target":"85","campo_a_mostrar":"nombre"}', 88),
(939, '', '', 'PeriodicidadPago', '', 'NO', 'char(100)', 'Combo Box', '{"etiqueta":"Periodicidad Pago","ayuda":"Periodicidad del Pago","requerido":"0","oculto":"0","editable":"1","target":"86","campo_a_mostrar":"descripcion"}', 88),
(940, '', '', 'SalarioBaseCotApor', '', 'NO', 'decimal(18,6)', 'Text Input', '{"etiqueta":"SalarioBaseCotApor","requerido":"0","editable":"1","oculto":"0","ayuda":"SalarioBaseCotApor" }', 88),
(941, '', '', 'RiesgoPuesto', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"RiesgoPuesto","ayuda":"RiesgoPuesto","requerido":"0","oculto":"1","editable":"1"}', 88),
(942, '', '', 'SalarioDiarioIntegrado', '', 'NO', 'decimal(18,6)', 'Text Input', '{"etiqueta":"SalarioDiarioIntegrado","requerido":"0","editable":"1","oculto":"0","ayuda":"SalarioDiarioIntegrado" }', 88),
(943, '', '', 'fk_banco', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Banco","ayuda":"Banco","requerido":"0","oculto":"0","editable":"1","target":"75","campo_a_mostrar":"nombre_corto"}', 88),
(944, '', '', 'fk_RiesgoPuesto', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Riesgo Puesto","ayuda":"Riesgo Puesto","requerido":"0","oculto":"0","editable":"1","target":"76","campo_a_mostrar":"descripcion"}', 88),
(945, '', '', 'percepcionesTotalGravado', '', '', '', 'Text Input', '{"etiqueta":"P. Tot. Gravado","ayuda":"Percepciones Total Gravado","requerido":"1","oculto":"0","editable":"1"}', 88),
(946, '', '', 'percepcionesTotalExcento', '', '', '', 'Text Input', '{"etiqueta":"P. Tot. Excento","ayuda":"Percepciones Total Excento","requerido":"1","oculto":"0","editable":"1"}', 88),
(947, '', '', 'deduccionesTotalGravado', '', '', '', 'Text Input', '{"etiqueta":"D Tot. Gravado","ayuda":"Deducciones Total Gravado","requerido":"1","oculto":"0","editable":"1"}', 88),
(948, '', '', 'deduccionesTotalExcento', '', '', '', 'Text Input', '{"etiqueta":"D. Tot. Excento","ayuda":"Deducciones","requerido":"1","oculto":"0","editable":"1"}', 88),
(949, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 89),
(950, '', '', 'fk_TipoPercepcion', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Tipo Percepcion","ayuda":"Tipo Percepcion","requerido":"0","oculto":"0","editable":"1","target":"77","campo_a_mostrar":"descripcion"}', 89),
(951, '', '', 'Clave', '', 'NO', 'char(15)', 'Text Input', '{"etiqueta":"Clave","requerido":"0","editable":"1","oculto":"0","ayuda":"Clave" }', 89),
(952, '', '', 'Concepto', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Concepto","requerido":"0","editable":"1","oculto":"0","ayuda":"Concepto" }', 89),
(953, '', '', 'ImporteGravado', '', 'NO', 'decimal(18,6)', 'Text Input', '{"etiqueta":"ImporteGravado","requerido":"0","editable":"1","oculto":"0","ayuda":"ImporteGravado" }', 89),
(954, '', '', 'ImporteExcento', '', 'NO', 'decimal(18,6)', 'Text Input', '{"etiqueta":"ImporteExcento","requerido":"0","editable":"1","oculto":"0","ayuda":"ImporteExcento" }', 89),
(955, '', '', 'TipoPercepcion', '', 'NO', 'char(50)', 'Text Input', '{"etiqueta":"TipoPercepcion","requerido":"0","editable":"1","oculto":"0","ayuda":"TipoPercepcion" }', 89),
(956, '', '', 'fk_nomina', '', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Fk_nomina","ayuda":"Fk_nomina","requerido":"0","oculto":"1","editable":"1"}', 89),
(957, '', '', 'percepciones', '', '', '', 'Tabla', '{"titulo":"Percepciones","ayuda":"Percepciones","editable":"1","target":"89","llave_foranea":"fk_nomina","config_tabla":"[{\\"id\\":\\"949\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"89\\"},{\\"id\\":\\"950\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_TipoPercepcion\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Tipo Percepcion\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Tipo Percepcion\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"77\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"descripcion\\\\\\"}\\",\\"fk_catalogo\\":\\"89\\"},{\\"id\\":\\"951\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"Clave\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(15)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Clave\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Clave\\\\\\" }\\",\\"fk_catalogo\\":\\"89\\"},{\\"id\\":\\"952\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"Concepto\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(100)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Concepto\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Concepto\\\\\\" }\\",\\"fk_catalogo\\":\\"89\\"},{\\"id\\":\\"953\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"ImporteGravado\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"decimal(18,6)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"ImporteGravado\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"ImporteGravado\\\\\\" }\\",\\"fk_catalogo\\":\\"89\\"},{\\"id\\":\\"954\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"ImporteExcento\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"decimal(18,6)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"ImporteExcento\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"ImporteExcento\\\\\\" }\\",\\"fk_catalogo\\":\\"89\\"},{\\"id\\":\\"955\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"TipoPercepcion\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(50)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"TipoPercepcion\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"TipoPercepcion\\\\\\" }\\",\\"fk_catalogo\\":\\"89\\"},{\\"id\\":\\"956\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_nomina\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_nomina\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Fk_nomina\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"89\\"}]"}', 88),
(958, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 90),
(959, '', '', 'fk_TipoDeduccion', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Tipo Deduccion","ayuda":"Tipo Deduccion","requerido":"0","oculto":"0","editable":"1","target":"78","campo_a_mostrar":"descripcion"}', 90),
(960, '', '', 'TipoDeduccion', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"TipoDeduccion","ayuda":"TipoDeduccion","requerido":"0","oculto":"1","editable":"1"}', 90),
(961, '', '', 'Clave', '', 'NO', 'int(15)', 'Text Input', '{"etiqueta":"Clave","requerido":"0","editable":"1","oculto":"0","ayuda":"Clave" }', 90),
(962, '', '', 'Concepto', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Concepto","requerido":"0","editable":"1","oculto":"0","ayuda":"Concepto" }', 90),
(963, '', '', 'ImporteGravado', '', 'NO', 'decimal(18,6)', 'Text Input', '{"etiqueta":"ImporteGravado","requerido":"0","editable":"1","oculto":"0","ayuda":"ImporteGravado" }', 90),
(964, '', '', 'ImporteExcento', '', 'NO', 'decimal(18,6)', 'Text Input', '{"etiqueta":"ImporteExcento","requerido":"0","editable":"1","oculto":"0","ayuda":"ImporteExcento" }', 90),
(965, '', '', 'fk_nomina', '', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Fk_nomina","ayuda":"Fk_nomina","requerido":"0","oculto":"1","editable":"1"}', 90),
(966, '', '', 'deducciones', '', '', '', 'Tabla', '{"titulo":"Deducciones","ayuda":"Deducciones","editable":"1","target":"90","llave_foranea":"fk_nomina","config_tabla":"[{\\"id\\":\\"958\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"90\\"},{\\"id\\":\\"959\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_TipoDeduccion\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Tipo Deduccion\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Tipo Deduccion\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"78\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"descripcion\\\\\\"}\\",\\"fk_catalogo\\":\\"90\\"},{\\"id\\":\\"960\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"TipoDeduccion\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(100)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"TipoDeduccion\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"TipoDeduccion\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"90\\"},{\\"id\\":\\"961\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"Clave\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(15)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Clave\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Clave\\\\\\" }\\",\\"fk_catalogo\\":\\"90\\"},{\\"id\\":\\"962\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"Concepto\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(100)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Concepto\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Concepto\\\\\\" }\\",\\"fk_catalogo\\":\\"90\\"},{\\"id\\":\\"963\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"ImporteGravado\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"decimal(18,6)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"ImporteGravado\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"ImporteGravado\\\\\\" }\\",\\"fk_catalogo\\":\\"90\\"},{\\"id\\":\\"964\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"ImporteExcento\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"decimal(18,6)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"ImporteExcento\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"ImporteExcento\\\\\\" }\\",\\"fk_catalogo\\":\\"90\\"},{\\"id\\":\\"965\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_nomina\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_nomina\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Fk_nomina\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"90\\"}]"}', 88),
(967, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 91),
(968, '', '', 'DiasIncapacidad', '', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"DiasIncapacidad","requerido":"0","editable":"1","oculto":"0","ayuda":"DiasIncapacidad" }', 91),
(969, '', '', 'fk_TipoIncapacidad', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Tipo Incapacidad","ayuda":"Tipo Incapacidad","requerido":"0","oculto":"0","editable":"1","target":"79","campo_a_mostrar":"descripcion"}', 91),
(970, '', '', 'TipoIncapacidad', '', 'NO', 'char(15)', 'Text Input', '{"etiqueta":"TipoIncapacidad","ayuda":"TipoIncapacidad","requerido":"0","oculto":"1","editable":"1"}', 91),
(971, '', '', 'Descuento', '', 'NO', 'decimal(18,6)', 'Text Input', '{"etiqueta":"Descuento","requerido":"0","editable":"1","oculto":"0","ayuda":"Descuento" }', 91),
(972, '', '', 'fk_nomina', '', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Fk_nomina","requerido":"0","editable":"1","oculto":"0","ayuda":"Fk_nomina" }', 91),
(973, '', '', 'incapacidades', '', '', '', 'Tabla', '{"titulo":"Incapacidades","ayuda":"Incapacidades","editable":"1","target":"91","llave_foranea":"fk_nomina","config_tabla":"[{\\"id\\":\\"967\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"91\\"},{\\"id\\":\\"968\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"DiasIncapacidad\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"DiasIncapacidad\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"DiasIncapacidad\\\\\\" }\\",\\"fk_catalogo\\":\\"91\\"},{\\"id\\":\\"969\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_TipoIncapacidad\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Tipo Incapacidad\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Tipo Incapacidad\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"79\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"descripcion\\\\\\"}\\",\\"fk_catalogo\\":\\"91\\"},{\\"id\\":\\"970\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"TipoIncapacidad\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(15)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"TipoIncapacidad\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"TipoIncapacidad\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"91\\"},{\\"id\\":\\"971\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"Descuento\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"decimal(18,6)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Descuento\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Descuento\\\\\\" }\\",\\"fk_catalogo\\":\\"91\\"},{\\"id\\":\\"972\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_nomina\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_nomina\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Fk_nomina\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"91\\"}]"}', 88),
(974, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(1)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 92),
(975, '', '', 'nombre', '', 'NO', 'char(100)', 'Text Input', '{"etiqueta":"Nombre","requerido":"0","editable":"1","oculto":"0","ayuda":"Nombre" }', 92),
(976, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","ayuda":"Id","requerido":"0","oculto":"1","editable":"1"}', 93),
(977, '', '', 'Dias', '', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Dias","requerido":"0","editable":"1","oculto":"0","ayuda":"Dias" }', 93),
(978, '', '', 'TipoHoras', '', 'NO', 'char(50)', 'Text Input', '{"etiqueta":"TipoHoras","ayuda":"TipoHoras","requerido":"0","oculto":"1","editable":"1"}', 93),
(979, '', '', 'fk_TipoHoras', '', 'NO', 'int(11)', 'Combo Box', '{"etiqueta":"Tipo Horas","ayuda":"Tipo Horas","requerido":"0","oculto":"0","editable":"1","target":"92","campo_a_mostrar":"nombre"}', 93),
(980, '', '', 'HorasExtra', '', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"HorasExtra","requerido":"0","editable":"1","oculto":"0","ayuda":"HorasExtra" }', 93),
(981, '', '', 'ImportePagado', '', 'NO', 'decimal(18,6)', 'Text Input', '{"etiqueta":"ImportePagado","requerido":"0","editable":"1","oculto":"0","ayuda":"ImportePagado" }', 93),
(982, '', '', 'fk_nomina', '', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Fk_nomina","ayuda":"Fk_nomina","requerido":"0","oculto":"1","editable":"1"}', 93);
INSERT INTO `constructor_elemento_catalogo` (`id`, `esDefault`, `extras`, `campo`, `llave`, `esNulo`, `tipo`, `componente`, `comp_config`, `fk_catalogo`) VALUES
(983, '', '', 'horas_extra', '', '', '', 'Tabla', '{"titulo":"Horas Extra","ayuda":"Horas Extra","editable":"1","target":"93","llave_foranea":"fk_nomina","config_tabla":"[{\\"id\\":\\"976\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"93\\"},{\\"id\\":\\"977\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"Dias\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Dias\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Dias\\\\\\" }\\",\\"fk_catalogo\\":\\"93\\"},{\\"id\\":\\"978\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"TipoHoras\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(50)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"TipoHoras\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"TipoHoras\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"93\\"},{\\"id\\":\\"979\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_TipoHoras\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Tipo Horas\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Tipo Horas\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"92\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"nombre\\\\\\"}\\",\\"fk_catalogo\\":\\"93\\"},{\\"id\\":\\"980\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"HorasExtra\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"HorasExtra\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"HorasExtra\\\\\\" }\\",\\"fk_catalogo\\":\\"93\\"},{\\"id\\":\\"981\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"ImportePagado\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"decimal(18,6)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"ImportePagado\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"ImportePagado\\\\\\" }\\",\\"fk_catalogo\\":\\"93\\"},{\\"id\\":\\"982\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_nomina\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_nomina\\\\\\",\\\\\\"ayuda\\\\\\":\\\\\\"Fk_nomina\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"1\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\"}\\",\\"fk_catalogo\\":\\"93\\"}]"}', 88);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constructor_tabla`
--

CREATE TABLE IF NOT EXISTS `constructor_tabla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
-- Estructura de tabla para la tabla `facturacion_certificados`
--

CREATE TABLE IF NOT EXISTS `facturacion_certificados` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `facturacion_certificados`
--

INSERT INTO `facturacion_certificados` (`id`, `fk_razon_social`, `no_serie`, `cer_pem`, `key_pem`, `pass`, `valido_desde`, `valido_hasta`, `es_default`) VALUES
(1, 1, '20001000000100005867', '-----BEGIN CERTIFICATE-----MIIEdDCCA1ygAwIBAgIUMjAwMDEwMDAwMDAxMDAwMDU4NjcwDQYJKoZIhvcNAQEFBQAwggFvMRgwFgYDVQQDDA9BLkMuIGRlIHBydWViYXMxLzAtBgNVBAoMJlNlcnZpY2lvIGRlIEFkbWluaXN0cmFjacOzbiBUcmlidXRhcmlhMTgwNgYDVQQLDC9BZG1pbmlzdHJhY2nDs24gZGUgU2VndXJpZGFkIGRlIGxhIEluZm9ybWFjacOzbjEpMCcGCSqGSIb3DQEJARYaYXNpc25ldEBwcnVlYmFzLnNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxEjAQBgNVBAcMCUNveW9hY8OhbjEVMBMGA1UELRMMU0FUOTcwNzAxTk4zMTIwMAYJKoZIhvcNAQkCDCNSZXNwb25zYWJsZTogSMOpY3RvciBPcm5lbGFzIEFyY2lnYTAeFw0xMjA3MjcxNzAyMDBaFw0xNjA3MjcxNzAyMDBaMIHbMSkwJwYDVQQDEyBBQ0NFTSBTRVJWSUNJT1MgRU1QUkVTQVJJQUxFUyBTQzEpMCcGA1UEKRMgQUNDRU0gU0VSVklDSU9TIEVNUFJFU0FSSUFMRVMgU0MxKTAnBgNVBAoTIEFDQ0VNIFNFUlZJQ0lPUyBFTVBSRVNBUklBTEVTIFNDMSUwIwYDVQQtExxBQUEwMTAxMDFBQUEgLyBIRUdUNzYxMDAzNFMyMR4wHAYDVQQFExUgLyBIRUdUNzYxMDAzTURGUk5OMDkxETAPBgNVBAsTCFVuaWRhZCAxMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC2TTQSPONBOVxpXv9wLYo8jezBrb34i/tLx8jGdtyy27BcesOav2c1NS/Gdv10u9SkWtwdy34uRAVe7H0a3VMRLHAkvp2qMCHaZc4T8k47Jtb9wrOEh/XFS8LgT4y5OQYo6civfXXdlvxWU/gdM/e6I2lg6FGorP8H4GPAJ/qCNwIDAQABox0wGzAMBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BAQUFAAOCAQEATxMecTpMbdhSHo6KVUg4QVF4Op2IBhiMaOrtrXBdJgzGotUFcJgdBCMjtTZXSlq1S4DG1jr8p4NzQlzxsdTxaB8nSKJ4KEMgIT7E62xRUj15jI49qFz7f2uMttZLNThipunsN/NF1XtvESMTDwQFvas/Ugig6qwEfSZc0MDxMpKLEkEePmQwtZD+zXFSMVa6hmOu4M+FzGiRXbj4YJXn9Myjd8xbL/c+9UIcrYoZskxDvMxc6/6M3rNNDY3OFhBK+V/sPMzWWGt8S1yjmtPfXgFs1t65AZ2hcTwTAuHrKwDatJ1ZPfa482ZBROAAX1waz7WwXp0gso7sDCm2/yUVww==-----END CERTIFICATE-----', '-----BEGIN PRIVATE KEY-----MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALZNNBI840E5XGle/3AtijyN7MGtvfiL+0vHyMZ23LLbsFx6w5q/ZzU1L8Z2/XS71KRa3B3Lfi5EBV7sfRrdUxEscCS+naowIdplzhPyTjsm1v3Cs4SH9cVLwuBPjLk5BijpyK99dd2W/FZT+B0z97ojaWDoUais/wfgY8An+oI3AgMBAAECgYAyEeJLYA3KzEZlaoId/WQKXbC5QU78BPZwSd8LI3paZZx6yf0Pc6KVKpaEnAnhFfXBbnMme82cR3JyL+Hsjv1RMxz2aOQFmj1lSJAth3w4aAYx2gZzo0Hqg9Qjn/Bew/ChaDAwvDGqpbVfOeZkVuF36hqdgvXh4nD3POLnoXctgQJBAOrygWhspAauyzBsy8ZhHBS84iwlJbZ64RE+95d3sMGCIuW00+FOUxtD4bz0xbCaV3zkbGAntpjcGx5r1fN2ucMCQQDGowycldpEtqZyvgm2XnIRcHA8U3d71xVMguSQqIHrk+BYBdmdB9A86jhMS4CDDfxQPWT6k3ZlydAdwbFBDBp9AkBVqLDRt7pdzWC7eQ8adtFcJjl3yttjGo3wUbrHeJXzF1VN1o3heUMHj8o/sCZbawo2uLlinVgPh0BD6SEKMOEtAkAEVlUVKjR84Zwaz0l5APDurozU1GG8g4LEi+sfuX40vaLdaStKQXxriBW4nMFumySSP/Tvf77LFDAGJk+PgwslAkEArlH6rpmldpCH70qPwOeqd8a+5qikPTfg5e9z+uEjtT1aA0VksKtKo7lfeCSqV9Xk+5QZ4nZRw6djgyVGmEtdaw==-----END PRIVATE KEY-----', '12345678a', '2012-07-27 11:02:00', '2016-07-27 11:02:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion_config`
--

CREATE TABLE IF NOT EXISTS `facturacion_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timbres_disponibles` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `facturacion_config`
--

INSERT INTO `facturacion_config` (`id`, `timbres_disponibles`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion_razones_sociales`
--

CREATE TABLE IF NOT EXISTS `facturacion_razones_sociales` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `facturacion_razones_sociales`
--

INSERT INTO `facturacion_razones_sociales` (`id`, `rfc`, `razon_social`, `nombre_comercial`, `RegistroPatronal`, `datos_de_contacto`, `logo_factura`, `fk_pais`, `fk_estado`, `fk_ciudad`, `fk_municipio`, `calle`, `noExterior`, `noInterior`, `colonia`, `localidad`, `referencia`, `codigoPostal`, `email_bcc`) VALUES
(1, 'AAA010101AAA', 'Razon Social Prueba', 'Nombre Comercial Prueba', '', '', 'triples.jpg', 1, 25, 0, 2844, 'conocida', '000', 'Ext 000', 'Fracc. Conocido', 'mazatlan', '', '82100', 'email@email.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion_regimenes`
--

CREATE TABLE IF NOT EXISTS `facturacion_regimenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regimen` char(255) DEFAULT NULL,
  `fk_razon_social` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `facturacion_regimenes`
--

INSERT INTO `facturacion_regimenes` (`id`, `regimen`, `fk_razon_social`) VALUES
(1, 'Regimen Prueba', 1),
(2, 'Otro Regimen', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `makinas_corte`
--

CREATE TABLE IF NOT EXISTS `makinas_corte` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Volcado de datos para la tabla `makinas_corte`
--

INSERT INTO `makinas_corte` (`id`, `fk_maquina`, `fk_cliente`, `fk_pdv`, `fk_tecnico`, `cont_entrada`, `cont_salida`, `saldo_contadores`, `dato_de_la_placa`, `monto`, `fecha`, `fk_serie`, `folio`, `diferencia`) VALUES
(27, 1, 1, 1, 1, '23.000000', '32.000000', '32.000000', '', '43.000000', '2013-12-18 17:57:00', 1, 5, 23),
(28, 1, 1, 1, 1, '0.000000', '0.000000', '0.000000', '', '0.000000', '2013-12-19 09:26:00', 1, 6, 0),
(29, 1, 1, 1, 1, '0.000000', '0.000000', '0.000000', '', '0.000000', '2013-12-19 09:26:00', 1, 7, 0),
(30, 1, 1, 1, 1, '0.000000', '0.000000', '0.000000', '', '0.000000', '2013-12-19 15:11:00', 1, 8, 0),
(31, 1, 1, 1, 1, '35466435.000000', '3456.000000', '3455.000000', '', '4567.000000', '2013-12-19 15:11:00', 1, 9, 3456);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `makinas_maquina`
--

CREATE TABLE IF NOT EXISTS `makinas_maquina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  `ganancias` decimal(18,2) NOT NULL,
  `gastos` decimal(18,2) NOT NULL,
  `saldo` decimal(18,2) NOT NULL,
  `descripcion` char(255) NOT NULL,
  `fk_owner` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `makinas_maquina`
--

INSERT INTO `makinas_maquina` (`id`, `nombre`, `ganancias`, `gastos`, `saldo`, `descripcion`, `fk_owner`) VALUES
(1, 'Garage', '0.00', '0.00', '0.00', 'Esta es la descripcion de la maquina', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `makinas_serie`
--

CREATE TABLE IF NOT EXISTS `makinas_serie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serie` char(50) NOT NULL,
  `fk_owner` int(11) NOT NULL,
  `folio_sig` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `makinas_serie`
--

INSERT INTO `makinas_serie` (`id`, `serie`, `fk_owner`, `folio_sig`) VALUES
(1, 'A', 1, 10),
(2, 'B', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `makina_cliente`
--

CREATE TABLE IF NOT EXISTS `makina_cliente` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `makina_cliente`
--

INSERT INTO `makina_cliente` (`id`, `nombre`, `email`, `datos_de_contacto`, `calle`, `numero_interior`, `numero_exterior`, `colonia`, `localidad`, `referencia`, `fk_pais`, `fk_estado`, `fk_municipio`) VALUES
(1, 'Cliente Test', '', '', '', '', '', '', '', '', 1, 1, 2489);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `makina_owner`
--

CREATE TABLE IF NOT EXISTS `makina_owner` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `makina_owner`
--

INSERT INTO `makina_owner` (`id`, `nombre`, `email`, `datos_de_contacto`, `calle`, `numero_interior`, `numero_exterior`, `colonia`, `localidad`, `referencia`, `fk_pais`, `fk_estado`, `fk_municipio`) VALUES
(1, 'Don Julio', '', '', '', '', '', '', '', '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `makina_punto_de_venta`
--

CREATE TABLE IF NOT EXISTS `makina_punto_de_venta` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `makina_punto_de_venta`
--

INSERT INTO `makina_punto_de_venta` (`id`, `nombre`, `datos_de_contacto`, `calle`, `numero_interior`, `numero_exterior`, `colonia`, `localidad`, `referencia`, `fk_pais`, `fk_estado`, `fk_municipio`, `fk_cliente`) VALUES
(1, 'Un Punto', 'una', '125', '00', '', 'libertad', '', '', 1, 25, 2844, 1),
(2, '', '', '', '', '', '', '', '', 1, 3, 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `makina_tecnico`
--

CREATE TABLE IF NOT EXISTS `makina_tecnico` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `makina_tecnico`
--

INSERT INTO `makina_tecnico` (`id`, `nombre`, `email`, `datos_de_contacto`, `calle`, `numero_interior`, `numero_exterior`, `colonia`, `localidad`, `referencia`, `fk_pais`, `fk_estado`, `fk_municipio`) VALUES
(1, 'Tecnico Test', '', '', '', '', '', '', '', '', 1, 1, 2489);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_bancos`
--

CREATE TABLE IF NOT EXISTS `nomina_bancos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` char(5) NOT NULL,
  `nombre_corto` char(50) NOT NULL,
  `nombre_o_razon_social` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `nomina_bancos`
--

INSERT INTO `nomina_bancos` (`id`, `clave`, `nombre_corto`, `nombre_o_razon_social`) VALUES
(1, '002', 'BANAMEX', 'Banco Nacional de México, S.A., Institución de banca Múltiple, Grupo Financiero Banamex');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_deducciones`
--

CREATE TABLE IF NOT EXISTS `nomina_deducciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_TipoDeduccion` int(11) NOT NULL,
  `TipoDeduccion` char(100) NOT NULL,
  `Clave` int(15) NOT NULL,
  `Concepto` char(100) NOT NULL,
  `ImporteGravado` decimal(18,6) NOT NULL,
  `ImporteExcento` decimal(18,6) NOT NULL,
  `fk_nomina` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `nomina_deducciones`
--

INSERT INTO `nomina_deducciones` (`id`, `fk_TipoDeduccion`, `TipoDeduccion`, `Clave`, `Concepto`, `ImporteGravado`, `ImporteExcento`, `fk_nomina`) VALUES
(1, 1, '', 0, '', '0.000000', '0.000000', 0),
(2, 1, '', 4, '214sf', '123.000000', '123.000000', 1),
(3, 0, '', 0, '', '0.000000', '0.000000', 2),
(4, 0, '', 0, '', '0.000000', '0.000000', 3),
(5, 0, '', 0, '', '0.000000', '0.000000', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_departamento`
--

CREATE TABLE IF NOT EXISTS `nomina_departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(100) NOT NULL,
  `codigo` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `nomina_departamento`
--

INSERT INTO `nomina_departamento` (`id`, `nombre`, `codigo`) VALUES
(1, 'Sistemas', ''),
(2, 'Soporte Técnico', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_horas_extra`
--

CREATE TABLE IF NOT EXISTS `nomina_horas_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Dias` int(11) NOT NULL,
  `TipoHoras` char(50) NOT NULL,
  `fk_TipoHoras` int(11) NOT NULL,
  `HorasExtra` int(11) NOT NULL,
  `ImportePagado` decimal(18,6) NOT NULL,
  `fk_nomina` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `nomina_horas_extra`
--

INSERT INTO `nomina_horas_extra` (`id`, `Dias`, `TipoHoras`, `fk_TipoHoras`, `HorasExtra`, `ImportePagado`, `fk_nomina`) VALUES
(1, 2, '', 1, 3, '100.000000', 1),
(2, 0, '', 0, 0, '0.000000', 2),
(3, 0, '', 0, 0, '0.000000', 3),
(4, 0, '', 0, 0, '0.000000', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_incapacidades`
--

CREATE TABLE IF NOT EXISTS `nomina_incapacidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DiasIncapacidad` int(11) NOT NULL,
  `fk_TipoIncapacidad` int(11) NOT NULL,
  `TipoIncapacidad` char(15) NOT NULL,
  `Descuento` decimal(18,6) NOT NULL,
  `fk_nomina` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `nomina_incapacidades`
--

INSERT INTO `nomina_incapacidades` (`id`, `DiasIncapacidad`, `fk_TipoIncapacidad`, `TipoIncapacidad`, `Descuento`, `fk_nomina`) VALUES
(1, 0, 1, '', '0.000000', 0),
(2, 4, 2, '', '0.000000', 1),
(3, 0, 0, '', '0.000000', 2),
(4, 0, 0, '', '0.000000', 3),
(5, 0, 0, '', '0.000000', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_jornada`
--

CREATE TABLE IF NOT EXISTS `nomina_jornada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `nomina_jornada`
--

INSERT INTO `nomina_jornada` (`id`, `nombre`) VALUES
(1, 'Diurna'),
(2, 'Nocturna'),
(3, 'Mixta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_nomina`
--

CREATE TABLE IF NOT EXISTS `nomina_nomina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_patron` int(11) NOT NULL,
  `fk_empleado` int(11) NOT NULL,
  `fk_serie` int(11) NOT NULL,
  `serie` char(20) NOT NULL,
  `folio` char(10) NOT NULL,
  `Version` char(5) NOT NULL,
  `RegistroPatronal` char(20) NOT NULL,
  `NumEmpleado` char(15) NOT NULL,
  `CURP` int(50) NOT NULL,
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
  `Antiguedad` decimal(18,6) NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `nomina_nomina`
--

INSERT INTO `nomina_nomina` (`id`, `fk_patron`, `fk_empleado`, `fk_serie`, `serie`, `folio`, `Version`, `RegistroPatronal`, `NumEmpleado`, `CURP`, `fk_TipoRegimen`, `TipoRegimen`, `NumSeguridadSocial`, `FechaPago`, `FechaInicialPago`, `FechaFinalPago`, `NumDiasPagados`, `fk_Departamento`, `Departamento`, `CLABE`, `Banco`, `FechaInicioRelLaboral`, `Antiguedad`, `Puesto`, `TipoContrato`, `TipoJornada`, `PeriodicidadPago`, `SalarioBaseCotApor`, `RiesgoPuesto`, `SalarioDiarioIntegrado`, `fk_banco`, `fk_RiesgoPuesto`, `percepcionesTotalGravado`, `percepcionesTotalExcento`, `deduccionesTotalGravado`, `deduccionesTotalExcento`) VALUES
(1, 1, 1, 1, '', '1', '', '', '', 0, 4, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, '', '', '', '0000-00-00 00:00:00', '0.000000', '', '2', '1', '1', '0.000000', '', '0.000000', 1, 1, '0.000000', '0.000000', '0.000000', '0.000000'),
(2, 1, 1, 1, 'A', '1', '', '', '', 0, 1, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, '', '', '', '0000-00-00 00:00:00', '0.000000', '', '1', '1', '1', '0.000000', '', '0.000000', 1, 1, '0.000000', '0.000000', '0.000000', '0.000000'),
(3, 1, 1, 1, '', '', '', '', '', 0, 1, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, '', '', '', '0000-00-00 00:00:00', '0.000000', '', '1', '1', '1', '0.000000', '', '0.000000', 1, 1, '0.000000', '0.000000', '0.000000', '0.000000'),
(4, 1, 1, 1, '', '', '', '', '', 0, 1, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, '', '', '', '0000-00-00 00:00:00', '0.000000', '', '1', '1', '1', '0.000000', '', '0.000000', 1, 1, '0.000000', '0.000000', '0.000000', '0.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_percepciones`
--

CREATE TABLE IF NOT EXISTS `nomina_percepciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_TipoPercepcion` int(11) NOT NULL,
  `Clave` char(15) NOT NULL,
  `Concepto` char(100) NOT NULL,
  `ImporteGravado` decimal(18,6) NOT NULL,
  `ImporteExcento` decimal(18,6) NOT NULL,
  `TipoPercepcion` char(50) NOT NULL,
  `fk_nomina` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `nomina_percepciones`
--

INSERT INTO `nomina_percepciones` (`id`, `fk_TipoPercepcion`, `Clave`, `Concepto`, `ImporteGravado`, `ImporteExcento`, `TipoPercepcion`, `fk_nomina`) VALUES
(1, 1, '', 'sdfg', '0.000000', '0.000000', '', 0),
(2, 1, '', '', '0.000000', '0.000000', '', 0),
(3, 1, 'asdf', 'asdf', '234.000000', '2434.000000', '234', 1),
(4, 0, '', '', '0.000000', '0.000000', '', 2),
(5, 0, '', '', '0.000000', '0.000000', '', 3),
(6, 0, '', '', '0.000000', '0.000000', '', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_periodicidad_pago`
--

CREATE TABLE IF NOT EXISTS `nomina_periodicidad_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` char(50) NOT NULL,
  `dias` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `nomina_periodicidad_pago`
--

INSERT INTO `nomina_periodicidad_pago` (`id`, `descripcion`, `dias`) VALUES
(1, 'Diario', 1),
(2, 'Semanal', 7),
(3, 'Quincenal', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_regimen_contratacion`
--

CREATE TABLE IF NOT EXISTS `nomina_regimen_contratacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` char(4) NOT NULL,
  `nombre` char(100) NOT NULL,
  `descripcion` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `nomina_regimen_contratacion`
--

INSERT INTO `nomina_regimen_contratacion` (`id`, `clave`, `nombre`, `descripcion`) VALUES
(1, '1', 'Asimilados a salarios', ''),
(2, '2', 'Sueldos y salarios', ''),
(3, '3', 'Jubilados', ''),
(4, '4', 'Pensiones', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_riesgo_puesto`
--

CREATE TABLE IF NOT EXISTS `nomina_riesgo_puesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` char(5) NOT NULL,
  `descripcion` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `nomina_riesgo_puesto`
--

INSERT INTO `nomina_riesgo_puesto` (`id`, `clave`, `descripcion`) VALUES
(1, '1', 'Clase I'),
(2, '2', 'Clase II'),
(3, '3', 'Clase III'),
(4, '4', 'Clase IV'),
(5, '5', 'Clase V');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_series`
--

CREATE TABLE IF NOT EXISTS `nomina_series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serie` char(5) NOT NULL,
  `sig_folio` int(11) DEFAULT NULL,
  `es_default` bit(1) DEFAULT NULL,
  `documento` varchar(50) NOT NULL,
  `fk_razon_social` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `nomina_series`
--

INSERT INTO `nomina_series` (`id`, `serie`, `sig_folio`, `es_default`, `documento`, `fk_razon_social`) VALUES
(1, 'A', 13, b'1', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_tipo_deduccion`
--

CREATE TABLE IF NOT EXISTS `nomina_tipo_deduccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` char(5) NOT NULL,
  `descripcion` char(100) NOT NULL,
  `comentario` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `nomina_tipo_deduccion`
--

INSERT INTO `nomina_tipo_deduccion` (`id`, `clave`, `descripcion`, `comentario`) VALUES
(1, '001', 'Seguridad Social', ''),
(2, '002', 'ISR', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_tipo_horas`
--

CREATE TABLE IF NOT EXISTS `nomina_tipo_horas` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `nombre` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `nomina_tipo_horas`
--

INSERT INTO `nomina_tipo_horas` (`id`, `nombre`) VALUES
(1, 'Dobles'),
(2, 'Triples');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_tipo_incapacidad`
--

CREATE TABLE IF NOT EXISTS `nomina_tipo_incapacidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` char(5) NOT NULL,
  `descripcion` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `nomina_tipo_incapacidad`
--

INSERT INTO `nomina_tipo_incapacidad` (`id`, `clave`, `descripcion`) VALUES
(1, '1', 'Riesgo de trabajo'),
(2, '2', 'Enfermedad en general'),
(3, '3', 'Maternidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_tipo_percepcion`
--

CREATE TABLE IF NOT EXISTS `nomina_tipo_percepcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` char(50) NOT NULL,
  `descripcion` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `nomina_tipo_percepcion`
--

INSERT INTO `nomina_tipo_percepcion` (`id`, `clave`, `descripcion`) VALUES
(1, '001', 'Sueldos, Salarios, Rayas y Jornales'),
(2, '002', 'Gratificación Anual (Aguinaldo)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_trabajador`
--

CREATE TABLE IF NOT EXISTS `nomina_trabajador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(100) NOT NULL,
  `rfc` char(20) NOT NULL,
  `NoEmpleado` char(15) NOT NULL,
  `fk_RiesgoPuesto` int(11) NOT NULL,
  `fk_Puesto` int(11) NOT NULL,
  `FechaInicioRelLaboral` int(11) NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `nomina_trabajador`
--

INSERT INTO `nomina_trabajador` (`id`, `nombre`, `rfc`, `NoEmpleado`, `fk_RiesgoPuesto`, `fk_Puesto`, `FechaInicioRelLaboral`, `fk_TipoContrato`, `fk_PeriodicidadPago`, `fk_TipoJornada`, `Salario`, `email`, `CURP`, `fk_TipoRegimen`, `NumSeguridadSocial`, `calle`, `noExterior`, `noInterior`, `colonia`, `localidad`, `referencia`, `fk_pais`, `fk_estado`, `fk_municipio`, `codigoPostal`) VALUES
(1, 'Cesar Octavio', 'BIAC810830TH2', '001', 0, 0, 0, 0, 0, 0, '0.000000', 'cbibriesca@hotmail.com', 'BIAC810830HSLBLS02', 1, '23028127597', '', '', '', '', '', '', 1, 25, 2844, '82180');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pendienthon_empresa`
--

CREATE TABLE IF NOT EXISTS `pendienthon_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  `contacto` char(255) NOT NULL,
  `logo` char(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `pendienthon_empresa`
--

INSERT INTO `pendienthon_empresa` (`id`, `nombre`, `contacto`, `logo`) VALUES
(1, 'Soluciones Triples', '', ''),
(2, 'Demo', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pendienthon_evento`
--

CREATE TABLE IF NOT EXISTS `pendienthon_evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `descripcion` char(255) NOT NULL,
  `fk_autor` int(11) NOT NULL,
  `estado` char(255) NOT NULL,
  `fk_reporte` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `pendienthon_evento`
--

INSERT INTO `pendienthon_evento` (`id`, `fecha`, `descripcion`, `fk_autor`, `estado`, `fk_reporte`) VALUES
(1, '0000-00-00 00:00:00', 'wqasdf', 0, '', 2),
(2, '0000-00-00 00:00:00', 'sadf', 0, '', 2),
(3, '0000-00-00 00:00:00', '', 2, '', 2),
(4, '0000-00-00 00:00:00', '', 3, '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pendienthon_reporte`
--

CREATE TABLE IF NOT EXISTS `pendienthon_reporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `num_reporte` char(255) NOT NULL,
  `fk_autor` int(11) NOT NULL,
  `fk_solicitante` int(11) NOT NULL,
  `fk_empresa` int(11) NOT NULL,
  `status` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `pendienthon_reporte`
--

INSERT INTO `pendienthon_reporte` (`id`, `descripcion`, `num_reporte`, `fk_autor`, `fk_solicitante`, `fk_empresa`, `status`) VALUES
(1, 'Las camaras no funcionan', '150', 3, 2, 2, 'A'),
(2, 'asdf', '150', 1, 2, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pendienthon_usuarios`
--

CREATE TABLE IF NOT EXISTS `pendienthon_usuarios` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `pendienthon_usuarios`
--

INSERT INTO `pendienthon_usuarios` (`id`, `nick`, `nombre`, `email`, `pass`, `ip_login`, `last_login`, `fk_rol`, `fk_empresa`) VALUES
(1, 'cesar', 'Cesar', 'email@cesar.com', '', '', '0000-00-00 00:00:00', 1, 0),
(2, 'diego', 'Diego', '', '', '', '0000-00-00 00:00:00', 1, 1),
(3, 'carlos', 'Carlos', '', '', '', '0000-00-00 00:00:00', 1, 1),
(4, 'secre', 'secre', '', '', '', '0000-00-00 00:00:00', 4, 2),
(5, '', '', '', '', '', '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pentienthon_rol`
--

CREATE TABLE IF NOT EXISTS `pentienthon_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) NOT NULL,
  `descripcion` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `pentienthon_rol`
--

INSERT INTO `pentienthon_rol` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Tecnico', ''),
(2, 'Supervisor', ''),
(3, 'Auxiliar', ''),
(4, 'Trabajador', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- Volcado de datos para la tabla `system_catalogos`
--

INSERT INTO `system_catalogos` (`id`, `fk_modulo`, `nombre`, `controlador`, `modelo`, `tabla`, `pk_tabla`, `icono`, `titulo_nuevo`, `titulo_edicion`, `titulo_busqueda`, `msg_creado`, `msg_actualizado`, `pregunta_eliminar`, `msg_eliminado`, `msg_cambios`, `campos_busqueda`) VALUES
(18, 2, 'Usuarios', 'usuarios', 'Usuario', 'system_usuarios', 'id', 'http://png.findicons.com/files/icons/1620/crystal_project/64/personal.png', 'Nuevo Usuario', '''Usuario: '' + getValorCampo(''nombre'')', 'Buscar Usuario', 'Usuario Creado', 'Usuario Actualizado', '¿Eliminar Usuario?', '', '', 'nick, email, name'),
(32, 2, 'Modulos', 'modulos', 'modulo', 'system_modulos', 'id', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', 'Nuevo Modulo', '''Modulo: '' + getValorCampo(''nombre'')', 'Modulos', 'Modulo Creado', 'Modulo Actualizado', '¿Eliminar Modulo?', '', '', ''),
(33, 2, 'Catalogos', 'catalogos', 'Catalogo', 'system_catalogos', 'id', 'http://png.findicons.com/files/icons/577/refresh_cl/48/windows_view_icon.png', 'Nuevo Catalogo', '''Catalogo: '' + getValorCampo(''nombre'')', '''Buscar Catalogos''', 'Catalogo Creado', 'Catalogo Actualizado', 'Eliminar Catalogo', 'Catalogo Eliminado', 'Ha hecho cambios en el catalogo,ï¿½Guardar antes de salir?', 'nombre'),
(40, 2, 'Paginas', 'paginas', 'pagina', 'system_pagina', 'id', 'default.png', 'Nueva Pagina', '''Pagina:  '' + getValorCampo(''titulo'')', 'Buscar Paginas', 'Pagina Creada', 'Pagina Actualizada', 'Â¿Eliminar Pagina?', 'Pagina Eliminada', 'Desea Guardar los cambios', 'nombre'),
(41, 2, 'Elemento del Catalogo', 'elementos', 'elemento', 'constructor_elemento_catalogo', 'id', '', 'Nuevo Elemento', '''Editar Elemento''', 'Buscar Elemento', 'Elemento Creado', 'Elemento Actualizado', 'Â¿Eliminar Elemento?', 'Elemento Eliminado', 'Â¿Guardar Cambios del Elemento?', 'Field, componente'),
(42, 2, 'Modelo C', 'modelos', 'modeloc', 'system_modelos', 'id', '', 'Nuevo Modelo', '''Editando Modelo: ''+ getValorCampo(''nombre'')', 'Buscar Modelo', '', '', '', '', '', 'nombre'),
(43, 2, 'Autor', 'autores', 'autor', 'system_users', 'id', '', 'Nuevo Autor', '''Autor: ''+getValorCampo(''name'')', 'Busqueda de Autores', 'Autor Creado', 'Autor Actualizado', 'Â¿Eliminar?', 'Eliminado', 'cambios pendientes', 'name'),
(44, 2, 'UM', 'unidades', 'unidad', 'exp_um', 'id', '', 'Nueva Unidad de Medida', '''UM: '' +getValorCampo(''nombre'')', 'Buscar Unidades de Medida', 'UM creada', 'UM actualizada', 'Â¿Eliminar UM?', 'UM eliminada', 'Â¿Guardar los cambios?', 'nombre, abreviacion'),
(45, 2, 'Categoria', 'categorias', 'categoria', 'cms_categoria', 'id', '', 'Nueva Categoria', '''Categoria: '' + getValorCampo(''nombre'')', 'Buscar Categoria', 'Categoria Creada', 'Categoria Actualizada', 'Â¿Eliminar Categoria?', '', '', 'nombre'),
(46, 2, 'Conceptos', 'conceptos', 'concepto', 'exp_concepto', 'id', '', 'Nuevo Concepto', '''Concepto: '' + getValorCampo(''nombre'')', 'Conceptos', 'Concepto Creado', 'Concepto Actualizado', 'Â¿Eliminar Concepto?', 'Concepto Eliminado', 'Â¿Guardar antes de salir?', 'nombre'),
(47, 2, 'Cotizacion', 'cotizaciones', 'cotizacion', 'exp_cotizacion', 'id', '', 'Nueva Cotizacion', '''Cotizacion: ''+getValorCampo(''serie'')+''  ''+getValorCampo(''folio'')', 'Cotizaciones', 'Cotizacion Creada', 'Cotizacion Actualizada', 'Â¿Eliminar Cotizacion?', 'Cotizacion Eliminada', '', ''),
(48, 2, 'concepto_cotizacion', 'conceptos_cotizacion', 'concepto_cotizacion', 'exp_conceptos_cotizacion', 'id', '', 'Nuevo Concepto de Cotizacion', '''Concepto: ''+getValorCampo(''fk_concepto'')', 'Conceptos de Cotizacion', 'Concepto Creado', 'Concepto Actualizado', 'Â¿Eliminar Concepto?', 'Concepto Eliminado', '', ''),
(50, 3, 'Catalogos', 'catalogos', 'Catalogo', 'system_catalogos', 'id', 'http://png.findicons.com/files/icons/577/refresh_cl/48/windows_view_icon.png', 'Nuevo Catalogo', '''Catalogo: '' + getValorCampo(''nombre'')', '''Buscar Catalogos''', 'Catalogo Creado', 'Catalogo Actualizado', 'Eliminar Catalogo', 'Catalogo Eliminado', 'Ha hecho cambios en el catalogo,ï¿½Guardar antes de salir?', 'nombre'),
(51, 3, 'Modulos', 'modulos', 'Modulo', 'system_modulos', 'id', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', 'Nuevo Modulo', '''Modulo:'' + getValorCampo(''nombre'')', 'Modulos', 'Modulo Creado', 'Modulo Actualizado', '¿Eliminar Modulo?', 'Modulo Eliminado', '¿Guardar cambios?', ''),
(52, 3, 'Tablas', 'tablas', 'tabla', 'constructor_elemento_catalogo', 'id', '', 'Nueva Tabla', '''Tabla: '' + getValorCampo(''nombre'')', 'Tablas', 'Tabla Creada', 'Tabla Actualizada', '¿Eliminar Tabla?', 'Tabla Eliminada', '¿Guardar los cambios en la tabla?', ''),
(53, 3, 'Elementos De Catalogo', 'elementos_de_catalogo', 'elemento_de_catalogo', 'constructor_elemento_catalogo', 'id', '', 'Nuevo Elemento', '''Elemento: '' + getValorCampo(''nombre'')', 'Elementos de Catalogo', 'Elemento Creado', 'Elemento Actualizado', '¿Eliminar Elemento?', 'Elemento eliminado', '¿Guardar los cambios en el elemento?', ''),
(54, 4, 'Roles', 'roles', 'rol', 'pentienthon_rol', 'id', '', 'Nuevo Rol', '''Rol: '' + getValorCampo(''nombre'')', 'Roles', 'Rol Creado', 'Rol Actualizado', '¿Eliminar Rol?', 'Rol Eliminado', '', ''),
(55, 4, 'Usuario Pendienthon', 'usuarios', 'usuario', 'pendienthon_usuarios', 'id', '', 'Nuevo Usuario', '''Usuario: '' + getValorCampo(''nombre'')', 'Usuarios', 'Usuario Creado', 'Usuario Actualizado', '¿Eliminar Usuario?', 'Usuario Eliminado', '¿Guardar Cambios en el Usuario?', ''),
(56, 4, 'Empresa', 'empresas', 'empresa', 'pendienthon_empresa', 'id', '', 'Nueva Empresa', '''Empresa: '' + getValorCampo(''nombre'')', 'Empresas', 'Empresa Creada', 'Empresa Actualizada', '¿Eliminar Empresa?', 'Empresa Eliminada', '¿Guardar Cambios en la Empresa?', ''),
(57, 4, 'Reporte', 'reportes', 'reporte', 'pendienthon_reporte', 'id', '', 'Nuevo Reporte', '''Reporte: '' + getValorCampo(''num_reporte'')', 'Reportes', 'Nuevo Reporte', 'Reporte Actualizado', 'Â¿Eliminar Reporte?', 'Reporte Eliminado', 'Â¿Guardar Cambios en el Reporte?', ''),
(58, 4, 'Evento', 'eventos', 'evento', 'pendienthon_evento', 'id', '', 'Nuevo Evento', '''Evento: '' + getValorCampo(''descripcion'')', 'Eventos', 'Evento Creado', 'Evento Actualizado', '¿Eliminar Evento ?', 'Evento Eliminado', '¿Guardar cambios en el Evento ?', ''),
(59, 5, 'Documento', 'documentos', 'documento', 'transportes_documento', 'id', '', 'Nuevo Documento', '''Documento: '' + getValorCampo(''id'')', 'Documentos', 'Documento Creado', 'Documento Actualizado', 'Â¿Eliminar Documento?', 'Documento Eliminado', 'Â¿Guardar Cambios en el documento?', ''),
(60, 5, 'concepto_documento', 'conceptos_documento', 'concepto_documento', 'transportes_concepto_documento', 'id', '', 'Nuevo Concepto de Documento', '''Concepto: '' + getValorCampo(''id'')', ' Conceptos De Documento', 'Concepto Creado', 'Concepto Actualizado', 'Â¿Eliminar Concepto?', 'Concepto Eliminado', 'Â¿Guardar Cambios en Concepto?', ''),
(61, 5, 'Tipo de Documento', 'tipos_de_documento', 'tipo_de_documento', 'transportes_tipo_documento', 'id', '', 'Nuevo Tipo de Documento', '''Tipo: '' + getValorCampo(''nombre'')', 'Tipos de Documento', 'Tipo de Documento Creado', 'Tipo de Documento Actualizado', 'Â¿ Eliminar Tipo de Documento  ?', 'Tipo  de Documento Eliminado', 'Â¿Guardar Cambios en Tipo de Documento?', ''),
(62, 5, 'Series', 'series', 'serie', 'transportes_serie', 'id', '', 'Nueva Serie', '''Serie: '' + getValorCampo(''nombre'')', 'Series', 'Serie Creada', 'Serie Actualzada', 'Â¿Eliminar Serie?', 'Serie Elimnada', 'Â¿Guardar Cambios?', ''),
(63, 5, 'Socios', 'socios', 'socio', 'transportes_socio', 'id', '', 'Nuevo Socio', '''Socio: '' + getValorCampo(''nombre'')', 'Socios', 'Socio Creado', 'Socio Actualizado', '', '', '', ''),
(64, 6, 'Maquinas', 'maquinas', 'maquina', 'makinas_maquina', 'id', '', 'Nueva Maquina', '''Maquina: '' + getValorCampo(''nombre'')', 'Maquinas', 'Maquina Creada', 'Maquina Actualizada', '', '', '', ''),
(65, 6, 'Dueño', 'owners', 'owner', 'makina_owner', 'id', '', 'Nuevo Dueño', '''Dueño: '' + getValorCampo(''nombre'')', 'Dueños', 'Dueño Creado', 'Dueño Actualizado', '', '', '', ''),
(66, 7, 'Pais', 'paises', 'pais', 'system_ubicacion_paises', 'id', '', 'Nuevo Pais', '''Pais: '' + getValorCampo(''nombre'')', 'Paises', 'Pais Creado', 'Pais Actualizado', '¿Eliminar Pais?', 'Pais Eliminado', '', ''),
(67, 7, 'Estados', 'estados', 'estado', 'system_ubicacion_estados', 'id', '', 'Nuevo Estado', '''Estado: '' + getValorCampo(''nombre'')', 'Estados', 'Estado Creado', 'Estado Actualizado', '', '', '', ''),
(68, 7, 'Municipio', 'municipios', 'municipio', 'system_ubicacion_municipios', 'id', '', 'Nuevo Municipio', '''Municipio: '' + getValorCampo(''nombre'')', 'Municipios', 'Municipio Creado', 'Municipio Actualizado', '¿Eliminar Municipio?', 'Municipio Eliminado', '', ''),
(69, 6, 'Cliente', 'clientes', 'cliente', 'makina_cliente', 'id', '', 'Nuevo Cliente', '''Cliente: ''+getValorCampo(''nombre'')', 'Clientes', 'Cliente Creado', 'Cliente Actualizado', '', '', '', ''),
(70, 6, 'Tecnico', 'tecnicos', 'tecnico', 'makina_tecnico', 'id', '', 'Nuevo Tecnico', '''Tecnico: '' + getValorCampo(''nombre'')', 'Tecnicos', 'Tecnico Creado', 'Tecnico Actualizado', '', '', '', ''),
(71, 6, 'Punto de Venta', 'puntos_de_venta', 'punto_de_venta', 'makina_punto_de_venta', 'id', '', 'Nuevo Punto de Venta', '''Punto de Venta: '' + getValorCampo(''nombre'')', 'Puntos de Venta', 'Punto de Venta Creada', 'Punto de Venta Actualizada', '', '', '', ''),
(72, 6, 'Cortes', 'cortes', 'corte', 'makinas_corte', 'id', '', 'Nuevo Corte', '''Corte: '' + getValorCampo(''fecha'')', 'Cortes', 'Corte Creado', 'Corte Actualizado', '¿Eliminar Corte?', '', '', ''),
(73, 6, 'Series', 'series', 'serie', 'makinas_serie', 'id', '', 'Nueva Serie', '''Serie: '' + getValorCampo(''serie'')', 'Series', 'Serie Creada', 'Serie Actualizada', '¿Eliminar Serie?', '', '', ''),
(74, 7, 'Régimen de Contratación del trabajador', 'regimenes_contratacion', 'regimen_contratacion', 'nomina_regimen_contratacion', 'id', '', 'Nuevo Regimen de contratación', '''Régimen de Contratacion: '' + getValorCampo(''nombre'')', 'Regímenes de Contratación', 'Régimen de Contratación Creado', 'Régimen de Contratación Actualizado', '¿Eliminar Régimen de Contratación ?', 'Régimen de Contratación Eliminado', '', ''),
(75, 7, 'Bancos', 'bancos', 'banco', 'nomina_bancos', 'id', '', 'Nuevo Banco', '''Banco: '' + getValorCampo(''nombre_corto'')', 'Bancos', 'Banco Creado', 'Banco Actualizado', '¿Eliminar Banco?', 'Banco Eliminado', '', ''),
(76, 7, 'Nivel de Riesgo', 'riesgos', 'riesgo', 'nomina_riesgo_puesto', 'id', '', 'Nuevo Riesgo Puesto', '''Nuevo Riesgo: '' + getValorCampo(''descripcion'')', 'Riesgos', 'Riesgo Creado', 'Riesgo Actualizado', '¿Eliminar Riesgo?', 'Riesgo Eliminado', '', ''),
(77, 7, 'Tipo de Percepción', 'tipos_percepcion', 'tipo_percepcion', 'nomina_tipo_percepcion', 'id', '', 'Nuevo Tipo de Percepción', '''Tipo de Percepcion: '' + getValorCampo(''descripcion'')', 'Tipos de Percepción', 'Tipo de Percepción Creada', 'Tipo de Percepción Actualizada', '¿Eliminar Tipo de Percepción?', 'Tipo de Percepción Eliminada', '', ''),
(78, 7, 'Tipo de Deduccion', 'tipos_deduccion', 'tipo_deduccion', 'nomina_tipo_deduccion', 'id', '', 'Nuevo Tipo de Deducción', '''Tipo de Deducción: '' +getValorCampo(''descripcion'')', 'Tipos de Deducción', 'Tipo de Deducción Creada', 'Tipo de Deducción Actualizada', '¿Eliminar Tipo de Deducción?', 'Tipo de Deducción Eliminada', '', ''),
(79, 7, 'Tipo de Incapacidad', 'tipos_incapacidad', 'tipo_incapacidad', 'nomina_tipo_incapacidad', 'id', '', 'Nuevo Tipo De Incapacidad', '''Tipo De Incapacidad: '' + getValorCampo(''descripcion'')', 'Tipos De Incapacidad', 'Tipo De Incapacidad Creada', 'Tipo De Incapacidad Actualizada', '¿Eliminar Tipo De Incapacidad?', 'Tipo De Incapacidad Eliminada', '', ''),
(80, 7, 'Trabajador', 'trabajadores', 'trabajador', 'nomina_trabajador', 'id', '', 'Nuevo Trabajador', '''Trabajador: '' + getValorCampo(''nombre'')', 'Trabajadores', 'Trabajador Creado', 'Trabajador Actualizado', '¿Eliminar Trabajador?', 'Trabajador Eliminado', '', ''),
(81, 7, 'Regimen Fiscal', 'regimenes', 'regimen', 'facturacion_regimenes', 'id', '', 'Nuevo Regimen Fiscal', '''Regimen Fiscal: '' + getValorCampo(''regimen'')', 'Regímenes Fiscales', 'Régimen Fiscal Creado', 'Régimen Fiscal Actualizado', '¿Eliminar Régimen Fiscal?', 'Régimen Fiscal Eliminado', '', ''),
(82, 7, 'Certificados', 'certificados', 'certificado', 'facturacion_certificados', 'id', '', 'Nuevo Certificado', '''Certificado: '' + getValorCampo(''no_serie'')', 'Certificados', 'Certificado Creado', 'Certificado Actualizado', '¿Eliminar Certificado?', 'Certificado Eliminado', '', ''),
(83, 7, 'Serie Nomina', 'series_nomina', 'serie_nomina', 'nomina_series', 'id', '', 'Nueva Serie Para Nomina', '''Serie Para Nomina: '' + getValorCampo(''serie'')', 'Series Para Nomina', 'Serie Para Nomina Creada', 'Serie Para Nomina Actualizada', '¿Eliminar Serie Para Nomina?', 'Serie Para Nomina Eliminada', '', ''),
(84, 7, 'Empresa', 'empresas', 'empresa', 'facturacion_razones_sociales', 'id', '', 'Nueva Empresa', '''Empresa: '' + getValorCampo(''nombre_comercial'')', 'Empresas', 'Empresa Creada', 'Empresa Actualizada', '¿Eliminar Empresa?', 'Empresa Eliminada', '', ''),
(85, 7, 'Jornada', 'jornadas', 'jornada', 'nomina_jornada', 'id', '', 'Nueva Jornada', '''Jornada: ''+getValorCampo(''nombre'')', 'Jornadas', 'Jornada Creada', 'Jornada Actualizada', '¿Eliminar Jornada?', 'Jornada Eliminada', '', ''),
(86, 7, 'Periodo de Pago', 'periodo_pagos', 'periodo_pago', 'nomina_periodicidad_pago', 'id', '', 'Nuevo Periodo de Pago', '''Periodo de Pago: '' + getValorCampo(''descripcion'')', 'Periodos de  Pago', 'Periodo de Pago Creado', 'Periodo de Pago Actualizado', '¿Eliminar Periodo de Pago?', 'Periodo de Pago Eliminado', '', ''),
(87, 7, 'Departamento', 'departamentos', 'departamento', 'nomina_departamento', 'id', '', 'Nuevo Departamento', '''Departamento: '' + getValorCampo(''nombre'')', 'Departamentos', 'Departamento Creado', 'Departamento Actualizado', '¿Eliminar Departamento ?', 'Departamento Eliminado', '', ''),
(88, 7, 'Nomina', 'nominas', 'nomina', 'nomina_nomina', 'id', '', 'Nueva Nomina', 'Nomina: {serie}  {folio}', 'Nominas', 'Nomina Creada', 'Nomina Actualizada', '¿Eliminar Nomina?', 'Nomina Eliminada', '', ''),
(89, 7, 'Percepciones', 'percepciones_nomina', 'percepcion_nomina', 'nomina_percepciones', 'id', '', 'Nueva Percepcion', '''Percepcion: '' + getValorCampo(''Concepto'')', 'Percepciones', 'Percepcion Creada', 'Percepcion Actualizada', '¿Eliminar Percepcion?', 'Percepcion Eliminada', '', ''),
(90, 7, 'Deducciones', 'deducciones_nomina', 'deduccion_nomina', 'nomina_deducciones', 'id', '', 'Nueva Deducción', '''Deducción: '' + getValorCampo(''Concepto'')', 'Deducciónes', 'Deducción Creada', 'Deducción Actualizada', '¿Eliminar Deducción?', 'Deducción Eliminada', '', ''),
(91, 7, 'Incapacidades', 'incapacidades', 'incapacidad', 'nomina_incapacidades', 'id', '', 'Nueva Incapacidad', '''Incapacidad''', 'Incapacidades', 'Incapacidad Creada', 'Incapacidad Actualizada', '¿Eliminar Incapacidad?', 'Incapacidad Eliminada', '', ''),
(92, 7, 'Tipo Horas', 'tipos_hora', 'tipo_hora', 'nomina_tipo_horas', 'id', '', 'Nuevo Tipo de Hora Extra', '''Tipo de Hora Extra: '' + getValorCampo(''nombre'')', 'Tipos de Horas Extra', 'Tipo de Hora Extra Creado', 'Tipo de Hora Extra Actualizado', '¿Eliminar Tipo de Hora Extra?', 'Tipo de Hora Extra Eliminada', '', ''),
(93, 7, 'Horas Extra', 'horas_extra_nomina', 'hora_extra_nomina', 'nomina_horas_extra', 'id', '', 'Nueva Hora Extra', '''Hora Extra''', 'Horas Extra', 'Hora Extra Creada', 'Hora Extra Actualizada', '¿Eliminar Hora Extra ?', 'Hora Extra Eliminada', '', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `system_modulos`
--

INSERT INTO `system_modulos` (`id`, `nombre`, `icono`, `nombre_interno`, `ruta_base`, `orden`) VALUES
(1, 'backend', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', 'backend', '/modulos/', 0),
(2, 'Constructor', 'http://png-1.findicons.com/files/icons/2003/business/64/shopping_full.png', 'portal', '/', 0),
(4, 'Pendienthon', '', 'pendienthon', '/', 0),
(5, 'Transportes', '', 'transportes', '/', 0),
(6, 'Makinas', '', 'makinas', '/', 0),
(7, 'Nominas', '', 'nomina', '/', 0);

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
-- Estructura de tabla para la tabla `system_ubicacion_estados`
--

CREATE TABLE IF NOT EXISTS `system_ubicacion_estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `fk_pais` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=33 ;

--
-- Volcado de datos para la tabla `system_ubicacion_estados`
--

INSERT INTO `system_ubicacion_estados` (`id`, `nombre`, `fk_pais`) VALUES
(1, 'Aguascalientes', 1),
(2, 'Baja California', 1),
(3, 'Baja California Sur', 1),
(4, 'Campeche', 1),
(5, 'Coahuila de Zaragoza', 1),
(6, 'Colima', 1),
(7, 'Chiapas', 1),
(8, 'Chihuahua', 1),
(9, 'Distrito Federal', 1),
(10, 'Durango', 1),
(11, 'Guanajuato', 1),
(12, 'Guerrero', 1),
(13, 'Hidalgo', 1),
(14, 'Jalisco', 1),
(15, 'México', 1),
(16, 'Michoacán de Ocampo', 1),
(17, 'Morelos', 1),
(18, 'Nayarit', 1),
(19, 'Nuevo León', 1),
(20, 'Oaxaca', 1),
(21, 'Puebla', 1),
(22, 'Querétaro', 1),
(23, 'Quintana Roo', 1),
(24, 'San Luis Potosí', 1),
(25, 'Sinaloa', 1),
(26, 'Sonora', 1),
(27, 'Tabasco', 1),
(28, 'Tamaulipas', 1),
(29, 'Tlaxcala', 1),
(30, 'Veracruz de Ignacio de la Llave', 1),
(31, 'Yucatán', 1),
(32, 'Zacatecas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_ubicacion_municipios`
--

CREATE TABLE IF NOT EXISTS `system_ubicacion_municipios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `clave_sepomex` char(255) DEFAULT NULL,
  `fk_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=4946 ;

--
-- Volcado de datos para la tabla `system_ubicacion_municipios`
--

INSERT INTO `system_ubicacion_municipios` (`id`, `nombre`, `clave_sepomex`, `fk_estado`) VALUES
(2489, 'Aguascalientes', '001', 1),
(2490, 'Ensenada', '001', 2),
(2491, 'Comondú', '001', 3),
(2492, 'Calkiní', '001', 4),
(2493, 'Abasolo', '001', 5),
(2494, 'Armería', '001', 6),
(2495, 'Acacoyagua', '001', 7),
(2496, 'Ahumada', '001', 8),
(2497, 'Canatlán', '001', 10),
(2498, 'Abasolo', '001', 11),
(2499, 'Acapulco de Juárez', '001', 12),
(2500, 'Acatlán', '001', 13),
(2501, 'Acatic', '001', 14),
(2502, 'Acambay de Ruíz Castañeda', '001', 15),
(2503, 'Acuitzio', '001', 16),
(2504, 'Amacuzac', '001', 17),
(2505, 'Acaponeta', '001', 18),
(2506, 'Abasolo', '001', 19),
(2507, 'Abejones', '001', 20),
(2508, 'Acajete', '001', 21),
(2509, 'Amealco de Bonfil', '001', 22),
(2510, 'Cozumel', '001', 23),
(2511, 'Ahualulco', '001', 24),
(2512, 'Ahome', '001', 25),
(2513, 'Aconchi', '001', 26),
(2514, 'Balancán', '001', 27),
(2515, 'Abasolo', '001', 28),
(2516, 'Amaxac de Guerrero', '001', 29),
(2517, 'Acajete', '001', 30),
(2518, 'Abalá', '001', 31),
(2519, 'Apozol', '001', 32),
(2520, 'Asientos', '002', 1),
(2521, 'Mexicali', '002', 2),
(2522, 'Mulegé', '002', 3),
(2523, 'Campeche', '002', 4),
(2524, 'Acuña', '002', 5),
(2525, 'Colima', '002', 6),
(2526, 'Acala', '002', 7),
(2527, 'Aldama', '002', 8),
(2528, 'Azcapotzalco', '002', 9),
(2529, 'Canelas', '002', 10),
(2530, 'Acámbaro', '002', 11),
(2531, 'Ahuacuotzingo', '002', 12),
(2532, 'Acaxochitlán', '002', 13),
(2533, 'Acatlán de Juárez', '002', 14),
(2534, 'Acolman', '002', 15),
(2535, 'Aguililla', '002', 16),
(2536, 'Atlatlahucan', '002', 17),
(2537, 'Ahuacatlán', '002', 18),
(2538, 'Agualeguas', '002', 19),
(2539, 'Acatlán de Pérez Figueroa', '002', 20),
(2540, 'Acateno', '002', 21),
(2541, 'Pinal de Amoles', '002', 22),
(2542, 'Felipe Carrillo Puerto', '002', 23),
(2543, 'Alaquines', '002', 24),
(2544, 'Angostura', '002', 25),
(2545, 'Agua Prieta', '002', 26),
(2546, 'Cárdenas', '002', 27),
(2547, 'Aldama', '002', 28),
(2548, 'Apetatitlán de Antonio Carvajal', '002', 29),
(2549, 'Acatlán', '002', 30),
(2550, 'Acanceh', '002', 31),
(2551, 'Apulco', '002', 32),
(2552, 'Calvillo', '003', 1),
(2553, 'Tecate', '003', 2),
(2554, 'La Paz', '003', 3),
(2555, 'Carmen', '003', 4),
(2556, 'Allende', '003', 5),
(2557, 'Comala', '003', 6),
(2558, 'Acapetahua', '003', 7),
(2559, 'Allende', '003', 8),
(2560, 'Coyoacán', '003', 9),
(2561, 'Coneto de Comonfort', '003', 10),
(2562, 'San Miguel de Allende', '003', 11),
(2563, 'Ajuchitlán del Progreso', '003', 12),
(2564, 'Actopan', '003', 13),
(2565, 'Ahualulco de Mercado', '003', 14),
(2566, 'Aculco', '003', 15),
(2567, 'Álvaro Obregón', '003', 16),
(2568, 'Axochiapan', '003', 17),
(2569, 'Amatlán de Cañas', '003', 18),
(2570, 'Los Aldamas', '003', 19),
(2571, 'Asunción Cacalotepec', '003', 20),
(2572, 'Acatlán', '003', 21),
(2573, 'Arroyo Seco', '003', 22),
(2574, 'Isla Mujeres', '003', 23),
(2575, 'Aquismón', '003', 24),
(2576, 'Badiraguato', '003', 25),
(2577, 'Alamos', '003', 26),
(2578, 'Centla', '003', 27),
(2579, 'Altamira', '003', 28),
(2580, 'Atlangatepec', '003', 29),
(2581, 'Acayucan', '003', 30),
(2582, 'Akil', '003', 31),
(2583, 'Atolinga', '003', 32),
(2584, 'Cosío', '004', 1),
(2585, 'Tijuana', '004', 2),
(2586, 'Champotón', '004', 4),
(2587, 'Arteaga', '004', 5),
(2588, 'Coquimatlán', '004', 6),
(2589, 'Altamirano', '004', 7),
(2590, 'Aquiles Serdán', '004', 8),
(2591, 'Cuajimalpa de Morelos', '004', 9),
(2592, 'Cuencamé', '004', 10),
(2593, 'Apaseo el Alto', '004', 11),
(2594, 'Alcozauca de Guerrero', '004', 12),
(2595, 'Agua Blanca de Iturbide', '004', 13),
(2596, 'Amacueca', '004', 14),
(2597, 'Almoloya de Alquisiras', '004', 15),
(2598, 'Angamacutiro', '004', 16),
(2599, 'Ayala', '004', 17),
(2600, 'Compostela', '004', 18),
(2601, 'Allende', '004', 19),
(2602, 'Asunción Cuyotepeji', '004', 20),
(2603, 'Acatzingo', '004', 21),
(2604, 'Cadereyta de Montes', '004', 22),
(2605, 'Othón P. Blanco', '004', 23),
(2606, 'Armadillo de los Infante', '004', 24),
(2607, 'Concordia', '004', 25),
(2608, 'Altar', '004', 26),
(2609, 'Centro', '004', 27),
(2610, 'Antiguo Morelos', '004', 28),
(2611, 'Atltzayanca', '004', 29),
(2612, 'Actopan', '004', 30),
(2613, 'Baca', '004', 31),
(2614, 'Benito Juárez', '004', 32),
(2615, 'Jesús María', '005', 1),
(2616, 'Playas de Rosarito', '005', 2),
(2617, 'Hecelchakán', '005', 4),
(2618, 'Candela', '005', 5),
(2619, 'Cuauhtémoc', '005', 6),
(2620, 'Amatán', '005', 7),
(2621, 'Ascensión', '005', 8),
(2622, 'Gustavo A. Madero', '005', 9),
(2623, 'Durango', '005', 10),
(2624, 'Apaseo el Grande', '005', 11),
(2625, 'Alpoyeca', '005', 12),
(2626, 'Ajacuba', '005', 13),
(2627, 'Amatitán', '005', 14),
(2628, 'Almoloya de Juárez', '005', 15),
(2629, 'Angangueo', '005', 16),
(2630, 'Coatlán del Río', '005', 17),
(2631, 'Huajicori', '005', 18),
(2632, 'Anáhuac', '005', 19),
(2633, 'Asunción Ixtaltepec', '005', 20),
(2634, 'Acteopan', '005', 21),
(2635, 'Colón', '005', 22),
(2636, 'Benito Juárez', '005', 23),
(2637, 'Cárdenas', '005', 24),
(2638, 'Cosalá', '005', 25),
(2639, 'Arivechi', '005', 26),
(2640, 'Comalcalco', '005', 27),
(2641, 'Burgos', '005', 28),
(2642, 'Apizaco', '005', 29),
(2643, 'Acula', '005', 30),
(2644, 'Bokobá', '005', 31),
(2645, 'Calera', '005', 32),
(2646, 'Pabellón de Arteaga', '006', 1),
(2647, 'Hopelchén', '006', 4),
(2648, 'Castaños', '006', 5),
(2649, 'Ixtlahuacán', '006', 6),
(2650, 'Amatenango de la Frontera', '006', 7),
(2651, 'Bachíniva', '006', 8),
(2652, 'Iztacalco', '006', 9),
(2653, 'General Simón Bolívar', '006', 10),
(2654, 'Atarjea', '006', 11),
(2655, 'Apaxtla', '006', 12),
(2656, 'Alfajayucan', '006', 13),
(2657, 'Ameca', '006', 14),
(2658, 'Almoloya del Río', '006', 15),
(2659, 'Apatzingán', '006', 16),
(2660, 'Cuautla', '006', 17),
(2661, 'Ixtlán del Río', '006', 18),
(2662, 'Apodaca', '006', 19),
(2663, 'Asunción Nochixtlán', '006', 20),
(2664, 'Ahuacatlán', '006', 21),
(2665, 'Corregidora', '006', 22),
(2666, 'José María Morelos', '006', 23),
(2667, 'Catorce', '006', 24),
(2668, 'Culiacán', '006', 25),
(2669, 'Arizpe', '006', 26),
(2670, 'Cunduacán', '006', 27),
(2671, 'Bustamante', '006', 28),
(2672, 'Calpulalpan', '006', 29),
(2673, 'Acultzingo', '006', 30),
(2674, 'Buctzotz', '006', 31),
(2675, 'Cañitas de Felipe Pescador', '006', 32),
(2676, 'Rincón de Romos', '007', 1),
(2677, 'Palizada', '007', 4),
(2678, 'Cuatro Ciénegas', '007', 5),
(2679, 'Manzanillo', '007', 6),
(2680, 'Amatenango del Valle', '007', 7),
(2681, 'Balleza', '007', 8),
(2682, 'Iztapalapa', '007', 9),
(2683, 'Gómez Palacio', '007', 10),
(2684, 'Celaya', '007', 11),
(2685, 'Arcelia', '007', 12),
(2686, 'Almoloya', '007', 13),
(2687, 'San Juanito de Escobedo', '007', 14),
(2688, 'Amanalco', '007', 15),
(2689, 'Aporo', '007', 16),
(2690, 'Cuernavaca', '007', 17),
(2691, 'Jala', '007', 18),
(2692, 'Aramberri', '007', 19),
(2693, 'Asunción Ocotlán', '007', 20),
(2694, 'Ahuatlán', '007', 21),
(2695, 'Ezequiel Montes', '007', 22),
(2696, 'Lázaro Cárdenas', '007', 23),
(2697, 'Cedral', '007', 24),
(2698, 'Choix', '007', 25),
(2699, 'Atil', '007', 26),
(2700, 'Emiliano Zapata', '007', 27),
(2701, 'Camargo', '007', 28),
(2702, 'El Carmen Tequexquitla', '007', 29),
(2703, 'Camarón de Tejeda', '007', 30),
(2704, 'Cacalchén', '007', 31),
(2705, 'Concepción del Oro', '007', 32),
(2706, 'San José de Gracia', '008', 1),
(2707, 'Los Cabos', '008', 3),
(2708, 'Tenabo', '008', 4),
(2709, 'Escobedo', '008', 5),
(2710, 'Minatitlán', '008', 6),
(2711, 'Angel Albino Corzo', '008', 7),
(2712, 'Batopilas', '008', 8),
(2713, 'La Magdalena Contreras', '008', 9),
(2714, 'Guadalupe Victoria', '008', 10),
(2715, 'Manuel Doblado', '008', 11),
(2716, 'Atenango del Río', '008', 12),
(2717, 'Apan', '008', 13),
(2718, 'Arandas', '008', 14),
(2719, 'Amatepec', '008', 15),
(2720, 'Aquila', '008', 16),
(2721, 'Emiliano Zapata', '008', 17),
(2722, 'Xalisco', '008', 18),
(2723, 'Bustamante', '008', 19),
(2724, 'Asunción Tlacolulita', '008', 20),
(2725, 'Ahuazotepec', '008', 21),
(2726, 'Huimilpan', '008', 22),
(2727, 'Solidaridad', '008', 23),
(2728, 'Cerritos', '008', 24),
(2729, 'Elota', '008', 25),
(2730, 'Bacadéhuachi', '008', 26),
(2731, 'Huimanguillo', '008', 27),
(2732, 'Casas', '008', 28),
(2733, 'Cuapiaxtla', '008', 29),
(2734, 'Alpatláhuac', '008', 30),
(2735, 'Calotmul', '008', 31),
(2736, 'Cuauhtémoc', '008', 32),
(2737, 'Tepezalá', '009', 1),
(2738, 'Loreto', '009', 3),
(2739, 'Escárcega', '009', 4),
(2740, 'Francisco I. Madero', '009', 5),
(2741, 'Tecomán', '009', 6),
(2742, 'Arriaga', '009', 7),
(2743, 'Bocoyna', '009', 8),
(2744, 'Milpa Alta', '009', 9),
(2745, 'Guanaceví', '009', 10),
(2746, 'Comonfort', '009', 11),
(2747, 'Atlamajalcingo del Monte', '009', 12),
(2748, 'El Arenal', '009', 13),
(2749, 'El Arenal', '009', 14),
(2750, 'Amecameca', '009', 15),
(2751, 'Ario', '009', 16),
(2752, 'Huitzilac', '009', 17),
(2753, 'Del Nayar', '009', 18),
(2754, 'Cadereyta Jiménez', '009', 19),
(2755, 'Ayotzintepec', '009', 20),
(2756, 'Ahuehuetitla', '009', 21),
(2757, 'Jalpan de Serra', '009', 22),
(2758, 'Tulum', '009', 23),
(2759, 'Cerro de San Pedro', '009', 24),
(2760, 'Escuinapa', '009', 25),
(2761, 'Bacanora', '009', 26),
(2762, 'Jalapa', '009', 27),
(2763, 'Ciudad Madero', '009', 28),
(2764, 'Cuaxomulco', '009', 29),
(2765, 'Alto Lucero de Gutiérrez Barrios', '009', 30),
(2766, 'Cansahcab', '009', 31),
(2767, 'Chalchihuites', '009', 32),
(2768, 'El Llano', '010', 1),
(2769, 'Calakmul', '010', 4),
(2770, 'Frontera', '010', 5),
(2771, 'Villa de Álvarez', '010', 6),
(2772, 'Bejucal de Ocampo', '010', 7),
(2773, 'Buenaventura', '010', 8),
(2774, 'Álvaro Obregón', '010', 9),
(2775, 'Hidalgo', '010', 10),
(2776, 'Coroneo', '010', 11),
(2777, 'Atlixtac', '010', 12),
(2778, 'Atitalaquia', '010', 13),
(2779, 'Atemajac de Brizuela', '010', 14),
(2780, 'Apaxco', '010', 15),
(2781, 'Arteaga', '010', 16),
(2782, 'Jantetelco', '010', 17),
(2783, 'Rosamorada', '010', 18),
(2784, 'El Carmen', '010', 19),
(2785, 'El Barrio de la Soledad', '010', 20),
(2786, 'Ajalpan', '010', 21),
(2787, 'Landa de Matamoros', '010', 22),
(2788, 'Bacalar', '010', 23),
(2789, 'Ciudad del Maíz', '010', 24),
(2790, 'El Fuerte', '010', 25),
(2791, 'Bacerac', '010', 26),
(2792, 'Jalpa de Méndez', '010', 27),
(2793, 'Cruillas', '010', 28),
(2794, 'Chiautempan', '010', 29),
(2795, 'Altotonga', '010', 30),
(2796, 'Cantamayec', '010', 31),
(2797, 'Fresnillo', '010', 32),
(2798, 'San Francisco de los Romo', '011', 1),
(2799, 'Candelaria', '011', 4),
(2800, 'General Cepeda', '011', 5),
(2801, 'Bella Vista', '011', 7),
(2802, 'Camargo', '011', 8),
(2803, 'Tláhuac', '011', 9),
(2804, 'Indé', '011', 10),
(2805, 'Cortazar', '011', 11),
(2806, 'Atoyac de Álvarez', '011', 12),
(2807, 'Atlapexco', '011', 13),
(2808, 'Atengo', '011', 14),
(2809, 'Atenco', '011', 15),
(2810, 'Briseñas', '011', 16),
(2811, 'Jiutepec', '011', 17),
(2812, 'Ruíz', '011', 18),
(2813, 'Cerralvo', '011', 19),
(2814, 'Calihualá', '011', 20),
(2815, 'Albino Zertuche', '011', 21),
(2816, 'El Marqués', '011', 22),
(2817, 'Ciudad Fernández', '011', 24),
(2818, 'Guasave', '011', 25),
(2819, 'Bacoachi', '011', 26),
(2820, 'Jonuta', '011', 27),
(2821, 'Gómez Farías', '011', 28),
(2822, 'Muñoz de Domingo Arenas', '011', 29),
(2823, 'Alvarado', '011', 30),
(2824, 'Celestún', '011', 31),
(2825, 'Trinidad García de la Cadena', '011', 32),
(2826, 'Guerrero', '012', 5),
(2827, 'Berriozábal', '012', 7),
(2828, 'Carichí', '012', 8),
(2829, 'Tlalpan', '012', 9),
(2830, 'Lerdo', '012', 10),
(2831, 'Cuerámaro', '012', 11),
(2832, 'Ayutla de los Libres', '012', 12),
(2833, 'Atotonilco el Grande', '012', 13),
(2834, 'Atenguillo', '012', 14),
(2835, 'Atizapán', '012', 15),
(2836, 'Buenavista', '012', 16),
(2837, 'Jojutla', '012', 17),
(2838, 'San Blas', '012', 18),
(2839, 'Ciénega de Flores', '012', 19),
(2840, 'Candelaria Loxicha', '012', 20),
(2841, 'Aljojuca', '012', 21),
(2842, 'Pedro Escobedo', '012', 22),
(2843, 'Tancanhuitz', '012', 24),
(2844, 'Mazatlán', '012', 25),
(2845, 'Bácum', '012', 26),
(2846, 'Macuspana', '012', 27),
(2847, 'González', '012', 28),
(2848, 'Españita', '012', 29),
(2849, 'Amatitlán', '012', 30),
(2850, 'Cenotillo', '012', 31),
(2851, 'Genaro Codina', '012', 32),
(2852, 'Hidalgo', '013', 5),
(2853, 'Bochil', '013', 7),
(2854, 'Casas Grandes', '013', 8),
(2855, 'Xochimilco', '013', 9),
(2856, 'Mapimí', '013', 10),
(2857, 'Doctor Mora', '013', 11),
(2858, 'Azoyú', '013', 12),
(2859, 'Atotonilco de Tula', '013', 13),
(2860, 'Atotonilco el Alto', '013', 14),
(2861, 'Atizapán de Zaragoza', '013', 15),
(2862, 'Carácuaro', '013', 16),
(2863, 'Jonacatepec', '013', 17),
(2864, 'San Pedro Lagunillas', '013', 18),
(2865, 'China', '013', 19),
(2866, 'Ciénega de Zimatlán', '013', 20),
(2867, 'Altepexi', '013', 21),
(2868, 'Peñamiller', '013', 22),
(2869, 'Ciudad Valles', '013', 24),
(2870, 'Mocorito', '013', 25),
(2871, 'Banámichi', '013', 26),
(2872, 'Nacajuca', '013', 27),
(2873, 'Güémez', '013', 28),
(2874, 'Huamantla', '013', 29),
(2875, 'Naranjos Amatlán', '013', 30),
(2876, 'Conkal', '013', 31),
(2877, 'General Enrique Estrada', '013', 32),
(2878, 'Jiménez', '014', 5),
(2879, 'El Bosque', '014', 7),
(2880, 'Coronado', '014', 8),
(2881, 'Benito Juárez', '014', 9),
(2882, 'Mezquital', '014', 10),
(2883, 'Dolores Hidalgo Cuna de la Independencia Nacional', '014', 11),
(2884, 'Benito Juárez', '014', 12),
(2885, 'Calnali', '014', 13),
(2886, 'Atoyac', '014', 14),
(2887, 'Atlacomulco', '014', 15),
(2888, 'Coahuayana', '014', 16),
(2889, 'Mazatepec', '014', 17),
(2890, 'Santa María del Oro', '014', 18),
(2891, 'Doctor Arroyo', '014', 19),
(2892, 'Ciudad Ixtepec', '014', 20),
(2893, 'Amixtlán', '014', 21),
(2894, 'Querétaro', '014', 22),
(2895, 'Coxcatlán', '014', 24),
(2896, 'Rosario', '014', 25),
(2897, 'Baviácora', '014', 26),
(2898, 'Paraíso', '014', 27),
(2899, 'Guerrero', '014', 28),
(2900, 'Hueyotlipan', '014', 29),
(2901, 'Amatlán de los Reyes', '014', 30),
(2902, 'Cuncunul', '014', 31),
(2903, 'General Francisco R. Murguía', '014', 32),
(2904, 'Juárez', '015', 5),
(2905, 'Cacahoatán', '015', 7),
(2906, 'Coyame del Sotol', '015', 8),
(2907, 'Cuauhtémoc', '015', 9),
(2908, 'Nazas', '015', 10),
(2909, 'Guanajuato', '015', 11),
(2910, 'Buenavista de Cuéllar', '015', 12),
(2911, 'Cardonal', '015', 13),
(2912, 'Autlán de Navarro', '015', 14),
(2913, 'Atlautla', '015', 15),
(2914, 'Coalcomán de Vázquez Pallares', '015', 16),
(2915, 'Miacatlán', '015', 17),
(2916, 'Santiago Ixcuintla', '015', 18),
(2917, 'Doctor Coss', '015', 19),
(2918, 'Coatecas Altas', '015', 20),
(2919, 'Amozoc', '015', 21),
(2920, 'San Joaquín', '015', 22),
(2921, 'Charcas', '015', 24),
(2922, 'Salvador Alvarado', '015', 25),
(2923, 'Bavispe', '015', 26),
(2924, 'Tacotalpa', '015', 27),
(2925, 'Gustavo Díaz Ordaz', '015', 28),
(2926, 'Ixtacuixtla de Mariano Matamoros', '015', 29),
(2927, 'Angel R. Cabada', '015', 30),
(2928, 'Cuzamá', '015', 31),
(2929, 'El Plateado de Joaquín Amaro', '015', 32),
(2930, 'Lamadrid', '016', 5),
(2931, 'Catazajá', '016', 7),
(2932, 'La Cruz', '016', 8),
(2933, 'Miguel Hidalgo', '016', 9),
(2934, 'Nombre de Dios', '016', 10),
(2935, 'Huanímaro', '016', 11),
(2936, 'Coahuayutla de José María Izazaga', '016', 12),
(2937, 'Cuautepec de Hinojosa', '016', 13),
(2938, 'Ayotlán', '016', 14),
(2939, 'Axapusco', '016', 15),
(2940, 'Coeneo', '016', 16),
(2941, 'Ocuituco', '016', 17),
(2942, 'Tecuala', '016', 18),
(2943, 'Doctor González', '016', 19),
(2944, 'Coicoyán de las Flores', '016', 20),
(2945, 'Aquixtla', '016', 21),
(2946, 'San Juan del Río', '016', 22),
(2947, 'Ebano', '016', 24),
(2948, 'San Ignacio', '016', 25),
(2949, 'Benjamín Hill', '016', 26),
(2950, 'Teapa', '016', 27),
(2951, 'Hidalgo', '016', 28),
(2952, 'Ixtenco', '016', 29),
(2953, 'La Antigua', '016', 30),
(2954, 'Chacsinkín', '016', 31),
(2955, 'General Pánfilo Natera', '016', 32),
(2956, 'Matamoros', '017', 5),
(2957, 'Cintalapa', '017', 7),
(2958, 'Cuauhtémoc', '017', 8),
(2959, 'Venustiano Carranza', '017', 9),
(2960, 'Ocampo', '017', 10),
(2961, 'Irapuato', '017', 11),
(2962, 'Cocula', '017', 12),
(2963, 'Chapantongo', '017', 13),
(2964, 'Ayutla', '017', 14),
(2965, 'Ayapango', '017', 15),
(2966, 'Contepec', '017', 16),
(2967, 'Puente de Ixtla', '017', 17),
(2968, 'Tepic', '017', 18),
(2969, 'Galeana', '017', 19),
(2970, 'La Compañía', '017', 20),
(2971, 'Atempan', '017', 21),
(2972, 'Tequisquiapan', '017', 22),
(2973, 'Guadalcázar', '017', 24),
(2974, 'Sinaloa', '017', 25),
(2975, 'Caborca', '017', 26),
(2976, 'Tenosique', '017', 27),
(2977, 'Jaumave', '017', 28),
(2978, 'Mazatecochco de José María Morelos', '017', 29),
(2979, 'Apazapan', '017', 30),
(2980, 'Chankom', '017', 31),
(2981, 'Guadalupe', '017', 32),
(2982, 'Monclova', '018', 5),
(2983, 'Coapilla', '018', 7),
(2984, 'Cusihuiriachi', '018', 8),
(2985, 'El Oro', '018', 10),
(2986, 'Jaral del Progreso', '018', 11),
(2987, 'Copala', '018', 12),
(2988, 'Chapulhuacán', '018', 13),
(2989, 'La Barca', '018', 14),
(2990, 'Calimaya', '018', 15),
(2991, 'Copándaro', '018', 16),
(2992, 'Temixco', '018', 17),
(2993, 'Tuxpan', '018', 18),
(2994, 'García', '018', 19),
(2995, 'Concepción Buenavista', '018', 20),
(2996, 'Atexcal', '018', 21),
(2997, 'Tolimán', '018', 22),
(2998, 'Huehuetlán', '018', 24),
(2999, 'Navolato', '018', 25),
(3000, 'Cajeme', '018', 26),
(3001, 'Jiménez', '018', 28),
(3002, 'Contla de Juan Cuamatzi', '018', 29),
(3003, 'Aquila', '018', 30),
(3004, 'Chapab', '018', 31),
(3005, 'Huanusco', '018', 32),
(3006, 'Morelos', '019', 5),
(3007, 'Comitán de Domínguez', '019', 7),
(3008, 'Chihuahua', '019', 8),
(3009, 'Otáez', '019', 10),
(3010, 'Jerécuaro', '019', 11),
(3011, 'Copalillo', '019', 12),
(3012, 'Chilcuautla', '019', 13),
(3013, 'Bolaños', '019', 14),
(3014, 'Capulhuac', '019', 15),
(3015, 'Cotija', '019', 16),
(3016, 'Tepalcingo', '019', 17),
(3017, 'La Yesca', '019', 18),
(3018, 'San Pedro Garza García', '019', 19),
(3019, 'Concepción Pápalo', '019', 20),
(3020, 'Atlixco', '019', 21),
(3021, 'Lagunillas', '019', 24),
(3022, 'Cananea', '019', 26),
(3023, 'Llera', '019', 28),
(3024, 'Tepetitla de Lardizábal', '019', 29),
(3025, 'Astacinga', '019', 30),
(3026, 'Chemax', '019', 31),
(3027, 'Jalpa', '019', 32),
(3028, 'Múzquiz', '020', 5),
(3029, 'La Concordia', '020', 7),
(3030, 'Chínipas', '020', 8),
(3031, 'Pánuco de Coronado', '020', 10),
(3032, 'León', '020', 11),
(3033, 'Copanatoyac', '020', 12),
(3034, 'Eloxochitlán', '020', 13),
(3035, 'Cabo Corrientes', '020', 14),
(3036, 'Coacalco de Berriozábal', '020', 15),
(3037, 'Cuitzeo', '020', 16),
(3038, 'Tepoztlán', '020', 17),
(3039, 'Bahía de Banderas', '020', 18),
(3040, 'General Bravo', '020', 19),
(3041, 'Constancia del Rosario', '020', 20),
(3042, 'Atoyatempan', '020', 21),
(3043, 'Matehuala', '020', 24),
(3044, 'Carbó', '020', 26),
(3045, 'Mainero', '020', 28),
(3046, 'Sanctórum de Lázaro Cárdenas', '020', 29),
(3047, 'Atlahuilco', '020', 30),
(3048, 'Chicxulub Pueblo', '020', 31),
(3049, 'Jerez', '020', 32),
(3050, 'Nadadores', '021', 5),
(3051, 'Copainalá', '021', 7),
(3052, 'Delicias', '021', 8),
(3053, 'Peñón Blanco', '021', 10),
(3054, 'Moroleón', '021', 11),
(3055, 'Coyuca de Benítez', '021', 12),
(3056, 'Emiliano Zapata', '021', 13),
(3057, 'Casimiro Castillo', '021', 14),
(3058, 'Coatepec Harinas', '021', 15),
(3059, 'Charapan', '021', 16),
(3060, 'Tetecala', '021', 17),
(3061, 'General Escobedo', '021', 19),
(3062, 'Cosolapa', '021', 20),
(3063, 'Atzala', '021', 21),
(3064, 'Mexquitic de Carmona', '021', 24),
(3065, 'La Colorada', '021', 26),
(3066, 'El Mante', '021', 28),
(3067, 'Nanacamilpa de Mariano Arista', '021', 29),
(3068, 'Atoyac', '021', 30),
(3069, 'Chichimilá', '021', 31),
(3070, 'Jiménez del Teul', '021', 32),
(3071, 'Nava', '022', 5),
(3072, 'Chalchihuitán', '022', 7),
(3073, 'Dr. Belisario Domínguez', '022', 8),
(3074, 'Poanas', '022', 10),
(3075, 'Ocampo', '022', 11),
(3076, 'Coyuca de Catalán', '022', 12),
(3077, 'Epazoyucan', '022', 13),
(3078, 'Cihuatlán', '022', 14),
(3079, 'Cocotitlán', '022', 15),
(3080, 'Charo', '022', 16),
(3081, 'Tetela del Volcán', '022', 17),
(3082, 'General Terán', '022', 19),
(3083, 'Cosoltepec', '022', 20),
(3084, 'Atzitzihuacán', '022', 21),
(3085, 'Moctezuma', '022', 24),
(3086, 'Cucurpe', '022', 26),
(3087, 'Matamoros', '022', 28),
(3088, 'Acuamanala de Miguel Hidalgo', '022', 29),
(3089, 'Atzacan', '022', 30),
(3090, 'Chikindzonot', '022', 31),
(3091, 'Juan Aldama', '022', 32),
(3092, 'Ocampo', '023', 5),
(3093, 'Chamula', '023', 7),
(3094, 'Galeana', '023', 8),
(3095, 'Pueblo Nuevo', '023', 10),
(3096, 'Pénjamo', '023', 11),
(3097, 'Cuajinicuilapa', '023', 12),
(3098, 'Francisco I. Madero', '023', 13),
(3099, 'Zapotlán el Grande', '023', 14),
(3100, 'Coyotepec', '023', 15),
(3101, 'Chavinda', '023', 16),
(3102, 'Tlalnepantla', '023', 17),
(3103, 'General Treviño', '023', 19),
(3104, 'Cuilápam de Guerrero', '023', 20),
(3105, 'Atzitzintla', '023', 21),
(3106, 'Rayón', '023', 24),
(3107, 'Cumpas', '023', 26),
(3108, 'Méndez', '023', 28),
(3109, 'Natívitas', '023', 29),
(3110, 'Atzalan', '023', 30),
(3111, 'Chocholá', '023', 31),
(3112, 'Juchipila', '023', 32),
(3113, 'Parras', '024', 5),
(3114, 'Chanal', '024', 7),
(3115, 'Santa Isabel', '024', 8),
(3116, 'Rodeo', '024', 10),
(3117, 'Pueblo Nuevo', '024', 11),
(3118, 'Cualác', '024', 12),
(3119, 'Huasca de Ocampo', '024', 13),
(3120, 'Cocula', '024', 14),
(3121, 'Cuautitlán', '024', 15),
(3122, 'Cherán', '024', 16),
(3123, 'Tlaltizapán de Zapata', '024', 17),
(3124, 'General Zaragoza', '024', 19),
(3125, 'Cuyamecalco Villa de Zaragoza', '024', 20),
(3126, 'Axutla', '024', 21),
(3127, 'Rioverde', '024', 24),
(3128, 'Divisaderos', '024', 26),
(3129, 'Mier', '024', 28),
(3130, 'Panotla', '024', 29),
(3131, 'Tlaltetela', '024', 30),
(3132, 'Chumayel', '024', 31),
(3133, 'Loreto', '024', 32),
(3134, 'Piedras Negras', '025', 5),
(3135, 'Chapultenango', '025', 7),
(3136, 'Gómez Farías', '025', 8),
(3137, 'San Bernardo', '025', 10),
(3138, 'Purísima del Rincón', '025', 11),
(3139, 'Cuautepec', '025', 12),
(3140, 'Huautla', '025', 13),
(3141, 'Colotlán', '025', 14),
(3142, 'Chalco', '025', 15),
(3143, 'Chilchota', '025', 16),
(3144, 'Tlaquiltenango', '025', 17),
(3145, 'General Zuazua', '025', 19),
(3146, 'Chahuites', '025', 20),
(3147, 'Ayotoxco de Guerrero', '025', 21),
(3148, 'Salinas', '025', 24),
(3149, 'Empalme', '025', 26),
(3150, 'Miguel Alemán', '025', 28),
(3151, 'San Pablo del Monte', '025', 29),
(3152, 'Ayahualulco', '025', 30),
(3153, 'Dzán', '025', 31),
(3154, 'Luis Moya', '025', 32),
(3155, 'Progreso', '026', 5),
(3156, 'Chenalhó', '026', 7),
(3157, 'Gran Morelos', '026', 8),
(3158, 'San Dimas', '026', 10),
(3159, 'Romita', '026', 11),
(3160, 'Cuetzala del Progreso', '026', 12),
(3161, 'Huazalingo', '026', 13),
(3162, 'Concepción de Buenos Aires', '026', 14),
(3163, 'Chapa de Mota', '026', 15),
(3164, 'Chinicuila', '026', 16),
(3165, 'Tlayacapan', '026', 17),
(3166, 'Guadalupe', '026', 19),
(3167, 'Chalcatongo de Hidalgo', '026', 20),
(3168, 'Calpan', '026', 21),
(3169, 'San Antonio', '026', 24),
(3170, 'Etchojoa', '026', 26),
(3171, 'Miquihuana', '026', 28),
(3172, 'Santa Cruz Tlaxcala', '026', 29),
(3173, 'Banderilla', '026', 30),
(3174, 'Dzemul', '026', 31),
(3175, 'Mazapil', '026', 32),
(3176, 'Ramos Arizpe', '027', 5),
(3177, 'Chiapa de Corzo', '027', 7),
(3178, 'Guachochi', '027', 8),
(3179, 'San Juan de Guadalupe', '027', 10),
(3180, 'Salamanca', '027', 11),
(3181, 'Cutzamala de Pinzón', '027', 12),
(3182, 'Huehuetla', '027', 13),
(3183, 'Cuautitlán de García Barragán', '027', 14),
(3184, 'Chapultepec', '027', 15),
(3185, 'Chucándiro', '027', 16),
(3186, 'Totolapan', '027', 17),
(3187, 'Los Herreras', '027', 19),
(3188, 'Chiquihuitlán de Benito Juárez', '027', 20),
(3189, 'Caltepec', '027', 21),
(3190, 'San Ciro de Acosta', '027', 24),
(3191, 'Fronteras', '027', 26),
(3192, 'Nuevo Laredo', '027', 28),
(3193, 'Tenancingo', '027', 29),
(3194, 'Benito Juárez', '027', 30),
(3195, 'Dzidzantún', '027', 31),
(3196, 'Melchor Ocampo', '027', 32),
(3197, 'Sabinas', '028', 5),
(3198, 'Chiapilla', '028', 7),
(3199, 'Guadalupe', '028', 8),
(3200, 'San Juan del Río', '028', 10),
(3201, 'Salvatierra', '028', 11),
(3202, 'Chilapa de Álvarez', '028', 12),
(3203, 'Huejutla de Reyes', '028', 13),
(3204, 'Cuautla', '028', 14),
(3205, 'Chiautla', '028', 15),
(3206, 'Churintzio', '028', 16),
(3207, 'Xochitepec', '028', 17),
(3208, 'Higueras', '028', 19),
(3209, 'Heroica Ciudad de Ejutla de Crespo', '028', 20),
(3210, 'Camocuautla', '028', 21),
(3211, 'San Luis Potosí', '028', 24),
(3212, 'Granados', '028', 26),
(3213, 'Nuevo Morelos', '028', 28),
(3214, 'Teolocholco', '028', 29),
(3215, 'Boca del Río', '028', 30),
(3216, 'Dzilam de Bravo', '028', 31),
(3217, 'Mezquital del Oro', '028', 32),
(3218, 'Sacramento', '029', 5),
(3219, 'Chicoasén', '029', 7),
(3220, 'Guadalupe y Calvo', '029', 8),
(3221, 'San Luis del Cordero', '029', 10),
(3222, 'San Diego de la Unión', '029', 11),
(3223, 'Chilpancingo de los Bravo', '029', 12),
(3224, 'Huichapan', '029', 13),
(3225, 'Cuquío', '029', 14),
(3226, 'Chicoloapan', '029', 15),
(3227, 'Churumuco', '029', 16),
(3228, 'Yautepec', '029', 17),
(3229, 'Hualahuises', '029', 19),
(3230, 'Eloxochitlán de Flores Magón', '029', 20),
(3231, 'Caxhuacan', '029', 21),
(3232, 'San Martín Chalchicuautla', '029', 24),
(3233, 'Guaymas', '029', 26),
(3234, 'Ocampo', '029', 28),
(3235, 'Tepeyanco', '029', 29),
(3236, 'Calcahualco', '029', 30),
(3237, 'Dzilam González', '029', 31),
(3238, 'Miguel Auza', '029', 32),
(3239, 'Saltillo', '030', 5),
(3240, 'Chicomuselo', '030', 7),
(3241, 'Guazapares', '030', 8),
(3242, 'San Pedro del Gallo', '030', 10),
(3243, 'San Felipe', '030', 11),
(3244, 'Florencio Villarreal', '030', 12),
(3245, 'Ixmiquilpan', '030', 13),
(3246, 'Chapala', '030', 14),
(3247, 'Chiconcuac', '030', 15),
(3248, 'Ecuandureo', '030', 16),
(3249, 'Yecapixtla', '030', 17),
(3250, 'Iturbide', '030', 19),
(3251, 'El Espinal', '030', 20),
(3252, 'Coatepec', '030', 21),
(3253, 'San Nicolás Tolentino', '030', 24),
(3254, 'Hermosillo', '030', 26),
(3255, 'Padilla', '030', 28),
(3256, 'Terrenate', '030', 29),
(3257, 'Camerino Z. Mendoza', '030', 30),
(3258, 'Dzitás', '030', 31),
(3259, 'Momax', '030', 32),
(3260, 'San Buenaventura', '031', 5),
(3261, 'Chilón', '031', 7),
(3262, 'Guerrero', '031', 8),
(3263, 'Santa Clara', '031', 10),
(3264, 'San Francisco del Rincón', '031', 11),
(3265, 'General Canuto A. Neri', '031', 12),
(3266, 'Jacala de Ledezma', '031', 13),
(3267, 'Chimaltitán', '031', 14),
(3268, 'Chimalhuacán', '031', 15),
(3269, 'Epitacio Huerta', '031', 16),
(3270, 'Zacatepec', '031', 17),
(3271, 'Juárez', '031', 19),
(3272, 'Tamazulápam del Espíritu Santo', '031', 20),
(3273, 'Coatzingo', '031', 21),
(3274, 'Santa Catarina', '031', 24),
(3275, 'Huachinera', '031', 26),
(3276, 'Palmillas', '031', 28),
(3277, 'Tetla de la Solidaridad', '031', 29),
(3278, 'Carrillo Puerto', '031', 30),
(3279, 'Dzoncauich', '031', 31),
(3280, 'Monte Escobedo', '031', 32),
(3281, 'San Juan de Sabinas', '032', 5),
(3282, 'Escuintla', '032', 7),
(3283, 'Hidalgo del Parral', '032', 8),
(3284, 'Santiago Papasquiaro', '032', 10),
(3285, 'San José Iturbide', '032', 11),
(3286, 'General Heliodoro Castillo', '032', 12),
(3287, 'Jaltocán', '032', 13),
(3288, 'Chiquilistlán', '032', 14),
(3289, 'Donato Guerra', '032', 15),
(3290, 'Erongarícuaro', '032', 16),
(3291, 'Zacualpan', '032', 17),
(3292, 'Lampazos de Naranjo', '032', 19),
(3293, 'Fresnillo de Trujano', '032', 20),
(3294, 'Cohetzala', '032', 21),
(3295, 'Santa María del Río', '032', 24),
(3296, 'Huásabas', '032', 26),
(3297, 'Reynosa', '032', 28),
(3298, 'Tetlatlahuca', '032', 29),
(3299, 'Catemaco', '032', 30),
(3300, 'Espita', '032', 31),
(3301, 'Morelos', '032', 32),
(3302, 'San Pedro', '033', 5),
(3303, 'Francisco León', '033', 7),
(3304, 'Huejotitán', '033', 8),
(3305, 'Súchil', '033', 10),
(3306, 'San Luis de la Paz', '033', 11),
(3307, 'Huamuxtitlán', '033', 12),
(3308, 'Juárez Hidalgo', '033', 13),
(3309, 'Degollado', '033', 14),
(3310, 'Ecatepec de Morelos', '033', 15),
(3311, 'Gabriel Zamora', '033', 16),
(3312, 'Temoac', '033', 17),
(3313, 'Linares', '033', 19),
(3314, 'Guadalupe Etla', '033', 20),
(3315, 'Cohuecan', '033', 21),
(3316, 'Santo Domingo', '033', 24),
(3317, 'Huatabampo', '033', 26),
(3318, 'Río Bravo', '033', 28),
(3319, 'Tlaxcala', '033', 29),
(3320, 'Cazones de Herrera', '033', 30),
(3321, 'Halachó', '033', 31),
(3322, 'Moyahua de Estrada', '033', 32),
(3323, 'Sierra Mojada', '034', 5),
(3324, 'Frontera Comalapa', '034', 7),
(3325, 'Ignacio Zaragoza', '034', 8),
(3326, 'Tamazula', '034', 10),
(3327, 'Santa Catarina', '034', 11),
(3328, 'Huitzuco de los Figueroa', '034', 12),
(3329, 'Lolotla', '034', 13),
(3330, 'Ejutla', '034', 14),
(3331, 'Ecatzingo', '034', 15),
(3332, 'Hidalgo', '034', 16),
(3333, 'Marín', '034', 19),
(3334, 'Guadalupe de Ramírez', '034', 20),
(3335, 'Coronango', '034', 21),
(3336, 'San Vicente Tancuayalab', '034', 24),
(3337, 'Huépac', '034', 26),
(3338, 'San Carlos', '034', 28),
(3339, 'Tlaxco', '034', 29),
(3340, 'Cerro Azul', '034', 30),
(3341, 'Hocabá', '034', 31),
(3342, 'Nochistlán de Mejía', '034', 32),
(3343, 'Torreón', '035', 5),
(3344, 'Frontera Hidalgo', '035', 7),
(3345, 'Janos', '035', 8),
(3346, 'Tepehuanes', '035', 10),
(3347, 'Santa Cruz de Juventino Rosas', '035', 11),
(3348, 'Iguala de la Independencia', '035', 12),
(3349, 'Metepec', '035', 13),
(3350, 'Encarnación de Díaz', '035', 14),
(3351, 'Huehuetoca', '035', 15),
(3352, 'La Huacana', '035', 16),
(3353, 'Melchor Ocampo', '035', 19),
(3354, 'Guelatao de Juárez', '035', 20),
(3355, 'Coxcatlán', '035', 21),
(3356, 'Soledad de Graciano Sánchez', '035', 24),
(3357, 'Imuris', '035', 26),
(3358, 'San Fernando', '035', 28),
(3359, 'Tocatlán', '035', 29),
(3360, 'Citlaltépetl', '035', 30),
(3361, 'Hoctún', '035', 31),
(3362, 'Noria de Ángeles', '035', 32),
(3363, 'Viesca', '036', 5),
(3364, 'La Grandeza', '036', 7),
(3365, 'Jiménez', '036', 8),
(3366, 'Tlahualilo', '036', 10),
(3367, 'Santiago Maravatío', '036', 11),
(3368, 'Igualapa', '036', 12),
(3369, 'San Agustín Metzquititlán', '036', 13),
(3370, 'Etzatlán', '036', 14),
(3371, 'Hueypoxtla', '036', 15),
(3372, 'Huandacareo', '036', 16),
(3373, 'Mier y Noriega', '036', 19),
(3374, 'Guevea de Humboldt', '036', 20),
(3375, 'Coyomeapan', '036', 21),
(3376, 'Tamasopo', '036', 24),
(3377, 'Magdalena', '036', 26),
(3378, 'San Nicolás', '036', 28),
(3379, 'Totolac', '036', 29),
(3380, 'Coacoatzintla', '036', 30),
(3381, 'Homún', '036', 31),
(3382, 'Ojocaliente', '036', 32),
(3383, 'Villa Unión', '037', 5),
(3384, 'Huehuetán', '037', 7),
(3385, 'Juárez', '037', 8),
(3386, 'Topia', '037', 10),
(3387, 'Silao de la Victoria', '037', 11),
(3388, 'Ixcateopan de Cuauhtémoc', '037', 12),
(3389, 'Metztitlán', '037', 13),
(3390, 'El Grullo', '037', 14),
(3391, 'Huixquilucan', '037', 15),
(3392, 'Huaniqueo', '037', 16),
(3393, 'Mina', '037', 19),
(3394, 'Mesones Hidalgo', '037', 20),
(3395, 'Coyotepec', '037', 21),
(3396, 'Tamazunchale', '037', 24),
(3397, 'Mazatán', '037', 26),
(3398, 'Soto la Marina', '037', 28),
(3399, 'Ziltlaltépec de Trinidad Sánchez Santos', '037', 29),
(3400, 'Coahuitlán', '037', 30),
(3401, 'Huhí', '037', 31),
(3402, 'Pánuco', '037', 32),
(3403, 'Zaragoza', '038', 5),
(3404, 'Huixtán', '038', 7),
(3405, 'Julimes', '038', 8),
(3406, 'Vicente Guerrero', '038', 10),
(3407, 'Tarandacuao', '038', 11),
(3408, 'Zihuatanejo de Azueta', '038', 12),
(3409, 'Mineral del Chico', '038', 13),
(3410, 'Guachinango', '038', 14),
(3411, 'Isidro Fabela', '038', 15),
(3412, 'Huetamo', '038', 16),
(3413, 'Montemorelos', '038', 19),
(3414, 'Villa Hidalgo', '038', 20),
(3415, 'Cuapiaxtla de Madero', '038', 21),
(3416, 'Tampacán', '038', 24),
(3417, 'Moctezuma', '038', 26),
(3418, 'Tampico', '038', 28),
(3419, 'Tzompantepec', '038', 29),
(3420, 'Coatepec', '038', 30),
(3421, 'Hunucmá', '038', 31),
(3422, 'Pinos', '038', 32),
(3423, 'Huitiupán', '039', 7),
(3424, 'López', '039', 8),
(3425, 'Nuevo Ideal', '039', 10),
(3426, 'Tarimoro', '039', 11),
(3427, 'Juan R. Escudero', '039', 12),
(3428, 'Mineral del Monte', '039', 13),
(3429, 'Guadalajara', '039', 14),
(3430, 'Ixtapaluca', '039', 15),
(3431, 'Huiramba', '039', 16),
(3432, 'Monterrey', '039', 19),
(3433, 'Heroica Ciudad de Huajuapan de León', '039', 20),
(3434, 'Cuautempan', '039', 21),
(3435, 'Tampamolón Corona', '039', 24),
(3436, 'Naco', '039', 26),
(3437, 'Tula', '039', 28),
(3438, 'Xaloztoc', '039', 29),
(3439, 'Coatzacoalcos', '039', 30),
(3440, 'Ixil', '039', 31),
(3441, 'Río Grande', '039', 32),
(3442, 'Huixtla', '040', 7),
(3443, 'Madera', '040', 8),
(3444, 'Tierra Blanca', '040', 11),
(3445, 'Leonardo Bravo', '040', 12),
(3446, 'La Misión', '040', 13),
(3447, 'Hostotipaquillo', '040', 14),
(3448, 'Ixtapan de la Sal', '040', 15),
(3449, 'Indaparapeo', '040', 16),
(3450, 'Parás', '040', 19),
(3451, 'Huautepec', '040', 20),
(3452, 'Cuautinchán', '040', 21),
(3453, 'Tamuín', '040', 24),
(3454, 'Nácori Chico', '040', 26),
(3455, 'Valle Hermoso', '040', 28),
(3456, 'Xaltocan', '040', 29),
(3457, 'Coatzintla', '040', 30),
(3458, 'Izamal', '040', 31),
(3459, 'Sain Alto', '040', 32),
(3460, 'La Independencia', '041', 7),
(3461, 'Maguarichi', '041', 8),
(3462, 'Uriangato', '041', 11),
(3463, 'Malinaltepec', '041', 12),
(3464, 'Mixquiahuala de Juárez', '041', 13),
(3465, 'Huejúcar', '041', 14),
(3466, 'Ixtapan del Oro', '041', 15),
(3467, 'Irimbo', '041', 16),
(3468, 'Pesquería', '041', 19),
(3469, 'Huautla de Jiménez', '041', 20),
(3470, 'Cuautlancingo', '041', 21),
(3471, 'Tanlajás', '041', 24),
(3472, 'Nacozari de García', '041', 26),
(3473, 'Victoria', '041', 28),
(3474, 'Papalotla de Xicohténcatl', '041', 29),
(3475, 'Coetzala', '041', 30),
(3476, 'Kanasín', '041', 31),
(3477, 'El Salvador', '041', 32),
(3478, 'Ixhuatán', '042', 7),
(3479, 'Manuel Benavides', '042', 8),
(3480, 'Valle de Santiago', '042', 11),
(3481, 'Mártir de Cuilapan', '042', 12),
(3482, 'Molango de Escamilla', '042', 13),
(3483, 'Huejuquilla el Alto', '042', 14),
(3484, 'Ixtlahuaca', '042', 15),
(3485, 'Ixtlán', '042', 16),
(3486, 'Los Ramones', '042', 19),
(3487, 'Ixtlán de Juárez', '042', 20),
(3488, 'Cuayuca de Andrade', '042', 21),
(3489, 'Tanquián de Escobedo', '042', 24),
(3490, 'Navojoa', '042', 26),
(3491, 'Villagrán', '042', 28),
(3492, 'Xicohtzinco', '042', 29),
(3493, 'Colipa', '042', 30),
(3494, 'Kantunil', '042', 31),
(3495, 'Sombrerete', '042', 32),
(3496, 'Ixtacomitán', '043', 7),
(3497, 'Matachí', '043', 8),
(3498, 'Victoria', '043', 11),
(3499, 'Metlatónoc', '043', 12),
(3500, 'Nicolás Flores', '043', 13),
(3501, 'La Huerta', '043', 14),
(3502, 'Xalatlaco', '043', 15),
(3503, 'Jacona', '043', 16),
(3504, 'Rayones', '043', 19),
(3505, 'Heroica Ciudad de Juchitán de Zaragoza', '043', 20),
(3506, 'Cuetzalan del Progreso', '043', 21),
(3507, 'Tierra Nueva', '043', 24),
(3508, 'Nogales', '043', 26),
(3509, 'Xicoténcatl', '043', 28),
(3510, 'Yauhquemehcan', '043', 29),
(3511, 'Comapa', '043', 30),
(3512, 'Kaua', '043', 31),
(3513, 'Susticacán', '043', 32),
(3514, 'Ixtapa', '044', 7),
(3515, 'Matamoros', '044', 8),
(3516, 'Villagrán', '044', 11),
(3517, 'Mochitlán', '044', 12),
(3518, 'Nopala de Villagrán', '044', 13),
(3519, 'Ixtlahuacán de los Membrillos', '044', 14),
(3520, 'Jaltenco', '044', 15),
(3521, 'Jiménez', '044', 16),
(3522, 'Sabinas Hidalgo', '044', 19),
(3523, 'Loma Bonita', '044', 20),
(3524, 'Cuyoaco', '044', 21),
(3525, 'Vanegas', '044', 24),
(3526, 'Onavas', '044', 26),
(3527, 'Zacatelco', '044', 29),
(3528, 'Córdoba', '044', 30),
(3529, 'Kinchil', '044', 31),
(3530, 'Tabasco', '044', 32),
(3531, 'Ixtapangajoya', '045', 7),
(3532, 'Meoqui', '045', 8),
(3533, 'Xichú', '045', 11),
(3534, 'Olinalá', '045', 12),
(3535, 'Omitlán de Juárez', '045', 13),
(3536, 'Ixtlahuacán del Río', '045', 14),
(3537, 'Jilotepec', '045', 15),
(3538, 'Jiquilpan', '045', 16),
(3539, 'Salinas Victoria', '045', 19),
(3540, 'Magdalena Apasco', '045', 20),
(3541, 'Chalchicomula de Sesma', '045', 21),
(3542, 'Venado', '045', 24),
(3543, 'Opodepe', '045', 26),
(3544, 'Benito Juárez', '045', 29),
(3545, 'Cosamaloapan de Carpio', '045', 30),
(3546, 'Kopomá', '045', 31),
(3547, 'Tepechitlán', '045', 32),
(3548, 'Jiquipilas', '046', 7),
(3549, 'Morelos', '046', 8),
(3550, 'Yuriria', '046', 11),
(3551, 'Ometepec', '046', 12),
(3552, 'San Felipe Orizatlán', '046', 13),
(3553, 'Jalostotitlán', '046', 14),
(3554, 'Jilotzingo', '046', 15),
(3555, 'Juárez', '046', 16),
(3556, 'San Nicolás de los Garza', '046', 19),
(3557, 'Magdalena Jaltepec', '046', 20),
(3558, 'Chapulco', '046', 21),
(3559, 'Villa de Arriaga', '046', 24),
(3560, 'Oquitoa', '046', 26),
(3561, 'Emiliano Zapata', '046', 29),
(3562, 'Cosautlán de Carvajal', '046', 30),
(3563, 'Mama', '046', 31),
(3564, 'Tepetongo', '046', 32),
(3565, 'Jitotol', '047', 7),
(3566, 'Moris', '047', 8),
(3567, 'Pedro Ascencio Alquisiras', '047', 12),
(3568, 'Pacula', '047', 13),
(3569, 'Jamay', '047', 14),
(3570, 'Jiquipilco', '047', 15),
(3571, 'Jungapeo', '047', 16),
(3572, 'Hidalgo', '047', 19),
(3573, 'Santa Magdalena Jicotlán', '047', 20),
(3574, 'Chiautla', '047', 21),
(3575, 'Villa de Guadalupe', '047', 24),
(3576, 'Pitiquito', '047', 26),
(3577, 'Lázaro Cárdenas', '047', 29),
(3578, 'Coscomatepec', '047', 30),
(3579, 'Maní', '047', 31),
(3580, 'Teúl de González Ortega', '047', 32),
(3581, 'Juárez', '048', 7),
(3582, 'Namiquipa', '048', 8),
(3583, 'Petatlán', '048', 12),
(3584, 'Pachuca de Soto', '048', 13),
(3585, 'Jesús María', '048', 14),
(3586, 'Jocotitlán', '048', 15),
(3587, 'Lagunillas', '048', 16),
(3588, 'Santa Catarina', '048', 19),
(3589, 'Magdalena Mixtepec', '048', 20),
(3590, 'Chiautzingo', '048', 21),
(3591, 'Villa de la Paz', '048', 24),
(3592, 'Puerto Peñasco', '048', 26),
(3593, 'La Magdalena Tlaltelulco', '048', 29),
(3594, 'Cosoleacaque', '048', 30),
(3595, 'Maxcanú', '048', 31),
(3596, 'Tlaltenango de Sánchez Román', '048', 32),
(3597, 'Larráinzar', '049', 7),
(3598, 'Nonoava', '049', 8),
(3599, 'Pilcaya', '049', 12),
(3600, 'Pisaflores', '049', 13),
(3601, 'Jilotlán de los Dolores', '049', 14),
(3602, 'Joquicingo', '049', 15),
(3603, 'Madero', '049', 16),
(3604, 'Santiago', '049', 19),
(3605, 'Magdalena Ocotlán', '049', 20),
(3606, 'Chiconcuautla', '049', 21),
(3607, 'Villa de Ramos', '049', 24),
(3608, 'Quiriego', '049', 26),
(3609, 'San Damián Texóloc', '049', 29),
(3610, 'Cotaxtla', '049', 30),
(3611, 'Mayapán', '049', 31),
(3612, 'Valparaíso', '049', 32),
(3613, 'La Libertad', '050', 7),
(3614, 'Nuevo Casas Grandes', '050', 8),
(3615, 'Pungarabato', '050', 12),
(3616, 'Progreso de Obregón', '050', 13),
(3617, 'Jocotepec', '050', 14),
(3618, 'Juchitepec', '050', 15),
(3619, 'Maravatío', '050', 16),
(3620, 'Vallecillo', '050', 19),
(3621, 'Magdalena Peñasco', '050', 20),
(3622, 'Chichiquila', '050', 21),
(3623, 'Villa de Reyes', '050', 24),
(3624, 'Rayón', '050', 26),
(3625, 'San Francisco Tetlanohcan', '050', 29),
(3626, 'Coxquihui', '050', 30),
(3627, 'Mérida', '050', 31),
(3628, 'Vetagrande', '050', 32),
(3629, 'Mapastepec', '051', 7),
(3630, 'Ocampo', '051', 8),
(3631, 'Quechultenango', '051', 12),
(3632, 'Mineral de la Reforma', '051', 13),
(3633, 'Juanacatlán', '051', 14),
(3634, 'Lerma', '051', 15),
(3635, 'Marcos Castellanos', '051', 16),
(3636, 'Villaldama', '051', 19),
(3637, 'Magdalena Teitipac', '051', 20),
(3638, 'Chietla', '051', 21),
(3639, 'Villa Hidalgo', '051', 24),
(3640, 'Rosario', '051', 26),
(3641, 'San Jerónimo Zacualpan', '051', 29),
(3642, 'Coyutla', '051', 30),
(3643, 'Mocochá', '051', 31),
(3644, 'Villa de Cos', '051', 32),
(3645, 'Las Margaritas', '052', 7),
(3646, 'Ojinaga', '052', 8),
(3647, 'San Luis Acatlán', '052', 12),
(3648, 'San Agustín Tlaxiaca', '052', 13),
(3649, 'Juchitlán', '052', 14),
(3650, 'Malinalco', '052', 15),
(3651, 'Lázaro Cárdenas', '052', 16),
(3652, 'Magdalena Tequisistlán', '052', 20),
(3653, 'Chigmecatitlán', '052', 21),
(3654, 'Villa Juárez', '052', 24),
(3655, 'Sahuaripa', '052', 26),
(3656, 'San José Teacalco', '052', 29),
(3657, 'Cuichapa', '052', 30),
(3658, 'Motul', '052', 31),
(3659, 'Villa García', '052', 32),
(3660, 'Mazapa de Madero', '053', 7),
(3661, 'Praxedis G. Guerrero', '053', 8),
(3662, 'San Marcos', '053', 12),
(3663, 'San Bartolo Tutotepec', '053', 13),
(3664, 'Lagos de Moreno', '053', 14),
(3665, 'Melchor Ocampo', '053', 15),
(3666, 'Morelia', '053', 16),
(3667, 'Magdalena Tlacotepec', '053', 20),
(3668, 'Chignahuapan', '053', 21),
(3669, 'Axtla de Terrazas', '053', 24),
(3670, 'San Felipe de Jesús', '053', 26),
(3671, 'San Juan Huactzinco', '053', 29),
(3672, 'Cuitláhuac', '053', 30),
(3673, 'Muna', '053', 31),
(3674, 'Villa González Ortega', '053', 32),
(3675, 'Mazatán', '054', 7),
(3676, 'Riva Palacio', '054', 8),
(3677, 'San Miguel Totolapan', '054', 12),
(3678, 'San Salvador', '054', 13),
(3679, 'El Limón', '054', 14),
(3680, 'Metepec', '054', 15),
(3681, 'Morelos', '054', 16),
(3682, 'Magdalena Zahuatlán', '054', 20),
(3683, 'Chignautla', '054', 21),
(3684, 'Xilitla', '054', 24),
(3685, 'San Javier', '054', 26),
(3686, 'San Lorenzo Axocomanitla', '054', 29),
(3687, 'Chacaltianguis', '054', 30),
(3688, 'Muxupip', '054', 31),
(3689, 'Villa Hidalgo', '054', 32),
(3690, 'Metapa', '055', 7),
(3691, 'Rosales', '055', 8),
(3692, 'Taxco de Alarcón', '055', 12),
(3693, 'Santiago de Anaya', '055', 13),
(3694, 'Magdalena', '055', 14),
(3695, 'Mexicaltzingo', '055', 15),
(3696, 'Múgica', '055', 16),
(3697, 'Mariscala de Juárez', '055', 20),
(3698, 'Chila', '055', 21),
(3699, 'Zaragoza', '055', 24),
(3700, 'San Luis Río Colorado', '055', 26),
(3701, 'San Lucas Tecopilco', '055', 29),
(3702, 'Chalma', '055', 30),
(3703, 'Opichén', '055', 31),
(3704, 'Villanueva', '055', 32),
(3705, 'Mitontic', '056', 7),
(3706, 'Rosario', '056', 8),
(3707, 'Tecoanapa', '056', 12),
(3708, 'Santiago Tulantepec de Lugo Guerrero', '056', 13),
(3709, 'Santa María del Oro', '056', 14),
(3710, 'Morelos', '056', 15),
(3711, 'Nahuatzen', '056', 16),
(3712, 'Mártires de Tacubaya', '056', 20),
(3713, 'Chila de la Sal', '056', 21),
(3714, 'Villa de Arista', '056', 24),
(3715, 'San Miguel de Horcasitas', '056', 26),
(3716, 'Santa Ana Nopalucan', '056', 29),
(3717, 'Chiconamel', '056', 30),
(3718, 'Oxkutzcab', '056', 31),
(3719, 'Zacatecas', '056', 32),
(3720, 'Motozintla', '057', 7),
(3721, 'San Francisco de Borja', '057', 8),
(3722, 'Técpan de Galeana', '057', 12),
(3723, 'Singuilucan', '057', 13),
(3724, 'La Manzanilla de la Paz', '057', 14),
(3725, 'Naucalpan de Juárez', '057', 15),
(3726, 'Nocupétaro', '057', 16),
(3727, 'Matías Romero Avendaño', '057', 20),
(3728, 'Honey', '057', 21),
(3729, 'Matlapa', '057', 24),
(3730, 'San Pedro de la Cueva', '057', 26),
(3731, 'Santa Apolonia Teacalco', '057', 29),
(3732, 'Chiconquiaco', '057', 30),
(3733, 'Panabá', '057', 31),
(3734, 'Trancoso', '057', 32),
(3735, 'Nicolás Ruíz', '058', 7),
(3736, 'San Francisco de Conchos', '058', 8),
(3737, 'Teloloapan', '058', 12),
(3738, 'Tasquillo', '058', 13),
(3739, 'Mascota', '058', 14),
(3740, 'Nezahualcóyotl', '058', 15),
(3741, 'Nuevo Parangaricutiro', '058', 16),
(3742, 'Mazatlán Villa de Flores', '058', 20),
(3743, 'Chilchotla', '058', 21),
(3744, 'El Naranjo', '058', 24),
(3745, 'Santa Ana', '058', 26),
(3746, 'Santa Catarina Ayometla', '058', 29),
(3747, 'Chicontepec', '058', 30),
(3748, 'Peto', '058', 31),
(3749, 'Santa María de la Paz', '058', 32),
(3750, 'Ocosingo', '059', 7),
(3751, 'San Francisco del Oro', '059', 8),
(3752, 'Tepecoacuilco de Trujano', '059', 12),
(3753, 'Tecozautla', '059', 13),
(3754, 'Mazamitla', '059', 14),
(3755, 'Nextlalpan', '059', 15),
(3756, 'Nuevo Urecho', '059', 16),
(3757, 'Miahuatlán de Porfirio Díaz', '059', 20),
(3758, 'Chinantla', '059', 21),
(3759, 'Santa Cruz', '059', 26),
(3760, 'Santa Cruz Quilehtla', '059', 29),
(3761, 'Chinameca', '059', 30),
(3762, 'Progreso', '059', 31),
(3763, 'Ocotepec', '060', 7),
(3764, 'Santa Bárbara', '060', 8),
(3765, 'Tetipac', '060', 12),
(3766, 'Tenango de Doria', '060', 13),
(3767, 'Mexticacán', '060', 14),
(3768, 'Nicolás Romero', '060', 15),
(3769, 'Numarán', '060', 16),
(3770, 'Mixistlán de la Reforma', '060', 20),
(3771, 'Domingo Arenas', '060', 21),
(3772, 'Sáric', '060', 26),
(3773, 'Santa Isabel Xiloxoxtla', '060', 29),
(3774, 'Chinampa de Gorostiza', '060', 30),
(3775, 'Quintana Roo', '060', 31),
(3776, 'Ocozocoautla de Espinosa', '061', 7),
(3777, 'Satevó', '061', 8),
(3778, 'Tixtla de Guerrero', '061', 12),
(3779, 'Tepeapulco', '061', 13),
(3780, 'Mezquitic', '061', 14),
(3781, 'Nopaltepec', '061', 15),
(3782, 'Ocampo', '061', 16),
(3783, 'Monjas', '061', 20),
(3784, 'Eloxochitlán', '061', 21),
(3785, 'Soyopa', '061', 26),
(3786, 'Las Choapas', '061', 30),
(3787, 'Río Lagartos', '061', 31),
(3788, 'Ostuacán', '062', 7),
(3789, 'Saucillo', '062', 8),
(3790, 'Tlacoachistlahuaca', '062', 12),
(3791, 'Tepehuacán de Guerrero', '062', 13),
(3792, 'Mixtlán', '062', 14),
(3793, 'Ocoyoacac', '062', 15),
(3794, 'Pajacuarán', '062', 16),
(3795, 'Natividad', '062', 20),
(3796, 'Epatlán', '062', 21),
(3797, 'Suaqui Grande', '062', 26),
(3798, 'Chocamán', '062', 30),
(3799, 'Sacalum', '062', 31),
(3800, 'Osumacinta', '063', 7),
(3801, 'Temósachic', '063', 8),
(3802, 'Tlacoapa', '063', 12),
(3803, 'Tepeji del Río de Ocampo', '063', 13),
(3804, 'Ocotlán', '063', 14),
(3805, 'Ocuilan', '063', 15),
(3806, 'Panindícuaro', '063', 16),
(3807, 'Nazareno Etla', '063', 20),
(3808, 'Esperanza', '063', 21),
(3809, 'Tepache', '063', 26),
(3810, 'Chontla', '063', 30),
(3811, 'Samahil', '063', 31),
(3812, 'Oxchuc', '064', 7),
(3813, 'El Tule', '064', 8),
(3814, 'Tlalchapa', '064', 12),
(3815, 'Tepetitlán', '064', 13),
(3816, 'Ojuelos de Jalisco', '064', 14),
(3817, 'El Oro', '064', 15),
(3818, 'Parácuaro', '064', 16),
(3819, 'Nejapa de Madero', '064', 20),
(3820, 'Francisco Z. Mena', '064', 21),
(3821, 'Trincheras', '064', 26),
(3822, 'Chumatlán', '064', 30),
(3823, 'Sanahcat', '064', 31),
(3824, 'Palenque', '065', 7),
(3825, 'Urique', '065', 8),
(3826, 'Tlalixtaquilla de Maldonado', '065', 12),
(3827, 'Tetepango', '065', 13),
(3828, 'Pihuamo', '065', 14),
(3829, 'Otumba', '065', 15),
(3830, 'Paracho', '065', 16),
(3831, 'Ixpantepec Nieves', '065', 20),
(3832, 'General Felipe Ángeles', '065', 21),
(3833, 'Tubutama', '065', 26),
(3834, 'Emiliano Zapata', '065', 30),
(3835, 'San Felipe', '065', 31),
(3836, 'Pantelhó', '066', 7),
(3837, 'Uruachi', '066', 8),
(3838, 'Tlapa de Comonfort', '066', 12),
(3839, 'Villa de Tezontepec', '066', 13),
(3840, 'Poncitlán', '066', 14),
(3841, 'Otzoloapan', '066', 15),
(3842, 'Pátzcuaro', '066', 16),
(3843, 'Santiago Niltepec', '066', 20),
(3844, 'Guadalupe', '066', 21),
(3845, 'Ures', '066', 26),
(3846, 'Espinal', '066', 30),
(3847, 'Santa Elena', '066', 31),
(3848, 'Pantepec', '067', 7),
(3849, 'Valle de Zaragoza', '067', 8),
(3850, 'Tlapehuala', '067', 12),
(3851, 'Tezontepec de Aldama', '067', 13),
(3852, 'Puerto Vallarta', '067', 14),
(3853, 'Otzolotepec', '067', 15),
(3854, 'Penjamillo', '067', 16),
(3855, 'Oaxaca de Juárez', '067', 20),
(3856, 'Guadalupe Victoria', '067', 21),
(3857, 'Villa Hidalgo', '067', 26),
(3858, 'Filomeno Mata', '067', 30),
(3859, 'Seyé', '067', 31),
(3860, 'Pichucalco', '068', 7),
(3861, 'La Unión de Isidoro Montes de Oca', '068', 12),
(3862, 'Tianguistengo', '068', 13),
(3863, 'Villa Purificación', '068', 14),
(3864, 'Ozumba', '068', 15),
(3865, 'Peribán', '068', 16),
(3866, 'Ocotlán de Morelos', '068', 20),
(3867, 'Hermenegildo Galeana', '068', 21),
(3868, 'Villa Pesqueira', '068', 26),
(3869, 'Fortín', '068', 30),
(3870, 'Sinanché', '068', 31),
(3871, 'Pijijiapan', '069', 7),
(3872, 'Xalpatláhuac', '069', 12),
(3873, 'Tizayuca', '069', 13),
(3874, 'Quitupan', '069', 14),
(3875, 'Papalotla', '069', 15),
(3876, 'La Piedad', '069', 16),
(3877, 'La Pe', '069', 20),
(3878, 'Huaquechula', '069', 21),
(3879, 'Yécora', '069', 26),
(3880, 'Gutiérrez Zamora', '069', 30),
(3881, 'Sotuta', '069', 31),
(3882, 'El Porvenir', '070', 7),
(3883, 'Xochihuehuetlán', '070', 12),
(3884, 'Tlahuelilpan', '070', 13),
(3885, 'El Salto', '070', 14),
(3886, 'La Paz', '070', 15),
(3887, 'Purépero', '070', 16),
(3888, 'Pinotepa de Don Luis', '070', 20),
(3889, 'Huatlatlauca', '070', 21),
(3890, 'General Plutarco Elías Calles', '070', 26),
(3891, 'Hidalgotitlán', '070', 30),
(3892, 'Sucilá', '070', 31),
(3893, 'Villa Comaltitlán', '071', 7),
(3894, 'Xochistlahuaca', '071', 12),
(3895, 'Tlahuiltepa', '071', 13),
(3896, 'San Cristóbal de la Barranca', '071', 14),
(3897, 'Polotitlán', '071', 15),
(3898, 'Puruándiro', '071', 16),
(3899, 'Pluma Hidalgo', '071', 20),
(3900, 'Huauchinango', '071', 21),
(3901, 'Benito Juárez', '071', 26),
(3902, 'Huatusco', '071', 30),
(3903, 'Sudzal', '071', 31),
(3904, 'Pueblo Nuevo Solistahuacán', '072', 7),
(3905, 'Zapotitlán Tablas', '072', 12),
(3906, 'Tlanalapa', '072', 13),
(3907, 'San Diego de Alejandría', '072', 14),
(3908, 'Rayón', '072', 15),
(3909, 'Queréndaro', '072', 16),
(3910, 'San José del Progreso', '072', 20),
(3911, 'Huehuetla', '072', 21),
(3912, 'San Ignacio Río Muerto', '072', 26),
(3913, 'Huayacocotla', '072', 30),
(3914, 'Suma', '072', 31),
(3915, 'Rayón', '073', 7),
(3916, 'Zirándaro', '073', 12),
(3917, 'Tlanchinol', '073', 13),
(3918, 'San Juan de los Lagos', '073', 14),
(3919, 'San Antonio la Isla', '073', 15),
(3920, 'Quiroga', '073', 16),
(3921, 'Putla Villa de Guerrero', '073', 20),
(3922, 'Huehuetlán el Chico', '073', 21),
(3923, 'Hueyapan de Ocampo', '073', 30),
(3924, 'Tahdziú', '073', 31),
(3925, 'Reforma', '074', 7),
(3926, 'Zitlala', '074', 12),
(3927, 'Tlaxcoapan', '074', 13),
(3928, 'San Julián', '074', 14),
(3929, 'San Felipe del Progreso', '074', 15),
(3930, 'Cojumatlán de Régules', '074', 16),
(3931, 'Santa Catarina Quioquitani', '074', 20),
(3932, 'Huejotzingo', '074', 21),
(3933, 'Huiloapan de Cuauhtémoc', '074', 30),
(3934, 'Tahmek', '074', 31),
(3935, 'Las Rosas', '075', 7),
(3936, 'Eduardo Neri', '075', 12),
(3937, 'Tolcayuca', '075', 13),
(3938, 'San Marcos', '075', 14),
(3939, 'San Martín de las Pirámides', '075', 15),
(3940, 'Los Reyes', '075', 16),
(3941, 'Reforma de Pineda', '075', 20),
(3942, 'Hueyapan', '075', 21),
(3943, 'Ignacio de la Llave', '075', 30),
(3944, 'Teabo', '075', 31),
(3945, 'Sabanilla', '076', 7),
(3946, 'Acatepec', '076', 12),
(3947, 'Tula de Allende', '076', 13),
(3948, 'San Martín de Bolaños', '076', 14),
(3949, 'San Mateo Atenco', '076', 15),
(3950, 'Sahuayo', '076', 16),
(3951, 'La Reforma', '076', 20),
(3952, 'Hueytamalco', '076', 21),
(3953, 'Ilamatlán', '076', 30),
(3954, 'Tecoh', '076', 31),
(3955, 'Salto de Agua', '077', 7),
(3956, 'Marquelia', '077', 12),
(3957, 'Tulancingo de Bravo', '077', 13),
(3958, 'San Martín Hidalgo', '077', 14),
(3959, 'San Simón de Guerrero', '077', 15),
(3960, 'San Lucas', '077', 16),
(3961, 'Reyes Etla', '077', 20),
(3962, 'Hueytlalpan', '077', 21),
(3963, 'Isla', '077', 30),
(3964, 'Tekal de Venegas', '077', 31),
(3965, 'San Cristóbal de las Casas', '078', 7),
(3966, 'Cochoapa el Grande', '078', 12),
(3967, 'Xochiatipan', '078', 13),
(3968, 'San Miguel el Alto', '078', 14),
(3969, 'Santo Tomás', '078', 15),
(3970, 'Santa Ana Maya', '078', 16),
(3971, 'Rojas de Cuauhtémoc', '078', 20),
(3972, 'Huitzilan de Serdán', '078', 21),
(3973, 'Ixcatepec', '078', 30),
(3974, 'Tekantó', '078', 31),
(3975, 'San Fernando', '079', 7),
(3976, 'José Joaquín de Herrera', '079', 12),
(3977, 'Xochicoatlán', '079', 13),
(3978, 'Gómez Farías', '079', 14),
(3979, 'Soyaniquilpan de Juárez', '079', 15),
(3980, 'Salvador Escalante', '079', 16),
(3981, 'Salina Cruz', '079', 20),
(3982, 'Huitziltepec', '079', 21),
(3983, 'Ixhuacán de los Reyes', '079', 30),
(3984, 'Tekax', '079', 31),
(3985, 'Siltepec', '080', 7),
(3986, 'Juchitán', '080', 12),
(3987, 'Yahualica', '080', 13),
(3988, 'San Sebastián del Oeste', '080', 14),
(3989, 'Sultepec', '080', 15),
(3990, 'Senguio', '080', 16),
(3991, 'San Agustín Amatengo', '080', 20),
(3992, 'Atlequizayan', '080', 21),
(3993, 'Ixhuatlán del Café', '080', 30),
(3994, 'Tekit', '080', 31),
(3995, 'Simojovel', '081', 7),
(3996, 'Iliatenco', '081', 12),
(3997, 'Zacualtipán de Ángeles', '081', 13),
(3998, 'Santa María de los Ángeles', '081', 14),
(3999, 'Tecámac', '081', 15),
(4000, 'Susupuato', '081', 16),
(4001, 'San Agustín Atenango', '081', 20),
(4002, 'Ixcamilpa de Guerrero', '081', 21),
(4003, 'Ixhuatlancillo', '081', 30),
(4004, 'Tekom', '081', 31),
(4005, 'Sitalá', '082', 7);
INSERT INTO `system_ubicacion_municipios` (`id`, `nombre`, `clave_sepomex`, `fk_estado`) VALUES
(4006, 'Zapotlán de Juárez', '082', 13),
(4007, 'Sayula', '082', 14),
(4008, 'Tejupilco', '082', 15),
(4009, 'Tacámbaro', '082', 16),
(4010, 'San Agustín Chayuco', '082', 20),
(4011, 'Ixcaquixtla', '082', 21),
(4012, 'Ixhuatlán del Sureste', '082', 30),
(4013, 'Telchac Pueblo', '082', 31),
(4014, 'Socoltenango', '083', 7),
(4015, 'Zempoala', '083', 13),
(4016, 'Tala', '083', 14),
(4017, 'Temamatla', '083', 15),
(4018, 'Tancítaro', '083', 16),
(4019, 'San Agustín de las Juntas', '083', 20),
(4020, 'Ixtacamaxtitlán', '083', 21),
(4021, 'Ixhuatlán de Madero', '083', 30),
(4022, 'Telchac Puerto', '083', 31),
(4023, 'Solosuchiapa', '084', 7),
(4024, 'Zimapán', '084', 13),
(4025, 'Talpa de Allende', '084', 14),
(4026, 'Temascalapa', '084', 15),
(4027, 'Tangamandapio', '084', 16),
(4028, 'San Agustín Etla', '084', 20),
(4029, 'Ixtepec', '084', 21),
(4030, 'Ixmatlahuacan', '084', 30),
(4031, 'Temax', '084', 31),
(4032, 'Soyaló', '085', 7),
(4033, 'Tamazula de Gordiano', '085', 14),
(4034, 'Temascalcingo', '085', 15),
(4035, 'Tangancícuaro', '085', 16),
(4036, 'San Agustín Loxicha', '085', 20),
(4037, 'Izúcar de Matamoros', '085', 21),
(4038, 'Ixtaczoquitlán', '085', 30),
(4039, 'Temozón', '085', 31),
(4040, 'Suchiapa', '086', 7),
(4041, 'Tapalpa', '086', 14),
(4042, 'Temascaltepec', '086', 15),
(4043, 'Tanhuato', '086', 16),
(4044, 'San Agustín Tlacotepec', '086', 20),
(4045, 'Jalpan', '086', 21),
(4046, 'Jalacingo', '086', 30),
(4047, 'Tepakán', '086', 31),
(4048, 'Suchiate', '087', 7),
(4049, 'Tecalitlán', '087', 14),
(4050, 'Temoaya', '087', 15),
(4051, 'Taretan', '087', 16),
(4052, 'San Agustín Yatareni', '087', 20),
(4053, 'Jolalpan', '087', 21),
(4054, 'Xalapa', '087', 30),
(4055, 'Tetiz', '087', 31),
(4056, 'Sunuapa', '088', 7),
(4057, 'Tecolotlán', '088', 14),
(4058, 'Tenancingo', '088', 15),
(4059, 'Tarímbaro', '088', 16),
(4060, 'San Andrés Cabecera Nueva', '088', 20),
(4061, 'Jonotla', '088', 21),
(4062, 'Jalcomulco', '088', 30),
(4063, 'Teya', '088', 31),
(4064, 'Tapachula', '089', 7),
(4065, 'Techaluta de Montenegro', '089', 14),
(4066, 'Tenango del Aire', '089', 15),
(4067, 'Tepalcatepec', '089', 16),
(4068, 'San Andrés Dinicuiti', '089', 20),
(4069, 'Jopala', '089', 21),
(4070, 'Jáltipan', '089', 30),
(4071, 'Ticul', '089', 31),
(4072, 'Tapalapa', '090', 7),
(4073, 'Tenamaxtlán', '090', 14),
(4074, 'Tenango del Valle', '090', 15),
(4075, 'Tingambato', '090', 16),
(4076, 'San Andrés Huaxpaltepec', '090', 20),
(4077, 'Juan C. Bonilla', '090', 21),
(4078, 'Jamapa', '090', 30),
(4079, 'Timucuy', '090', 31),
(4080, 'Tapilula', '091', 7),
(4081, 'Teocaltiche', '091', 14),
(4082, 'Teoloyucan', '091', 15),
(4083, 'Tingüindín', '091', 16),
(4084, 'San Andrés Huayápam', '091', 20),
(4085, 'Juan Galindo', '091', 21),
(4086, 'Jesús Carranza', '091', 30),
(4087, 'Tinum', '091', 31),
(4088, 'Tecpatán', '092', 7),
(4089, 'Teocuitatlán de Corona', '092', 14),
(4090, 'Teotihuacán', '092', 15),
(4091, 'Tiquicheo de Nicolás Romero', '092', 16),
(4092, 'San Andrés Ixtlahuaca', '092', 20),
(4093, 'Juan N. Méndez', '092', 21),
(4094, 'Xico', '092', 30),
(4095, 'Tixcacalcupul', '092', 31),
(4096, 'Tenejapa', '093', 7),
(4097, 'Tepatitlán de Morelos', '093', 14),
(4098, 'Tepetlaoxtoc', '093', 15),
(4099, 'Tlalpujahua', '093', 16),
(4100, 'San Andrés Lagunas', '093', 20),
(4101, 'Lafragua', '093', 21),
(4102, 'Jilotepec', '093', 30),
(4103, 'Tixkokob', '093', 31),
(4104, 'Teopisca', '094', 7),
(4105, 'Tequila', '094', 14),
(4106, 'Tepetlixpa', '094', 15),
(4107, 'Tlazazalca', '094', 16),
(4108, 'San Andrés Nuxiño', '094', 20),
(4109, 'Libres', '094', 21),
(4110, 'Juan Rodríguez Clara', '094', 30),
(4111, 'Tixmehuac', '094', 31),
(4112, 'Teuchitlán', '095', 14),
(4113, 'Tepotzotlán', '095', 15),
(4114, 'Tocumbo', '095', 16),
(4115, 'San Andrés Paxtlán', '095', 20),
(4116, 'La Magdalena Tlatlauquitepec', '095', 21),
(4117, 'Juchique de Ferrer', '095', 30),
(4118, 'Tixpéhual', '095', 31),
(4119, 'Tila', '096', 7),
(4120, 'Tizapán el Alto', '096', 14),
(4121, 'Tequixquiac', '096', 15),
(4122, 'Tumbiscatío', '096', 16),
(4123, 'San Andrés Sinaxtla', '096', 20),
(4124, 'Mazapiltepec de Juárez', '096', 21),
(4125, 'Landero y Coss', '096', 30),
(4126, 'Tizimín', '096', 31),
(4127, 'Tonalá', '097', 7),
(4128, 'Tlajomulco de Zúñiga', '097', 14),
(4129, 'Texcaltitlán', '097', 15),
(4130, 'Turicato', '097', 16),
(4131, 'San Andrés Solaga', '097', 20),
(4132, 'Mixtla', '097', 21),
(4133, 'Lerdo de Tejada', '097', 30),
(4134, 'Tunkás', '097', 31),
(4135, 'Totolapa', '098', 7),
(4136, 'San Pedro Tlaquepaque', '098', 14),
(4137, 'Texcalyacac', '098', 15),
(4138, 'Tuxpan', '098', 16),
(4139, 'San Andrés Teotilálpam', '098', 20),
(4140, 'Molcaxac', '098', 21),
(4141, 'Magdalena', '098', 30),
(4142, 'Tzucacab', '098', 31),
(4143, 'La Trinitaria', '099', 7),
(4144, 'Tolimán', '099', 14),
(4145, 'Texcoco', '099', 15),
(4146, 'Tuzantla', '099', 16),
(4147, 'San Andrés Tepetlapa', '099', 20),
(4148, 'Cañada Morelos', '099', 21),
(4149, 'Maltrata', '099', 30),
(4150, 'Uayma', '099', 31),
(4151, 'Tumbalá', '100', 7),
(4152, 'Tomatlán', '100', 14),
(4153, 'Tezoyuca', '100', 15),
(4154, 'Tzintzuntzan', '100', 16),
(4155, 'San Andrés Yaá', '100', 20),
(4156, 'Naupan', '100', 21),
(4157, 'Manlio Fabio Altamirano', '100', 30),
(4158, 'Ucú', '100', 31),
(4159, 'Tuxtla Gutiérrez', '101', 7),
(4160, 'Tonalá', '101', 14),
(4161, 'Tianguistenco', '101', 15),
(4162, 'Tzitzio', '101', 16),
(4163, 'San Andrés Zabache', '101', 20),
(4164, 'Nauzontla', '101', 21),
(4165, 'Mariano Escobedo', '101', 30),
(4166, 'Umán', '101', 31),
(4167, 'Tuxtla Chico', '102', 7),
(4168, 'Tonaya', '102', 14),
(4169, 'Timilpan', '102', 15),
(4170, 'Uruapan', '102', 16),
(4171, 'San Andrés Zautla', '102', 20),
(4172, 'Nealtican', '102', 21),
(4173, 'Martínez de la Torre', '102', 30),
(4174, 'Valladolid', '102', 31),
(4175, 'Tuzantán', '103', 7),
(4176, 'Tonila', '103', 14),
(4177, 'Tlalmanalco', '103', 15),
(4178, 'Venustiano Carranza', '103', 16),
(4179, 'San Antonino Castillo Velasco', '103', 20),
(4180, 'Nicolás Bravo', '103', 21),
(4181, 'Mecatlán', '103', 30),
(4182, 'Xocchel', '103', 31),
(4183, 'Tzimol', '104', 7),
(4184, 'Totatiche', '104', 14),
(4185, 'Tlalnepantla de Baz', '104', 15),
(4186, 'Villamar', '104', 16),
(4187, 'San Antonino el Alto', '104', 20),
(4188, 'Nopalucan', '104', 21),
(4189, 'Mecayapan', '104', 30),
(4190, 'Yaxcabá', '104', 31),
(4191, 'Unión Juárez', '105', 7),
(4192, 'Tototlán', '105', 14),
(4193, 'Tlatlaya', '105', 15),
(4194, 'Vista Hermosa', '105', 16),
(4195, 'San Antonino Monte Verde', '105', 20),
(4196, 'Ocotepec', '105', 21),
(4197, 'Medellín', '105', 30),
(4198, 'Yaxkukul', '105', 31),
(4199, 'Venustiano Carranza', '106', 7),
(4200, 'Tuxcacuesco', '106', 14),
(4201, 'Toluca', '106', 15),
(4202, 'Yurécuaro', '106', 16),
(4203, 'San Antonio Acutla', '106', 20),
(4204, 'Ocoyucan', '106', 21),
(4205, 'Miahuatlán', '106', 30),
(4206, 'Yobaín', '106', 31),
(4207, 'Villa Corzo', '107', 7),
(4208, 'Tuxcueca', '107', 14),
(4209, 'Tonatico', '107', 15),
(4210, 'Zacapu', '107', 16),
(4211, 'San Antonio de la Cal', '107', 20),
(4212, 'Olintla', '107', 21),
(4213, 'Las Minas', '107', 30),
(4214, 'Villaflores', '108', 7),
(4215, 'Tuxpan', '108', 14),
(4216, 'Tultepec', '108', 15),
(4217, 'Zamora', '108', 16),
(4218, 'San Antonio Huitepec', '108', 20),
(4219, 'Oriental', '108', 21),
(4220, 'Minatitlán', '108', 30),
(4221, 'Yajalón', '109', 7),
(4222, 'Unión de San Antonio', '109', 14),
(4223, 'Tultitlán', '109', 15),
(4224, 'Zináparo', '109', 16),
(4225, 'San Antonio Nanahuatípam', '109', 20),
(4226, 'Pahuatlán', '109', 21),
(4227, 'Misantla', '109', 30),
(4228, 'San Lucas', '110', 7),
(4229, 'Unión de Tula', '110', 14),
(4230, 'Valle de Bravo', '110', 15),
(4231, 'Zinapécuaro', '110', 16),
(4232, 'San Antonio Sinicahua', '110', 20),
(4233, 'Palmar de Bravo', '110', 21),
(4234, 'Mixtla de Altamirano', '110', 30),
(4235, 'Zinacantán', '111', 7),
(4236, 'Valle de Guadalupe', '111', 14),
(4237, 'Villa de Allende', '111', 15),
(4238, 'Ziracuaretiro', '111', 16),
(4239, 'San Antonio Tepetlapa', '111', 20),
(4240, 'Pantepec', '111', 21),
(4241, 'Moloacán', '111', 30),
(4242, 'San Juan Cancuc', '112', 7),
(4243, 'Valle de Juárez', '112', 14),
(4244, 'Villa del Carbón', '112', 15),
(4245, 'Zitácuaro', '112', 16),
(4246, 'San Baltazar Chichicápam', '112', 20),
(4247, 'Petlalcingo', '112', 21),
(4248, 'Naolinco', '112', 30),
(4249, 'Aldama', '113', 7),
(4250, 'San Gabriel', '113', 14),
(4251, 'Villa Guerrero', '113', 15),
(4252, 'José Sixto Verduzco', '113', 16),
(4253, 'San Baltazar Loxicha', '113', 20),
(4254, 'Piaxtla', '113', 21),
(4255, 'Naranjal', '113', 30),
(4256, 'Benemérito de las Américas', '114', 7),
(4257, 'Villa Corona', '114', 14),
(4258, 'Villa Victoria', '114', 15),
(4259, 'San Baltazar Yatzachi el Bajo', '114', 20),
(4260, 'Puebla', '114', 21),
(4261, 'Nautla', '114', 30),
(4262, 'Maravilla Tenejapa', '115', 7),
(4263, 'Villa Guerrero', '115', 14),
(4264, 'Xonacatlán', '115', 15),
(4265, 'San Bartolo Coyotepec', '115', 20),
(4266, 'Quecholac', '115', 21),
(4267, 'Nogales', '115', 30),
(4268, 'Marqués de Comillas', '116', 7),
(4269, 'Villa Hidalgo', '116', 14),
(4270, 'Zacazonapan', '116', 15),
(4271, 'San Bartolomé Ayautla', '116', 20),
(4272, 'Quimixtlán', '116', 21),
(4273, 'Oluta', '116', 30),
(4274, 'Montecristo de Guerrero', '117', 7),
(4275, 'Cañadas de Obregón', '117', 14),
(4276, 'Zacualpan', '117', 15),
(4277, 'San Bartolomé Loxicha', '117', 20),
(4278, 'Rafael Lara Grajales', '117', 21),
(4279, 'Omealca', '117', 30),
(4280, 'San Andrés Duraznal', '118', 7),
(4281, 'Yahualica de González Gallo', '118', 14),
(4282, 'Zinacantepec', '118', 15),
(4283, 'San Bartolomé Quialana', '118', 20),
(4284, 'Los Reyes de Juárez', '118', 21),
(4285, 'Orizaba', '118', 30),
(4286, 'Santiago el Pinar', '119', 7),
(4287, 'Zacoalco de Torres', '119', 14),
(4288, 'Zumpahuacán', '119', 15),
(4289, 'San Bartolomé Yucuañe', '119', 20),
(4290, 'San Andrés Cholula', '119', 21),
(4291, 'Otatitlán', '119', 30),
(4292, 'Zapopan', '120', 14),
(4293, 'Zumpango', '120', 15),
(4294, 'San Bartolomé Zoogocho', '120', 20),
(4295, 'San Antonio Cañada', '120', 21),
(4296, 'Oteapan', '120', 30),
(4297, 'Zapotiltic', '121', 14),
(4298, 'Cuautitlán Izcalli', '121', 15),
(4299, 'San Bartolo Soyaltepec', '121', 20),
(4300, 'San Diego la Mesa Tochimiltzingo', '121', 21),
(4301, 'Ozuluama de Mascareñas', '121', 30),
(4302, 'Zapotitlán de Vadillo', '122', 14),
(4303, 'Valle de Chalco Solidaridad', '122', 15),
(4304, 'San Bartolo Yautepec', '122', 20),
(4305, 'San Felipe Teotlalcingo', '122', 21),
(4306, 'Pajapan', '122', 30),
(4307, 'Zapotlán del Rey', '123', 14),
(4308, 'Luvianos', '123', 15),
(4309, 'San Bernardo Mixtepec', '123', 20),
(4310, 'San Felipe Tepatlán', '123', 21),
(4311, 'Pánuco', '123', 30),
(4312, 'Zapotlanejo', '124', 14),
(4313, 'San José del Rincón', '124', 15),
(4314, 'San Blas Atempa', '124', 20),
(4315, 'San Gabriel Chilac', '124', 21),
(4316, 'Papantla', '124', 30),
(4317, 'San Ignacio Cerro Gordo', '125', 14),
(4318, 'Tonanitla', '125', 15),
(4319, 'San Carlos Yautepec', '125', 20),
(4320, 'San Gregorio Atzompa', '125', 21),
(4321, 'Paso del Macho', '125', 30),
(4322, 'San Cristóbal Amatlán', '126', 20),
(4323, 'San Jerónimo Tecuanipan', '126', 21),
(4324, 'Paso de Ovejas', '126', 30),
(4325, 'San Cristóbal Amoltepec', '127', 20),
(4326, 'San Jerónimo Xayacatlán', '127', 21),
(4327, 'La Perla', '127', 30),
(4328, 'San Cristóbal Lachirioag', '128', 20),
(4329, 'San José Chiapa', '128', 21),
(4330, 'Perote', '128', 30),
(4331, 'San Cristóbal Suchixtlahuaca', '129', 20),
(4332, 'San José Miahuatlán', '129', 21),
(4333, 'Platón Sánchez', '129', 30),
(4334, 'San Dionisio del Mar', '130', 20),
(4335, 'San Juan Atenco', '130', 21),
(4336, 'Playa Vicente', '130', 30),
(4337, 'San Dionisio Ocotepec', '131', 20),
(4338, 'San Juan Atzompa', '131', 21),
(4339, 'Poza Rica de Hidalgo', '131', 30),
(4340, 'San Dionisio Ocotlán', '132', 20),
(4341, 'San Martín Texmelucan', '132', 21),
(4342, 'Las Vigas de Ramírez', '132', 30),
(4343, 'San Esteban Atatlahuca', '133', 20),
(4344, 'San Martín Totoltepec', '133', 21),
(4345, 'Pueblo Viejo', '133', 30),
(4346, 'San Felipe Jalapa de Díaz', '134', 20),
(4347, 'San Matías Tlalancaleca', '134', 21),
(4348, 'Puente Nacional', '134', 30),
(4349, 'San Felipe Tejalápam', '135', 20),
(4350, 'San Miguel Ixitlán', '135', 21),
(4351, 'Rafael Delgado', '135', 30),
(4352, 'San Felipe Usila', '136', 20),
(4353, 'San Miguel Xoxtla', '136', 21),
(4354, 'Rafael Lucio', '136', 30),
(4355, 'San Francisco Cahuacuá', '137', 20),
(4356, 'San Nicolás Buenos Aires', '137', 21),
(4357, 'Los Reyes', '137', 30),
(4358, 'San Francisco Cajonos', '138', 20),
(4359, 'San Nicolás de los Ranchos', '138', 21),
(4360, 'Río Blanco', '138', 30),
(4361, 'San Francisco Chapulapa', '139', 20),
(4362, 'San Pablo Anicano', '139', 21),
(4363, 'Saltabarranca', '139', 30),
(4364, 'San Francisco Chindúa', '140', 20),
(4365, 'San Pedro Cholula', '140', 21),
(4366, 'San Andrés Tenejapan', '140', 30),
(4367, 'San Francisco del Mar', '141', 20),
(4368, 'San Pedro Yeloixtlahuaca', '141', 21),
(4369, 'San Andrés Tuxtla', '141', 30),
(4370, 'San Francisco Huehuetlán', '142', 20),
(4371, 'San Salvador el Seco', '142', 21),
(4372, 'San Juan Evangelista', '142', 30),
(4373, 'San Francisco Ixhuatán', '143', 20),
(4374, 'San Salvador el Verde', '143', 21),
(4375, 'Santiago Tuxtla', '143', 30),
(4376, 'San Francisco Jaltepetongo', '144', 20),
(4377, 'San Salvador Huixcolotla', '144', 21),
(4378, 'Sayula de Alemán', '144', 30),
(4379, 'San Francisco Lachigoló', '145', 20),
(4380, 'San Sebastián Tlacotepec', '145', 21),
(4381, 'Soconusco', '145', 30),
(4382, 'San Francisco Logueche', '146', 20),
(4383, 'Santa Catarina Tlaltempan', '146', 21),
(4384, 'Sochiapa', '146', 30),
(4385, 'San Francisco Nuxaño', '147', 20),
(4386, 'Santa Inés Ahuatempan', '147', 21),
(4387, 'Soledad Atzompa', '147', 30),
(4388, 'San Francisco Ozolotepec', '148', 20),
(4389, 'Santa Isabel Cholula', '148', 21),
(4390, 'Soledad de Doblado', '148', 30),
(4391, 'San Francisco Sola', '149', 20),
(4392, 'Santiago Miahuatlán', '149', 21),
(4393, 'Soteapan', '149', 30),
(4394, 'San Francisco Telixtlahuaca', '150', 20),
(4395, 'Huehuetlán el Grande', '150', 21),
(4396, 'Tamalín', '150', 30),
(4397, 'San Francisco Teopan', '151', 20),
(4398, 'Santo Tomás Hueyotlipan', '151', 21),
(4399, 'Tamiahua', '151', 30),
(4400, 'San Francisco Tlapancingo', '152', 20),
(4401, 'Soltepec', '152', 21),
(4402, 'Tampico Alto', '152', 30),
(4403, 'San Gabriel Mixtepec', '153', 20),
(4404, 'Tecali de Herrera', '153', 21),
(4405, 'Tancoco', '153', 30),
(4406, 'San Ildefonso Amatlán', '154', 20),
(4407, 'Tecamachalco', '154', 21),
(4408, 'Tantima', '154', 30),
(4409, 'San Ildefonso Sola', '155', 20),
(4410, 'Tecomatlán', '155', 21),
(4411, 'Tantoyuca', '155', 30),
(4412, 'San Ildefonso Villa Alta', '156', 20),
(4413, 'Tehuacán', '156', 21),
(4414, 'Tatatila', '156', 30),
(4415, 'San Jacinto Amilpas', '157', 20),
(4416, 'Tehuitzingo', '157', 21),
(4417, 'Castillo de Teayo', '157', 30),
(4418, 'San Jacinto Tlacotepec', '158', 20),
(4419, 'Tenampulco', '158', 21),
(4420, 'Tecolutla', '158', 30),
(4421, 'San Jerónimo Coatlán', '159', 20),
(4422, 'Teopantlán', '159', 21),
(4423, 'Tehuipango', '159', 30),
(4424, 'San Jerónimo Silacayoapilla', '160', 20),
(4425, 'Teotlalco', '160', 21),
(4426, 'Álamo Temapache', '160', 30),
(4427, 'San Jerónimo Sosola', '161', 20),
(4428, 'Tepanco de López', '161', 21),
(4429, 'Tempoal', '161', 30),
(4430, 'San Jerónimo Taviche', '162', 20),
(4431, 'Tepango de Rodríguez', '162', 21),
(4432, 'Tenampa', '162', 30),
(4433, 'San Jerónimo Tecóatl', '163', 20),
(4434, 'Tepatlaxco de Hidalgo', '163', 21),
(4435, 'Tenochtitlán', '163', 30),
(4436, 'San Jorge Nuchita', '164', 20),
(4437, 'Tepeaca', '164', 21),
(4438, 'Teocelo', '164', 30),
(4439, 'San José Ayuquila', '165', 20),
(4440, 'Tepemaxalco', '165', 21),
(4441, 'Tepatlaxco', '165', 30),
(4442, 'San José Chiltepec', '166', 20),
(4443, 'Tepeojuma', '166', 21),
(4444, 'Tepetlán', '166', 30),
(4445, 'San José del Peñasco', '167', 20),
(4446, 'Tepetzintla', '167', 21),
(4447, 'Tepetzintla', '167', 30),
(4448, 'San José Estancia Grande', '168', 20),
(4449, 'Tepexco', '168', 21),
(4450, 'Tequila', '168', 30),
(4451, 'San José Independencia', '169', 20),
(4452, 'Tepexi de Rodríguez', '169', 21),
(4453, 'José Azueta', '169', 30),
(4454, 'San José Lachiguiri', '170', 20),
(4455, 'Tepeyahualco', '170', 21),
(4456, 'Texcatepec', '170', 30),
(4457, 'San José Tenango', '171', 20),
(4458, 'Tepeyahualco de Cuauhtémoc', '171', 21),
(4459, 'Texhuacán', '171', 30),
(4460, 'San Juan Achiutla', '172', 20),
(4461, 'Tetela de Ocampo', '172', 21),
(4462, 'Texistepec', '172', 30),
(4463, 'San Juan Atepec', '173', 20),
(4464, 'Teteles de Avila Castillo', '173', 21),
(4465, 'Tezonapa', '173', 30),
(4466, 'Ánimas Trujano', '174', 20),
(4467, 'Teziutlán', '174', 21),
(4468, 'Tierra Blanca', '174', 30),
(4469, 'San Juan Bautista Atatlahuca', '175', 20),
(4470, 'Tianguismanalco', '175', 21),
(4471, 'Tihuatlán', '175', 30),
(4472, 'San Juan Bautista Coixtlahuaca', '176', 20),
(4473, 'Tilapa', '176', 21),
(4474, 'Tlacojalpan', '176', 30),
(4475, 'San Juan Bautista Cuicatlán', '177', 20),
(4476, 'Tlacotepec de Benito Juárez', '177', 21),
(4477, 'Tlacolulan', '177', 30),
(4478, 'San Juan Bautista Guelache', '178', 20),
(4479, 'Tlacuilotepec', '178', 21),
(4480, 'Tlacotalpan', '178', 30),
(4481, 'San Juan Bautista Jayacatlán', '179', 20),
(4482, 'Tlachichuca', '179', 21),
(4483, 'Tlacotepec de Mejía', '179', 30),
(4484, 'San Juan Bautista Lo de Soto', '180', 20),
(4485, 'Tlahuapan', '180', 21),
(4486, 'Tlachichilco', '180', 30),
(4487, 'San Juan Bautista Suchitepec', '181', 20),
(4488, 'Tlaltenango', '181', 21),
(4489, 'Tlalixcoyan', '181', 30),
(4490, 'San Juan Bautista Tlacoatzintepec', '182', 20),
(4491, 'Tlanepantla', '182', 21),
(4492, 'Tlalnelhuayocan', '182', 30),
(4493, 'San Juan Bautista Tlachichilco', '183', 20),
(4494, 'Tlaola', '183', 21),
(4495, 'Tlapacoyan', '183', 30),
(4496, 'San Juan Bautista Tuxtepec', '184', 20),
(4497, 'Tlapacoya', '184', 21),
(4498, 'Tlaquilpa', '184', 30),
(4499, 'San Juan Cacahuatepec', '185', 20),
(4500, 'Tlapanalá', '185', 21),
(4501, 'Tlilapan', '185', 30),
(4502, 'San Juan Cieneguilla', '186', 20),
(4503, 'Tlatlauquitepec', '186', 21),
(4504, 'Tomatlán', '186', 30),
(4505, 'San Juan Coatzóspam', '187', 20),
(4506, 'Tlaxco', '187', 21),
(4507, 'Tonayán', '187', 30),
(4508, 'San Juan Colorado', '188', 20),
(4509, 'Tochimilco', '188', 21),
(4510, 'Totutla', '188', 30),
(4511, 'San Juan Comaltepec', '189', 20),
(4512, 'Tochtepec', '189', 21),
(4513, 'Tuxpan', '189', 30),
(4514, 'San Juan Cotzocón', '190', 20),
(4515, 'Totoltepec de Guerrero', '190', 21),
(4516, 'Tuxtilla', '190', 30),
(4517, 'San Juan Chicomezúchil', '191', 20),
(4518, 'Tulcingo', '191', 21),
(4519, 'Ursulo Galván', '191', 30),
(4520, 'San Juan Chilateca', '192', 20),
(4521, 'Tuzamapan de Galeana', '192', 21),
(4522, 'Vega de Alatorre', '192', 30),
(4523, 'San Juan del Estado', '193', 20),
(4524, 'Tzicatlacoyan', '193', 21),
(4525, 'Veracruz', '193', 30),
(4526, 'San Juan del Río', '194', 20),
(4527, 'Venustiano Carranza', '194', 21),
(4528, 'Villa Aldama', '194', 30),
(4529, 'San Juan Diuxi', '195', 20),
(4530, 'Vicente Guerrero', '195', 21),
(4531, 'Xoxocotla', '195', 30),
(4532, 'San Juan Evangelista Analco', '196', 20),
(4533, 'Xayacatlán de Bravo', '196', 21),
(4534, 'Yanga', '196', 30),
(4535, 'San Juan Guelavía', '197', 20),
(4536, 'Xicotepec', '197', 21),
(4537, 'Yecuatla', '197', 30),
(4538, 'San Juan Guichicovi', '198', 20),
(4539, 'Xicotlán', '198', 21),
(4540, 'Zacualpan', '198', 30),
(4541, 'San Juan Ihualtepec', '199', 20),
(4542, 'Xiutetelco', '199', 21),
(4543, 'Zaragoza', '199', 30),
(4544, 'San Juan Juquila Mixes', '200', 20),
(4545, 'Xochiapulco', '200', 21),
(4546, 'Zentla', '200', 30),
(4547, 'San Juan Juquila Vijanos', '201', 20),
(4548, 'Xochiltepec', '201', 21),
(4549, 'Zongolica', '201', 30),
(4550, 'San Juan Lachao', '202', 20),
(4551, 'Xochitlán de Vicente Suárez', '202', 21),
(4552, 'Zontecomatlán de López y Fuentes', '202', 30),
(4553, 'San Juan Lachigalla', '203', 20),
(4554, 'Xochitlán Todos Santos', '203', 21),
(4555, 'Zozocolco de Hidalgo', '203', 30),
(4556, 'San Juan Lajarcia', '204', 20),
(4557, 'Yaonáhuac', '204', 21),
(4558, 'Agua Dulce', '204', 30),
(4559, 'San Juan Lalana', '205', 20),
(4560, 'Yehualtepec', '205', 21),
(4561, 'El Higo', '205', 30),
(4562, 'San Juan de los Cués', '206', 20),
(4563, 'Zacapala', '206', 21),
(4564, 'Nanchital de Lázaro Cárdenas del Río', '206', 30),
(4565, 'San Juan Mazatlán', '207', 20),
(4566, 'Zacapoaxtla', '207', 21),
(4567, 'Tres Valles', '207', 30),
(4568, 'San Juan Mixtepec -Dto. 08 -', '208', 20),
(4569, 'Zacatlán', '208', 21),
(4570, 'Carlos A. Carrillo', '208', 30),
(4571, 'San Juan Mixtepec -Dto. 26 -', '209', 20),
(4572, 'Zapotitlán', '209', 21),
(4573, 'Tatahuicapan de Juárez', '209', 30),
(4574, 'San Juan Ñumí', '210', 20),
(4575, 'Zapotitlán de Méndez', '210', 21),
(4576, 'Uxpanapa', '210', 30),
(4577, 'San Juan Ozolotepec', '211', 20),
(4578, 'Zaragoza', '211', 21),
(4579, 'San Rafael', '211', 30),
(4580, 'San Juan Petlapa', '212', 20),
(4581, 'Zautla', '212', 21),
(4582, 'Santiago Sochiapan', '212', 30),
(4583, 'San Juan Quiahije', '213', 20),
(4584, 'Zihuateutla', '213', 21),
(4585, 'San Juan Quiotepec', '214', 20),
(4586, 'Zinacatepec', '214', 21),
(4587, 'San Juan Sayultepec', '215', 20),
(4588, 'Zongozotla', '215', 21),
(4589, 'San Juan Tabaá', '216', 20),
(4590, 'Zoquiapan', '216', 21),
(4591, 'San Juan Tamazola', '217', 20),
(4592, 'Zoquitlán', '217', 21),
(4593, 'San Juan Teita', '218', 20),
(4594, 'San Juan Teitipac', '219', 20),
(4595, 'San Juan Tepeuxila', '220', 20),
(4596, 'San Juan Teposcolula', '221', 20),
(4597, 'San Juan Yaeé', '222', 20),
(4598, 'San Juan Yatzona', '223', 20),
(4599, 'San Juan Yucuita', '224', 20),
(4600, 'San Lorenzo', '225', 20),
(4601, 'San Lorenzo Albarradas', '226', 20),
(4602, 'San Lorenzo Cacaotepec', '227', 20),
(4603, 'San Lorenzo Cuaunecuiltitla', '228', 20),
(4604, 'San Lorenzo Texmelúcan', '229', 20),
(4605, 'San Lorenzo Victoria', '230', 20),
(4606, 'San Lucas Camotlán', '231', 20),
(4607, 'San Lucas Ojitlán', '232', 20),
(4608, 'San Lucas Quiaviní', '233', 20),
(4609, 'San Lucas Zoquiápam', '234', 20),
(4610, 'San Luis Amatlán', '235', 20),
(4611, 'San Marcial Ozolotepec', '236', 20),
(4612, 'San Marcos Arteaga', '237', 20),
(4613, 'San Martín de los Cansecos', '238', 20),
(4614, 'San Martín Huamelúlpam', '239', 20),
(4615, 'San Martín Itunyoso', '240', 20),
(4616, 'San Martín Lachilá', '241', 20),
(4617, 'San Martín Peras', '242', 20),
(4618, 'San Martín Tilcajete', '243', 20),
(4619, 'San Martín Toxpalan', '244', 20),
(4620, 'San Martín Zacatepec', '245', 20),
(4621, 'San Mateo Cajonos', '246', 20),
(4622, 'Capulálpam de Méndez', '247', 20),
(4623, 'San Mateo del Mar', '248', 20),
(4624, 'San Mateo Yoloxochitlán', '249', 20),
(4625, 'San Mateo Etlatongo', '250', 20),
(4626, 'San Mateo Nejápam', '251', 20),
(4627, 'San Mateo Peñasco', '252', 20),
(4628, 'San Mateo Piñas', '253', 20),
(4629, 'San Mateo Río Hondo', '254', 20),
(4630, 'San Mateo Sindihui', '255', 20),
(4631, 'San Mateo Tlapiltepec', '256', 20),
(4632, 'San Melchor Betaza', '257', 20),
(4633, 'San Miguel Achiutla', '258', 20),
(4634, 'San Miguel Ahuehuetitlán', '259', 20),
(4635, 'San Miguel Aloápam', '260', 20),
(4636, 'San Miguel Amatitlán', '261', 20),
(4637, 'San Miguel Amatlán', '262', 20),
(4638, 'San Miguel Coatlán', '263', 20),
(4639, 'San Miguel Chicahua', '264', 20),
(4640, 'San Miguel Chimalapa', '265', 20),
(4641, 'San Miguel del Puerto', '266', 20),
(4642, 'San Miguel del Río', '267', 20),
(4643, 'San Miguel Ejutla', '268', 20),
(4644, 'San Miguel el Grande', '269', 20),
(4645, 'San Miguel Huautla', '270', 20),
(4646, 'San Miguel Mixtepec', '271', 20),
(4647, 'San Miguel Panixtlahuaca', '272', 20),
(4648, 'San Miguel Peras', '273', 20),
(4649, 'San Miguel Piedras', '274', 20),
(4650, 'San Miguel Quetzaltepec', '275', 20),
(4651, 'San Miguel Santa Flor', '276', 20),
(4652, 'Villa Sola de Vega', '277', 20),
(4653, 'San Miguel Soyaltepec', '278', 20),
(4654, 'San Miguel Suchixtepec', '279', 20),
(4655, 'Villa Talea de Castro', '280', 20),
(4656, 'San Miguel Tecomatlán', '281', 20),
(4657, 'San Miguel Tenango', '282', 20),
(4658, 'San Miguel Tequixtepec', '283', 20),
(4659, 'San Miguel Tilquiápam', '284', 20),
(4660, 'San Miguel Tlacamama', '285', 20),
(4661, 'San Miguel Tlacotepec', '286', 20),
(4662, 'San Miguel Tulancingo', '287', 20),
(4663, 'San Miguel Yotao', '288', 20),
(4664, 'San Nicolás', '289', 20),
(4665, 'San Nicolás Hidalgo', '290', 20),
(4666, 'San Pablo Coatlán', '291', 20),
(4667, 'San Pablo Cuatro Venados', '292', 20),
(4668, 'San Pablo Etla', '293', 20),
(4669, 'San Pablo Huitzo', '294', 20),
(4670, 'San Pablo Huixtepec', '295', 20),
(4671, 'San Pablo Macuiltianguis', '296', 20),
(4672, 'San Pablo Tijaltepec', '297', 20),
(4673, 'San Pablo Villa de Mitla', '298', 20),
(4674, 'San Pablo Yaganiza', '299', 20),
(4675, 'San Pedro Amuzgos', '300', 20),
(4676, 'San Pedro Apóstol', '301', 20),
(4677, 'San Pedro Atoyac', '302', 20),
(4678, 'San Pedro Cajonos', '303', 20),
(4679, 'San Pedro Coxcaltepec Cántaros', '304', 20),
(4680, 'San Pedro Comitancillo', '305', 20),
(4681, 'San Pedro el Alto', '306', 20),
(4682, 'San Pedro Huamelula', '307', 20),
(4683, 'San Pedro Huilotepec', '308', 20),
(4684, 'San Pedro Ixcatlán', '309', 20),
(4685, 'San Pedro Ixtlahuaca', '310', 20),
(4686, 'San Pedro Jaltepetongo', '311', 20),
(4687, 'San Pedro Jicayán', '312', 20),
(4688, 'San Pedro Jocotipac', '313', 20),
(4689, 'San Pedro Juchatengo', '314', 20),
(4690, 'San Pedro Mártir', '315', 20),
(4691, 'San Pedro Mártir Quiechapa', '316', 20),
(4692, 'San Pedro Mártir Yucuxaco', '317', 20),
(4693, 'San Pedro Mixtepec -Dto. 22 -', '318', 20),
(4694, 'San Pedro Mixtepec -Dto. 26 -', '319', 20),
(4695, 'San Pedro Molinos', '320', 20),
(4696, 'San Pedro Nopala', '321', 20),
(4697, 'San Pedro Ocopetatillo', '322', 20),
(4698, 'San Pedro Ocotepec', '323', 20),
(4699, 'San Pedro Pochutla', '324', 20),
(4700, 'San Pedro Quiatoni', '325', 20),
(4701, 'San Pedro Sochiápam', '326', 20),
(4702, 'San Pedro Tapanatepec', '327', 20),
(4703, 'San Pedro Taviche', '328', 20),
(4704, 'San Pedro Teozacoalco', '329', 20),
(4705, 'San Pedro Teutila', '330', 20),
(4706, 'San Pedro Tidaá', '331', 20),
(4707, 'San Pedro Topiltepec', '332', 20),
(4708, 'San Pedro Totolápam', '333', 20),
(4709, 'Villa de Tututepec de Melchor Ocampo', '334', 20),
(4710, 'San Pedro Yaneri', '335', 20),
(4711, 'San Pedro Yólox', '336', 20),
(4712, 'San Pedro y San Pablo Ayutla', '337', 20),
(4713, 'Villa de Etla', '338', 20),
(4714, 'San Pedro y San Pablo Teposcolula', '339', 20),
(4715, 'San Pedro y San Pablo Tequixtepec', '340', 20),
(4716, 'San Pedro Yucunama', '341', 20),
(4717, 'San Raymundo Jalpan', '342', 20),
(4718, 'San Sebastián Abasolo', '343', 20),
(4719, 'San Sebastián Coatlán', '344', 20),
(4720, 'San Sebastián Ixcapa', '345', 20),
(4721, 'San Sebastián Nicananduta', '346', 20),
(4722, 'San Sebastián Río Hondo', '347', 20),
(4723, 'San Sebastián Tecomaxtlahuaca', '348', 20),
(4724, 'San Sebastián Teitipac', '349', 20),
(4725, 'San Sebastián Tutla', '350', 20),
(4726, 'San Simón Almolongas', '351', 20),
(4727, 'San Simón Zahuatlán', '352', 20),
(4728, 'Santa Ana', '353', 20),
(4729, 'Santa Ana Ateixtlahuaca', '354', 20),
(4730, 'Santa Ana Cuauhtémoc', '355', 20),
(4731, 'Santa Ana del Valle', '356', 20),
(4732, 'Santa Ana Tavela', '357', 20),
(4733, 'Santa Ana Tlapacoyan', '358', 20),
(4734, 'Santa Ana Yareni', '359', 20),
(4735, 'Santa Ana Zegache', '360', 20),
(4736, 'Santa Catalina Quierí', '361', 20),
(4737, 'Santa Catarina Cuixtla', '362', 20),
(4738, 'Santa Catarina Ixtepeji', '363', 20),
(4739, 'Santa Catarina Juquila', '364', 20),
(4740, 'Santa Catarina Lachatao', '365', 20),
(4741, 'Santa Catarina Loxicha', '366', 20),
(4742, 'Santa Catarina Mechoacán', '367', 20),
(4743, 'Santa Catarina Minas', '368', 20),
(4744, 'Santa Catarina Quiané', '369', 20),
(4745, 'Santa Catarina Tayata', '370', 20),
(4746, 'Santa Catarina Ticuá', '371', 20),
(4747, 'Santa Catarina Yosonotú', '372', 20),
(4748, 'Santa Catarina Zapoquila', '373', 20),
(4749, 'Santa Cruz Acatepec', '374', 20),
(4750, 'Santa Cruz Amilpas', '375', 20),
(4751, 'Santa Cruz de Bravo', '376', 20),
(4752, 'Santa Cruz Itundujia', '377', 20),
(4753, 'Santa Cruz Mixtepec', '378', 20),
(4754, 'Santa Cruz Nundaco', '379', 20),
(4755, 'Santa Cruz Papalutla', '380', 20),
(4756, 'Santa Cruz Tacache de Mina', '381', 20),
(4757, 'Santa Cruz Tacahua', '382', 20),
(4758, 'Santa Cruz Tayata', '383', 20),
(4759, 'Santa Cruz Xitla', '384', 20),
(4760, 'Santa Cruz Xoxocotlán', '385', 20),
(4761, 'Santa Cruz Zenzontepec', '386', 20),
(4762, 'Santa Gertrudis', '387', 20),
(4763, 'Santa Inés del Monte', '388', 20),
(4764, 'Santa Inés Yatzeche', '389', 20),
(4765, 'Santa Lucía del Camino', '390', 20),
(4766, 'Santa Lucía Miahuatlán', '391', 20),
(4767, 'Santa Lucía Monteverde', '392', 20),
(4768, 'Santa Lucía Ocotlán', '393', 20),
(4769, 'Santa María Alotepec', '394', 20),
(4770, 'Santa María Apazco', '395', 20),
(4771, 'Santa María la Asunción', '396', 20),
(4772, 'Heroica Ciudad de Tlaxiaco', '397', 20),
(4773, 'Ayoquezco de Aldama', '398', 20),
(4774, 'Santa María Atzompa', '399', 20),
(4775, 'Santa María Camotlán', '400', 20),
(4776, 'Santa María Colotepec', '401', 20),
(4777, 'Santa María Cortijo', '402', 20),
(4778, 'Santa María Coyotepec', '403', 20),
(4779, 'Santa María Chachoápam', '404', 20),
(4780, 'Villa de Chilapa de Díaz', '405', 20),
(4781, 'Santa María Chilchotla', '406', 20),
(4782, 'Santa María Chimalapa', '407', 20),
(4783, 'Santa María del Rosario', '408', 20),
(4784, 'Santa María del Tule', '409', 20),
(4785, 'Santa María Ecatepec', '410', 20),
(4786, 'Santa María Guelacé', '411', 20),
(4787, 'Santa María Guienagati', '412', 20),
(4788, 'Santa María Huatulco', '413', 20),
(4789, 'Santa María Huazolotitlán', '414', 20),
(4790, 'Santa María Ipalapa', '415', 20),
(4791, 'Santa María Ixcatlán', '416', 20),
(4792, 'Santa María Jacatepec', '417', 20),
(4793, 'Santa María Jalapa del Marqués', '418', 20),
(4794, 'Santa María Jaltianguis', '419', 20),
(4795, 'Santa María Lachixío', '420', 20),
(4796, 'Santa María Mixtequilla', '421', 20),
(4797, 'Santa María Nativitas', '422', 20),
(4798, 'Santa María Nduayaco', '423', 20),
(4799, 'Santa María Ozolotepec', '424', 20),
(4800, 'Santa María Pápalo', '425', 20),
(4801, 'Santa María Peñoles', '426', 20),
(4802, 'Santa María Petapa', '427', 20),
(4803, 'Santa María Quiegolani', '428', 20),
(4804, 'Santa María Sola', '429', 20),
(4805, 'Santa María Tataltepec', '430', 20),
(4806, 'Santa María Tecomavaca', '431', 20),
(4807, 'Santa María Temaxcalapa', '432', 20),
(4808, 'Santa María Temaxcaltepec', '433', 20),
(4809, 'Santa María Teopoxco', '434', 20),
(4810, 'Santa María Tepantlali', '435', 20),
(4811, 'Santa María Texcatitlán', '436', 20),
(4812, 'Santa María Tlahuitoltepec', '437', 20),
(4813, 'Santa María Tlalixtac', '438', 20),
(4814, 'Santa María Tonameca', '439', 20),
(4815, 'Santa María Totolapilla', '440', 20),
(4816, 'Santa María Xadani', '441', 20),
(4817, 'Santa María Yalina', '442', 20),
(4818, 'Santa María Yavesía', '443', 20),
(4819, 'Santa María Yolotepec', '444', 20),
(4820, 'Santa María Yosoyúa', '445', 20),
(4821, 'Santa María Yucuhiti', '446', 20),
(4822, 'Santa María Zacatepec', '447', 20),
(4823, 'Santa María Zaniza', '448', 20),
(4824, 'Santa María Zoquitlán', '449', 20),
(4825, 'Santiago Amoltepec', '450', 20),
(4826, 'Santiago Apoala', '451', 20),
(4827, 'Santiago Apóstol', '452', 20),
(4828, 'Santiago Astata', '453', 20),
(4829, 'Santiago Atitlán', '454', 20),
(4830, 'Santiago Ayuquililla', '455', 20),
(4831, 'Santiago Cacaloxtepec', '456', 20),
(4832, 'Santiago Camotlán', '457', 20),
(4833, 'Santiago Comaltepec', '458', 20),
(4834, 'Santiago Chazumba', '459', 20),
(4835, 'Santiago Choápam', '460', 20),
(4836, 'Santiago del Río', '461', 20),
(4837, 'Santiago Huajolotitlán', '462', 20),
(4838, 'Santiago Huauclilla', '463', 20),
(4839, 'Santiago Ihuitlán Plumas', '464', 20),
(4840, 'Santiago Ixcuintepec', '465', 20),
(4841, 'Santiago Ixtayutla', '466', 20),
(4842, 'Santiago Jamiltepec', '467', 20),
(4843, 'Santiago Jocotepec', '468', 20),
(4844, 'Santiago Juxtlahuaca', '469', 20),
(4845, 'Santiago Lachiguiri', '470', 20),
(4846, 'Santiago Lalopa', '471', 20),
(4847, 'Santiago Laollaga', '472', 20),
(4848, 'Santiago Laxopa', '473', 20),
(4849, 'Santiago Llano Grande', '474', 20),
(4850, 'Santiago Matatlán', '475', 20),
(4851, 'Santiago Miltepec', '476', 20),
(4852, 'Santiago Minas', '477', 20),
(4853, 'Santiago Nacaltepec', '478', 20),
(4854, 'Santiago Nejapilla', '479', 20),
(4855, 'Santiago Nundiche', '480', 20),
(4856, 'Santiago Nuyoó', '481', 20),
(4857, 'Santiago Pinotepa Nacional', '482', 20),
(4858, 'Santiago Suchilquitongo', '483', 20),
(4859, 'Santiago Tamazola', '484', 20),
(4860, 'Santiago Tapextla', '485', 20),
(4861, 'Villa Tejúpam de la Unión', '486', 20),
(4862, 'Santiago Tenango', '487', 20),
(4863, 'Santiago Tepetlapa', '488', 20),
(4864, 'Santiago Tetepec', '489', 20),
(4865, 'Santiago Texcalcingo', '490', 20),
(4866, 'Santiago Textitlán', '491', 20),
(4867, 'Santiago Tilantongo', '492', 20),
(4868, 'Santiago Tillo', '493', 20),
(4869, 'Santiago Tlazoyaltepec', '494', 20),
(4870, 'Santiago Xanica', '495', 20),
(4871, 'Santiago Xiacuí', '496', 20),
(4872, 'Santiago Yaitepec', '497', 20),
(4873, 'Santiago Yaveo', '498', 20),
(4874, 'Santiago Yolomécatl', '499', 20),
(4875, 'Santiago Yosondúa', '500', 20),
(4876, 'Santiago Yucuyachi', '501', 20),
(4877, 'Santiago Zacatepec', '502', 20),
(4878, 'Santiago Zoochila', '503', 20),
(4879, 'Nuevo Zoquiápam', '504', 20),
(4880, 'Santo Domingo Ingenio', '505', 20),
(4881, 'Santo Domingo Albarradas', '506', 20),
(4882, 'Santo Domingo Armenta', '507', 20),
(4883, 'Santo Domingo Chihuitán', '508', 20),
(4884, 'Santo Domingo de Morelos', '509', 20),
(4885, 'Santo Domingo Ixcatlán', '510', 20),
(4886, 'Santo Domingo Nuxaá', '511', 20),
(4887, 'Santo Domingo Ozolotepec', '512', 20),
(4888, 'Santo Domingo Petapa', '513', 20),
(4889, 'Santo Domingo Roayaga', '514', 20),
(4890, 'Santo Domingo Tehuantepec', '515', 20),
(4891, 'Santo Domingo Teojomulco', '516', 20),
(4892, 'Santo Domingo Tepuxtepec', '517', 20),
(4893, 'Santo Domingo Tlatayápam', '518', 20),
(4894, 'Santo Domingo Tomaltepec', '519', 20),
(4895, 'Santo Domingo Tonalá', '520', 20),
(4896, 'Santo Domingo Tonaltepec', '521', 20),
(4897, 'Santo Domingo Xagacía', '522', 20),
(4898, 'Santo Domingo Yanhuitlán', '523', 20),
(4899, 'Santo Domingo Yodohino', '524', 20),
(4900, 'Santo Domingo Zanatepec', '525', 20),
(4901, 'Santos Reyes Nopala', '526', 20),
(4902, 'Santos Reyes Pápalo', '527', 20),
(4903, 'Santos Reyes Tepejillo', '528', 20),
(4904, 'Santos Reyes Yucuná', '529', 20),
(4905, 'Santo Tomás Jalieza', '530', 20),
(4906, 'Santo Tomás Mazaltepec', '531', 20),
(4907, 'Santo Tomás Ocotepec', '532', 20),
(4908, 'Santo Tomás Tamazulapan', '533', 20),
(4909, 'San Vicente Coatlán', '534', 20),
(4910, 'San Vicente Lachixío', '535', 20),
(4911, 'San Vicente Nuñú', '536', 20),
(4912, 'Silacayoápam', '537', 20),
(4913, 'Sitio de Xitlapehua', '538', 20),
(4914, 'Soledad Etla', '539', 20),
(4915, 'Villa de Tamazulápam del Progreso', '540', 20),
(4916, 'Tanetze de Zaragoza', '541', 20),
(4917, 'Taniche', '542', 20),
(4918, 'Tataltepec de Valdés', '543', 20),
(4919, 'Teococuilco de Marcos Pérez', '544', 20),
(4920, 'Teotitlán de Flores Magón', '545', 20),
(4921, 'Teotitlán del Valle', '546', 20),
(4922, 'Teotongo', '547', 20),
(4923, 'Tepelmeme Villa de Morelos', '548', 20),
(4924, 'Tezoatlán de Segura y Luna', '549', 20),
(4925, 'San Jerónimo Tlacochahuaya', '550', 20),
(4926, 'Tlacolula de Matamoros', '551', 20),
(4927, 'Tlacotepec Plumas', '552', 20),
(4928, 'Tlalixtac de Cabrera', '553', 20),
(4929, 'Totontepec Villa de Morelos', '554', 20),
(4930, 'Trinidad Zaachila', '555', 20),
(4931, 'La Trinidad Vista Hermosa', '556', 20),
(4932, 'Unión Hidalgo', '557', 20),
(4933, 'Valerio Trujano', '558', 20),
(4934, 'San Juan Bautista Valle Nacional', '559', 20),
(4935, 'Villa Díaz Ordaz', '560', 20),
(4936, 'Yaxe', '561', 20),
(4937, 'Magdalena Yodocono de Porfirio Díaz', '562', 20),
(4938, 'Yogana', '563', 20),
(4939, 'Yutanduchi de Guerrero', '564', 20),
(4940, 'Villa de Zaachila', '565', 20),
(4941, 'San Mateo Yucutindoo', '566', 20),
(4942, 'Zapotitlán Lagunas', '567', 20),
(4943, 'Zapotitlán Palmas', '568', 20),
(4944, 'Santa Inés de Zaragoza', '569', 20),
(4945, 'Zimatlán de Álvarez', '570', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_ubicacion_paises`
--

CREATE TABLE IF NOT EXISTS `system_ubicacion_paises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `bandera` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `system_ubicacion_paises`
--

INSERT INTO `system_ubicacion_paises` (`id`, `nombre`, `bandera`) VALUES
(1, 'México', 'http://png.findicons.com/files/icons/282/flags/32/mexico.png'),
(2, 'USA', 'http://png.findicons.com/files/icons/282/flags/32/united_states_of_america_usa.png');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `system_users`
--

INSERT INTO `system_users` (`id`, `nick`, `pass`, `email`, `rol`, `fbid`, `name`, `picture`, `originalName`) VALUES
(1, 'zesar1', 0x5ca0aec0f3fd23fc70e7c926b1bb53e8, 'cbibriesca@hotmail.com', 2, 0, 'Zesar X', 'pic_1.jpg', 'retro_blue_background.jpg'),
(2, '', 0x5ca0aec0f3fd23fc70e7c926b1bb53e8, '', 0, 0, '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_usuarios`
--

CREATE TABLE IF NOT EXISTS `system_usuarios` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=107 ;

--
-- Volcado de datos para la tabla `system_usuarios`
--

INSERT INTO `system_usuarios` (`id`, `username`, `pass`, `email`, `nombre`, `ultima_conexion`, `creado`, `fk_rol`, `ip`) VALUES
(16, 'admin', '098f6bcd4621d373cade4e832627b4f6', 'email@webmaster.com', 'Administrador del sistema', '2013-12-13 17:43:45', '0000-00-00 00:00:00', 1, ''),
(102, 'demo', '098f6bcd4621d373cade4e832627b4f6', 'demo', 'Usuario Demo', '2013-12-21 11:56:11', '0000-00-00 00:00:00', 2, ''),
(103, NULL, '098f6bcd4621d373cade4e832627b4f6', NULL, NULL, NULL, NULL, NULL, ''),
(104, NULL, NULL, NULL, NULL, '2013-12-19 17:34:19', NULL, NULL, ''),
(105, NULL, NULL, NULL, NULL, '2013-12-19 17:34:28', NULL, NULL, ''),
(106, NULL, NULL, NULL, NULL, '2013-12-19 17:34:51', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportes_concepto_documento`
--

CREATE TABLE IF NOT EXISTS `transportes_concepto_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(18,6) DEFAULT NULL,
  `concepto` char(100) DEFAULT NULL,
  `um` char(100) DEFAULT NULL,
  `precio_u` decimal(18,6) DEFAULT NULL,
  `importe` decimal(18,6) DEFAULT NULL,
  `fk_documento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `transportes_concepto_documento`
--

INSERT INTO `transportes_concepto_documento` (`id`, `cantidad`, `concepto`, `um`, `precio_u`, `importe`, `fk_documento`) VALUES
(1, '1.000000', 'una cosa', 'UM', '0.000000', '0.000000', 1),
(2, '3.000000', 'otra cosa', 'pza', '5.000000', '5.000000', 1),
(3, '0.000000', '', '', '0.000000', '0.000000', 2),
(4, '0.000000', '', '', '0.000000', '0.000000', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportes_documento`
--

CREATE TABLE IF NOT EXISTS `transportes_documento` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `transportes_documento`
--

INSERT INTO `transportes_documento` (`fecha_creacion`, `fk_tipo_de_documento`, `fk_serie`, `folio`, `id`, `fk_transportador`, `fk_remitente`, `fk_destinatario`, `fecha_entregar`, `origen`, `destino`, `fecha_vencimiento`, `fecha_cargar`, `fecha_cargado`, `medio_de_transporte`, `datos_del_vehiculo`, `datos_del_chofer`) VALUES
('0000-00-00 00:00:00', 1, 2, '1', 1, 3, '2', 1, '0000-00-00 00:00:00', '																																																		', '																																																		', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'd', 'asdf', 'a'),
('0000-00-00 00:00:00', 1, 2, '1', 2, 1, '1', 1, '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', ''),
('0000-00-00 00:00:00', 1, 2, '', 3, 1, '1', 1, '0000-00-00 00:00:00', '											', '											', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportes_serie`
--

CREATE TABLE IF NOT EXISTS `transportes_serie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `transportes_serie`
--

INSERT INTO `transportes_serie` (`id`, `nombre`) VALUES
(2, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportes_socio`
--

CREATE TABLE IF NOT EXISTS `transportes_socio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `domicilio` char(255) DEFAULT NULL,
  `email` char(255) DEFAULT NULL,
  `contacto` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `transportes_socio`
--

INSERT INTO `transportes_socio` (`id`, `nombre`, `domicilio`, `email`, `contacto`) VALUES
(1, 'Cesar', '', '', ''),
(2, 'Rancho Grande', '', '', ''),
(3, 'Transportes Demo', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportes_tipo_documento`
--

CREATE TABLE IF NOT EXISTS `transportes_tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `transportes_tipo_documento`
--

INSERT INTO `transportes_tipo_documento` (`id`, `nombre`) VALUES
(1, 'CARTA PORTE');

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
