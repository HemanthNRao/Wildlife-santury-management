package wildlife;
import java.util.*;
import java.sql.DriverManager;
import java.sql.*;
import com.mysql.jdbc.Connection;
public class staff_login {

	public static void main(String[] args) {
		String usr,pwd,id,pass,deg;
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
		java.sql.ResultSet rs=stmt.executeQuery("SELECT * FROM staff,staff_login where staff.ID=staff_login.id ");
		while(rs.next()) {
			id=rs.getString("id");
			pass=rs.getString("pwd");
			deg=rs.getString("designation");
			if(usr.equals(id) && pwd.equals(pass))
			{
				if(deg.equals("accountant"))
				{
					System.out.println("Account successfull");
					
				}
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
