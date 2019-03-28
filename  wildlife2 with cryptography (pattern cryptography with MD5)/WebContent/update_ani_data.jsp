<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.mongodb.*" %>
<%@page import="java.util.*" %>
<%
String new_value,search_value,new_key,search_key;
		Scanner s=new Scanner(System.in);
		//System.out.println("enter search key");
		search_key="_id";
		//System.out.println("enter search value");
		search_value=request.getParameter("id1");
		//System.out.println("enter new key");
		new_key=request.getParameter("type");
		//System.out.println("enter new value");
		new_value=request.getParameter("id2");
		try {
		Mongo m=new Mongo("127.0.0.1",27017);
		DB d=m.getDB("wildlife1");
		DBCollection con=d.getCollection("animals");
		BasicDBObject newDocument = new BasicDBObject();//object to store new value and corresponding key
		newDocument.append("$set", new BasicDBObject(new_key,new_value));
		BasicDBObject SearchQuery = new BasicDBObject().append(search_key, search_value);
		con.update(SearchQuery,newDocument);
		out.println("success update");%>
		<a href="admin_update.html">BACK</a><%
	}
	catch(Exception e)
		{
		%>
		<a href="admin_update.html">BACK</a><%
		}
%>
</body>
</html>