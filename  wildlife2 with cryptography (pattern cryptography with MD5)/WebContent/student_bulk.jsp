<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%
String name,clg,phone,eml;
		int cnt;
		float amt;
		name=request.getParameter("name");
		
		clg=request.getParameter("clg");
		
		phone=request.getParameter("phn");
		
		eml=request.getParameter("email");

		String cnt1;
		cnt=Integer.parseInt(request.getParameter("count"));
		amt=cnt*30;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
			amt=cnt*30;
			String sql="insert into bulk_stu(name,clg,phone,email,cnt,amt) values(?,?,?,?,?,?)";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, clg);
			stmt.setString(3, phone);
			stmt.setString(4, eml);
			stmt.setInt(5,cnt);
			stmt.setFloat(6, amt);
			stmt.execute();
			out.println("ammount is "+cnt*30);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			out.println("wrong");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println("wrong1");
		}
		%>

</body>
</html>