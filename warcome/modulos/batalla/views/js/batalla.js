
function comenzarBatalla(idMonstruo){
	
/* -- Recuperamos XML con info sobre el Personaje y el Monstruo -- */
		
	if (window.XMLHttpRequest) {
		var xhttp1 = new XMLHttpRequest();
	} else {
		var xhttp1 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	var direccion1 = "http://warcome.local/modulos/batalla/controllers/getPersonajeMonstruo.php?idMonstruo=" + idMonstruo;
	
	xhttp1.open("GET", direccion1, true);
	xhttp1.setRequestHeader('Content-Type', 'text/xml');
	xhttp1.send();
			
	xhttp1.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			xmlDoc = this.responseXML;
			
			var arrayPersonaje = xmlDoc.getElementsByTagName("personaje");
			
			var personaje = {
				"nombrePersonaje": arrayPersonaje[0].children[0].firstChild.nodeValue,
				"fuerza": arrayPersonaje[0].children[1].firstChild.nodeValue,
				"destreza": arrayPersonaje[0].children[2].firstChild.nodeValue,
				"inteligencia": arrayPersonaje[0].children[3].firstChild.nodeValue,
				"constitucion": arrayPersonaje[0].children[4].firstChild.nodeValue,
				"vidaMax": arrayPersonaje[0].children[5].firstChild.nodeValue,
				"vidaActual": arrayPersonaje[0].children[6].firstChild.nodeValue,
				"xp": arrayPersonaje[0].children[7].firstChild.nodeValue,
				"acPersonaje": arrayPersonaje[0].children[8].firstChild.nodeValue,
				"oro": arrayPersonaje[0].children[9].firstChild.nodeValue,
				"avatar": arrayPersonaje[0].children[10].firstChild.nodeValue,
				"armaEquipadaEstadistica1": arrayPersonaje[0].children[11].children[0].firstChild.nodeValue,
				"armaEquipadaValor1": arrayPersonaje[0].children[11].children[1].firstChild.nodeValue,
				//"armaEquipadaEstadistica2": arrayPersonaje[0].children[11].children[2].firstChild.nodeValue,
				//"armaEquipadaValor2": arrayPersonaje[0].children[11].children[3].firstChild.nodeValue,
				"armaduraEquipadaEstadistica1": arrayPersonaje[0].children[12].children[0].firstChild.nodeValue,
				"armaduraEquipadaValor1": arrayPersonaje[0].children[12].children[1].firstChild.nodeValue,
				//"armaduraEquipadaEstadistica2": arrayPersonaje[0].children[12].children[2].firstChild.nodeValue,
				//"armaduraEquipadaValor2": arrayPersonaje[0].children[12].children[3].firstChild.nodeValue,
				"nivel": arrayPersonaje[0].children[15].firstChild.nodeValue,
				"idPersonaje": arrayPersonaje[0].children[16].firstChild.nodeValue,
				"dadoVida": arrayPersonaje[0].children[17].firstChild.nodeValue
			}		
			
			//console.log(arrayPersonaje[0].children[15]);
			
			personaje.vidaInicial = personaje.vidaActual;	/* Por si hay que recargar la partida */
			
			personaje.bonusFuerza = 0;
			personaje.bonusDestreza = 0;		/* Bonuses temporales por pociones, etc. */
			personaje.bonusInteligencia = 0;
				
			/* -- Variables calculadas -- */
			
			personaje.modificadorFuerza = parseInt((personaje.fuerza + personaje.bonusFuerza - 10)/2);
			personaje.modificadorDestreza = parseInt((personaje.destreza + personaje.bonusDestreza - 10)/2);		/* Valores usados en cálculos de daño, etc. */
			personaje.modificadorInteligencia = parseInt((personaje.inteligencia + personaje.bonusInteligencia - 10)/2);
			
			
			var pociones = [];
			for (var k = 0; k < arrayPersonaje[0].children[13].children.length; k++){ /* REVISAR!!! (un "children" de más??) */
				var pocion = {
					"nombrePocion": arrayPersonaje[0].children[13].children[k].children[0].firstChild.nodeValue,
					"descripcionPocion": arrayPersonaje[0].children[13].children[k].children[1].firstChild.nodeValue,
					"pocionEstadistica1": arrayPersonaje[0].children[13].children[k].children[2].firstChild.nodeValue,
					"pocionValor1": arrayPersonaje[0].children[13].children[k].children[3].firstChild.nodeValue,
					"cantidad": arrayPersonaje[0].children[13].children[k].children[4].firstChild.nodeValue,
					"idPocion": arrayPersonaje[0].children[13].children[k].children[5].firstChild.nodeValue
				}
				
				pociones.push(pocion);
			}
			
			var habilidades = [];
			for (var l = 0; l < arrayPersonaje[0].children[14].children.length; l++){ /* REVISAR!!! (un "children" de más??) */
				var habilidad = {
					"nombreHabilidad": arrayPersonaje[0].children[14].children[l].children[0].firstChild.nodeValue,
					"descripcionHabilidad": arrayPersonaje[0].children[14].children[l].children[1].firstChild.nodeValue,
					"dmg": arrayPersonaje[0].children[14].children[l].children[2].firstChild.nodeValue,
					"idHabilidad": arrayPersonaje[0].children[14].children[l].children[3].firstChild.nodeValue,
					"estadisticaHabilidad": arrayPersonaje[0].children[14].children[l].children[4].firstChild.nodeValue,
					"posibilidadGolpearHabilidad": arrayPersonaje[0].children[14].children[l].children[5].firstChild.nodeValue
				}
				
				habilidades.push(habilidad);
			}
			
			var arrayMonstruo = xmlDoc.getElementsByTagName("monstruo");
			
			var monstruo = {
				"monstruoID": idMonstruo,
				"nombreMonstruo": arrayMonstruo[0].children[0].firstChild.nodeValue,
				"ataqueMonstruo": arrayMonstruo[0].children[1].firstChild.nodeValue,
				"acMonstruo": arrayMonstruo[0].children[2].firstChild.nodeValue,
				"vidaMonstruo": arrayMonstruo[0].children[3].firstChild.nodeValue,
				"xpOtorgada": arrayMonstruo[0].children[4].firstChild.nodeValue,
				"avatar": arrayMonstruo[0].children[5].firstChild.nodeValue,
				"posibilidadGolpear": arrayMonstruo[0].children[6].firstChild.nodeValue,
				"oroOtorgado": arrayMonstruo[0].children[7].firstChild.nodeValue
			}
			
			monstruo.dmgRecibido = 0;		/* Valor temporal para ver la vida que va perdiendo */
			
			crearVentana(personaje, pociones, habilidades, monstruo);
		}
	}
}

