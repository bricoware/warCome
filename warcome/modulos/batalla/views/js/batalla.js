function comenzarBatalla(idMonstruo){
	var arrayPersonaje;
	var arrayMonstruo;
	
/* -- Recuperamos XML con info sobre el Personaje -- */
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
	
/* -- Recuperamos XML con info sobre el Monstruo -- */
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
	
/* ---------- Ventana Modal ---------- */
	var ventanaModal = document.createElement("div");
		ventanaModal.id = "ventanaModal";
		ventanaModal.className = "modal";
	document.body.appendChild(ventanaModal);
	
	while (ventanaModal.childlen.length > 0){
		ventanaModal.removeChild(ventanaModal.children[0]);
	}
	
	var contenidoModal = document.createElement("div");
		contenidoModal.className = "modal-content";
		var divImagenPJ = document.createElement("div");
			divImagenPJ.id = "divImagenPJ";
			var divNombrePJ = document.createElement("div");
				divNombrePJ.id = "divNombrePJ";
				divNombrePJ.appendChild(document.createTextNode(arrayPersonaje[0].children[0].firstChild.nodeValue));
			divImagenPJ.apppendChild(divNombrePJ);
			
			var imagenPJ = document.createElement("img");
				imagenPJ.src = arrayPersonaje[0].children[10].firstChild.nodeValue;
			divImagenPJ.appendChild(imagenPJ);
			
			var divHP = document.createElement("div");
				divHP.id = "divHP";
				divHP.appendChild(document.createTextNode("HP: " + arrayPersonaje[0].children[6].firstChild.nodeValue +
					" / " + arrayPersonaje[0].children[5].firstChild.nodeValue));
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
				divNombreMonstruo.appendChild(document.createTextNode(arrayMonstruo[0].children[0].firstChild.nodeValue));
			divImagenMonstruo.apppendChild(divNombreMonstruo);
			
			var imagenMonstruo = document.createElement("img");
				imagenMonstruo.src = arrayMonstruo[0].children[5].firstChild.nodeValue;
			divImagenMonstruo.appendChild(imagenMonstruo);
		contenidoModal.appendChild(divImagenMonstruo);
		
		var divBotones = document.createElement("div");
			divBotones.id = "divBotones";
			var divBotonAtaque = document.createElement("div");
				divBotonAtaque.id = "divBotonAtaque";
				var divListaAtaques = document.createElement("div");
					divListaAtaques.id = "divListaAtaques";
					for (var i = 0; i < arrayPersonaje[0].children[14].children.length; i++){
						var divHabilidad = document.createElement("div");
							divHabilidad.className = "habilidades";
							divHabilidad.style.height = (200/arrayPersonaje[0].children[13].children.length) + "px";
							var nombreHabilidad = document.createElement("div");
							
							divHabilidad.appendChild(nombreHabilidad);
						divListaObjetos.appendChild(divHabilidad);
					}
				divBotonObjetos.appendChild(divListaAtaques);
			divBotones.apppendChild(divBotonAtaque);
			
			var divBotonObjetos = document.createElement("div");
				divBotonObjetos.id = "divBotonObjetos";
				var divListaObjetos = document.createElement("div");
					divListaObjetos.id = "divListaObjetos";
					for (var i = 0; i < arrayPersonaje[0].children[13].children.length; i++){
						
					}
				divBotonObjetos.appendChild(divListaObjetos);
			divBotones.apppendChild(divBotonObjetos);
		contenidoModal.appendChild(divBotones);
		
		var divCombatLog = document.createElement("div");
			divCombatLog.id = "divCombatLog";
		contenidoModal.appendChild(divCombatLog);
		
	ventanaModal.appendChild(contenidoModal);
	
	
}




















