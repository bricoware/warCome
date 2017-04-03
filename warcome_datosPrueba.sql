-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-04-2017 a las 10:58:42
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `warcome`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarPersonaje` (IN `idPersonaje` INT(11))  BEGIN
DELETE FROM usuariopersonaje WHERE usuariopersonaje.idPersonaje = idPersonaje;
DELETE FROM habilidadpersonaje WHERE habilidadpersonaje.idPersonaje = idPersonaje;
DELETE FROM pocioncantidad WHERE pocioncantidad.idPocion IN (SELECT pocion.idPocion FROM pocion WHERE pocion.idPersonaje = idPersonaje);
DELETE FROM pocion WHERE pocion.idPersonaje = idPersonaje;
DELETE FROM partida WHERE partida.idPersonaje = idPersonaje;
DELETE FROM personajeraza WHERE personajeraza.idPersonaje = idPersonaje;
DELETE FROM personajeclase WHERE personajeclase.idPersonaje = idPersonaje;
DELETE FROM personajeavatar WHERE personajeavatar.idPersonaje = idPersonaje;
DELETE FROM personaje WHERE personaje.idPersonaje = idPersonaje;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avatar`
--

CREATE TABLE `avatar` (
  `idAvatar` int(11) NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `avatar`
--

INSERT INTO `avatar` (`idAvatar`, `avatar`) VALUES
(40, 'img/monstruoAvatar/banshee.jpg'),
(41, 'img/monstruoAvatar/bruja.jpg'),
(42, 'img/monstruoAvatar/calamar.png'),
(43, 'img/monstruoAvatar/cocodrilo.png'),
(44, 'img/monstruoAvatar/dragon.jpg'),
(45, 'img/monstruoAvatar/felhound.jpg'),
(46, 'img/monstruoAvatar/gigante_de_la_montana.jpg'),
(47, 'img/monstruoAvatar/gnoll.jpg'),
(48, 'img/monstruoAvatar/golemLava.jpg'),
(49, 'img/monstruoAvatar/hidraFuego.jpg'),
(50, 'img/monstruoAvatar/hombreRoca.jpg'),
(51, 'img/monstruoAvatar/jineteFantasma.jpg'),
(52, 'img/monstruoAvatar/jineteFantasma.png'),
(53, 'img/monstruoAvatar/kobold.jpg'),
(54, 'img/monstruoAvatar/kraken.jpg'),
(55, 'img/monstruoAvatar/lasantacompana.jpg'),
(56, 'img/monstruoAvatar/monstruoBosque.png'),
(57, 'img/monstruoAvatar/murcielago.jpg'),
(58, 'img/monstruoAvatar/murcielago2.jpg'),
(59, 'img/monstruoAvatar/nazgul.jpg'),
(60, 'img/monstruoAvatar/oso.png'),
(61, 'img/monstruoAvatar/perroDeUrco.jpg'),
(62, 'img/monstruoAvatar/perroUrco.jpg'),
(63, 'img/monstruoAvatar/pez.png'),
(64, 'img/monstruoAvatar/piranaGigante.jpg'),
(65, 'img/monstruoAvatar/quimera.jpg'),
(67, 'img/monstruoAvatar/reyDelMal.jpg'),
(66, 'img/monstruoAvatar/rey_del_mal.png'),
(68, 'img/monstruoAvatar/santaCompana.jpg'),
(69, 'img/monstruoAvatar/serpienteDePantano.jpg'),
(70, 'img/monstruoAvatar/tiburonBlanco.jpg'),
(71, 'img/monstruoAvatar/troll.jpg'),
(72, 'img/monstruoAvatar/wyrm.jpg'),
(73, 'img/monstruoAvatar/zed.jpg'),
(1, 'img/personajeAvatar/arquera.png'),
(2, 'img/personajeAvatar/arqueraAtaque.png'),
(3, 'img/personajeAvatar/avatar.png'),
(4, 'img/personajeAvatar/avatar2.png'),
(5, 'img/personajeAvatar/avatar3.png'),
(6, 'img/personajeAvatar/avatar4.png'),
(7, 'img/personajeAvatar/avatar5.png'),
(8, 'img/personajeAvatar/cazador.jpg'),
(9, 'img/personajeAvatar/cazador2.jpg'),
(10, 'img/personajeAvatar/ciego.jpg'),
(11, 'img/personajeAvatar/darius.png'),
(12, 'img/personajeAvatar/draven.png'),
(13, 'img/personajeAvatar/elfo-lunar-hombre.png'),
(14, 'img/personajeAvatar/elfo-lunar-mujer.jpg'),
(15, 'img/personajeAvatar/enano.jpg'),
(16, 'img/personajeAvatar/enano_armadura.jpg'),
(17, 'img/personajeAvatar/enano_oro.jpg'),
(18, 'img/personajeAvatar/garen.png'),
(19, 'img/personajeAvatar/guerrero.jpg'),
(20, 'img/personajeAvatar/guerrero2.jpg'),
(21, 'img/personajeAvatar/humano.jpg'),
(22, 'img/personajeAvatar/katarina.jpg'),
(23, 'img/personajeAvatar/mago.jpg'),
(24, 'img/personajeAvatar/mago2.jpg'),
(25, 'img/personajeAvatar/mago3.jpg'),
(26, 'img/personajeAvatar/nigromante.jpg'),
(27, 'img/personajeAvatar/orco2.jpg'),
(28, 'img/personajeAvatar/orco3.jpg'),
(29, 'img/personajeAvatar/pantheon.png'),
(30, 'img/personajeAvatar/pikachu.jpg'),
(31, 'img/personajeAvatar/pirata.jpg'),
(32, 'img/personajeAvatar/robot-mujer.jpg'),
(33, 'img/personajeAvatar/sacerdote.jpg'),
(34, 'img/personajeAvatar/sacerdote2.jpg'),
(36, 'img/personajeAvatar/semielfo-hombre.jpg'),
(37, 'img/personajeAvatar/semielfo-mujer.jpg'),
(35, 'img/personajeAvatar/semielfo.jpg'),
(38, 'img/personajeAvatar/zed.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aventura`
--

CREATE TABLE `aventura` (
  `idAventura` int(11) NOT NULL,
  `idDificultad` tinyint(1) NOT NULL,
  `idTexto` int(11) NOT NULL,
  `idZona` int(11) NOT NULL,
  `imagenAventura` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aventura`
--

INSERT INTO `aventura` (`idAventura`, `idDificultad`, `idTexto`, `idZona`, `imagenAventura`) VALUES
(1, 1, 1, 0, 'placeholder-para-ruta'),
(2, 1, 2, 1, 'placeholder-para-ruta'),
(3, 1, 3, 2, 'placeholder-para-ruta'),
(4, 1, 4, 3, 'placeholder-para-ruta'),
(5, 1, 5, 3, 'placeholder-para-ruta'),
(6, 1, 6, 4, 'placeholder-para-ruta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `idClase` int(11) NOT NULL,
  `clase` varchar(25) NOT NULL,
  `dadoVida` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`idClase`, `clase`, `dadoVida`) VALUES
(1, 'Guerrero', '1d10'),
(2, 'Sacerdote', '1d8'),
(3, 'Mago', '1d6'),
(4, 'Nigromante', '1d6'),
(5, 'Cazador', '1d8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidad`
--

CREATE TABLE `habilidad` (
  `idHabilidad` int(11) NOT NULL,
  `nombreHabilidad` varchar(50) NOT NULL,
  `descripcionHabilidad` text,
  `danho` varchar(5) DEFAULT NULL,
  `estadisticaHabilidad` varchar(25) NOT NULL,
  `posibilidadGolpearHabilidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `habilidad`
--

INSERT INTO `habilidad` (`idHabilidad`, `nombreHabilidad`, `descripcionHabilidad`, `danho`, `estadisticaHabilidad`, `posibilidadGolpearHabilidad`) VALUES
(1, 'Colleja infernal', 'Concentra todo tu poder en la palma de la mano para asestar un golpe en la nuca.', '1d6', 'fuerza', 2),
(2, 'Patada sencillita', 'Haz aspavientos innecesarios para dar una patada poco vistosa.', '1d8', 'destreza', 1),
(3, 'Golpe de trasero metalizado', 'Aprieta fuerte tus nalgas y golpea de espaldas.', '1d4', 'constitucion', 3),
(4, 'Giro con doble tirabuzón hacia atrás', 'Gira rápidamente y presume de tus años compitiendo en salto sincronizado desde trampolín.', '2d6', 'inteligencia', 0),
(5, 'Recitar la Biblia', 'Recita un fragmento de la Biblia para aturdir a tu oponente.', '2d4', 'destreza', 2),
(6, 'Canción de cuna', 'Duerme a tu oponente con canciones de misa.', '1d10', 'inteligencia', 1),
(7, 'Cruz malintencionada', 'Clava a tu oponente la cruz que llevas colgada del cuello.', '1d6', 'fuerza', 3),
(8, 'Enseñar patita por debajo de la falda', 'Haz insinuaciones impuras para despistar a tu oponente.', '1d8', 'constitucion', 0),
(9, 'Churrasco', 'Invoca un banquete lleno de churrasco para distraer, porque la comida puede a cualquiera.', '2d6', 'constitucion', 1),
(10, 'Congelamiento nivel 2', 'Deja helado a tu oponente mientras enseñas tu insignia de nivel 2.', '1d8', 'fuerza', 2),
(11, 'Convertir en Chocapic', 'Usa tus poderes de transfiguración para desayunarte a tu oponente con un tazón de leche caliente.', '1d4', 'destreza', 3),
(12, 'Al microondas', 'Un minuto y las entrañas de tu oponente irán explotando como palomitas en el microondas.', '2d6', 'inteligencia', 0),
(13, 'Mordisco a lo Walking Dead', 'Infecta a tu oponente con un virus zombie.', '1d4', 'inteligencia', 3),
(14, 'Lapidazo', 'Arroja la lápida de uno de tus antepasados que llevas guardada en el zurrón.', '2d6', 'fuerza', 1),
(15, 'Bola sombra de suricato satánico', 'Concentra y lanza una bola de energía contra tu oponente.', '2d4', 'destreza', 2),
(16, 'Extraer alma a ostias', 'Usa tus poderes de golpeo para absorber el alma de tu oponente.', '2d6', 'constitucion', 0),
(17, 'Golpe a los huevos', 'Asesta un golpe bajo donde más duele.', '1d4', 'fuerza', 3),
(18, 'Corbata colombiana', 'Rodea a tu oponente y hazle una llave.', '1d8', 'destreza', 2),
(19, 'Trampa para ratones', 'Haz que tu oponente caiga en una trampa que lo inmovilice.', '1d10', 'inteligencia', 1),
(20, 'Locura transitoria', 'Sufres un periodo de enagenación mental transitoria para atacar indiscriminadamente.', '2d6', 'constitucion', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidadclase`
--

CREATE TABLE `habilidadclase` (
  `idHabilidadClase` int(11) NOT NULL,
  `idClase` int(11) NOT NULL,
  `idHabilidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `habilidadclase`
--

INSERT INTO `habilidadclase` (`idHabilidadClase`, `idClase`, `idHabilidad`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 3, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 4, 13),
(14, 4, 14),
(15, 4, 15),
(16, 4, 16),
(17, 5, 17),
(18, 5, 18),
(19, 5, 19),
(20, 5, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidadpersonaje`
--

CREATE TABLE `habilidadpersonaje` (
  `idHabilidadPersonaje` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `idHabilidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `habilidadpersonaje`
--

INSERT INTO `habilidadpersonaje` (`idHabilidadPersonaje`, `idPersonaje`, `idHabilidad`) VALUES
(1, 1, 11),
(3, 3, 1),
(4, 4, 1),
(6, 6, 19),
(7, 7, 10),
(8, 9, 13),
(9, 10, 20),
(11, 12, 17),
(21, 22, 7),
(22, 23, 9),
(23, 24, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventariopersonaje`
--

CREATE TABLE `inventariopersonaje` (
  `idInventarioPersonaje` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `armaEquipada` int(11) DEFAULT NULL,
  `armaduraEquipada` int(11) DEFAULT NULL,
  `objetosInventario` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inventariopersonaje`
--

INSERT INTO `inventariopersonaje` (`idInventarioPersonaje`, `idPersonaje`, `armaEquipada`, `armaduraEquipada`, `objetosInventario`) VALUES
(1, 6, 9, 12, '21'),
(2, 10, 2, 13, '20'),
(3, 22, 3, 13, '21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mapa`
--

CREATE TABLE `mapa` (
  `idMapa` int(11) NOT NULL,
  `orden` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mapa`
--

INSERT INTO `mapa` (`idMapa`, `orden`) VALUES
(1, '3,6'),
(2, ''),
(3, ''),
(4, ''),
(5, '1,2,3,4,5,6'),
(6, '1,2,3,4,5,6'),
(7, '1,2,3,4,5,6'),
(8, '1,2,3,4,5,6'),
(9, '1,2,3,4,5,6'),
(10, '1,2,3,4,5,6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monstruo`
--

CREATE TABLE `monstruo` (
  `idMonstruo` int(11) NOT NULL,
  `nombreMonstruo` varchar(100) NOT NULL,
  `ataqueMonstruo` varchar(30) NOT NULL,
  `acMonstruo` int(11) NOT NULL COMMENT 'Clase de armadura',
  `vidaMonstruo` int(11) NOT NULL,
  `xpOtorgada` int(11) NOT NULL COMMENT 'Puntos de experiencia otorgados por el monstruo',
  `posibilidadGolpear` int(11) NOT NULL,
  `oroOtorgado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `monstruo`
--

INSERT INTO `monstruo` (`idMonstruo`, `nombreMonstruo`, `ataqueMonstruo`, `acMonstruo`, `vidaMonstruo`, `xpOtorgada`, `posibilidadGolpear`, `oroOtorgado`) VALUES
(1, 'KOBOLD', '1d4', 1, 30, 10, 0, 5),
(2, 'GNOLL', '1d6', 2, 35, 20, 1, 5),
(3, 'TROLL', '1d8', 3, 45, 30, 1, 5),
(4, 'GIGANTE DE LA MONTAÑA', '1d10', 4, 100, 60, 2, 10),
(5, 'FELHOUND (PERRO DE FUEGO)', '1d4', 1, 25, 10, 2, 10),
(6, 'GÓLEM de LAVA', '1d6', 2, 35, 20, 2, 10),
(7, 'ELEMENTAL DE FUEGO', '1d8', 3, 55, 35, 2, 10),
(8, 'HIDRA DE FUEGO', '1d10', 4, 75, 50, 2, 10),
(9, 'WITCH (LA BRUJA GRITONA)', '1d4', 1, 25, 20, 2, 15),
(10, 'BANSHEE (FANTASMA)', '1d6', 2, 35, 30, 2, 15),
(11, 'JINETE FANTASMA', '1d8', 3, 60, 40, 2, 15),
(12, 'NAZGUL', '1d10', 4, 80, 50, 2, 20),
(13, 'PIRAÑA GIGANTE', '1d4', 1, 25, 15, 1, 20),
(14, 'SERPIENTE DEL PANTANO', '1d6', 2, 35, 25, 1, 20),
(15, 'TIBURÓN BLANCO', '1d8', 3, 60, 50, 2, 20),
(16, 'KRAKEN', '1d10', 4, 80, 70, 1, 25),
(17, 'DRAGÓN FAÉRICO', '1d4', 1, 30, 20, 2, 25),
(18, 'MURCIÉLAGO GIGANTE', '1d6', 2, 40, 30, 3, 25),
(19, 'QUIMERA', '1d8', 3, 60, 60, 2, 25),
(20, 'WYRM', '1d10', 4, 100, 80, 1, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monstruoavatar`
--

CREATE TABLE `monstruoavatar` (
  `idMonstruoAvatar` int(11) NOT NULL,
  `idMonstruo` int(11) NOT NULL,
  `idAvatar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `monstruoavatar`
--

INSERT INTO `monstruoavatar` (`idMonstruoAvatar`, `idMonstruo`, `idAvatar`) VALUES
(1, 1, 53),
(2, 2, 47),
(3, 3, 71),
(4, 4, 46),
(5, 5, 45),
(6, 6, 48),
(7, 7, 67),
(8, 8, 49),
(9, 9, 41),
(10, 10, 40),
(11, 11, 52),
(12, 12, 59),
(13, 13, 64),
(14, 14, 69),
(15, 15, 70),
(16, 16, 54),
(17, 17, 44),
(18, 18, 57),
(19, 19, 65),
(20, 20, 72);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objeto`
--

CREATE TABLE `objeto` (
  `idObjeto` int(11) NOT NULL,
  `nombreObjeto` varchar(100) NOT NULL,
  `descripcionObjeto` text,
  `estadistica1` varchar(20) DEFAULT NULL,
  `valor1` int(11) DEFAULT NULL,
  `estadistica2` varchar(20) DEFAULT NULL,
  `valor2` int(11) DEFAULT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `objeto`
--

INSERT INTO `objeto` (`idObjeto`, `nombreObjeto`, `descripcionObjeto`, `estadistica1`, `valor1`, `estadistica2`, `valor2`, `precio`) VALUES
(1, 'MAZA DE DOS MANOS', 'MAZA DE DOS MANOS', 'fuerza', 10, NULL, NULL, 10),
(2, 'MAZA Y ESCUDO', 'MAZA Y ESCUDO', 'constitucion', 10, NULL, NULL, 10),
(3, 'ESPADÓN', 'ESPADÓN', 'destreza', 10, NULL, NULL, 15),
(4, 'BASTÓN MÁGICO', 'BASTON MAGICO', 'inteligencia', 15, NULL, NULL, 15),
(5, 'MANGUAL', 'MANGUAL', 'fuerza', 5, 'destreza', 5, 15),
(6, 'GRAN HACHA', 'GRAN HACHA', 'fuerza', 15, NULL, NULL, 10),
(7, 'ARCO LARGO', 'ARCO LARGO', 'destreza', 15, NULL, NULL, 15),
(8, 'GRAN BALLESTA', 'GRAN BALLESTA', 'fuerza', 30, 'destreza', -5, 20),
(9, 'DAGA MÁGICA', 'DAGA MÁGICA', 'inteligencia', 10, NULL, NULL, 20),
(10, 'GRAN VARITA', 'GRAN VARITA', 'inteligencia', 30, 'constitucion', -5, 25),
(11, 'GRAN ESCUDO', 'GRAN ESCUDO', 'fuerza', -5, 'constitucion', 30, 30),
(12, 'ARMADURA LIGERA', 'ARMADURA LIGERA', 'destreza', 2, 'fuerza', 2, 15),
(13, 'ARMADURA DE TELA', 'ARMADURA DE TELA', 'inteligencia', 10, 'destreza', 5, 15),
(14, 'ARMADURA DE CUERO', 'ARMADURA DE CUERO', 'inteligencia', 5, 'destreza', 5, 10),
(15, 'ARMADURA DE MALLAS', 'ARMADURA DE MALLAS', 'fuerza', 10, 'destreza', 10, 10),
(16, 'ARMADURA DE LÁMINAS', 'ARMADURA DE LÁMINAS', 'fuerza', 10, 'destreza', 15, 20),
(17, 'ARMADURA DE PLACAS', 'ARMADURA DE PLACAS', 'fuerza', 15, 'constitucion', 10, 25),
(18, 'ARMADURA DE CORAZA', 'ARMADURA DE CORAZA', 'constitucion', 30, 'fuerza', 10, 30),
(19, 'POCIÓN PEQUEÑA', 'POCIÓN PEQUEÑA', 'vidaActual', 5, NULL, NULL, 5),
(20, 'POCIÓN NORMAL', 'POCIÓN NORMAL', 'vidaActual', 10, NULL, NULL, 15),
(21, 'POCIÓN GRANDE', 'POCIÓN GRANDE', 'vidaActual', 15, NULL, NULL, 18),
(22, 'SUPERPOCIÓN', 'SUPERPOCIÓN', 'vidaActual', 25, NULL, NULL, 20),
(23, 'POCIÓN MÁXIMA', 'POCIÓN MÁXIMA', 'vidaActual', 40, NULL, NULL, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetotipo`
--

CREATE TABLE `objetotipo` (
  `idObjetoTipo` int(11) NOT NULL,
  `idObjeto` int(11) NOT NULL,
  `idTipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `objetotipo`
--

INSERT INTO `objetotipo` (`idObjetoTipo`, `idObjeto`, `idTipo`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 2),
(10, 10, 2),
(11, 11, 2),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 3),
(20, 20, 3),
(21, 21, 3),
(22, 22, 3),
(23, 23, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida`
--

CREATE TABLE `partida` (
  `idPartida` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `posicion` int(11) NOT NULL,
  `idMapa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `partida`
--

INSERT INTO `partida` (`idPartida`, `idPersonaje`, `posicion`, `idMapa`) VALUES
(5, 22, 1, 8),
(6, 23, 1, 9),
(7, 24, 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje`
--

CREATE TABLE `personaje` (
  `idPersonaje` int(11) NOT NULL,
  `nombrePersonaje` varchar(100) NOT NULL,
  `fuerza` int(11) NOT NULL,
  `destreza` int(11) NOT NULL,
  `inteligencia` int(11) NOT NULL,
  `constitucion` int(11) NOT NULL,
  `vidaMax` int(11) NOT NULL,
  `vidaActual` int(11) NOT NULL,
  `xp` int(11) NOT NULL DEFAULT '0' COMMENT 'Puntos de experiencia',
  `nivel` int(11) NOT NULL DEFAULT '1',
  `acPersonaje` int(11) DEFAULT NULL COMMENT 'Clase de armadura',
  `oro` int(11) NOT NULL DEFAULT '50'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personaje`
--

INSERT INTO `personaje` (`idPersonaje`, `nombrePersonaje`, `fuerza`, `destreza`, `inteligencia`, `constitucion`, `vidaMax`, `vidaActual`, `xp`, `nivel`, `acPersonaje`, `oro`) VALUES
(1, 'Mi primer personaje', 16, 7, 7, 14, 42, 42, 0, 1, 17, 50),
(2, 'Otro personaje', 10, 18, 8, 15, 45, 45, 0, 1, 28, 50),
(3, 'Garen', 18, 13, 11, 13, 39, 39, 0, 1, 23, 50),
(4, 'Garen', 18, 13, 11, 13, 39, 39, 0, 1, 23, 50),
(6, 'Ashe', 10, 7, 9, 11, 33, 33, 0, 1, 17, 50),
(7, 'Xops', 20, 18, 12, 18, 54, 54, 0, 1, 28, 50),
(8, 'Personaje inventado', 9, 18, 17, 11, 33, 33, 0, 1, 28, 50),
(9, 'Sin logueo', 12, 13, 15, 13, 39, 39, 0, 1, 23, 50),
(10, 'Nuevo', 13, 12, 17, 14, 42, 42, 0, 1, 22, 50),
(12, 'P', 17, 18, 14, 21, 63, 63, 0, 1, 28, 50),
(22, 'Personaje con mapa', 16, 15, 10, 12, 36, 36, 0, 1, 25, 50),
(23, 'Drag', 16, 20, 7, 16, 48, 48, 0, 1, 30, 50),
(24, 'Otro drag', 13, 20, 15, 18, 54, 54, 0, 1, 30, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajeavatar`
--

CREATE TABLE `personajeavatar` (
  `idPersonajeAvatar` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `idAvatar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personajeavatar`
--

INSERT INTO `personajeavatar` (`idPersonajeAvatar`, `idPersonaje`, `idAvatar`) VALUES
(2, 6, 2),
(3, 7, 3),
(4, 9, 19),
(5, 10, 7),
(7, 12, 13),
(17, 22, 18),
(18, 23, 19),
(19, 24, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajeclase`
--

CREATE TABLE `personajeclase` (
  `idPersonajeClase` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `idClase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personajeclase`
--

INSERT INTO `personajeclase` (`idPersonajeClase`, `idPersonaje`, `idClase`) VALUES
(1, 1, 3),
(3, 3, 1),
(4, 4, 1),
(6, 6, 5),
(7, 7, 3),
(8, 9, 4),
(9, 10, 5),
(11, 12, 5),
(21, 22, 2),
(22, 23, 3),
(23, 24, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajeraza`
--

CREATE TABLE `personajeraza` (
  `idPersonajeRaza` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `idRaza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personajeraza`
--

INSERT INTO `personajeraza` (`idPersonajeRaza`, `idPersonaje`, `idRaza`) VALUES
(1, 1, 2),
(3, 3, 1),
(4, 4, 1),
(6, 6, 4),
(7, 7, 3),
(8, 9, 3),
(9, 10, 2),
(11, 12, 5),
(21, 22, 2),
(22, 23, 3),
(23, 24, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pocion`
--

CREATE TABLE `pocion` (
  `idPocion` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `idObjeto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pocion`
--

INSERT INTO `pocion` (`idPocion`, `idPersonaje`, `idObjeto`) VALUES
(1, 22, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pocioncantidad`
--

CREATE TABLE `pocioncantidad` (
  `idPocionCantidad` int(11) NOT NULL,
  `idPocion` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pocioncantidad`
--

INSERT INTO `pocioncantidad` (`idPocionCantidad`, `idPocion`, `cantidad`) VALUES
(2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `raza`
--

CREATE TABLE `raza` (
  `idRaza` int(11) NOT NULL,
  `raza` varchar(25) NOT NULL,
  `estadistica1` varchar(25) NOT NULL,
  `valor1` int(11) NOT NULL,
  `estadistica2` varchar(25) NOT NULL,
  `valor2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `raza`
--

INSERT INTO `raza` (`idRaza`, `raza`, `estadistica1`, `valor1`, `estadistica2`, `valor2`) VALUES
(1, 'Humano', 'fuerza', 1, 'constitucion', -1),
(2, 'Enano', 'fuerza', 2, 'inteligencia', -2),
(3, 'Elfo lunar', 'destreza', 2, 'constitucion', -1),
(4, 'Semielfo', 'inteligencia', 2, 'constitucion', -2),
(5, 'Orco', 'fuerza', 2, 'inteligencia', -2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `texto`
--

CREATE TABLE `texto` (
  `idTexto` int(11) NOT NULL,
  `texto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `texto`
--

INSERT INTO `texto` (`idTexto`, `texto`) VALUES
(1, '&lt;div id=&quot;caja1&quot;&gt;\n		&lt;div id=&quot;introduccion&quot; class=&quot;balloon&quot; &gt;\n			&lt;p&gt;Permitidme que os cuente mi historia.&lt;/p&gt;\n			&lt;p&gt;Me crié en una pequeña casa en el bosque, apartado de todo conflicto, protegido por un encantamiento que mi abuelo había creado, siempre le preguntaba\n			 el motivo de el encantamiento y por qué no había nadie más aquí; a lo que él me respondía -Esta tierra esconde grandes peligros, antes de salir\n			 de aquí, necesitas aprender ciertas cosas, el futuro te depara grandes cosas, grandes batallas, tu nombre será conocido en todo el mundo pero otros\n			 te recordarán por ser la &quot;Profecía&quot;, eres la luz, la esperanza.&lt;/p&gt;\n			&lt;p&gt; Desde niño sabía cual era mi destino.&lt;/p&gt;\n			&lt;p&gt;Antes de que llegase este periodo de paz a esta tierra, fue sometido a una fuerza sin igual, nadie había visto ni sentido nada igual.\n			 Todos los Reyes de este reino reunieron a sus mejores guerreros para combatirlo, llamaron a los más grandes magos de todos los tiempos y ni así\n			 se acercarón a su reino.&lt;/p&gt;\n			 &lt;p&gt;Pero un día un druida reunión a todos los Reyes del reino para contarles una profecía que se cumpliría 20 años más tarde, la profecía era la siguiente:&lt;/p&gt;&lt;/div&gt;\n											\n											&lt;div id=&quot;profecia&quot;&gt;&lt;p&gt;&quot;Solo un ser de puro corazón, portador de la luz, será el elegido.\n											 No subestiméis su aspecto ya que su poder proviene de su corazón.\n											 Cuando sus fuerzas flaqueen su corazón le mostrará el camino y\n											 liberará esta tierra de las entrañas de la oscuridad.&quot;&lt;/p&gt;&lt;/div&gt;\n											 \n			&lt;div id=&quot;introduccion1&quot;&gt;&lt;p&gt;Todos los presentes celebraron esas palabras pero esperar 20 años sería duro. Fueron pasando los años, el agua y la comida era cada vez más escasa,\n			 muchos de los reinos habían desaparecido pero los que quedaban recordaban las palabras del druida, pasados los 20 años solo quedaba un Rey,\n			 el Señor de El Bosque Encantado, lo llamaban así por el cuidado que le daba a los bosques y a su envidiable jardín; la gente del reino dicen que\n			 Ésus &quot;Dios de los árboles y protector de los bosques&quot; le había dado un don.&lt;/p&gt;\n			 &lt;p&gt;Un día, ya desesperado, mandó a que buscasen a la &quot;Profecía&quot;...&lt;/p&gt;\n			 \n			&lt;p&gt;Y aquí es donde empieza mi aventura en esta extraña tierra llena de peligros y seres increíbles.&lt;/p&gt;&lt;/div&gt;\n		&lt;/div&gt;\n&lt;/div&gt;'),
(2, '&lt;div id=&quot;primeraZona&quot;&gt;\n	&lt;div id=&quot;castillo&quot; onclick=&quot;historia();&quot;&gt;\n		&lt;p&gt;Me presenté delante del Rey, en su expresión se podía distinguir sorpresa y esperanza.&lt;/p&gt;\n	&lt;/div&gt;\n	&lt;div id=&quot;dialogo&quot; class=&quot;balloon&quot;&gt;\n		&lt;p&gt;(Rey)-Ahora las palabras de ese viejo druida toman sentido.\n  		    Por favor jovén, ayudanos con esta situación, esta tierra se consume cada día más y mi pueblo cada día disminuye,\n		    bien por la mala allimentación o ya sea porque sucumben al poder de ese &quot;REY DEL MAL&quot;.\n			Te daré cualquier cosa que pidas pero te lo suplico, AYÚDANOS.\n		&lt;/p&gt;\n	&lt;/div&gt;\n\n	&lt;div id=&quot;foso&quot;&gt;\n\n		&lt;div id=&quot;dialogo1&quot;&gt;\n			&lt;p&gt;Debo darme prisa, los engendros de la oscuridad ya se estan acercando.\n			   VOLVER A LA OSCURIDAD ENGENDROS DEL MAL!!!\n			&lt;/p&gt;\n\n		&lt;div id=&quot;pensamientos0&quot;&gt;\n			&lt;p&gt;A medida que iban pasando las horas y me iba alejando de El Bosque Encantado, podía apreciar como el paso de los años bajo el yugo de \n			   El Rey Del Mal no era de extrañar, solo viendo esa pequeña muestra, que grandes ejércitos sucumbieran ante él; recuerdo que mi abuelo me contaba\n			   que hasta el propio Lucifer le temía y le otorgó ciertos dones que estaban prohibidos utilizar, le concedió el poder de la nigromancia \n			   pero tal era su poder que no se conformó con liderar a ejércitos de NO MUERTOS, fue más allá, se adentró en las profundidades más \n			   oscuras y se hizo con el mayor y temible ejército nunca antes visto por el hombre ni por ninguna otra criatura, solo nos podíamos \n			   imaginar todos esos terrores por lo contado por Dante en su viaje por el purgatorio.\n		       La sensación de inseguridad estaba presente desde que puse el pie fuera del Castillo y de su protección, los gemidos deseosos de esos\n			   seres por alimentarse de mi corazón y de mi alma era más que evidente; pobres criaturas.\n			&lt;/p&gt;\n		&lt;/div&gt;\n\n&lt;/div&gt;'),
(3, '&lt;div id=&quot;segundaZona&quot;&gt;\n	&lt;div id=&quot;jardines&quot; onclick=&quot;historia();&quot;&gt;\n		&lt;p&gt;Era un inmenso jardín, precioso, en su día tuvo que ser precioso y muy bien cuidado (las historias contadas en el pueblo deberían ser ciertas).\n		   Ahora el jardín ya no lucia como antaño, ahora todo eran zarzas, maleza y restos de ceniza; hasta la propia naturaleza sumcumbió a tal poder.\n		&lt;/p&gt;\n	&lt;/div&gt;\n	&lt;div id=&quot;decisiones&quot;&gt;\n		&lt;p&gt;El destino es caprichoso, ante mis ojos dos caminos. ¿Cúal sería el correcto? ¿Cúal más seguro? ¿Cúal me llevaría a mi destino?\n	      ¿Serían reales? ¿Una ilusión creada por el propio mal?\n	       No tenía más remedio que cruzar uno, pero ¿cúal?...\n		&lt;/p&gt;\n	&lt;/div&gt;	\n\n&lt;/div&gt;'),
(4, '&lt;div id=&quot;terceraZonaA&quot;&gt;\n	&lt;div id=&quot;pensamientos1&quot;&gt;\n		&lt;p&gt;Se notaba que estaba rodeado, tenía la sensación de que hasta las zarzas y la maleza atacarían en cualquier momento...\n		&lt;/p&gt;\n	&lt;/div&gt;\n&lt;/div&gt;'),
(5, '&lt;div id=&quot;terceraZonaB&quot;&gt;\n	&lt;div id=&quot;pensamientos2&quot; &gt;\n		&lt;p&gt;Había un puente en estado dudoso, pero era normal después de tantos años y tantos daños.\n		&lt;/p&gt;\n	&lt;/div&gt;\n&lt;/div&gt;'),
(6, '&lt;div id=&quot;cuartaZona&quot;&gt;\n	&lt;div id=&quot;pensamientos3&quot;&gt;\n		&lt;p&gt;Seguí mi camino, era consciente de lo poco que quedaba para el principio del fin. El camino era cada vez más peligroso, oscuro; la desesperación,\n		   la ira, el terror estaban más presentes. Al rato de seguir el sendero pude ver una cueva, con la entrada sin vigilancia... o eso creía\n		&lt;/p&gt;\n	&lt;/div&gt;\n\n	&lt;div id=&quot;pensamientos4&quot;&gt;\n		&lt;p&gt;Las leyendas tenían razón, su poder era enorme, o debía serlo si tenía a su servicio a El Perro de Urco. Me adentré en la cueva, sigilosamente fui\n		   avanzando por esos pasillos labenrínticos, hasta llegar a una amplia sala en la que había un grupo de encapuchados recitando, ¿un conjuro?, sguramente.\n		   Me fijé un poco más en sus ropajes y me di cuenta de quienes eran, La Santa Compaña, intenté salir de esa sala sin ser detectado pero fue inútil,\n		   ya se habían percatado de mi presencia.\n		&lt;/p&gt;\n	&lt;/div&gt;\n\n	&lt;div id=&quot;pensamientos5&quot;&gt;\n		&lt;p&gt;Agotado de la batalla, decidí continuar, no había tiempo que perder, notaba su presencia cerca y él notaba la mía, estaba furioso, había derrotado a\n		   sus mejores y temibles hombres, su poder estaba en entre dicho.\n		   Al llegar a sus aposentos me di cuenta de que la cueva no era una cueva normal, era la entrada al infierno.\n		   Era la hora de la batalla contra El Señor De Todo Mal.\n		   Que los dioses nos asistan.\n		&lt;/p&gt;\n	&lt;/div&gt;\n	&lt;div id=&quot;declaracion&quot;&gt;\n		&lt;p&gt;DEVOLVERÉ LA PAZ Y LA LUZ A ESTA TIERRA!!! \n		\n		   ACABARÉ CONTIGO Y VOLVERÁS A ESE POZO DE PUTEFRACCIÓN DEL QUE SALISTE!!!\n		   \n		   NUNCA PODRÁS DERROTAR LA LUZ DE ESTE MUNDO!!!\n		   \n		   BRIGHID &quot;DIOSA DE LA CURACIÓN&quot; TE IMPLORO AYUDA PARA DESTERRAR A ESTE SER Y DEVOLVERTE TU PODER!!!\n		   \n		   ÉSUS &quot;DIOS DE LOS ÁRBOLES Y PROTECTOR DE LOS BOSQUES&quot; PRÉSTAME TU PODER PARA LIBERAR A TU CREACIÓN DE LAS GARRAS DE LAS TINIEBLAS DE ESTE SER!!!\n		   \n		   TEUTATES &quot;DIOS DEL PUEBLO&quot; ME ENCOMIENDO A TI PARA HACER TU VOLUNTAD Y LIBERAR A TU CREACIÓN!!!\n			 \n				ARDERÁS EN LAS LLAMAS DEL PURGATORIO!!!!\n		&lt;/p&gt;\n	&lt;/div&gt;\n\n&lt;/div&gt;');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `idTipo` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`idTipo`, `tipo`) VALUES
(2, 'Arma'),
(1, 'Armadura'),
(3, 'Poción');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `password`) VALUES
(1, 'Gabriel', 'a83f0f76c2afad4f5d7260824430b798'),
(2, 'jkjlk', 'd41d8cd98f00b204e9800998ecf8427e'),
(3, 'Gaba', '979052ad8c81b2f66feea1f317427687');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariopersonaje`
--

CREATE TABLE `usuariopersonaje` (
  `idUsuarioPersonaje` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuariopersonaje`
--

INSERT INTO `usuariopersonaje` (`idUsuarioPersonaje`, `idPersonaje`, `idUsuario`) VALUES
(1, 1, 1),
(3, 3, 1),
(4, 4, 1),
(6, 6, 1),
(7, 7, 1),
(8, 10, 1),
(10, 12, 3),
(20, 22, 1),
(21, 23, 1),
(22, 24, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avatar`
--
ALTER TABLE `avatar`
  ADD PRIMARY KEY (`idAvatar`),
  ADD UNIQUE KEY `avatar` (`avatar`);

--
-- Indices de la tabla `aventura`
--
ALTER TABLE `aventura`
  ADD PRIMARY KEY (`idAventura`),
  ADD KEY `texto_aventura_FK` (`idTexto`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`idClase`),
  ADD UNIQUE KEY `clase` (`clase`);

--
-- Indices de la tabla `habilidad`
--
ALTER TABLE `habilidad`
  ADD PRIMARY KEY (`idHabilidad`),
  ADD UNIQUE KEY `nombreHabilidad` (`nombreHabilidad`);

--
-- Indices de la tabla `habilidadclase`
--
ALTER TABLE `habilidadclase`
  ADD PRIMARY KEY (`idHabilidadClase`),
  ADD KEY `clase_habilidadClase_FK` (`idClase`),
  ADD KEY `habilidad_habilidadClase_FK` (`idHabilidad`);

--
-- Indices de la tabla `habilidadpersonaje`
--
ALTER TABLE `habilidadpersonaje`
  ADD PRIMARY KEY (`idHabilidadPersonaje`),
  ADD KEY `personaje_habilidadPersonaje_FK` (`idPersonaje`),
  ADD KEY `habilidad_habilidadPersonaje_FK` (`idHabilidad`);

--
-- Indices de la tabla `inventariopersonaje`
--
ALTER TABLE `inventariopersonaje`
  ADD PRIMARY KEY (`idInventarioPersonaje`),
  ADD KEY `objeto_inventarioPersonaje_armaEquipada_FK` (`armaEquipada`),
  ADD KEY `objeto_inventarioPersonaje_armaduraEquipada_FK` (`armaduraEquipada`);

--
-- Indices de la tabla `mapa`
--
ALTER TABLE `mapa`
  ADD PRIMARY KEY (`idMapa`);

--
-- Indices de la tabla `monstruo`
--
ALTER TABLE `monstruo`
  ADD PRIMARY KEY (`idMonstruo`),
  ADD UNIQUE KEY `nombreMonstruo` (`nombreMonstruo`);

--
-- Indices de la tabla `monstruoavatar`
--
ALTER TABLE `monstruoavatar`
  ADD PRIMARY KEY (`idMonstruoAvatar`),
  ADD KEY `personaje_monstruoAvatar_FK` (`idMonstruo`),
  ADD KEY `avatar_monstruoAvatar_FK` (`idAvatar`);

--
-- Indices de la tabla `objeto`
--
ALTER TABLE `objeto`
  ADD PRIMARY KEY (`idObjeto`),
  ADD UNIQUE KEY `nombreObjeto` (`nombreObjeto`);

--
-- Indices de la tabla `objetotipo`
--
ALTER TABLE `objetotipo`
  ADD PRIMARY KEY (`idObjetoTipo`),
  ADD KEY `objeto_objetoTipo_FK` (`idObjeto`),
  ADD KEY `tipo_objetoTipo_FK` (`idTipo`);

--
-- Indices de la tabla `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`idPartida`),
  ADD KEY `mapa_partida_FK` (`idMapa`),
  ADD KEY `personaje_partida_FK` (`idPersonaje`);

--
-- Indices de la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD PRIMARY KEY (`idPersonaje`);

--
-- Indices de la tabla `personajeavatar`
--
ALTER TABLE `personajeavatar`
  ADD PRIMARY KEY (`idPersonajeAvatar`),
  ADD KEY `personaje_personajeAvatar_FK` (`idPersonaje`),
  ADD KEY `avatar_personajeAvatar_FK` (`idAvatar`);

--
-- Indices de la tabla `personajeclase`
--
ALTER TABLE `personajeclase`
  ADD PRIMARY KEY (`idPersonajeClase`),
  ADD KEY `personaje_personajeClase_FK` (`idPersonaje`),
  ADD KEY `clase_personajeClase_FK` (`idClase`);

--
-- Indices de la tabla `personajeraza`
--
ALTER TABLE `personajeraza`
  ADD PRIMARY KEY (`idPersonajeRaza`),
  ADD KEY `personaje_personajeRaza_FK` (`idPersonaje`),
  ADD KEY `clase_personajeRaza_FK` (`idRaza`);

--
-- Indices de la tabla `pocion`
--
ALTER TABLE `pocion`
  ADD PRIMARY KEY (`idPocion`),
  ADD KEY `personaje_pocion_FK` (`idPersonaje`),
  ADD KEY `objeto_pocion_FK` (`idObjeto`);

--
-- Indices de la tabla `pocioncantidad`
--
ALTER TABLE `pocioncantidad`
  ADD PRIMARY KEY (`idPocionCantidad`),
  ADD KEY `pocion_pocionCantidad_FK` (`idPocion`);

--
-- Indices de la tabla `raza`
--
ALTER TABLE `raza`
  ADD PRIMARY KEY (`idRaza`),
  ADD UNIQUE KEY `raza` (`raza`);

--
-- Indices de la tabla `texto`
--
ALTER TABLE `texto`
  ADD PRIMARY KEY (`idTexto`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`idTipo`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuariopersonaje`
--
ALTER TABLE `usuariopersonaje`
  ADD PRIMARY KEY (`idUsuarioPersonaje`),
  ADD KEY `personaje_usuarioPersonaje_FK` (`idPersonaje`),
  ADD KEY `usuario_usuarioPersonaje_FK` (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aventura`
--
ALTER TABLE `aventura`
  MODIFY `idAventura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `habilidadclase`
--
ALTER TABLE `habilidadclase`
  MODIFY `idHabilidadClase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `habilidadpersonaje`
--
ALTER TABLE `habilidadpersonaje`
  MODIFY `idHabilidadPersonaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `inventariopersonaje`
--
ALTER TABLE `inventariopersonaje`
  MODIFY `idInventarioPersonaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `mapa`
--
ALTER TABLE `mapa`
  MODIFY `idMapa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `monstruoavatar`
--
ALTER TABLE `monstruoavatar`
  MODIFY `idMonstruoAvatar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `objetotipo`
--
ALTER TABLE `objetotipo`
  MODIFY `idObjetoTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `partida`
--
ALTER TABLE `partida`
  MODIFY `idPartida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `personaje`
--
ALTER TABLE `personaje`
  MODIFY `idPersonaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `personajeavatar`
--
ALTER TABLE `personajeavatar`
  MODIFY `idPersonajeAvatar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `personajeclase`
--
ALTER TABLE `personajeclase`
  MODIFY `idPersonajeClase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `personajeraza`
--
ALTER TABLE `personajeraza`
  MODIFY `idPersonajeRaza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `pocion`
--
ALTER TABLE `pocion`
  MODIFY `idPocion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `pocioncantidad`
--
ALTER TABLE `pocioncantidad`
  MODIFY `idPocionCantidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuariopersonaje`
--
ALTER TABLE `usuariopersonaje`
  MODIFY `idUsuarioPersonaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aventura`
--
ALTER TABLE `aventura`
  ADD CONSTRAINT `texto_aventura_FK` FOREIGN KEY (`idTexto`) REFERENCES `texto` (`idTexto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `habilidadclase`
--
ALTER TABLE `habilidadclase`
  ADD CONSTRAINT `clase_habilidadClase_FK` FOREIGN KEY (`idClase`) REFERENCES `clase` (`idClase`),
  ADD CONSTRAINT `habilidad_habilidadClase_FK` FOREIGN KEY (`idHabilidad`) REFERENCES `habilidad` (`idHabilidad`);

--
-- Filtros para la tabla `habilidadpersonaje`
--
ALTER TABLE `habilidadpersonaje`
  ADD CONSTRAINT `habilidad_habilidadPersonaje_FK` FOREIGN KEY (`idHabilidad`) REFERENCES `habilidad` (`idHabilidad`),
  ADD CONSTRAINT `personaje_habilidadPersonaje_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `personaje` (`idPersonaje`);

--
-- Filtros para la tabla `inventariopersonaje`
--
ALTER TABLE `inventariopersonaje`
  ADD CONSTRAINT `objeto_inventarioPersonaje_armaEquipada_FK` FOREIGN KEY (`armaEquipada`) REFERENCES `objeto` (`idObjeto`),
  ADD CONSTRAINT `objeto_inventarioPersonaje_armaduraEquipada_FK` FOREIGN KEY (`armaduraEquipada`) REFERENCES `objeto` (`idObjeto`);

--
-- Filtros para la tabla `monstruoavatar`
--
ALTER TABLE `monstruoavatar`
  ADD CONSTRAINT `avatar_monstruoAvatar_FK` FOREIGN KEY (`idAvatar`) REFERENCES `avatar` (`idAvatar`),
  ADD CONSTRAINT `personaje_monstruoAvatar_FK` FOREIGN KEY (`idMonstruo`) REFERENCES `monstruo` (`idMonstruo`);

--
-- Filtros para la tabla `objetotipo`
--
ALTER TABLE `objetotipo`
  ADD CONSTRAINT `objeto_objetoTipo_FK` FOREIGN KEY (`idObjeto`) REFERENCES `objeto` (`idObjeto`),
  ADD CONSTRAINT `tipo_objetoTipo_FK` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`idTipo`);

--
-- Filtros para la tabla `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `mapa_partida_FK` FOREIGN KEY (`idMapa`) REFERENCES `mapa` (`idMapa`),
  ADD CONSTRAINT `personaje_partida_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `personaje` (`idPersonaje`);

--
-- Filtros para la tabla `personajeavatar`
--
ALTER TABLE `personajeavatar`
  ADD CONSTRAINT `avatar_personajeAvatar_FK` FOREIGN KEY (`idAvatar`) REFERENCES `avatar` (`idAvatar`),
  ADD CONSTRAINT `personaje_personajeAvatar_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `personaje` (`idPersonaje`);

--
-- Filtros para la tabla `personajeclase`
--
ALTER TABLE `personajeclase`
  ADD CONSTRAINT `clase_personajeClase_FK` FOREIGN KEY (`idClase`) REFERENCES `clase` (`idClase`),
  ADD CONSTRAINT `personaje_personajeClase_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `personaje` (`idPersonaje`);

--
-- Filtros para la tabla `personajeraza`
--
ALTER TABLE `personajeraza`
  ADD CONSTRAINT `clase_personajeRaza_FK` FOREIGN KEY (`idRaza`) REFERENCES `raza` (`idRaza`),
  ADD CONSTRAINT `personaje_personajeRaza_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `personaje` (`idPersonaje`);

--
-- Filtros para la tabla `pocion`
--
ALTER TABLE `pocion`
  ADD CONSTRAINT `objeto_pocion_FK` FOREIGN KEY (`idObjeto`) REFERENCES `objeto` (`idObjeto`),
  ADD CONSTRAINT `personaje_pocion_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `personaje` (`idPersonaje`);

--
-- Filtros para la tabla `pocioncantidad`
--
ALTER TABLE `pocioncantidad`
  ADD CONSTRAINT `pocion_pocionCantidad_FK` FOREIGN KEY (`idPocion`) REFERENCES `pocion` (`idPocion`);

--
-- Filtros para la tabla `usuariopersonaje`
--
ALTER TABLE `usuariopersonaje`
  ADD CONSTRAINT `personaje_usuarioPersonaje_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `personaje` (`idPersonaje`),
  ADD CONSTRAINT `usuario_usuarioPersonaje_FK` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
