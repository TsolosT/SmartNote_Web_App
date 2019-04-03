<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="assets\css\quickGuest.css">
<link rel="stylesheet" type="text/css" href="assets/vendors/Bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<title>SmartNote-QuickNote</title>
</head>
<body onload="iFrameOn();">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
       </button>
        <a href="index.jsp" class="navbar-brand">SmartNote<span><img src="assets/images/notepad2.png"></span></a>
    </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
       <li><a href="getStarted.jsp">Get Started</a></li>
        <li class="active"><a href="quickNote.jsp" >QuickNote<span><img src="assets/images/notepad(1).png"></span></a></li>
       <li><a href="ViewNoteController?action=viewNote">View Notes</a></li>

      </ul>
      <ul class="nav navbar-nav navbar-right">
          <% if (session.getAttribute("id")==null) { %>
		    <li><a href="SignUp.jsp">Sign Up <i class="fa fa-user-plus"></i></a></li>
		         <li><a href="LogIn.jsp">Log in <i class="fa fa-user"></i></a></li>
		<% } else {%>
		    <li><a href="UserController?action=logOut">Log out<i class="fa fa-user"></i></a></li>
		<% } %>
      </ul> 
    </div>
  </div>
</nav>
<form id="myform" name="myform" action="SaveNoteController?action=notesave" method="post" enctype="multipart/form-data">
	<div  class="container">	
		<div id="contNote" class="containerNote col-lg-10">
			<span class="titlespan ">
				<label id="labeltitle">Title:</label>				
				<input type="text" id="title" name="title" placeholder="Type a title" required">
			</span>
			<div class="richtextEditor row">
				<span class="richbtnUnPress">
				    <button type="button" class="richtitemsbtn" onclick="Bold();"><img src="assets\images\textIcons\bold-text-option.png"></button>
				    <button type="button" class="richtitemsbtn" onclick="Italic();"><img src="assets\images\textIcons\italicize-text.png"></button>
				    <button type="button" class="richtitemsbtn" onclick="Underline();"><img src="assets\images\textIcons\underline-text-option.png"></button>
				 </span>
				 <span class="richboxies">   
				    <button type="button" class="richtitemsbtn" onclick="Redo();"><img src="assets\images\textIcons\icon (1).png"></button>
				    <button type="button" class="richtitemsbtn" onclick="Undo();"><img src="assets\images\textIcons\undo-arrow.png"></button>
				  </span>
				<span class="richboxies">
					<select id="fontfamily" onclick="FontFamily();">
						<option value="Arial">Arial</option>
						<option value="Times">Times</option>
						<option value="serif">serif</option>
						<option value="sans-serif">sans-serif</option>
						<option value="Times New Romam">Times New Roman</option>
						<option value="Helvetica">Helvetica</option>
					</select>
					<select id="fontsize" onclick="FontSize();">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
					</select>
					<input type="color" id="fontcolor" onclick="FontColor();">
				</span>
				<span class="richbtnUnPress">
				    <button type="button" class="richtitemsbtn" onclick="ListOrderBullets();"><img src="assets\images\textIcons\bullets.png"></button>
				    <button type="button" class="richtitemsbtn" onclick="ListOrderNumber();"><img src="assets\images\textIcons\number-list.png"></button>
				 </span>
				  <span class="richboxies">
				    <button type="button" class="richtitemsbtn" id="fileBtn"><img src="assets\images\textIcons\clip.png"></button>
				    <button type="button" class="richtitemsbtn" id="recordingBtn"><img src="assets\images\textIcons\microphone.png"></button>
				    <button type="button" class="richtitemsbtn" id="imageBtn"><img src="assets\images\textIcons\image.png"></button>
				  </span>
				  <span class="richboxies">
				    <button type="button" class="richtitemsbtn" onclick="getAddress();"><img src="assets\images\textIcons\placeholder.png"></button>
				    <button type="button" class="richtitemsbtn" onclick="getLocation();"><img src="assets\images\textIcons\gps.png"></button>
				 </span>
			</div>
			<div class="row">
				<div class="col-sm-10 col-md-5"><label>GPS :  </label><input name="gps" type="text" id="gps"  readonly></div>
				<div class="col-sm-10 col-md-5"><label>LOCATION: </label><input name="loc" type="text" id="loc"  readonly></div>
			</div>
			<textarea id="quickNote" name="quickNote"></textarea>
			<iframe name="richTextField" id="richTextField"></iframe>								
			<br>
			<input type="submit"  value="Save"  onclick="javascript:saveNote();">	
		</div>
	
	</div>
	<div id="myModal1" class="modal">
	  <div class="modal-content">
	    <div class="modal-header">
	      <span class="close" id="close1">&times;</span>
	      <h2>Insert image file</h2>
	    </div>
	    <div class="modal-body">
	    	<input type="file" name="imagefile" id="imagefile"  accept="image/*" multiple>
	    	<button type="button" id="imageupload" class="confirmBtn"> Confirm</button>
	    </div>
	    <div class="modal-footer">
	    	<p id="pInsertedimg">Inserted Images:</p>
	    	<div id="insertedimgs">
	    	</div>
	    	<p>Tip: To make any change in uploading image,need to reselect all desired images.</p>
	    </div>
	  </div>
	</div>
	<div id="myModal3" class="modal">
	  <div class="modal-content">
	    <div class="modal-header">
	      <span class="close" id="close3">&times;</span> 
	      <h2>Insert document files</h2>
	    </div>
	    <div class="modal-body">
		    	<input type="file" name="docfile" id="docfile" accept="application/msword,text/plain, application/pdf" multiple>
		    	<button type="button" id="docfileupload" class="confirmBtn">Confirm</button>
	    </div>
	    <div class="modal-footer">
	    	<p>Tip: To make any change in uploading file,need to reselect all desired files.</p>
	    </div>
	  </div>
	</div>
	<div id="myModal2" class="modal">
	  <div class="modal-content">
		    <div class="modal-header">
		      <span class="close" id="close2">&times;</span> 
		      <h2>Insert recording file</h2>
		    </div>
		    <div class="modal-body">
			    	<input type="file" name="recordingfile" id="recordingfile" multiple accept="sound/*">
			    	<button type="button" id="recordingupload" class="confirmBtn">Confirm</button>
		    </div>
		    <div class="modal-footer">
		    	<p>Tip: To make any change in uploading audio file,need to reselect all desired files.</p>
		    </div>
		  </div>
	</div>
</form>
<script type="text/javascript" src="assets/vendors/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="assets/vendors/Bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/quickNote.js"></script>
</body>
</html>