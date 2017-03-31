<?php
	session_start();
	
	if(!isset($_SESSION['autentificado'])){
		header('Location: /');
	}
?>