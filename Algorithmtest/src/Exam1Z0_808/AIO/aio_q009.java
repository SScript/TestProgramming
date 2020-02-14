package Exam1Z0_808.AIO;

/**
 * Given the following two classes: How should you write methods in the ElectricAccount class
 * at line n1 so that the member variable bill is always equal to the value of the member
 * variable kwh multiplied by the member variable rate? Any amount of electricity used by a
 * customer (represented by an instance of the customer class) must contribute to the
 * customer’s bill (represented by the member variable bill) through the method useElectricity
 * method. An instance of the customer class should never be able to tamper with or decrease
 * the value of the member variable bill.
 * 
 * A: public void addkWh(double kWh) {
 *      this.kWh += kWh;
 *      this.bill = this.kWh * this.rate;
 *    }
 * B: public void addkWh(double kWh) {
 *      if (kWh > 0) {
 *        this.kWh += kWh;
 *        this.bill = this.kWh * this.rate;
 *      }
 *    }
 * C: private void addkWh(double kWh) {
 *      if (kWh > 0) {
 *        this.kWh += kWh;
 *        this.bill = this.kWh * this.rate;
 *      }
 *    }
  * D: public void addkWh(double kWh) {
 *      if (kWh > 0) {
 *        this.kWh += kWh;
 *        setBill(this.kWh);
 *      }
 *    }
 *    public void setBill(double kWh) {
 *      bill = kWh*rate; 
 *    }
* 
 * Answer: B (pievienojot vaig pārbaudīt vai nav negatīvs)
 */
public class aio_q009 {
  public static void main(String args[]) {
    
  }
}

class Customer {
  ElectricAccount acct = new ElectricAccount();
  
  public void useElectricAccount(double kWh) {
    acct.addkWh(kWh);
  }
}

class ElectricAccount {
  private double kWh;
  private double rate = 0.07;
  private double bill;
  
  //line 1
  public void addkWh(double kWh) {
  
  }
}