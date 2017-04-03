<?php

	session_start();
	$_SESSION['idPersonaje'] = 1;		/* TESTING */
	$_SESSION['posicion'] = $_SESSION['posicion'] + 1;
	
	require_once(dirname( dirname( __FILE__) )."/model/guardar.php");
	
	$guardar = new guardar($_SESSION['idPersonaje'], $_SESSION['posicion']);
	$respuesta = $guardar->guardarPosicion();

?>