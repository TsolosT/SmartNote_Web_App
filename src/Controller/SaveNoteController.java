package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.SaveNoteDao;
import model.FileBean;
import model.Note;

/**
 * Servlet implementation class SaveNoteController
 */
@WebServlet(name = "SaveNoteController", urlPatterns = { "/SaveNoteController" })
@MultipartConfig(maxFileSize = 33554432) 
public class SaveNoteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = null;
	private SaveNoteDao snDao;
	private HttpSession session;
	String message="Something went wrong with server...";
	
	  public void init() throws ServletException 
	     {   	   
	    	conn = (Connection) getServletContext().getAttribute("DBConnection");
	    	snDao= new SaveNoteDao(conn);
	 	}
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
			String action=request.getParameter("action");

			
	        try {
		        	if(action.equals("notesave"))
		        	{
		        		saveNote(request, response);	
		        	}        	
		        	else if(action.equals("editnote"))
		        	{
		        		editNote(request,response);
		        	}
		        	else if(action.equals("updatenote"))
		        	{
		        		updateNote(request,response);
		        	}
		        	else if(action.equals("deleteDoc"))
		        	{
		        		deleteDoc(request,response);
		        		editNoteDelfile(request,response);
		        	}
		        	else if(action.equals("deleteImg"))
		        	{
		        		deleteImg(request,response);
		        		editNoteDelfile(request,response);
		        	}
		        	else if(action.equals("deleteRec"))
		        	{
		        		deleteRec(request,response);
		        		editNoteDelfile(request,response);
		        	}
		        	else if(action.equals("deletenote"))
		        	{
		        		deleteNote(request,response);
		        	}
		        	
	        	} catch (SQLException e) {        	
		        	request.setAttribute("msg",message);		
					request.getRequestDispatcher("errorpage.jsp").forward(request,response);
					e.printStackTrace();
	        }
	  
	  }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private void saveNote(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException 
	{
		
		Date currentDate = new Date(); 
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd");	        
        String date=ft.format(currentDate);
        session=request.getSession();
		String uid;
		if(session.getAttribute("id")==null)
		{
			uid="1";
		}
		else {
			uid=session.getAttribute("id").toString();
		}
		
        String id = request.getParameter("noteid");
		String title = request.getParameter("title");
	    String text = request.getParameter("quickNote");	
	    String geoloc=request.getParameter("gps");
	    String loc=request.getParameter("loc");
	    Note note1=new Note(id,title,text,date,geoloc,loc);
	    
	    List<Part> imgsPart= request.getParts().stream().filter(part -> "imagefile".equals(part.getName())).collect(Collectors.toList()); 
	    List<Part> docsPart= request.getParts().stream().filter(part -> "docfile".equals(part.getName())).collect(Collectors.toList()); 
	    List<Part> recsPart= request.getParts().stream().filter(part -> "recordingfile".equals(part.getName())).collect(Collectors.toList());
	    
	    if(snDao.insertNote(uid,note1,imgsPart,docsPart,recsPart))	    
	    {	
		    	response.sendRedirect("ViewNoteController?action=viewNote");	    
	    }
	    else
	    {
	    	request.setAttribute("msg",message);
        	RequestDispatcher dispatcher = request.getRequestDispatcher("errorpage.jsp");
  	        dispatcher.forward(request, response);
	    }
	   
    }
	   private void editNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {		  
		   String noteId1 =request.getParameter("param"); 
		   String noteTitle =request.getParameter("param2");

		   session=request.getSession();
		   String uid=session.getAttribute("id").toString();
			
			if(noteId1.length()>0)
			{  
				List<FileBean> listNoteDocs=snDao.getDocforEdit(uid,noteId1);
				List<FileBean> listNoteImages=snDao.getImgforEdit(uid,noteId1);
				List<FileBean> listNoteRecs=snDao.getRecforEdit(uid,noteId1);
				
				Note note=snDao.getNoteforEdit(uid,noteId1);
				
			 	 request.setAttribute("noteTitle",note.getTitle());
	        	 request.setAttribute("noteNote",note.getNote());
	        	 request.setAttribute("noteId",noteId1);
	        	 request.setAttribute("noteLoc",note.getLocation());
	        	 request.setAttribute("noteGps",note.getGps());
				 request.setAttribute("listNoteDocs",listNoteDocs);	
				 request.setAttribute("listNoteImages", listNoteImages);
				 request.setAttribute("listNoteRecs",listNoteRecs);
				 
				 RequestDispatcher dispatcher = request.getRequestDispatcher("editNote.jsp");
	        	 dispatcher.forward(request, response);
		     } 
	
	        else
		        {
	        	request.setAttribute("msg","Something went wrong with selecting note to edit..");
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("errorpage.jsp");
		  	        dispatcher.forward(request, response);
		        }
			   
	    }

	   private void editNoteDelfile(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {		  		  
		   String noteId2=request.getParameter("noteid");
		   session=request.getSession();
			String uid=session.getAttribute("id").toString();
			
			 if(noteId2.length()>0)
			{
					List<FileBean> listNoteDocs=snDao.getDocforEdit(uid,noteId2);
					List<FileBean> listNoteImages=snDao.getImgforEdit(uid,noteId2);
					List<FileBean> listNoteRecs=snDao.getRecforEdit(uid,noteId2);
					Note note=snDao.getNoteforEdit(uid,noteId2);
					
				 	 request.setAttribute("noteTitle",note.getTitle());
		        	 request.setAttribute("noteNote",note.getNote());
		        	 request.setAttribute("noteId",noteId2);
		        	 request.setAttribute("noteLoc",note.getLocation());
		        	 request.setAttribute("noteGps",note.getGps());
		        	 request.setAttribute("listNoteImages", listNoteImages);
					 request.setAttribute("listNoteDocs",listNoteDocs);	
					 request.setAttribute("listNoteRecs",listNoteRecs);	
					 
		        	 RequestDispatcher dispatcher = request.getRequestDispatcher("editNote.jsp");
		        	 dispatcher.forward(request, response);
		    	       
			}
	        else
		        {
	        	request.setAttribute("msg","Something went wrong with selecting note to edit..");
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("errorpage.jsp");
		  	        dispatcher.forward(request, response);
		        }
			   
	    }
	private void updateNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {		  		   
				   Date currentDate = new Date(); 
			        SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd");	        
			        String date=ft.format(currentDate);
			        session=request.getSession();
					String uid=session.getAttribute("id").toString();
					
			        String id = request.getParameter("noteid");
					String title = request.getParameter("title");
				    String note = request.getParameter("quickNote");	
				    String geoloc=request.getParameter("gps");
				    String loc=request.getParameter("loc");
				    Note note1=new Note(id,title,note,date,geoloc,loc);
				    
				    List<Part> imgsPart= request.getParts().stream().filter(part -> "imagefile".equals(part.getName())).collect(Collectors.toList()); 
				    List<Part>	docsPart= request.getParts().stream().filter(part -> "docfile".equals(part.getName())).collect(Collectors.toList()); 
				    List<Part>	recsPart= request.getParts().stream().filter(part -> "recordingfile".equals(part.getName())).collect(Collectors.toList());
				    
			if(snDao.updateNote(uid,note1,imgsPart,docsPart,recsPart))
		        { 
				   response.sendRedirect("ViewNoteController?action=viewNote");	    	       
		        }         
	        else
		        {
	        	    request.setAttribute("msg","Something went wrong with selecting updating the note. ..");
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("errorpage.jsp");
		  	        dispatcher.forward(request, response);
		        }
			   
	    }
	   private void deleteNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		   String noteid=request.getParameter("paramID"); 
		   session=request.getSession();
			String uid=session.getAttribute("id").toString();
			
			   if(noteid.length()>0)
		        { 
		        	 if(snDao.deleteNote(uid,noteid))  				 			   	
		        	 {
			        	 RequestDispatcher dispatcher = request.getRequestDispatcher("ViewNoteController?action=viewNote");
			        	 dispatcher.forward(request, response);
		        	 }
		        }         
	        else
		        {        		
	        		request.setAttribute("msg","Something went wrong on deleting the selected note...");
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("errorpage.jsp");
		  	        dispatcher.forward(request, response);
		        }
			   
	    }

	   private void deleteDoc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		   String noteId=request.getParameter("noteid");		   
		   String docId=request.getParameter("docId");
		   session=request.getSession();
			String uid=session.getAttribute("id").toString();
			
		   if(snDao.deleteDoc(uid,noteId,docId))  				 			   	
	        {
		        	//todo
	       }        
       else
	        {        		
       		   request.setAttribute("msg","Something went wrong on deleting the selected doc...");
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("errorpage.jsp");
	        			dispatcher.forward(request, response);
	        }
		}
	   private void deleteImg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		   String noteId=request.getParameter("noteid");		   
		   String imgId=request.getParameter("imgId");	
		   session=request.getSession();
			String uid=session.getAttribute("id").toString();
			
	      if(snDao.deleteImg(uid,noteId,imgId))  				 			   	
	        {
		        	//todo
	       }        
	      else
	        {        		
       		   request.setAttribute("msg","Something went wrong on deleting the selected image...");
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("errorpage.jsp");
	        			dispatcher.forward(request, response);
	        }
		}

	   private void deleteRec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		   String noteId=request.getParameter("noteid");		   
		   String RecId=request.getParameter("recId");	
		   session=request.getSession();
			String uid=session.getAttribute("id").toString();
			
	      if(snDao.deleteRec(uid,noteId,RecId))  				 			   	
	        {
		        	//todo
	       }        
	      else
	        {        		
       		   request.setAttribute("msg","Something went wrong on deleting the selected record...");
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("errorpage.jsp");
	        			dispatcher.forward(request, response);
	        }
		}

}
