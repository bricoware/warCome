<script>
function informacion(seleccion){
	var xhttp = new XMLHttpRequest();
	
	var direccion = "modulos/estadisticasPersonaje/controller/ficha.php?id="+seleccion.id;
	
	xhttp.open("GET", direccion, true);
	xhttp.send();
	
	xhttp.onreadystatechange = function(){
		if(this.readyState == 4 && this.status == 200){
			document.getElementById("modal").innerHTML = this.responseText;
			
			// Capturamos la ventana modal
			var modal = document.getElementById('myModal');
			
			// Capturamos la etiqueta <span> que cierra la ventana modal
			var span = document.getElementsByClassName("close")[0];
			
			// Cerramos la ventana modal cuando el usuario pincha en la etiqueta <span> (x)
			if(span.addEventListener){
				span.addEventListener("click", function(){ modal.style.display = "none"; });
			} else {
				span.attatchEvent("onclick", function(){ modal.style.display = "none"; });
			}
			
			// Cerramos también la ventana modal cuando el usuario pincha fuera del modal
			if(window.addEventListener){
				window.addEventListener("click", function(event){
													if(event.target == modal){
														modal.style.display = "none";
													}
												});
			} else {
				window.attatchEvent("onclick", function(event){
													if(event.target == modal){
														modal.style.display = "none";
													}
												});
			}
		}
	};
}
</script>
<?php
if(!empty($_GET) && isset($_GET['id'])){
	session_start();
	$_SESSION['idPersonaje'] = $_GET['id'];
	require_once(dirname(dirname(__FILE__)) . "/model/ficha.php");
	
	// Guardo todos los registros devueltos por la base de datos.
	$registro = $resultado->fetch_assoc();
	$registroRaza = $resultadoRaza->fetch_assoc();
	$registroClase = $resultadoClase->fetch_assoc();
	$registroAvatar = $resultadoAvatar->fetch_assoc();
	$registroHabilidad = $resultadoHabilidad->fetch_assoc();
	
	switch(true){
		case $registroRaza['estadistica1'] == "fuerza":
			$estadisticaFuerza = $registroRaza['valor1'];
			break;
		case $registroRaza['estadistica2'] == "fuerza":
			$estadisticaFuerza = $registroRaza['valor2'];
			break;
	}
	switch(true){
		case $registroRaza['estadistica1'] == "destreza":
			$estadisticaDestreza = $registroRaza['valor1'];
			break;
		case $registroRaza['estadistica2'] == "destreza":
			$estadisticaDestreza = $registroRaza['valor2'];
			break;
	}
	switch(true){
		case $registroRaza['estadistica1'] == "inteligencia":
			$estadisticaInteligencia = $registroRaza['valor1'];
			break;
		case $registroRaza['estadistica2'] == "inteligencia":
			$estadisticaInteligencia = $registroRaza['valor2'];
			break;
	}
	switch(true){
		case $registroRaza['estadistica1'] == "constitucion":
			$estadisticaConstitucion = $registroRaza['valor1'];
			break;
		case $registroRaza['estadistica2'] == "constitucion":
			$estadisticaConstitucion = $registroRaza['valor2'];
			break;
	}
	
	echo '
<div id="myModal" class="modal">
	<div class="modal-content">
		<div class="modal-header">
			<span class="close">&times;</span>
			<h2>' . $registro['nombrePersonaje'] . '</h2>
		</div>
		<div class="modal-body">
			<ul id="datos">
				<li><strong>Raza:</strong> ' . $registroRaza['raza'] . '</li>
				<li><strong>Clase:</strong> ' . $registroClase['clase'] . ' (dado de vida: ' . $registroClase['dadoVida'] . ')</li>
				<li><strong>Habilidad:</strong> ' . utf8_encode($registroHabilidad['nombreHabilidad']) . ' (estadística potenciada: ' . ($registroHabilidad['estadisticaHabilidad'] == "constitucion" ? 'constitución' : $registroHabilidad['estadisticaHabilidad']) . ')' . '</li>
				<li><strong>Fuerza:</strong> ' . $registro['fuerza'] . '' . (isset($estadisticaFuerza) ? ' + ' . $estadisticaFuerza : '') . '</li>
				<li><strong>Destreza:</strong> ' . $registro['destreza'] . '' . (isset($estadisticaDestreza) ? ' + ' . $estadisticaDestreza : '') . '</li>
				<li><strong>Inteligencia:</strong> ' . $registro['inteligencia'] . '' . (isset($estadisticaInteligencia) ? ' + ' . $estadisticaInteligencia : '') . '</li>
				<li><strong>Constitución:</strong> ' . $registro['constitucion'] . '' . (isset($estadisticaConstitucion) ? ' + ' . $estadisticaConstitucion : '') . '</li>
				<li><strong>Clase de armadura:</strong> ' . $registro['acPersonaje'] . '</li>
				<li><strong>Vida actual:</strong> ' . $registro['vidaActual'] . ' (vida máxima: ' . $registro['vidaMax'] . ')</li>
				<li><strong>Puntos de experiencia:</strong> ' . $registro['xp'] . '</li>
				<li><strong>Oro:</strong> ' . $registro['oro'] . '</li>
			</ul>
			<div id="avatar">
				<img src="' . $registroAvatar['avatar'] .'" height="250" alt="Avatar.">
			</div>
		</div>
		<div class="modal-footer">
			<h4>Nivel: ' . $registro['nivel'] . '</h4>
			<button type="button" onclick="location.href=\'partida.php\'">Continuar la partida</button>
		</div>
	</div>
</div>
	';
}
?>