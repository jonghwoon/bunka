package cobra.mvc.center.common.persistence;

import java.lang.reflect.Method;

import cobra.mvc.center.common.domain.DTO;

public abstract class DAOAbst {
	
	protected Method[] methods;
	
	private Method findMethod(String name) {		
		for (Method method : methods) {
			String nameM = method.getName();
			if (nameM.length() == name.length() && nameM.equalsIgnoreCase(name)) 
				return method;
		}
		return null;
	}
	
	public Object PlayQuery(DTO dto, String query) {
		try {
			Method method = findMethod("my" + query);
			
			method.setAccessible(true);
			System.out.println("    ¡Ü DAO in  : " + method.getName());
			
			Object result =null;
			Class<?> classType = method.getParameterTypes()[0];
						
			if(classType == DTO.class)
				result = method.invoke(this, dto);
			
			System.out.println("    ¡Û DAO out : " + method.getName());
			return result; 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
