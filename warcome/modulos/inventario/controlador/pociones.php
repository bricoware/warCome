<?php
	require_once(dirname(dirname(__FILE__))."/modelo/pocion.php");

	$session =  $_SESSION['idPersonaje'];
	$pocion = new pocion($session);
	$pociones = $pocion->getPociones();
	echo "<div id=PadrePociones>";
	while($datos = $pociones->fetch_assoc()){
		echo "<div id='".$datos['idObjeto']."'>".utf8_encode($datos['nombreObjeto'])."  <span>".$datos['cantidad']."</span> <input type='button' onclick='usarPocion(".$datos['idObjeto'].");' value='Usar'/></div>";
	}
	echo "</div>";
?>
