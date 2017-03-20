--
-- Base de datos para "The Legend of Warcome": `warcome`
--
DROP DATABASE IF EXISTS `warcome`;
CREATE DATABASE IF NOT EXISTS `warcome` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `warcome`;

-- --------------------------------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avatar`
--

DROP TABLE IF EXISTS `avatar`;
CREATE TABLE IF NOT EXISTS `avatar` (
  `idAvatar` int(11) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idAvatar`),
  UNIQUE (`avatar`),
  KEY `avatar_personajeAvatar_FK` (`idAvatar`),
  KEY `avatar_monstruoAvatar_FK` (`idAvatar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `avatar`
--

-- INSERT INTO `avatar` (`idAvatar`, `avatar`) VALUES
-- (),
-- ();

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aventura`
--

DROP TABLE IF EXISTS `aventura`;
CREATE TABLE IF NOT EXISTS `aventura` (
  `idAventura` int(11) NOT NULL,
  `idDificultad` tinyint(1) NOT NULL,
  `idTexto` int(11) NOT NULL,
  `idZona` int(11) NOT NULL,
  PRIMARY KEY (`idAventura`),
  INDEX (`idTexto`),
  KEY `aventura_mapa_FK` (`idAventura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `aventura`
--

-- INSERT INTO `aventura` (`idAventura`, `idDificultad`, `idTexto`, `idZona`) VALUES
-- (),
-- ();

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

DROP TABLE IF EXISTS `clase`;
CREATE TABLE IF NOT EXISTS `clase` (
  `idClase` int(11) NOT NULL,
  `clase` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idClase`),
  UNIQUE (`clase`),
  KEY `clase_personajeClase_FK` (`idClase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `clase`
--

-- INSERT INTO `clase` (`idClase`, `clase`) VALUES
-- (),
-- ();

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidad`
--

DROP TABLE IF EXISTS `habilidad`;
CREATE TABLE IF NOT EXISTS `habilidad` (
  `idHabilidad` int(11) NOT NULL,
  `nombreHabilidad` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcionHabilidad` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `danho` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`idHabilidad`),
  UNIQUE (`nombreHabilidad`),
  KEY `habilidad_personaje_FK` (`idHabilidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `habilidad`
--

-- INSERT INTO `habilidad` (`idHabilidad`, `nombreHabilidad`, `descripcionHabilidad`, `danho`) VALUES
-- (),
-- ();

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidadPersonaje`
--

DROP TABLE IF EXISTS `habilidadPersonaje`;
CREATE TABLE IF NOT EXISTS `habilidadPersonaje` (
  `idHabilidadPersonaje` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `idHabilidad` int(11) NOT NULL,
  PRIMARY KEY (`idHabilidadPersonaje`),
  INDEX (`idHabilidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `habilidadPersonaje`
--

-- INSERT INTO `habilidadPersonaje` (`idHabilidadPersonaje`, `idPersonaje`, `idHabilidad`) VALUES
-- (),
-- ();

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarioPersonaje`
--

DROP TABLE IF EXISTS `inventarioPersonaje`;
CREATE TABLE IF NOT EXISTS `inventarioPersonaje` (
  `idInventarioPersonaje` int(11) NOT NULL AUTO_INCREMENT,
  `idPersonaje` int(11) NOT NULL,
  `armaEquipada` int(11) NULL,
  `armaduraEquipada` int(11) NULL,
  PRIMARY KEY (`idInventarioPersonaje`),
  INDEX (`armaEquipada`),
  INDEX (`armaduraEquipada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mapa`
--

DROP TABLE IF EXISTS `mapa`;
CREATE TABLE IF NOT EXISTS `mapa` (
  `idMapa` int(11) NOT NULL AUTO_INCREMENT,
  `posicion` int(11) NOT NULL,
  `idAventura` int(11) NOT NULL,
  PRIMARY KEY (`idMapa`),
  INDEX (`idAventura`),
  KEY `mapa_partida_FK` (`idMapa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monstruo`
--

DROP TABLE IF EXISTS `monstruo`;
CREATE TABLE IF NOT EXISTS `monstruo` (
  `idMonstruo` int(11) NOT NULL,
  `nombreMonstruo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ataqueMonstruo` int(11) NOT NULL,
  `acMonstruo` int(11) NOT NULL COMMENT 'Clase de armadura',
  `vidaMonstruo` int(11) NOT NULL,
  `xpOtorgada` int(11) NOT NULL COMMENT 'Puntos de experiencia otorgados por el monstruo',
  PRIMARY KEY (`idMonstruo`),
  UNIQUE (`nombreMonstruo`),
  KEY `monstruo_avatar_FK` (`idMonstruo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `monstruo`
--

-- INSERT INTO `monstruo` (`idMonstruo`, `nombreMonstruo`, `ataqueMonstruo`, `acMonstruo`, `vidaMonstruo`, `xpOtorgada`) VALUES
-- (),
-- ();

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monstruoAvatar`
--

DROP TABLE IF EXISTS `monstruoAvatar`;
CREATE TABLE IF NOT EXISTS `monstruoAvatar` (
  `idMonstruoAvatar` int(11) NOT NULL AUTO_INCREMENT,
  `idMonstruo` int(11) NOT NULL,
  `idAvatar` int(11) NOT NULL,
  PRIMARY KEY (`idMonstruoAvatar`),
  INDEX (`idMonstruo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objeto`
--

DROP TABLE IF EXISTS `objeto`;
CREATE TABLE IF NOT EXISTS `objeto` (
  `idObjeto` int(11) NOT NULL,
  `nombreObjeto` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcionObjeto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `estadistica1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `valor1` int(11) NULL,
  `estadistica2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `valor2` int(11) NULL,
  PRIMARY KEY (`idObjeto`),
  UNIQUE (`nombreObjeto`),
  KEY `objeto_pocion_FK` (`idObjeto`),
  KEY `objeto_inventarioPersonaje_armaEquipada_FK` (`idObjeto`),
  KEY `objeto_inventarioPersonaje_armaduraEquipada_FK` (`idObjeto`),
  KEY `objeto_objetoTipo_FK` (`idObjeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `objeto`
--

-- INSERT INTO `objeto` (`idObjeto`, `nombreObjeto`, `descripcionObjeto`, `estadistica1`, `valor1`, `estadistica2`, `valor2`) VALUES
-- (),
-- ();

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetoTipo`
--

DROP TABLE IF EXISTS `objetoTipo`;
CREATE TABLE IF NOT EXISTS `objetoTipo` (
  `idObjetoTipo` int(11) NOT NULL AUTO_INCREMENT,
  `idObjeto` int(11) NOT NULL,
  `idTipo` int(11) NOT NULL,
  PRIMARY KEY (`idObjetoTipo`),
  INDEX (`idObjeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida`
--

DROP TABLE IF EXISTS `partida`;
CREATE TABLE IF NOT EXISTS `partida` (
  `idPartida` int(11) NOT NULL AUTO_INCREMENT,
  `idPersonaje` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `idMapa` int(11) NOT NULL,
  PRIMARY KEY (`idPartida`),
  INDEX (`idPersonaje`),
  INDEX (`idMapa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje`
--

DROP TABLE IF EXISTS `personaje`;
CREATE TABLE IF NOT EXISTS `personaje` (
  `idPersonaje` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePersonaje` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fuerza` int(11) NOT NULL,
  `destreza` int(11) NOT NULL,
  `inteligencia` int(11) NOT NULL,
  `constitucion` int(11) NOT NULL,
  `vidaMax` int(11) NOT NULL,
  `vidaActual` int(11) NOT NULL,
  `xp` int(11) NOT NULL DEFAULT 0 COMMENT 'Puntos de experiencia',
  `nivel` int(11) NOT NULL DEFAULT 1,
  `acPersonaje` int(11) DEFAULT NULL COMMENT 'Clase de armadura',
  `oro` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idPersonaje`),
  KEY `personaje_habilidades_FK` (`idPersonaje`),
  KEY `personaje_usuario_FK` (`idPersonaje`),
  KEY `personaje_pocion_FK` (`idPersonaje`),
  KEY `personaje_partida_FK` (`idPersonaje`),
  KEY `personaje_raza_FK` (`idPersonaje`),
  KEY `personaje_clase_FK` (`idPersonaje`),
  KEY `personaje_avatar_FK` (`idPersonaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajeAvatar`
--

DROP TABLE IF EXISTS `personajeAvatar`;
CREATE TABLE IF NOT EXISTS `personajeAvatar` (
  `idPersonajeAvatar` int(11) NOT NULL AUTO_INCREMENT,
  `idPersonaje` int(11) NOT NULL,
  `idAvatar` int(11) NOT NULL,
  PRIMARY KEY (`idPersonajeAvatar`),
  INDEX (`idPersonaje`),
  INDEX (`idAvatar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajeClase`
--

DROP TABLE IF EXISTS `personajeClase`;
CREATE TABLE IF NOT EXISTS `personajeClase` (
  `idPersonajeClase` int(11) NOT NULL AUTO_INCREMENT,
  `idPersonaje` int(11) NOT NULL,
  `idClase` int(11) NOT NULL,
  PRIMARY KEY (`idPersonajeClase`),
  INDEX (`idPersonaje`),
  INDEX (`idClase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajeRaza`
--

DROP TABLE IF EXISTS `personajeRaza`;
CREATE TABLE IF NOT EXISTS `personajeRaza` (
  `idPersonajeRaza` int(11) NOT NULL AUTO_INCREMENT,
  `idPersonaje` int(11) NOT NULL,
  `idRaza` int(11) NOT NULL,
  PRIMARY KEY (`idPersonajeRaza`),
  INDEX (`idPersonaje`),
  INDEX (`idRaza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pocion`
--

DROP TABLE IF EXISTS `pocion`;
CREATE TABLE IF NOT EXISTS `pocion` (
  `idPocion` int(11) NOT NULL AUTO_INCREMENT,
  `idPersonaje` int(11) NOT NULL,
  `idObjeto` int(11) NOT NULL,
  PRIMARY KEY (`idPocion`),
  INDEX (`idPersonaje`),
  INDEX (`idObjeto`),
  KEY `pocion_pocionCantidad_FK` (`idPocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pocionCantidad`
--

DROP TABLE IF EXISTS `pocionCantidad`;
CREATE TABLE IF NOT EXISTS `pocionCantidad` (
  `idPocionCantidad` int(11) NOT NULL AUTO_INCREMENT,
  `idPocion` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idPocionCantidad`),
  INDEX (`idPocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `raza`
--

DROP TABLE IF EXISTS `raza`;
CREATE TABLE IF NOT EXISTS `raza` (
  `idRaza` int(11) NOT NULL,
  `raza` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idRaza`),
  UNIQUE (`raza`),
  KEY `raza_personajeRaza_FK` (`idRaza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `raza`
--

-- INSERT INTO `raza` (`idRaza`, `raza`) VALUES
-- (),
-- ();

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE (`nombre`),
  KEY `usuario_personaje_FK` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioPersonaje`
--

DROP TABLE IF EXISTS `usuarioPersonaje`;
CREATE TABLE IF NOT EXISTS `usuarioPersonaje` (
  `idUsuarioPersonaje` int(11) NOT NULL AUTO_INCREMENT,
  `idPersonaje` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idUsuarioPersonaje`),
  INDEX (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `texto`
--

DROP TABLE IF EXISTS `texto`;
CREATE TABLE IF NOT EXISTS `texto` (
  `idTexto` int(11) NOT NULL,
  `texto` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idTexto`),
  KEY `texto_aventura_FK` (`idTexto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `texto`
--

-- INSERT INTO `texto` (`idTexto`, `texto`) VALUES
-- (),
-- ();

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

DROP TABLE IF EXISTS `tipo`;
CREATE TABLE IF NOT EXISTS `tipo` (
  `idTipo` int(11) NOT NULL,
  `tipo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idTipo`),
  UNIQUE (`tipo`),
  KEY `tipo_objetoTipo_FK` (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipo`
--

-- INSERT INTO `tipo` (`idTipo`, `tipo`) VALUES
-- (),
-- ();

-- --------------------------------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Restricciones para las tablas volcadas
--

--
-- Filtros para la tabla `avatar`
--
ALTER TABLE `avatar`
  ADD CONSTRAINT `avatar_personajeAvatar_FK` FOREIGN KEY (`idAvatar`) REFERENCES `personajeAvatar` (`idAvatar`);

ALTER TABLE `avatar`
  ADD CONSTRAINT `avatar_monstruoAvatar_FK` FOREIGN KEY (`idAvatar`) REFERENCES `monstruoAvatar` (`idAvatar`);

--
-- Filtros para la tabla `aventura`
--
ALTER TABLE `aventura`
  ADD CONSTRAINT `aventura_mapa_FK` FOREIGN KEY (`idAventura`) REFERENCES `mapa` (`idAventura`);

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `clase_personajeClase_FK` FOREIGN KEY (`idClase`) REFERENCES `personajeClase` (`idClase`);

--
-- Filtros para la tabla `habilidad`
--
ALTER TABLE `habilidad`
  ADD CONSTRAINT `habilidad_personaje_FK` FOREIGN KEY (`idHabilidad`) REFERENCES `habilidadPersonaje` (`idHabilidad`);

--
-- Filtros para la tabla `mapa`
--
ALTER TABLE `mapa`
  ADD CONSTRAINT `mapa_partida_FK` FOREIGN KEY (`idMapa`) REFERENCES `partida` (`idMapa`);

--
-- Filtros para la tabla `monstruo`
--
ALTER TABLE `monstruo`
  ADD CONSTRAINT `monstruo_avatar_FK` FOREIGN KEY (`idMonstruo`) REFERENCES `monstruoAvatar` (`idMonstruo`);

--
-- Filtros para la tabla `objeto`
--
ALTER TABLE `objeto`
  ADD CONSTRAINT `objeto_pocion_FK` FOREIGN KEY (`idObjeto`) REFERENCES `pocion` (`idObjeto`);

ALTER TABLE `objeto`
  ADD CONSTRAINT `objeto_inventarioPersonaje_armaEquipada_FK` FOREIGN KEY (`idObjeto`) REFERENCES `inventarioPersonaje` (`idObjeto`);

ALTER TABLE `objeto`
  ADD CONSTRAINT `objeto_inventarioPersonaje_armaduraEquipada_FK` FOREIGN KEY (`idObjeto`) REFERENCES `inventarioPersonaje` (`idObjeto`);

ALTER TABLE `objeto`
  ADD CONSTRAINT `objeto_objetoTipo_FK` FOREIGN KEY (`idObjeto`) REFERENCES `objetoTipo` (`idObjeto`);

--
-- Filtros para la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD CONSTRAINT `personaje_habilidades_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `habilidadPersonaje` (`idPersonaje`);

ALTER TABLE `personaje`
  ADD CONSTRAINT `personaje_usuario_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `usuarioPersonaje` (`idPersonaje`);

ALTER TABLE `personaje`
  ADD CONSTRAINT `personaje_pocion_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `pocion` (`idPersonaje`);

ALTER TABLE `personaje`
  ADD CONSTRAINT `personaje_partida_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `partida` (`idPersonaje`);

ALTER TABLE `personaje`
  ADD CONSTRAINT `personaje_raza_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `personajeRaza` (`idPersonaje`);

ALTER TABLE `personaje`
  ADD CONSTRAINT `personaje_clase_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `hpersonajeClase` (`idPersonaje`);

ALTER TABLE `personaje`
  ADD CONSTRAINT `personaje_avatar_FK` FOREIGN KEY (`idPersonaje`) REFERENCES `personajeAvatar` (`idPersonaje`);

--
-- Filtros para la tabla `pocion`
--
ALTER TABLE `pocion`
  ADD CONSTRAINT `pocion_pocionCantidad_FK` FOREIGN KEY (`idPocion`) REFERENCES `pocionCantidad` (`idPocion`);

--
-- Filtros para la tabla `raza`
--
ALTER TABLE `raza`
  ADD CONSTRAINT `raza_personajeRaza_FK` FOREIGN KEY (`idRaza`) REFERENCES `personajeRaza` (`idRaza`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_personaje_FK` FOREIGN KEY (`idUsuario`) REFERENCES `usuarioPersonaje` (`idUsuario`);

--
-- Filtros para la tabla `texto`
--
ALTER TABLE `texto`
  ADD CONSTRAINT `texto_aventura_FK` FOREIGN KEY (`idTexto`) REFERENCES `aventura` (`idTexto`);

--
-- Filtros para la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD CONSTRAINT `tipo_objetoTipo_FK` FOREIGN KEY (`idTipo`) REFERENCES `objetoTipo` (`idTipo`);
