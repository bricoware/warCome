<div id='autentificado'> 
	<h2> 
		<?php
			if (isset($_SESSION["usuario"])){		/* La condicional es solo para tests */
				echo "Bienvenido, ".$_SESSION["usuario"];
			} else {
				echo "Bienvenido, Yo testeando cosas";
			}
		?>
	</h2>
	
	<ul>
		<li>
			<a href='http://warcome.local/crearPersonaje.php'> <div class="menuPrincipal"> Partida Nueva </div> </a> 
		</li>
		
		<li>
			<a href='http://warcome.local/modulos/seleccionPersonaje/hojaSeleccion.php'> <div class="menuPrincipal"> Cargar Partida </div> </a> 
		</li>
		
		<li>
			<a href='http://warcome.local/modulos/login/controllers/logout.php'> <div class="menuPrincipal"> Log Out </div> </a> 
		</li>		
	</ul>
</div>