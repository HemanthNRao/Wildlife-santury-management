<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@page import="com.mongodb.*" %>
	<%@page import="java.util.*" %>
	<%@page import="java.security.*" %>
	<%@page import="java.math.BigInteger" %>
<%
public static String getMd5(String input) 
	    { 
	        try { 
	        	input="5h1av71"+input+"108812008";
	            MessageDigest md = MessageDigest.getInstance("MD5"); 
	            byte[] messageDigest = md.digest(input.getBytes()); 
	            BigInteger no = new BigInteger(1, messageDigest);
	            String hashtext = no.toString(16); 
	            while (hashtext.length() < 32) { 
	                hashtext = "0" + hashtext; 
	            } 
	            return hashtext; 
	        }  
	  
	        catch (NoSuchAlgorithmException e) { 
	            throw new RuntimeException(e); 
	        } 
	    } 
%>
</body>
</html>