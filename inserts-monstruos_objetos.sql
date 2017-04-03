/* Insertar monstruos */

INSERT INTO `monstruo` (`idMonstruo`, `nombreMonstruo`, `ataqueMonstruo`, `acMonstruo`, `vidaMonstruo`, `xpOtorgada`, `posibilidadGolpear`, `oroOtorgado`) VALUES
(1, "KOBOLD", '1d6', 13, 10, 100, 3, 50),
(2, "GNOLL", '1d6', 15, 22, 200, 4, 100),
(3, "TROLL", '2d6', 17, 30, 400, 5, 200),
(4, "GIGANTE DE LA MONTAÑA", '2d10', 14, 52, 900, 6, 500),

(5, "FELHOUND (PERRO DE FUEGO)", '1d6', 11, 10, 100, 2, 53),
(6, "GÓLEM de LAVA", '2d4', 15, 16, 200, 4, 108),
(7, "ELEMENTAL DE FUEGO", '1d12', 16, 25, 400, 5, 201),
(8, "HIDRA DE FUEGO", '3d6', 18, 42, 900, 5, 510),

(9, "WITCH (LA BRUJA GRITONA)", '1d4', 12, 11, 100, 3, 49),
(10, "BANSHEE (FANTASMA)", '1d6', 18, 11, 200, 4, 112),
(11, "JINETE FANTASMA", '2d8', 12, 22, 400, 4, 198),
(12, "NAZGUL", '3d6', 12, 59, 900, 7, 500),

(13, "PIRAÑA GIGANTE", '1d6', 15, 9, 100, 4, 51),
(14, "SERPIENTE DEL PANTANO", '2d4', 12, 18, 200, 3, 97),
(15, "TIBURÓN BLANCO", '2d6', 16, 26, 400, 5, 210),
(16, "KRAKEN", '3d8', 12, 58, 900, 6, 512),

(17, "DRAGÓN FAÉRICO", '1d4', 16, 9, 100, 3, 55),
(18, "MURCIÉLAGO GIGANTE", '1d8', 15, 22, 200, 4, 99),
(19, "QUIMERA", '1d12', 17, 21, 400, 5, 192),
(20, "WYRM", '3d6', 6, 84, 900, 6, 520);
	/* NOTA: En cada grupito está balanceado el 1º monstruo para nivel de personaje (aprox) 1, el 2º para nivel 2, el 3º para nivel 4 y el 4º para nivel 8 */

/* Insertar armas */

INSERT INTO `objeto` (`idObjeto`, `nombreObjeto`, `descripcionObjeto`, `estadistica1`, `valor1`, `estadistica2`, `valor2`, `precio`) VALUES
(1, "MAZA DE DOS MANOS", "MAZA DE DOS MANOS", "fuerza", 1, NULL, NULL, 10),
(2, "MAZA Y ESCUDO", "MAZA Y ESCUDO","fuerza", 1, "acPersonaje", 1, 50),
(3, "ESPADÓN", "ESPADÓN", "fuerza", 3, NULL, NULL, 500),
(4, "BASTÓN MÁGICO", "BASTON MAGICO", "inteligencia", 3, NULL, NULL, 500),
(5, "MANGUAL", "MANGUAL", "fuerza", 2, "inteligencia", 2, 150),
(6, "GRAN HACHA", "GRAN HACHA", "fuerza", 2, NULL, NULL, 100),
(7, "ARCO LARGO", "ARCO LARGO", "destreza", 2, NULL, NULL, 100),
(8, "GRAN BALLESTA", "GRAN BALLESTA", "destreza", 3, NULL, NULL, 500),
(9, "DAGA MÁGICA", "DAGA MÁGICA", "inteligencia", 2, "destreza", 2, 150),
(10, "GRAN VARITA", "GRAN VARITA", "inteligencia", 1, NULL, NULL, 10),
(11, "ESPADA Y GRAN ESCUDO", "GRAN ESCUDO", "fuerza", 1, "acPersonaje", 2, 125),
(24, "DAGA ARROJADIZA", "DAGA ARROJADIZA", "destreza", 1, "fuerza", 1, 15);

/* Insertar armaduras */

INSERT INTO `objeto` (`idObjeto`, `nombreObjeto`, `descripcionObjeto`, `estadistica1`, `valor1`, `estadistica2`, `valor2`, `precio`) VALUES
(12, "ARMADURA LIGERA", "ARMADURA LIGERA", "acPersonaje", 1, NULL, NULL, 10),
(13, "ARMADURA DE TELA", "ARMADURA DE TELA", "acPersonaje", 0, "inteligencia", 1, 50),
(14, "ARMADURA DE CUERO", "ARMADURA DE CUERO", "acPersonaje", 2, NULL, NULL, 45),
(15, "ARMADURA DE MALLAS", "ARMADURA DE MALLAS", "acPersonaje", 3, NULL, NULL, 60),
(16, "ARMADURA DE LÁMINAS", "ARMADURA DE LÁMINAS", "acPersonaje", 3, "fuerza", 1, 200),
(17, "ARMADURA DE PLACAS", "ARMADURA DE PLACAS", "acPersonaje", 4, NULL, NULL, 400),
(18, "ARMADURA DE CORAZA", "ARMADURA DE CORAZA", "acPersonaje", 4, "fuerza", 1, 1000);

/* Insertar pociones */

INSERT INTO `objeto` (`idObjeto`, `nombreObjeto`, `descripcionObjeto`, `estadistica1`, `valor1`, `estadistica2`, `valor2`, `precio`) VALUES
(19, "POCIÓN PEQUEÑA", "POCIÓN PEQUEÑA", "vidaActual", 10, NULL, NULL, 50),
(20, "POCIÓN NORMAL", "POCIÓN NORMAL", "vidaActual", 20, NULL, NULL, 120),
(21, "POCIÓN GRANDE", "POCIÓN GRANDE", "vidaActual", 40, NULL, NULL, 280),
(22, "SUPERPOCIÓN", "SUPERPOCIÓN", "vidaActual", 60, NULL, NULL, 700),
(23, "POCIÓN MÁXIMA", "POCIÓN MÁXIMA", "vidaActual", 100, NULL, NULL, 1800),
(25, "POCIÓN DE FUERZA DE TORO", "POCIÓN FUERZA DE TORO", "fuerza", 3, NULL, NULL, 300),
(26, "POCIÓN DE AGILIDAD DE GATO", "POCIÓN DE AGILIDAD DE GATO", "destreza", 3, NULL, NULL, 300),
(27, "POCIÓN DE SABIDURIA DE BUHO", "POCIÓN DE SABIDURIA DE BUHO", "inteligencia", 3, NULL, NULL, 300);

/* Insertar tipos */

INSERT INTO `tipo` (`idTipo`, `tipo`) VALUES
(1, 'Armadura'),
(2, 'Arma'),
(3, 'Poción');

/* Insertar relaciones objetoTipo */

INSERT INTO `objetoTipo` (`idObjeto`, `idTipo`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 1),
(25, 3),
(26, 3),
(27, 3);