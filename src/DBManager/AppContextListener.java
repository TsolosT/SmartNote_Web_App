package DBManager;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {

	    public void contextInitialized(ServletContextEvent servletContextEvent) {
	    	ServletContext ctx = servletContextEvent.getServletContext();
	    	
	    	//initialize DB Connection
	    	String dbURL ="jdbc:mysql://localhost:3306/smartnote_appdb";
	    	String user ="root";
	    	String pwd = "123456smartnote";
	    	
	    	try {
				DbManager connectionManager = new DbManager(dbURL, user, pwd);
				ctx.setAttribute("DBConnection", connectionManager.getConnection());
				System.out.println("DB Connection initialized successfully.");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				System.out.println("Class not found error");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Cant connect to database");
			}
	    	
	    }
	    public void contextDestroyed(ServletContextEvent servletContextEvent) {
	    	Connection con = (Connection) servletContextEvent.getServletContext().getAttribute("DBConnection");
	    	try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    }
		
}
