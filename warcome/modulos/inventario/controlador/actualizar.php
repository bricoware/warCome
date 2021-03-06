<?php

	session_start();

	$session =  $_SESSION['idPersonaje'];

	require_once(dirname(dirname(__FILE__))."/modelo/actualizar.php");
	$id = $_GET['id'];
	$opcion = $_GET['opcion'];
	switch ($opcion) {
		case 'armadura':
			$actualizar = new actualizar($id,$session);
			$actualizacion = $actualizar->actualizarArmadura();
			if($actualizacion){
				echo "Armadura equipada";
			}
			break;
		case 'arma':
			$actualizar = new actualizar($id,$session);
			$actualizacion = $actualizar->actualizarArma();
			if($actualizacion){
				echo "Arma equipada";
			}
			break;

		case 'pocion':
			$actualizar = new actualizar($id,$session);
			$vidas = $actualizar->comprobarVida();
			while($datos = $vidas->fetch_assoc()){
				$vidaMax = $datos['vidaMax'];
				$vidaActual = $datos['vidaActual'];
			}
			$pociones = $actualizar->comprobarPocion();
			while($datos = $pociones->fetch_assoc()){
				$pocion = $datos['valor1'];
				$cantidad = $datos['cantidad'];
			}			
			$cantidad2 = $cantidad-1;
			if($cantidad2 == 0){
				$actualizar->eliminarPocion();
			}
			if($vidaMax == $vidaActual){
				echo "-1";
			}else{
				$curacion = $pocion + $vidaActual;
				$respuesta = $cantidad-1;
				if($curacion >= $vidaMax){
					$actualizacion = $actualizar->beberPocion($vidaMax);
					echo "0".$respuesta;
				}else{
					$actualizacion = $actualizar->beberPocion($curacion);
					echo "1".$respuesta;
				}
			}
		break;
		default:
			break;
	}

?>
