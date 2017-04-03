<?php

	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
	
	class guardar{
		
		private $idPersonaje;
		private $posicion;
		
		private $acceso;
		
		public function __construct($idPersonaje, $posicion){
			$this->acceso = new conector();
			$this->idPersonaje = $idPersonaje;
			$this->posicion = $posicion;
		}

		function guardarPosicion(){
			try{
				$consulta = "UPDATE `partida` SET partida.posicion = '".$this->posicion."'
							WHERE partida.idPersonaje = '".$this->idPersonaje."';";
				//var_dump($consulta);
				$resultado = $this->acceso->getConector()->query($consulta);
				if(!$resultado){
					throw new Exception("No se pudo modificar");
				}
								
			}catch(Exception $error){
				return $error->getMessage();
			}
		}
	}

?>