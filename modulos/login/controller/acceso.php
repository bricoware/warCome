<?php
	try {
		if(isset($_POST)){
			if(count($_POST) > 0 && isset($_POST["nombreUsuario"])){
				require_once(dirname(dirname(__FILE__)) . "/model/usuario.php");
				$usuario = new usuario($_POST["nombreUsuario"], $_POST["contrasenaUsuario"]);
				$comprobacion = $usuario->recuperaUsuario();
				if($comprobacion){
					$_SESSION["autentificado"] = 1;
					$_SESSION["usuario"] = $_POST["nombreUsuario"];
				}
			}
		} else {
			throw new Exception('<span class="error">ERROR: No se puede mostrar el contenido del módulo de registro.</span>');
		}
	} catch(Exception $mensaje){
		echo $mensaje->getMessage();
	}
?>