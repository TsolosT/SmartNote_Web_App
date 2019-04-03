package model;

import java.util.Scanner;

public class Note {
	
	private String id;
	private String title;
	private String note;
	private String date;
	private String location;
	private String gps;
	
	public Note(String id1,String title1,String note1,String date1,String location1,String gps1)
	{
		id=id1;
		title=title1;
		note=note1;
		date=date1;
		location=location1;
		gps=gps1;
	}
	public Note(String title1,String note1,String date1)
	{
		title=title1;
		note=note1;
		date=date1;
		location="";
		gps="";
	}
	public Note(String id1,String title1,String note1,String date1,String gps1)
	{
		id=id1;
		title=title1;
		note=note1;
		date=date1;
		location="";
		gps=gps1;
	}
	public Note(String title1,String note1,String date1,String gps1)
	{

		title=title1;
		note=note1;
		date=date1;
		location="";
		gps=gps1;
	}
	public Note() {
		
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getGps() {
		return gps;
	}
	public void setGps(String gps) {
		this.gps = gps;
	}
	
	public String returnNoteFormat() {
		String noteformated;
		String text;
		
		Scanner in=new Scanner(this.getNote());
		text=new String();
		while(in.hasNextLine())
		{
			text+=in.nextLine();
		}
		 text=text.replaceAll("\\<.*?>"," ");
		 in.close();
		 
		 noteformated="Title: "+this.getTitle()+"\n"+"Date: "+this.getDate()
		 +"\nLocation: "+this.getLocation()+"\nGps: "+this.getGps()
		 +"\n------------------------------------- \n"+"Note: \n"+text+"\n";
		 
		
		return noteformated;	
	}
}
