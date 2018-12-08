package wildlife;
import java.sql.*;
import java.util.*;
public class Register {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s=new Scanner(System.in);
		String id,name,dsg,wrk_hr,phone,email,pass;
		String sal;
		System.out.println("enter the register details");
		id=s.nextLine();
		System.out.println("enter the name details");
		name=s.nextLine();
		System.out.println("enter the dsg details");
		dsg=s.nextLine();
		System.out.println("enter the wrkhr details");
		wrk_hr=s.nextLine();
		System.out.println("enter the sal details");
		sal=s.nextLine();
		System.out.println("enter the phn details");
		phone=s.nextLine();
		System.out.println("enter the email details");
		email=s.nextLine();
		System.out.println("enter the pass details");
		pass=s.nextLine();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife","root","");
			String sql="insert into staff (ID,name,designation,working_hour,salary,phone,email) values(?,?,?,?,?,?,?)";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, name);
			stmt.setString(3, dsg);
			stmt.setString(4, wrk_hr);
			stmt.setString(5, sal);
			stmt.setString(6, phone);
			stmt.setString(7, email);
			stmt.execute();
			sql="insert into staff_login (id,pwd) values(?,?)";
			stmt=con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, pass);
			stmt.execute();
			System.out.println("staff registered sucessfully");
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

}
