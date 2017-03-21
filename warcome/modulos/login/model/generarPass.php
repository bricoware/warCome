<?php

	$conexion = new mysqli("localhost", "root", "", "jardineria");
				
	$consulta1 = "SELECT clientes.CodigoCliente FROM clientes;";
	
	if (! $resultado1 = $conexion->query($consulta1)){ 
		throw new Exception("Hubo un fallo: $conexion->errno <br/> $conexion->error");
	}
	
	while($registro = $resultado1->fetch_assoc()){
		$consulta = "INSERT INTO `usuario` (`CodigoCliente`, `Usuario`, `Password`) 
					VALUES ('".$registro['CodigoCliente']."', 'U".$registro['CodigoCliente']."', MD5('P".$registro['CodigoCliente']."'));";
		
		if (! $resultado = $conexion->query($consulta)){ 
			throw new Exception("Hubo un fallo: $conexion->errno <br/> $conexion->error");
		}
	}
	
?>