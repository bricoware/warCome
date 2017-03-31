<?php 
	require_once(dirname(dirname(__FILE__))."/modelo/oro.php");
	$oro = new oro();
	$oroactual = $oro->getOro();
	while($datos = $oroactual->fetch_assoc()){
		echo "<span>".$datos['oro']."</span>";
	}


?>