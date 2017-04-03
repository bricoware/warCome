<?php

	$_SESSION['personaje'] = 1; /* TESTING */
	
	require_once(dirname( dirname( __FILE__) )."/model/mapa.php");
	
	$mapa = new mapa($_SESSION['personaje']);
	$respuesta = $mapa->obtenerMapa();
	//var_dump($respuesta);
	while($registro = $respuesta->fetch_object()){
		//var_dump($registro);
		$_SESSION['posicion'] = $registro->posicion;
		$orden = explode(",", $registro->orden);
	}
	
?>