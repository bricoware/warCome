<?php
	session_start();
		
	//require_once(dirname( dirname( __FILE__) )."/model/personaje.php");
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>The Legend of WarCome</title>
		<link type="text/css" rel="stylesheet" href="css/estilo.css" />
		<script type="text/Javascript" src="js/acciones.js"></script>
		<meta name="viewport" content="initial-scale=1"/>
	</head>
	<body>
		<div id="warCome">
			<?php
				require_once('/introduccion/index.php');
			?>
			<?php
				require_once('/primeraZona/index.php');
			?>
			<?php
				require_once('/segundaZona/index.php');
			?>		
		</div>
		<div id="inventario">
			<input type="button" value="Inventario"/>
		</div>
	</body>
</html>