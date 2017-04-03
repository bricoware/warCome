<?php

require_once($_SERVER['DOCUMENT_ROOT']."/core/conector.php");

class mercader{
	
	private $objeto;
	private $acceso;
	
	public function __construct($objeto){
		$this->acceso = new conector();
		$this->objeto = $objeto;
	}

	function mostrarObjetos(){
		try{
			$consulta = "SELECT * FROM objetos WHERE idObjeto = \"".$this->objeto."\"";
			$resultado = $this->acceso->getConector()->query($consulta);
			if(!$resultado){
				throw new Exception("No se pudo recuperar");
			}
			if($resultado->num_rows == 0){
				echo "No se encuentra  ese objeto";
			}
			while($ringleira = $resultado->fetch_object()){
				if(($this->objeto) == $ringleira->objeto){
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