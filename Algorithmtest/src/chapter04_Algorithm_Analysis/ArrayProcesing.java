package chapter04_Algorithm_Analysis;

import java.util.Arrays;

public class ArrayProcesing {

  /**
   * Reverses the contents of subarray data[low] through data[high] inclusive.
   *
   * @param data
   * @param low
   * @param high
   */
  public static void reverseArray(int[] data, int low, int high) {
    if (low < high) { // if at least two elements in subarray
      int temp = data[low]; // swap data[low] and data[high]
      data[low] = data[high];
      data[high] = temp;
      reverseArray(data, low + 1, high - 1); // recur on the rest
    }
  }

  /**
   * Reverses the contents of the given array.
   * Reversing the elements of a sequence using iteration
   * @param data
   */
  public static void reverseIterative(int[] data) {
    int low = 0, high = data.length - 1;
    while (low < high) { // swap data[low] and data[high]
      int temp = data[low];
      data[low++] = data[high]; // post-increment of low
      data[high--] = temp; // post-decrement of high
    }
  }

  /**
   * Taisa kopiju divdimensiju masīvam
   *
   * @param original
   * @return
   */
  public static int[][] deepClone(int[][] original) {
    int[][] backup = new int[original.length][]; // create top-level array of arrays
    for (int k = 0; k < original.length; k++) {
      backup[k] = original[k].clone(); // copy row k
    }
    return backup;
  }

  /**
   * Returns the maximum value of a nonempty array of numbers.
   */
  public static double arrayMax(double[] data) {
    int n = data.length;
    double currentMax = data[0]; // assume first entry is biggest (for now)
    for (int j = 1; j < n; j++) // consider all other entries
    {
      if (data[j] > currentMax) // if data[j] is biggest thus far...
      {
        currentMax = data[j]; // record it as the current max
      }
    }
    return currentMax;
  }

  /**
   * Returns true if there is no element common to all three arrays.
   */
  public static boolean disjoint1(int[] groupA, int[] groupB, int[] groupC) {
    for (int a : groupA) {
      for (int b : groupB) {
        for (int c : groupC) {
          if ((a == b) && (b == c)) {
            return false; // we found a common value
          }
        }
      }
    }
    return true; // if we reach this, sets are disjoint
  }

  /**
   * Returns true if there is no element common to all three arrays.
   */
  public static boolean disjoint2(int[] groupA, int[] groupB, int[] groupC) {
    for (int a : groupA) {
      for (int b : groupB) {
        if (a == b) // only check C when we find match from A and B
        {
          for (int c : groupC) {
            if (a == c) // and thus b == c as well
            {
              return false; // we found a common value
            }
          }
        }
      }
    }
    return true; // if we reach this, sets are disjoint
  }

  /**
   * Returns true if there are no duplicate elements in the array.
   */
  public static boolean unique1(int[] data) {
    int n = data.length;
    for (int j = 0; j < n - 1; j++) {
      for (int k = j + 1; k < n; k++) {
        if (data[j] == data[k]) {
          return false; // found duplicate pair
        }
      }
    }
    return true; // if we reach this, elements are unique
  }

  /**
   * Returns true if there are no duplicate elements in the array.
   */
  public static boolean unique2(int[] data) {
    int n = data.length;
    int[] temp = Arrays.copyOf(data, n); // make copy of data
    Arrays.sort(temp); // and sort the copy
    for (int j = 0; j < n - 1; j++) {
      if (temp[j] == temp[j + 1]) // check neighboring entries
      {
        return false; // found duplicate pair
      }
    }
    return true; // if we reach this, elements are unique
  }

  /**
   * Returns true if there are no duplicate values from data[low] through data[high].
   * @param data
   * @param low
   * @param high
   * @return 
   */
  public static boolean unique3(int[] data, int low, int high) {
    if (low >= high) {
      return true; // at most one item
    } else if (!unique3(data, low, high - 1)) {
      return false; // duplicate in first n−1
    } else if (!unique3(data, low + 1, high)) {
      return false; // duplicate in last n−1
    } else {
      return (data[low] != data[high]); // do first and last differ?
    }
  }

  /**
   * Returns an array a such that, for all j, a[j] equals the average of x[0],
   * ..., x[j].
   */
  public static double[] prefixAverage1(double[] x) {
    int n = x.length;
    double[] a = new double[n]; // filled with zeros by default
    for (int j = 0; j < n; j++) {
      double total = 0; // begin computing x[0] + ... + x[j]
      for (int i = 0; i <= j; i++) {
        total += x[i];
      }
      a[j] = total / (j + 1); // record the average
    }
    return a;
  }

  /**
   * Returns an array a such that, for all j, a[j] equals the average of x[0],
   * ..., x[j].
   */
  public static double[] prefixAverage2(double[] x) {
    int n = x.length;
    double[] a = new double[n]; // filled with zeros by default
    double total = 0; // compute prefix sum as x[0] + x[1] + ...
    for (int j = 0; j < n; j++) {
      total += x[j]; // update prefix sum to include x[j]
      a[j] = total / (j + 1); // compute average based on current sum
    }
    return a;
  }

  /**
   * Returns index j such that data[j] == val, or −1 if no such element.
   */
  public static int arrayFind(int[] data, int val) {
    int n = data.length;
    int j = 0;
    while (j < n) { // val is not equal to any of the first j elements of data
      if (data[j] == val) {
        return j; // a match was found at index j
      }
      j++; // continue to next index
      // val is not equal to any of the first j elements of data
    }
    return -1; // if we reach this, no match found
  }

  /**
   * Returns the sum of the integers in given array.
   */
  public static int example1(int[] arr) {
    int n = arr.length, total = 0;
    for (int j = 0; j < n; j++) // loop from 0 to n-1
    {
      total += arr[j];
    }
    return total;
  }

  /**
   * Returns the sum of the integers with even index in given array.
   */
  public static int example2(int[] arr) {
    int n = arr.length, total = 0;
    for (int j = 0; j < n; j += 2) // note the increment of 2
    {
      total += arr[j];
    }
    return total;
  }

  /**
   * Returns the sum of the prefix sums of given array.
   */
  public static int example3(int[] arr) {
    int n = arr.length, total = 0;
    for (int j = 0; j < n; j++) // loop from 0 to n-1
    {
      for (int k = 0; k <= j; k++) // loop from 0 to j
      {
        total += arr[j];
      }
    }
    return total;
  }

  /**
   * Returns the sum of the prefix sums of given array.
   */
  public static int example4(int[] arr) {
    int n = arr.length, prefix = 0, total = 0;
    for (int j = 0; j < n; j++) { // loop from 0 to n-1
      prefix += arr[j];
      total += prefix;
    }
    return total;
  }

  /**
   * Returns the number of times second array stores sum of prefix sums from
   * first.
   */
  public static int example5(int[] first, int[] second) { // assume equal-length arrays
    int n = first.length, count = 0;
    for (int i = 0; i < n; i++) { // loop from 0 to n-1
      int total = 0;
      for (int j = 0; j < n; j++) // loop from 0 to n-1
      {
        for (int k = 0; k <= j; k++) // loop from 0 to j
        {
          total += first[k];
        }
      }
      if (second[i] == total) {
        count++;
      }
    }
    return count;
  }

}
