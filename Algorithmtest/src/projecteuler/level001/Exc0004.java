package projecteuler.level001;

/**
 * A palindromic number reads the same both ways. The largest palindrome made
 * from the product of two 2-digit numbers is 9009 = 91 × 99. Find the largest
 * palindrome made from the product of two 3-digit numbers.
 * 
* Atrast leilāko palindromic skaitli, kas veidojas no divu trīs ciparu skaitļu
 * reizinājuma
 *
 *  Atbilde: 906609
 * @author Gatis
 */
public class Exc0004 {

  public static void main(String[] args) {

    long biggest = 0;
    int a = 999, b = 999;
    for (int bb = b; bb > 0; bb--) {
      for (int aa = a; aa > 0; aa--) {
        if (isPalindromic(new Long(aa * bb).toString())) {
          if (aa * bb > biggest) {
            biggest = aa * bb;
          }
        }
      }
    }
    System.out.println(biggest);
  }

  public static boolean isPalindromic(String n) {
    return n.equals(new StringBuffer(n).reverse().toString());
  }
}
