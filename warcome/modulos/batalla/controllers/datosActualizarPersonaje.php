<?php
			
	session_start();
		
	require_once(dirname( dirname( __FILE__) )."/model/actualizarPersonaje.php");
	
	$actualizaPersonaje = new actualizaPersonaje($_SESSION['personaje'], $_POST['fuerza'], $_POST['destreza'], $_POST['inteligencia'], $_POST['constitucion'], $_POST['vidaMax'], $_POST['vidaActual'], $_POST['xp'], $_POST['nivel'], $_POST['oro']);
	$actualizaPersonaje->actualizarPersonaje();
	
?>