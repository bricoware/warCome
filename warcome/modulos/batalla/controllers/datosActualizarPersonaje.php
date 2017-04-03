<?php
			
	session_start();
	//$_SESSION['idPersonaje'] = 1; /* TESTING */
		
	//require_once(dirname( dirname( __FILE__) )."/model/actualizaPersonaje.php");
	require_once(dirname(dirname( dirname( __FILE__) ))."/batalla/model/actualizaPersonaje.php");
	
	$actualizaPersonaje = new actualizaPersonaje($_SESSION['idPersonaje'], $_POST['fuerza'], $_POST['destreza'], $_POST['inteligencia'], $_POST['constitucion'], $_POST['vidaMax'], $_POST['vidaActual'], $_POST['xp'], $_POST['nivel'], $_POST['acPersonaje'], $_POST['oro']);
	$respuesta = $actualizaPersonaje->actualizarPersonaje();
	
	//echo ($respuesta);
	
?>