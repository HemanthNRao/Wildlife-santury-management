package wildlife;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Retrive_camera_data {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
			Statement stmt=con.createStatement();
			String sql="select * from camera_ticket";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				System.out.println(rs.getString("ticket_no")+rs.getString("name")+rs.getString("cam_sl_no"));
			}
			}
		catch(Exception e) {
			e.printStackTrace();
		}


	}

}
