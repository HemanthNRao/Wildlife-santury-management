<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Admin_Page-Wildlife</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- Bootstrap Core CSS -->
<link href="bootstrap.min.css" rel='stylesheet' type='text/css' />

<!-- Custom CSS -->
<link href="style.css" rel='stylesheet' type='text/css' />

<!-- font-awesome icons CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- //font-awesome icons CSS-->

<!-- side nav css file -->
<link href='SidebarNav.min.css' media='all' rel='stylesheet' type='text/css'/>
<!-- //side nav css file -->
 
 <!-- js-->
<script src="cjquery-1.11.1.min.js"></script>
<script src="modernizr.custom.js"></script>

<!--webfonts-->
<link href="css.css" rel="stylesheet">
<!--//webfonts--> 

<!-- chart -->
<script src="Chart.js"></script>
<!-- //chart -->

<!-- Metis Menu -->
<script src="cmetisMenu.min.js"></script>
<script src="custom.js"></script>
<link href="custom.css" rel="stylesheet">
<!--//Metis Menu -->
<style>
#chartdiv {
  width: 100%;
  height: 295px;
}
</style>
    <!-- requried-jsfiles-for owl -->
                    <link href="owl.carousel.css" rel="stylesheet">
                    <script src="owl.carousel.js"></script>
                        <script>
                            $(document).ready(function() {
                                $("#owl-demo").owlCarousel({
                                    items : 3,
                                    lazyLoad : true,
                                    autoPlay : true,
                                    pagination : true,
                                    nav:true,
                                });
                            });
                        </script>
                    <!-- //requried-jsfiles-for owl -->
<style>
  
body {font-family: "Times New Roman", Georgia, Serif;}
h1,h2,h3,h4,h5,h6 {
    font-family: "Playfair Display";
    letter-spacing: 5px;
}

</style>
</head> 

<body class="cbp-spmenu-push">

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>

<script src='jquery.min.js'></script><script src="monetization.js" type="text/javascript"></script>
<script>
(function(){
    if(typeof _bsa !== 'undefined' && _bsa) {
        // format, zoneKey, segment:value, options
        _bsa.init('flexbar', 'CKYI627U', 'placement:w3layoutscom');
    }
})();
</script>

<body>
    <div class="main-content">
    <div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
        <!--left-fixed -navigation-->
        <aside class="sidebar-left">
      <nav class="navbar navbar-inverse">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".collapse" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <h3><a class="navbar-brand"><span></span>Wildlife Sanctuary</a></h3>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="sidebar-menu">
              <li class="header">MAIN NAVIGATION<br>Admin Page</li>
              <li class="treeview">
                <a href="admin.html">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                </a>
              </li>
              <li class="treeview">
                <a href="Register.html">
                <i class="fa fa-plus-square-o"></i> <span>Register</span>
                </a>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-laptop"></i>
                <span>Menu</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="add.html"><i class="fa fa-angle-right"></i> Add </a></li>
                  <li><a href="admin_update.html"><i class="fa fa-angle-right"></i> Update </a></li>
                </ul>
              </li>       
              <li class="treeview">
                <a href="donation.html">
                <i class="fa fa-edit"></i> <span>Donation Form</span>
                </a>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-table"></i> <span>View</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
               <ul class="treeview-menu">
                  <li><a href="Ad_Anml_data.html"><i class="fa fa-angle-right"></i> Animal Data</a></li>
                  <li><a href="Ad_vitr_data.jsp"><i class="fa fa-angle-right"></i>Visitor Data</a></li>
                  <li><a href="staff_data.jsp"><i class="fa fa-angle-right"></i>Staff Data</a></li>
                  <li><a href="donation_data.jsp"><i class="fa fa-angle-right"></i>Donation Data</a></li>
                </ul>
              </li> 
            </ul>
          </div>
          <!-- /.navbar-collapse -->
      </nav>
    </aside>
    </div>
        <!--left-fixed -navigation-->
        
<!---728x90--->

        <!-- header-starts -->
        <div class="sticky-header header-section ">
            <div class="header-left">
                <!--toggle button start-->
                <button id="showLeftPush"><i class="fa fa-bars"></i></button>
                <!--toggle button end-->
                <div class="clearfix"></div>
            </div>

            <div class="header-right w-padding" style="letter-spacing:4px;">
                <a href="index2.html" class="w-button w-white w-padding">Home</a>
                <a href="index2.html#contact" class="w-button  w-white w-padding">Contact</a>
                <a href="index.html" class="w-button w-white w-padding">Logout</a>
            <div class="clearfix"></div>
            </div>
    
            <div class="clearfix"> </div>   
        </div>
        <!-- //header-ends -->
        <!-- main content start-->
<div id="page-wrapper">
    <div class="main-page">

         <div class="tables">
                    <h2 class="title1">Donation Data</h2>
                   
                    <div class="bs-example widget-shadow" data-example-id="contextual-table"> 
                        <table class="table table-bordered"> <thead> <tr> <th>Name</th> <th>Phone</th> <th>Email-ID</th> <th>Amount</th> </tr> </thead> 

                          <tbody>
                            <%  
                            try
                            {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
                                Statement stmt=con.createStatement();
                               ResultSet rs=stmt.executeQuery("select * from donation");
                                while(rs.next())
                                { %>
                                    
                                    <tr> 
                                    <td><%=rs.getString("name")%></td>
                                    <td><%=rs.getString("phone")%></td>
                                    <td><%=rs.getString("email")%></td>
                                    <td><%=rs.getFloat("ammount")%></td> 
                                    </tr>
                                 
                                <%
                                }
                                %>

                           </tbody> </table> 
                            <%
                                rs.close();
                                stmt.close();
                                con.close();
                                }
                            catch(Exception e)
                            {
                                e.printStackTrace();
                            }
                            %>
                    </div>
                </div>
    </div>
</div>

    <!--footer-->
        <footer class="footer">
          <a href="#" class="w-button w-deep-purple w-padding-large  w-margin-bottom"><i class="fa fa-arrow-up w-margin-right"></i>To the top</a>
            <div class="copy_right">Copyright 2016 · All rights reserved. </div>
        </footer>
    <!--//footer-->
    <!-- new added graphs chart js-->
    
    <script src="js/Chart.bundle.js"></script>
    <script src="js/utils.js"></script>
    
    <!-- Classie --><!-- for toggle left push menu script -->
        <script src="classie.js"></script>
        <script>
            var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
                showLeftPush = document.getElementById( 'showLeftPush' ),
                body = document.body;
                
            showLeftPush.onclick = function() {
                classie.toggle( this, 'active' );
                classie.toggle( body, 'cbp-spmenu-push-toright' );
                classie.toggle( menuLeft, 'cbp-spmenu-open' );
                disableOther( 'showLeftPush' );
            };
            

            function disableOther( button ) {
                if( button !== 'showLeftPush' ) {
                    classie.toggle( showLeftPush, 'disabled' );
                }
            }
        </script>
    <!-- //Classie --><!-- //for toggle left push menu script -->
        
    <!--scrolling js-->
    <script src="jquery.nicescroll.js"></script>
    <script src="scripts.js"></script>
    <!--//scrolling js-->
    
    <!-- side nav js -->
    <script src='SidebarNav.min.js' type='text/javascript'></script>
    <script>
      $('.sidebar-menu').SidebarNav()
    </script>
    <!-- //side nav js -->
    
    
    <!-- Bootstrap Core JavaScript -->
   <script src="bootstrap.min.js"> </script>
    <!-- //Bootstrap Core JavaScript -->
    
</body>
</html>