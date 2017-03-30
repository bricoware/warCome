<?php
	if(!empty($_GET) && isset($_GET['eliminar']) && $_GET['eliminar'] == 1){
		// Cuando eliminamos un personaje, vamos directamente al modelo, sin vista (¿añadir vista de confirmación?).
		require_once("model/eliminarPersonaje.php");
	} else {
		require_once("views/hojaSeleccion.php");
	}
?>