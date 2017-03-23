<?php
	require_once(dirname(dirname(__FILE__)) . "/controllers/nuevoPersonaje.php");
	require_once(dirname(dirname(__FILE__)) . "/controllers/infoPersonajes.php");
	require_once(dirname(dirname(__FILE__)) . "/controllers/mostrarDescripcion.php");
?>
<section class="centro">
	<div id="contenedor">
		<h1>Nuevo personaje</h1>
		<div id="dados">
		</div>
		<form action="#" method="post">
			<div>
				<label for="nombrePersonaje">Nombre del personaje:</label>
				<input type="text" id="nombrePersonaje" name="nombrePersonaje" required>
			</div>
			<div>
				<p><em>Tira los dados para asignar estadísticas a tu personaje.</em></p>
				<button type="button" onclick="javascript:crearFicha();" id="botonTirada">Tirar los dados</button>
			</div>
			<div class="habilidades">
				<label for="fuerza">Fuerza:</label>
				<div class="distribucion"><p class="oculto">&nbsp;</p></div>
				<input type="hidden" id="fuerza" name="fuerza" required>
			</div>
			<div class="habilidades">
				<label for="destreza">Destreza:</label>
				<div class="distribucion"><p class="oculto">&nbsp;</p></div>
				<input type="hidden" id="destreza" name="destreza" required>
			</div>
			<div class="habilidades">
				<label for="inteligencia">Inteligencia:</label>
				<div class="distribucion"><p class="oculto">&nbsp;</p></div>
				<input type="hidden" id="inteligencia" name="inteligencia" required>
			</div>
			<div class="habilidades">
				<label for="constitucion">Constitución:</label>
				<div class="distribucion"><p class="oculto">&nbsp;</p></div>
				<input type="hidden" id="constitucion" name="constitucion" required>
			</div>
			<div>
				<label for="razaPersonaje">Raza:</label>
				<select name="razaPersonaje" id="razaPersonaje" required>
					<option name="razaPersonaje" value="0" selected disabled>- selecciona una raza -</option>
					<?php
						while($registroRaza = $resultadoRaza->fetch_assoc()){
							echo '<option name="razaPersonaje" value="' . $registroRaza['idRaza'] . '">' . $registroRaza['raza'] . '</option>';
						}
					?>
				</select>
			</div>
			<div>
				<label for="clasePersonaje">Clase:</label>
				<select name="clasePersonaje" id="clasePersonaje" required>
					<option name="clasePersonaje" value="0" selected disabled>- selecciona una clase -</option>
					<?php
						while($registroClase = $resultadoClase->fetch_assoc()){
							echo '<option name="clasePersonaje" value="' . $registroClase['idClase'] . '">' . $registroClase['clase'] . '</option>';
						}
					?>
				</select>
			</div>
			<div>
				<label for="habilidadPersonaje">Habilidad:</label>
				<select name="habilidadPersonaje" id="habilidadPersonaje" onchange="mostrarDescripcion()" required>
					<option name="habilidadPersonaje" value="0" selected disabled>- selecciona una habilidad -</option>
					<?php
						while($registroHabilidad = $resultadoHabilidad->fetch_assoc()){
							echo '<option name="habilidadPersonaje" value="' . $registroHabilidad['idHabilidad'] . '">' . utf8_encode($registroHabilidad['nombreHabilidad']) . '</option>';
						}
					?>
				</select>
				<div id="descripcion">
				</div>
			</div>
			<div class="centro">
				<input type="submit" value="Crear el personaje">
			</div>
		</form>
	</div>
</section>