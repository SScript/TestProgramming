package Exam1Z0_808;

import java.io.IOException;

public class Q001 {

  public static void main(String args[]) throws IOException {
    int var1 = -5;
    int var2 = var1--;
    int var3 = 0;
    if (var2 < 0) {
      var3 = var2++;
    } else {
      var3 = --var2;
    }
    System.out.println(var3);
    System.in.read();
  }
  
}