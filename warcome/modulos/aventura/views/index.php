

<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<title>The Legend of Warcome</title>
	</head>
	<body onload="Javascript:inicio();">
		<div id="aventura" >
			<?php

				require_once(dirname( dirname( __FILE__) )."/controllers/getTextos.php");
				require_once(dirname(dirname( dirname( __FILE__) ))."/batalla/index.php");

			?>
		</div>
		
		<input type="button" onclick="Javascript:continuar();" value="Continuar..." />
		<input type="button" onclick="Javascript:siguiente();" value="Siguiente" style="display:none"/>
	</body>
	
	<script type="text/javascript" src="/modulos/aventura/views/js/aventura.js"></script>
	
</html>