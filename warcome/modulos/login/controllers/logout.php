<?php
	session_start();
	
	// unset($_SESSION['autentificado']);
	// unset($_SESSION['usuario']);
	
	// En vez de eliminar una a una las variables,
	// lo hacemos mediante un bucle para asegurarnos
	// de no dejar ninguna atrás sin borrar.
	foreach($_SESSION as $clave => $valor){
		unset($_SESSION[$clave]);
	}
	
	header("Location: http://warcome.local/");
?>