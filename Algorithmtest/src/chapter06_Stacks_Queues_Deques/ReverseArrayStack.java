package chapter06_Stacks_Queues_Deques;

import java.util.Arrays;

public class ReverseArrayStack {

  /**
   * A generic method for reversing an array.
   * @param <E>
   * @param a
   */
  public static <E> void reverse(E[] a) {
    Stack<E> buffer = new ArrayStack<>(a.length);
    //vecais cikls
    //for (int i = 0; i < a.length; i++) {
    //  buffer.push(a[i]);
    //}
    //var ar šādu ciklu - atmiņa par vienu mainīgo mazāk
    for (E a1 : a) {
      buffer.push(a1);
    }
    for (int i = 0; i < a.length; i++) {
      a[i] = buffer.pop();
    }
  }

  /**
   * Tester routine for reversing arrays
   * @param args
   */
  public static void main(String args[]) {
    Integer[] a = {4, 8, 15, 16, 23, 42}; // autoboxing allows this
    String[] s = {"Jack", "Kate", "Hurley", "Jin", "Michael"};
    System.out.println("a = " + Arrays.toString(a));
    System.out.println("s = " + Arrays.toString(s));
    System.out.println("Reversing...");
    reverse(a);
    reverse(s);
    System.out.println("a = " + Arrays.toString(a));
    System.out.println("s = " + Arrays.toString(s));
  }

}
