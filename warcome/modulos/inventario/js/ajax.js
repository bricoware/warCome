 function seleccionarArmadura(){
 	var armaduras = document.getElementById('armadura');

 	for(var i=0; i<armaduras.length; i++){
 		if(armaduras[i].selected){
 			var escogida = armaduras[i].value;

 		}
	}
	var objeto = "armadura";
	var xhttp = new XMLHttpRequest();
	var direccion = "controlador/actualizar.php?id="+escogida+"&opcion="+objeto;
  		xhttp.open("GET", direccion, true);
  		xhttp.send();
	 xhttp.onreadystatechange = function() {
    	if (this.readyState == 4 && this.status == 200) {
    		var recibido = this.responseText;
    		console.log(recibido);

    	}
	}

}
function seleccionarArma(){
 	var armas = document.getElementById('armas');

 	for(var i=0; i<armas.length; i++){
 		if(armas[i].selected){
 			var escogida = armas[i].value;

 		}
	}
	var objeto = "arma";
	var xhttp = new XMLHttpRequest();
	var direccion = "controlador/actualizar.php?id="+escogida+"&opcion="+objeto;
  		xhttp.open("GET", direccion, true);
  		xhttp.send();
	 xhttp.onreadystatechange = function() {
    	if (this.readyState == 4 && this.status == 200) {
    		var recibido = this.responseText;
    		console.log(recibido);

    	}
	}

}
