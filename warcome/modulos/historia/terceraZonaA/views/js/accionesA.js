function historiaA() {
	document.getElementById("pensamientos1").innerHTML = document.getElementById("batalla1").innerHTML;
	document.getElementById("batalla1").innerHTML = document.getElementById("batalla2").innerHTML;
	document.getElementById("batalla2").innerHTML = document.getElementById("batalla3").innerHTML;
	document.getElementById("batalla3").innerHTML = document.getElementById("batalla4").innerHTML;
	document.getElementById("batalla4").innerHTML = document.getElementById("volver").innerHTML;

}
function siguiente(){
  window.location= "../cuartaZona/index.php";
} 