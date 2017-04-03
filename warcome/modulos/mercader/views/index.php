<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {  
    $arma=$_POST['arma']; 
    $armadura=$_POST['armadura'];
    $pocion=$_POST['pocion'];
}
?>
<link type="text/css" rel="stylesheet" href="modulos/mercader/views/css/estilo.css" />
<script src="modulos/mercader/views/js/acciones.js" type="text/Javascript"></script>

<h1>Tienda 3B</h1>

<form class="vertical-menu" id="formulario" name="selector" method="POST">
	<ul class="nav">
		<li><a href="">Armas</a></li>
			<ul>
				<?php
					$conexion = new mysqli ("localhost", "root", "", "warCome");
					$consultaArma = "SELECT * FROM objeto INNER JOIN objetoTipo ON objeto.idObjeto=objetotipo.idObjeto INNER JOIN tipo ON objetotipo.idTipo=tipo.idTipo WHERE objetoTipo.idtipo LIKE '2';";
					if(!$resultado = $conexion->query($consultaArma)){
					}
					while($arma = $resultado->fetch_assoc()){
						echo "<li><input type='radio' id='".$arma['idObjeto']."' name='arma' value='".$arma['idObjeto']."' />".(utf8_encode($arma['nombreObjeto'])).", ".(utf8_encode($arma['precio']))."</li>";
					}									
				?>
			</ul>
		<li><a href="">Armaduras</a>
			<ul>
				<?php
					
					$consultaArmadura = "SELECT * FROM objeto INNER JOIN objetoTipo ON objeto.idObjeto=objetotipo.idObjeto INNER JOIN tipo ON objetotipo.idTipo=tipo.idTipo WHERE objetoTipo.idtipo LIKE '1';";
					if(!$respuesta = $conexion->query($consultaArmadura)){
					}
					while($armadura = $respuesta->fetch_assoc()){
					echo "<li><input type='radio' id='armadura' name='armadura' value='".$armadura['idObjeto']."' />".(utf8_encode($armadura['nombreObjeto'])).", ".(utf8_encode($armadura['precio']))."</li>";
					}
				?>	
			</ul>
		</li>
		<li><a href="">Pociones</a></li>
			<ul>
				<?php
					
					$consultaPociones = "SELECT * FROM objeto INNER JOIN objetoTipo ON objeto.idObjeto=objetotipo.idObjeto INNER JOIN tipo ON objetotipo.idTipo=tipo.idTipo WHERE objetoTipo.idtipo LIKE '3';";
					if(!$result = $conexion->query($consultaPociones)){
					}
					while($pociones = $result->fetch_assoc()){
					echo "<li><input type='radio' id='pocion' name='pocion' value='".$pociones['idObjeto']."'/>".(utf8_encode($pociones['nombreObjeto'])).", ".(utf8_encode($pociones['precio']))."</li>";
					}
				?>	
			</ul>
		<li><a href="javascript:history.back();">Nada</a></li>
	</ul>
</form>
<div id="fuera">
	<input type="button" onclick="Javascript:comprar();" value="Comprar"/>
</div>