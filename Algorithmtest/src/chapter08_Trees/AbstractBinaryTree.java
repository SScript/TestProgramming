package chapter08_Trees;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public abstract class AbstractBinaryTree<E> extends AbstractTree<E> implements BinaryTree<E> {

  @Override
  public Position<E> sibling(Position<E> p) {
    Position<E> parent = parent(p);
    if (parent == null) {
      return null;
    }
    if (p == left(parent)) {
      return right(parent);
    } else {
      return left(parent);
    }
  }

  @Override
  public int numChildren(Position<E> p) {
    int count = 0;
    if (left(p) != null) {
      count++;
    }
    if (right(p) != null) {
      count++;
    }
    return count;
  }

  @Override
  public Iterable<Position<E>> children(Position<E> p) {
    List<Position<E>> snapshot = new ArrayList<>(2);
    if (left(p) != null) {
      snapshot.add(left(p));
    }
    if (right(p) != null) {
      snapshot.add(right(p));
    }
    return snapshot;
  }

  /**
   * Adds positions of the subtree rooted at Position p to the given snapshot.
   */
  private void inorderSubtree(Position<E> p, List<Position<E>> snapshot) {
    if (left(p) != null) {
      inorderSubtree(left(p), snapshot);
    }
    snapshot.add(p);
    if (right(p) != null) {
      inorderSubtree(right(p), snapshot);
    }
  }

  /**
   * Returns an iterable collection of positions of the tree, reported in
   * inorder.
   *
   * @return
   */
  public Iterable<Position<E>> inorder() {
    List<Position<E>> snapshot = new ArrayList<>();
    if (!isEmpty()) {
      inorderSubtree(root(), snapshot); // fill the snapshot recursively
    }
    return snapshot;
  }

  /**
   * Overrides positions to make inorder the default order for binary trees.
   *
   * @return
   */
  @Override
  public Iterable<Position<E>> positions() {
    return inorder();
  }

  /**
   * Returns total disk space for subtree of T rooted at p.
   */
  public static int diskSpace(Tree<Integer> T, Position<Integer> p) {
    int subtotal = p.getElement(); // we assume element represents space usage
    for (Position<Integer> c : T.children(p)) {
      subtotal += diskSpace(T, c);
    }
    return subtotal;
  }

  public static <E> int layout(BinaryTree<E> T, Position<E> p, int d, int x) {
    if (T.left(p) != null) {
      x = layout(T, T.left(p), d + 1, x); // resulting x will be increased
    }
    //p.getElement().setX(x++); // post-increment x
    //p.getElement().setY(d);
    if (T.right(p) != null) {
      x = layout(T, T.right(p), d + 1, x); // resulting x will be increased
    }
    return x;
  }
  
  /**
   * Prints parenthesized representation of subtree of T rooted at p.
   */
  public static <E> void parenthesize(Tree<E> T, Position<E> p) {
    System.out.print(p.getElement());
    if (T.isInternal(p)) {
      boolean firstTime = true;
      for (Position<E> c : T.children(p)) {
        System.out.print((firstTime ? " (" : ", ")); // determine proper punctuation
        firstTime = false; // any future passes will get comma
        parenthesize(T, c); // recur on child
      }
      System.out.print(")");
    }
  }

  /**
   * Prints labeled representation of subtree of T rooted at p having depth d.
   */
  public static <E> void printPreorderLabeled(Tree<E> T, Position<E> p, ArrayList<Integer> path) {
    int d = path.size(); // depth equals the length of the path
    System.out.print(spaces(2 * d)); // print indentation, then label
    for (int j = 0; j < d; j++) {
      System.out.print(path.get(j) + (j == d - 1 ? " " : "."));
    }
    System.out.println(p.getElement());
    path.add(1); // add path entry for first child
    for (Position<E> c : T.children(p)) {
      printPreorderLabeled(T, c, path);
      path.set(d, 1 + path.get(d)); // increment last entry of path
    }
    path.remove(d); // restore path to its incoming state
  }

  /**
   * Prints preorder representation of subtree of T rooted at p having depth d.
   */
  public static <E> void printPreorderIndent(Tree<E> T, Position<E> p, int d) {
    System.out.println(spaces(2 * d) + p.getElement()); // indent based on d
    for (Position<E> c : T.children(p)) {
      printPreorderIndent(T, c, d + 1); // child depth is d+1
    }
  }

  private static String spaces(int n) {
    String res = "";
    for (int i = 1; i <= n; i++) {
      res = res + " ";
    }
    return " ";
  }

  private class ElementIterator implements Iterator<E> {

    java.util.Iterator<Position<E>> posIterator = positions().iterator();

    @Override
    public boolean hasNext() {
      return posIterator.hasNext();
    }

    @Override
    public E next() {
      return posIterator.next().getElement();
    }

    @Override
    public void remove() {
      posIterator.remove();
    }
  }

  @Override
  public Iterator<E> iterator() {
    return new ElementIterator();
  }
}
