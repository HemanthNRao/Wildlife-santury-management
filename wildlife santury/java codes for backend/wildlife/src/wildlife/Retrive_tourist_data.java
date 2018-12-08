package wildlife;
import java.sql.*;
public class Retrive_tourist_data {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//String name,phn,email,donation;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
			Statement stmt=con.createStatement();
			String sql="select * from tourist";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				System.out.println(rs.getString("Reg_No")+rs.getString("name")+rs.getString("phone")+rs.getString("email")+rs.getString("adult")+rs.getString("child"));
			}
			}
		catch(Exception e) {
			e.printStackTrace();
		}

	}
}
