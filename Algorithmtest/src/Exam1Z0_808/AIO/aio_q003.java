package Exam1Z0_808.AIO;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * Given the code fragment: What is the result?
 * A. May 04, 2014T00:00:00.000
 * B. An exception is thrown at runtime.
 * C. 2014-05-04T00:00: 00. 000
 * D. 5/4/14T00:00:00.000
 * 
 * Answer: B (jo uz parse tiek padots tikai datums, bet formātā ir laiks)
 */
public class aio_q003 {
  
  public static void main(String args[]) {
    String date = LocalDate
            .parse("2014-05-04")
            .format(DateTimeFormatter.ISO_DATE_TIME);
    System.out.println(date);
  }
}