<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Animal_data_Retrieve_Page</title>

<!-- Bootstrap Core CSS -->
<link href="bootstrap.min.css" rel='stylesheet' type='text/css' />

<!-- Custom CSS -->
<link href="style.css" rel='stylesheet' type='text/css' />

</head>
<body>


<div id="page-wrapper">
    <div class="main-page">

         <div class="form-grids row widget-shadow" data-example-id="basic-forms"> 
                        <div class="form-title">
                            <h4>Search For Animal</h4>
                        </div>
                    <form class="form-horizontal" action="Animal_retrieved.jsp" method="post">
                    <div class="form-body">
                    <div class="form-group">
                        Animal id's:<select class="form-control1"  name="id" id="s1">
                       
<%@page import="com.mongodb.*" %>
<%
String type,id;
DBObject id1;
type=request.getParameter("id");
try {
	Mongo m=new Mongo("127.0.0.1",27017);
	DB db=m.getDB("wildlife1");
	DBCollection col=db.getCollection("animals");
	DBObject query=new BasicDBObject();
	DBObject attr=new BasicDBObject();
	attr.put("_id", 1);
	System.out.println("got the data");
	query = new BasicDBObject("type", new BasicDBObject("$regex", type));
	DBCursor con=col.find(query);
	while(con.hasNext())
	{
		id1=con.next();
		id=(String) id1.get("_id");%>
		<option value=<%=id%>><%=id%></option><%
	}
}catch(Exception e) {e.printStackTrace();}
%>
                        
                   </select> </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-default">Search</button>
                        <button type="reset" class="btn btn-default">Reset</button>
                    </div>
                      <p><a href="index.html">HOME</a></p>
                    </div>
                    </form>
           </div>        
    </div>
</div>

</body>
</html>