function crearVentana(personaje, pociones, habilidades, monstruo){
/* ---------- Ventana Modal ---------- */
	if (! document.getElementById("ventanaModal")){
		var ventanaModal = document.createElement("div");
			ventanaModal.id = "ventanaModal";
			ventanaModal.className = "modalBatallas";
			ventanaModal.style.display = "block";
			var contenidoModal = document.createElement("div");
				contenidoModal.className = "modal-contentBatallas";
			ventanaModal.appendChild(contenidoModal);
				
			var divCombatLog = document.createElement("div");
				divCombatLog.id = "divCombatLog";
				divCombatLog.className = "modal-contentBatallas";
				var ancla = document.createElement("div");
					ancla.id = "ancla";
					ancla.style.position = "fixed";		/* TESTEAR */
					ancla.style.bottom = "0";
				divCombatLog.appendChild(ancla);
			ventanaModal.appendChild(divCombatLog);
		document.body.appendChild(ventanaModal);
	}
	
	while (contenidoModal.children.length > 0){
		contenidoModal.removeChild(contenidoModal.children[0]);
	}

	var divImagenPJ = document.createElement("div");
		divImagenPJ.id = "divImagenPJ";
		divImagenPJ.style.background = "url(views/images/" + personaje.avatar + ") no-repeat";
		divImagenPJ.style.backgroundSize = "100% 100%";
		var divNombrePJ = document.createElement("div");
			divNombrePJ.id = "divNombrePJ";
			divNombrePJ.appendChild(document.createTextNode(personaje.nombrePersonaje));
		divImagenPJ.appendChild(divNombrePJ);
		
		var divHP = document.createElement("div");
			divHP.id = "divHP";
			divHP.appendChild(document.createTextNode("HP: " + personaje.vidaActual +
				" / " + personaje.vidaMax));
		divImagenPJ.appendChild(divHP);
	contenidoModal.appendChild(divImagenPJ);
	
	var divVs = document.createElement("div");
		divVs.id = "divVs";
		var imagenVs = document.createElement("img");
			imagenVs.src = "views/images/vs.png";
		divVs.appendChild(imagenVs);
	contenidoModal.appendChild(divVs);
	
	var divImagenMonstruo = document.createElement("div");
		divImagenMonstruo.id = "divImagenMonstruo";
		divImagenMonstruo.style.background = "url(views/images/" + monstruo.avatar + ") no-repeat";
		divImagenMonstruo.style.backgroundSize = "100% 100%";
		var divNombreMonstruo = document.createElement("div");
			divNombreMonstruo.id = "divNombreMonstruo";
			divNombreMonstruo.appendChild(document.createTextNode(monstruo.nombreMonstruo));
		divImagenMonstruo.appendChild(divNombreMonstruo);
	contenidoModal.appendChild(divImagenMonstruo);
	
	var divBotones = document.createElement("div");
		divBotones.id = "divBotones";
		var divBotonAtaque = document.createElement("div");
			divBotonAtaque.id = "divBotonAtaque";
			divBotonAtaque.appendChild(document.createTextNode("Atacar"));
			var divListaAtaques = document.createElement("div");
				divListaAtaques.id = "divListaAtaques";
				for (var i = 0; i < habilidades.length; i++){
					var divHabilidad = document.createElement("div");
						divHabilidad.id = habilidades[i].idHabilidad;
						divHabilidad.className = "habilidades";
						divHabilidad.style.height = (200/habilidades.length) + "px";
						var divNombreHabilidad = document.createElement("div");
							divNombreHabilidad.className = "nombreHabilidad";
							divNombreHabilidad.appendChild(document.createTextNode(habilidades[i].nombreHabilidad));
						divHabilidad.appendChild(divNombreHabilidad);
						
						var divDmgHabilidad = document.createElement("div");
							divDmgHabilidad.className = "dmgHabilidad";
							divDmgHabilidad.appendChild(document.createTextNode("Daño: " + habilidades[i].dmg + " " + habilidades[i].estadisticaHabilidad));
						divHabilidad.appendChild(divDmgHabilidad);
						
						var divDescripcionHabilidad = document.createElement("div");
							divDescripcionHabilidad.className = "descripcionHabilidad";
							divDescripcionHabilidad.appendChild(document.createTextNode(habilidades[i].descripcionHabilidad));
						divHabilidad.appendChild(divDescripcionHabilidad);
					divListaAtaques.appendChild(divHabilidad);
					if (divHabilidad.addEventListener) {
						divHabilidad.addEventListener("click", function(evento){elegirHabilidad(evento, this.id, personaje, pociones, habilidades, monstruo)});
					} else if (divHabilidad.attachEvent) {
						divHabilidad.attachEvent("onclick", function(evento){elegirHabilidad(evento, this.id, personaje, pociones, habilidades, monstruo)});
					}
				}
			divBotonAtaque.appendChild(divListaAtaques);
		divBotones.appendChild(divBotonAtaque);
		
		var divBotonObjetos = document.createElement("div");
			divBotonObjetos.id = "divBotonObjetos";
			divBotonObjetos.appendChild(document.createTextNode("Objetos"));
			var divListaObjetos = document.createElement("div");
				divListaObjetos.id = "divListaObjetos";
				for (var j = 0; j < pociones.length; j++){
					if (pociones[j].cantidad > 0){
						var divPocion = document.createElement("div");
							divPocion.id = pociones[j].idPocion;
							divPocion.className = "pociones";
							divPocion.style.height = (200/pociones.length) + "px";
							var divNombrePocion = document.createElement("div");
								divNombrePocion.className = "nombrePocion";
								divNombrePocion.appendChild(document.createTextNode(pociones[j].nombrePocion));
							divPocion.appendChild(divNombrePocion);
							
							var divCantidadPocion = document.createElement("div");
								divCantidadPocion.className = "cantidadPocion";
								divCantidadPocion.appendChild(document.createTextNode("Cantidad: " + pociones[j].cantidad));
							divPocion.appendChild(divCantidadPocion);
							
							var divDescripcionPocion = document.createElement("div");
								divDescripcionPocion.className = "descripcionPocion";
								if (pociones[j].pocionEstadistica1 == "vidaActual"){
									divDescripcionPocion.appendChild(document.createTextNode("Restaura " + pociones[j].pocionValor1 + " Puntos de Vida"));
								} else {
									divDescripcionPocion.appendChild(document.createTextNode("Aumenta temporalmente tu " + 
									pociones[j].pocionEstadistica1 + " " + pociones[j].pocionValor1 + " puntos"));
								}
							divPocion.appendChild(divDescripcionPocion);
						divListaObjetos.appendChild(divPocion);
						if (divPocion.addEventListener) {
							divPocion.addEventListener("click", function(evento){elegirPocion(evento, this.id, personaje, pociones, habilidades, monstruo)});
						} else if (divPocion.attachEvent) {
							divPocion.attachEvent("onclick", function(evento){elegirPocion(evento, this.id, personaje, pociones, habilidades, monstruo)});
						}
					}
				}
			divBotonObjetos.appendChild(divListaObjetos);
		divBotones.appendChild(divBotonObjetos);
	contenidoModal.appendChild(divBotones);
}

