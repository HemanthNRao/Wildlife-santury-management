package wildlife;

import java.util.*;
import com.mongodb.*;

public class visitor_retrive_ani_data {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String id;
		Scanner s=new Scanner(System.in);
		int f=0;
		System.out.println("enter ani id");
		id=s.next();
		try {
		Mongo m=new Mongo("127.0.0.1",27017);
		DB db=m.getDB("wildlife1");
		DBCollection col=db.getCollection("animals");
		BasicDBObject query=new BasicDBObject("_id",id);
		Iterator<DBObject> cur = col.find(query).iterator(); 
		    while (cur.hasNext()) {
		        DBObject doc = cur.next();
		        System.out.println("name:"+doc.get("name"));
		        System.out.println("scintific name:"+doc.get("scintific name"));
		        System.out.println("age:"+doc.get("age"));
		        System.out.println("type:"+doc.get("type"));
		    }
		}
		catch(Exception e) {
			
		}
		
	}

}
