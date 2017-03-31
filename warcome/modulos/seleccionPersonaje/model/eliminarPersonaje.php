<?php
	session_start();
	$idUsuario = $_SESSION['idUsuario'];
	$idPersonaje = $_GET['id'];
	
	require_once(dirname(dirname(dirname(dirname(__FILE__)))) . "/core/conector.php");
	
	try {
		$conexion = new conector();
		// Compruebo si el identificador coincide con el de un personaje que pertenece al usuario logueado.
		$consultaComprobacion = "SELECT idUsuario FROM usuariopersonaje WHERE usuariopersonaje.idPersonaje = \"$idPersonaje\";";
		$resultadoComprobacion = $conexion->getConector()->query($consultaComprobacion);
		if($resultadoComprobacion->num_rows != 1){
			throw new Exception('<p class="error">ERROR: No puede eliminar una partida de otro usuario.</p>');
		}
		
		$consulta = "CALL eliminarPersonaje(\"$idPersonaje\");";
		$resultado = $conexion->getConector()->query($consulta);
		if(!$resultado){
			throw new Exception('<p class="error">ERROR: Se ha producido un error al intentar borrar el personaje seleccionado.</p>');
		}
		header('Location: seleccionarPersonaje.php');
	} catch(Exception $mensaje){
		echo $mensaje->getMessage();
	}
?>