function elegirHabilidad(e, idHabilidad, personaje, pociones, habilidades, monstruo){
	var combatLog = document.getElementById("divCombatLog");
	scrollDown();
	
	for (var indice = 0; indice < habilidades.length; indice++){
		if (habilidades[indice].idHabilidad == idHabilidad){
			if (habilidades[indice].estadisticaHabilidad == "fuerza"){
				if ( (dados("1d20") + personaje.modificadorFuerza + habilidades[indice].posibilidadGolpearHabilidad) >= monstruo.acMonstruo){
					var dmgInfligido = dados(habilidades[indice].dmg) + personaje.modificadorFuerza;
					monstruo.dmgRecibido += dmgInfligido;
					combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": golpeó a " +
					monstruo.nombreMonstruo + " por " + dmgInfligido + " puntos de daño. <br/>";
					scrollDown();
				} else {
					if (dados("1d2") == 1){
						combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": el ataque falló. <br/>";
						scrollDown();
					} else if (dados("1d2") == 2){
						combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": " +
						monstruo.nombreMonstruo + "bloqueó el ataque. <br/>";
						scrollDown();
					}
				}
			} else if (habilidades[indice].estadisticaHabilidad == "destreza"){
				if ( (dados("1d20") + personaje.modificadorDestreza + habilidades[indice].posibilidadGolpearHabilidad) >= monstruo.acMonstruo){
					var dmgInfligido = dados(habilidades[indice].dmg) + personaje.modificadorDestreza;
					monstruo.dmgRecibido += dmgInfligido;
					combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": golpeó a " +
					monstruo.nombreMonstruo + " por " + dmgInfligido + " puntos de daño. <br/>";
					scrollDown();
				} else {
					if (dados("1d2") == 1){
						combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": el ataque falló. <br/>";
						scrollDown();
					} else if (dados("1d2") == 2){
						combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": " +
						monstruo.nombreMonstruo + "bloqueó el ataque. <br/>";
						scrollDown();
					}
				}
			} else if (habilidades[indice].estadisticaHabilidad == "inteligencia"){
				if ( (dados("1d20") + personaje.modificadorInteligencia + habilidades[indice].posibilidadGolpearHabilidad) >= monstruo.acMonstruo){
					var dmgInfligido = dados(habilidades[indice].dmg) + personaje.modificadorInteligencia;
					monstruo.dmgRecibido += dmgInfligido;
					combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": golpeó a " +
					monstruo.nombreMonstruo + " por " + dmgInfligido + " puntos de daño. <br/>";
					scrollDown();
				} else {
					if (dados("1d2") == 1){
						combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": el ataque falló. <br/>";
						scrollDown();
					} else if (dados("1d2") == 2){
						combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": " +
						monstruo.nombreMonstruo + "bloqueó el ataque. <br/>";
						scrollDown();
					}
				}
			}
		}
	}
	
	if (monstruo.dmgRecibido >= monstruo.vidaMonstruo){
		monstruoEliminado(personaje, pociones, habilidades, monstruo);
	} else {
		if (monstruo.dmgRecibido*2 >= monstruo.vidaMonstruo){
			combatLog.innerHTML += monstruo.nombreMonstruo + "parece herido. <br/>";
			scrollDown();
		} else if (parseInt(monstruo.dmgRecibido*4/3) >= monstruo.vidaMonstruo){
			combatLog.innerHTML += monstruo.nombreMonstruo + "está gravemente herido. <br/>";
			scrollDown();
		}
		rondaMonstruo(personaje, pociones, habilidades, monstruo);
	}
}

