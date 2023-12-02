$(document).ready(function(){
  $('[data-toggle="popover"]').popover();
});


const openModal = () => {
	document.getElementById("myModal").style.display = "block"
}

const closeModal = () => {
	document.getElementById("myModal").style.display = "none"
}