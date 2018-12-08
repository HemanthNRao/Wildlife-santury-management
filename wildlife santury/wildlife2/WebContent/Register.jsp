<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
	String id,name,dsg,wrk_hr,phone,email,pass;
	String sal;
	id=request.getParameter("id");
	name=request.getParameter("name");
	dsg=request.getParameter("dsg");
	wrk_hr=request.getParameter("wrk_hr");
	sal=request.getParameter("sal");
	phone=request.getParameter("phn");
	
	email=request.getParameter("eml");
	pass=request.getParameter("pwd");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root",""); 
		String sql="insert into staff (ID,name,designation,working_hour,salary,phone,email) values(?,?,?,?,?,?,?)";
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setString(1, id);
		stmt.setString(2, name);
		stmt.setString(3, dsg);
		stmt.setString(4, wrk_hr);
		stmt.setString(5, sal);
		stmt.setString(6, phone);
		stmt.setString(7, email);
		stmt.execute();
		sql="insert into staff_login (id,pwd) values(?,?)";
		stmt=con.prepareStatement(sql);
		stmt.setString(1, id);
		stmt.setString(2, pass);
		stmt.execute();
		/*String redirectURL = "Register.html";
		response.sendRedirect(redirectURL);*/
		out.println("staff registered sucessfully");
		con.close();%>
		
		<a href="Register.html">BACK</a><%
	}
	catch(Exception e)
	{
		out.println("sorry!not able to connect to database!");
%>
		
		<a href="Register.html">BACK</a><%
	}

	%>
</body>
</html>