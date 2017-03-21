<?php

	class mapa{

		private $id;
		private $recorrido;
		private $acceso;

		public function __construct($recorrido){
      		$this->recorrido = $recorrido;
			$this->acceso = new mysqli("localhost","root","","warcome");
		}

		public function setMapa(){

			try {
				$consulta = "INSERT INTO mapa(posicion) values ('".$this->recorrido."')";
				$resultado = $this->acceso->query($consulta);
				if(!$resultado){
					throw new Exception("Non se puido recuperar");
				}
				$consulta2 = "SELECT idMapa ,posicion FROM mapa";
				$resultado2 = $this->acceso->query($consulta2);
				if(!$resultado2){
					throw new Exception("Non se puido recuperar");
				}
				var_dump($resultado2);	
				return $resultado2;			


			} catch (Exception $e) {

			}

	}
}

?>
