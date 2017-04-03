<div id="primeraZona">
	<div id="castillo" onclick="historia();">
		<p>Me presenté delante del Rey, en su expresión se podía distinguir sorpresa y esperanza.</p>
	</div>
	<div id="dialogo" class="balloon">
		<p>(Rey)-Ahora las palabras de ese viejo druida toman sentido.
  		    Por favor jovén, ayudanos con esta situación, esta tierra se consume cada día más y mi pueblo cada día disminuye,
		    bien por la mala allimentación o ya sea porque sucumben al poder de ese "REY DEL MAL".
			Te daré cualquier cosa que pidas pero te lo suplico, AYÚDANOS.
		</p>
	</div>
	<div id="respuesta" class="balloon1" >
		<?php
		?>
	</div>
	<div id="batalla" onclick="batalla();">
		<?php
		?>
	</div>
	<div id="foso">
		<div id="batalla1" >
			<?php
			?>
		</div>
		<div id="dialogo1">
			<p>Debo darme prisa, los engendros de la oscuridad ya se estan acercando.
			   VOLVER A LA OSCURIDAD ENGENDROS DEL MAL!!!
			</p>
		</div>
		<div id="batalla2" >
			<?php
			?>
		</div>
		<div id="mercader">
			<?php
				require_once(dirname(dirname(dirname(dirname( __FILE__))))."/mercader/index.php");
			?>
		</div>
		<div id="pensamientos0">
			<p>A medida que iban pasando las horas y me iba alejando de El Bosque Encantado, podía apreciar como el paso de los años bajo el yugo de 
			   El Rey Del Mal no era de extrañar, solo viendo esa pequeña muestra, que grandes ejércitos sucumbieran ante él; recuerdo que mi abuelo me contaba
			   que hasta el propio Lucifer le temía y le otorgó ciertos dones que estaban prohibidos utilizar, le concedió el poder de la nigromancia 
			   pero tal era su poder que no se conformó con liderar a ejércitos de NO MUERTOS, fue más allá, se adentró en las profundidades más 
			   oscuras y se hizo con el mayor y temible ejército nunca antes visto por el hombre ni por ninguna otra criatura, solo nos podíamos 
			   imaginar todos esos terrores por lo contado por Dante en su viaje por el purgatorio.
		       La sensación de inseguridad estaba presente desde que puse el pie fuera del Castillo y de su protección, los gemidos deseosos de esos
			   seres por alimentarse de mi corazón y de mi alma era más que evidente; pobres criaturas.
			</p>
		</div>
		<div id="batalla3" >
			<?php
				require_once(dirname(dirname(dirname(dirname( __FILE__))))."/batalla/index.php");
			?>
		</div>
	</div>
</div>