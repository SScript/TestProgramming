package projecteuler.level001;

/**
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17. Find the sum of all the
 * primes below two million.
 *
 * Atbilde: 142913828922
 *
 * @author Gathis
 */
public class Exc0010 {

  private static Long primenumber = 2L;
  final static Long maxNum = 2000000L;

  public static void main(String[] args) {
    for (Long i = 3L; i <= maxNum; i++) {
      if (isPrime(i)) {
        primenumber = primenumber + i;
      }
    }
    System.out.println(primenumber);
  }

  static boolean isPrime(Long n) {
    if (n % 2 == 0) {
      return false;
    }
    for (int i = 3; i * i <= n; i += 2) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }

}
