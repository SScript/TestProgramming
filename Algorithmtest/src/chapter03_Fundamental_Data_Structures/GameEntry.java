/*
 * Chapter 3: Fundametal Data Structures - Using Arrays
 */
package chapter03_Fundamental_Data_Structures;

public class GameEntry {

  private String name; // name of the person earning this score
  private int score; // the score value

  /**
   * Constructs a game entry with given parameters..
   * @param n
   * @param s
   */
  public GameEntry(String n, int s) {
    name = n;
    score = s;
  }

  /**
   * Returns the name field.
   * @return 
   */
  public String getName() {
    return name;
  }

  /**
   * Returns the score field.
   * @return 
   */
  public int getScore() {
    return score;
  }

  /**
   * Returns a string representation of this entry.
   * @return 
   */
  @Override
  public String toString() {
    return "(" + name + ", " + score + ")";
  }
}
