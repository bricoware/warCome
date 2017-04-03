<?php
	session_start();
		
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
			<input type="button" value="Inventario"/>
		</div>
	</body>
</html>