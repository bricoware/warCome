<?php
	require_once(dirname(dirname(__FILE__)) . "/controllers/seleccion.php");
?>
<div id="contenedor">
	<h2>Partidas guardadas</h2>
	<?php
		if($resultado->num_rows > 0){
			while($fila = $resultado->fetch_object()){
				echo '<div class="fila">';
				echo '<a href="#"><div class="personaje"><img src="' . $fila->avatar . '" height="80"><p>'. $fila->nombrePersonaje. '</p></div></a>';
				echo '<a href="?eliminar=1&id=' . $fila->idPersonaje. '"><div class="eliminar"><p>Borrar la partida</p></div></a>';
				echo '</div>';
			}
		} else {
			echo '<p><em>Todavía no has creado ninguna partida.</em> <a href="crearPersonaje.php">Configura un nuevo personaje.</a></p>';
		}
	?>
</div>