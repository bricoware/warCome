<?php 
	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
	class objeto
	{
		private $nombre;
		private $estadistica1;
		private $estadistica2;
		private $valor1;
		private $valor2;
		private $acceso;
		function __construct()
		{
			$this->acceso = new conector();
		}
		function getIds($idPersonaje){
			try {
				$consulta = "SELECT inventariopersonaje.objetosInventario,inventariopersonaje.armaduraEquipada,inventariopersonaje.armaEquipada 
							 FROM inventariopersonaje
							 WHERE inventariopersonaje.idPersonaje LIKE 1";
				$resultado = $this->acceso->getConector()->query($consulta);

				if(!$resultado){
					throw new Exception($resultado->error);
				}
				return $resultado;
			} catch (Exception $e) {
				echo $e;
			}

		}
		function getArmaduras($ids){
			
			try {
				$consulta = "SELECT objeto.idObjeto,nombreObjeto , concat(estadistica1,' ',valor1) as valores1,concat(estadistica2,' ',valor2) as valores2,tipo
				 			 FROM objeto
				 			 INNER JOIN objetoTipo ON objeto.idObjeto = objetoTipo.idObjeto
				 			 INNER JOIN tipo ON objetotipo.idTipo = tipo.idTipo
				 			  WHERE";
				for($i=0; $i<count($ids); $i++){
				 	$consulta = $consulta." objeto.idObjeto LIKE '".$ids[$i]."' OR"; 
				 }
				 $cadena = substr($consulta,0,strlen($consulta) -2);
				 $resultado = $this->acceso->getConector()->query($cadena);
				return $resultado;
			} catch (Exception $e) {
				echo $e;
			}

		}		
	}


?>