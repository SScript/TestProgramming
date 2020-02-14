/*
 * Chapter 6
 * Stacks, Queues, and Deques
 * Another fundamental data structure is the queue. It is a close “cousin” of the stack,
 * but a queue is a collection of objects that are inserted and removed according to the
 * first-in, first-out (FIFO) principle
 */
package chapter12_Sorting_and_Selection;

public interface Queue<E> {

  /**
   * Returns the number of elements in the queue.
   * @return 
   */
  int size();

  /**
   * Tests whether the queue is empty.
   * @return 
   */
  boolean isEmpty();

  /**
   * Inserts an element at the rear of the queue.
   * @param e
   */
  void enqueue(E e);

  /**
   * Returns, but does not remove, the first element of the queue (null if
   * empty).
   * @return 
   */
  E first();

  /**
   * Removes and returns the first element of the queue (null if empty).
   * @return 
   */
  E dequeue();
}