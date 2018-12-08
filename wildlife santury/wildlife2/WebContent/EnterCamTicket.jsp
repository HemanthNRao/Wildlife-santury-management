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
String Vid,name,csn;
Vid=request.getParameter("Vid");
name=request.getParameter("name");
csn=request.getParameter("csn");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
	String sql="insert into camera_ticket(ticket_no,name,cam_sl_no) values(?,?,?)";
	PreparedStatement stmt=con.prepareStatement(sql);
	stmt.setString(1, Vid);
	stmt.setString(2, name);
	stmt.setString(3, csn);
	stmt.execute();
	out.println("successfull");
	String redirectURL = "camera.html";
	response.sendRedirect(redirectURL);
}
catch(Exception e)
{
	out.println("sorry! unable to connect to database");
	e.printStackTrace();
}
%>
</body>
</html>