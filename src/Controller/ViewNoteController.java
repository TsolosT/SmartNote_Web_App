package Controller;

import dao.ViewNoteDao;
import model.FileBean;
import model.Note;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;

import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@WebServlet(name = "ViewNoteController", urlPatterns =  { "/ViewNoteController" })
@MultipartConfig(maxFileSize = 33554432)
public class ViewNoteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = null;
    private ViewNoteDao vnDao;
    private HttpSession session;
    String message="Something went wrong with server...";
    public static final String FILE_SEPARATOR = System.getProperty("file.separator");

    public void init() throws ServletException {
        conn = (Connection) getServletContext().getAttribute("DBConnection");
        vnDao = new ViewNoteDao(conn);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action.equals("viewNote")) {
                viewNotes(request, response);
            }
            else if  (action.equals("searchNote")){
                searchNote(request,response);
            }
            else if(action.equals("downloadfile"))
            {
            	downloadfile(request,response);
            }
            else if(action.equals("downloadnote"))
            {
            	downloadNote(request,response);
            }
        } catch (SQLException e) {
        	request.setAttribute("msg",message);		
			request.getRequestDispatcher("errorpage.jsp").forward(request,response);
                e.printStackTrace();
        }


    }

	private void viewNotes(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		List<Note> listNote=new ArrayList<>();
		List<FileBean> listNoteImages=new ArrayList<>();
		List<FileBean> listNoteDocs=new ArrayList<>();
		List<FileBean> listNoteRecs=new ArrayList<>();
		String ListSize;
		session=request.getSession();
		
		if(session.getAttribute("id")==null)
		{
			listNote=null;
			ListSize=null;
		}
		else 
		{
			String uid=session.getAttribute("id").toString();
			listNote = vnDao.displayAllNotes(uid);
			listNoteImages=vnDao.displayAllImagesNote(uid);
	        listNoteDocs = vnDao.displayAllFiles(uid);
	        listNoteRecs = vnDao.displayAllRecs(uid);
	        ListSize=Integer.toString(listNote.size());
	             
		}
			
	        request.setAttribute("listNote", listNote);        
	        request.setAttribute("listNoteSize",ListSize);
	        request.setAttribute("listNoteImages", listNoteImages);
	        request.setAttribute("listNoteDocs",listNoteDocs);
	        request.setAttribute("listNoteRecs",listNoteRecs);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewNotes.jsp");
        dispatcher.forward(request, response);

    }
 
    private void searchNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
    	session=request.getSession();
		String uid=session.getAttribute("id").toString();
    	
    	String searchValue;
        List<Note> result;
        List<FileBean> resultImg;
        List<FileBean> resultRec;
        List<Note> listNote = vnDao.displayAllNotes(uid);
        List<FileBean> resultDocs;
        searchValue=request.getParameter("searchString");
        result= search(searchValue,listNote);
        String ListSize=Integer.toString(result.size()) ;
        resultDocs = vnDao.displayAllFiles(uid);
        resultImg=vnDao.displayAllImagesNote(uid);
        resultRec=vnDao.displayAllRecs(uid);

            request.setAttribute("listNote",result);
            request.setAttribute("listNoteSize",ListSize);
            request.setAttribute("listNoteDocs",resultDocs);
            request.setAttribute("listNoteRecs",resultRec);
            request.setAttribute("listNoteImages",resultImg);
            RequestDispatcher dispatcher = request.getRequestDispatcher("searchViewNotes.jsp");
            dispatcher.forward(request, response);


    }
    public List<Note> search(String searchStr, List<Note> aList)
    {
        List<Note> resultList = new ArrayList<>();
        for(Note note: aList)
        {
            if(note.getTitle().contains(searchStr) || note.getNote().contains(searchStr) || note.getDate().contains(searchStr) || note.getLocation().contains(searchStr))
            {
                resultList.add(note);
            }
        }

        return resultList;
    }
    

    private void downloadfile(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
    	session=request.getSession();
		String uid=session.getAttribute("id").toString();
    	String fileName=request.getParameter("fileName");
		String noteid=request.getParameter("noteId");
		FileBean file=new FileBean();
		file=vnDao.getSelectedFileforDownload(uid,fileName,noteid);
	
		if(file.getName().contains(".txt"))
		{
			response.setContentType( "text/plain" );
		}
		else if (file.getName().contains(".doc"))
		{
			response.setContentType( "application/msword" );
		}
		else if (file.getName().contains(".xls"))
		{
			response.setContentType( "application/vnd.ms-excel" );
		}
		else if (file.getName().contains(".pdf"))
		{
			response.setContentType( "application/pdf" );
		}
		else if (file.getName().contains(".ppt"))
		{
			response.setContentType( "application/ppt" );
		}
		else if(file.getName().contains(".mp3"))
		{
			response.setContentType("application/force-download");
		}
		else
		{
			response.setContentType( "application/octet-stream" );
		}
		
		response.setHeader("Content-Disposition","attachment; filename=\""+file.getName()+"\"");
		response.setHeader("cache-control", "no-cache");

		byte[] fileBytes=file.getBytes();

		ServletOutputStream outs = response.getOutputStream();
		outs.write(fileBytes);
		outs.flush();
		outs.close();
		   
		
	}
    protected void downloadNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        session=request.getSession();
        String uid=session.getAttribute("id").toString();
        BufferedWriter bf;
        String noteid=request.getParameter("noteId");
        Note note=new Note();
        note=vnDao.getNote(uid,noteid);

        String formatedNote=note.returnNoteFormat();
        String zipname=note.getTitle()+".zip";
        String path="D:/wubeast/Αρχεια(διαφορα)/java/SmartNote_App_Version1/WebContent/noteStore/";
        List<FileBean> imglist=new ArrayList<>();
        List<FileBean> doclist=new ArrayList<>();
        List<FileBean> reclist=new ArrayList<>();
        imglist=vnDao.getNoteImages(uid, noteid);
        doclist=vnDao.getNoteDocs(uid, noteid);
        reclist=vnDao.getNoteRecs(uid, noteid);
        
        File file = new File(path+note.getTitle()+"/"+note.getTitle()+".txt");
        file.getParentFile().mkdir();
        bf= new BufferedWriter(new FileWriter(file));
        bf.write(formatedNote);
        bf.close();
      
        for(FileBean img:imglist)
          {
          	FileUtils.writeByteArrayToFile((new File(path+note.getTitle()+"\\"+img.getName())),img.getBytes());  	
          }	
        for(FileBean doc:doclist)
        {
        	FileUtils.writeByteArrayToFile((new File(path+note.getTitle()+"\\"+doc.getName())),doc.getBytes());  	
        }	
        for(FileBean rec:reclist)
        {
        	FileUtils.writeByteArrayToFile((new File(path+note.getTitle()+"\\"+rec.getName())),rec.getBytes());  	
        }
            File directory = new File(path+note.getTitle());
            String[] files = directory.list();


            if (files != null && files.length > 0) {

                byte[] zip = zipFiles(directory, files);
                ServletOutputStream sos = response.getOutputStream();
                response.setContentType("application/zip");
                response.setHeader("Content-Disposition", "attachment; filename="+zipname+"");

                sos.write(zip);
                sos.flush();

        }
            FileUtils.deleteDirectory(directory);

    }
    
    private byte[] zipFiles(File directory, String[] files) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ZipOutputStream zos = new ZipOutputStream(baos);
        byte bytes[] = new byte[2048];

        for (String fileName : files) {
            FileInputStream fis = new FileInputStream(directory.getPath() + ViewNoteController.FILE_SEPARATOR + fileName);
            BufferedInputStream bis = new BufferedInputStream(fis);

            zos.putNextEntry(new ZipEntry(fileName));

            int bytesRead;
            while ((bytesRead = bis.read(bytes)) != -1) {
                zos.write(bytes, 0, bytesRead);
            }
            zos.closeEntry();
            bis.close();
            fis.close();
        }
        zos.flush();
        baos.flush();
        zos.close();
        baos.close();

        return baos.toByteArray();
    }

       
}
