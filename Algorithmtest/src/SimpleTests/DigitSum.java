/*
 * Saskaita ievadītā skaitļa ciparu summu
 */
package SimpleTests;

import java.util.Scanner;

public class DigitSum {

  public static void main(String[] args) {
    System.out.println("This program sums the digits in an integer.");
    Scanner in = new Scanner(System.in);
    System.out.printf("Enter a positive integer:  ");
    int n = in.nextInt();
    int dsum = 0;
    while (n > 0) {
      dsum += n % 10;
      n /= 10;
    }
    System.out.println("The sum of the digits is " + dsum);
  }
}
