<script>
function mostrarVida(){
	var xhttp = new XMLHttpRequest();
	
	var seleccion = document.getElementById("clasePersonaje").value;
	var direccion = "modulos/personaje/controllers/mostrarVida.php?clase="+seleccion;
	
	xhttp.open("GET", direccion, true);
	xhttp.send();
	
	xhttp.onreadystatechange = function(){
		if(this.readyState == 4 && this.status == 200){
			document.getElementById("vida").innerHTML = this.responseText;
		}
	};
}
</script>
<?php
	if(!empty($_GET) && isset($_GET['clase'])){
		require_once($_SERVER['DOCUMENT_ROOT'] . "core/conector.php");
		$clase = $_GET['clase'];
		$conexion = new conector();
		$consulta = "SELECT clase.dadoVida FROM clase WHERE clase.idClase = \"$clase\";";
		$resultado = $conexion->getConector()->query($consulta);
		if($resultado->num_rows == 1){
			while($registro = $resultado->fetch_assoc()){
				echo '<p>Dado de vida: ' . utf8_encode($registro['dadoVida']) . '.</p>';
			}
		} else {
			echo '<span class="error">ERROR: No se ha podido encontrar el dado de vida para la clase seleccionada.</span>';
		}
	}
?>