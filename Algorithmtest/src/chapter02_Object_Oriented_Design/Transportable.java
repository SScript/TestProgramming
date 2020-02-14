package chapter02_Object_Oriented_Design;

/**
 * Interface for objects that can be transported.
 */
public interface Transportable {

  /**
   * Returns the weight in grams.
   * @return 
   */
  public int weight();

  /**
   * Returns whether the object is hazardous.
   * @return 
   */
  public boolean isHazardous();
}