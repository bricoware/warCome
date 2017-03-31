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
		
		break;
		default:
			break;
	}

?>