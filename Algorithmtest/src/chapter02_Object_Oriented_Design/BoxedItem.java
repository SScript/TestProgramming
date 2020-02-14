package chapter02_Object_Oriented_Design;

/**
 * Class for objects that can be sold, packed, and shipped.
 */
public class BoxedItem implements Sellable, Transportable {

  private String descript; // description of this item
  private int price; // list price in cents
  private int weight; // weight in grams
  private boolean haz; // true if object is hazardous
  private int height = 0; // box height in centimeters
  private int width = 0; // box width in centimeters
  private int depth = 0; // box depth in centimeters

  /**
   * Constructor
   * @param desc
   * @param p
   * @param w
   * @param h
   */
  public BoxedItem(String desc, int p, int w, boolean h) {
    descript = desc;
    price = p;
    weight = w;
    haz = h;
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

  @Override
  public int weight() {
    return weight;
  }

  @Override
  public boolean isHazardous() {
    return haz;
  }

  public int insuredValue() {
    return price * 2;
  }

  public void setBox(int h, int w, int d) {
    height = h;
    width = w;
    depth = d;
  }
}
