//modals for upload files
//// Get the modal
var modal1 = document.getElementById('myModal1');
var modal2 = document.getElementById('myModal2');
var modal3 = document.getElementById('myModal3');
// Get the button that opens the modal
var btn2 = document.getElementById("recordingBtn");
var btn1 = document.getElementById("imageBtn");
var btn3 = document.getElementById("fileBtn");
// Get the <span> element that closes the modal
var span1 = document.getElementById("close1");
var span2 = document.getElementById("close2");
var span3 = document.getElementById("close3");
// When the user clicks the button, open the modal 
btn1.onclick = function() {
    modal1.style.display = "block";
}
btn2.onclick = function() {
    modal2.style.display = "block";
}
btn3.onclick = function() {
    modal3.style.display = "block";
}
// When the user clicks on <span> (x), close the modal
span1.onclick = function() {	
	 modal1.style.display = "none";
}
span2.onclick = function() {	
	  modal2.style.display = "none";
}
span3.onclick = function() {	
	  modal3.style.display = "none"; 
}
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
    else if (event.target == modal2) {
        modal2.style.display = "none";
    }
    else if (event.target == modal3) {
        modal3.style.display = "none";
    }
}
//image button close modal //and show img
var btnimageupload=document.getElementById("imageupload");

btnimageupload.addEventListener('click',function(){	

	//close modal1
	modal1.style.display = "none";
});
var btnrecordingupload=document.getElementById("recordingupload");

btnrecordingupload.addEventListener('click',function(){	
		//close modal2
	modal2.style.display = "none";
});
var btndocfileupload=document.getElementById("docfileupload");

btndocfileupload.addEventListener('click',function(){	
		//close modal3
	modal3.style.display = "none";
});
// richtext editor functions
function iFrameOn(){
    richTextField.document.designMode='On';
}
 function Bold()
 {
      richTextField.document.execCommand ('bold', false, null);
}
function Italic()
{
    richTextField.document.execCommand ('italic', false, null);
}
function Underline()
{
    richTextField.document.execCommand ('underline', false, null);
}
function FontSize()
{
    var size=document.getElementById("fontsize");
    richTextField.document.execCommand('fontSize',false,size.value);
}
function FontFamily()
{
    var family=document.getElementById("fontfamily");
    richTextField.document.execCommand('fontName',false,family.value);
}
function FontColor()
{
    var x=document.getElementById("fontcolor");
    richTextField.document.execCommand ('foreColor', false, x.value);
}
function ListOrderBullets()
{
    richTextField.document.execCommand ('insertUnorderedList', false, null);
}
function ListOrderNumber()
{
    richTextField.document.execCommand ('insertOrderedList', false, null);
}
function Redo()
{
    richTextField.document.execCommand ('redo', false, null);
}
function Undo()
{
    richTextField.document.execCommand ('undo', false, null);
}

function saveNote(){
	var theForm=document.getElementById("myform");
	theForm.elements["quickNote"].value=window.frames['richTextField'].document.body.innerHTML;
	if(theForm.elements["quickNote"].value==="")
		{
		 	alert("Can not save an empty note...");
		}
	else{
		theForm.submit();
	}
	
}
//GPS 
var gpsDisp = document.getElementById("gps");

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        alert("Gps is not supported by this browser.");
    }
}
function showPosition(position) {
    gpsDisp.value = " Lat.:" + position.coords.latitude.toFixed(4) + 
    " Long.:" + position.coords.longitude.toFixed(4);
}

$(".richbtnUnPress button").click(function(){
	$(this).toggleClass("btnpressed");
});
//location
var locDisp = document.getElementById("loc");

function getAddress(){
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showAddress);
    } else { 
        alert("Location is not supported by this browser.");
    }
}
//pantelhs dummy location
function showAddress(position){
	var address="";
	//current address
	var lat=position.coords.latitude;
	var long=position.coords.longitude;
	//some address cities
	//serres
	var minlatSerres=41.03000000000000;
	var maxlatSerres=41.13000000000000;
	var minlongSerres=23.40000000000000;
	var minlongSerres=23.70000000000000;
	//thesaloniki
	var minlatThes=40.50000000000000;
	var maxlatThes=40.70000000000000;
	var minlongThes=22.70000000000000;
	var minlongThes=23.09000000000000;
	//kavala
	var minlatKavala=40.90000000000000;
	var maxlatKavala=41.00000000000000;
	var minlongKavala=24.30000000000000;
	var minlongKavala=24.60000000000000;
	if((lat>=minlatSerres && lat<=maxlatSerres)&&(long>=minlongSerres && long<=maxlatSerres))
	{

			locDisp.value="Greece,Serres";
	}
	else if((long>=minlongThes && long<=maxlatThes)&&(long>=minlongThes && long<=maxlatThes))
	{
			locDisp.value="Greece,Thesaloniki";
	}
	else if((long>=minlongKavala && long<=maxlatKavala)&&(long>=minlongKavala && long<=maxlatKavala))
	{
			locDisp.value="Greece,Kavala";
	}
	else{
		alert("Location is not supported by this browser.");
	}
	
}

