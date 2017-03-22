<?php
			
	session_start();
		
	require_once(dirname( dirname( __FILE__) )."/model/personaje.php");
	
	$batallaPersonaje = new batallaPersonaje($_SESSION['personaje']);
	$batallaPersonaje->obtenerDatosPersonaje();
	
	header("Content-Type: text/xml");
	$xml = "<?xml version='1.0' encoding='utf8' ?>";
	$xml .= "<personajes>";

	while($registroPersonaje = $batallaPersonaje[0]->fetch_object()){

		$xml .= "<personaje>"; 
			
			$xml .= "<nombrePersonaje>".$registroPersonaje->nombrePersonaje."</nombrePersonaje>";
			$xml .= "<fuerza>".$registroPersonaje->fuerza.".</fuerza>";
			$xml .= "<destreza>".$registroPersonaje->destreza.".</destreza>";
			$xml .= "<inteligencia>".$registroPersonaje->inteligencia.".</inteligencia>";
			$xml .= "<constitucion>".$registroPersonaje->constitucion.".</constitucion>";
			$xml .= "<vidaMax>".$registroPersonaje->vidaMax.".</vidaMax>";
			$xml .= "<vidaActual>".$registroPersonaje->vidaActual.".</vidaActual>";
			$xml .= "<xp>".$registroPersonaje->xp.".</xp>";
			$xml .= "<acPersonaje>".$registroPersonaje->acPersonaje.".</acPersonaje>";
			$xml .= "<avatar>".$registroPersonaje->avatar.".</avatar>";
			$xml .= "<armaEquipada>";
				while($registroArma = $batallaPersonaje[1]->fetch_object()){
					$xml .= "<estadistica1>".$registroArma->estadistica1.".</estadistica1>";
					$xml .= "<valor1>".$registroArma->valor1.".</valor1>";
					$xml .= "<estadistica2>".$registroArma->estadistica2.".</estadistica2>";
					$xml .= "<valor2>".$registroArma->valor2.".</valor2>";
				}
			$xml .= "</armaEquipada>";
			$xml .= "<armaduraEquipada>";
				while($registroArmadura = $batallaPersonaje[2]->fetch_object()){
					$xml .= "<estadistica1>".$registroArmadura->estadistica1.".</estadistica1>";
					$xml .= "<valor1>".$registroArmadura->valor1.".</valor1>";
					$xml .= "<estadistica2>".$registroArmadura->estadistica2.".</estadistica2>";
					$xml .= "<valor2>".$registroArmadura->valor2.".</valor2>";
				}
			$xml .= "</armaduraEquipada>";
			$xml .= "<pociones>";
				while($registroPociones = $batallaPersonaje[3]->fetch_object()){
					$xml .= "<pocion>";
						$xml .= "<nombreObjeto>".$registroPociones->nombreObjeto.".</nombreObjeto>";
						$xml .= "<descripcionObjeto>".$registroPociones->descripcionObjeto.".</descripcionObjeto>";
						$xml .= "<estadistica1>".$registroPociones->estadistica1.".</estadistica1>";
						$xml .= "<valor1>".$registroPociones->valor1.".</valor1>";
						$xml .= "<cantidad>".$registroPociones->cantidad.".</cantidad>";
						$xml .= "<idObjeto>".$registroPociones->idObjeto.".</idObjeto>";
					$xml .= "</pocion>";
				}
			$xml .= "</pociones>";
			$xml .= "<habilidades>";
				while($registroHabilidades = $batallaPersonaje[4]->fetch_object()){
					$xml .= "<habilidad>";
						$xml .= "<nombreHabilidad>".$registroHabilidades->nombreHabilidad.".</nombreHabilidad>";
						$xml .= "<descripcionHabilidad>".$registroHabilidades->descripcionHabilidad.".</descripcionHabilidad>";
						$xml .= "<danho>".$registroHabilidades->danho.".</danho>";
						$xml .= "<idHabilidad>".$registroHabilidades->idHabilidad.".</idHabilidad>";
						$xml .= "<estadisticaHabilidad>".$registroHabilidades->estadisticaHabilidad.".</estadisticaHabilidad>";
					$xml .= "</habilidad>";
				}
			$xml .= "</habilidades>";
			$xml .= "<nivel>".$registroPersonaje->nivel.".</nivel>";
			
		$xml .= "</personaje>";
	}
	$xml .= "</personajes>";
	
	echo $xml;
?>