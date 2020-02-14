/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SimpleTests;

/**
 *
 * @author Gatis
 */
public class LeapYear {

  public static void main(String[] args) {
    System.out.println(isLeapYear(1980));
  }

  static boolean isLeapYear(int year) {
    return (((year % 4 == 0) && (year % 100 != 0))
            || (year % 400 == 0));
  }

}
