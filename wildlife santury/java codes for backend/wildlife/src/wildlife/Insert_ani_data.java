package wildlife;
import com.mongodb.*;
import java.util.*;
public class Insert_ani_data {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<String> key=new ArrayList();
		ArrayList<String> values=new ArrayList();
		key.add("_id");
		key.add("name");
		key.add("type");
		key.add("food");
		key.add("species");
		values.add("ele4");
		values.add("surya");
		values.add("elephant");
		values.add("{'morninsg':'10kg sugarcane','noon':'5kg rice','evening':'10kg sugarcane'}");
		values.add("anova");
		String a="";
		if(a.isEmpty())
			System.out.println("true");
		BasicDBObject document = new BasicDBObject();//BasicDBObject is data structure to store key and value pair
		Iterator i=key.iterator();
		Iterator j=values.iterator();
		try {
			while(i.hasNext() && j.hasNext()) {
				document.put((String) i.next(),(String) j.next());
			}
			Mongo m=new Mongo("127.0.0.1",27017);
			DB db=m.getDB("wildlife1");
			DBCollection col=db.getCollection("animals");
			col.setWriteConcern(new WriteConcern(1));
			col.insert(document);
			System.out.println("successfull");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
