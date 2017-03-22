<?php
	class conector {
		private $host;
		private $usuario;
		private $contrasena;
		private $BBDD;
		private $conexion;
		
		public function __construct(){
			$this->host = "localhost";
			$this->usuario = "root";
			$this->contrasena = "";
			$this->BBDD = "warcome";
			
			try {
				$this->conexion = new mysqli($this->host, $this->usuario, $this->contrasena, $this->BBDD);
				if($this->conexion->connect_errno){
					throw new Exception("<p>ERROR: Se ha producido un error" . $this->conexion->connect_errno . " en la conexión con la base de datos:</p>" . $this->conexion->connect_error);
				}
			} catch(Exception $mensaje){
				die($mensaje->getMessage());
			}
		}
		
		public function getConector(){
			return $this->conexion;
		}
	}
?>