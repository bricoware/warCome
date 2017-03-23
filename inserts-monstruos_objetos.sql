/* Insertar monstruos */

INSERT INTO `monstruo` (`idMonstruo`, `nombreMonstruo`, `ataqueMonstruo`, `acMonstruo`, `vidaMonstruo`, `xpOtorgada`, `posibilidadGolpear`, `oroOtorgado`) VALUES
(1, "KOBOLD", '1d4', 1, 30, 100, 0, 5),
(2, "GNOLL", '1d6', 2, 35, 200, 1, 5),
(3, "TROLL", '1d8', 3, 45, 300, 1, 5),
(4, "GIGANTE DE LA MONTAÑA", '1d10', 4, 100, 600, 2, 10),

(5, "FELHOUND (PERRO DE FUEGO)", '1d4', 1, 25, 100, 2, 10),
(6, "GÓLEM de LAVA", '1d6', 2, 35, 200, 2, 10),
(7, "ELEMENTAL DE FUEGO", '1d8', 3, 55, 350, 2, 10),
(8, "HIDRA DE FUEGO", '1d10', 4, 75, 500, 2, 10),

(9, "WITCH (LA BRUJA GRITONA)", '1d4', 1, 25, 200, 2, 15),
(10, "BANSHEE (FANTASMA)", '1d6', 2, 35, 300, 2, 15),
(11, "JINETE FANTASMA", '1d8', 3, 60, 400, 2, 15),
(12, "NAZGUL", '1d10', 4, 80, 500, 2, 20),

(13, "PIRAÑA GIGANTE", '1d4', 1, 25,150, 1, 20),
(14, "SERPIENTE DEL PANTANO", '1d6', 2, 35, 250, 1, 20),
(15, "TIBURÓN BLANCO", '1d8',3, 60, 500, 2, 20),
(16, "KRAKEN", '1d10', 4, 80, 700, 1, 25),

(17, "DRAGÓN FAÉRICO", '1d4', 1, 30, 200, 2, 25),
(18, "MURCIÉLAGO GIGANTE", '1d6', 2, 40, 300, 3, 25),
(19, "QUIMERA", '1d8', 3, 60, 600, 2, 25),
(20, "WYRM", '1d10', 4, 100, 800, 1, 30);

/* Insertar armas */

INSERT INTO `objeto` (`idObjeto`, `nombreObjeto`, `descripcionObjeto`, `estadistica1`, `valor1`, `estadistica2`, `valor2`, `precio`) VALUES
(1, "MAZA DE DOS MANOS", "MAZA DE DOS MANOS", "fuerza", 2, NULL, NULL, 10),
(2, "MAZA Y ESCUDO", "MAZA Y ESCUDO","fuerza", 2, "acPersonaje", 2, 10),
(3, "ESPADÓN", "ESPADÓN", "fuerza", 6, NULL, NULL, 15),
(4, "BASTÓN MÁGICO", "BASTON MAGICO", "inteligencia", 6, NULL, NULL, 15),
(5, "MANGUAL", "MANGUAL", "fuerza", 4, "inteligencia", 4, 15),
(6, "GRAN HACHA", "GRAN HACHA", "fuerza", 4, NULL, NULL, 10),
(7, "ARCO LARGO", "ARCO LARGO", "destreza", 4, NULL, NULL, 15),
(8, "GRAN BALLESTA", "GRAN BALLESTA", "destreza", 6, NULL, NULL, 20),
(9, "DAGA MÁGICA", "DAGA MÁGICA", "inteligencia", 4, "destreza", 4, 20),
(10, "GRAN VARITA", "GRAN VARITA", "inteligencia", 2, NULL, NULL, 25),
(11, "ESPADA Y GRAN ESCUDO", "GRAN ESCUDO", "fuerza", 2, "acPersonaje", 4, 30),
(24, "DAGA ARROJADIZA", "DAGA ARROJADIZA", "destreza", 2, "fuerza", 2, 30);

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
(19, "POCIÓN PEQUEÑA", "POCIÓN PEQUEÑA", "vidaActual", 10, NULL, NULL, 5),
(20, "POCIÓN NORMAL", "POCIÓN NORMAL", "vidaActual", 20, NULL, NULL, 15),
(21, "POCIÓN GRANDE", "POCIÓN GRANDE", "vidaActual", 40, NULL, NULL, 18),
(22, "SUPERPOCIÓN", "SUPERPOCIÓN", "vidaActual", 60, NULL, NULL, 20),
(23, "POCIÓN MÁXIMA", "POCIÓN MÁXIMA", "vidaActual", 100, NULL, NULL, 30),
(25, "POCIÓN DE FUERZA DE TORO", "POCIÓN FUERZA DE TORO", "fuerza", 4, NULL, NULL, 30),
(26, "POCIÓN DE AGILIDAD DE GATO", "POCIÓN DE AGILIDAD DE GATO", "destreza", 4, NULL, NULL, 30),
(27, "POCIÓN DE SABIDURIA DE BUHO", "POCIÓN DE SABIDURIA DE BUHO", "inteligencia", 4, NULL, NULL, 30);

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