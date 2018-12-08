package wildlife;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class bulk_book {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String name,clg,phone,eml;
		int cnt;
		float amt;
		Scanner s=new Scanner(System.in);
		System.out.println("enter name");
		name=s.nextLine();
		System.out.println("enter collage");
		clg=s.nextLine();
		System.out.println("enter phn");
		phone=s.nextLine();
		System.out.println("enter eml");
		eml=s.next();
		System.out.println("enter count");
		cnt=s.nextInt();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
			amt=cnt*30;
			String sql="insert into bulk_student(name,clg,phone,email,cnt,amt) values(?,?,?,?,?,?)";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, clg);
			stmt.setString(3, phone);
			stmt.setString(4, eml);
			stmt.setInt(5,cnt);
			stmt.setFloat(6, amt);
			stmt.execute();
			System.out.println("success");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
