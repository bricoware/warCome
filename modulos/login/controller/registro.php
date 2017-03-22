<?php
	try {
		if(isset($_POST)){
			if(count($_POST) > 0 && isset($_POST["nombreRegistro"]) && isset($_POST["contrasenaRegistro"])){
				require_once(dirname(dirname(__FILE__)) . "/model/registro.php");
				$registro = new registro($_POST["nombreRegistro"], $_POST["contrasenaRegistro"]);
				$comprobacion = $registro->crearUsuario();
				if($comprobacion){
					throw new Exception("<span>Te has registrado correctamente.</span>");
				}
			}
		} else {
			throw new Exception('<span class="error">ERROR: No se puede mostrar el contenido del módulo de registro.</span>');
		}
	} catch(Exception $mensaje){
		echo $mensaje->getMessage();
	}
?>