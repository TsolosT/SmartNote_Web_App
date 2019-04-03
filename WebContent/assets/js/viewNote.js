
var modal = document.querySelectorAll('.gg');

var span1 = document.getElementById("infoclose");
var infomodal = document.querySelector('.infomodal');
//// When the user clicks anywhere outside of the modal, close it
span1.onclick = function() {	
	 infomodal.style.display = "none";
}
function openInfoModal()
{
        infomodal.style.display = "block";
}

window.onclick = function(event) {
  for(var i=0;i<modal.length;i++)
	  {
		if (event.target == modal[i]) {
	        modal[i].style.display = "none";
	    }
	  }
}

function openModal(obj)
{
	for(var i=0;i<modal.length;i++)
	{
		if(obj.id==modal[i].id)
			{
				modal[i].style.display="block";
			}	
	}

}
function closeModal(obj){
	for(var i=0;i<modal.length;i++)
	{
		if(obj.id==modal[i].id)
			{
				modal[i].style.display="none";
			}	
	}
}
