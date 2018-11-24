package automated_electricity_billing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class view_all_customer_data {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String id,name,address,phn,eml,category;
		System.out.println(i);
	try 
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/KEB","root","");
		Statement stmt=con.createStatement();
		String sql="select * from customer";
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			id=rs.getString("usn");
			name=rs.getString("name");
			address=rs.getString("address");
			phn=rs.getString("phone");
			eml=rs.getString("email");
			category=rs.getString("category");
			System.out.println(id+name+address+phn+eml+category);
		}
		}
	catch(Exception e) {
		e.printStackTrace();
	}
	}

}
