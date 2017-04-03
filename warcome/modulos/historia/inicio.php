<?php
	// En primer lugar, compruebo si el usuario está logueado.
	require_once(dirname(dirname(dirname(__FILE__))) . "/modulos/comprobarLogin/controller/comprobarLogin.php");
	// En caso de estar logueado, cargo el resto de controladores.
	
	// session_start();
	
	//require_once(dirname( dirname( __FILE__) )."/model/personaje.php");
?>
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
			<input type="button" value="Inventario" onclick="location.href='modulos/inventario/inventario.php'"/>
		</div>