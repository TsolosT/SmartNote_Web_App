<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="assets/vendors/Bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/styleGS.css">
<title>SmartNote-GetStarted</title>
</head>
<body>

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
         	 <li  class="active"><a href="getStarted.jsp">Get Started</a></li>
        	<li><a href="quickNote.jsp" >QuickNote<span><img src="assets/images/notepad(1).png"></span></a></li>
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

<div class="container-body">

  <h1>Get started now!</h1>
  <h3>Some short guide for SmartNote!</h3>
	<p>SmartNote is brand new way to create a "quick" note.Our app has a lot of features that can help you keep everything you need to note in one place(Photos,gps location,geographical position) even files like(xls,txt).
	Save button in the "QuickNote" page saves your note with all the extra files you may upload(photos,files etc) in our database for your own safety so you don't have to worry about using your own personal storage.
	</p>
	<p>Once you create your note you can View your note(s) via the(ViewNotes button) which is located in the top navbar.Of course you can make changes to your Note via the Edit button or even delete your Note.
	In case your notes are too many and you want to find a specific note DONT WORRY,we got you covered.
	You can search a note by its Title(you fill this information while creating the note) or even type a specific keyword(s) and Press the Search Button(Located in the ViewNotes page).
	You will be redirected automatically to a new Page that contains all the note(s) with the given title or with all notes containing the specific keyword.
	</p>
	<p>
	Keep in mind that you can try our application and make a quick note but you must create an account to unlock the "Save Note" feature.
	Once your account is created via the sign-up button(top right) you are all set.
	</p>

    <p>SmartNote is a project developed by a group of students and this is only the beginning.New features for your notes are coming soon!!</p>
</div>


<script type="text/javascript" src="assets/vendors/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="assets/vendors/Bootstrap/bootstrap.min.js"></script>
</body>
</html>