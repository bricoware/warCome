<?php
require_once($_SERVER['DOCUMENT_ROOT']."/core/conector.php");

session_start();
$idPersonaje = $_SESSION['idPersonaje'];
$arma = $_GET['arma'];
$armadura = $_GET['armadura'];
$pociones = $_GET['pocion'];

$conexion = new conector();
$compra = "INSERT INTO inventariopersonaje (idPersonaje,armaEquipada,armaduraEquipada,objetosInventario) VALUES (\"$idPersonaje\",\"$arma\",\"$armadura\",\"$pociones\");";
$resultado = $conexion->getConector()->query($compra);
?>