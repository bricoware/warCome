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
					echo "<span class='error'>Ya existe un usuario con ese nombre.</span>";
				} else if($resultado->num_rows == 0){
					if($this->nombre == ""){
						throw new Exception("<span class='error'>ERROR: El campo para el nombre de usuario no puede estar vacío.</span>");
					}
					$consulta2 = "INSERT INTO usuario (nombre, password)
								VALUES (\"".$this->nombre."\", \"".md5($this->pass)."\");";
					$resultado2 = $this->acceso->getConector()->query($consulta2);
					if(!$resultado2){
						throw new Exception("<span class='error'>No se pudo registrar.</span>");
					}
					echo "Usuario ".$this->nombre." registrado correctamente";
				}
			}catch(Exception $error){
				echo $error->getMessage();
			}
		}
	}

?>