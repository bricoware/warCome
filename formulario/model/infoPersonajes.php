<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . "/core/conector.php");
	
	try {
		$conexion = new conector();
		
		$consultaRaza = "SELECT * FROM raza;";
		$consultaClase = "SELECT * FROM clase;";
		$consultaHabilidad = "SELECT * FROM habilidad;";
		
		$resultadoRaza = $conexion->getConector()->query($consultaRaza);
		$resultadoClase = $conexion->getConector()->query($consultaClase);
		$resultadoHabilidad = $conexion->getConector()->query($consultaHabilidad);
		
		if(!$resultadoRaza || !$resultadoClase || !$resultadoHabilidad){
			throw new Exception('<span class="error">ERROR: Se ha producido un error al intentar recuperar la lista de razas, clases o habilidades desde la base de datos.</span>');
		}
	} catch(Exception $mensaje){
		echo $mensaje->getMessage();
	}
?>