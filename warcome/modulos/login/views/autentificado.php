<div id="autentificado">
	<?php
		if(isset($_SESSION['usuario'])){
			echo '<h2>Bienvenido, ' . $_SESSION['usuario'] . '</h2>';
		} else {
			// Hasta aquí no se debería llegar, pero en caso
			// contrario volvemos a la página de inicio.
			header('Location: /');
		}
	?>
	<ul>
		<li>
			<a href="crearPersonaje.php"><div class="menuPrincipal">Partida nueva</div></a>
		</li>
		<li>
			<a href="seleccionarPersonaje.php"><div class="menuPrincipal">Cargar partida</div></a>
		</li>
		<li>
			<a href="modulos/login/controllers/logout.php"><div class="menuPrincipal">Log out</div></a>
		</li>
	</ul>
</div>