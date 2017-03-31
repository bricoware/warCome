<?php
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="UTF-8"/>
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
  <script type="text/javascript" src="js/ajax.js"></script>
</head>
<body>
<!-- Trigger/Open The Modal -->
<button id="myBtn">Open Modal</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Inventario</h2>
    </div>
    <div class="modal-body">
      <div id="armaequipada">
      	<label for="arma">1 .Arma equipada</label>
      	<select id="armas" name="armas" onChange="seleccionarArma();">
      		<option value="0">Selecciona arma</option>
      		<?php
      			require_once(dirname(dirname(__FILE__))."/controlador/armas.php");
           ?>
       	</select>
      </div>
      <div id="armaduraequipada">
      	<label for="armadura">2 .Armadura equipada</label>
      	<select id="armadura" name="armadura" onChange="seleccionarArmadura();">
      		<option value="0">Selecciona armadura</option>
      		<?php
      			require_once(dirname(dirname(__FILE__))."/controlador/armaduras.php");
      		 ?>
      	</select>
      </div>

    </div>
    <div class="modal-header">
       	<h2>Pociones</h2>
     </div>
     <div class="modal-body">
     	<?php
     		//require_once(dirname(dirname(__FILE__))."/controlador/Pociones.php");

     	 ?>

     </div>
     <div class="modal-header">
        <h2>Miscelanea</h2>
     </div>
     <div class="modal-body">
      <?php
        var_dump(dirname(dirname(__FILE__))."/controlador/miscelanea.php");
       ?>

     </div>
    <div class="modal-footer">
      <h3>Oro :
      <?php
        require_once(dirname(dirname(__FILE__))."/controlador/oro.php");
        echo "&nbsp;";
        echo "<img class='moneda' src='img/moneda.jpg'/>";
       ?>
      </h3>
    </div>
  </div>

</div>
</body>
</html>
<script type="text/javascript">

// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}
</script>