function elegirPocion(e, idPocion, personaje, pociones, habilidades, monstruo){
	if (pociones[indice].pocionEstadistica1 == "vidaActual"){
		if (personaje.vidaActual + pociones[indice].pocionValor1 < personaje.vidaMax){
			personaje.vidaActual += pociones[indice].pocionValor1;
		} else {
			personaje.vidaActual = personaje.vidaMax;
		}
	} else if (pociones[indice].pocionEstadistica1 == "fuerza"){
		personaje.bonusFuerza += pociones[indice].pocionValor1;
	} else if (pociones[indice].pocionEstadistica1 == "destreza"){
		personaje.bonusDestreza += pociones[indice].pocionValor1;
	} else if (pociones[indice].pocionEstadistica1 == "inteligencia"){
		personaje.bonusInteligencia += pociones[indice].pocionValor1;
	}
	
	var combatLog = document.getElementById("divCombatLog");
	if (personaje.vidaActual + pociones[indice].pocionValor1 < personaje.vidaMax){
		combatLog.innerHTML += personaje.nombrePersonaje + " consumió " + pociones[indice].nombrePocion + ": " + 
		pociones[indice].pocionValor1 + "Puntos de Vida restaurados. <br/>";
		scrollDown();
	} else {
		combatLog.innerHTML += personaje.nombrePersonaje + " consumió " + pociones[indice].nombrePocion + ": " + 
		pociones[indice].pocionEstadistica1 + " aumentada en " + pociones[indice].pocionValor1 + ". <br/>";
		scrollDown();
	}
	
	pociones[indice].cantidad = pociones[indice].cantidad - 1;
	
	rondaMonstruo(personaje, pociones, habilidades, monstruo);
}

