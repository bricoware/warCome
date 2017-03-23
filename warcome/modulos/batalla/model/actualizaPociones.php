<?php
	
	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
	
	class actualizaPociones{
		
		private $idPocion;
		private $cantidad;
		
		private $acceso;
		
		public function __construct($idPocion, $cantidad){
			$this->acceso = new conector();
			$this->idPersonaje = $nombreObjeto;
			$this->idPersonaje = $cantidad;
		}

		function actualizarPociones(){
			try{
				$consulta = "UPDATE `pocionCantidad` SET pocionCantidad.cantidad = '".$this->cantidad."'
							WHERE pocionCantidad.idPocion = '".$this->idPersonaje."';";
				//var_dump($consulta);
				$respuesta = $this->acceso->getConector()->query($consulta);
				if(!$respuesta){
					throw new Exception("No se pudo actualizar");
				}
				
				return $respuesta;
			}catch(Exception $error){
				return $error->getMessage();
			}
		}
	}
	
?>