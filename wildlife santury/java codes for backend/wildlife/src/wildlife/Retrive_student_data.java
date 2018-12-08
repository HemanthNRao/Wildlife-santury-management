package wildlife;
import java.sql.*;
public class Retrive_student_data {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//String name,phn,email,donation;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
			Statement stmt=con.createStatement();
			String sql="select * from student_ticket";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				System.out.println(rs.getString("S_ID")+rs.getString("name")+rs.getString("college")+rs.getString("phone")+rs.getString("email"));
			}
			}
		catch(Exception e) {
			e.printStackTrace();
		}

	}
}