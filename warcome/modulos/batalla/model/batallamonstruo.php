<?php
	
	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
	
	class batallaMonstruo{
		
		private $idMonstruo;
		
		private $acceso;
		
		public function __construct($idMonstruo){
			$this->acceso = new conector();
			$this->idMonstruo = $idMonstruo;
		}

		function obtenerDatosMonstruo(){
			try{
				$consulta = "SELECT monstruo.nombreMonstruo, monstruo.ataqueMonstruo, monstruo.acMonstruo, monstruo.vidaMonstruo, 
							monstruo.xpOtorgada, avatar.avatar
							FROM monstruo
							INNER JOIN monstruoavatar
							ON monstruo.idMonstruo = monstruoavatar.idMonstruo
							INNER JOIN avatar
							ON monstruoavatar.idAvatar = avatar.idAvatar
							WHERE idMonstruo = '".$this->idMonstruo."';";
						
				//var_dump($consulta);
				$resultado = $this->acceso->getConector()->query($consulta);
				if(!$resultado){
					throw new Exception("No se pudo insertar");
				}
				if($resultado->num_rows == 0){
					echo "<div id='error'> No se encontró ese monstruo </div>";
				}
				
				return $resultado;
			}catch(Exception $error){
				return $error->getMessage();
			}
		}
	}
	
?>