function historia() {
	document.getElementById("pensamientos2").innerHTML = document.getElementById("batalla1").innerHTML;
	document.getElementById("batalla1").innerHTML = document.getElementById("batalla2").innerHTML;
	document.getElementById("batalla2").innerHTML = document.getElementById("batalla3").innerHTML;
	document.getElementById("batalla3").innerHTML = document.getElementById("volver").innerHTML;
}

function redireccionar(){
  window.location= "../cuartaZona/index.php";
} 
