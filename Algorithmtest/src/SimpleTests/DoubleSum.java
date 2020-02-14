/*
 * double 0.1 nav tieši 0.1 bet ļoti tuvs tam.
 * tāpēc saskaitot ciklā redzam, ka pēc laika parādās aiz komata tālāk atšķirība
 */
package SimpleTests;

/**
 *
 * @author Gatis
 */
public class DoubleSum {

  public static void main(String[] args) {
    for (double x = 1.0; x <= 2.0; x += 0.1) {
      System.out.println(x);
    }
  }
}
