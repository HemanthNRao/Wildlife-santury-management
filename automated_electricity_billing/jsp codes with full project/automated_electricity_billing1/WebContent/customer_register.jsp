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
String usn,name,phone,email,pwd;
usn=request.getParameter("id");
name=request.getParameter("name");
phone=request.getParameter("phn");
email=request.getParameter("eml");
pwd=request.getParameter("pwd");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/KEB","root","");
	String sql="insert into cust_reg (usn,phone,email) values(?,?,?)";
	PreparedStatement stmt=con.prepareStatement(sql);
	stmt.setString(1, usn);
	stmt.setString(2, phone);
	stmt.setString(3, email);
	stmt.execute();
	sql="insert into cust_login (usn,pwd) values(?,?)";
	stmt=con.prepareStatement(sql);
	stmt.setString(1, usn);
	stmt.setString(2, pwd);
	stmt.execute();
	out.println("customer registered sucessfully");
	%>
	<a href="customer.html">HOME</a>
	<%
	con.close();
}
catch(Exception e)
{
	out.println("can't able to register");%>
	<a herf="new user.html">HOME</a>
	<%
}
%>
</body>
</html>