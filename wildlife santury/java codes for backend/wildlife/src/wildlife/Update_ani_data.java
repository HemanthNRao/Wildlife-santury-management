package wildlife;

import java.util.*;
import com.mongodb.*;

public class Update_ani_data {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String new_value,search_value,new_key,search_key;
		Scanner s=new Scanner(System.in);
		System.out.println("enter search key");
		search_key=s.next();
		System.out.println("enter search value");
		search_value=s.next();
		System.out.println("enter new key");
		new_key=s.next();
		System.out.println("enter new value");
		new_value=s.next();
		try {
		Mongo m=new Mongo("127.0.0.1",27017);
		DB d=m.getDB("wildlife1");
		DBCollection con=d.getCollection("animals");
		BasicDBObject newDocument = new BasicDBObject();//object to store new value and corresponding key
		newDocument.append("$set", new BasicDBObject(new_key,new_value));
		BasicDBObject SearchQuery = new BasicDBObject().append(search_key, search_value);
		con.update(SearchQuery,newDocument);
		System.out.println("success update");
	}
	catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
