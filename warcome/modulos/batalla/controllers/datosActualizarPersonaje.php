<?php
			
	session_start();
	$_SESSION['personaje'] = 1; /* TESTING */
		
	require_once(dirname( dirname( __FILE__) )."/model/actualizaPersonaje.php");
	
	$actualizaPersonaje = new actualizaPersonaje($_SESSION['personaje'], $_POST['fuerza'], $_POST['destreza'], $_POST['inteligencia'], $_POST['constitucion'], $_POST['vidaMax'], $_POST['vidaActual'], $_POST['xp'], $_POST['nivel'], $_POST['acPersonaje'], $_POST['oro']);
	$respuesta = $actualizaPersonaje->actualizarPersonaje();
	
	//echo ($respuesta);
	
?>