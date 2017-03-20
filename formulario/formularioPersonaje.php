<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>Formulario de registro</title>
	<link rel="stylesheet" type="text/css" href="css/estilo.css"/>
</head>
<body>
	<h1>Formulario de registro</h1>
	<div class="contenedor">
	<table class="tabla"><form action="insertar.php" method="Post">
		<tr>
			<td><label for="nomePersonaje">Nombre del Personaje:</label></td>
			<td><input type="text" id="nomePersonaje" name="nomePersonaje"/></td>
		</tr>
		<tr>
			<td><label for="fuerza">Fuerza:</label></td>
			<td><input type="number" id="fuerza" name="fuerza" /></td>
			<td><input type="button" onclick="javascript:dados('1d6');" value="Dado"/></td>
		</tr>
		<tr>
			<td><label for="destreza">Destreza:</label></td>
			<td><input type="number" id="destreza" name="destreza"/></td>
			<td><input type="button" onclick="javascript:dados('1d6');" value="Dado"/></td>
		</tr>
		<tr>
			<td><label for="inteligencia">Inteligencia:</label></td>
			<td><input type="number" id="inteligencia" name="inteligencia"/></td>
			<td><input type="button" onclick="javascript:dados('1d6');" value="Dado"/></td>
		</tr>
		<tr>
			<td><label for="constitucion">Constitucion:</label></td>
			<td><input type="number" id="constitucion" name="constitucion"/></td>
			<td><input type="button" onclick="javascript:dados('1d6');" value="Dado"/></td>
		</tr>
		<tr>
			<td><label for="oro">Oro:</label></td>
			<td><input type="number" id="oro" name="oro"/></td>
			<td><input type="button" onclick="javascript:dados('1d6');" value="Dado"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="Enviar"/></td>
		</tr>
	</form></table></div>
	<div id="mostrar"></div>
</body>
<script type="text/javascript" src="js/dados.js"></script>
</html>