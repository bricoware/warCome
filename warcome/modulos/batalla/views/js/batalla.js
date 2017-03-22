/* -- Variables Globales -- */
var personaje;
var pociones;
var habilidades;
var monstruo;

personaje.push(bonusFuerza: 0);
personaje.push(bonusDestreza: 0);		/* Bonuses temporales por pociones, etc. */
personaje.push(bonusInteligencia: 0);

monstruo.push(dmgRecibido: 0);		/* Valor temporal para ver la vida que va perdiendo */

function comenzarBatalla(idMonstruo){
	var arrayPersonaje;
	var arrayMonstruo;
	
/* -- Recuperamos XML con info sobre el Personaje -- */
	if (Object.keys(personaje).length == 3){
		if (window.XMLHttpRequest) {
			var xhttp1 = new XMLHttpRequest();
		} else {
			var xhttp1 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xhttp1.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				xmlDoc = this.responseXML;

				arrayPersonaje = xmlDoc.getElementsByTagName("personaje");
			}
		}
		
		var direccion1 = "http://warcome/modulos/batalla/controllers/getPersonaje.php";
		
		xhttp1.open("POST", direccion1, true);
		xhttp1.setRequestHeader('Content-Type', 'text/xml');
		xhttp1.send();
	}
	
/* -- Recuperamos XML con info sobre el Monstruo -- */
	if (Object.keys(monstruo).length == 1){
		if (window.XMLHttpRequest) {
			var xhttp2 = new XMLHttpRequest();
		} else {
			var xhttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xhttp2.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				xmlDoc = this.responseXML;

				arrayMonstruo = xmlDoc.getElementsByTagName("monstruo");
			}
		}
		
		var direccion2 = "http://warcome/modulos/batalla/controllers/getMonstruo.php";
		
		xhttp2.open("POST", direccion2, true);
		xhttp2.setRequestHeader('Content-Type', 'text/xml');
		xhttp2.send();
	}
	
