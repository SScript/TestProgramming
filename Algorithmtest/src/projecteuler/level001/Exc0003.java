package projecteuler.level001;

/**
 * The prime factors of 13195 are 5, 7, 13 and 29. What is the largest prime
 * factor of the number 600851475143 ? 
 * 
 * Atrast lielāko pirmskaitli, kas dalās bez atlikuma ar 600851475143
 * 
 * Atbilde: 6857
 *
 * @author Gatis
 */
public class Exc0003 {

  private static long primenumber;

  static long[] tmp = new long[460];
	static int k = 0;
	final static long PRIME = 600851475143L;
  
  public static void main(String[] args) {
    
    for (long i = 3L; i * i <= PRIME; i += 2) {
      if (isPrime(i)) {
        if (PRIME % i == 0) {
          primenumber = i;
        }
      }
    }
    System.out.println(primenumber);
    
    //System.out.println("prime factors of " + PRIME + ":");
		//prime(PRIME);
  }

  public static boolean isPrime(long n) {
    //check if n is a multiple of 2
    if (n % 2 == 0) {
      return false;
    }
    //if not, then just check the odds
    for (long i = 3; i * i <= n; i += 2) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }

  private static long prime(long n) {
		for (long j = 2; j <= n; j++) {
			if (n % j == 0) {
				tmp[k] = j;
				k++;
				System.out.println("   " + j);

				n = n / j;
				j = 2;
			}
		}
		return n;
	}
}
