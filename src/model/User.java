package model;

public class User {
	
private String userId;
private String userName;
private String userPwd;
private String fName;
private String lName;
private String email;

public User() {}

public User( String userName, String userPwd, String fName, String lName, String email) {
	this.userName = userName;
	this.userPwd = userPwd;
	this.fName = fName;
	this.lName = lName;
	this.email = email;
}

public User(String userId, String userName, String userPwd, String fName, String lName, String email) {
	this.userId = userId;
	this.userName = userName;
	this.userPwd = userPwd;
	this.fName = fName;
	this.lName = lName;
	this.email = email;
}


public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getUserPwd() {
	return userPwd;
}
public void setUserPwd(String userPwd) {
	this.userPwd = userPwd;
}
public String getfName() {
	return fName;
}
public void setfName(String fName) {
	this.fName = fName;
}
public String getlName() {
	return lName;
}
public void setlName(String lName) {
	this.lName = lName;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}



}
