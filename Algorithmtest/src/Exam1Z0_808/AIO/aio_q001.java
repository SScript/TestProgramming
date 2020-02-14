package Exam1Z0_808.AIO;

/**
 * Given: What is the result?
 * A. 400.0 : 200.0
 * B. 400.0 : 100.0
 * C. Compilation fails.
 * D. 200.0 : 100.0
 * 
 * Answer: B
 */
public class aio_q001 {
  
  public void updatePrice(Product product, double price) {
    price = price * 2;
    product.price = product.price + price;
  }
  
  public static void main(String args[]) {
    Product prt = new Product();
    prt.price = 200;
    double newPrice = 100;
    
    aio_q001 t = new aio_q001();
    t.updatePrice(prt, newPrice);
    System.out.println(prt.price + " : " + newPrice);
  }
}

class Product {
  double price;
}