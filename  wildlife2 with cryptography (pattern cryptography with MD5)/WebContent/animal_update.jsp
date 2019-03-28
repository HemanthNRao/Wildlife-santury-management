<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="com.mongodb.*" %>
    <%@ page import="com.mongodb.BasicDBObject" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.lang.*" %>
    <%
    String new_value,search_value,new_key,search_key;
		System.out.println("enter search key");
		search_key=
		System.out.println("enter search value");
		search_value=
		System.out.println("enter new key");
		new_key=
		System.out.println("enter new value");
		new_value=
		try {
		Mongo m=new Mongo("127.0.0.1",27017);
		DB d=m.getDB("wildlife1");
		DBCollection con=d.getCollection("animals");
		BasicDBObject newDocument = new BasicDBObject();//object to store new value and corresponding key
		newDocument.append("$set", new BasicDBObject(new_key,new_value));
		BasicDBObject SearchQuery = new BasicDBObject().append(search_key, search_value);
		con.update(SearchQuery,newDocument);
		System.out.println("success update");
	}
	catch(Exception e)
		{
			e.printStackTrace();
		}
		%>
</body>
</html>