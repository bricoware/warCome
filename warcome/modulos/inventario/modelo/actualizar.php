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
      $consulta = "SELECT estadistica1,valor1,estadistica2,valor2
                    FROM objeto
                    INNER JOIN inventariopersonaje ON objeto.idObjeto = inventariopersonaje.armaduraEquipada WHERE idPersonaje LIKE 1 ";
  		$resultado = $this->acceso->getConector()->query($consulta);

      $consulta2 ="UPDATE inventariopersonaje SET armaduraEquipada = '".$this->id."' WHERE idPersonaje LIKE 1";
  		$resultado2 = $this->acceso->getConector()->query($consulta2);


      $consulta3 ="SELECT estadistica1,valor1,estadistica2,valor2 FROM objeto WHERE idObjeto LIKE '".$this->id."'";
      $resultado3 = $this->acceso->getConector()->query($consulta3);
      while($datos = $resultado3->fetch_assoc()){
        $estadistica1 = $datos['estadistica1'];
        $estadistica2 = $datos['estadistica2'];
        $valor1 = $datos['valor1'];
        $valor2 = $datos['valor2'];
      }
      //$consulta4 = "UPDATE personaje SET fuerza,destreza,inteligencia,constitucion "
     	return $resultado2;
  	} catch (Exception $e) {
  		echo $e;
  	}
  }
  function actualizarArma(){
  		try {
			$consulta = "SELECT estadistica1,valor1,estadistica2,valor2
											FROM objeto
											INNER JOIN inventariopersonaje ON objeto.idObjeto = inventariopersonaje.armaduraEquipada WHERE idPersonaje LIKE 1 ";
			$resultado = $this->acceso->getConector()->query($consulta);

  		$consulta2 ="UPDATE inventariopersonaje SET armaEquipada = '".$this->id."' WHERE idPersonaje LIKE 1";
  		$resultado2 = $this->acceso->getConector()->query($consulta);

			$consulta3 ="SELECT estadistica1,valor1,estadistica2,valor2 FROM objeto WHERE idObjeto LIKE '".$this->id."'";
      $resultado3 = $this->acceso->getConector()->query($consulta3);
      while($datos = $resultado3->fetch_assoc()){
        $estadistica1 = $datos['estadistica1'];
        $estadistica2 = $datos['estadistica2'];
        $valor1 = $datos['valor1'];
        $valor2 = $datos['valor2'];
      }

  		if(!$resultado){
  			throw new Exception($resultado->error);

  		}
  		return $resultado2;
  	} catch (Exception $e) {
  		echo $e;
  	}
  }

}
 ?>
