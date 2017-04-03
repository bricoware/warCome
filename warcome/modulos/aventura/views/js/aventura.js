function inicio(){
	var aventura = document.getElementById("aventura");
	
	for (var i = 0; i < aventura.children[0].children[0].children.length; i++){
		if (i == 0){
			aventura.children[0].children[0].children[i].style.display = "block";
		} else {
			aventura.children[0].children[0].children[i].style.display = "none";
		}
	}
}

function continuar(){
	var aventura = document.getElementById("aventura");
	
	for (var i = 0; i < aventura.children[0].children[0].children.length; i++){
		if (aventura.children[0].children[0].children[i].style.display == "block"){
			if ( (i + 1) == aventura.children[0].children[0].children.length){
				siguiente();
			} else if (aventura.children[0].children[0].children[i + 1].id.substr(0, 7) == "batalla"){
				var idMonstruo = aventura.children[0].children[0].children[i + 1].id.substr(7);
				//console.log(idMonstruo);
				comenzarBatalla(idMonstruo);
				if ( (i + 2) == aventura.children[0].children[0].children.length){
					aventura.children[0].children[0].children[i].style.display = "none";
					
					var siguiente = document.getElementById("siguiente");
					var continuar = document.getElementById("continuar");
					
					siguiente.style.display = "block";
					continuar.style.display = "none";
				} else {
					aventura.children[0].children[0].children[i].style.display = "none";
					aventura.children[0].children[0].children[i + 2].style.display = "block";
					return;
				}
			} else {
				aventura.children[0].children[0].children[i].style.display = "none";
				aventura.children[0].children[0].children[i + 1].style.display = "block";
				return;
			}
		}
	}
}

function siguiente(){
	if (window.XMLHttpRequest) {
		var xhttp = new XMLHttpRequest();
	} else {
		var xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
			
	var direccion = "http://warcome.local/modulos/aventura/controllers/siguiente.php";
	
	xhttp.open("POST", direccion, true);
	
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	xhttp.send();
	
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var recarga = location.href;
			
			location.href = recarga;
		}
	}
}