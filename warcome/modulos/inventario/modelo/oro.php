<?php 
	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
	class oro
	{
		
		function __construct()
		{
			$this->acceso = new conector();
		}
		function getOro(){
			try {
				$consulta = "SELECT personaje.oro FROM personaje WHERE idPersonaje LIKE 1";
				$resultado = $this->acceso->getConector()->query($consulta);

				if(!$resultado){
					throw new Exception($resultado->error);
				}
				return $resultado;
			} catch (Exception $e) {
				echo $e;
			}

		}
	}


?>