package cobra.mvc.center.common.domain;

public interface DTO extends Cloneable{	
	// getInfo �߰��Ͽ���. 
	
	public String[] getNames();
	public String[] getKeyNames();
	public String getTableName();
	public DTO getNew();
	public void getInfo();
	
	public void setValue(String name,String value);
	public void setValue(String name, int value);	
	public String getValue(String name);
		
	public int getInt(String name);
	public String getValueSQL(String name);
	public String getValuesForScript();
	public String getValuesMap();
	
	// jungsik style ==============================  
	void set(String name, Object value);
	Object get(String name);
	
	//sql ���潺üũ�� �߰��ؾ߰ھ�.
	
}
