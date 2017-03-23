<?php
	
	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
	
	class actualizaPersonaje{
		
		private $idPersonaje;
		private $fuerza;
		private $destreza;
		private $inteligencia;
		private $constitucion;
		private $vidaMax;
		private $vidaActual;
		private $xp;
		private $nivel;
		private $acPersonaje;
		private $oro;
		
		private $acceso;
		
		public function __construct($idPersonaje, $fuerza, $destreza, $inteligencia, $constitucion, $vidaMax, $vidaActual, $xp, $nivel, $acPersonaje, $oro){
			$this->acceso = new conector();
			$this->idPersonaje = $idPersonaje;
			$this->idPersonaje = $fuerza;
			$this->idPersonaje = $destreza;
			$this->idPersonaje = $inteligencia;
			$this->idPersonaje = $constitucion;
			$this->idPersonaje = $vidaMax;
			$this->idPersonaje = $vidaActual;
			$this->idPersonaje = $xp;
			$this->idPersonaje = $nivel;
			$this->idPersonaje = $acPersonaje;
			$this->idPersonaje = $oro;
		}

		function actualizarPersonaje(){
			try{
				$consulta = "UPDATE `personaje` SET personaje.fuerza = '".$this->fuerza."', personaje.destreza = '".$this->destreza."',
							personaje.inteligencia = '".$this->inteligencia."', personaje.constitucion = '".$this->constitucion."', 
							personaje.vidaMax = '".$this->vidaMax."', personaje.vidaActual = '".$this->vidaActual."', personaje.xp = '".$this->xp."', 
							personaje.nivel = '".$this->nivel."', personaje.acPersonaje = '".$this->acPersonaje."', personaje.oro = '".$this->oro."' 
							WHERE personaje.idPersonaje = '".$this->idPersonaje."';";
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