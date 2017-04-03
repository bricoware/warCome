<?php
if(isset($_GET)){
	if( count($_GET) > 0){
		require_once(dirname( dirname( __FILE__) )."/model/mercader.php");
		$mercader = new mercader($_GET["nombreObjeto"]);
		$comprobacion = $mercader->mostrarObjeto();
		if($comprobacion){
			$_SESSION['autentificado'] = 1;
			$_SESSION['mercader'] = $_GET["nombreObjeto"];
		}
	}
}else{
	echo "Non se pode amosar o contido deste módulo";
}
?>