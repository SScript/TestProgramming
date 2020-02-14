package chapter05_Recursion;

import java.io.File;

public class RecursDemos {

  /**
   * Returns array containing the pair of Fibonacci numbers, F(n) and F(n−1).
   *
   * @param n
   * @return
   */
  public static long[] fibonacciGood(int n) {
    if (n <= 1) {
      long[] answer = {n, 0};
      return answer;
    } else {
      long[] temp = fibonacciGood(n - 1); // returns {Fn−1, Fn−2} 
      long[] answer = {temp[0] + temp[1], temp[0]}; // we want {Fn, Fn−1} 
      return answer;
    }
  }

  /**
   * Returns the nth Fibonacci number (inefficiently).
   *
   * @param n
   * @return
   */
  public static long fibonacciBad(int n) {
    if (n <= 1) {
      return n;
    } else {
      return fibonacciBad(n - 2) + fibonacciBad(n - 1);
    }
  }

  /**
   * Returns the sum of subarray data[low] through data[high] inclusive.
   *
   * @param data
   * @param low
   * @param high
   * @return
   */
  public static int binarySum(int[] data, int low, int high) {
    if (low > high) // zero elements in subarray
    {
      return 0;
    } else if (low == high) // one element in subarray
    {
      return data[low];
    } else {
      int mid = (low + high) / 2;
      return binarySum(data, low, mid) + binarySum(data, mid + 1, high);
    }
  }

  /**
   * Computes the value of x raised to the nth power, for nonnegative integer n.
   */
  public static double power(double x, int n) {
    if (n == 0) {
      return 1;
    } else {
      return x * power(x, n - 1);
    }
  }

  /**
   * Computes the value of x raised to the nth power, for nonnegative integer n.
   * šis ir ātrāks varinants par iepriekšējo versiju, kur vienkārši rekursija
   *
   * @param x
   * @param n
   * @return
   */
  public static double power1(double x, int n) {
    if (n == 0) {
      return 1;
    } else {
      double partial = power(x, n / 2); // rely on truncated division of n
      double result = partial * partial;
      if (n % 2 == 1) // if n odd, include extra factor of x
      {
        result *= x;
      }
      return result;
    }
  }

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
   * Returns true if there are no duplicate values from data[low] through
   * data[high].
   *
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
   * Returns the sum of the first n integers of the given array.
   *
   * @param data
   * @param n
   * @return
   */
  public static int linearSum(int[] data, int n) {
    if (n == 0) {
      return 0;
    } else {
      return linearSum(data, n - 1) + data[n - 1];
    }
  }

  public static int factorial(int n) throws IllegalArgumentException {
    if (n < 0) {
      throw new IllegalArgumentException(); // argument must be nonnegative
    } else if (n == 0) {
      return 1; // base case
    } else {
      return n * factorial(n - 1); // recursive case
    }
  }

  /**
   * Returns true if the target value is found in the data array.
   *
   * @param data
   * @param target
   * @return
   */
  public static boolean binarySearch(int[] data, int target) {
    return binarySearch(data, target, 0, data.length - 1); // use parameterized version
  }

  /**
   * Returns true if the target value is found in the indicated portion of the
   * data array. This search only considers the array portion from data[low] to
   * data[high] inclusive.
   */
  public static boolean binarySearch(int[] data, int target, int low, int high) {
    if (low > high) {
      return false; // interval empty; no match
    } else {
      int mid = (low + high) / 2;
      if (target == data[mid]) {
        return true; // found a match
      } else if (target < data[mid]) {
        return binarySearch(data, target, low, mid - 1); // recur left of the middle
      } else {
        return binarySearch(data, target, mid + 1, high); // recur right of the middle
      }
    }
  }

  /**
   * Returns true if the target value is found in the data array. A nonrecursive
   * implementation of binary search.
   *
   * @param data
   * @param target
   * @return
   */
  public static boolean binarySearchIterative(int[] data, int target) {
    int low = 0;
    int high = data.length - 1;
    while (low <= high) {
      int mid = (low + high) / 2;
      if (target == data[mid]) // found a match
      {
        return true;
      } else if (target < data[mid]) {
        high = mid - 1; // only consider values left of mid
      } else {
        low = mid + 1; // only consider values right of mid
      }
    }
    return false; // loop ended without success
  }

  /**
   * Calculates the total disk usage (in bytes) of the portion of the file
   * system rooted at the given path, while printing a summary akin to the
   * standard 'du' Unix tool.
   */
  public static long diskUsage(File root) {
    long total = root.length(); // start with direct disk usage
    if (root.isDirectory()) { // and if this is a directory,
      for (String childname : root.list()) { // then for each child
        File child = new File(root, childname); // compose full path to child
        total += diskUsage(child); // add child’s usage to total
      }
    }
    System.out.println(total + "\t" + root); // descriptive output
    return total; // return the grand total
  }

}
