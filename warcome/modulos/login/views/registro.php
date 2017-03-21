<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title> The Legend of Warcome </title>
	</head>
	<body>
		<link type="text/css" rel="stylesheet" href="css/registro.css" />

	<div id="registro">
		<form id="nuevoRegistro" action="http://warcome.local/" method="POST">
			<div>
				<label for="nombreRegistro"> Nombre: </label>
				<input type="text" id="nombreRegistro" name="nombreRegistro" placeholder="Nombre de usuario" />
			</div>
			<div>
				<label for="passRegistro"> Contraseña: </label>
				<input type="password" id="passRegistro" name="passRegistro" />
			</div>
			<div>
				<label for="repitePass"> Repite Contraseña: </label>
				<input type="password" id="repitePass" name="repitePass" />
			</div>
			<div>
				<input type="button" onclick="Javascript:registrarUsuario();" value="Registrar" />
				&nbsp; &nbsp;
				<a href="http://warcome.local/index.php"> Volver </a>
			</div>
		</form>
	</div>
	
	<div id="respuesta">
	</div>
	</body>
	
	<script type="text/javascript" src="js/registro.js"></script>

</html>