--
-- Datos sobre razas, clases y habilidades
--

--
-- Volcado de datos para la tabla `clase`
--
INSERT INTO `clase` (`idClase`, `clase`, `dadoVida`) VALUES
(1, 'Guerrero', '1d10'),
(2, 'Sacerdote', '1d8'),
(3, 'Mago', '1d6'),
(4, 'Nigromante', '1d6'),
(5, 'Cazador', '1d8');

--
-- Volcado de datos para la tabla `habilidad`
--
INSERT INTO `habilidad` (`idHabilidad`, `nombreHabilidad`, `descripcionHabilidad`, `danho`, `estadisticaHabilidad`, `posibilidadGolpearHabilidad`) VALUES
-- Guerrero
(1, 'Colleja infernal', 'Concentra todo tu poder en la palma de la mano para asestar un golpe en la nuca.', '1d6', 'fuerza', 2),
(2, 'Patada sencillita', 'Haz aspavientos innecesarios para dar una patada poco vistosa.', '1d8', 'destreza', 1),
(3, 'Golpe de trasero metalizado', 'Aprieta fuerte tus nalgas y golpea de espaldas.', '1d4', 'constitucion', 3),
(4, 'Giro con doble tirabuzón hacia atrás', 'Gira rápidamente y presume de tus años compitiendo en salto sincronizado desde trampolín.', '2d6', 'inteligencia', 0),

-- Sacerdote
(5, 'Recitar la Biblia', 'Recita un fragmento de la Biblia para aturdir a tu oponente.', '2d4', 'destreza', 2),
(6, 'Canción de cuna', 'Duerme a tu oponente con canciones de misa.', '1d10', 'inteligencia', 1),
(7, 'Cruz malintencionada', 'Clava a tu oponente la cruz que llevas colgada del cuello.', '1d6', 'fuerza', 3),
(8, 'Enseñar patita por debajo de la falda', 'Haz insinuaciones impuras para despistar a tu oponente.', '1d8', 'constitucion', 0),

-- Mago
(9, 'Churrasco', 'Invoca un banquete lleno de churrasco para distraer, porque la comida puede a cualquiera.', '2d6', 'constitucion', 1),
(10, 'Congelamiento nivel 2', 'Deja helado a tu oponente mientras enseñas tu insignia de nivel 2.', '1d8', 'fuerza', 2),
(11, 'Convertir en Chocapic', 'Usa tus poderes de transfiguración para desayunarte a tu oponente con un tazón de leche caliente.', '1d4', 'destreza', 3),
(12, 'Al microondas', 'Un minuto y las entrañas de tu oponente irán explotando como palomitas en el microondas.', '2d6', 'inteligencia', 0),

-- Nigromante
(13, 'Mordisco a lo Walking Dead', 'Infecta a tu oponente con un virus zombie.', '1d4', 'inteligencia', 3),
(14, 'Lapidazo', 'Arroja la lápida de uno de tus antepasados que llevas guardada en el zurrón.', '2d6', 'fuerza', 1),
(15, 'Bola sombra de suricato satánico', 'Concentra y lanza una bola de energía contra tu oponente.', '2d4', 'destreza', 2),
(16, 'Extraer alma a ostias', 'Usa tus poderes de golpeo para absorber el alma de tu oponente.', '2d6', 'constitucion', 0),

-- Cazador
(17, 'Golpe a los huevos', 'Asesta un golpe bajo donde más duele.', '1d4', 'fuerza', 3),
(18, 'Corbata colombiana', 'Rodea a tu oponente y hazle una llave.', '1d8', 'destreza', 2),
(19, 'Trampa para ratones', 'Haz que tu oponente caiga en una trampa que lo inmovilice.', '1d10', 'inteligencia', 1),
(20, 'Locura transitoria', 'Sufres un periodo de enagenación mental transitoria para atacar indiscriminadamente.', '2d6', 'constitucion', 0);

--
-- Relaciones entre `habilidad` y `habilidadclase`
--
INSERT INTO `habilidadclase` (`idHabilidadClase`, `idClase`, `idHabilidad`) VALUES
-- Guerrero
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
-- Sacerdote
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
-- Mago
(9, 3, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
-- Nigromante
(13, 4, 13),
(14, 4, 14),
(15, 4, 15),
(16, 4, 16),
-- Cazador
(17, 5, 17),
(18, 5, 18),
(19, 5, 19),
(20, 5, 20);

--
-- Volcado de datos para la tabla `raza`
--
INSERT INTO `raza` (`idRaza`, `raza`, `estadistica1`, `valor1`, `estadistica2`, `valor2`) VALUES
(1, 'Humano', 'fuerza', 1, 'constitucion', -1),
(2, 'Enano', 'fuerza', 2, 'inteligencia', -2),
(3, 'Elfo lunar', 'destreza', 2, 'constitucion', -1),
(4, 'Semielfo', 'inteligencia', 2, 'constitucion', -2),
(5, 'Orco', 'fuerza', 2, 'inteligencia', -2);
