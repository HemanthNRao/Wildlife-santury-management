package wildlife;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

import com.mysql.jdbc.Statement;

public class tourist_register {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s=new Scanner(System.in);
		String name,phn,email,type;
		System.out.println("enter the name details");
		name=s.nextLine();
		System.out.println("enter the phn details");
		phn=s.nextLine();
		System.out.println("enter the email details");
		email=s.nextLine();
		System.out.println("adult s/n");
		type=s.nextLine();
		float fee;
		if(type.equals("adult"))
			fee=50;
		else
			fee=30;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
			String sql="insert into tourist(name,phone,email,type,fee) values(?,?,?,?,?)";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, phn);
			stmt.setString(3, email);
			stmt.setString(4, type);
			//stmt.setString(5, child);
			stmt.setFloat(5, fee);
			stmt.execute();
			Statement stm=(Statement) con.createStatement();
			java.sql.ResultSet rs=stm.executeQuery("SELECT max(Reg_No) as reg FROM tourist");
			rs.next();
			String t=rs.getString("reg");
			System.out.println("Ticket booked successfully your ticket number is"+t+"please show this in counter and get your ticket");
						con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
