package chapter02_Object_Oriented_Design;

/**
 * Interface for objects that can be sold.
 */
public interface Sellable {

  /**
   * Returns a description of the object.
   * @return 
   */
  public String description();

  /**
   * Returns the list price in cents.
   * @return 
   */
  public int listPrice();

  /**
   * Returns the lowest price in cents we will accept.
   * @return 
   */
  public int lowestPrice();
}
