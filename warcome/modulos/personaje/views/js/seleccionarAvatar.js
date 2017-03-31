function seleccionarAvatar(seleccion){
	var divAvatar = document.getElementById("divAvatar");
	for(var i = 0; i < divAvatar.children.length; i++){
		if(divAvatar.children[i].className == "avatar seleccionado"){
			divAvatar.children[i].className = "avatar";
		}
	}
	var avatar = document.getElementById("avatar");
	avatar.value = seleccion.id;
	seleccion.className += " seleccionado";
}