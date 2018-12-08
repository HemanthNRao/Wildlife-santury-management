package wildlife;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class Enter_student_ticket {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s=new Scanner(System.in);
		String id,name,clg,phn,eml;
		System.out.println("enter id");
		id=s.nextLine();
		System.out.println("enter name");
		name=s.nextLine();
		System.out.println("enter clg");
		clg=s.nextLine();
		System.out.println("enter phn");
		phn=s.nextLine();
		System.out.println("enter mail");
		eml=s.nextLine();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
			String sql="insert into student_ticket(S_ID,name,college,phone,email) values(?,?,?,?,?)";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, name);
			stmt.setString(3, clg);
			stmt.setString(4, phn);
			stmt.setString(5, eml);
			stmt.execute();
			System.out.println("tourist registered sucessfully");
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