/* ---------- Metemos toda la info de los XML en variables para que sea más facil de acceder/modificar ---------- */
	if (Object.keys(personaje).length == 3){
		personaje = {
			nombrePersonaje: arrayPersonaje[0].children[0].firstChild.nodeValue,
			fuerza: arrayPersonaje[0].children[1].firstChild.nodeValue,
			destreza: arrayPersonaje[0].children[2].firstChild.nodeValue,
			inteligencia: arrayPersonaje[0].children[3].firstChild.nodeValue,
			constitucion: arrayPersonaje[0].children[4].firstChild.nodeValue,
			vidaMax: arrayPersonaje[0].children[5].firstChild.nodeValue,
			vidaActual: arrayPersonaje[0].children[6].firstChild.nodeValue,
			xp: arrayPersonaje[0].children[7].firstChild.nodeValue,
			acPersonaje: arrayPersonaje[0].children[8].firstChild.nodeValue,
			oro: arrayPersonaje[0].children[9].firstChild.nodeValue,
			avatar: arrayPersonaje[0].children[10].firstChild.nodeValue,
			armaEquipadaEstadistica1: arrayPersonaje[0].children[11].children[0].firstChild.nodeValue,
			armaEquipadaValor1: arrayPersonaje[0].children[11].children[1].firstChild.nodeValue,
			armaEquipadaEstadistica2: arrayPersonaje[0].children[11].children[2].firstChild.nodeValue,
			armaEquipadaValor2: arrayPersonaje[0].children[11].children[3].firstChild.nodeValue,
			armaduraEquipadaEstadistica1: arrayPersonaje[0].children[12].children[0].firstChild.nodeValue,
			armaduraEquipadaValor1: arrayPersonaje[0].children[12].children[1].firstChild.nodeValue,
			armaduraEquipadaEstadistica2: arrayPersonaje[0].children[12].children[2].firstChild.nodeValue,
			armaduraEquipadaValor2: arrayPersonaje[0].children[12].children[3].firstChild.nodeValue,
			nivel: arrayPersonaje[0].children[15].firstChild.nodeValue
		}
		
		pociones = [];
		for (var k = 0; k < arrayPersonaje[0].children[13].children.length; k++){ /* REVISAR!!! (un "children" de más??) */
			var pocion = {
				nombrePocion: arrayPersonaje[0].children[13].children[k].children[0].firstChild.nodeValue,
				descripcionPocion: arrayPersonaje[0].children[13].children[k].children[1].firstChild.nodeValue,
				pocionEstadistica1: arrayPersonaje[0].children[13].children[k].children[2].firstChild.nodeValue,
				pocionValor1: arrayPersonaje[0].children[13].children[k].children[3].firstChild.nodeValue,
				cantidad: arrayPersonaje[0].children[13].children[k].children[4].firstChild.nodeValue,
				idPocion: arrayPersonaje[0].children[13].children[k].children[5].firstChild.nodeValue
			}
			
			pociones.push(pocion);
		}
		
		habilidades = [];
		for (var l = 0; l < arrayPersonaje[0].children[14].children.length; l++){ /* REVISAR!!! (un "children" de más??) */
			var habilidad = {
				nombreHabilidad: arrayPersonaje[0].children[14].children[l].children[0].firstChild.nodeValue,
				descripcionHabilidad: arrayPersonaje[0].children[14].children[l].children[1].firstChild.nodeValue,
				dmg: arrayPersonaje[0].children[14].children[l].children[2].firstChild.nodeValue,
				idHabilidad: arrayPersonaje[0].children[14].children[l].children[3].firstChild.nodeValue,
				estadisticaHabilidad: arrayPersonaje[0].children[14].children[l].children[4].firstChild.nodeValue
			}
			
			habilidades.push(habilidad);
		}
	}
	
	if (Object.keys(monstruo).length == 1){
		monstruo = {
			monstruoID: idMonstruo,
			nombreMonstruo: arrayMonstruo[0].children[0].firstChild.nodeValue,
			ataqueMonstruo: arrayMonstruo[0].children[1].firstChild.nodeValue,
			acMonstruo: arrayMonstruo[0].children[2].firstChild.nodeValue,
			vidaMonstruo: arrayMonstruo[0].children[3].firstChild.nodeValue,
			xpOtorgada: arrayMonstruo[0].children[4].firstChild.nodeValue,
			avatar: arrayMonstruo[0].children[5].firstChild.nodeValue,
			posibilidadGolpear: arrayMonstruo[0].children[6].firstChild.nodeValue
		}
	}
	
/* -- Variables calculadas -- */
	
	personaje.push(modificadorFuerza: parseInt((personaje.fuerza + personaje.bonusFuerza - 10)/2));
	personaje.push(modificadorDestreza: parseInt((personaje.destreza + personaje.bonusDestreza - 10)/2));		/* Valores usados en cálculos de daño, etc. */
	personaje.push(modificadorInteligencia: parseInt((personaje.inteligencia + personaje.bonusInteligencia - 10)/2));
	
