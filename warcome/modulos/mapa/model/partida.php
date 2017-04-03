<?php
	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");	
	class partida 
	{
		private $idpersonaje;
		private $posicion;
		private $idMapa;
		private $acceso;
		
		function __construct($idpersonaje,$posicion,$idMapa)
		{
			$this->idpersonaje = $idpersonaje;
			$this->posicion = $posicion;
			$this->idMapa = $idMapa;
			$this->acceso = new conector();
		}
		function crearPartida(){
			try {
				$consulta = "INSERT INTO partida(idPersonaje,posicion,idMapa) VALUES ('".$this->idpersonaje."','".$this->posicion."','".$this->idMapa."')";
				$resultado = $this->acceso->getConector()->query($consulta);
				
				if(!$resultado){
					throw new Exception($this->acceso->getConector()->error);
				}				
			} catch (Exception $e) {
				echo $e->getMessage();
			}
		}	
	}

?>