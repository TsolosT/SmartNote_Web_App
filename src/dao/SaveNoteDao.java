package dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.Part;

import com.mysql.jdbc.Blob;

import model.FileBean;
import model.Note;

public class SaveNoteDao {
	
	private  Connection conn;

	public SaveNoteDao(Connection conn) {
		this.conn=conn;
	}

	
	public boolean insertNote(String userid,Note note,List<Part> imgsPart,List<Part> docsPart,List<Part> recsPart) throws SQLException, IOException {
		boolean rowInserted;		
		PreparedStatement ps;
		ResultSet resultQ1;		   
		int noteId=0;
		
		ps=conn.prepareStatement("select count(Note_ID) as pluthos from notes where User_ID='"+userid+"'");
		resultQ1=ps.executeQuery();
		resultQ1.next();
		noteId=resultQ1.getInt(1)+1;
	
		
		ps = conn.prepareStatement("insert into notes values(?,?,?,?,?,?,?,?)"); 
			 ps.setLong(1, noteId);
			 ps.setString(2, userid); //user id
			 ps.setString(3, note.getTitle());
			 ps.setString(4, note.getNote());
			 ps.setString(5, note.getDate());
			 ps.setString(6, note.getLocation());
			 ps.setString(7, note.getGps());
			 ps.setString(8, "0");
		rowInserted = ps.executeUpdate() > 0;	
		if(imgsPart.size()>0)
		{
			insertImage(userid,imgsPart,noteId);
		}
		if(docsPart.size()>0)
		{
			insertDoc(userid,docsPart,noteId);
		}
		if(recsPart.size()>0)
		{
			insertRec(userid,recsPart,noteId);
		}
		ps.close();
		return rowInserted;      
    }
	public boolean updateNote(String userid,Note note,List<Part> imgsPart,List<Part> docsPart,List<Part> recsPart) throws SQLException, NumberFormatException, IOException { 
		boolean rowUpdated = false;
		PreparedStatement ps;
		
		ps=conn.prepareStatement("update notes set Title='"+note.getTitle()+"',Text='"+note.getNote()+"',Location='"+note.getLocation()+"',Geographical_position='"+note.getGps()+"' where User_ID='"+userid+"' and Note_ID='"+note.getId()+"'");
	
		rowUpdated=ps.executeUpdate()>0;
		if(imgsPart.size()>0)
		{
			insertImage(userid,imgsPart,Integer.parseInt(note.getId()));
		}
		if(docsPart.size()>0)
		{
			insertDoc(userid,docsPart,Integer.parseInt(note.getId()));
		}
		if(recsPart.size()>0)
		{
			insertRec(userid,recsPart,Integer.parseInt(note.getId()));
		}
		ps.close();
		return rowUpdated;  
			    
    }
	public boolean deleteNote(String userid,String noteid) throws SQLException { 
		boolean rowDeleted = false;
		PreparedStatement ps,ps1,ps2,ps3;
				ps1=conn.prepareStatement("update photographies  set deleted='1' where User_ID='"+userid+"' and Note_ID='"+noteid+"'");
				ps1.executeUpdate();
				ps2=conn.prepareStatement("update files set deleted='1' where User_ID='"+userid+"' and Note_ID='"+noteid+"'");
				ps2.executeUpdate();
				ps3=conn.prepareStatement("update recordings set deleted='1' where User_ID='"+userid+"' and Note_ID='"+noteid+"'");
				ps3.executeUpdate();
				ps=conn.prepareStatement("update notes set deleted='1' where User_ID='"+userid+"' and Note_ID='"+noteid+"'");
				rowDeleted=ps.executeUpdate() > 0;

		return rowDeleted;  
			    
    }
	
