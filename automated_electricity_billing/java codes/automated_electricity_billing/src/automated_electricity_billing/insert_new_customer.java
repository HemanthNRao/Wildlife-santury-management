package automated_electricity_billing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class insert_new_customer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s=new Scanner(System.in);
		String usn,name,address,phone,email,category;
		System.out.println("enter the customer details");
		usn=s.nextLine();
		System.out.println("enter the name details");
		name=s.nextLine();
		System.out.println("enter the dsg details");
		address=s.nextLine();
		System.out.println("enter the phn details");
		phone=s.nextLine();
		System.out.println("enter the email details");
		email=s.nextLine();
		System.out.println("enter the category details");
		category=s.nextLine();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/KEB","root","");
			String sql="insert into customer (usn,name,address,phone,email,category) values(?,?,?,?,?,?)";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1, usn);
			stmt.setString(2, name);
			stmt.setString(3, address);
			stmt.setString(4, phone);
			stmt.setString(5, email);
			stmt.setString(6,category);
			stmt.execute();
			// inserting data into mongodb is still remaining
			System.out.println("customer registered sucessfully");
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
