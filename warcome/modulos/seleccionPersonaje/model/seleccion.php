<?php
	session_start();
	$idUsuario = $_SESSION['idUsuario'];
	
	require_once($_SERVER['DOCUMENT_ROOT'] . "/core/conector.php");
	
	try {
		$conexion = new conector();
		$consulta = "SELECT personaje.idPersonaje, personaje.nombrePersonaje FROM personaje INNER JOIN usuarioPersonaje ON personaje.idPersonaje = usuarioPersonaje.idPersonaje WHERE usuarioPersonaje.idUsuario = \"$idUsuario\";";
		$resultado = $conexion->getConector()->query($consulta);
		if(!$resultado){
			throw new Exception('<p class="error">ERROR: Se ha producido un error al intentar recuperar tu lista de personajes desde la base de datos.</p>');
		}
	} catch(Exception $mensaje){
		echo $mensaje->getMessage();
	}
?>