
package chapter07_List_and_Iterator_ADTs;

public interface Iterator<E> {
  int size();
  
  boolean hasNext();
  E next();
  void remove();
  Iterator<E> iterator();
  
}