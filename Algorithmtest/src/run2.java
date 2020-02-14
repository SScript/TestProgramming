
import java.util.logging.Level;
import java.util.logging.Logger;

public class run2 implements Runnable {
  
    @Override
    public void run() {
      try {
        //Thread.sleep(1000);
        System.out.println("Thread 2 start");
        Thread.sleep(10000);
        System.out.println("Thread 2 stop");
      } catch (InterruptedException ex) {
        Logger.getLogger(ThreadTest01.class.getName()).log(Level.SEVERE, null, ex);
      }
    }
    
}
