<?php
	// La sesión ya se inicia en el
	// módulo de comprobación de logueo.
	// session_start();
	$idUsuario = $_SESSION['idUsuario'];
	
	require_once(dirname(dirname(dirname(dirname(__FILE__)))) . "/core/conector.php");
	
	try {
		$conexion = new conector();
		$consulta = "SELECT personaje.idPersonaje, personaje.nombrePersonaje, avatar.avatar FROM personaje INNER JOIN usuarioPersonaje ON personaje.idPersonaje = usuarioPersonaje.idPersonaje INNER JOIN personajeAvatar ON usuarioPersonaje.idPersonaje = personajeAvatar.idPersonaje INNER JOIN avatar ON personajeAvatar.idAvatar = avatar.idAvatar WHERE usuarioPersonaje.idUsuario = \"$idUsuario\";";
		$resultado = $conexion->getConector()->query($consulta);
		if(!$resultado){
			throw new Exception('<p class="error">ERROR: Se ha producido un error al intentar recuperar tu lista de personajes desde la base de datos.</p>');
		}
	} catch(Exception $mensaje){
		echo $mensaje->getMessage();
	}
?>