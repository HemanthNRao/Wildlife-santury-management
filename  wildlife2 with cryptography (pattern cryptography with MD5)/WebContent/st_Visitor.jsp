<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String name,phn,email,type;
name=request.getParameter("name");
phn=request.getParameter("phn");
email=request.getParameter("eml");
type=request.getParameter("type");
float fee;
if(type.equals("adult"))
	fee=70;
else if(type.equals("child"))
	fee=40;
else
	fee=300;
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
	String sql="insert into tourist(name,phone,email,type,fee) values(?,?,?,?,?)";
	PreparedStatement stmt=con.prepareStatement(sql);
	stmt.setString(1, name);
	stmt.setString(2, phn);
	stmt.setString(3, email);
	stmt.setString(4, type);
	//stmt.setString(5, child);
	stmt.setFloat(5, fee);
	stmt.execute();
	String redirectURL = "visitor.html";
	response.sendRedirect(redirectURL);
	out.println("Ticket booked successfully");
	%>
	<a href="index.html"><b>HOME</b></a>
	<% 
	con.close();
}
catch(Exception e)
{
	out.println("sorry!can't able to connect to database");
	e.printStackTrace();
}
%>
</body>
</html>
