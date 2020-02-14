/**
 * Chapter 9: Priority Queue
 */
package chapter09_Priority_Queues;

public interface Position<E> {
  
  /**
   * Returns the element stored at this position.
   *
   * @return the stored element
   * @throws IllegalStateException if position no longer valid
   */
  E getElement() throws IllegalStateException;

}