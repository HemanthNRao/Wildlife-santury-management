package wildlife;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class Enter_cam_ticket {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String tn,name,csn;
		Scanner s=new Scanner(System.in);
		System.out.println("enter tn");
		tn=s.nextLine();
		System.out.println("enter name");
		name=s.nextLine();
		System.out.println("enter csn");
		csn=s.nextLine();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
			String sql="insert into camera_ticket(ticket_no,name,cam_sl_no) values(?,?,?)";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1, tn);
			stmt.setString(2, name);
			stmt.setString(3, csn);
			stmt.execute();
			System.out.println("successfull");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
		

}
