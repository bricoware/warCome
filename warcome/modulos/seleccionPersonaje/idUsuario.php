<?php
	$nombreUsuario = $_SESSION['usuario'];
	$conexion = new mysqli("localhost","root","","warcome");
	$consulta = "SELECT * FROM usuario INNER JOIN usuarioPersonaje ON usuario.idUsuario = usuarioPersonaje.idUsuario INNER JOIN personaje ON usuarioPersonaje.idPersonaje = personaje.idPersonaje WHERE usuario.nombre = '".$nombreUsuario."'";
	$resultado = $conexion->query($consulta);
	while($fila = $resultado->fetch_object()){
		echo $fila->idUsuario." ".$fila->nombrePersonaje;
	}
?>	