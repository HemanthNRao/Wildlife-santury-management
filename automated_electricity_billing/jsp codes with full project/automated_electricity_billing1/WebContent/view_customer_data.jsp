<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title> Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
  <link href="./staff_files/bootstrap.min.css" rel="stylesheet">
  <!-- Main Stylesheet File -->
  <link href="./staff_files/style.css" rel="stylesheet">
  <style>
    .detail-block{
      display: flex;
      flex-direction: row;
      padding:5px;
    }
    .detail-block > * {
      font-size: 19px;
    }
    .data-label{
      width:100px;
      text-align: left;
    }
  </style>
  <!-- =======================================================
    Theme Name: Regna
    Theme URL: https://bootstrapmade.com/regna-bootstrap-onepage-template/
    Autdata-labelhor: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>
<body>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%
String id,name,address,phn,eml,category;
id=request.getParameter("id");
id="\""+id+"\" ";
try 
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/KEB","root","");
Statement stmt=con.createStatement();
String sql="select * from customer where usn="+id;
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
	id=rs.getString("usn");
	name=rs.getString("name");
	address=rs.getString("address");
	phn=rs.getString("phone");
	eml=rs.getString("email");
	category=rs.getString("category");
	//System.out.println(id+name+address+phn+eml+category);
	%>
	<button type="button" id="mobile-nav-toggle"><i class="fa fa-bars"></i></button>

  <!--==========================
  Header
  ============================-->
  <header id="header">
    <!-- <div class="container">

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li><a href="staff.html">INSERT</a></li>
          <li class="menu-active"><a href="#about">VIEW DATA</a></li>
          <li><a href="#services">VIEW BILL</a></li>
        </ul>
      </nav><!-- #nav-menu-container -->
    </div> -->
  </header><!-- #header -->

  <!--==========================
    Hero Section
  ============================-->
  <section id="hero">
    <div class="hero-container">
      <div class="form-container" style="background-color:white">
        <div class="detail-block">
          <div class="data-label">Bill No- </div>
          <div> <%out.println(id);%> </div>
        </div>
        <div class="detail-block">
          <div class="data-label">Name- </div>
          <div> <%out.println(name);%> </div>
        </div>
        <div class="detail-block">
          <div class="data-label">Address- </div>
          <div> <%out.println(address);%> </div>
        </div>
        <div class="detail-block">
          <div class="data-label">Phone No- </div>
          <div><%out.println(phn);%> </div>
        </div>
        <div class="detail-block">
          <div class="data-label">Email- </div>
          <div> <% out.println(eml);%> </div>
        </div>
        <div class="detail-block">
          <div class="data-label">Category- </div>
          <div> <% out.println(category);%> </div>
        </div>
      </div>
      <a href="staff.html">HOME</a>
    </div>
  </section><!-- #hero -->



  <!--==========================
    Footer
  ============================-->
  <!-- JavaScript Libraries -->
  <script src="./staff_files/jquery.min.js"></script>
  <script src="./staff_files/jquery-migrate.min.js"></script>
  <script src="./staff_files/bootstrap.bundle.min.js"></script>
  <script src="./staff_files/easing.min.js"></script>
  <script src="./staff_files/wow.min.js"></script>
  <script src="./staff_files/waypoints.min.js"></script>
  <script src="./staff_files/counterup.min.js"></script>
  <script src="./staff_files/hoverIntent.js"></script>
  <script src="./staff_files/superfish.min.js"></script>

  <!-- Contact Form JavaScript File -->
  <script src="./staff_files/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="./staff_files/main.js"></script>
  <nav id="mobile-nav">
    <ul class="" style="touch-action: pan-y;" id="">
      <li class="menu-active"><a href="file:///home/raghu/Downloads/Regna/index.html#hero">INSERT</a></li>
      <li><a href="file:///home/raghu/Downloads/Regna/index.html#about">VIEW DATA</a></li>
      <li><a href="file:///home/raghu/Downloads/Regna/index.html#services">VIEW BILL</a></li>
    </ul>
  </nav>
  <%
}
}
catch(Exception e) {
e.printStackTrace();
}
%>
</body>
</html>