	public boolean insertImage(String userid,List<Part> parts ,int noteId) throws SQLException, IOException {
		boolean rowImgInserted = false;	
		InputStream istream;
		PreparedStatement ps = null;
		ResultSet resultQ1;		   
		int photoId=0;
		String fileName;
		
		for (Part filePart : parts) {       
	        istream=filePart.getInputStream();   
	        if(istream.available()>0)
	        {
		        ps=conn.prepareStatement("select count(Photo_ID) as pluthos from photographies where User_ID='"+userid+"' and Note_ID='"+noteId+"'");
				resultQ1=ps.executeQuery();
				resultQ1.next();
				photoId=resultQ1.getInt(1)+1;
				
				fileName=extractFileName(filePart);
				
				ps = conn.prepareStatement("insert into photographies values(?,?,?,?,?,?)"); 
					 ps.setLong(1, photoId);
					 ps.setLong(2, noteId);
					 ps.setString(3, userid);
					 ps.setBlob(4, istream);	
					 ps.setString(5,"0");
					 ps.setString(6, fileName);
			 	 rowImgInserted = ps.executeUpdate() > 0;	
	        }
	    }
		

		return rowImgInserted;		
	}
	public boolean insertDoc(String userid,List<Part> parts ,int noteId) throws SQLException, IOException {
		boolean rowDocInserted = false;	
		InputStream istream;  
		String fileName;
		PreparedStatement ps = null;
		ResultSet resultQ1;		   
		int docfileId=0;
		
		for (Part filePart : parts) 			
		{   istream=filePart.getInputStream();  
			 if(istream.available()>0)
		        {
					ps=conn.prepareStatement("select count(File_ID) as pluthos from files where User_ID='"+userid+"' and Note_ID='"+noteId+"'");
					resultQ1=ps.executeQuery();
					resultQ1.next();
					docfileId=resultQ1.getInt(1)+1;
				
				
				fileName=extractFileName(filePart);
				
				ps = conn.prepareStatement("insert into files values(?,?,?,?,?,?)"); 
					 ps.setLong(1, docfileId);
					 ps.setLong(2, noteId);
					 ps.setString(3, userid);
					 ps.setBlob(4, istream);
					 ps.setString(5,fileName);
					 ps.setString(6,"0");
				 	 rowDocInserted = ps.executeUpdate() > 0;
		        }
			}
			
	 	 	
		return rowDocInserted;		
	}
	public boolean insertRec(String userid,List<Part> parts ,int noteId) throws SQLException, IOException {
		boolean rowRecInserted = false;	
		InputStream istream;  
		String fileName;
		PreparedStatement ps = null;
		ResultSet resultQ1;		   
		int recfileId=0;
		
		for (Part filePart : parts) 			
		{  	istream=filePart.getInputStream();  
			 if(istream.available()>0)
		        { 
					ps=conn.prepareStatement("select count(Recording_ID) as pluthos from recordings where User_ID='"+userid+"' and Note_ID='"+noteId+"'");
					resultQ1=ps.executeQuery();
					resultQ1.next();
					recfileId=resultQ1.getInt(1)+1;
					
					
					fileName=extractFileName(filePart);
					
					ps = conn.prepareStatement("insert into recordings values(?,?,?,?,?,?)"); 
						 ps.setLong(1, recfileId);
						 ps.setLong(2, noteId);
						 ps.setString(3, userid);
						 ps.setBlob(4, istream);
						 ps.setString(5,fileName);
						 ps.setString(6,"0");
					 	 rowRecInserted = ps.executeUpdate() > 0;
		        }
			}

	 	 	
		return rowRecInserted;		
	}
	
