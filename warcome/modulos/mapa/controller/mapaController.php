 <?php

  require_once(dirname(dirname(__FILE__))."/model/mapa.php");
  require_once(dirname(dirname(__FILE__))."/model/aventura.php");
  require_once(dirname(dirname(__FILE__))."/model/partida.php");

  $aventura = new aventura();
  $aventuras = $aventura->getAventuras();
//creamos 3 arrays para separar las dificultades
  $dificultad1 = [];
  // $dificultad2 = [];
  // $dificultad3 = [];
  while($dato = $aventuras->fetch_array()){
    if($dato[1] == 1){
      array_push($dificultad1,$dato[0]);
    }
    // if($dato[1] == 2){
      // array_push($dificultad2,$dato[0]);
    // }
    // if($dato[1] == 3){
      // array_push($dificultad3,$dato[0]);
    // }
  }
//array_rand es una funcion que genera aleatorios de posicion dentro del array .El segundo valor le indica cuantos aleatorios generar
  $claves_aleatorias1 = array_rand($dificultad1, 6);
  // $claves_aleatorias2 = array_rand($dificultad2, 0);
  // $claves_aleatorias3 = array_rand($dificultad3, 0);
  //string que usaremos para guardar el orden del mapa
  $definitivo = "";
  //le concatenamos los aleatorios de cada dificultad pero traduciendo la posicion a el id
  for($i=0;$i<count($claves_aleatorias1);$i++){
    $posicion = $claves_aleatorias1[$i];
    $definitivo = $definitivo.$dificultad1[$posicion].",";
  }

  // for($i=0;$i<count($claves_aleatorias2);$i++){
    // $posicion = $claves_aleatorias2[$i];
    // $definitivo = $definitivo.$dificultad2[$posicion].",";
  // }

  // for($i=0;$i<count($claves_aleatorias3);$i++){
    // $posicion = $claves_aleatorias3[$i];
    // $definitivo = $definitivo.$dificultad3[$posicion].",";
  // }
  //eliminamos la ultima coma para que no de problemas
  $definitivo = substr ($definitivo, 0, strlen($definitivo) - 1);
  //llamamos al modelo que creara la tabla mapa y nos devolvera el orden y la id generada respectivamente
  $nuevo_recorrido = new mapa($definitivo); 
  $final = $nuevo_recorrido->setMapa();
  while ( $datos = $final->fetch_assoc()){
    //rompemos el string por las comas para coger la posicion inicial
    $ordensincomas = explode(",",$datos['orden']);
    //cojemos el id del personaje almacenado en la variable de session
	// session_start();
    $idpersonaje = $_SESSION['idPersonaje'];
    $mapa = $datos['idMapa'];
  }
  //llamamos al modelo que sera el encargado de crear la tabla crearPartida
  $partida = new partida($idpersonaje,$ordensincomas[0],$mapa);
  $partida = $partida->crearPartida();
 ?>
