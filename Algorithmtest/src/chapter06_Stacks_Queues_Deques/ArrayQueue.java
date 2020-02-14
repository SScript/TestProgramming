/*
 * Chapter 6
 * Stacks, Queues, and Deques
 * Another fundamental data structure is the queue. It is a close “cousin” of the stack,
 * but a queue is a collection of objects that are inserted and removed according to the
 * first-in, first-out (FIFO) principle
 */
package chapter06_Stacks_Queues_Deques;

/**
 * Implementation of the queue ADT using a fixed-length array.
 */
public class ArrayQueue<E> implements Queue<E> {

  // instance variables

  public static final int CAPACITY = 1000; // default array capacity
  private E[] data; // generic array used for storage
  private int f = 0; // index of the front element
  private int sz = 0; // current number of elements

  // constructors
  public ArrayQueue() {
    this(CAPACITY);
  } // constructs queue with default capacity

  public ArrayQueue(int capacity) { // constructs queue with given capacity
    data = (E[]) new Object[capacity]; // safe cast; compiler may give warning
  }

  // methods

  /**
   * Returns the number of elements in the queue.
   */
  @Override
  public int size() {
    return sz;
  }

  /**
   * Tests whether the queue is empty.
   */
  @Override
  public boolean isEmpty() {
    return (sz == 0);
  }

  /**
   * Inserts an element at the rear of the queue.
   */
  @Override
  public void enqueue(E e) throws IllegalStateException {
    if (sz == data.length) {
      throw new IllegalStateException("Queue is full");
    }
    int avail = (f + sz) % data.length; // use modular arithmetic
    data[avail] = e;
    sz++;
  }

  /**
   * Returns, but does not remove, the first element of the queue (null if
   * empty).
   */
  @Override
  public E first() {
    if (isEmpty()) {
      return null;
    }
    return data[f];
  }

  /**
   * Removes and returns the first element of the queue (null if empty).
   */
  @Override
  public E dequeue() {
    if (isEmpty()) {
      return null;
    }
    E answer = data[f];
    data[f] = null; // dereference to help garbage collection
    f = (f + 1) % data.length;
    sz--;
    return answer;
  }
}