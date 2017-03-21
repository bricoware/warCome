function dados(tirada){
/* tirada en formato 1d6. Primer número indica el número de dados. Segundo número indica el tipo de dado (número de caras). */
	var d = tirada.indexOf("d");
	
	var numeroDados = parseInt(tirada.substring(0, d));		/* Primer número */
	
	var tipoDado = parseInt(tirada.substring(d+1));			/* Segundo número */
	
	//console.log(numeroDados);
	//console.log(tipoDado);
	
	var resultadoTirada = 0;
	
	for (var n = 0; n < numeroDados; n++){
		var random = parseInt((Math.random()*tipoDado) + 1);
		if (random == tipoDado + 1){			/* Por la remota posibilidad de que Math.random() = 1 */
			resultadoTirada += random - 1;
		} else {
			resultadoTirada += random;
		}
	}
	
	//console.log(resultadoTirada);
	return resultadoTirada;
}