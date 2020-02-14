package Exam1Z0_808.AIO;

import java.io.IOException;
/**
 * Given the code fragment:
 * Which two modifications should you make so that the code
 * compiles successfully?
 * 
 * A. Replace line 8 with public static void Main(String[] args) throws Exception {...
 * B. Replace line 10 with
 *      try {
 *        xobj.printFileContent():
 *      }
 *      catch (Exception e) {}
 *      catch (IOException e) {}
 * 
 * C. Replace line 2 with public void printFileContent() throws IOException {...
 * D. Replace line 4 with throw IOException("Exception raised");
 * E. At line 11, insert throw new IOException();
 * 
 * Answer: A, C
 */

class X { //line 1
  public void printFileContent() { //line 2
    /* code goes here*/ //line 3
      throw new IOException(); //line 4
  } //line 5
} //line 6
public class aio_q008 { //line 7
  public static void main(String args[]) { //line 8
    X xobj = new X(); //line 9
    xobj.printFileContent(); //line 10
  }//line 11
} //line 12