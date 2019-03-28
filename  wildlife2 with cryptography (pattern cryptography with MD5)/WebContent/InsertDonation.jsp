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
String name,phn,email,amt;
name=request.getParameter("name");
phn=request.getParameter("phn");
email=request.getParameter("eml");
amt=request.getParameter("amt");
float ammount=Float.parseFloat(amt);
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
	String sql="insert into donation(name,phone,email,ammount) values(?,?,?,?)";
	PreparedStatement stmt=con.prepareStatement(sql);
	stmt.setString(1, name);
	stmt.setString(2, phn);
	stmt.setString(3, email);
	stmt.setFloat(4, ammount);
	stmt.execute();
	out.println("successfull");
	con.close();%>
	
	<a href="donation.html">BACK</a><%
}
catch(Exception e)
{
	out.println("un successfull");%>
	
	<a href="donation.html">BACK</a><%
}
%>
</body>
</html>