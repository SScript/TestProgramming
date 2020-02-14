/**
 * acronym ir funkcija, kas atgriež no ievadītā teksta visu vārdu pirmos burtus.
 */
package SimpleTests;

import java.util.Scanner;

public class Acronym {

  public static void main(String[] args) {
    System.out.println("This program sums the digits in an integer.");
    Scanner in = new Scanner(System.in);
    System.out.printf("Enter number of objects in the set (n):  ");
    String n = in.nextLine();
    System.out.println("acronym is:  " + acronym(n));
  }

  private static String acronym(String str) {
    String result = str.substring(0, 1);
    int pos = str.indexOf(' ');
    while (pos != -1) {
      result += str.substring(pos + 1, pos + 2);
      pos = str.indexOf(' ', pos + 1);
    }
    return result;
  }
}
