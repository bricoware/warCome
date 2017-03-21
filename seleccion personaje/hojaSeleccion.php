<?php require_once('seleccion.php')?>
<div id="idUsuario" style="display:none"></div>
<link rel="stylesheet" href="css/div.css"><?php require_once('idUsuario.php') ?></link>
<script type="text/javascript">
	function mostrar(){
		var idUsuario = document.getElementByid('idUsuario');
		idUsuario.style.display = 'block';
	}
</script>