package wildlife;
import com.mongodb.*;
import java.util.*;
public class Retrive_ani_id {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s=new Scanner(System.in);
		String type,id;
		DBObject id1;
		System.out.println("enter the type of element");
		type=s.next();
		try {
			Mongo m=new Mongo("127.0.0.1",27017);
			DB db=m.getDB("wildlife1");
			DBCollection col=db.getCollection("animals");
			DBObject query=new BasicDBObject();
			DBObject attr=new BasicDBObject();
			attr.put("_id", 1);
			System.out.println("got the data");
			query = new BasicDBObject("type", new BasicDBObject("$regex", type));
			DBCursor con=col.find(query);
			while(con.hasNext())
			{
				id1=con.next();
				id=(String) id1.get("_id");
				System.out.println(id);
			}
		}catch(Exception e) {e.printStackTrace();}
	}

}
