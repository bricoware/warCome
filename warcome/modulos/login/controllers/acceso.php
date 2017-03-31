<?php
	if(isset($_SESSION)){
		if(isset($_POST['nombreUsuario']) && isset($_POST['passUsuario'])){
			if(count($_POST['nombreUsuario']) > 0 && count($_POST['passUsuario']) > 0){
				require_once(dirname(dirname(__FILE__)) . "/model/usuario.php");
				$usuario = new usuario($_POST["nombreUsuario"], $_POST["passUsuario"]);
				$comprobacion = $usuario->recuperaUsuario();
				if($comprobacion){
					$_SESSION['autentificado'] = 1;
					$_SESSION['usuario'] = $_POST["nombreUsuario"];
					$_SESSION['idUsuario'] = $usuario->recuperaIdUsuario();
					// Regresamos a la página de inicio
					// para que no se muestre el mensaje
					// de confirmación de reenvío del formulario.
					header('Location: /');
				} else {
					echo '<p class="error">La constraseña introducida no es correcta.</p>';
				}
			}
		}
	} else {
		echo '<p class="error">ERROR: No se puede mostrar el contenido del módulo de logueo.</p>';
	}
?>