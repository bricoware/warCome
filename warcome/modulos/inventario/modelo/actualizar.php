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

}
 ?>
