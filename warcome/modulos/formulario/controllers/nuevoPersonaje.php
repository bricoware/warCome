<?php
	
	if (isset($_POST)){
		
		require_once(dirname( dirname( __FILE__) )."/model/personaje.php");
		
		$nombrePersonaje = $_POST['nombrePersonaje'];
		$fuerza = $_POST['fuerza'];
		$destreza = $_POST['destreza'];
		$inteligencia = $_POST['inteligencia'];
		$constitucion = $_POST['constitucion'];
		$vidaMax = ($constitucion*3);
		$vidaActual = $vidaMax;
		$acPersonaje = (10 + $destreza);
		$oro = $_POST['oro'];
		
		$nuevoPersonaje = new nuevoPersonaje($nombrePersonaje, $fuerza, $destreza, $inteligencia, $constitucion, $vidaMax, $vidaActual, $acPersonaje, $oro);
		$nuevoPersonaje->crearNuevoPersonaje();
		
		/* En cuanto tengamos pantalla de selección de personaje hay q cambiar para que redirija ahí */
		header ("Location: http://warcome.local/index.php");
		
	}
	
?>