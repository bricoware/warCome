<?php
	session_start();
	$nombreUsuario = $_SESSION['usuario'];
	$conexion = new mysqli ("localhost","root","","warcome");
	$consulta = "DELETE nombrePersonaje FROM usuario INNER JOIN usuarioPersonaje ON usuario.idUsuario = usuarioPersonaje.idUsuario INNER JOIN personaje ON usuarioPersonaje.idPersonaje = personaje.idPersonaje WHERE nombreUsuario = '".$nombreUsuario."';";
	$resultado = $conexion->query($consulta);
?>