<?php
	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
	class aventura{

		private $id;
		private $dificultad;
		private $acceso;

		public function __construct(){
			$this->acceso = new conector();
		}

		public function getAventuras(){

			try {
				$consulta = "SELECT idAventura,idDificultad FROM aventura";
				$resultado = $this->acceso->getConector()->query($consulta);
				
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
				echo $e->getMessage();
			}

		}
}

?>
