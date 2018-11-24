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
String usr,pwd,id,pass;
int f=0;
usr=request.getParameter("user");
pwd=request.getParameter("pass");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KEB","root","");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from staff_login");
while(rs.next()) {
	id=rs.getString("eid");
	pass=rs.getString("pwd");
	if(usr.equals(id) && pwd.equals(pass))
	{
		out.println("login successfull");
		f=1;
		response.sendRedirect("staff.html");
	}
	}	
if(f==0)
{
	out.println("invalid user name or password");
	%>
	GOTO LOGIN<a href="LOGIN.html">LOGIN PAGE</a>
	<%
}
}
catch(Exception e) {
	e.printStackTrace();
	out.print("login error");
	%>
	GOTO LOGIN<a href="LOGIN.html">LOGIN PAGE</a>
	<%
	}
%>
</body>
</html>