package SimpleTests;

import java.io.Console;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTEst {
  
  public static void main(String[] args) {
    String date_from = "2015-14-01";
    DateFormat df = null;
    Date from_date = null;
    
     df = new SimpleDateFormat("yyyy-MM-dd");
     df.setLenient(false);
      try {
        from_date = df.parse(date_from);
        System.err.println("Ok" + from_date.toString());
      } catch (Exception e) {
        System.err.println("Kļūda");
      }    
  }
}
