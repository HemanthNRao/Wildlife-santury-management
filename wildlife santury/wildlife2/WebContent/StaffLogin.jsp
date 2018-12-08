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
String usr,pwd,id,pass,deg;
int f=0;
usr=request.getParameter("usr");
pwd=request.getParameter("pwd");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("SELECT * FROM staff,staff_login where staff.ID=staff_login.id");
while(rs.next()) {
	id=rs.getString("id");
	pass=rs.getString("pwd");
	deg=rs.getString("designation");
	if(usr.equals(id) && pwd.equals(pass))
	{
		if(deg.equals("accountant"))
		{
			String redirectURL = "account.html";
	        response.sendRedirect(redirectURL);
			f=1;			
		}
		
		String redirectURL = "staff.html";
        response.sendRedirect(redirectURL);
        
		f=1;
	}
	}	
if(f==0)
{
	out.println("invalid user name or password");%>
	<a href="login.html">HOME</a><%
}
}
catch(Exception e) {
	out.println("Unable to connect to database");%>
	<a href="login.html">HOME</a><%
	}
%>
</body>
</html>