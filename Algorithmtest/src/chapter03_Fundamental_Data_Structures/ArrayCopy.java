package chapter03_Fundamental_Data_Structures;

public class ArrayCopy {

  /**
   * Taisa kopiju divdimensiju masīvam
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

}
