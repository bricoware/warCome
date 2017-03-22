<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . "core/conector.php");

	class usuario {
		private $nombre;
		private $contrasena;
		private $acceso;
		
		public function __construct($nombre, $contrasena){
			$this->acceso = new conector();
			$this->nombre = $nombre;
			$this->contrasena = $contrasena;
		}
		
		public function recuperaUsuario(){
			try {
				$consulta = "SELECT * FROM usuario WHERE nombre = \"".$this->nombre."\";";
				$ejecucion = $this->acceso->getConector()->query($consulta);
				if(!$ejecucion){
					throw new Exception('<span class="error">ERROR: No ha podido recuperar la lista de usuarios.</span>');
				}
				if($ejecucion->num_rows == 0){
					throw new Exception('<span class="error">ERROR: El usuario no existe.</span>');
				}
				while($registro = $ejecucion->fetch_object()){
					if($this->contrasena == $registro->CodigoCliente){
						return true;
					} else {
						throw new Exception('<span class="error">ERROR: La contraseña es incorrecta.</span>');
					}
				}
				return false;
			} catch(Exception $error) {
				echo $error->getMessage();
			}
		}
	}
?>