<?php 
	require_once(dirname(dirname(__FILE__))."/modelo/pocion.php");
	$pocion = new pocion();
	$pociones = $pocion->getPociones();
	while($datos = $pociones->fetch_assoc()){
		echo "<div>".utf8_encode($datos['nombreObjeto'])."   ".$datos['cantidad']."</div>";
	}
?>