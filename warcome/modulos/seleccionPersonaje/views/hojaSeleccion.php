<?php
	require_once(dirname(dirname(__FILE__)) . "/controllers/seleccion.php");
?>
<div id="contenedor">
	<h2>Partidas guardadas</h2>
	<?php
		while($fila = $resultado->fetch_object()){
			echo '<a href="#"><div class="personaje">'. $fila->nombrePersonaje. '</div></a>';
			echo '<a href="?eliminar=1&id=' . $fila->idPersonaje. '"><div class="eliminar">Borrar la partida</div></a>';
		}
	?>
</div>