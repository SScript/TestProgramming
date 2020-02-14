package projecteuler.level001;

/**
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
 * that the 6th prime is 13. What is the 10 001st prime number?
 * 
* Atbilde: 104743
 *
 * @author Gatis
 */
public class Exc0007 {

  public static void main(String[] args) {
    int count = 0;
    int cip = 1;
    do {
      cip++;
      if (getPrime(cip)) {
        count++;
      }
    } while (count < 10001);
    System.out.println(cip);
  }

  public static boolean getPrime(int i) {
    long check = i;
    for (int k = 2; k <= Math.sqrt(check); k++) {
      if (check % k == 0) {
        return false;
      }
    }
    return true;
  }

}