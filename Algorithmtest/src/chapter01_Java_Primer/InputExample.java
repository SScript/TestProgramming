package chapter01_Java_Primer;

import java.util.Scanner;

public class InputExample {

  public static void main(String[] args) {
    double age;
    double rate;
    double fb;
    Scanner input = new Scanner(System.in);
    System.out.print("Enter your age in years: ");
    age = input.nextDouble();
    System.out.print("Enter your maximum heart rate: ");
    rate = input.nextDouble();
    fb = (rate - age)*0.65;
    System.out.println("Your ideal fat-burning heart rate is " + fb);
  }
  
}
