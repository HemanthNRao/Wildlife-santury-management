package wildlife;

import java.util.*;
import com.mongodb.*;

public class Staff_retrive_ani_data {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String id;
		int f=0;
		Scanner s=new Scanner(System.in);
		System.out.println("enter the id");	
		id=s.next();
		try {
		Mongo m=new Mongo("127.0.0.1",27017);
		DB db=m.getDB("wildlife1");
		DBCollection col=db.getCollection("animals");
		BasicDBObject query=new BasicDBObject("_id",id);
		Iterator<DBObject> cur = col.find(query).iterator(); 
		    while (cur.hasNext()) {
		        DBObject doc = cur.next();
		        List list = new ArrayList(((LinkedHashMap<String, Object>) doc).values());
		        List list1 = new ArrayList(((LinkedHashMap<String, Object>) doc).keySet());
		        Iterator i=list1.iterator();
		        Iterator j=list.iterator();
		        while(i.hasNext() && j.hasNext()) {
		        	System.out.print(i.next());
			        System.out.print(": ");
			        System.out.println(j.next());
		        }
		    }
		}
		catch(Exception e) {e.printStackTrace();}
	}

}
