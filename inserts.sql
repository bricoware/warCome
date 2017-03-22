/* Insertar monstruos */

insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("KOBOLD",1d4,1,30,10);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("GNOLL",1d6,2,35,20);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("TROLL",1d8,3,45,30);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("GIGANTE DE LA MONTAÑA",1d10,4,100,60);

insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("FELHOUND(PERRO FUEGO)",1d4,1,25,10);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("GOLEM LAVA",1d6,2,35,20);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("ELEMENTAL DE FUEGO",1d8,3,55,35);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("HIDRA DE FUEGO",1d10,4,75,50);

insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("WITCH(BRUJA GRITONA)",1d4,1,25,20);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("BANSHEE(FANTASMA)",1d6,2,35,30);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("JINETE FANTASMA",1d8,3,60,40);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("NAZGUL",1d10,4,80,50);

insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("PIRAÑA GIGANTE",1d4,1,25,15);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("SERPIENTE PANTANO",1d6,2,35,25);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("TIBURON BLANCO",1d8,3,60,50);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("KRAKEN",1d10,4,80,70);

insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("DRAGON FAERICO",1d4,1,30,20);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("MURCIELAGO GIGANTE",1d6,2,40,30);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("QUIMERA",1d8,3,60,60);
insert into monstruo(nombreMonstruo,ataqueMonstruo,acMonstruo,vidaMonstruo,xpOtorgada) values ("WYRM",1d10,4,100,80);

/* Insertar armas */

insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1) values (1,"MAZA DE DOS MANOS","MAZA DE DOS MANOS","FUERZA",10);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1) values (2,"MAZA Y ESCUDO","MAZA Y ESCUDO","CONSTITUCION",10);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1) values (3,"ESPADON","ESPADON","DESTREZA",10);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1) values (4,"BASTON MAGICO","BASTON MAGICO","INTELIGENCIA",15);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1,estadistica2,valor2) values (5,"MANGUAL","MANGUAL","FUERZA",5,"DESTREZA",5);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1) values (6,"GRAN HACHA","GRAN HACHA","FUERZA",15);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1) values (7,"ARCO LARGO","ARCO LARGO","DESTREZA",15);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1,estadistica2,valor2) values (8,"GRAN BALLESTA","GRAN BALLESTA","FUERZA",30,"DESTREZA",-5);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1) values (9,"DAGA MAGICA","DAGA MAGICA","INTELIGENCIA",10);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1,estadistica2,valor2) values (10,"GRAN VARITA","GRAN VARITA","INTELIGENCIA",30,"CONSTITUCION",-5);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1,estadistica2,valor2) values (11,"GRAN ESCUDO","GRAN ESCUDO","FUERZA",-5,"CONSTITUCION",30);

/* Insertar armaduras */

insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1,estadistica2,valor2) values (12,"ARMADURA LIGERA","ARMADURA LIGERA","DESTREZA",2,"FUERZA",2);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1,estadistica2,valor2) values (13,"ARMADURA TELA","ARMADURA TELA","INTELIGENCIA",10,"DESTREZA",5);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1,estadistica2,valor2) values (14,"ARMADURA CUERO","ARMADURA CUERO","INTELIGENCIA",5,"DESTREZA",5);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1,estadistica2,valor2) values (15,"ARMADURA MALLAS","ARMADURA MALLAS","FUERZA",10,"DESTREZA",10);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1,estadistica2,valor2) values (16,"ARMADURA LAMINAS","ARMADURA LAMINAS","FUERZA",10,"DESTREZA",15);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1,estadistica2,valor2) values (17,"ARMADURA PLACAS","ARMADURA PLACAS","FUERZA",15,"CONSTITUCION",10);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1,estadistica2,valor2) values (18,"ARMADURA CORAZA","ARMADURA CORAZA","CONSTITUCION",30,"FUERZA",10);

/* Insertar pociones */

insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1) values (19,"POCION PEQUEÑA","POCION PEQUEÑA","VIDA",5);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1) values (20,"POCION NORMAL","POCION NORMAL","VIDA",10);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1) values (21,"POCION GRANDE","POCION GRANDE","VIDA",15);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1) values (22,"SUPERPOCION","SUPERPOCION","VIDA",25);
insert into objeto (idObjeto,nombreObjeto,descripcionObjeto,estadistica1,valor1) values (23,"POCION MAXIMA","POCION MAXIMA","VIDA",40);

/* Insertar relaciones objetoTipo */

insert into objetoTipo (idObjeto,idTipo) values (1,2);
insert into objetoTipo (idObjeto,idTipo) values (2,2);
insert into objetoTipo (idObjeto,idTipo) values (3,2);
insert into objetoTipo (idObjeto,idTipo) values (4,2);
insert into objetoTipo (idObjeto,idTipo) values (5,2);
insert into objetoTipo (idObjeto,idTipo) values (6,2);
insert into objetoTipo (idObjeto,idTipo) values (7,2);
insert into objetoTipo (idObjeto,idTipo) values (8,2);
insert into objetoTipo (idObjeto,idTipo) values (9,2);
insert into objetoTipo (idObjeto,idTipo) values (10,2);
insert into objetoTipo (idObjeto,idTipo) values (11,2);
insert into objetoTipo (idObjeto,idTipo) values (12,1);
insert into objetoTipo (idObjeto,idTipo) values (13,1);
insert into objetoTipo (idObjeto,idTipo) values (14,1);
insert into objetoTipo (idObjeto,idTipo) values (15,1);
insert into objetoTipo (idObjeto,idTipo) values (16,1);
insert into objetoTipo (idObjeto,idTipo) values (17,1);
insert into objetoTipo (idObjeto,idTipo) values (18,1);
insert into objetoTipo (idObjeto,idTipo) values (19,3);
insert into objetoTipo (idObjeto,idTipo) values (20,3);
insert into objetoTipo (idObjeto,idTipo) values (21,3);
insert into objetoTipo (idObjeto,idTipo) values (22,3);
insert into objetoTipo (idObjeto,idTipo) values (23,3);
