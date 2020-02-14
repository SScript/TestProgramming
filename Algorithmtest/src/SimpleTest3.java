
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class SimpleTest3 {

  public static void main(String[] args) throws Exception {

    Calendar C = new GregorianCalendar();
    int hour = C.get(Calendar.HOUR_OF_DAY);
    int minute = C.get(Calendar.MINUTE);

    if (hour >= 16 && minute <= 59) {
      System.out.println("time between 16:00 and 16:59");
    } else {
      System.out.println("time no between 16:00 and 16:59");    
    }

  }

}