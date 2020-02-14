package Exam1Z0_808.AIO;

/**
 * Given the code fragment: What is the result if the integer aVar is 9?
 *
 * A. Hello World! 
 * B. Hello Universe! 
 * C. Hello World! 
 * D. Compilation fails.
 *
 * Answer: 10 Hello World!
 */
public class aio_q002 {

  public static void main(String args[]) {
    int aVar = 9;
    if (aVar++ < 10) {
      System.out.println(aVar + " Hello World!");
    } else {
      System.out.println(aVar + " Hello Universe!");
    }
  }
  
}
