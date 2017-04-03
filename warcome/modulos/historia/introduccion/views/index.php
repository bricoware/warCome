<div id="caja1">
		<?php
			$conexion= new mysqli ("localhost", "root", "", "warCome");
			$consultaTexto = "SELECT * FROM texto WHERE texto.idTexto='1'; ";
			$resultado = $conexion -> query($consultaTexto);
			while($fila = $resultado -> fetch_assoc()){
				echo (utf8_encode(htmlspecialchars($fila['texto'])));
			}
		?>
<input type="button" id="siguiente" value="Siguiente" onclick="historia();"/>
</div>