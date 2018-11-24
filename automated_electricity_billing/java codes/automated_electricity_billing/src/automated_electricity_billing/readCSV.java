package automated_electricity_billing;

import java.io.File;
import java.util.*;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;

public class readCSV {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String data;
		String sl[];
		double s1,sum=0.0; 
		File f=new File("/home/hemanth/Downloads/feeds(1).csv");
		try
		{
			Scanner in=new Scanner(f);
			while(in.hasNext()) {
				data=in.next();
				sl=data.split(",");
				System.out.println(data);
				s1=Double.parseDouble(sl[2]);
				sum=sum+s1;
			}
			in.close();
			double bal=0.0;
			double cur_amt=sum*10.25;
			double tmt=bal+cur_amt;
			String unit;
			String bal1,cuta,tmt1,month;
			bal1=String.valueOf(bal);
			cuta=String.valueOf(cur_amt);
			tmt1=String.valueOf(tmt);
			unit=String.valueOf(sum);
			//month = new DateFormatSymbols().getMonths()[month1-1];
			BasicDBObject document = new BasicDBObject();
			document.put("_id", "RRBW0123");
			document.put("month","NOV");
			document.put("unit",unit);
			document.put("balance",bal1);
			document.put("cur_amount",cuta);
			document.put("total_amount",tmt1);
			Mongo m=new Mongo("127.0.0.1",27017);
			DB db=m.getDB("wildlife1");
			DBCollection col1=db.getCollection("animals");
			col1.insert(document);
			System.out.println("successfull");
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
