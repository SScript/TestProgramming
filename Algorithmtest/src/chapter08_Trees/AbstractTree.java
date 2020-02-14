package chapter08_Trees;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * An abstract base class providing some functionality of the Tree interface.
 */
public abstract class AbstractTree<E> implements Tree<E> {

  @Override
  public boolean isInternal(Position<E> p) {
    return numChildren(p) > 0;
  }

  @Override
  public boolean isExternal(Position<E> p) {
    return numChildren(p) == 0;
  }

  @Override
  public boolean isRoot(Position<E> p) {
    return p == root();
  }

  @Override
  public boolean isEmpty() {
    return size() == 0;
  }

  public int depth(Position<E> p) {
    if (isRoot(p)) {
      return 0;
    } else {
      return 1 + depth(parent(p));
    }
  }

  public int height(Position<E> p) {
    int h = 0;
    for (Position<E> c : children(p)) {
      h = Math.max(h, 1 + height(c));
    }
    return h;
  }

  private int heighBad() {
    int h = 0;
    for (Position<E> p : positions()) {
      if (isExternal(p)) {
        h = Math.max(h, depth(p));
      }
    }
    return h;
  }

  /**
   * Adds positions of the subtree rooted at Position p to the given snapshot.
   */
  private void preorderSubTree(Position<E> p, List<Position<E>> snapshot) {
    snapshot.add(p);  // for preorder, we add position p before exploring subtrees
    for (Position<E> c : children(p)) {
      preorderSubTree(c, snapshot);
    }
  }

  /**
   * Returns an iterable collection of positions of the tree, reported in
   * preorder.
   */
  public Iterable<Position<E>> preorder() {
    List<Position<E>> snapshot = new ArrayList<>();
    if (!isEmpty()) {
      preorderSubTree(root(), snapshot);  // fill the snapshot recursively
    }
    return snapshot;
  }

  /**
   * Adds positions of the subtree rooted at Position p to the given snapshot.
   */
  private void postorderSubtree(Position<E> p, List<Position<E>> snapshot) {
    for (Position<E> c : children(p)) {
      postorderSubtree(c, snapshot);
    }
    snapshot.add(p);  // for postorder, we add position p after exploring subtrees
  }

  /**
   * Returns an iterable collection of positions of the tree, reported in
   * postorder.
   */
  public Iterable<Position<E>> postorder() {
    List<Position<E>> snapshot = new ArrayList<>();
    if (!isEmpty()) {
      postorderSubtree(root(), snapshot);  // fill the snapshot recursively
    }
    return snapshot;
  }

  /**
   * Returns an iterable collection of positions of the tree in breadth-first
   * order.
   */
  public Iterable<Position<E>> breadthfirst() {
    List<Position<E>> snapshot = new ArrayList<>();
    if (!isEmpty()) {
      Queue<Position<E>> fringe = new LinkedQueue<>();
      fringe.enqueue(root());  // start with the root
      while (!fringe.isEmpty()) {
        Position<E> p = fringe.dequeue();  // remove from front of the queue
        snapshot.add(p);  // report this position
        for (Position<E> c : children(p)) {
          fringe.enqueue(c);  // add children to back of queue
        }
      }
    }
    return snapshot;
  }

  //---------------- nested ElementIterator class ----------------
 /* This class adapts the iteration produced by positions() to return elements. */
  private class ElementIterator implements Iterator<E> {

    Iterator<Position<E>> posIterator = positions().iterator();

    @Override
    public boolean hasNext() {
      return posIterator.hasNext();
    }

    @Override
    public E next() {
      return posIterator.next().getElement();
    } // return element!

    @Override
    public void remove() {
      posIterator.remove();
    }
  }

  /**
   * Returns an iterator of the elements stored in the tree.
   */
  public Iterator<E> iterator() {
    return new ElementIterator();
  }

}
