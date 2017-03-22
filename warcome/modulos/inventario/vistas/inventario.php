<?php 
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="UTF-8"/>
	<link rel="stylesheet" type="text/css" href="../css/estilos.css">
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
      	<span class="arma">Nombre</span>
      	<select id="armas">
      		<option value="0">Selecciona arma</option>
      		<?php
      			var_dump(dirname(dirname(__FILE__))."/controlador/inventario.php");



      		 ?>	
      	</select>
      </div>
      <div id="armaduraequipada">
      	<label for="arma">2 .Armadura equipada</label>
      	<span class="arma">Nombre</span>
      	<select id="armas">
      		<option value="0">Selecciona armadura</option>
      		<?php
      			var_dump(dirname(dirname(__FILE__))."/controlador/inventario.php");

      		 ?>
      	</select>
      </div>

    </div>
    <div class="modal-header">
       	<h2>Pociones</h2>
     </div>
     <div class="modal-body">
     	<?php     		
     		var_dump(dirname(dirname(__FILE__))."/controlador/inventario.php");

     	 ?>

     </div>
    <div class="modal-footer">
      <h3>Oro</h3>
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
