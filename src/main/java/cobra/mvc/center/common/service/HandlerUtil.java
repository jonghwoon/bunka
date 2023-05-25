package cobra.mvc.center.common.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import cobra.mvc.center.common.domain.DTO;


public class HandlerUtil {
	
	static boolean debug = true;
	
	static HttpServletRequest	req =null;
	static HttpServletResponse	res =null;
	
	// add for spring 2017.06.20 ======================================================
	static void setServlet(Model model){
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("req"); 
		req = request;
	}
	// ================================================================================
	protected static void initHandlerUtil(HttpServletRequest request){
		req = request;
	}
	// ================================================================================
	static void setServlet(HttpServletRequest request, HttpServletResponse response){
		req = request;
		res = response;
	}
	
	protected static Object getVar(String name){
		String msg  = "      ¡Þ GetVar : "+ name + " = ";
		Object value = null;
		Object attr  = req.getAttribute(name);
		Object param = req.getParameter(name);
		
		boolean attrIsEmpty	= attr ==null || attr ==""; 
		boolean paramIsEmpty	= param==null || param=="";
		
		if(attrIsEmpty && paramIsEmpty){
			msg+= "N:";			
		}
		else if(!attrIsEmpty){
			msg+= "A:" + attr;
			value = attr;
		}
		else if(!paramIsEmpty){
			msg+= "P:" + param;
			value = param;
		}		
		d(msg);
		
		return value;
	}
	
	static void setVar(String name, String value){
		d("      ¡Þ SetVar : "+ name + " = A:" + value );		
		req.setAttribute(name, value);
	}	
	static void setVar(String name, DTO value){
		d("      ¡Þ SetVar : "+ name + " = A:" + value );		
		req.setAttribute(name, value);
	}	
	protected static void setVar(String name, Object value){
		d("      ¡Þ SetVar : "+ name + " = A:" + value );		
		req.setAttribute(name, value);
	}
		
	static void passVar(String...names){
		for(String name : names){
			Object value = getVar(name);
			setVar(name,value);
		}
	}
	
	static public void p(String msg) {System.out.println(msg);}
	static public void px(String msg){System.out.print(msg);}
	static public void d(String msg) {if(debug)System.out.println(msg);}
	static public void dx(String msg){if(debug)System.out.print(msg);}
	
	static public void p(int msg) {System.out.println(msg);}
	static public void px(int msg){System.out.print(msg);}
	static public void d(int msg){System.out.println(msg);}
	static public void dx(int msg){System.out.print(msg);}
	
}

