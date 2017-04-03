function comprar(){
	var xhttp = new XMLHttpRequest();

	var armas = document.getElementById('arma');	
	var armaduras = document.getElementById('armadura').checked;	
	var pociones = document.getElementById('pocion').value;	
	var direccion = "compra.php?arma="+armas+"armadura="+armaduras+"pocion"+pociones;
		xhttp.open("POST", direccion, true);
		xhttp.send();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200){
		}	
	}	
	console.log('gracias por su compra, vuelva pronto');		
	console.log(armas,armaduras,pociones);
}
