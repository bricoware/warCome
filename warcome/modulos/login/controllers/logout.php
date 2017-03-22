<?php

	session_start();
	
	unset($_SESSION['autentificado']);
	unset($_SESSION['usuario']);
	
	header("Location: http://warcome.local/");

?>