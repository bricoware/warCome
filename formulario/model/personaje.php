<?php
	require_once($_SERVER['DOCUMENT_ROOT']."/core/conector.php");
	
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
			try {
				$consulta = "INSERT INTO personaje (nombrePersonaje, fuerza, destreza, inteligencia, constitucion, vidaMax, vidaActual, acPersonaje, oro) 
						VALUES('".$this->nombrePersonaje."','".$this->fuerza."','".$this->destreza."',
						'".$this->inteligencia."','".$this->constitucion."','".$this->vidaMax."',
						'".$this->vidaActual."','".$this->acPersonaje."','".$this->oro."');";
				//var_dump($consulta);
				$resultado = $this->acceso->getConector()->query($consulta);
				// var_dump($this->acceso);
				if(!$resultado){
					throw new Exception("<p>ERROR: No se han podido insertar los valores de la ficha de personaje en la base de datos:</p>" . $this->acceso->getConector()->error);
				}
			} catch(Exception $error){
				echo $error->getMessage();
				die;
			}
		}
	}
?>