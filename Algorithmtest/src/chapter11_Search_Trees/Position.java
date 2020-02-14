/**
 * Chapter 11: Priority Queue
 */
package chapter11_Search_Trees;

public interface Position<E> {
  
  /**
   * Returns the element stored at this position.
   *
   * @return the stored element
   * @throws IllegalStateException if position no longer valid
   */
  E getElement() throws IllegalStateException;

}