<?php

	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");

	class nuevoUsuario{
		
		private $nombre;
		private $pass;
		private $acceso;
		
		public function __construct($nombre, $pass){
			$this->acceso = new conector();
			$this->nombre = $nombre;
			$this->pass = $pass;
		}

		function registraUsuario(){
			try{
				$consulta = "SELECT * FROM usuario WHERE nombre = \"".$this->nombre."\"";
				$resultado = $this->acceso->getConector()->query($consulta);
				if(!$resultado){
					throw new Exception("No se pudo recuperar");
				}
				if($resultado->num_rows > 0){
					echo "Ya existe un usuario con ese nombre";
				} else if($resultado->num_rows == 0){
					$consulta2 = "INSERT INTO usuario(nombre, password)
								VALUES (\"".$this->nombre."\", \"".md5($this->pass)."\");";
					$resultado2 = $this->acceso->getConector()->query($consulta2);
					if(!$resultado2){
						throw new Exception("No se pudo registrar");
					}
					echo "Usuario ".$this->nombre." registrado correctamente";
				}
			}catch(Exception $error){
				return $error->getMessage();
			}
		}
	}

?>