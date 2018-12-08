package wildlife;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class insert_donation {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String name,phn,email,amt;
		Scanner s=new Scanner(System.in);
		System.out.println("enter details");
		name=s.nextLine();
		phn=s.nextLine();
		email=s.nextLine();
		amt=s.nextLine();
		float ammount=Float.parseFloat(amt);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
			String sql="insert into donation(name,phone,email,ammount) values(?,?,?,?)";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, phn);
			stmt.setString(3, email);
			stmt.setFloat(4, ammount);
			stmt.execute();
			System.out.println("successfull");
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
