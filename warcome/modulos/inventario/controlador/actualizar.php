<?php
	require_once(dirname(dirname(__FILE__))."/modelo/actualizar.php");
	$id = $_GET['id'];
	$opcion = $_GET['opcion'];
	switch ($opcion) {
		case 'armadura':
			$actualizar = new actualizar($id);
			$actualizacion = $actualizar->actualizarArmadura();
			if($actualizacion){
				echo "Armadura equipada";
			}
			break;
		case 'arma':
			$actualizar = new actualizar($id);
			$actualizacion = $actualizar->actualizarArma();
			if($actualizacion){
				echo "Arma equipada";
			}
			break;

		case 'pocion':
			$actualizar = new actualizar($id);
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
			if($vidaMax == $vidaActual){
				echo "-1";
			}else{
				$curacion = $pocion + $vidaActual;
				$respuesta = $cantidad - 1;
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
