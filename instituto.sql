-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-06-2022 a las 19:41:49
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `instituto_bigapple`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

DROP TABLE IF EXISTS `novedades`;
CREATE TABLE IF NOT EXISTS `novedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `subtitulo` text NOT NULL,
  `img_id` varchar(250) DEFAULT NULL,
  `cuerpo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `novedades`
--

INSERT INTO `novedades` (`id`, `titulo`, `subtitulo`, `img_id`, `cuerpo`) VALUES
(1, '30% de descuento en nuestros cursos de verano!', 'Accede a un 30% de descuento en cualquiera de nuestros cursos de verano.', 'qslwate8q9umguecqdon', 'Etiam sed placerat est. Maecenas fermentum porttitor arcu sit amet dapibus. In condimentum sem a justo finibus volutpat. Aenean facilisis ante id mi congue pulvinar. Donec pretium, nibh id scelerisque fringilla, leo ipsum tempus mauris, eu efficitur augue eros quis dui. Nunc ac libero venenatis, congue nulla at, lacinia justo. Quisque porta nunc nec velit lacinia, at congue mauris feugiat. '),
(21, 'Estamos buscando nuevos profes de inglés!', 'Queremos expandir nuestro equipo de profesionales', '', 'Donec quis ligula convallis nisi scelerisque aliquet vitae sed nunc. In eget enim sit amet elit tempor tincidunt eget nec quam. Nam commodo purus aliquam, lacinia libero sed, pellentesque lectus. Aenean lectus ante, tempus sed odio placerat, fermentum rhoncus enim. Donec cursus congue sodales. Praesent at tortor euismod, pellentesque felis a, blandit quam. Donec mollis vel nunc ut mollis. Donec semper nisl ipsum, et pretium mauris lobortis eget. Integer ut ligula sed purus laoreet dapibus. Ut gravida neque id massa laoreet vestibulum.'),
(2, 'Rendí el examen TOEFL con nosotros', '¿Querés estudiar en el extranjero y necesitas certificar tu nivel de inglés con el TOEFL? Rendílo en nuestro centro.', '', 'Tortor justo, ut aliquam augue hendrerit id. Sed ullamcorper tristique mattis. Ut id mauris a metus ultricies congue. Donec mi odio, tincidunt a nunc a, feugiat imperdiet diam. Sed consectetur mauris ipsum, at cursus leo consequat sed. Ut at diam malesuada, venenatis quam at, lacinia arcu. Aliquam lacinia scelerisque augue, vel gravida enim bibendum vel. Donec consequat vitae lorem vel laoreet. Nam diam est, scelerisque nec sem vitae, mollis pulvinar tortor. Nulla facilisi. Fusce nec neque a sem euismod sodales. Nunc nec congue turpis, vitae rhoncus nibh. Aliquam at aliquet enim. Sed scelerisque arcu at pulvinar ultricies. Pellentesque vel risus in diam commodo tristique id ut nunc. Suspendisse vel dapibus nisl.\r\n\r\nNullam tellus odio, venenatis vitae mattis lacinia, rhoncus eget sapien. Cras vehicula dictum scelerisque. Curabitur condimentum hendrerit posuere. Nullam non nunc accumsan, pulvinar augue dignissim, finibus nisl. Duis ut quam non neque fermentum aliquam sit amet ornare elit. Maecenas pulvinar leo vel elit molestie, et tempor lacus faucibus. Vestibulum commodo elit ut odio consequat porttitor. Suspendisse ullamcorper efficitur lacus. Donec semper eros sed interdum dapibus. Vestibulum ut leo elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed magna in est condimentum malesuada. Etiam vel eleifend ante, vitae luctus ligula.\r\n\r\n'),
(19, 'Viernes de mini lessons ', '40 minutos de ingles básico y divertido', 'i6hvmtlc0j7pexedxanj', 'Duis eget ligula nec nisi convallis mollis et at mi. Pellentesque convallis porta rutrum. Donec efficitur nisl felis, id ultrices erat euismod et. Pellentesque pharetra risus nec urna iaculis, ac sagittis sapien finibus. Sed porttitor cursus elementum. '),
(3, 'Poesía anglosajona y café', 'Si disfrutás de la poesía y una buena taza de café, vení a compartir este taller con nosotros.', 'f7kttxvsbgisoshleqnt', 'Nunc scelerisque leo sed nulla commodo, at ultrices ipsum malesuada. Donec posuere mauris sed mauris dignissim, a commodo magna sollicitudin. Etiam sed placerat est. Maecenas fermentum porttitor arcu sit amet dapibus. In condimentum sem a justo finibus volutpat. Aenean facilisis ante id mi congue pulvinar. Donec pretium, nibh id scelerisque fringilla, leo ipsum tempus mauris, eu efficitur augue eros quis dui. Nunc ac libero venenatis, congue nulla at, lacinia justo. Quisque porta nunc nec velit lacinia, at congue mauris feugiat. Suspendisse a facilisis tellus, non blandit leo. Quisque a finibus nisl, non ornare odio. Sed ac dolor id orci lacinia viverra a eget dui. Integer non consectetur justo. Morbi luctus feugiat odio, ut tincidunt nisi laoreet vel. Nunc mattis cursus egestas.'),
(10, 'Todas las clases presenciales del 23/07 suspendidas', 'Por temporal. Serán reprogramadas', 'cfz3iuizrsibbcnx8krp', 'lor sit amet, consectetur adipiscing elit. Duis varius blandit nibh id commodo. Nam suscipit nunc eu dolor suscipit vestibulum at id quam. Etiam maximus nulla et leo sodales, id tempor lorem efficitur. Donec porttitor erat mi, eu faucibus neque efficitur in. Quisque ultrices nisi vel augue lacinia placera'),
(7, 'Seguimos creciendo!', 'Ampliamos nuestras instalaciones para un mejor experiencia de aprendizaje', NULL, 'Vestibulum interdum nibh nec tempus tincidunt. Quisque eget lorem et est suscipit tempus. Duis vulputate magna velit, quis mattis purus scelerisque a. Sed tristique dolor at egestas laoreet. Etiam ac nisi justo. Proin in vestibulum arcu, at efficitur tortor. Vivamus volutpat dolor quis pellentesque porta. Aliquam eget hendrerit leo, ac tincidunt neque. Vestibulum leo diam, scelerisque nec suscipit eget, ullamcorper viverra libero. Suspendisse fringilla vehicula mauris, eu vestibulum mauris molestie vel. Praesent arcu nisi, volutpat quis volutpat in, blandit congue lorem. Curabitur id ultrices lorem. Sed non auctor justo, at pellentesque massa.'),
(16, 'Próximamente: Viajes de intercambio!', 'Nunc in aliquam odio. Cras at varius justo. ', 'jdb98eorwhpfazj8gvfq', 'In pretium enim sollicitudin, bibendum massa luctus, pretium quam. Nam scelerisque ex sed velit iaculis, sed semper dolor efficitur. Vivamus ligula velit, elementum eu malesuada quis, eleifend sit amet nibh. Vivamus auctor turpis in dui finibus, at sodales justo ullamcorper.  Vivamus auctor turpis in dui finibus, at sodales justo ullamcorper.  Vivamus auctor turpis in dui finibus, at sodales justo ullamcorper. Vivamus auctor turpis in dui finibus, at sodales justo ullamcorper.In pretium enim sollicitudin, bibendum massa luctus, pretium quam. Nam scelerisque ex sed velit iaculis, sed semper dolor efficitur. Vivamus ligula velit, elementum eu malesuada quis, eleifend sit amet nibh. Vivamus auctor turpis in dui finibus, at sodales justo ullamcorper.  Vivamus auctor turpis in dui finibus, at sodales justo ullamcorper.  Vivamus auctor turpis in dui finibus, at sodales justo ullamcorper. Vivamus auctor turpis in dui finibus, at sodales justo ullamcorper.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'Sara', '81dc9bdb52d04dc20036dbd8313ed055'),
(2, 'Juan', '81dc9bdb52d04dc20036dbd8313ed055');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
