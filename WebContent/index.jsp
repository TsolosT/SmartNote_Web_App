<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="assets\css\index.css">
<link rel="stylesheet" type="text/css" href="assets/vendors/Bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Playfair+Display&amp;subset=greek" rel="stylesheet">
<title>SmartNote-Home</title>
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
      <a href="#" class="navbar-brand">SmartNote<span><img src="assets/images/notepad2.png"></span></a>
    </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      	<li><a href="getStarted.jsp">Get Started</a></li>
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

<div class="containerGetstarted">
<h3 id="header">SmartNote App<img  src="assets/images/notepad2.png"></h3>
<p id="paragraph">An easy,fast and smart way to write a note.</p>
<hr>
<a href="getStarted.jsp" > <button id="getstarted">Get Started</button> </a>
</div>

<script type="text/javascript" src="assets/vendors/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="assets/vendors/Bootstrap/bootstrap.min.js"></script>
</body>
</html>