function registrarUsuario(){
	var xhttp = new XMLHttpRequest();
	
	var direccion = "../controllers/registroUsuario.php";
	xhttp.open("POST", direccion, true);
	
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	var nombreRegistro = document.getElementById("nombreRegistro").value;
	var passRegistro = document.getElementById("passRegistro").value;
	var repitePass = document.getElementById("repitePass").value;
	
	var datos = "nombreRegistro=" + nombreRegistro + "&passRegistro=" + passRegistro + "&repitePass=" + repitePass;
	xhttp.send(datos);
	
	xhttp.onreadystatechange = comprobando;
}

function comprobando(){
	if (this.readyState == 4 && this.status == 200){
		var respuesta = document.getElementById("respuesta");
		
		respuesta.innerHTML = this.responseText;
	}
}