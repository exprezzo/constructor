-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-12-2013 a las 22:32:42
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=198 ;

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
(136, '', '', 'tabla', '', 'YES', 'char(255)', 'Combo Box', '{"etiqueta":"Tabla","requerido":"0","oculto":"0","editable":"1","target":"52","campo_a_mostrar":"nombre"}', 50),
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
(166, '', '', 'elementos', '', '', '', 'tabla', '{"titulo":"Elementos","editable":"1","target":"53","llave_foranea":"fk_catalogo","config_tabla":"[{\\"id\\":\\"156\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"53\\"},{\\"id\\":\\"157\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"esDefault\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"EsDefault\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"53\\"},{\\"id\\":\\"158\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"extras\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Extras\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"53\\"},{\\"id\\":\\"159\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"campo\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Campo\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"53\\"},{\\"id\\":\\"160\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"llave\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Llave\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"53\\"},{\\"id\\":\\"161\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"esNulo\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"EsNulo\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"53\\"},{\\"id\\":\\"162\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"tipo\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Tipo\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"53\\"},{\\"id\\":\\"163\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"componente\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Componente\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"53\\"},{\\"id\\":\\"164\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"comp_config\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"text\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Comp_config\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"53\\"},{\\"id\\":\\"165\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_catalogo\\",\\"llave\\":\\"MUL\\",\\"esNulo\\":\\"YES\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_catalogo\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"53\\"}]"}', 50),
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
(183, '', 'auto_increment', 'id', 'PRI', 'NO', 'int(11)', 'Text Input', '{"etiqueta":"Id","requerido":"0","editable":"1","oculto":"0" }', 57),
(184, '', '', 'descripcion', '', 'NO', 'text', 'Text Input', '{"etiqueta":"Descripcion","requerido":"0","editable":"1","oculto":"0" }', 57),
(185, '', '', 'num_reporte', '', 'NO', 'char(255)', 'Text Input', '{"etiqueta":"Numero de Reporte","requerido":"0","oculto":"0","editable":"1"}', 57),
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
(196, '', '', 'eventos', '', '', '', 'Tabla', '{"titulo":"Eventos","editable":"1","target":"58","llave_foranea":"fk_reporte","config_tabla":"[{\\"id\\":\\"190\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"58\\"},{\\"id\\":\\"191\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fecha\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"datetime\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fecha\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"58\\"},{\\"id\\":\\"192\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"descripcion\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Descripcion\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"58\\"},{\\"id\\":\\"193\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_autor\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_autor\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"58\\"},{\\"id\\":\\"194\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"estado\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Estado\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"58\\"},{\\"id\\":\\"195\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_reporte\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_reporte\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"57\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"num_reporte\\\\\\"}\\",\\"fk_catalogo\\":\\"58\\"}]"}', 57),
(197, '', '', 'usuarios', '', '', '', 'Tabla', '{"titulo":"Usuarios","editable":"1","target":"55","llave_foranea":"fk_empresa","config_tabla":"[{\\"id\\":\\"170\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"auto_increment\\",\\"campo\\":\\"id\\",\\"llave\\":\\"PRI\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Id\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"171\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"nick\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Nick\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"172\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"nombre\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Nombre\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"173\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"email\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(255)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Email\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"174\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"pass\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"text\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Pass\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"175\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"ip_login\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"char(50)\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Ip_login\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"176\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"last_login\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"datetime\\",\\"componente\\":\\"Text Input\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Last_login\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\" }\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"177\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_rol\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"NO\\",\\"tipo\\":\\"int(11)\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Fk_rol\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"0\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"54\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"nombre\\\\\\"}\\",\\"fk_catalogo\\":\\"55\\"},{\\"id\\":\\"182\\",\\"esDefault\\":\\"\\",\\"extras\\":\\"\\",\\"campo\\":\\"fk_empresa\\",\\"llave\\":\\"\\",\\"esNulo\\":\\"\\",\\"tipo\\":\\"\\",\\"componente\\":\\"Combo Box\\",\\"comp_config\\":\\"{\\\\\\"etiqueta\\\\\\":\\\\\\"Empresa\\\\\\",\\\\\\"requerido\\\\\\":\\\\\\"1\\\\\\",\\\\\\"oculto\\\\\\":\\\\\\"0\\\\\\",\\\\\\"editable\\\\\\":\\\\\\"1\\\\\\",\\\\\\"target\\\\\\":\\\\\\"56\\\\\\",\\\\\\"campo_a_mostrar\\\\\\":\\\\\\"nombre\\\\\\"}\\",\\"fk_catalogo\\":\\"55\\"}]"}', 56);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `pendienthon_evento`
--

