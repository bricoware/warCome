<?php

	session_start();
	require_once(dirname(dirname(__FILE__)).'/controllers/acceso.php');

	if(!isset($_SESSION['autentificado'])){
		
?>

<link type="text/css" rel="stylesheet" href="modulos/login/views/css/login.css" />

<div id="logueando">
	<form id="logueo" action="http://warcome.local/" method="POST">
		<div>
			<label for="nombreUsuario"> Usuario: </label>
			<input type="text" id="nombreUsuario" name="nombreUsuario" placeholder="Nombre de usuario" />
		</div>
		<div>
			<label for="passUsuario"> Contraseña: </label>
			<input type="password" id="passUsuario" name="passUsuario" />
		</div>
		<div>
			<input type="submit" value="Log In" />
			&nbsp; &nbsp;
			<a href="http://warcome.local/modulos/login/views/registro.php"> Registrarse </a>
		</div>
	</form>
</div>

<script type="text/javascript" src="js/login.js"></script>

<?php

	} else {
		require_once('autentificado.php');
	}
	
?>