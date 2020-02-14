/*
 * Chapter 6
 * Stacks, Queues, and Deques
 * A stack is a collection of objects that are inserted and removed according to the
 * last-in, first-out (LIFO) principle.
 */
package chapter06_Stacks_Queues_Deques;

/**
 * Stack realizācija ar masīva palīdzību
 * Izmērs ierobežots ar mainīgā CAPACITY palīdzību
 * @param <E> 
 */
public class ArrayStack<E> implements Stack<E> {

  public static final int CAPACITY = 1000; // default array capacity
  private E[] data; // generic array used for storage
  private int t = -1; // index of the top element in stack

  public ArrayStack() {
    this(CAPACITY);
  } // constructs stack with default capacity

  public ArrayStack(int capacity) { // constructs stack with given capacity
    data = (E[]) new Object[capacity]; // safe cast; compiler may give warning
  }

  @Override
  public int size() {
    return (t + 1);
  }

  @Override
  public boolean isEmpty() {
    return (t == -1);
  }

  @Override
  public void push(E e) throws IllegalStateException {
    if (size() == data.length) {
      throw new IllegalStateException("Stack is full");
    }
    data[++t] = e; // increment t before storing new item
  }

  @Override
  public E top() {
    if (isEmpty()) {
      return null;
    }
    return data[t];
  }

  @Override
  public E pop() {
    if (isEmpty()) {
      return null;
    }
    E answer = data[t];
    data[t] = null; // dereference to help garbage collection
    t--;
    return answer;
  }
}
