package cobra.mvc.center.common.domain;


public class FileDTO extends AbstDTO{
	
	private String filename;
	private byte[] binary;

	
	public FileDTO(){
		keyNames = new String[] {"filename","binary"};
		tableName = "CENTER_PDS";
	}


	public String getFilename() {
		return filename;
	}


	public byte[] getBinary() {
		return binary;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public void setBinary(byte[] binary) {
		this.binary = binary;
	}
	
	
	
}