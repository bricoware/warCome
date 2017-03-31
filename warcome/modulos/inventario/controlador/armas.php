<?php
	require_once(dirname(dirname(__FILE__))."/modelo/armadura.php");	
		$idPersonaje = 1;
		$objeto = new objeto();
		$ids= $objeto->getIds($idPersonaje);
		while($datos = $ids->fetch_assoc()){
			$objetos = $datos['objetosInventario'];
		}
		$idsobjetos = explode(",",$objetos);
		$objeto = $objeto->getArmaduras($idsobjetos);
		 while($datos = $objeto->fetch_assoc()){
		 	if($datos['tipo']=="ARMA"){
		 	echo "<option value='".$datos['idObjeto']."'>".$datos['nombreObjeto']."  ".$datos['valores1']."  ".$datos['valores2']."</option>";
		 	}
		 }

		
	



 ?>