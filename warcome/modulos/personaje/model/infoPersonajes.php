<?php
	require_once(dirname(dirname(dirname(dirname(__FILE__)))) . "/core/conector.php");
	
	try {
		$conexion = new conector();
		
		$consultaRaza = "SELECT * FROM raza;";
		$consultaClase = "SELECT * FROM clase;";
		// $consultaHabilidad = "SELECT * FROM habilidad;";
		$consultaAvatar = "SELECT * FROM avatar WHERE avatar.idAvatar < 39;";
		
		$resultadoRaza = $conexion->getConector()->query($consultaRaza);
		$resultadoClase = $conexion->getConector()->query($consultaClase);
		// $resultadoHabilidad = $conexion->getConector()->query($consultaHabilidad);
		$resultadoAvatar = $conexion->getConector()->query($consultaAvatar);
		
		if(!$resultadoRaza || !$resultadoClase || !$resultadoAvatar){ // || !$resultadoHabilidad){
			throw new Exception('<span class="error">ERROR: Se ha producido un error al intentar recuperar la lista de razas, clases o habilidades desde la base de datos.</span>');
		}
	} catch(Exception $mensaje){
		echo $mensaje->getMessage();
	}
?>