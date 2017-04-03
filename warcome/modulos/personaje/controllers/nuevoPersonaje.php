<?php
	try {
		if(!empty($_POST) && isset($_POST)){
			if($_POST['nombrePersonaje'] != "" && $_POST['fuerza'] != "" && $_POST['destreza'] != "" && $_POST['inteligencia'] != "" && $_POST['constitucion'] != "" && $_POST['razaPersonaje'] != "" && $_POST['clasePersonaje'] != "" && $_POST['habilidadPersonaje'] != "" && $_POST['avatar'] != ""){
				require_once(dirname(dirname(__FILE__)) . "/model/personaje.php");
				
				$nombrePersonaje = $_POST['nombrePersonaje'];
				$fuerza = $_POST['fuerza'];
				$destreza = $_POST['destreza'];
				$inteligencia = $_POST['inteligencia'];
				$constitucion = $_POST['constitucion'];
				$vidaMax = ($constitucion*3);
				$vidaActual = $vidaMax;
				$acPersonaje = (10 + $destreza);
				$raza = $_POST['razaPersonaje'];
				$clase = $_POST['clasePersonaje'];
				$habilidad = $_POST['habilidadPersonaje'];
				$avatar = $_POST['avatar'];
				
				$nuevoPersonaje = new nuevoPersonaje($nombrePersonaje, $fuerza, $destreza, $inteligencia, $constitucion, $vidaMax, $vidaActual, $acPersonaje, $raza, $clase, $habilidad, $avatar);
				$nuevoPersonaje->crearNuevoPersonaje();
				
				// Creo la nueva partida en cuanto se crea el personaje.
				require_once(dirname(dirname(dirname(__FILE__))) . "/mapa/controller/mapaController.php");
				
				// Redirección a la página de selección de personaje una vez se crea.
				header("Location: http://warcome.local/seleccionarPersonaje.php");
			} else {
				throw new Exception('<p class="error">No has cubierto correctamente la ficha de tu nuevo personaje. <a href="crearPersonaje.php">Regresa a la página anterior y cubre todos los campos</a>.</p>');
			}
		}
	} catch(Exception $mensaje){
		die($mensaje->getMessage());
	}
?>