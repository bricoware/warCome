function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.childNodes[0].id);
	ev.target.draggable = false;
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
	while(ev.target.hasChildNodes()){
		ev.target.removeChild(ev.target.childNodes[0]);
	}
    ev.target.appendChild(document.getElementById(data));
	
	// Llevo el valor escogido al correspondiente campo oculto del formulario.
	var valorEscogido = document.getElementById(data).childNodes[0].nodeValue;
	ev.target.nextElementSibling.value = valorEscogido;
	
	// Oculto aquellos cuadrados arrastrados.
	var cuadrosArrastrados = document.getElementsByClassName("dado");
	for(var i = 0; i < cuadrosArrastrados.length; i++){
		if(!cuadrosArrastrados[i].draggable){
			cuadrosArrastrados[i].style.visibility = "hidden";
		}
	}
	
	eliminarEventos();
}

function eliminarEventos(){
	// Elimino los eventos de arrastre de aquellos cuadros cubiertos.
	var cuadrosCubiertos = document.getElementsByClassName("distribucion");
	for(var i = 0; i < cuadrosCubiertos.length; i++){
		if(cuadrosCubiertos[i].childNodes[0].className != "oculto"){
			if(cuadrosCubiertos[i].removeEventListener){
				cuadrosCubiertos[i].removeEventListener("drop", drop);
				cuadrosCubiertos[i].removeEventListener("dragover", allowDrop);
			} else {
				cuadrosCubiertos[i].detachEvent("ondrop", drop);
				cuadrosCubiertos[i].detachEvent("ondragover", allowDrop);
			}
		}
	}
}