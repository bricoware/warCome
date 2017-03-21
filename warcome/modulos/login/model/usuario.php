<?php

	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");

	class usuario{
		
		private $nombre;
		private $pass;
		private $acceso;
		
		public function __construct($nombre, $pass){
			$this->acceso = new conector();
			$this->nombre = $nombre;
			$this->pass = $pass;
		}

		function recuperaUsuario(){
			try{
				$consulta = "SELECT * FROM usuario WHERE nombre = \"".$this->nombre."\"";
				$resultado = $this->acceso->getConector()->query($consulta);
				if(!$resultado){
					throw new Exception("No se pudo recuperar");
				}
				if($resultado->num_rows == 0){
					echo "<div id='error'> No se encontró ese usuario </div>";
				}
				while($registro = $resultado->fetch_object()){
					if(md5($this->pass) == $registro->password){
						return true;
					}
				}
				return false;
			}catch(Exception $error){
				return $error->getMessage();
			}
		}
	}

?>