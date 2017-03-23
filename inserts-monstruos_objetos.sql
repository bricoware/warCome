/* Insertar monstruos */

INSERT INTO `monstruo` (`idMonstruo`, `nombreMonstruo`, `ataqueMonstruo`, `acMonstruo`, `vidaMonstruo`, `xpOtorgada`, `posibilidadGolpear`, `oroOtorgado`) VALUES
(1, "KOBOLD", '1d4', 1, 30, 10, 0, 5),
(2, "GNOLL", '1d6', 2, 35, 20, 1, 5),
(3, "TROLL", '1d8', 3, 45, 30, 1, 5),
(4, "GIGANTE DE LA MONTAÑA", '1d10', 4, 100, 60, 2, 10),

(5, "FELHOUND (PERRO DE FUEGO)", '1d4', 1, 25, 10, 2, 10),
(6, "GÓLEM de LAVA", '1d6', 2, 35, 20, 2, 10),
(7, "ELEMENTAL DE FUEGO", '1d8', 3, 55, 35, 2, 10),
(8, "HIDRA DE FUEGO", '1d10', 4, 75, 50, 2, 10),

(9, "WITCH (LA BRUJA GRITONA)", '1d4', 1, 25, 20, 2, 15),
(10, "BANSHEE (FANTASMA)", '1d6', 2, 35, 30, 2, 15),
(11, "JINETE FANTASMA", '1d8', 3, 60, 40, 2, 15),
(12, "NAZGUL", '1d10', 4, 80, 50, 2, 20),

(13, "PIRAÑA GIGANTE", '1d4', 1, 25,15, 1, 20),
(14, "SERPIENTE DEL PANTANO", '1d6', 2, 35, 25, 1, 20),
(15, "TIBURÓN BLANCO", '1d8',3, 60, 50, 2, 20),
(16, "KRAKEN", '1d10', 4, 80, 70, 1, 25),

(17, "DRAGÓN FAÉRICO", '1d4', 1, 30, 20, 2, 25),
(18, "MURCIÉLAGO GIGANTE", '1d6', 2, 40, 30, 3, 25),
(19, "QUIMERA", '1d8', 3, 60, 60, 2, 25),
(20, "WYRM", '1d10', 4, 100, 80, 1, 30);

/* Insertar armas */

INSERT INTO `objeto` (`idObjeto`, `nombreObjeto`, `descripcionObjeto`, `estadistica1`, `valor1`, `estadistica2`, `valor2`, `precio`) VALUES
(1, "MAZA DE DOS MANOS", "MAZA DE DOS MANOS", "fuerza", 10, NULL, NULL, 10),
(2, "MAZA Y ESCUDO", "MAZA Y ESCUDO","constitucion", 10, NULL, NULL, 10),
(3, "ESPADÓN", "ESPADÓN", "destreza", 10, NULL, NULL, 15),
(4, "BASTÓN MÁGICO", "BASTON MAGICO", "inteligencia", 15, NULL, NULL, 15),
(5, "MANGUAL", "MANGUAL", "fuerza", 5, "destreza", 5, 15),
(6, "GRAN HACHA", "GRAN HACHA", "fuerza", 15, NULL, NULL, 10),
(7, "ARCO LARGO", "ARCO LARGO", "destreza", 15, NULL, NULL, 15),
(8, "GRAN BALLESTA", "GRAN BALLESTA", "fuerza", 30, "destreza", -5, 20),
(9, "DAGA MÁGICA", "DAGA MÁGICA", "inteligencia", 10, NULL, NULL, 20),
(10, "GRAN VARITA", "GRAN VARITA", "inteligencia", 30, "constitucion", -5, 25),
(11, "GRAN ESCUDO", "GRAN ESCUDO", "fuerza", -5, "constitucion", 30, 30);

/* Insertar armaduras */

INSERT INTO `objeto` (`idObjeto`, `nombreObjeto`, `descripcionObjeto`, `estadistica1`, `valor1`, `estadistica2`, `valor2`, `precio`) VALUES
(12, "ARMADURA LIGERA", "ARMADURA LIGERA", "destreza", 2, "fuerza", 2, 15),
(13, "ARMADURA DE TELA", "ARMADURA DE TELA", "inteligencia", 10, "destreza", 5, 15),
(14, "ARMADURA DE CUERO", "ARMADURA DE CUERO", "inteligencia", 5, "destreza", 5, 10),
(15, "ARMADURA DE MALLAS", "ARMADURA DE MALLAS", "fuerza", 10,"destreza", 10, 10),
(16, "ARMADURA DE LÁMINAS", "ARMADURA DE LÁMINAS", "fuerza", 10,"destreza", 15, 20),
(17, "ARMADURA DE PLACAS", "ARMADURA DE PLACAS", "fuerza", 15,"constitucion", 10, 25),
(18, "ARMADURA DE CORAZA", "ARMADURA DE CORAZA", "constitucion", 30,"fuerza", 10, 30);

/* Insertar pociones */

INSERT INTO `objeto` (`idObjeto`, `nombreObjeto`, `descripcionObjeto`, `estadistica1`, `valor1`, `estadistica2`, `valor2`, `precio`) VALUES
(19, "POCIÓN PEQUEÑA", "POCIÓN PEQUEÑA", "vidaActual", 5, NULL, NULL, 5),
(20, "POCIÓN NORMAL", "POCIÓN NORMAL", "vidaActual", 10, NULL, NULL, 15),
(21, "POCIÓN GRANDE", "POCIÓN GRANDE", "vidaActual", 15, NULL, NULL, 18),
(22, "SUPERPOCIÓN", "SUPERPOCIÓN", "vidaActual", 25, NULL, NULL, 20),
(23, "POCIÓN MÁXIMA", "POCIÓN MÁXIMA", "vidaActual", 40, NULL, NULL, 30);

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
(23, 3);