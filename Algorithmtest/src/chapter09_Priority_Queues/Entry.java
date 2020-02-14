/**
 * Chapter 9: Priority Queue
 */
package chapter09_Priority_Queues;

/**
 * Interface for a key-value pair.
 */
public interface Entry<K, V> {

  K getKey(); // returns the key stored in this entry

  V getValue(); // returns the value stored in this entry
}