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
	String id;
		int f=0;
		id=request.getParameter("id");
		try {
		Mongo m=new Mongo("127.0.0.1",27017);
		DB db=m.getDB("wildlife1");
		DBCollection col=db.getCollection("animals");
		BasicDBObject query=new BasicDBObject("_id",id);
		Iterator<DBObject> cur = col.find(query).iterator(); 
		    while (cur.hasNext()) {
		        DBObject doc = cur.next();
		        List list = new ArrayList(((LinkedHashMap<String, Object>) doc).values());
		        List list1 = new ArrayList(((LinkedHashMap<String, Object>) doc).keySet());
		        Iterator i=list1.iterator();
		        Iterator j=list.iterator();
		        while(i.hasNext() && j.hasNext()) {
		        	out.print(i.next());
			        out.print(": ");
			        out.println(j.next());
		        }
		    }
		}
		catch(Exception e) {}
	%>
</body>
</html>