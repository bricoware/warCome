<?php
	// La sesión ya se inicia en el
	// módulo de comprobación de logueo.
	// session_start();
	require_once(dirname(dirname(dirname(dirname(__FILE__)))) . "/core/conector.php");
	
	class nuevoPersonaje {
		
		private $nombrePersonaje;
		private $fuerza;
		private $destreza;
		private $inteligencia;
		private $constitucion;
		private $vidaMax;
		private $vidaActual;
		private $acPersonaje;
		private $raza;
		private $clase;
		private $habilidad;
		private $avatar;
		
		private $acceso;
		
		public function __construct($nombrePersonaje, $fuerza, $destreza, $inteligencia, $constitucion, $vidaMax, $vidaActual, $acPersonaje, $raza, $clase, $habilidad, $avatar){
			$this->acceso = new conector();
			$this->nombrePersonaje = $nombrePersonaje;
			$this->fuerza = $fuerza;
			$this->destreza = $destreza;
			$this->inteligencia = $inteligencia;
			$this->constitucion = $constitucion;
			$this->vidaMax = $vidaMax;
			$this->vidaActual = $vidaActual;
			$this->acPersonaje = $acPersonaje;
			$this->raza = $raza;
			$this->clase = $clase;
			$this->habilidad = $habilidad;
			$this->avatar = $avatar;
		}
		
		public function crearNuevoPersonaje(){
			try {
				$consulta = "INSERT INTO personaje (nombrePersonaje, fuerza, destreza, inteligencia, constitucion, vidaMax, vidaActual, acPersonaje) 
						VALUES('".$this->nombrePersonaje."','".$this->fuerza."','".$this->destreza."',
						'".$this->inteligencia."','".$this->constitucion."','".$this->vidaMax."',
						'".$this->vidaActual."','".$this->acPersonaje."');";
				$resultado = $this->acceso->getConector()->query($consulta);
				if(!$resultado){
					throw new Exception('<p class="error">ERROR: No se han podido insertar los valores de la ficha de personaje en la base de datos:</p><p class="error">' . $this->acceso->getConector()->error . '</p>');
				}
				
				// Recupero el identificador de personaje de la consulta anterior.
				$identificadorPersonaje = $this->acceso->getConector()->insert_id;
				$_SESSION['idPersonaje'] = $identificadorPersonaje;
				// Recupero el identificador de usuario de la sesión actual.
				$consultaID = "SELECT idUsuario FROM usuario WHERE usuario.nombre LIKE \"". $_SESSION['usuario'] . "\";";
				$resultadoUsuario = $this->acceso->getConector()->query($consultaID);
				$registroID = $resultadoUsuario->fetch_assoc();
				$identificadorUsuario = $registroID['idUsuario'];
				
				// Hago las inserciones en las tablas relacionadas.
				$consulta2 = "INSERT INTO usuarioPersonaje (idPersonaje, idUsuario) VALUES (\"$identificadorPersonaje\",\"$identificadorUsuario\");";
				$consulta3 = "INSERT INTO habilidadPersonaje (idPersonaje, idHabilidad) VALUES (\"$identificadorPersonaje\",\"$this->habilidad\");";
				$consulta4 = "INSERT INTO personajeRaza (idPersonaje, idRaza) VALUES (\"$identificadorPersonaje\",\"$this->raza\");";
				$consulta5 = "INSERT INTO personajeClase (idPersonaje, idClase) VALUES (\"$identificadorPersonaje\",\"$this->clase\");";
				$consulta6 = "INSERT INTO personajeAvatar (idPersonaje, idAvatar) VALUES (\"$identificadorPersonaje\",\"$this->avatar\");";
				$resultado2 = $this->acceso->getConector()->query($consulta2);
				$resultado3 = $this->acceso->getConector()->query($consulta3);
				$resultado4 = $this->acceso->getConector()->query($consulta4);
				$resultado5 = $this->acceso->getConector()->query($consulta5);
				$resultado6 = $this->acceso->getConector()->query($consulta6);
				if(!$resultado2 || !$resultado3 || !$resultado4 || !$resultado5 || !$resultado6){
					throw new Exception('<p class="error">ERROR: No se han podido insertar los valores en alguna de las tablas relacionadas con la ficha de personaje.</p><p class="error">' . $this->acceso->getConector()->error . '</p>');
				}
			} catch(Exception $error){
				die($error->getMessage());
			}
		}
	}
?>