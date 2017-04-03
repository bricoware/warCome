function historia() {
    document.getElementById("caja1").innerHTML = document.getElementById("castillo").innerHTML;
	document.getElementById("castillo").innerHTML = document.getElementById("dialogo").innerHTML;
	document.getElementById("dialogo").innerHTML = document.getElementById("respuesta").innerHTML;
	document.getElementById("respuesta").innerHTML = document.getElementById("batalla").innerHTML;
	document.getElementById("batalla").innerHTML = document.getElementById("batalla1").innerHTML;
	document.getElementById("batalla1").innerHTML = document.getElementById("dialogo1").innerHTML;
	document.getElementById("dialogo1").innerHTML = document.getElementById("batalla2").innerHTML;
	document.getElementById("batalla2").innerHTML = document.getElementById("mercader").innerHTML;
	document.getElementById("mercader").innerHTML = document.getElementById("pensamientos0").innerHTML;
	document.getElementById("pensamientos0").innerHTML = document.getElementById("batalla3").innerHTML;
	document.getElementById("batalla3").innerHTML = document.getElementById("jardines").innerHTML;
	document.getElementById("jardines").innerHTML = document.getElementById("batalla4").innerHTML;
	document.getElementById("batalla4").innerHTML = document.getElementById("decisiones").innerHTML;
	document.getElementById("decisiones").innerHTML = document.getElementById("seleccionCamino").innerHTML;
}

function zonaA(){
	if(zonaA){
		window.location = "terceraZonaA/index.php"
	}
}
function zonaB(){
	if(zonaB){
		window.location = "terceraZonaB/index.php"
	}
}