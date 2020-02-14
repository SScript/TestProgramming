/*
 * Chapter 6
 * Stacks, Queues, and Deques
 * Another fundamental data structure is the queue. It is a close “cousin” of the stack,
 * but a queue is a collection of objects that are inserted and removed according to the
 * first-in, first-out (FIFO) principle
 */
package chapter06_Stacks_Queues_Deques;

public class Josephus {

  /**
   * Computes the winner of the Josephus problem using a circular queue.
   * @param <E>
   * @param queue
   * @param k
   * @return 
   */
  public static <E> E Josephus(CircularQueue<E> queue, int k) {
    if (queue.isEmpty()) {
      return null;
    }
    while (queue.size() > 1) {
      for (int i = 0; i < k - 1; i++) // skip past k-1 elements
      {
        queue.rotate();
      }
      E e = queue.dequeue(); // remove the front element from the collection
      System.out.println(" " + e + " is out");
    }
    return queue.dequeue(); // the winner
  }

  /**
   * Builds a circular queue from an array of objects.
   * @param <E>
   * @param a
   * @return 
   */
  public static <E> CircularQueue<E> buildQueue(E a[]) {
    CircularQueue<E> queue = new LinkedCircularQueue<>();
    //for (int i = 0; i < a.length; i++) {
    //  queue.enqueue(a[i]);
    //}    
    for (E a1 : a) {
      queue.enqueue(a1);
    }
    return queue;
  }

  /**
   * Tester method
   * @param args
   */
  public static void main(String[] args) {
    String[] a1 = {"Alice", "Bob", "Cindy", "Doug", "Ed", "Fred"};
    String[] a2 = {"Gene", "Hope", "Irene", "Jack", "Kim", "Lance"};
    String[] a3 = {"Mike", "Roberto"};
    System.out.println("First winner is " + Josephus(buildQueue(a1), 3));
    System.out.println("Second winner is " + Josephus(buildQueue(a2), 10));
    System.out.println("Third winner is " + Josephus(buildQueue(a3), 7));
  }
}
