<?php
	if(!empty($_POST) && isset($_POST)){
		require_once(dirname(dirname( __FILE__)) . "/model/personaje.php");
		
		$nombrePersonaje = $_POST['nombrePersonaje'];
		$fuerza = $_POST['fuerza'];
		$destreza = $_POST['destreza'];
		$inteligencia = $_POST['inteligencia'];
		$constitucion = $_POST['constitucion'];
		$vidaMax = ($constitucion*3);
		$vidaActual = $vidaMax;
		$acPersonaje = (10 + $destreza);
		$raza = $_POST['razaPersonaje'];
		$clase = $_POST['clasePersonaje'];
		$habilidad = $_POST['habilidadPersonaje'];
		// $avatar = $_POST['avatar'];
		
		$nuevoPersonaje = new nuevoPersonaje($nombrePersonaje, $fuerza, $destreza, $inteligencia, $constitucion, $vidaMax, $vidaActual, $acPersonaje, $raza, $clase, $habilidad);
		$nuevoPersonaje->crearNuevoPersonaje();
		
		// Redirección a la página de selección de personaje una vez se crea.
		header("Location: http://warcome.local/seleccionarPersonaje.php");
	}
?>