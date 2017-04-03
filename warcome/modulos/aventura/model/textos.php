<?php

	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
	
	class textos{
		
		private $idTexto;
		
		private $acceso;
		
		public function __construct($idTexto){
			$this->acceso = new conector();
			$this->idTexto = $idTexto;
		}

		function obtenerTextos(){
			try{
				$consulta = "SELECT texto.texto
							FROM texto
							WHERE texto.idTexto = '".$this->idTexto."';";
				//var_dump($consulta);
				$resultado = $this->acceso->getConector()->query($consulta);
				if(!$resultado){
					throw new Exception("No se pudo seleccionar");
				}
				if($resultado->num_rows == 0){
					echo "<div id='error'> No se encontró ese texto </div>";
				}
								
				return $resultado;
			}catch(Exception $error){
				return $error->getMessage();
			}
		}
	}

?>