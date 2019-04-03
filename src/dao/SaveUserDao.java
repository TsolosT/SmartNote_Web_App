package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;

public class SaveUserDao {

	private  Connection conn;

	public SaveUserDao(Connection conn) {
		this.conn=conn;
	}
	
	public boolean insertUser(User user) throws SQLException {
		boolean rowInserted = false;
		PreparedStatement ps;
		ResultSet resultQ1;		   
		int userId=0;
		if(!signUpValidation(user.getUserName(),user.getEmail()))
		{
			ps=conn.prepareStatement("SELECT COUNT(User_ID) as pluthos from user");
			resultQ1=ps.executeQuery();
			resultQ1.next();
			userId=resultQ1.getInt(1)+1;
				
			ps = conn.prepareStatement("insert into user values(?,?,?,?,?,?)"); 
			ps.setLong(1,userId);
			ps.setString(2, user.getUserName());
			ps.setString(3, user.getUserPwd());
			ps.setString(4, user.getfName());
			ps.setString(5, user.getlName());
			ps.setString(6, user.getEmail());            	
			rowInserted = ps.executeUpdate() > 0;	
			ps.close();
		}
	
		return rowInserted;      
    }
	public boolean signUpValidation(String uName,String email) throws SQLException { 
		boolean exist = false;	
		PreparedStatement ps;
		ResultSet rs;		   	
		int cnt=0;
		ps=conn.prepareStatement("SELECT count(User_ID) as gg from user where User_Name='"+uName+"' OR Email='"+email+"' ");
		rs=ps.executeQuery();
		rs.next();
		cnt=rs.getInt(1);
		if(cnt>0)
		{
			exist=true;
		}
		
		return exist;      
    }
	
	
	public boolean loginUser(User user1) throws SQLException
	{	boolean exist = false;
		PreparedStatement ps;
		ResultSet rs;
		int cnt=0;

		ps=conn.prepareStatement("SELECT * FROM user where User_Name = '"+user1.getUserName()+"' and User_Password='"+user1.getUserPwd()+"' ");
		rs=ps.executeQuery();
		rs.next();
		cnt=rs.getInt(1);
		if(cnt>0)
		{
			exist=true;
		}

		return exist;

	}
	public User getLoggedUserInfo(String uName) throws SQLException {
        User user = new User();
        PreparedStatement ps;
        ResultSet rs;
        ps=conn.prepareStatement("SELECT * from user where User_Name='"+uName+"'");
        rs=ps.executeQuery();
        rs.next();
        user.setUserId(rs.getString(1));
        user.setUserName(rs.getString(2));
        user.setUserPwd(rs.getString(3));
        user.setfName(rs.getString(4));
        user.setlName(rs.getString(5));
        user.setEmail(rs.getString(6));
        return user;
    }
}
