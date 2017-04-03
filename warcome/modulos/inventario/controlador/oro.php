<?php
	require_once(dirname(dirname(__FILE__))."/modelo/oro.php");

	$session =  $_SESSION['idPersonaje'];
	$oro = new oro($session);
	$oroactual = $oro->getOro();
	while($datos = $oroactual->fetch_assoc()){
		echo "<span>".$datos['oro']."</span>";
	}


?>
