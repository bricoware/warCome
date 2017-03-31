<?php
	
	if (isset($_GET['idMonstruo'])){
		session_start();
		$_SESSION['personaje'] = 1; /* TESTING */
		
		require_once(dirname( dirname( __FILE__) )."/model/batallaPersonajeMonstruo.php");
		
		$batallaPersonaje = new batallaPersonaje($_SESSION['personaje'], $_GET['idMonstruo']);
		$respuesta = $batallaPersonaje->obtenerDatosPersonaje();
		
		//var_dump($respuesta);
		//var_dump($registroPersonaje = $respuesta[0]->fetch_object());
		header("Content-Type: text/xml");
		$xml = "<?xml version='1.0' encoding='utf8' ?>";
		$xml .= "<personajes>";

		while($registroPersonaje = $respuesta[0]->fetch_object()){
			//var_dump($registroPersonaje);
			$xml .= "<personaje>"; 
				
				$xml .= "<nombrePersonaje>".utf8_encode($registroPersonaje->nombrePersonaje)."</nombrePersonaje>";
				$xml .= "<fuerza>".$registroPersonaje->fuerza."</fuerza>";
				$xml .= "<destreza>".$registroPersonaje->destreza."</destreza>";
				$xml .= "<inteligencia>".$registroPersonaje->inteligencia."</inteligencia>";
				$xml .= "<constitucion>".$registroPersonaje->constitucion."</constitucion>";
				$xml .= "<vidaMax>".$registroPersonaje->vidaMax."</vidaMax>";
				$xml .= "<vidaActual>".$registroPersonaje->vidaActual."</vidaActual>";
				$xml .= "<xp>".$registroPersonaje->xp."</xp>";
				$xml .= "<acPersonaje>".$registroPersonaje->acPersonaje."</acPersonaje>";
				$xml .= "<oro>".$registroPersonaje->oro."</oro>";
				$xml .= "<avatar>".$registroPersonaje->avatar."</avatar>";
				$xml .= "<armaEquipada>";
					while($registroArma = $respuesta[1]->fetch_object()){
						if (is_null($registroArma->estadistica1)){
							$xml .= "<estadistica1>"."-"."</estadistica1>";
						} else {
							$xml .= "<estadistica1>".$registroArma->estadistica1."</estadistica1>";
						}
						if (is_null($registroArma->valor1)){
							$xml .= "<valor1>"."0"."</valor1>";
						} else {
							$xml .= "<valor1>".$registroArma->valor1."</valor1>";
						}
						if (is_null($registroArma->estadistica2)){
							$xml .= "<estadistica2>"."-"."</estadistica2>";
						} else {
							$xml .= "<estadistica2>".$registroArma->estadistica2."</estadistica2>";
						}
						if (is_null($registroArma->valor2)){
							$xml .= "<valor2>"."0"."</valor2>";
						} else {
							$xml .= "<valor2>".$registroArma->valor2."</valor2>";
						}
					}
				$xml .= "</armaEquipada>";
				$xml .= "<armaduraEquipada>";
					while($registroArmadura = $respuesta[2]->fetch_object()){
						if (is_null($registroArmadura->estadistica1)){
							$xml .= "<estadistica1>"."-"."</estadistica1>";
						} else {
							$xml .= "<estadistica1>".$registroArmadura->estadistica1."</estadistica1>";
						}
						if (is_null($registroArmadura->valor1)){
							$xml .= "<valor1>"."0"."</valor1>";
						} else {
							$xml .= "<valor1>".$registroArmadura->valor1."</valor1>";
						}
						if (is_null($registroArmadura->estadistica2)){
							$xml .= "<estadistica2>"."-"."</estadistica2>";
						} else {
							$xml .= "<estadistica2>".$registroArmadura->estadistica2."</estadistica2>";
						}
						if (is_null($registroArmadura->valor2)){
							$xml .= "<valor2>"."0"."</valor2>";
						} else {
							$xml .= "<valor2>".$registroArmadura->valor2."</valor2>";
						}
					}
				$xml .= "</armaduraEquipada>";
				$xml .= "<pociones>";
					while($registroPociones = $respuesta[3]->fetch_object()){
						$xml .= "<pocion>";
							$xml .= "<nombreObjeto>".utf8_encode($registroPociones->nombreObjeto)."</nombreObjeto>";
							$xml .= "<descripcionObjeto>".utf8_encode($registroPociones->descripcionObjeto)."</descripcionObjeto>";
							$xml .= "<estadistica1>".$registroPociones->estadistica1."</estadistica1>";
							$xml .= "<valor1>".$registroPociones->valor1."</valor1>";
							$xml .= "<cantidad>".$registroPociones->cantidad."</cantidad>";
							$xml .= "<idPocion>".$registroPociones->idPocion."</idPocion>";
						$xml .= "</pocion>";
					}
				$xml .= "</pociones>";
				$xml .= "<habilidades>";
					while($registroHabilidades = $respuesta[4]->fetch_object()){
						$xml .= "<habilidad>";
							$xml .= "<nombreHabilidad>".utf8_encode($registroHabilidades->nombreHabilidad)."</nombreHabilidad>";
							$xml .= "<descripcionHabilidad>".utf8_encode($registroHabilidades->descripcionHabilidad)."</descripcionHabilidad>";
							$xml .= "<danho>".$registroHabilidades->danho."</danho>";
							$xml .= "<idHabilidad>".$registroHabilidades->idHabilidad."</idHabilidad>";
							$xml .= "<estadisticaHabilidad>".$registroHabilidades->estadisticaHabilidad."</estadisticaHabilidad>";
							$xml .= "<posibilidadGolpearHabilidad>".$registroHabilidades->posibilidadGolpearHabilidad."</posibilidadGolpearHabilidad>";
						$xml .= "</habilidad>";
					}
				$xml .= "</habilidades>";
				$xml .= "<nivel>".$registroPersonaje->nivel."</nivel>";
				$xml .= "<idPersonaje>".$_SESSION['personaje']."</idPersonaje>";
				$xml .= "<dadoVida>".$registroPersonaje->dadoVida."</dadoVida>";
				
			$xml .= "</personaje>";
		}
		
		while($registroMonstruo = $respuesta[5]->fetch_object()){

			$xml .= "<monstruo>"; 
				
				$xml .= "<nombreMonstruo>".utf8_encode($registroMonstruo->nombreMonstruo)."</nombreMonstruo>";
				$xml .= "<ataqueMonstruo>".$registroMonstruo->ataqueMonstruo."</ataqueMonstruo>";
				$xml .= "<acMonstruo>".$registroMonstruo->acMonstruo."</acMonstruo>";
				$xml .= "<vidaMonstruo>".$registroMonstruo->vidaMonstruo."</vidaMonstruo>";
				$xml .= "<xpOtorgada>".$registroMonstruo->xpOtorgada."</xpOtorgada>";
				$xml .= "<avatar>".$registroMonstruo->avatar."</avatar>";
				$xml .= "<posibilidadGolpear>".$registroMonstruo->posibilidadGolpear."</posibilidadGolpear>";
				$xml .= "<oroOtorgado>".$registroMonstruo->oroOtorgado."</oroOtorgado>";
				
			$xml .= "</monstruo>"; 
		}
			
		$xml .= "</personajes>";
		
		echo $xml;
	}
?>