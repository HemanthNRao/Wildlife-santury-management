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
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.security.*"%>
<%
String usr,pwd,id,pass="",deg;
int f=0;
usr=request.getParameter("usr");
pass=request.getParameter("pwd");
try { 
	//declaration
	String ms1,ms2;
	int sum1,sum2,sum3;
	sum1=sum2=sum3=0;
	int i,j,mul=1,sum=0;
	String input_rev="";
	int hs1[]=new int[11];
	int hs2[]=new int[11];
	int hs3[]=new int[11];
	String hsv1="",hsv2="",hsv3="";
	int len=pass.length();
	
	//reverse the string
	for(i=len-1;i>=0;i--)
		input_rev=input_rev+pass.charAt(i);
	//System.out.println("reversed string is:"+input_rev);
	
	//devide and assigning the string to as 2 part
	int psl1=len/2;
	String ps1="",ps2="";
	for(i=0;i<psl1;i++)
		ps1=ps1+input_rev.charAt(i);
	for(j=psl1;i<len;i++)
		ps2=ps2+input_rev.charAt(i);
	//System.out.println("reversed strings are:"+ps1+" "+ps2);
	
	//calclating the first hash number
	for(i=0;i<11;i++)
		hs1[i]=hs2[i]=hs3[i]=0;
	for(i=0;i<psl1;i++)
	{
		int rand=(int) Math.random()%11;
		hs1[rand]=(int) ps1.charAt(i);
	}
	for(i=0;i<11;i++)
	{
		if(i>hs1.length)
				break;
		if(hs1[i]==0)
			hs1[i]=i+11;
	}
	for(i=0;i<11;i++)
	{
		mul=mul*hs1[i];
		sum=sum+hs1[i];
		//System.out.println("hs1="+hs1[i]+" "+mul+" "+sum);
	}
	sum1=mul-sum;
	
	//passing the hash value to SHA1
	MessageDigest md = MessageDigest.getInstance("SHA-1"); 
	  
    // digest() method is called 
    // to calculate message digest of the input string 
    // returned as array of byte 
	String as1=Integer.toString(sum1);
    byte[] messageDigest = md.digest(pass.getBytes()); 

    // Convert byte array into signum representation 
    BigInteger no = new BigInteger(1, messageDigest); 

    // Convert message digest into hex value 
    String hashtext = no.toString(16); 

    // Add preceding 0s to make it 32 bit 
    while (hashtext.length() < 32) { 
        hashtext = "0" + hashtext; 
    }
    int rem=sum1%10;
    hsv1=hashtext.substring(20,20+Math.abs(rem));
    //System.out.println("first hash value"+hsv1+" and sum "+sum1);
    sum=0;
    mul=1;
    
    
    //hs2 string 
    int psl2=len-psl1;
    for(i=0;i<psl2;i++)
	{
		int rand=(int) Math.random()%11;
		hs2[rand]=(int) ps2.charAt(i);
		//System.out.println(hs2[rand]);
	}
	for(i=0;i<11;i++)
	{
		if(i>hs2.length)
				break;
		if(hs2[i]==0)
			hs2[i]=i+11;
	}
	for(i=0;i<11;i++)
	{
		mul=mul*hs2[i];
		sum=sum+hs2[i];
		//System.out.println(hs2[i]+" "+mul+" "+sum);
	}
	sum2=mul-sum;
	//System.out.println(sum2);
	md = MessageDigest.getInstance("SHA-1"); 
	  
    hashtext="";
    
	String as2=Integer.toString(sum2);
    messageDigest = md.digest(pass.getBytes()); 

    // Convert byte array into signum representation 
    no = new BigInteger(1, messageDigest); 

    // Convert message digest into hex value 
    hashtext = no.toString(16); 

    // Add preceding 0s to make it 32 bit 
    while (hashtext.length() < 32) { 
        hashtext = "0" + hashtext; 
    }
    //System.out.println(hashtext);
    rem=sum2%10;
    hsv2=hashtext.substring(25,25+Math.abs(rem));
	//System.out.println("second hash value"+hsv2+" and sum "+sum2);
    sum3=sum1+sum2;
    md = MessageDigest.getInstance("SHA-1"); 
  	  
    hashtext="";
    
	String as3=Integer.toString(sum3);
    messageDigest = md.digest(pass.getBytes()); 

    // Convert byte array into signum representation 
    no = new BigInteger(1, messageDigest); 

    // Convert message digest into hex value 
    hashtext = no.toString(16); 

    // Add preceding 0s to make it 32 bit 
    while (hashtext.length() < 32) { 
        hashtext = "0" + hashtext; 
    }
    rem=sum3%10;
    hsv3=hashtext.substring(20, 20+Math.abs(rem));
    pass=hsv1+ps2+hsv3+ps1+hsv2;
    out.println(pass);
    MessageDigest md1 = MessageDigest.getInstance("MD5"); 
    byte[] messageDigest1 = md1.digest(pass.getBytes()); 
    BigInteger no1 = new BigInteger(1, messageDigest1);
    String hashtext1 = no1.toString(16); 
    while (hashtext1.length() < 32) { 
        hashtext1 = "0" + hashtext1; 
    } 
  	pass=hashtext1;
}  catch (NoSuchAlgorithmException e) {
	out.println("soory");
    throw new RuntimeException(e); 
    
}
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("SELECT * FROM staff,staff_login where staff.ID=staff_login.id");
while(rs.next()) {
	id=rs.getString("id");
	pwd=rs.getString("pwd");
	deg=rs.getString("designation");
	if(usr.equals(id) && pass.equals(pwd))
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