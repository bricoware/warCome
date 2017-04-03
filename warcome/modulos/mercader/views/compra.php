<?php
$arma = $_POST['arma'];
$armadura = $_POST['armadura'];
$pociones = $_POST['pocion'];

$compra = "INSERT INTO inventariopersonaje SET (armaEquipada,armaduraEquipada, objetosInventario) VALUES($arma','$armadura','$pociones')";
echo $compra;
?>