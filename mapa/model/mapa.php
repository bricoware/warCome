<?php

	class mapa{

		private $id;
		private $recorrido;
		private $acceso;

		public function __construct($id,$recorrido){
      $this->id = $id;
      $this->recorrido = $recorrido;
			$this->acceso = new mysqli("localhost","root","","warcome");
		}

		public function setMapa(){

			try {
				$consulta = "INSERT INTO mapa(idPersonaje,orden) values (".$this->id.",'".$this->recorrido."')";
				$resultado = $this->acceso->query($consulta);
				if(!$resultado){
				throw new Exception("Non se puido recuperar");
				}
				return $resultado;


			} catch (Exception $e) {

			}

	}
}

?>