function rondaMonstruo(personaje, pociones, habilidades, monstruo){
	var combatLog = document.getElementById("divCombatLog");
	scrollDown();
	
	if ( (dados("1d20") + monstruo.posibilidadGolpear) >= personaje.acPersonaje){
		var dmgInfligido = dados(monstruo.ataqueMonstruo);
		personaje.vidaActual = personaje.vidaActual - dmgInfligido;
		combatLog.innerHTML += monstruo.nombreMonstruo + " golpeó a " + personaje.nombrePersonaje + " por " +
		dmgInfligido + " puntos de daño. <br/>";
		scrollDown();
	} else {
		if (dados("1d2") == 1){
			combatLog.innerHTML += monstruo.nombreMonstruo + " intentó atacar a " + personaje.nombrePersonaje + ", pero falló. <br/>";
			scrollDown();
		} else if (dados("1d2") == 2){
			combatLog.innerHTML += monstruo.nombreMonstruo + " atacó, pero " + personaje.nombrePersonaje + " bloqueó el ataque. <br/>";
			scrollDown();
		}
	}
	
	if (personaje.vidaActual <= 0){
		personajeEliminado(personaje, pociones, habilidades, monstruo);
	} else {
		crearVentana(personaje, pociones, habilidades, monstruo);
	}
}

