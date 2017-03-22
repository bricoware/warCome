<script>
function mostrarDescripcion(){
	var xhttp = new XMLHttpRequest();
	
	var seleccion = document.getElementById("habilidadPersonaje").value;
	var direccion = "modulos/personaje/controllers/mostrarDescripcion.php?habilidad="+seleccion;
	
	xhttp.open("GET", direccion, true);
	xhttp.send();
	
	xhttp.onreadystatechange = function(){
		if (this.readyState == 4 && this.status == 200){
			document.getElementById("descripcion").innerHTML = this.responseText;
		}
	};
}
</script>
<?php
	if(!empty($_GET) && isset($_GET['habilidad'])){
		require_once($_SERVER['DOCUMENT_ROOT'] . "core/conector.php");
		$habilidad = $_GET['habilidad'];
		$conexion = new conector();
		$consulta = "SELECT * FROM habilidad WHERE idHabilidad = \"$habilidad\";";
		$resultado = $conexion->getConector()->query($consulta);
		if($resultado->num_rows == 1){
			while($registro = $resultado->fetch_assoc()){
				echo '<p>' . utf8_encode($registro['descripcionHabilidad']) . '</p><p>Daño de ataque: ' . $registro['danho'] . '.</p>';
			}
		} else {
			echo '<span class="error">ERROR: No se ha podido encontrar la descripción de la habilidad.</span>';
		}
	}
?>