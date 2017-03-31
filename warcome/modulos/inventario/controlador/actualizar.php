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
			var_dump($vidas);
			while($datos = $vidas->fetch_array()){
				$vidaMax = $datos['vidaMax'];
				$vidaActual = $datos['vidaActual'];
			}
			$pocion = $actualizar->comprobarPocion();
			if($vidaMax == $vidaActual){
				echo "0";
			}else{
				$curacion = $pocion + $vidaActual;
				if($curacion >= $vidaMax){
					$actualizacion = $actualizar->beberPocion($vidaMax);
					echo "1";
				}else{
					$actualizacion = $actualizar->beberPocion($curacion);
					echo "2";
				}
			}
		break;
		default:
			break;
	}

?>
