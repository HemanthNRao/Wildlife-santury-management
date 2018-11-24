<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title></title>
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
      width:170px;
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
<%@page import="java.util.*" %>
<%@page import="com.mongodb.*" %>
<%
String id,month,mtn,mon;
		String unit,bal,camt,tamt;
		DBObject data;
		id=request.getParameter("id");
		month=request.getParameter("month");
		try {
			Mongo m=new Mongo("127.0.0.1",27017);
			DB db=m.getDB("KEB");
			DBCollection col=db.getCollection("bills");
			BasicDBObject query = new BasicDBObject();
			List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
			obj.add(new BasicDBObject("_id", id));
			obj.add(new BasicDBObject("month", month));
			query.put("$and", obj);
			Iterator<DBObject> cur = col.find(query).iterator(); 
			
			while(cur.hasNext())
			{
				data=cur.next();
				mtn=(String) data.get("_id");
				mon=(String) data.get("month");
				unit=(String) data.get("unit");
				bal=(String)data.get("balance");
				camt=(String)data.get("cur_amount");
				tamt= (String)data.get("total_amount");
				//out.println(mtn+mon+unit+bal+camt+tamt);%>
				<section id="hero">
			    <div class="hero-container">
			      <div class="form-container" style="background-color:white; width:400px">
			        <div class="detail-block">
			          <div class="data-label">Bill No </div>
			          <div> <% out.println(mtn); %> </div>
			        </div>
			        <div class="detail-block">
			          <div class="data-label">Month </div>
			          <div> <% out.println(mon); %>  </div>
			        </div>
			        <div class="detail-block">
			          <div class="data-label">Unit Used </div>
			          <div> <% out.println(unit); %>  </div>
			        </div>
			        <div class="detail-block">
			          <div class="data-label">prevoius month balance  </div>
			          <div> <% out.println(bal); %>  </div>
			        </div>
			        <div class="detail-block">
			          <div class="data-label">Amount for Powerused  </div>
			          <div> <% out.println(camt); %>  </div>
			        </div>
			        <div class="detail-block">
			          <div class="data-label">Total </div>
			          <div> <% out.println(tamt); %>  </div>
			        </div>
			      </div>
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
		out.println("no data found");}
		%><b><u>sorry no data found for this number with given month</u></b><a href="staff.html">HOME</a><%
		%>
</body>
</html>