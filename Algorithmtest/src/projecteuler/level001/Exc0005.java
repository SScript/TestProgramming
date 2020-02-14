package projecteuler.level001;

/**
* 2520 is the smallest number that can be divided by each of the numbers from 1
* to 10 without any remainder. What is the smallest positive number that is
* evenly divisible by all of the numbers from 1 to 20?
* 
* Atbilde: 232792560
* @author Gatis
*/
public class Exc0005 {

  public static void main(String[] args) {

    boolean proceseet = true;
    boolean irAtlikums = false;
    int foundNumber = 21;
    while (proceseet) {
      irAtlikums = false;
      for (int i = 1; i <= 20; i++) {
        if (foundNumber % i != 0) {
          irAtlikums = true;
          break;
        }
      }
      if (irAtlikums) {
        foundNumber++;
      } else {
        proceseet = false;
        System.out.println(foundNumber);        
      }
    }
  }

}
