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
String id,name,clg,phn,eml;
id=request.getParameter("id");
name=request.getParameter("name");
clg=request.getParameter("clg");
phn=request.getParameter("phn");
eml=request.getParameter("eml");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
	String sql="insert into student_ticket(S_ID,name,college,phone,email) values(?,?,?,?,?)";
	PreparedStatement stmt=con.prepareStatement(sql);
	stmt.setString(1, id);
	stmt.setString(2, name);
	stmt.setString(3, clg);
	stmt.setString(4, phn);
	stmt.setString(5, eml);
	stmt.execute();
	out.println("Student Ticket Booked successfully");
	String redirectURL = "student.html";
	response.sendRedirect(redirectURL);
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