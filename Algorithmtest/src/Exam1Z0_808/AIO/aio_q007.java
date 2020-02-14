package Exam1Z0_808.AIO;

/**
 * Given: And given the code fragment: What is the result?
 * A. Compilation fails only at line n2
 * B. Compilation fails at both line n1 and line n2
 * C. Compilation fails only at line n1
 * D. Null 0 Auto 4W 150 Manual
 * E. 4W 100 Auto 4W 150 Manual
 * 
 * Answer: B
 */
public class aio_q007 {
  public static void main(String args[]) {
    Car c1 = new Car("Auto");
    Car c2 = new Car("4W", 150, "Manual");
    System.out.println(c1.type + " " + c1.maxSpeed + " " + c1.trans);
    System.out.println(c2.type + " " + c2.maxSpeed + " " + c2.trans);
  }
}

class Vehicle {
  String type = "4W";
  int maxSpeed = 100;

  public Vehicle(String type, int maxSpeed) {
    this.type = type;
    this.maxSpeed = maxSpeed;
  }
}

class Car extends Vehicle {
  String trans;
  
  Car (String trans) {  //line n1
    this.trans = trans;
  }
  
  Car (String type, int maxSpeed, String trans) {
    super(type, maxSpeed);
    this(trans); //line n2
  }
}
