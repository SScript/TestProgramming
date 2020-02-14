package Exam1Z0_808.AIO;

/**
 * Given the code fragment: What is the result?
 * A. A NullPointerException is thrown at runtime.
 * B. No Match
 * C. Match 2
 * D. Match 1
 * 
 * Answer: C
 */
public class aio_q010 {
  public static void main(String args[]) {
    StringBuilder sb = new StringBuilder();
    String s = "";
    
    if (sb.equals(s)) {
      System.out.println("Match 1");
    } else if (sb.toString().equals(s.toString())) {
      System.out.println("Match 2");
    } else {
      System.out.println("No Match");
    }
  }
}