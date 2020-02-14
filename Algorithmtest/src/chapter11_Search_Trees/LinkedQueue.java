/*
 * Chapter 6
 * Stacks, Queues, and Deques
 * Another fundamental data structure is the queue. It is a close “cousin” of the stack,
 * but a queue is a collection of objects that are inserted and removed according to the
 * first-in, first-out (FIFO) principle
 */
package chapter11_Search_Trees;

/**
 * Realization of a FIFO queue as an adaptation of a SinglyLinkedList.
 */
public class LinkedQueue<E> implements Queue<E> {

  private final SinglyLinkedList<E> list = new SinglyLinkedList<>(); // an empty list

  public LinkedQueue() {
  } // new queue relies on the initially empty list

  @Override
  public int size() {
    return list.size();
  }

  @Override
  public boolean isEmpty() {
    return list.isEmpty();
  }

  @Override
  public void enqueue(E element) {
    list.addLast(element);
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
