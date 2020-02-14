package chapter02_Object_Oriented_Design;

public class Pair<A, B> {

  A first;
  B second;

  public Pair(A a, B b) { // constructor
    first = a;
    second = b;
  }

  public A getFirst() {
    return first;
  }

  public B getSecond() {
    return second;
  }
}
