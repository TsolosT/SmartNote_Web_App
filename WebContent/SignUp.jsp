<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="assets/css/signStyle.css">
<link rel="stylesheet" type="text/css" href="assets/vendors/Bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<title>SmartNote-Sign Up</title>
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
        <li><a href="getStarted.jsp">Get Started</a></li>
        <li><a href="quickNote.jsp">QuickNote</a></li>
        <li><a href="ViewNoteController?action=viewNote">View Notes</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
          <% if (session.getAttribute("id")==null) { %>
		    <li class="active"><a  href="#">Sign Up <i class="fa fa-user-plus"></i></a></li>
		         <li><a href="LogIn.jsp">Log in <i class="fa fa-user"></i></a></li>
		<% } else {%>
		    <li><a href="UserController?action=logOut">Log out<i class="fa fa-user"></i></a></li>
		<% } %>
      </ul> 
    </div>
  </div>
</nav>

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100">		
			<form class="login100-form" action = "UserController?action=addUser" method = "post">	
				<div>				
					<h3 class="hlabel">Sign Up</h3>				
					<div class="form-group">
						<label>User Name</label>
						<input class="form-control" type="text" name="User_Name" />
					</div>
					<div class="form-group">
						<label>Password</label>
						<input class="form-control" type="password" name="User_Password" />
					</div>
					<div class="form-group">
					<label>First Name</label>
					<input  class="form-control" type="text" name="First_Name" />
					</div>
					<div class="form-group">
					<label>Last Name</label>
					<input class="form-control" type="text" name="Last_Name" />
					</div>
					<div  class="form-group">
					<label>Email</label>
					<input  class="form-control" type="email" name="Email" />
					<br>
					${msg}
					<br>
					<button type="submit"  class="btn btn-success btn-lg">Register</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="assets/vendors/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="assets/vendors/Bootstrap/bootstrap.min.js"></script>
</body>
</html>