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
        var div = document.getElementById("resultadoArmaArmadura");
    		div.innerHTML="Armadura cambiada";

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
        var div = document.getElementById("resultadoArmaArmadura");
        div.innerHTML="Arma cambiada";

    	}
	}

}

  function usarPocion(id){

  	var objeto = "pocion";
  	var xhttp = new XMLHttpRequest();
  	var direccion = "controlador/actualizar.php?id="+id+"&opcion="+objeto;
    		xhttp.open("GET", direccion, true);
    		xhttp.send();
  	 xhttp.onreadystatechange = function() {
      	if (this.readyState == 4 && this.status == 200) {
          var recibido = this.responseText;
          var div2 = document.getElementById(id);
          var div = document.getElementById("resultadoPocion");
          div.innerHTML="Pocion usada";

           if(recibido == "-1"){
            div.innerHTML = "Tu vida ya esta al maximo";
          }else{

          var num = recibido.substr(0,1);
          var cant = recibido.substr(1);

          if(num == "1"){
            var cantidad = div2.childNodes[1];
            cantidad.innerHTML = cant;
          }else{
            var cantidad = div2.childNodes[1];
            cantidad.innerHTML = cant;
            div.innerHTML = "Pocion usada.Tu vida ya esta al maximo";
          }
          if(cant == 0){
              div2.parentNode.removeChild(div2);
          }

        }
          /*else{
            alert("hola");
            var num = recibido.substr(0,1);
            var cant = recibido.substr(1);
              if(num == "0"){
                div2.parentNode.removeChild(div2);
                var cantidad = div2.childNodes[1];
                cantidad.innerHTML = recibido;
                div.innerHTML = "Pocion usada.Tu vida ya esta al maximo";
              }else{
                var cantidad = div2.childNodes[1];
                cantidad.innerHTML = recibido;
              }
      	}*/
  	   }

  }
}
