/*
 * Chapter 7 - List and Iterator ADTs
 */
package chapter07_List_and_Iterator_ADTs;

public interface Position<E> {

  /**
   * Returns the element stored at this position.
   *
   * @return the stored element
   * @throws IllegalStateException if position no longer valid
   */
  E getElement() throws IllegalStateException;
}