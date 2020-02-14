package Exam1Z0_808.AIO;

/**
 * Given the code fragment: What is the result?
 * A. Sum is 600
 * B. Compilation fails at line n1.
 * C. Compilation fails at line n2.
 * D. A ClassCastException is thrown at line n1.
 * E. A ClassCastException is thrown at line n2.
 * 
 * Answer: C
 */
public class aio_q004 {
  
  public static void main(String args[]) {
    Short s1 = 100;
    Integer s2 = 400;
    Long s3 = (long) s1 + s2;     //line n1
    String s4 = (String) (s3*s2); //line n2 -> long nevar pa taisno uz String
    
    System.out.println("Sum is" + s4);
  }
  
}