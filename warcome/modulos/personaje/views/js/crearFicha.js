function crearFicha(){
	// Desactivo la tirada de dado en cuanto se pulsa el botón.
	var boton = document.getElementById("botonTirada");
	boton.disabled = true;
	
	// Hago 5 tiradas de 4d6 y muestro los cinco resultados obtenidos.
	var tirada = [];
	for(var i = 0; i < 5; i++){
		resultado = dados('4d6');
		tirada.push(resultado);
	}
	var dadosTirados = document.getElementById("dados");
	while(dadosTirados.hasChildNodes()){
		dadosTirados.removeChild(dadosTirados.childNodes[0]);
	}
	var instrucciones = document.createElement("p");
	instrucciones.style.fontStyle = "italic";
	var textoInstrucciones = document.createTextNode("Elige cuatro valores y arrástralos hasta las estadísticas que quieras para tu personaje.");
	instrucciones.appendChild(textoInstrucciones);
	dadosTirados.appendChild(instrucciones);
	for(var i = 0; i <  tirada.length; i++){
		var dado = document.createElement("div");
		dado.className = "dado";
		
		// Añado el evento para el "drag and drop".
		dado.draggable = true;
		if(dado.addEventListener){
			dado.addEventListener("dragstart", function(event){ drag(event); });
		} else {
			dado.attachEvent("ondragstart", function(event){ drag(event); });
		}
		
		var textoTirada = document.createElement("p");
		textoTirada.id = "tirada"+i;
		var valorDado = document.createTextNode(tirada[i]);
		textoTirada.appendChild(valorDado);
		dado.appendChild(textoTirada);
		dadosTirados.appendChild(dado);
	}
	
	// Finalmente, preparo también los destinos del "drag and drop".
	var destinos = document.getElementsByClassName("distribucion");
	for(var i = 0; i < destinos.length; i++){
		if(destinos[i].addEventListener){
			destinos[i].addEventListener("drop", function(event){ drop(event); });
			destinos[i].addEventListener("dragover", function(event){ allowDrop(event); });
		} else {
			destinos[i].attachEvent("ondrop", function(event){ drop(event); });
			destinos[i].attachEvent("ondragover", function(event){ allowDrop(event); });
		}
	}
}