<script>
function mostrarHabilidades(){
	var xhttp = new XMLHttpRequest();
	
	var seleccion = document.getElementById("clasePersonaje").value;
	var selectDesactivado = document.getElementById("habilidadPersonaje");
	selectDesactivado.disabled = false;
	var direccion = "modulos/personaje/controllers/mostrarHabilidades.php?clase="+seleccion;
	
	xhttp.open("GET", direccion, true);
	xhttp.send();
	
	xhttp.onreadystatechange = function(){
		if(this.readyState == 4 && this.status == 200){
			document.getElementById("habilidadPersonaje").innerHTML = '<option name="habilidadPersonaje" value="0" selected disabled>- selecciona una habilidad -</option>';
			document.getElementById("habilidadPersonaje").innerHTML += this.responseText;
		}
	};
}
</script>
<?php
	if(!empty($_GET) && isset($_GET['clase'])){
		require_once($_SERVER['DOCUMENT_ROOT'] . "core/conector.php");
		$clase = $_GET['clase'];
		$conexion = new conector();
		$consulta = "SELECT * FROM habilidad INNER JOIN habilidadclase ON habilidad.idHabilidad = habilidadclase.idHabilidad WHERE habilidadclase.idClase = \"$clase\";";
		$resultado = $conexion->getConector()->query($consulta);
		if($resultado->num_rows > 0){
			while($registro = $resultado->fetch_assoc()){
				echo '<option name="habilidadPersonaje" value="' . $registro['idHabilidad'] . '">' . utf8_encode($registro['nombreHabilidad']) . '</option>';
			}
		} else {
			echo '<span class="error">ERROR: No se ha podido encontrar las habilidades correspondientes a la clase seleccionada.</span>';
		}
	}
?>