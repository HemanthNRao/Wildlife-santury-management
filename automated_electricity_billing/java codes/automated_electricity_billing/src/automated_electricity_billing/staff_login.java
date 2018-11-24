package automated_electricity_billing;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import com.mysql.jdbc.Connection;

public class staff_login {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String usr,pwd,id,pass;
		int f=0;
		Scanner s=new Scanner(System.in);
		System.out.println("enter the userID and password");
		usr=s.nextLine();
		pwd=s.nextLine();
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KEB","root","");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from staff_login");
		while(rs.next()) {
			id=rs.getString("eid");
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