INSERT INTO `pendienthon_evento` (`id`, `fecha`, `descripcion`, `fk_autor`, `estado`, `fk_reporte`) VALUES
(1, '0000-00-00 00:00:00', 'wqasdf', 0, '', 1),
(2, '0000-00-00 00:00:00', 'sadf', 0, '', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `pendienthon_reporte`
--

INSERT INTO `pendienthon_reporte` (`id`, `descripcion`, `num_reporte`, `fk_autor`, `fk_solicitante`, `fk_empresa`, `status`) VALUES
(1, 'Las camaras no funcionan', '150', 3, 2, 2, 'A');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

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
(51, 3, 'Modulos', 'modulos', 'Modulo', 'system_modulos', 'id', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', 'Nuevo Modulo', '''Modulo:'' + getValorCampo(''nombre'')', 'Modulos', 'Modulo Creado', 'Modulo Actualizado', '¿Eliminar Modulo?', 'Modulo Eliminado', '¿Guardar cambios?', ''),
(52, 3, 'Tablas', 'tablas', 'tabla', 'constructor_elemento_catalogo', 'id', '', 'Nueva Tabla', '''Tabla: '' + getValorCampo(''nombre'')', 'Tablas', 'Tabla Creada', 'Tabla Actualizada', '¿Eliminar Tabla?', 'Tabla Eliminada', '¿Guardar los cambios en la tabla?', ''),
(53, 3, 'Elementos De Catalogo', 'elementos_de_catalogo', 'elemento_de_catalogo', 'constructor_elemento_catalogo', 'id', '', 'Nuevo Elemento', '''Elemento: '' + getValorCampo(''nombre'')', 'Elementos de Catalogo', 'Elemento Creado', 'Elemento Actualizado', '¿Eliminar Elemento?', 'Elemento eliminado', '¿Guardar los cambios en el elemento?', ''),
(54, 4, 'Roles', 'roles', 'rol', 'pentienthon_rol', 'id', '', 'Nuevo Rol', '''Rol: '' + getValorCampo(''nombre'')', 'Roles', 'Rol Creado', 'Rol Actualizado', '¿Eliminar Rol?', 'Rol Eliminado', '', ''),
(55, 4, 'Usuario Pendienthon', 'usuarios', 'usuario', 'pendienthon_usuarios', 'id', '', 'Nuevo Usuario', '''Usuario: '' + getValorCampo(''nombre'')', 'Usuarios', 'Usuario Creado', 'Usuario Actualizado', '¿Eliminar Usuario?', 'Usuario Eliminado', '¿Guardar Cambios en el Usuario?', ''),
(56, 4, 'Empresa', 'empresas', 'empresa', 'pendienthon_empresa', 'id', '', 'Nueva Empresa', '''Empresa: '' + getValorCampo(''nombre'')', 'Empresas', 'Empresa Creada', 'Empresa Actualizada', '¿Eliminar Empresa?', 'Empresa Eliminada', '¿Guardar Cambios en la Empresa?', ''),
(57, 4, 'Reporte', 'reportes', 'reporte', 'pendienthon_reporte', 'id', '', 'Nuevo Reporte', '''Reporte: '' + getValorCampo(''num_reporte'')', 'Reportes', 'Nuevo Reporte', 'Reporte Actualizado', '¿Eliminar Reporte?', 'Reporte Eliminado', '¿Guardar Cambios en el Reporte?', ''),
(58, 4, 'Evento', 'eventos', 'evento', 'pendienthon_evento', 'id', '', 'Nuevo Evento', '''Evento: '' + getValorCampo(''descripcion'')', 'Eventos', 'Evento Creado', 'Evento Actualizado', '¿Eliminar Evento ?', 'Evento Eliminado', '¿Guardar cambios en el Evento ?', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `system_modulos`
--

INSERT INTO `system_modulos` (`id`, `nombre`, `icono`, `nombre_interno`, `ruta_base`, `orden`) VALUES
(1, 'backend', 'http://png.findicons.com/files/icons/1681/siena/48/puzzle_yellow.png', 'backend', '/modulos/', 0),
(2, 'Portal', 'http://png-1.findicons.com/files/icons/2003/business/64/shopping_full.png', 'portal', '/', 0),
(3, 'Constructor', '', 'constructor', '/', 0),
(4, 'Pendienthon', '', 'pendienthon', '/', 0);

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
