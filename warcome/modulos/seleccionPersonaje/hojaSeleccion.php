<?php
	require_once('seleccion.php');
	require_once('idUsuario.php');
?>
<link rel="stylesheet" href="css/div.css">
<div id="idUsuario" style="display:none"></div>
<script type="text/javascript">
	function mostrar(){
		var idUsuario = document.getElementByid('idUsuario');
		idUsuario.style.display = 'block';
	}
</script>