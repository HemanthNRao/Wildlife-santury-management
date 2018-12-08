package wildlife;
import com.mongodb.*;
import java.util.*;

import javax.swing.text.Document;
public class sample_try {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String id="ele1";
		try {
		Mongo m=new Mongo("127.0.0.1",27017);
		System.out.println("successfully connected to db");
		DB db=m.getDB("wildlife1");
		System.out.println("server is working");
		DBCollection col=db.getCollection("animals");
		System.out.println("collection");
		BasicDBObject query=new BasicDBObject("_id",id);
		Iterator<DBObject> cur = col.find(query).iterator(); {
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

		}
		catch(Exception e)
		{
			//e.printStackTrace();
			System.out.println("no collection");
		}
	}

}
