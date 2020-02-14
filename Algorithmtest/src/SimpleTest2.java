
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class SimpleTest2 {

  public static void main(String[] args) throws Exception {
    //int g=3;
    //int d=3;
    //System.out.println(++g);
    //System.out.println(d);
    //System.out.println(++g*8);
    
          //initial array
        List<String> oldArray = new ArrayList<String>();
        oldArray.add("1");
        oldArray.add("2");
        oldArray.add("3");

        List<String> newArray = new ArrayList<String>();
        newArray.add("1");
        newArray.add("2");
        newArray.add("3");        
        newArray.clear();
        
        //copy values
        for(int i = 0; i < oldArray.size(); i++)
            newArray.add(oldArray.get(i));
        
        
        newArray.remove(1);

        System.out.println();
        for(int i = 0; i < newArray.size(); i++) {
          System.out.print(newArray.get(i) + " ");
        }
        
        System.out.println();
        for(int i = 0; i < oldArray.size(); i++) {
          System.out.print(oldArray.get(i) + " ");
        }


  }
  
}