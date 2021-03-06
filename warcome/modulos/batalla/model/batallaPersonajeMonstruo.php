<?php
	
	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
	
	class batallaPersonaje{
		
		private $idPersonaje;
		private $idMonstruo;
		
		private $acceso;
		
		public function __construct($idPersonaje, $idMonstruo){
			$this->acceso = new conector();
			$this->idPersonaje = $idPersonaje;
			$this->idMonstruo = $idMonstruo;
		}

		function obtenerDatosPersonaje(){
			try{
				$consultaPersonaje = "SELECT personaje.nombrePersonaje, personaje.fuerza, personaje.destreza, personaje.inteligencia, 
							personaje.constitucion, personaje.vidaMax, personaje.vidaActual, personaje.acPersonaje, 
							personaje.oro, personaje.xp, avatar.avatar, personaje.nivel, clase.dadoVida
							FROM personaje
							INNER JOIN personajeavatar
							ON personaje.idPersonaje = personajeavatar.idPersonaje
							INNER JOIN avatar
							ON personajeavatar.idAvatar = avatar.idAvatar
							INNER JOIN personajeClase
							ON personaje.idPersonaje = personajeClase.idPersonaje
							INNER JOIN clase
							ON personajeClase.idClase = clase.idClase
							WHERE personaje.idPersonaje = '".$this->idPersonaje."';";
				//var_dump($consultaPersonaje);
				$resultadoPersonaje = $this->acceso->getConector()->query($consultaPersonaje);
				if(!$resultadoPersonaje){
					throw new Exception("No se pudo seleccionar");
				}
				if($resultadoPersonaje->num_rows == 0){
					echo "<div id='error'> No se encontró ese personaje </div>";
				}
				
				$consultaArma = "SELECT objeto.estadistica1, objeto.valor1, objeto.estadistica2, objeto.valor2
							FROM objeto 
							WHERE objeto.idObjeto = (
								SELECT inventariopersonaje.armaEquipada FROM inventariopersonaje 
								WHERE inventariopersonaje.idPersonaje = '".$this->idPersonaje."'
							);";
				//var_dump($consultaArma);
				$resultadoArma = $this->acceso->getConector()->query($consultaArma);
				if(!$resultadoArma){
					throw new Exception("No se pudo seleccionar");
				}
				if($resultadoArma->num_rows == 0){
					throw new Exception("<div id='error'> No se encontró ese objeto </div>");
				}
				
				$consultaArmadura = "SELECT objeto.estadistica1, objeto.valor1, objeto.estadistica2, objeto.valor2
							FROM objeto 
							WHERE objeto.idObjeto = (
								SELECT inventariopersonaje.armaduraEquipada FROM inventariopersonaje 
								WHERE inventariopersonaje.idPersonaje = '".$this->idPersonaje."'
							);";
				//var_dump($consultaArmadura);
				$resultadoArmadura = $this->acceso->getConector()->query($consultaArmadura);
				if(!$resultadoArmadura){
					throw new Exception("No se pudo seleccionar");
				}
				if($resultadoArmadura->num_rows == 0){
					throw new Exception("<div id='error'> No se encontró ese objeto </div>");
				}
				
				$consultaPociones = "SELECT objeto.nombreObjeto, objeto.descripcionObjeto, objeto.estadistica1, objeto.valor1, pocionCantidad.cantidad, pocionCantidad.idPocion
							FROM objeto
							INNER JOIN pocion
							ON objeto.idObjeto = pocion.idObjeto
							INNER JOIN pocionCantidad
							ON pocion.idPocion = pocionCantidad.idPocion
							WHERE objeto.idObjeto IN (
								SELECT pocion.idObjeto FROM pocion 
								WHERE pocion.idPersonaje = '".$this->idPersonaje."'
							);";
				//var_dump($consultaPociones);
				$resultadoPociones = $this->acceso->getConector()->query($consultaPociones);
				if(!$resultadoPociones){
					throw new Exception("No se pudo seleccionar");
				}
				if($resultadoPociones->num_rows == 0){
					throw new Exception("<div id='error'> No se encontró ese personaje </div>");
				}
				
				$consultaHabilidades = "SELECT habilidad.nombreHabilidad, habilidad.descripcionHabilidad, habilidad.danho, 
										habilidad.idHabilidad, habilidad.estadisticaHabilidad, habilidad.posibilidadGolpearHabilidad
										FROM habilidad
										WHERE habilidad.idHabilidad IN (
											SELECT habilidadpersonaje.idHabilidad FROM habilidadpersonaje 
											WHERE habilidadpersonaje.idPersonaje = '".$this->idPersonaje."'
										);";
				//var_dump($consultaHabilidades);
				$resultadoHabilidades = $this->acceso->getConector()->query($consultaHabilidades);
				if(!$resultadoHabilidades){
					throw new Exception("No se pudo seleccionar");
				}
				if($resultadoHabilidades->num_rows == 0){
					throw new Exception("<div id='error'> No se encontró esa habilidad </div>");
				}
				
				$consultaMonstruo = "SELECT monstruo.nombreMonstruo, monstruo.ataqueMonstruo, monstruo.acMonstruo, monstruo.vidaMonstruo, 
							monstruo.xpOtorgada, avatar.avatar, monstruo.posibilidadGolpear, monstruo.oroOtorgado
							FROM monstruo
							INNER JOIN monstruoavatar
							ON monstruo.idMonstruo = monstruoavatar.idMonstruo
							INNER JOIN avatar
							ON monstruoavatar.idAvatar = avatar.idAvatar
							WHERE monstruo.idMonstruo = '".$this->idMonstruo."';";
						
				$resultadoMonstruo = $this->acceso->getConector()->query($consultaMonstruo);
				if(!$resultadoMonstruo){
					throw new Exception("No se pudo seleccionar");
				}
				if($resultadoMonstruo->num_rows == 0){
					echo "<div id='error'> No se encontró ese monstruo </div>";
				}
				
				$respuesta = array($resultadoPersonaje, $resultadoArma, $resultadoArmadura, $resultadoPociones, $resultadoHabilidades, $resultadoMonstruo);
				
				return $respuesta;
			}catch(Exception $error){
				return $error->getMessage();
			}
		}
	}
	
?>