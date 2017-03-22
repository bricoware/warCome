-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-03-2017 a las 10:54:14
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
--
-- Base de datos para "The Legend of Warcome": `warcome`
--
DROP DATABASE IF EXISTS `warcome`;
CREATE DATABASE IF NOT EXISTS `warcome` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `warcome`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avatar`
--

CREATE TABLE `avatar` (
  `idAvatar` int(11) NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `idClase` int(11) NOT NULL,
  `clase` varchar(25) NOT NULL,
  `dadoVida` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidad`
--

CREATE TABLE `habilidad` (
  `idHabilidad` int(11) NOT NULL,
  `nombreHabilidad` varchar(50) NOT NULL,
  `descripcionHabilidad` text,
  `danho` varchar(5) DEFAULT NULL,
  `estadisticaHabilidad` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidadpersonaje`
--

CREATE TABLE `habilidadpersonaje` (
  `idHabilidadPersonaje` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `idHabilidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mapa`
--

CREATE TABLE `mapa` (
  `idMapa` int(11) NOT NULL,
  `orden` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `posibilidadGolpear` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monstruoavatar`
--

CREATE TABLE `monstruoavatar` (
  `idMonstruoAvatar` int(11) NOT NULL,
  `idMonstruo` int(11) NOT NULL,
  `idAvatar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `valor2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetotipo`
--

CREATE TABLE `objetotipo` (
  `idObjetoTipo` int(11) NOT NULL,
  `idObjeto` int(11) NOT NULL,
  `idTipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajeavatar`
--

CREATE TABLE `personajeavatar` (
  `idPersonajeAvatar` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `idAvatar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajeclase`
--

CREATE TABLE `personajeclase` (
  `idPersonajeClase` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `idClase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajeraza`
--

CREATE TABLE `personajeraza` (
  `idPersonajeRaza` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `idRaza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pocion`
--

CREATE TABLE `pocion` (
  `idPocion` int(11) NOT NULL,
  `idPersonaje` int(11) NOT NULL,
  `idObjeto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pocioncantidad`
--

CREATE TABLE `pocioncantidad` (
  `idPocionCantidad` int(11) NOT NULL,
  `idPocion` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `raza`
--

CREATE TABLE `raza` (
  `idRaza` int(11) NOT NULL,
  `raza` varchar(25) NOT NULL,
  `estadisticaRaza` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `texto`
--

CREATE TABLE `texto` (
  `idTexto` int(11) NOT NULL,
  `texto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `idTipo` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  MODIFY `idAventura` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `habilidadpersonaje`
--
ALTER TABLE `habilidadpersonaje`
  MODIFY `idHabilidadPersonaje` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `inventariopersonaje`
--
ALTER TABLE `inventariopersonaje`
  MODIFY `idInventarioPersonaje` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mapa`
--
ALTER TABLE `mapa`
  MODIFY `idMapa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `monstruoavatar`
--
ALTER TABLE `monstruoavatar`
  MODIFY `idMonstruoAvatar` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `objetotipo`
--
ALTER TABLE `objetotipo`
  MODIFY `idObjetoTipo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `partida`
--
ALTER TABLE `partida`
  MODIFY `idPartida` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `personaje`
--
ALTER TABLE `personaje`
  MODIFY `idPersonaje` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `personajeavatar`
--
ALTER TABLE `personajeavatar`
  MODIFY `idPersonajeAvatar` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `personajeclase`
--
ALTER TABLE `personajeclase`
  MODIFY `idPersonajeClase` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `personajeraza`
--
ALTER TABLE `personajeraza`
  MODIFY `idPersonajeRaza` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pocion`
--
ALTER TABLE `pocion`
  MODIFY `idPocion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pocioncantidad`
--
ALTER TABLE `pocioncantidad`
  MODIFY `idPocionCantidad` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuariopersonaje`
--
ALTER TABLE `usuariopersonaje`
  MODIFY `idUsuarioPersonaje` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aventura`
--
ALTER TABLE `aventura`
  ADD CONSTRAINT `texto_aventura_FK` FOREIGN KEY (`idTexto`) REFERENCES `texto` (`idTexto`) ON UPDATE CASCADE;

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
