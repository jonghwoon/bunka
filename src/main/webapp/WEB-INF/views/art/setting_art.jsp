<%@page import="java.io.IOException"%>
<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.io.PrintStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 부트스트랩 로드 -->
<%-- 
<script type="text/javascript" src="${project}/common/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${project}/common/bootstrap/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
 --%>
 
<script>
	function D(msg){console.log(msg.toString() + msg);}
	function M(msg){}
</script>
 
<%	request.setCharacterEncoding("UTF-8"); %>

<%
	req = request;
	res = response;
	o = out;
	sysout = System.out;
	
	debug = true;
%>

<%!
	static private JspWriter o = null;
	static private PrintStream sysout = null;
	static private HttpServletRequest	req =null;
	static private HttpServletResponse	res =null;
	
	static private boolean debug =false;
	
	
	static Object getVar(String name){
		String msg  = "      ◇ GetVar : "+ name + " = ";
		Object value = null;
		Object attr  = req.getAttribute(name);
		Object param = req.getParameter(name);
		
		boolean attrIsEmpty		= attr ==null || attr ==""; 
		boolean paramIsEmpty	= param==null || param=="";
		
		if(attrIsEmpty && paramIsEmpty){
			msg+= "N:";			
		}
		else if(!attrIsEmpty){
			msg+= "A:" + attr.toString();
			value = attr;
		}
		else if(!paramIsEmpty){
			msg+= "P:" + param.toString();
			value = param;
		}		
		d(msg);
		
		return value;
	}
		
	static public void setVar(String name, String value){
		d("      ◆ SetVar : "+ name + " = A:" + value );		
		req.setAttribute(name, value);
	}	
	static public void setVar(String name, DTO value){
		d("      ◆ SetVar : "+ name + " = A:" + value );		
		req.setAttribute(name, value);
	}
	
	static public void setVar(String name, Object value){
		d("      ◆ SetVar : "+ name + " = A:" + value );		
		req.setAttribute(name, value);
	}
	
	static public void setSession(String name, String value){
		d("      ◆ SetSession : "+ name + " = A:" + value );		
		req.getSession().setAttribute(name, value);
	}	
	
	static public Object getSession(String name){
		Object value = req.getSession().getAttribute(name);
		d("      ◇ GetSession : "+ name + " = A:" + value );
		return value;
	}
 	
	static public void p(String msg) throws IOException {o.println(msg);}
	static public void px(String msg)throws IOException {o.print(msg);}
	static public void d(String msg) {if(debug)sysout.println(msg);}
	static public void dx(String msg){if(debug)sysout.print(msg);}
	
	static public void p(int msg) throws IOException {o.println(msg);}
	static public void px(int msg)throws IOException {o.print(msg);}
	static public void d(int msg)throws IOException	{sysout.println(msg);}
	static public void dx(int msg)throws IOException {sysout.print(msg);}
	
%>

