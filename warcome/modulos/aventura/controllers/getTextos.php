<?php

	session_start();
	//$_SESSION['posicion'] = 0; /* TESTING */
	
	require_once(dirname( dirname( __FILE__) )."/controllers/getMapa.php");
	
	require_once(dirname( dirname( __FILE__) )."/model/textos.php");
	
	$idTexto = $orden[$_SESSION['posicion']];
	
	$textos = new textos($idTexto);
	$respuesta = $textos->obtenerTextos();
	
	$div = 0;
	while($registro = $respuesta->fetch_object()){		/* NOTA: Ahora mismo solo hay un texto por zona así que esto no vale pa nada (pero tmp molesta) */
		
		if ($div == 0){
			echo ("<div id='".$div."texto' style='display:block' >".utf8_encode(html_entity_decode($registro->texto))."</div>");
		} else {
			echo ("<div id='".$div."texto' style='display:none' >".utf8_encode(html_entity_decode($registro->texto))."</div>");
		}
		
		$div++;
	}
	
?>