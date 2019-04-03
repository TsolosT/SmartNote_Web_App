package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SaveUserDao;
import model.User;

/**
 * Servlet implementation class UserController
 */
@WebServlet(name = "UserController", urlPatterns = { "/UserController" })
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = null;
	private SaveUserDao suDao;
	HttpSession session;
	String message="Something went wrong with server...";
	String valmsg="The user name or the email already exist try again with new one..";
	String smsg = "The user name or password is wrong.";
	String Msg = "You have logged out successfully";
	 public void init() throws ServletException 
     {   	   
    	conn = (Connection) getServletContext().getAttribute("DBConnection");
    	suDao= new SaveUserDao(conn);
 	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		
        try {
	        	if(action.equals("addUser"))
	        	{
	        		saveUser(request, response);	
	        	}
	        	else if(action.equals("loginUser"))
				{
					loginUser(request, response);
				}
				else if (action.equals("logOut"))
				{
					logOut(request,response);
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

	private void saveUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
		String User_Name, User_Password, Email, First_Name, Last_Name;
		User_Name = request.getParameter("User_Name");
		User_Password = request.getParameter("User_Password");
		First_Name = request.getParameter("First_Name");
		Last_Name = request.getParameter("Last_Name");
		Email = request.getParameter("Email");
	
		User user=new User(User_Name,User_Password,First_Name,Last_Name,Email);
	    if(!suDao.insertUser(user))
	    {
	    	request.setAttribute("msg",valmsg);		
			request.getRequestDispatcher("SignUp.jsp").forward(request,response);
	    }
	    
	    response.sendRedirect("index.jsp");
    }
	private void loginUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
	    session=request.getSession();
		User user1 = new User();
		user1.setUserName(request.getParameter("User_Name"));
		user1.setUserPwd(request.getParameter("User_Password"));

		if (suDao.loginUser(user1)) {

			 user1=suDao.getLoggedUserInfo(user1.getUserName());
			 session.setAttribute("id",user1.getUserId());
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", smsg);
			request.getRequestDispatcher("LogIn.jsp").forward(request, response);
		}

	}
	private void logOut(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		HttpSession session = request.getSession(false);
		if (session != null) 
		{
			session.invalidate();
			request.setAttribute("msg", Msg);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
}
