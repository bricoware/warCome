function comprar(){
	var xhttp = new XMLHttpRequest();

	var armasRadio = document.getElementsByName('arma');	
	var armadurasRadio = document.getElementsByName('armadura');	
	var pocionesRadio = document.getElementsByName('pocion');	
	
	for(var i = 0; i < armasRadio.length; i++){
		if(armasRadio[i].checked){
			armas = armasRadio[i].value;
		}
	}
	for(var i = 0; i < armadurasRadio.length; i++){
		if(armadurasRadio[i].checked){
			armaduras = armadurasRadio[i].value;
		}
	}
	for(var i = 0; i < pocionesRadio.length; i++){
		if(pocionesRadio[i].checked){
			pociones = pocionesRadio[i].value;
		}
	}
	
	var direccion = "modulos/mercader/views/compra.php?arma="+armas+"&armadura="+armaduras+"&pocion="+pociones;
		xhttp.open("POST", direccion, true);
		xhttp.send();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200){
		}	
	}	
	console.log('gracias por su compra, vuelva pronto');		
	console.log(armas,armaduras,pociones);
}