/* ---------- Ventana Modal ---------- */
	if (! document.getElementById("ventanaModal")){
		var ventanaModal = document.createElement("div");
			ventanaModal.id = "ventanaModal";
			ventanaModal.className = "modalBatallas";
		document.body.appendChild(ventanaModal);
	}
	
	while (ventanaModal.childlen.length > 0){
		ventanaModal.removeChild(ventanaModal.children[0]);
	}
	
	var contenidoModal = document.createElement("div");
		contenidoModal.className = "modal-contentBatallas";
		var divImagenPJ = document.createElement("div");
			divImagenPJ.id = "divImagenPJ";
			var divNombrePJ = document.createElement("div");
				divNombrePJ.id = "divNombrePJ";
				divNombrePJ.appendChild(document.createTextNode(personaje.nombrePersonaje));
			divImagenPJ.apppendChild(divNombrePJ);
			
			var imagenPJ = document.createElement("img");
				imagenPJ.src = personaje.avatar;
			divImagenPJ.appendChild(imagenPJ);
			
			var divHP = document.createElement("div");
				divHP.id = "divHP";
				divHP.appendChild(document.createTextNode("HP: " + personaje.vidaActual +
					" / " + personaje.vidaMax));
			divImagenPJ.appendChild(divHP);
		contenidoModal.appendChild(divImagenPJ);
		
		var divVs = document.createElement("div");
			divVs.id = "divVs";
			var imagenVs = document.createElement("img");
				imagenVs.src = "images/vs.png";
			divVs.appendChild(imagenVs);
		contenidoModal.appendChild(divVs);
		
		var divImagenMonstruo = document.createElement("div");
			divImagenMonstruo.id = "divImagenMonstruo";
			var divNombreMonstruo = document.createElement("div");
				divNombreMonstruo.id = "divNombreMonstruo";
				divNombreMonstruo.appendChild(document.createTextNode(monstruo.nombreMonstruo));
			divImagenMonstruo.apppendChild(divNombreMonstruo);
			
			var imagenMonstruo = document.createElement("img");
				imagenMonstruo.src = monstruo.avatar;
			divImagenMonstruo.appendChild(imagenMonstruo);
		contenidoModal.appendChild(divImagenMonstruo);
		
		var divBotones = document.createElement("div");
			divBotones.id = "divBotones";
			var divBotonAtaque = document.createElement("div");
				divBotonAtaque.id = "divBotonAtaque";
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
						divListaObjetos.appendChild(divHabilidad);
						if (divHabilidad.addEventListener) {
							divHabilidad.addEventListener("click", function(evento){elegirHabilidad(evento, i)});
						} else if (divHabilidad.attachEvent) {
							divHabilidad.attachEvent("onclick", function(evento){elegirHabilidad(evento, i)});
						}
					}
				divBotonObjetos.appendChild(divListaAtaques);
			divBotones.apppendChild(divBotonAtaque);
			
			var divBotonObjetos = document.createElement("div");
				divBotonObjetos.id = "divBotonObjetos";
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
							if (divHabilidad.addEventListener) {
								divHabilidad.addEventListener("click", function(evento){elegirPocion(evento, j)});
							} else if (divHabilidad.attachEvent) {
								divHabilidad.attachEvent("onclick", function(evento){elegirPocion(evento, j)});
							}
						}
					}
				divBotonObjetos.appendChild(divListaObjetos);
			divBotones.apppendChild(divBotonObjetos);
		contenidoModal.appendChild(divBotones);
		
		var divCombatLog = document.createElement("div");
			divCombatLog.id = "divCombatLog";
		contenidoModal.appendChild(divCombatLog);
		
	ventanaModal.appendChild(contenidoModal);
}

