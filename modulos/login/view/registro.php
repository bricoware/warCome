<?php
	require_once(dirname(dirname(__FILE__)) . "/controller/registro.php");
?>
<section>
	<h2>Formulario de registro</h2>
	<form action="#" method="post">
		<div class="contenedor">
			<div>
			<label for="nombreRegistro">Nombre de usuario:</label>
			<input type="text" id="nombreRegistro" name="nombreRegistro" required>
			</div>
			<div>
			<label for="contrasenaRegistro">Contraseña:</label>
			<input type="password" id="contrasenaRegistro" name="contrasenaRegistro" required>
			</div>
			<button type="submit">Registrarse</button>
		</div>
	</form>
</section>