package MyParser;

import java.io.*;

public class PDemo {

  public static void main(String args[])
          throws IOException {
    String expr;
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    Parser p = new Parser();
    System.out.println("Enter an empty expression to stop.");
    for (;;) {
      System.out.print("Enter expression: ");
      expr = br.readLine();
      if (expr.equals("")) {
        break;
      }
      try {
        System.out.println("Result: " + p.evaluate(expr));
        System.out.println();
      } catch (ParserException exc) {
        System.out.println(exc);
      }
    }
  }
}