function elegirHabilidad(e, indice){
	var combatLog = document.getElementById("divCombatLog");
	
	if (habilidades[indice].estadisticaHabilidad == "fuerza"){
		if ( (dados("1d20") + personaje.modificadorFuerza) >= monstruo.acMonstruo){
			var dmgInfligido = dados(habilidades[indice].dmg) + personaje.modificadorFuerza;
			monstruo.dmgRecibido += dmgInfligido;
			combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": golpeó a " +
			monstruo.nombreMonstruo + " por " + dmgInfligido + " puntos de daño. <br/>";
		} else {
			if (dados(1d2) == 1){
				combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": el ataque falló. <br/>";
			} else if (dados(1d2) == 2){
				combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": " +
				monstruo.nombreMonstruo + "bloqueó el ataque. <br/>";
			}
		}
	} else if (habilidades[indice].estadisticaHabilidad == "destreza"){
		if ( (dados("1d20") + personaje.modificadorDestreza) >= monstruo.acMonstruo){
			var dmgInfligido = dados(habilidades[indice].dmg) + personaje.modificadorDestreza;
			monstruo.dmgRecibido += dmgInfligido;
			combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": golpeó a " +
			monstruo.nombreMonstruo + " por " + dmgInfligido + " puntos de daño. <br/>";
		} else {
			if (dados(1d2) == 1){
				combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": el ataque falló. <br/>";
			} else if (dados(1d2) == 2){
				combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": " +
				monstruo.nombreMonstruo + "bloqueó el ataque. <br/>";
			}
		}
	} else if (habilidades[indice].estadisticaHabilidad == "inteligencia"){
		if ( (dados("1d20") + personaje.modificadorInteligencia) >= monstruo.acMonstruo){
			var dmgInfligido = dados(habilidades[indice].dmg) + personaje.modificadorInteligencia;
			monstruo.dmgRecibido += dmgInfligido;
			combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": golpeó a " +
			monstruo.nombreMonstruo + " por " + dmgInfligido + " puntos de daño. <br/>";
		} else {
			if (dados(1d2) == 1){
				combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": el ataque falló. <br/>";
			} else if (dados(1d2) == 2){
				combatLog.innerHTML += personaje.nombrePersonaje + " usó " + habilidades[indice].nombreHabilidad + ": " +
				monstruo.nombreMonstruo + "bloqueó el ataque. <br/>";
			}
		}
	}
	
	if (monstruo.dmgRecibido >= monstruo.vidaMonstruo){
		monstruoEliminado();
	} else {
		rondaMonstruo();
	}
}

function elegirPocion(e, indice){
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
	} else {
		combatLog.innerHTML += personaje.nombrePersonaje + " consumió " + pociones[indice].nombrePocion + ": " + 
		pociones[indice].pocionEstadistica1 + " aumentada en " + pociones[indice].pocionValor1 + ". <br/>";
	}
	
	pociones[indice].cantidad = pociones[indice].cantidad - 1;
	
	rondaMonstruo();
}

function rondaMonstruo(){
	var combatLog = document.getElementById("divCombatLog");
	
	if ( (dados(1d20) + monstruo.posibilidadGolpear >= personaje.acPersonaje){
		var dmgInfligido = dados(monstruo.ataqueMonstruo);
		personaje.vidaActual = personaje.vidaActual - dmgInfligido;
		combatLog.innerHTML += monstruo.nombreMonstruo + " golpeó a " + personaje.nombrePersonaje + " por " +
		dmgInfligido + " puntos de daño. <br/>";
	} else {
		if (dados(1d2) == 1){
			combatLog.innerHTML += monstruo.nombreMonstruo + " intentó atacar a " + personaje.nombrePersonaje + ", pero falló. <br/>";
		} else if (dados(1d2) == 2){
			combatLog.innerHTML += monstruo.nombreMonstruo + " atacó, pero " + personaje.nombrePersonaje + " bloqueó el ataque. <br/>";
		}
	}
	
	if (personaje.vidaActual <= 0){
		personajeEliminado();
	} else {
		comenzarBatalla(monstruo.monstruoID);
	}
}

function monstruoEliminado(){
	personaje.xp += monstruo.xpOtorgada;
	var xpUmbral = 0;
	for (var n = (personaje.nivel - 2); n == 0; n--){
		xpUmbral += (personaje.nivel - n)*2000;
	}
	if (personaje.nivel < 5){
		if (personaje.xp >= (Math.pow(3, personaje.nivel)*100)){
			levelUp(personaje.nivel);
		}
	} else if (personaje.nivel <= 20){
		if (personaje.xp >= xpUmbral){
			levelUp(personaje.nivel);
		}
	}
	
}

function personajeEliminado(){
	return false;		/* Testear esto */
}

function levelUp(nivelActual){
	personaje.nivel = nivelActual + 1;
	
	
}




















