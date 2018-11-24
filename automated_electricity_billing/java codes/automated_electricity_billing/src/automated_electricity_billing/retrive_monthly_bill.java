package automated_electricity_billing;
import com.mongodb.*;
import java.util.*;
public class retrive_monthly_bill {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String id,month,mtn,mon;
		double unit,bal,camt,tamt;
		DBObject data;
		Scanner s=new Scanner(System.in);
		System.out.println("enter bill num and month");
		id=s.next();
		month=s.next();
		try {
			Mongo m=new Mongo("127.0.0.1",27017);
			DB db=m.getDB("KEB");
			DBCollection col=db.getCollection("bills");
			BasicDBObject query = new BasicDBObject();
			List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
			obj.add(new BasicDBObject("_id", id));
			obj.add(new BasicDBObject("month", month));
			query.put("$and", obj);
			Iterator<DBObject> cur = col.find(query).iterator(); 
			while(cur.hasNext())
			{
				data=cur.next();
				mtn=(String) data.get("_id");
				mon=(String) data.get("month");
				unit=(double) data.get("unit");
				bal=(double) data.get("balance");
				camt=(double) data.get("cur_amount");
				tamt=(double) data.get("total_amount");
				System.out.println(mtn+mon+unit+bal+camt+tamt);
			}
				
		}
		catch(Exception e) {
		e.printStackTrace();}
	}

}
