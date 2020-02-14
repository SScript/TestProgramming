
import java.util.logging.Level;
import java.util.logging.Logger;

public class run1 implements Runnable {

  @Override
  public void run() {
    try {
      Thread.sleep(5000);
      System.out.println("Thread 1 start");
      Thread.sleep(3000);
      System.out.println("Thread 1 stop");
    } catch (InterruptedException ex) {
      Logger.getLogger(ThreadTest01.class.getName()).log(Level.SEVERE, null, ex);
    }
  }
}
