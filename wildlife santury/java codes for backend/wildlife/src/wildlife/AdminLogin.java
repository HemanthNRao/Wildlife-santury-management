package wildlife;
import java.util.*;
import java.sql.DriverManager;
import java.sql.*;
import com.mysql.jdbc.Connection;
public class AdminLogin {

	public static void main(String[] args) {
		String usr,pwd,id,pass;
		int f=0;
		Scanner s=new Scanner(System.in);
		System.out.println("enter the userID and password");
		usr=s.nextLine();
		pwd=s.nextLine();
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from admin_login");
		while(rs.next()) {
			id=rs.getString("id");
			pass=rs.getString("pwd");
			if(usr.equals(id) && pwd.equals(pass))
			{
				System.out.println("login successfull");
				f=1;
			}
			}	
		if(f==0)
		{
			System.out.println("invalid user name or password");
		}
		}
		catch(Exception e) {
			e.printStackTrace();
			//System.out.print("login error");
			}

	}

}
