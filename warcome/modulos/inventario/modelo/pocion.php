<?php
	require_once(dirname(dirname(dirname(dirname(__FILE__))))."/core/conector.php");
	class pocion
	{
		private $id;
		private $acceso;
		private $session;
		function __construct($session)
		{
			$this->session = $session;
			$this->acceso = new conector();
		}
		function getPociones(){
			try {
				$consulta = "SELECT objeto.idObjeto,objeto.nombreObjeto,pocionCantidad.cantidad FROM objeto
				INNER JOIN pocion ON objeto.idObjeto = pocion.idObjeto
				INNER JOIN pocionCantidad ON pocion.idPocion = pocionCantidad.idPocion
				WHERE pocion.idPersonaje LIKE '".$this->session."'";
				$resultado = $this->acceso->getConector()->query($consulta);
				return $resultado;
			} catch (Exception $e) {

			}
		}
	}

?>
