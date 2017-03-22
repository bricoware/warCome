<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "nucleo/conector.php");

class registro {
	
	private $nombre;
	private $contrasena;
	private $acceso;
	
	public function __construct($nombre, $contrasena){
		$this->acceso = new conector();
		$this->nombre = $nombre;
		$this->contrasena = $contrasena;
	}

	function crearUsuario(){
		try {
			$consulta = "INSERT INTO usuario (nombre, contrasena) VALUES (\"".$this->nombre."\", md5(\"".$this->contrasena."\"));";
			$resultado = $this->acceso->getConector()->query($consulta);
			if(!$resultado){
				throw new Exception('<span class="error">ERROR: No se ha podido completar el registro.</span>');
			}
		} catch(Exception $error) {
			echo $error->getMessage();
		}
	}
}
?>