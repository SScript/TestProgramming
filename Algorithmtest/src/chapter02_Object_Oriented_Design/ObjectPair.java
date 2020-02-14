package chapter02_Object_Oriented_Design;

public class ObjectPair {

  Object first;
  Object second;

  public ObjectPair(Object a, Object b) { // constructor
    first = a;
    second = b;
  }

  public Object getFirst() {
    return first;
  }

  public Object getSecond() {
    return second;
  }
}
