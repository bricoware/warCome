<?php
	require_once(dirname(dirname(__FILE__))."/modelo/armadura.php");	
		$idPersonaje = 1;
		$objeto = new objeto();

		$ids= $objeto->getIds($idPersonaje);
		while($datos = $ids->fetch_assoc()){
			$armaduras = $datos['objetosInventario'];
		}
		$idsArmaduras = explode(",",$armaduras);
		
		$armadura = $objeto->getArmaduras($idsArmaduras);
		 while($datos = $armadura->fetch_assoc()){

		 	if($datos['tipo']=="ARMADURA"){
		 		var_dump($datos);
		 	echo "<option value='".$datos['idObjeto']."'>".$datos['nombreObjeto']."  ".$datos['valores1']."  ".$datos['valores2']."</option>";
		 	
		 	}		 	
		 }

		
	



 ?>