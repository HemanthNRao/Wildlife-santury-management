<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"></script>
<style>
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

.bg-image {
  /* The image used */
  background-image: url("forest1.jpg");
  
  /* Add the blur effect */
  filter: blur(8px);
  -webkit-filter: blur(8px);
  
  /* Full height */
  height: 100%; 
  
  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

/* Position text in the middle of the page/image */
.bg-text {
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
  color: white;
  font-weight: bold;
  border: 3px solid #f1f1f1;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 80%;
  padding: 20px;
  text-align: center;
}
</style>
</head>
<body>

	<%@page import="com.mongodb.*" %>
	<%@page import="java.util.*" %>
    
    <div class="bg-image"></div>

<div class="bg-text">
  <center> 
    <h4>Animal Data Retrieved</h4>
    <p><%
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
		        DBObject doc = cur.next();%>
		        <img src="<%=doc.get("img") %>" width=500 height=500 alt="animal image"><br><br>
		        <%out.println("Name:"+doc.get("name"));%><br><br><%
		        out.println("Scientific name:"+doc.get("scintific name"));%><br><br><% 
		        out.println("Age:"+doc.get("age"));%><br><br><% 
		        out.println("Type:"+doc.get("type"));%><br><br><% 
		        out.println("Weight:"+doc.get("weight"));%><br><br><% 
		        out.println("Species:"+doc.get("species"));%><br><br><%
		        %><img src="file:///home/hemanth/Pictures/s1.png" width=150 height=150 alt="animal image">
		        <%
		        
		        }
		    
		}
		catch(Exception e) {}
	%></p>
	<p><a href="index.html">HOME</a></p>
    </center>
</div>
 
</body>

</html>