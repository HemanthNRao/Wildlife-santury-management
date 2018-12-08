package wildlife;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class View_donation {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
			Statement stmt=con.createStatement();
			String sql="select * from donation";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				System.out.println(rs.getString("name")+rs.getString("phone")+rs.getString("email")+rs.getFloat("ammount"));
			}
			}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
