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
import com.mysql.jdbc.Blob;
import model.FileBean;
import model.Note;


public class ViewNoteDao {
	
	private  Connection conn;

	public ViewNoteDao(Connection conn) {
		this.conn=conn;
	}


    public List<Note> displayAllNotes(String uid) throws SQLException {
		    List<Note> listNote = new ArrayList<>();
		    String query="select * from notes where User_ID='"+uid+"' and deleted='0'";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next())
			{
				String id=resultSet.getString(1);
				String title = resultSet.getString(3);
				String dbtext = resultSet.getString(4);
				String dbdate = resultSet.getString(5);
				String dblocation = resultSet.getString(6);
				String dbgps = resultSet.getString(7);

				Note note = new Note(id,title,dbtext,dbdate,dblocation,dbgps);
				listNote.add(note);
		}

		return listNote;
	}

	public List<FileBean> displayAllImagesNote(String uid) throws SQLException, IOException{
		List<FileBean> listNoteImages = new ArrayList<>();		
		PreparedStatement ps;
		ResultSet rs;
		
		ps = conn.prepareStatement("select * from photographies where  User_ID='"+uid+"' and deleted='0'");
		rs=ps.executeQuery();
		
		while(rs.next())
		{	FileBean images=new FileBean();
		
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
            
			listNoteImages.add(images);
		}
		
		
		
		return listNoteImages;
	}
	
	public List<FileBean> displayAllFiles(String uid) throws SQLException {

	    List<FileBean> listNoteDocs = new ArrayList<>();



        PreparedStatement ps1;
        ResultSet rs1;

        ps1 = conn.prepareStatement("select * from files where  User_ID='"+uid+"' and deleted='0'");
        rs1=ps1.executeQuery();

        while(rs1.next()){

            FileBean files = new FileBean();
            String fileName = rs1.getString(5);
            String noteId = rs1.getString(2);
            

            files.setNoteId(noteId);
            files.setName(fileName);
            files.setBytes(rs1.getBytes("file"));
            files.setId(rs1.getString(1));
            
            listNoteDocs.add(files);
        }

	    return listNoteDocs;

    }
	
	public List<FileBean> displayAllRecs(String uid) throws SQLException {

	    List<FileBean> listNoteRecs = new ArrayList<>();
        PreparedStatement ps1;
        ResultSet rs1;

        ps1 = conn.prepareStatement("select * from recordings where  User_ID='"+uid+"' and deleted='0'");
        rs1=ps1.executeQuery();

        while(rs1.next()){

            FileBean files = new FileBean();
            String fileName = rs1.getString(5);
            String noteId = rs1.getString(2);

            files.setNoteId(noteId);
            files.setName(fileName);
            files.setBytes(rs1.getBytes(4));
            files.setId(rs1.getString(1));

            listNoteRecs.add(files);
        }

	    return listNoteRecs;

    }
	public FileBean getSelectedFileforDownload(String uid,String fileName,String noteid) throws SQLException, IOException{
		FileBean file=new FileBean();	
		PreparedStatement ps;
		ResultSet rs;
		
		ps = conn.prepareStatement("select * from files where  User_ID='"+uid+"' and Note_ID='"+noteid+"' and fileName='"+fileName+"' ");
		rs=ps.executeQuery();
	
			if(rs.next())
			{
	            file.setBytes(rs.getBytes(4));
	            file.setNoteId(rs.getString(2));
	            file.setName(rs.getString(5));
			}
			else
			{
				ps = conn.prepareStatement("select * from recordings where  User_ID='"+uid+"' and Note_ID='"+noteid+"' and RecName='"+fileName+"' ");
				rs=ps.executeQuery();
				
					rs.next();
					
					file.setNoteId(rs.getString(2));
			        file.setName(rs.getString(5));
					file.setBytes(rs.getBytes("Recording"));
		           
			}
	            
		return file;
	}

	public Note getNote(String uid,String noteid) throws SQLException, IOException{	
		PreparedStatement ps;
		ResultSet rs;
		Note note =new Note();
		
		ps = conn.prepareStatement("select * from notes where User_ID='"+uid+"' and Note_ID='"+noteid+"'");
		rs=ps.executeQuery();
		
		if(rs.next())
		{
			String id=rs.getString(1);
			String title = rs.getString(3);
			String dbtext = rs.getString(4);
			String dbdate = rs.getString(5);
			String dblocation = rs.getString(6);
			String dbgps = rs.getString(7);

			note = new Note(id,title,dbtext,dbdate,dblocation,dbgps);
		}
	 
		return note;
	}
	public List<FileBean> getNoteImages(String uid,String noteid) throws SQLException, IOException{	
		PreparedStatement ps;
		ResultSet rs;
		List<FileBean> imglist=new ArrayList<>();
		ps = conn.prepareStatement("select * from photographies where User_ID='"+uid+"' and Note_ID='"+noteid+"' and deleted='0'");
		rs=ps.executeQuery();
		
		while(rs.next())
		{
			FileBean img=new FileBean();
			img.setBytes(rs.getBytes(4));
            img.setName(rs.getString(6));

			imglist.add(img);
		}
	 
		return imglist;
	}
	public List<FileBean> getNoteDocs(String uid,String noteid) throws SQLException, IOException{	
		PreparedStatement ps;
		ResultSet rs;
		List<FileBean> doclist=new ArrayList<>();
		ps = conn.prepareStatement("select * from files where User_ID='"+uid+"' and Note_ID='"+noteid+"' and deleted='0'");
		rs=ps.executeQuery();
		
		while(rs.next())
		{
			FileBean doc=new FileBean();
			doc.setBytes(rs.getBytes(4));
            doc.setName(rs.getString(5));

			doclist.add(doc);
		}
	 
		return doclist;
	}
	public List<FileBean> getNoteRecs(String uid,String noteid) throws SQLException, IOException{	
		PreparedStatement ps;
		ResultSet rs;
		List<FileBean> reclist=new ArrayList<>();
		ps = conn.prepareStatement("select * from recordings where User_ID='"+uid+"' and Note_ID='"+noteid+"' and deleted='0'");
		rs=ps.executeQuery();
		
		while(rs.next())
		{
			FileBean rec=new FileBean();
			rec.setBytes(rs.getBytes(4));
            rec.setName(rs.getString(5));

			reclist.add(rec);
		}
	 
		return reclist;
	}
}