function monstruoEliminado(personaje, pociones, habilidades, monstruo){
	personaje.oro += monstruo.oroOtorgado;
	
	var combatLog = document.getElementById("divCombatLog");
	combatLog.innerHTML += personaje.nombrePersonaje + " encontró " + monstruo.oroOtorgado + " piezas de oro. <br/>";
	scrollDown();
	
	personaje.xp += monstruo.xpOtorgada;
	
	combatLog.innerHTML += personaje.nombrePersonaje + " ganó " + monstruo.xpOtorgada + " puntos de experiencia. <br/>";
	scrollDown();
	
	var xpUmbral = 0;
	for (var n = (personaje.nivel - 2); n == 0; n--){
		xpUmbral += (personaje.nivel - n)*2000;
	}
	if (personaje.nivel < 5){
		if (personaje.xp >= (Math.pow(3, personaje.nivel)*100)){
			levelUp(personaje, pociones, habilidades, monstruo);
		}
	} else if (personaje.nivel <= 20){
		if (personaje.xp >= xpUmbral){
			levelUp(personaje, pociones, habilidades, monstruol);
		}
	}
	
	combatLog.innerHTML += "Clica en cualquier parte de la ventana para continuar...";
	scrollDown();
	var ventanaModal = document.getElementById("ventanaModal");
	
	if (ventanaModal.addEventListener) {
		ventanaModal.addEventListener("click", function(evento){terminarBatalla(evento, this)});
	} else if (ventanaModal.attachEvent) {
		ventanaModal.attachEvent("onclick", function(evento){terminarBatalla(evento, this)});
	}
}

function personajeEliminado(){
	var combatLog = document.getElementById("divCombatLog");
	combatLog.innerHTML += personaje.nombrePersonaje + "ha muerto de forma horrible. <br/>";
	scrollDown();
	
	combatLog.innerHTML += "Clica en cualquier parte de la ventana para recargar la partidad desde el último punto de guardado...";
	scrollDown();
	var ventanaModal = document.getElementById("ventanaModal");
	
	if (ventanaModal.addEventListener) {
		ventanaModal.addEventListener("click", function(evento){gameOver(evento, this, personaje, pociones, habilidades, monstruo)});
	} else if (ventanaModal.attachEvent) {
		ventanaModal.attachEvent("onclick", function(evento){gameOver(evento, this, personaje, pociones, habilidades, monstruo)});
	}	
}

function levelUp(personaje, pociones, habilidades, monstruo){
	personaje.nivel = personaje.nivel + 1;
	
	var combatLog = document.getElementById("divCombatLog");
	combatLog.innerHTML += personaje.nombrePersonaje + "subió de nivel: Nivel  " + personaje.nivel + ". <br/>";
	scrollDown();
	
	if ((personaje.nivel + 3)%5 == 0){
		/* Stat más alto */
		if (personaje.fuerza > personaje.destreza && personaje.fuerza > personaje.inteligencia){
			personaje.fuerza++;
			combatLog.innerHTML += "La fuerza de " + personaje.nombrePersonaje + " aumentó en 1. <br/>";
			scrollDown();
		} else if (personaje.destreza > personaje.fuerza && personaje.destreza > personaje.inteligencia){
			personaje.destreza++;
			combatLog.innerHTML += "La destreza de " + personaje.nombrePersonaje + " aumentó en 1. <br/>";
			scrollDown();
		} else if (personaje.inteligencia > personaje.destreza && personaje.inteligencia > personaje.fuerza){
			personaje.inteligencia++;
			combatLog.innerHTML += "La inteligencia de " + personaje.nombrePersonaje + " aumentó en 1. <br/>";
			scrollDown();
		}
	}
	
	if ((personaje.nivel + 2)%5 == 0){
		/* 2º stat más alto */
		if ((personaje.fuerza > personaje.destreza || personaje.fuerza > personaje.inteligencia) && !(personaje.fuerza > personaje.destreza && personaje.fuerza > personaje.inteligencia)){
			personaje.fuerza++;
			combatLog.innerHTML += "La fuerza de " + personaje.nombrePersonaje + " aumentó en 1. <br/>";
			scrollDown();
		} else if ((personaje.destreza > personaje.fuerza || personaje.destreza > personaje.inteligencia) && !(personaje.destreza > personaje.fuerza && personaje.destreza > personaje.inteligencia)){
			personaje.destreza++;
			combatLog.innerHTML += "La destreza de " + personaje.nombrePersonaje + " aumentó en 1. <br/>";
			scrollDown();
			if (personaje.destreza%2 == 0){
				personaje.acPersonaje++;
			}
		} else if ((personaje.inteligencia > personaje.destreza || personaje.inteligencia > personaje.fuerza) && !(personaje.inteligencia > personaje.destreza && personaje.inteligencia > personaje.fuerza)){
			personaje.inteligencia++;
			combatLog.innerHTML += "La inteligencia de " + personaje.nombrePersonaje + " aumentó en 1. <br/>";
			scrollDown();
		}
	}
	
	if ((personaje.nivel + 1)%5 == 0){
		personaje.constitucion++;
		combatLog.innerHTML += "La constitución de " + personaje.nombrePersonaje + " aumentó en 1. <br/>";
		scrollDown();
	}
	
	if (personaje.nivel%5 == 0){
		elegirHabilidades(personaje.idPersonaje);
		combatLog.innerHTML += personaje.nombrePersonaje + " aprendió una nueva habilidad. <br/>";
		scrollDown();
	}
	
	if ((personaje.nivel + 4)%5 == 0){
		/* Stat más bajo */
		if (personaje.fuerza < personaje.destreza && personaje.fuerza < personaje.inteligencia){
			personaje.fuerza++;
			combatLog.innerHTML += "La fuerza de " + personaje.nombrePersonaje + " aumentó en 1. <br/>";
			scrollDown();
		} else if (personaje.destreza < personaje.fuerza && personaje.destreza < personaje.inteligencia){
			personaje.destreza++;
			combatLog.innerHTML += "La destreza de " + personaje.nombrePersonaje + " aumentó en 1. <br/>";
			scrollDown();
			if (personaje.destreza%2 == 0){
				personaje.acPersonaje++;
			}
		} else if (personaje.inteligencia < personaje.destreza && personaje.inteligencia < personaje.fuerza){
			personaje.inteligencia++;
			combatLog.innerHTML += "La inteligencia de " + personaje.nombrePersonaje + " aumentó en 1. <br/>";
			scrollDown();
		}
	}
	
	var aumentoVida = dados(personaje.dadoVida) + parseInt((personaje.constitucion - 10)/2);
	personaje.vidaMax += aumentoVida;
	personaje.vidaActual += aumentoVida;
	combatLog.innerHTML += "Los Puntos de Vida de " + personaje.nombrePersonaje + " aumentaron en " + aumentoVida + " puntos. <br/>";
	scrollDown();
}

