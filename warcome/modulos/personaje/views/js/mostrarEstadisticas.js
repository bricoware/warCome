function mostrarEstadisticasRaza(selectRaza){
	if(selectRaza.addEventListener){
		selectRaza.addEventListener("change", mostrarEstadisticas);
	} else {
		selectRaza.attachEvent("onchange", mostrarEstadisticas);
	}
}

function mostrarEstadisticasClase(selectClase){
	if(selectClase.addEventListener){
		selectClase.addEventListener("change", mostrarVida);
		selectClase.addEventListener("change", mostrarHabilidades);
	} else {
		selectClase.attachEvent("onchange", mostrarVida);
		selectClase.attachEvent("onchange", mostrarHabilidades);
	}
}