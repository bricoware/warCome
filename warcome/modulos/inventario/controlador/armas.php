<?php
	require_once(dirname(dirname(__FILE__))."/modelo/objeto.php");
	session_start();
	$session =  $_SESSION['idPersonaje'];
		$objeto = new objeto();
		$ids= $objeto->getIds($session);
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
