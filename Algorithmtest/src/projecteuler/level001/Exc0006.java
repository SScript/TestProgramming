package projecteuler.level001;

/**
* The sum of the squares of the first ten natural numbers is,
* 1^2 + 2^2 + ... + 10^2 = 385
* The square of the sum of the first ten natural numbers is,
* (1 + 2 + ... + 10)^2 = 55^2 = 3025
* Hence the difference between the sum of the squares of the first ten natural 
* numbers and the square of the sum is 3025 − 385 = 2640.
* Find the difference between the sum of the squares of the first one hundred 
* natural numbers and the square of the sum.
*
* Atbilde: 25164150
* 
* @author Gatis
*/
public class Exc0006 {

  public static void main(String[] args) {
    Long summ1;
    Long summ2;
    long result = 0L;
    
    Long N = 100L;
    
//    summ1 = 0L;
//    summ2 = 0L;
//    for (int i = 1; i<=N; i++) {
//      summ1 = summ1 + i*i;
//      summ2 = summ2 + i;
//    }
//    summ2 = summ2*summ2;
//    
//    System.out.println("Kvadrātu summa: " + summ1);
//    System.out.println("Skaitļu summas kvadrāts: " + summ2);
//    System.out.println("Starpība: " + (summ2 - summ1));
    
    //tas pats, kas iepriekš ar ciklu
    summ1 = N * (N+1)/ 2;
    summ2 = (N * (N + 1) * (2 * N + 1)) / 6;

    result = summ1 * summ1 - summ2;
    System.out.println("Starpība: " + result);
  }

}