<?php
	$nomePersonaje = $_POST['nomePersonaje'];
	$fuerza = $_POST['fuerza'];
	$destreza = $_POST['destreza'];
	$inteligencia = $_POST['inteligencia'];
	$constitucion = $_POST['constitucion'];
	$oro = $_POST['oro'];
	
	$conexion = new mysqli("localhost","root","","warcome");
	$consulta = "INSERT INTO personaje (nomePersonaje,fuerza,destreza,inteligencia,constitucion,oro) VALUES('/$nomePersonaje'/,'/$fuerza'/,'/$destreza'/,'/$inteligencia'/,'/$constitucion'/,'/$oro'/);";
	
	$resultado = $conexion->query($consulta);
?>