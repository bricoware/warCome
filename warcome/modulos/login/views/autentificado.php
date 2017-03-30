<div id='autentificado'> 
	<h2> 
		<?php
			if(isset($_SESSION["usuario"])){
				echo "Bienvenido, ".$_SESSION["usuario"];
			} else {
				// Hasta aquí no se debería llegar, pero en caso
				// contrario volvemos a la página de inicio.
				header('Location: /');
			}
		?>
	</h2>
	<ul>
		<li>
			<a href='http://warcome.local/crearPersonaje.php'> <div class="menuPrincipal"> Partida Nueva </div> </a> 
		</li>
		<li>
			<a href='http://warcome.local/seleccionarPersonaje.php'> <div class="menuPrincipal"> Cargar Partida </div> </a> 
		</li>
		<li>
			<a href='http://warcome.local/modulos/login/controllers/logout.php'> <div class="menuPrincipal"> Log Out </div> </a> 
		</li>		
	</ul>
</div>