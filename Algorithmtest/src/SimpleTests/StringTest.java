/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SimpleTests;

/**
 *
 * @author Gatis.Braucs
 */
public class StringTest {
  public static void main(String[] args) {
    String pk = "12345678912";
    if (pk.length() != 11) {
      System.err.println("Nav 11");
    } else {
      System.err.println("Ir 11");    
    }
  }
  
}
