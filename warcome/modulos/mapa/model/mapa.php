<?php
	require_once(dirname(dirname(dirname(__FILE__)))."/core/conector.php");
	class mapa{

		private $id;
		private $recorrido;
		private $acceso;

		public function __construct($recorrido){
      		$this->recorrido = $recorrido;
			$this->acceso = new conector();
		}

		public function setMapa(){

			try {
				$consulta = "INSERT INTO mapa(orden) values ('".$this->recorrido."')";
				$resultado = $this->acceso->getConector->query($consulta);
				if(!$resultado){
					throw new Exception("Non se puido recuperar");
				}
				$consulta2 = "SELECT idMapa ,orden FROM mapa WHERE orden LIKE '".$this->recorrido."'";
				$resultado2 = $this->acceso->getConector()->query($consulta2);
				if(!$resultado2){
					throw new Exception("Non se puido recuperar de ninguna maneira");
				}
				return $resultado2;			


			} catch (Exception $e) {
				echo $e;
			}

	}
}

?>
