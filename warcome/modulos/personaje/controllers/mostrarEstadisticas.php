<script>
function mostrarEstadisticas(){
	var xhttp = new XMLHttpRequest();
	
	var seleccion = document.getElementById("razaPersonaje").value;
	var direccion = "modulos/personaje/controllers/mostrarEstadisticas.php?raza="+seleccion;
	
	xhttp.open("GET", direccion, true);
	xhttp.send();
	
	xhttp.onreadystatechange = function(){
		if (this.readyState == 4 && this.status == 200){
			document.getElementById("estadisticas").innerHTML = this.responseText;
		}
	};
}
</script>
<?php
	if(!empty($_GET) && isset($_GET['raza'])){
		require_once($_SERVER['DOCUMENT_ROOT'] . "core/conector.php");
		$raza = $_GET['raza'];
		$conexion = new conector();
		$consulta = "SELECT estadistica1, valor1, estadistica2, valor2 FROM raza WHERE idRaza = \"$raza\";";
		$resultado = $conexion->getConector()->query($consulta);
		if($resultado->num_rows == 1){
			while($registro = $resultado->fetch_assoc()){
				echo '<p>Estadísticas: ' . (utf8_encode($registro['estadistica1']) == 'constitucion' ? 'constitución' : utf8_encode($registro['estadistica1'])) . ': ' . $registro['valor1'] .'; ' . (utf8_encode($registro['estadistica2']) == 'constitucion' ? 'constitución' : utf8_encode($registro['estadistica2'])) . ': ' . $registro['valor2'] .'.</p>';
			}
		} else {
			echo '<span class="error">ERROR: No se han podido encontrar las estadísticas para la raza seleccionada.</span>';
		}
	}
?>