 <?php

	require_once(dirname(dirname(__FILE__))."/model/mapa.php");
  require_once(dirname(dirname(__FILE__))."/model/aventura.php");

  $aventura = new aventura();
  $aventuras = $aventura->getAventuras();

  $dificultad1 = [];
  $dificultad2 = [];
  $dificultad3 = [];

  while($dato = $aventuras->fetch_array()){
    if($dato[1] == 1){
      array_push($dificultad1,$dato[0]);
    }
    if($dato[1] == 2){
      array_push($dificultad2,$dato[0]);
    }
    if($dato[1] == 3){
      array_push($dificultad3,$dato[0]);
    }
  }

  $claves_aleatorias1 = array_rand($dificultad1, 2);
  $claves_aleatorias2 = array_rand($dificultad2, 2);
  $claves_aleatorias3 = array_rand($dificultad3, 2);

  $definitivo = "";

  for($i=0;$i<count($claves_aleatorias1);$i++){
    $posicion = $claves_aleatorias1[$i];
    $definitivo = $definitivo.$dificultad1[$posicion].",";
  }

  for($i=0;$i<count($claves_aleatorias2);$i++){
    $posicion = $claves_aleatorias2[$i];
    $definitivo = $definitivo.$dificultad2[$posicion].",";
  }

  for($i=0;$i<count($claves_aleatorias3);$i++){
    $posicion = $claves_aleatorias3[$i];
    $definitivo = $definitivo.$dificultad3[$posicion].",";
  }

  $definitivo = substr ($definitivo, 0, strlen($definitivo) - 1);
  echo $definitivo;

  $nuevo_recorrido = new mapa($definitivo);
  $final = $nuevo_recorrido->setMapa();
  var_dump($nuevo_recorrido->setMapa());





 ?>
