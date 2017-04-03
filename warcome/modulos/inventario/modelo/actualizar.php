<?php
	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
   class actualizar
  {
  	private $id;
	private $session;
  	private $acceso;
  	function __construct($id,$session)
  	{
  		$this->id = $id;
			$this->session = $session;
  		$this->acceso = new conector();
  	}
  function actualizarArmadura(){
  	try {

			      $consulta2 ="UPDATE inventariopersonaje SET armaduraEquipada = '".$this->id."' WHERE idPersonaje LIKE '".$this->session."'";
			  		$resultado2 = $this->acceso->getConector()->query($consulta2);
						if(!$resultado2){
			  			throw new Exception($resultado2->error);

			  		}


     	return $resultado2;
  	} catch (Exception $e) {
  		echo $e;
  	}
  }
  function actualizarArma(){
  		try {

			  		$consulta2 ="UPDATE inventariopersonaje SET armaEquipada = '".$this->id."' WHERE idPersonaje LIKE '".$this->session."'";
			  		$resultado2 = $this->acceso->getConector()->query($consulta2);



  		if(!$resultado2){
  			throw new Exception($resultado2->error);

  		}
  		return $resultado2;
  	} catch (Exception $e) {
  		echo $e;
  	}
  }

	function comprobarVida(){
			try {

						$consulta2 ="SELECT vidaMax,vidaActual FROM personaje WHERE idPersonaje LIKE '".$this->session."'";
						$resultado2 = $this->acceso->getConector()->query($consulta2);

					if(!$resultado2){
						throw new Exception($resultado2->error);

					}
					return $resultado2;
				} catch (Exception $e) {
					echo $e;
		}
	}

	function comprobarPocion(){
			try {

						$consulta2 ="SELECT valor1,cantidad FROM objeto
												inner join pocion on objeto.idObjeto = pocion.idObjeto
												INNER JOIN pocioncantidad on pocion.idPocion = pocioncantidad.idPocion
												WHERE objeto.idObjeto ='".$this->id."'";
						$resultado2 = $this->acceso->getConector()->query($consulta2);

					if(!$resultado2){
						throw new Exception($resultado2->error);

					}
					return $resultado2;
				} catch (Exception $e) {
					echo $e;
		}
	}

	function beberPocion($vida){
			try {

							$consulta ="UPDATE personaje SET vidaActual = '".$vida."' WHERE idPersonaje LIKE '".$this->session."'";
							$resultado = $this->acceso->getConector()->query($consulta);

							$consulta2 ="UPDATE pocioncantidad
														inner join pocion on pocioncantidad.idPocion = pocion.idPocion
														SET cantidad = cantidad - 1
														WHERE idPersonaje LIKE 1 AND idObjeto = '".$this->id."'";
							$resultado2 = $this->acceso->getConector()->query($consulta2);

			if(!$resultado){
						throw new Exception($resultado->error);

			}

			if(!$resultado2){
				throw new Exception($resultado2->error);

			}
			return $resultado2;
		} catch (Exception $e) {
			echo $e;
		}
	}

	function eliminarPocion(){
			try {
							$consulta ="DELETE from pocioncantidad where idPocion in
													(select idPocion from pocion
	 												where idPersonaje = '".$this->session."' AND idObjeto = '".$this->id."')";
							$resultado = $this->acceso->getConector()->query($consulta);

			if(!$resultado){
						throw new Exception($resultado->error);

			}
		} catch (Exception $e) {
			echo $e;
		}
	}

}
?>
