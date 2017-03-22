<?php
	session_start();
	require_once(dirname(dirname(__FILE__)) . "/controllers/acceso.php");
	
	if(!isset($_SESSION['autentificado'])){
?>
<form action="#" method="POST">
	<div class="contenedor">
		<div>
			<label for="nombreUsuario">Usuario:</label>
			<input type="text" id="nombreUsuario" name="nombreUsuario" placeholder="Nombre de usuario" required>
		</div>
		<div>
			<label for="passUsuario">Contraseña:</label>
			<input type="password" id="passUsuario" name="passUsuario" placeholder="Contraseña" required>
		</div>
		<div>
			<button type="submit">Acceder</button>
			<button type="button" class="boton-falso" onclick="location.href='registro.php'">Regístrate</button>
		</div>
	</div>
</form>
<?php
	} else {
		require_once('autentificado.php');
	}
?>