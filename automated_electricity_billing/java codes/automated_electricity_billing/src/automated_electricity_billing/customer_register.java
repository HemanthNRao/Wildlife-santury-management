package automated_electricity_billing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class customer_register {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s=new Scanner(System.in);
		String usn,name,phone,email,pwd;
		System.out.println("enter the customer details");
		usn=s.nextLine();
		System.out.println("enter the phn details");
		phone=s.nextLine();
		System.out.println("enter the email details");
		email=s.nextLine();
		System.out.println("enter the password details");
		pwd=s.nextLine();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/KEB","root","");
			String sql="insert into cust_reg (usn,phone,email) values(?,?,?)";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1, usn);
			stmt.setString(2, phone);
			stmt.setString(3, email);
			stmt.execute();
			sql="insert into cust_login (usn,pwd) values(?,?)";
			stmt=con.prepareStatement(sql);
			stmt.setString(1, usn);
			stmt.setString(2, pwd);
			stmt.execute();
			System.out.println("customer registered sucessfully");
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
