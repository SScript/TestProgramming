
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ThreadTest01 {

  public static void main(String[] args) throws Exception {
    //System.out.println(new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").format(new Date(13659026L)));
    ExecutorService executor = Executors.newFixedThreadPool(2);
    executor.execute(new run1());
    executor.execute(new run2());
    executor.shutdown();
    System.out.println("All threads started!");
    while (!executor.isTerminated()) {}
    System.out.println("Finished all threads");
  }
  
}