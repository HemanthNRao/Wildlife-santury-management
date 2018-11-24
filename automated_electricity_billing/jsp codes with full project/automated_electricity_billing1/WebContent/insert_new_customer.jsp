<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%
String usn,name,address,phone,email,category;
usn=request.getParameter("id");
name=request.getParameter("name");
address=request.getParameter("address");
phone=request.getParameter("phn");
email=request.getParameter("eml");
category=request.getParameter("cat");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/KEB","root","");
	String sql="insert into customer (usn,name,address,phone,email,category) values(?,?,?,?,?,?)";
	PreparedStatement stmt=con.prepareStatement(sql);
	stmt.setString(1, usn);
	stmt.setString(2, name);
	stmt.setString(3, address);
	stmt.setString(4, phone);
	stmt.setString(5, email);
	stmt.setString(6,category);
	stmt.execute();
	// inserting data into mongodb is still remaining
	out.println("customer registered sucessfully\n");
	con.close();
}
catch(Exception e)
{	e.printStackTrace();
	out.println("oops! something went wrong");
}
%>
<a href="staff.html">HOME</a>
</body>
</html>