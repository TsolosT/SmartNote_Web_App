<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="assets/vendors/Bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/viewnotesstyle.css">
    <link  href="http://fonts.googleapis.com/css?family=Reenie+Beanie:regular" rel="stylesheet" type="text/css">
    <title>SmartNote-View Notes</title>
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
                <li><a href="quickNote.jsp" >QuickNote<span><img src="assets/images/notepad(1).png"></span></a></li>
                <li  class="active"><a href="ViewNoteController?action=viewNote">View Notes</a></li>
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
<div class="container">
    <div class="row">
        <div class="searchbox col-lg-6 col-md-6 col-sm-8">
            <form action="ViewNoteController?action=searchNote" method="post">
                <input type="text" class="form-control searchbar" name="searchString" placeholder="Search a note">
                <button name="searchbtn" class="searchbtn" type="submit" >Search <i class="fas fa-search"></i></button>
            </form>
        </div>
        <div class="searchbox  btns-actions col-lg-6 col-md-6 col-sm-8">
        	<button id="infobtn" onclick="openInfoModal(this);"></button>
            <a href="quickNote.jsp"><button id="newNote"></button></a>
        </div>
    </div>

    <hr>
    <div class="noteBox">
        <ul class="listBox">
         <c:choose>
             <c:when test="${listNoteSize>0}">
            	<c:forEach var="note" items="${listNote}">                  
		            <li class="listItems">
		                <button  id="${note.id}" class="btnnotes" onclick="openModal(this)">
		                        ${note.title}
		                    <p class="btnnoteDate" >${note.date}</p>
		                </button>
		                <div id="${note.id}" class="modal gg">
		                    <div class="modal-content col-lg-8 col-md-6 col-sm-4" style="margin: 150px 10% 150px 10%;">
		                        <div class="modal-header">
		                            <span id="${note.id}" class="close" onclick="closeModal(this)">&times;</span>
		                            <h2><label>Title : </label>${note.title}</h2>
		                            <label>Date: ${note.date}</label>
		                            <br>
		                            <label>Location: ${note.location}</label>
		                            <br>
		                            <label>GPS: ${note.gps} </label>
		                        </div>
		                        <div class="modal-body">
		                            <div class="noteArea">
		                                    ${note.note}
		                                <div class="showImg">
		                                    <c:forEach var="image" items="${listNoteImages}">
		                                        <c:if test = "${note.id==image.noteId}">
		                                            <img alt="${image.name}" id="${image.noteId}" src="data:image/jpg;base64,${image.base64Image}" width="120" height="120">
		                                        </c:if>
		                                    </c:forEach>
		                                </div>
		                                <div class="showDoc">
		                                    <c:forEach var="doc" items="${listNoteDocs}">
		                                        <c:if test = "${note.id==doc.noteId}">
		                                            <span  id="${doc.noteId}"><a href="ViewNoteController?action=downloadfile&fileName=${doc.name}&noteId=${note.id}" class="docfiles" >${doc.name}</a></span>
		                                        </c:if>
		                                    </c:forEach>
		                                  </div>
		                             <div class="showRec">
												<c:forEach var="rec" items="${listNoteRecs}">
													<c:if test = "${note.id==rec.noteId}">
														<span  id="${rec.noteId}"><a href="ViewNoteController?action=downloadfile&fileName=${rec.name}&noteId=${note.id}" class="recfiles" >${rec.name}</a></span>
													</c:if>
												</c:forEach> 
		                            </div>
		                        </div>
		                        <div class="modal-footer">
		                       	    <a href="ViewNoteController?action=downloadnote&noteId=${note.id}"><button class="download" type="button" >Download Note</button></a>
		                            <a href="SaveNoteController?action=editnote&param=${note.id}&param2=${note.title}"><button class="edit" type="button" >Edit</button></a>
		                            <a href="SaveNoteController?action=deletenote&paramID=${note.id}"><button name="${note.id}" class="delete" type="button" >Delete</button></a>
		                        </div>
		                    </div>
		                </div>
		           </li>           
               </c:forEach>
             </c:when>
	            <c:otherwise>
	            	 <h2 class="nofoundmsg">There is no note with such given word...</h2>
	            	 <p class="nofoundmsgP">Please try again.</p>
	            </c:otherwise>
             </c:choose>
        </ul>
    </div>
  </div>  
    <div class="infomodal gg">
	<div class="modal-content" style="margin: 150px 10% 150px 10%;">
		<div class="info-modal-header">
		<span id="infoclose" class="close">&times;</span>
			<h3>Info</h3>
			<p>About some event's you may not know</p>
		</div>
		<div class="info-modal-body">
			<ul>
				<li>Click any note to see it content.</li>
				<li>If you already open any note,by clicking any file or record you can download it directly.</li>
				<li>To download image just simple click right click and save as.</li>				
				<li>You can edit or delete any note by simple click those buttons on opened note view.</li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript" src="assets/vendors/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="assets/vendors/Bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/viewNote.js"></script>
</body>
</html>