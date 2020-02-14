/*
 * Chapter 6
 * Stacks, Queues, and Deques
 * Another fundamental data structure is the queue. It is a close “cousin” of the stack,
 * but a queue is a collection of objects that are inserted and removed according to the
 * first-in, first-out (FIFO) principle
 */
package chapter06_Stacks_Queues_Deques;

/**
 * Interface for a double-ended queue: a collection of elements that can be
 * inserted and removed at both ends; this interface is a simplified version of
 * java.util.Deque.
 * @param <E>
 */
public interface Deque<E> {

  /**
   * Returns the number of elements in the deque.
   * @return 
   */
  int size();

  /**
   * Tests whether the deque is empty.
   * @return 
   */
  boolean isEmpty();

  /**
   * Returns, but does not remove, the first element of the deque (null if
   * empty).
   * @return 
   */
  E first();

  /**
   * Returns, but does not remove, the last element of the deque (null if
   * empty).
   * @return 
   */
  E last();

  /**
   * Inserts an element at the front of the deque.
   * @param e
   */
  void addFirst(E e);

  /**
   * Inserts an element at the back of the deque.
   * @param e
   */
  void addLast(E e);

  /**
   * Removes and returns the first element of the deque (null if empty).
   * @return 
   */
  E removeFirst();

  /**
   * Removes and returns the last element of the deque (null if empty).
   * @return 
   */
  E removeLast();
}
