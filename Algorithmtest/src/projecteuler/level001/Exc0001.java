/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projecteuler.level001;

/**
*  What is the sum of all the multiples of 3 or 5 below 1000?
*  If we list all the natural numbers below 10 that are multiples of 3 or 5,
*  we get 3, 5, 6 and 9. The sum of these multiples is 23.
*  Find the sum of all the multiples of 3 or 5 below 1000.
 * @author Gatis
 */
public class Exc0001 {

  public static void main(String[] args) {
    int total = 0;
    for (int i = 0; i < 1000; i++) {
      if (i % 3 == 0 || i % 5 == 0) {
        //System.out.println(i);
        total = total + i;
      }
    }
    System.out.println("Tota = " + total);
  }
}