	private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {

                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');

                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
	
    public Note getNoteforEdit(String userid,String noteId1) throws SQLException {
	    Note note = new Note();
	    String query="select * from notes where User_ID='"+userid+"' and Note_ID='"+noteId1+"' and deleted='0' ";
		PreparedStatement ps = conn.prepareStatement(query);
		ResultSet rs = ps.executeQuery();

			rs.next();
		
			String id=noteId1;
			String title = rs.getString(3);
			String dbtext = rs.getString(4);
			String dbdate = rs.getString(5);
			String dblocation = rs.getString(6);
			String dbgps = rs.getString(7);

			note = new Note(id,title,dbtext,dbdate,dblocation,dbgps);			


			return note;
    }
	 public List<FileBean> getDocforEdit(String userid,String noteId) throws SQLException {
		   PreparedStatement ps;
		   ResultSet rs;
		   List<FileBean> list = new ArrayList<>();
		   
		   ps = conn.prepareStatement("select * from files where User_ID='"+userid+"' and Note_ID='"+noteId+"' and deleted='0'");
			rs = ps.executeQuery();
			
			while(rs.next())	
			{
				 FileBean doc = new FileBean();
				 String fileName = rs.getString(5);
				 String id=rs.getString(1);

	            doc.setNoteId(noteId);
	            doc.setName(fileName);
	            doc.setId(id);
	            
	            list.add(doc);
			}
	   		
	   		return list;
	}
	 
	 public boolean deleteDoc(String userid,String noteid,String docId) throws SQLException { 
			boolean rowDeleted = false;
			PreparedStatement ps;
					ps=conn.prepareStatement("update files set deleted='1' where User_ID='"+userid+"' and Note_ID='"+noteid+"' and File_ID='"+docId+"' ");
					rowDeleted=ps.executeUpdate() > 0;

			return rowDeleted;  
				    
	    }
	 public List<FileBean> getImgforEdit(String userid,String noteId) throws SQLException, IOException {
		   PreparedStatement ps;
		   ResultSet rs;
		   List<FileBean> list = new ArrayList<>();
		   
		   ps = conn.prepareStatement("select * from photographies where User_ID='"+userid+"' and Note_ID='"+noteId+"' and deleted='0'");
			rs = ps.executeQuery();
			
			while(rs.next())				
			{	
				FileBean images=new FileBean();
			
			 	Blob blob = (Blob) rs.getBlob("Photo");
			 	InputStream inputStream = blob.getBinaryStream();
	            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	            byte[] buffer = new byte[4096];
	            int bytesRead = -1;
	            
	            while ((bytesRead = inputStream.read(buffer)) != -1) {
	                outputStream.write(buffer, 0, bytesRead);        
	              
	            }
	            byte[] imageBytes = outputStream.toByteArray();
	            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	             	             
	            inputStream.close();
	            outputStream.close();
	            
	            images.setNoteId(rs.getString(2));
	            images.setBase64Image(base64Image);
	            images.setName(rs.getString(6));
	            images.setId(rs.getString(1));
	            
				list.add(images);
			}
	   		
	   		return list;
	}
	 
	 public boolean deleteImg(String userid,String noteid,String imgId) throws SQLException { 
			boolean rowDeleted = false;
			PreparedStatement ps;
					ps=conn.prepareStatement("update photographies set deleted='1' where User_ID='"+userid+"' and Note_ID='"+noteid+"' and Photo_ID='"+imgId+"' ");
					rowDeleted=ps.executeUpdate() > 0;

			return rowDeleted;  
				    
	    }

	 public List<FileBean> getRecforEdit(String userid,String noteId) throws SQLException {
		   PreparedStatement ps;
		   ResultSet rs;
		   List<FileBean> list = new ArrayList<>();
		   
		   ps = conn.prepareStatement("select * from recordings where User_ID='"+userid+"' and Note_ID='"+noteId+"' and deleted='0'");
			rs = ps.executeQuery();
			
			while(rs.next())	
			{
				 FileBean rec = new FileBean();
				 String fileName = rs.getString(5);
				 String id=rs.getString(1);

	            rec.setNoteId(noteId);
	            rec.setName(fileName);
	            rec.setId(id);
	            
	            list.add(rec);
			}
	   		
	   		return list;
	}
	 
	 public boolean deleteRec(String userid,String noteid,String recId) throws SQLException { 
			boolean rowDeleted = false;
			PreparedStatement ps;
					ps=conn.prepareStatement("update recordings set deleted='1' where User_ID='"+userid+"' and Note_ID='"+noteid+"' and Recording_ID='"+recId+"' ");
					rowDeleted=ps.executeUpdate() > 0;

			return rowDeleted;  
				    
	    }
}
