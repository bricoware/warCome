<?php
					
	require_once(dirname( dirname( __FILE__) )."/model/actualizarPociones.php");
	
	$actualizaPociones = new actualizaPociones($_POST['idPocion'], $_POST['cantidad']);
	$actualizaPociones->actualizarPociones();
	
?>