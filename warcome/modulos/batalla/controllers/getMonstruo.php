<?php
	
	if (isset($_POST)){
		
		require_once(dirname( dirname( __FILE__) )."/model/personaje.php");
				
		$batallaMonstruo = new batallaMonstruo($_POST['idMonstruo']);
		$batallaMonstruo->obtenerDatosMonstruo();
		

		header("Content-Type: text/xml");
		$xml = "<?xml version='1.0' encoding='utf8' ?>";
		$xml .= "<monstruos>";

		while($registroMonstruo = $batallaMonstruo->fetch_object()){

			$xml .= "<monstruo>"; 
				
				$xml .= "<nombreMonstruo>".$registroMonstruo->nombreMonstruo."</nombreMonstruo>";
				$xml .= "<ataqueMonstruo>".$registroMonstruo->ataqueMonstruo.".</ataqueMonstruo>";
				$xml .= "<acMonstruo>".$registroMonstruo->acMonstruo.".</acMonstruo>";
				$xml .= "<vidaMonstruo>".$registroMonstruo->vidaMonstruo.".</vidaMonstruo>";
				$xml .= "<xpOtorgada>".$registroMonstruo->xpOtorgada.".</xpOtorgada>";
				$xml .= "<avatar>".$registroMonstruo->avatar.".</avatar>";
				$xml .= "<posibilidadGolpear>".$registroMonstruo->posibilidadGolpear.".</posibilidadGolpear>";
				
			$xml .= "</monstruo>"; 
		}
				
		$xml .= "</monstruos>";
		
		echo $xml;
	}
	
?>