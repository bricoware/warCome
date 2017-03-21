<?php
	
	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
	
	class nuevoPersonaje{
		
		private $nombrePersonaje;
		private $fuerza;
		private $destreza;
		private $inteligencia;
		private $constitucion;
		private $vidaMax;
		private $vidaActual;
		private $acPersonaje;
		private $oro;
		
		private $acceso;
		
		public function __construct($nombrePersonaje, $fuerza, $destreza, $inteligencia, $constitucion, $vidaMax, $vidaActual, $acPersonaje, $oro){
			$this->acceso = new conector();
			$this->nombrePersonaje = $nombrePersonaje;
			$this->fuerza = $fuerza;
			$this->destreza = $destreza;
			$this->inteligencia = $inteligencia;
			$this->constitucion = $constitucion;
			$this->vidaMax = $vidaMax;
			$this->vidaActual = $vidaActual;
			$this->acPersonaje = $acPersonaje;
			$this->oro = $oro;
		}

		function crearNuevoPersonaje(){
			try{
				$consulta = "INSERT INTO personaje (nombrePersonaje, fuerza, destreza, inteligencia, constitucion, vidaMax, vidaActual, acPersonaje, oro) 
						VALUES('".$this->nombrePersonaje."','".$this->fuerza."','".$this->destreza."',
						'".$this->inteligencia."','".$this->constitucion."','".$this->vidaMax."',
						'".$this->vidaActual."','".$this->acPersonaje."','".$this->oro."');";
				//var_dump($consulta);
				$resultado = $this->acceso->getConector()->query($consulta);
				if(!$resultado){
					throw new Exception("No se pudo insertar");
				}

			}catch(Exception $error){
				return $error->getMessage();
			}
		}
	}
	
?>