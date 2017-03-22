<?php

	class aventura{

		private $id;
		private $dificultad;
		private $acceso;

		public function __construct(){
			$this->acceso = new mysqli("localhost","root","","warcome");
		}

		public function getAventuras(){

			try {
				$consulta = "SELECT idAventura,idDificultad FROM aventura";
				$resultado = $this->acceso->query($consulta);
				if(!$resultado){
				throw new Exception("Non se puido recuperar");
				}
				if($resultado->num_rows == 0){
					return false;

				}
				else{
					return $resultado;
				}


			} catch (Exception $e) {

			}

	}
}

?>
