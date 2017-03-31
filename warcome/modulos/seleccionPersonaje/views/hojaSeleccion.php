<?php
	// En primer lugar, compruebo si el usuario está logueado.
	require_once(dirname(dirname(dirname(dirname(__FILE__)))) . "/modulos/comprobarLogin/controller/comprobarLogin.php");
	// En caso de estar logueado, cargo el resto de controladores.
	require_once(dirname(dirname(__FILE__)) . "/controllers/seleccion.php");
?>
<div id="contenedor">
	<h2>Partidas guardadas</h2>
	<?php
		if($resultado->num_rows > 0){
			while($fila = $resultado->fetch_object()){
				echo '<div class="fila">';
				echo '<div class="personaje" id="' . $fila->idPersonaje . '" onclick="informacion(this)"><img src="' . $fila->avatar . '" height="80"><p>'. $fila->nombrePersonaje. '</p></div></a>';
				echo '<a href="?eliminar=1&id=' . $fila->idPersonaje. '"><div class="eliminar"><p>Borrar la partida</p></div></a>';
				echo '</div>';
			}
		} else {
			echo '<p><em>Todavía no has creado ninguna partida.</em> <a href="crearPersonaje.php">Configura un nuevo personaje.</a></p>';
		}
	?>
</div>
<div id="modal">
</div>
<?php
	require_once(dirname(dirname(dirname(dirname(__FILE__)))) . "/modulos/estadisticasPersonaje/index.php");
?>