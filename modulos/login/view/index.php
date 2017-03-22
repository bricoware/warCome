<?php
	session_start();
	require_once(dirname(dirname(__FILE__)) . "/controller/acceso.php");

	if(!isset($_SESSION["autentificado"])){
?>
<form action="#" method="post">
	<div class="contenedor">
		<div>
			<label for="nombreUsuario">Usuario:</label>
			<input type="text" id="nombreUsuario" name="nombreUsuario">
		</div>
		<div>
			<label for="contrasenaUsuario">Contraseña:</label>
			<input type="password" id="contrasenaUsuario" name="contrasenaUsuario">
		</div>
		<div>
			<button type="submit">Acceder</button>
			<button type="button" class="boton-falso" onclick="location.href='registro.php'"><!-- ¿Todavía no tienes una cuenta? <a href="registro.php" class="boton-falso"> -->Regístrate aquí.<!-- </a> --></button>
		</div>
	</div>
</form>
<?php
	} else {
		require_once("autenticado.php");
	}
?>