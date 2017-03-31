<?php
	if(isset($_POST['nombreRegistro']) && isset($_POST['passRegistro']) && isset($_POST['repitePass'])){
		if(count($_POST['nombreRegistro']) > 0 && count($_POST['passRegistro']) > 0 && count($_POST['repitePass']) > 0){
			if ($_POST['passRegistro'] == $_POST['repitePass']){
				require_once(dirname(dirname(__FILE__))."/model/nuevoUsuario.php");
				$nuevoUsuario = new nuevoUsuario($_POST["nombreRegistro"], $_POST["passRegistro"]);
				$nuevoUsuario->registraUsuario();
			} else {
				echo "<span class='error'>Las contraseñas no coinciden</span>";
			}
		}
	} else {
		echo "<span class='error'>ERROR: No se puede mostrar el contenido de este módulo</span>";
	}
?>