function terminarBatalla(ventanaModal, personaje, pociones, habilidades, monstruo){
	ventanaModal.style.display = "none";
	
	if (window.XMLHttpRequest) {
		var xhttp = new XMLHttpRequest();
	} else {
		var xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	var direccion = "http://warcome/modulos/batalla/controllers/datosActualizarPersonaje.php";
	var datos = "fuerza = " + personaje.fuerza + "destreza = " + personaje.destreza + "inteligencia = " + personaje.inteligencia + 
				"constitucion = " + personaje.constitucion + "vidaMax = " + personaje.vidaMax + "vidaActual = " + personaje.vidaActual + 
				"xp = " + personaje.xp + "nivel = " + personaje.nivel + "acPersonaje = " + personaje.acPersonaje + "oro = " + personaje.oro;
	
	xhttp.open("POST", direccion, true);
	xhttp.send(datos);
	
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			console.log(this.responseText);
		}
	}
	
	for (var p = 0; p < pociones.length; p++){
		if (window.XMLHttpRequest) {
			var xhttp = new XMLHttpRequest();
		} else {
			var xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		var direccion = "http://warcome.local/modulos/batalla/controllers/datosActualizarPociones.php";
		var datos = "idPocion = " + pociones[p].idPocion + "cantidad = " + pociones[p].cantidadPocion; 
		
		xhttp.open("POST", direccion, true);
		xhttp.send(datos);
		
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				console.log(this.responseText);
			}
		}
	}
	
	document.body.removeChild(document.body, ventanaModal);		/* Eliminamos la ventana modal */
}

function gameOver(ventanaModal){
	ventanaModal.style.display = "none";
	
	document.body.removeChild(document.body, ventanaModal);		/* Eliminamos la ventana modal */
	
	cargarPartida(personaje.idPersonaje);		/* Placeholder, no sé como se llamará la función que carga la partida */
	
}

function scrollDown(){
	var ancla = document.getElementById("ancla");
	
	ancla.scrollIntoView(false);		/* TESTEAR!! Si funciona llamar la función tras cada consoleLog.innerHTML */
}


















