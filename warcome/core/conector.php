<?php

	class conector{
		
		private $host = "localhost";
		private $user =  "root";
		private $pass = "";
		private $bbdd = "warcome";
		private $conexion;
		
		public function __construct(){
			try{
				$this->conexion = new mysqli($this->host, $this->user, $this->pass, $this->bbdd);
				if($this->conexion->connect_errno){
					throw new Exception($conexion->connect_error);
				}
			}catch(Exception $error){
				return $error->getMessage();
			}
		}
		
		public function getConector(){
			return $this->conexion;
		}

	}
?>