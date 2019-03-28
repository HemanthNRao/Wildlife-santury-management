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
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.security.*"%>
<%
String id,pass,usr,pwd;
int f=0;
usr=request.getParameter("usr");
pwd=request.getParameter("pwd");
try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from admin_login");
		while(rs.next()) {
			id=rs.getString("id");
			pass=rs.getString("pwd");
			if(usr.equals(id) && pwd.equals(pass))
			{
				String redirectURL = "admin.html";
		        response.sendRedirect(redirectURL);
				f=1;
			}
			}	
		if(f==0)
		{
			out.println("invalid user name or password");%>
			<a href="login.html">HOME</a><%
			//String redirectURL = "login.html";
			//response.sendRedirect(redirectURL);
		}
		}
		catch(Exception e) {
			out.println("Unable to connect to database");%>
			<a href="login.html">HOME</a><%
			}
%>
</body>
</html>