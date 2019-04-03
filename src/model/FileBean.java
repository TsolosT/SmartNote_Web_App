package model;

public class FileBean {
	private String id;
	private String name;	
	private String noteId;
	private byte[] bytes;
	private String base64Image;
	private String noteid;
	
	
	public FileBean() {}
	
	public FileBean(String noteId,String name, String base64Image) {
		this.name = name;
		this.noteId = noteId;
		this.base64Image = base64Image;
	}
	public FileBean(String name, String noteId, byte[] bytes, String base64Image) {

		this.name = name;
		this.noteId = noteId;
		this.bytes = bytes;
		this.base64Image = base64Image;
	}

	public String getNoteId() {
		return noteId;
	}

	public void setNoteId(String noteId) {
		this.noteId = noteId;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public byte[] getBytes() {
		return bytes;
	}
	public void setBytes(byte[] bytes) {
		this.bytes = bytes;
	}
	
	
	public String getBase64Image() {
        return base64Image;
    }
 
    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNoteid() {
		return noteid;
	}

	public void setNoteid(String noteid) {
		this.noteid = noteid;
	}

}
