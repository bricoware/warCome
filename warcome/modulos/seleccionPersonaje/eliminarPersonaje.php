<?php
	$idPersonaje = $_GET['idPersonaje'];
	$conexion = new mysqli ("localhost","root","","warcome");
	$consulta = "DELETE nombrePersonaje FROM personaje WHERE idPersonaje = '".$idPersonaje."';";
	$resultado = $conexion->query($consulta);
?>