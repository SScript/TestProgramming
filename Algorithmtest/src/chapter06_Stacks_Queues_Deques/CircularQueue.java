/*
 * Chapter 6
 * Stacks, Queues, and Deques
 * Another fundamental data structure is the queue. It is a close “cousin” of the stack,
 * but a queue is a collection of objects that are inserted and removed according to the
 * first-in, first-out (FIFO) principle
 */
package chapter06_Stacks_Queues_Deques;

public interface CircularQueue<E> extends Queue<E> {

  /**
   * Rotates the front element of the queue to the back of the queue. This does
   * nothing if the queue is empty.
   */
  void rotate();
}