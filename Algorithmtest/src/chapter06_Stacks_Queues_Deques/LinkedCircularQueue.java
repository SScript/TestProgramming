/*
 * Chapter 6
 * Stacks, Queues, and Deques
 * Another fundamental data structure is the queue. It is a close “cousin” of the stack,
 * but a queue is a collection of objects that are inserted and removed according to the
 * first-in, first-out (FIFO) principle
 */
package chapter06_Stacks_Queues_Deques;


public class LinkedCircularQueue<E> implements CircularQueue<E> {

  private final CircularlyLinkedList<E> list = new CircularlyLinkedList<>();
  
  public LinkedCircularQueue() {
  }
  
  @Override
  public void rotate() {
    list.rotate();
  }

  @Override
  public int size() {
    return list.size();
  }

  @Override
  public boolean isEmpty() {
    return list.isEmpty();
  }

  @Override
  public void enqueue(E e) {
    list.addLast(e);
  }

  @Override
  public E first() {
    return list.first();
  }

  @Override
  public E dequeue() {
    return list.removeFirst();
  }
  
}
