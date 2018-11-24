

import java.io.File;
import java.io.IOException;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;

import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.*;
import java.text.DateFormatSymbols;
public class readExcel {

	public static void main(String[] args) throws BiffException, IOException {
		// TODO Auto-generated method stub
		int i,j;
		double sum=0.0,s1;
		File f=new File("/home/hemanth/Downloads/ms3.ods");
		Workbook wb=Workbook.getWorkbook(f);
		Sheet s=wb.getSheet(0);
		int row=s.getRows();
		int col=s.getColumns();
		for(i=1;i<row;i++)
		{
			String c=s.getCell(2,i).getContents();
			s1=Double.parseDouble(c);
			sum=sum+s1;
		}
		System.out.println(sum);
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
		

	}

}
