package projecteuler.level001;

/**
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 *
 * a^2 + b^2 = c^2
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 *
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 *
 * Atbilde: 200, 375, 425 = 200*375*425 = 31875000
 *
 * @author Gatis
 */
public class Exc0009 {

  public static void main(String[] args) {
      for (int a = 1; a <= 998; a++) {
        for (int b = 1; b <= 999 - a; b++) {
          int c = 1000 - a - b;
          if (a*a + b*b == c*c) {
            System.out.println("a=" + a + " b=" + b + " c= " + c);
          }
        }
      }
  }

}