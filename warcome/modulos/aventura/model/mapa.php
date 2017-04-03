<?php

	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
	
	class mapa{
		
		private $idPersonaje;
		
		private $acceso;
		
		public function __construct($idPersonaje){
			$this->acceso = new conector();
			$this->idPersonaje = $idPersonaje;
		}

		function obtenerMapa(){
			try{
				$consulta = "SELECT partida.posicion, mapa.orden
							FROM partida
							INNER JOIN mapa
							ON partida.idMapa = mapa.idMapa
							WHERE partida.idPersonaje = '".$this->idPersonaje."';";
				//var_dump($consultaPersonaje);
				$resultado = $this->acceso->getConector()->query($consulta);
				if(!$resultado){
					throw new Exception("No se pudo seleccionar");
				}
				if($resultado->num_rows == 0){
					echo "<div id='error'> No se encontró ese mapa </div>";
				}
								
				return $resultado;
			}catch(Exception $error){
				return $error->getMessage();
			}
		}
	}

?>