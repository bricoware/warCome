<?php
	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
   class actualizar
  {
  	private $id;
  	private $acceso;
  	function __construct($id)
  	{
  		$this->id = $id;
  		$this->acceso = new conector();
  	}
  function actualizarArmadura(){
  	try {

			      $consulta2 ="UPDATE inventariopersonaje SET armaduraEquipada = '".$this->id."' WHERE idPersonaje LIKE 1";
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

			  		$consulta2 ="UPDATE inventariopersonaje SET armaEquipada = '".$this->id."' WHERE idPersonaje LIKE 1";
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

						$consulta2 ="SELECT vidaMax,vidaActual FROM personaje WHERE idPersonaje LIKE 1";
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

						$consulta2 ="SELECT valor1 FROM objeto WHERE idObjeto = '".$this->id."'";
						$resultado2 = $this->acceso->getConector()->query($consulta2);

					if(!$resultado2){
						throw new Exception($resultado2->error);

					}
					while($datos = $resultado2->fetch_array()){
						$result = $datos['valor1'];
					}
					return $result;
				} catch (Exception $e) {
					echo $e;
		}
	}

	function beberPocion($vida){
			try {

							var_dump($this->id);
							$consulta ="UPDATE personaje SET vidaActual = '".$vida."' WHERE idPersonaje LIKE 1";
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

}
 ?>