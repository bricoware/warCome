<?php
	// session_start();
	$idPersonaje = $_SESSION['idPersonaje'];
	
	require_once(dirname(dirname(dirname(dirname(__FILE__)))) . "/core/conector.php");
	
	try {
		$conexion = new conector();
		$consulta = "SELECT * FROM personaje WHERE personaje.idPersonaje = \"$idPersonaje\";";
		$resultado = $conexion->getConector()->query($consulta);
		$consultaHabilidad = "SELECT * FROM habilidad INNER JOIN habilidadpersonaje ON habilidad.idHabilidad = habilidadpersonaje.idHabilidad WHERE habilidadpersonaje.idPersonaje = \"$idPersonaje\";";
		$resultadoHabilidad = $conexion->getConector()->query($consultaHabilidad);
		$consultaRaza = "SELECT * FROM raza INNER JOIN personajeraza ON raza.idRaza = personajeraza.idRaza WHERE personajeraza.idPersonaje = \"$idPersonaje\";";
		$resultadoRaza = $conexion->getConector()->query($consultaRaza);
		$consultaClase = "SELECT * FROM clase INNER JOIN personajeclase ON clase.idClase = personajeclase.idClase WHERE personajeclase.idPersonaje = \"$idPersonaje\";";
		$resultadoClase = $conexion->getConector()->query($consultaClase);
		$consultaAvatar = "SELECT * FROM avatar INNER JOIN personajeavatar ON avatar.idAvatar = personajeavatar.idAvatar WHERE personajeavatar.idPersonaje = \"$idPersonaje\";";
		$resultadoAvatar = $conexion->getConector()->query($consultaAvatar);
		if(!$resultado || !$resultadoHabilidad || !$resultadoRaza || !$resultadoClase || !$resultadoAvatar){
			throw new Exception('<p class="error">ERROR: No se han podido recuperar todas las estadísticas del personaje.</p>');
		}
	} catch(Exception $mensaje){
		echo $mensaje->getMessage();
	}
?>