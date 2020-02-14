package chapter02_Object_Oriented_Design;

/**
 * Class for photographs that can be sold.
 */
public class Photograph implements Sellable {

  private String descript; // description of this photo
  private int price; // the price we are setting
  private boolean color; // true if photo is in color

  public Photograph(String desc, int p, boolean c) { // constructor
    descript = desc;
    price = p;
    color = c;
  }

  @Override
  public String description() {
    return descript;
  }

  @Override
  public int listPrice() {
    return price;
  }

  @Override
  public int lowestPrice() {
    return price / 2;
  }

  public boolean isColor() {
    return color;
  }
}
