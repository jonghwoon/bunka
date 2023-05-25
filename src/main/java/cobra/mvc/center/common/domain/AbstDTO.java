package cobra.mvc.center.common.domain;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import org.springframework.http.HttpRequest;

public class AbstDTO implements DTO {
	private 	Field[] 	fields;
	private		Method[] 	methods;
	protected 	String[] 	keyNames;
	protected 	String  	tableName;
	
		
	protected AbstDTO() {
		fields  = this.getClass().getDeclaredFields();
		methods = this.getClass().getDeclaredMethods();
	}

	protected void setFields(Field[] fields) 	{this.fields  = fields; }	
	protected void setMethods(Method[] methods) 	{this.methods = methods;}
	
	// Style Of JungSik ============================================================
	
	private Field findField(String name) {	
		for (Field field : fields) {
			String nameF = field.getName();
			if (nameF.length() == name.length() && nameF.equalsIgnoreCase(name))
				return field;
		}
		return null;
	}
	
	private Method findMethod(String name) {		
		for (Method method : methods) {
			String nameM = method.getName();
			if (nameM.length() == name.length() && nameM.equalsIgnoreCase(name)) 
				return method;
		}
		return null;
	}
	
	@Override
	public void set(String name, Object value) {		
		try {			
			Method method = findMethod("set" + name);
			
			if (method == null) return;
			
			method.setAccessible(true);
			
			/// �����Ǿ���. - ��Ʈ �׸�
			Class<?> classType = method.getParameterTypes()[0];
			
			if 		 (classType == int.class && value.getClass() == int.class) {
				method.invoke(this, (int)value);
			} 
			else if (classType == int.class && value.getClass() == String.class) {
				method.invoke(this, Integer.parseInt((String)value));				
			} 
			else if (classType == String.class && value.getClass() == String.class) {
				method.invoke(this, (String)value);
			}
			else if (classType == String.class && value.getClass() == Integer.class) {
				method.invoke(this, String.valueOf(value));				
			} 
			else {
				method.invoke(this, value.toString());
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override	
	public Object get(String name) {
		try {
			Method method = findMethod("get" + name);
			if (fields == null) return null;			
			return method.invoke(this);
		} catch (Exception e) {
			// TODO: handle exception
			// e.printStackTrace();
		}
		return null;
	}
	
	public void setF(String name, Object value) {
		try {
			Field field = findField(name);
			
			if (field == null) return;
			
			field.setAccessible(true);
			
			Class<?> classType = field.getType();
			if (classType == int.class) {
				field.setInt(this, (int)value);
				
			} else if (classType == String.class) {
				field.set(this, value);
				
			} else {
				field.set(this, value.toString());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Object getF(String name) {
		try {
			Field field = findField(name);
			
			if (field == null) return null;
			
			return field.get(this);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	
	//@Override	// public AbstDTO clone() {
	public AbstDTO getClone() {
		AbstDTO obj = null;
		try {
			obj = (AbstDTO) super.clone();
			return obj;
		} catch (CloneNotSupportedException e) {
			//Logger.print(e);
			e.printStackTrace();
			return null;
		}
	}
	
	// Inky Added ====================================================
	
	public DTO getNew(){		
		try {			
			return this.getClass().newInstance();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public String[] getNames(){
		String[] names = new String[fields.length];		
		int i =0;
		for(Field field : fields)
			names[i++] = field.getName();
		return names;
	}
	
	/*	/// ���� list, map ���ʸ�<E>��� <T> Type
		public T <T> get(String name){
			Object value = get(name);
			if		(value==null) 							return -1;
			else if	(value.getClass() == Integer.class)	return (T)value;		
			else if	(value.getClass() ==  String.class)	return Integer.parseInt((String)value);		
			else 											return 0;
		}
	*/
	
	public int getInt(String name){
		Object value = get(name);
		if		(value==null) 							return -1;
		else if	(value.getClass() == Integer.class)	return (int)value;		
		else if	(value.getClass() ==  String.class)	return Integer.parseInt((String)value);		
		else 											return 0;
	}
		
	//String ���θ� �ޱ�  �̸��� �̻��ϱ� �ϴ�.
	public String getValue(String name){		
		Object value = get(name);
		if(value==null) return null;
		
		Class<?> classType = value.getClass();
		
		boolean isInteger = classType == Integer.class;
		boolean isString  = classType == String.class;
		
		if (isInteger || isString )	
			return value.toString(); 
		
		// ���� �ٸ� Ÿ�� �߰�..
		
		return null;
	}
	
	public void getInfo(){
		String msg = "      �� ";
		msg+= this.getClass() + " > ";
		for(String name : getNames())
			msg+= name + ":" + get(name) + " / ";		
		System.out.println(msg);
	}
	
	public String[] getKeyNames() {	
		return keyNames;
	}
		
	public String getTableName(){
		return tableName;
	}
	

	
	public String getValuesForScript() {
		String msg= "";	// () �ȿ� ���Ƿ� {} �����ϰ� ���� �־��ش�. 
		for(String name :getNames()){			
			String value = getValue(name)!=null ? getValue(name) : "";
			msg += ",'" + value + "'";
		}		
		return msg.replaceFirst(",","");
	}
	
	
	public String getValuesMap() {
		String msg= "{";
		for(String name :getNames()){
			String value = getValue(name);
			msg += ",'" + name + "':'" + value + "'";
		}
		msg +="}";
		
		return msg.replaceFirst(",","");
	}

	@Override
	public String getValueSQL(String name) {
		String value = getValue(name);
		
		if(value==null || value==""|| value.equals("0"))
			return "";
		
		if(value!="")			
			if(value.toCharArray()[0]=='!')
				return value.substring(1) ;	// Ư���� �����ϰ��			
			else
				return "'" + value + "'";	// �����ϰ��
			
		return value;
	}
	// �� ���� ȣȯ�� ���� ============================================

	@Override
	public void setValue(String name, String value) {
		set(name,value);
	}

	@Override
	public void setValue(String name, int value) {
		set(name,value);
		
	}	
	
	// ���� ==============================================================
	public void getValues(HttpRequest res){
		// HttpServletRequest �� ���� �� �ִٸ� Request �� ���� ���� ���� ��� �޾ƿ� �� �����ٵ�... �޾�����?
	}

}
