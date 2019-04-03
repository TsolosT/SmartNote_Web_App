package DBManager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

  
	
@WebServlet(name = "DbManager", urlPatterns = { "/DbManager" })
public class DbManager extends HttpServlet {

	private static final long serialVersionUID = 1L;
		private Connection connection;
			
			public DbManager(String dbURL, String user, String pwd) throws ClassNotFoundException, SQLException{
				Class.forName("com.mysql.jdbc.Driver");
				this.connection = DriverManager.getConnection(dbURL, user, pwd);
			}
			
			public Connection getConnection(){
				return this.connection;
	}

}
	

