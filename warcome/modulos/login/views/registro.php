<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title> The Legend of Warcome </title>
		<link type="text/css" rel="stylesheet" href="modulos/login/views/css/login.css" />
		<script type="text/javascript" src="modulos/login/views/js/registro.js"></script>
	</head>
	<body>
	<div id="registro">
		<form id="nuevoRegistro" action="http://warcome.local/" method="POST">
			<div>
				<label for="nombreRegistro"> Nombre: </label>
				<input type="text" id="nombreRegistro" name="nombreRegistro" placeholder="Escribe un nombre de usuario" required />
			</div>
			<div>
				<label for="passRegistro"> Contraseña: </label>
				<input type="password" id="passRegistro" name="passRegistro" placeholder="Escribe una contraseña" required />
			</div>
			<div>
				<label for="repitePass"> Repite la contraseña: </label>
				<input type="password" id="repitePass" name="repitePass" placeholder="Repite la contraseña" required />
			</div>
			<div>
				<button type="button" onclick="Javascript:registrarUsuario();">Registrar</button>
				<button type="button" class="boton-falso" onclick="location.href='index.php'">Volver </button>
			</div>
		</form>
	</div>
	
	<div id="respuesta">
	</div>
	</body>
</html>