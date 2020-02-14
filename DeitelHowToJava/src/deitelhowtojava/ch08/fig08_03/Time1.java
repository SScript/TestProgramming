package deitelhowtojava.ch08.fig08_03;

// Fig. 8.1: Time1.java
// Time1 class declaration maintains the time in 24-hour format.

public class Time1  
{
   private int hour; // 0 - 23
   private int minute; // 0 - 59
   private int second; // 0 - 59

   // set a new time value using universal time; throw an 
   // exception if the hour, minute or second is invalid
   public void setTime(int h, int m, int s)
   {
      // validate hour, minute and second
      if ((h >= 0 && h < 24) && (m >= 0 && m < 60) && 
         (s >= 0 && s < 60)) 
      {
         hour = h;
         minute = m;
         second = s;
      } 
      else
         throw new IllegalArgumentException(
            "hour, minute and/or second was out of range");
   } 

   // convert to String in universal-time format (HH:MM:SS)
   public String toUniversalString()
   {
      return String.format("%02d:%02d:%02d", hour, minute, second);
   } 

   // convert to String in standard-time format (H:MM:SS AM or PM)
	 @Override
   public String toString()
   {
      return String.format("%d:%02d:%02d %s", 
         ((hour == 0 || hour == 12) ? 12 : hour % 12),
         minute, second, (hour < 12 ? "AM" : "PM"));
   } 
} // end class Time1

/**************************************************************************
 * (C) Copyright 1992-2014 by Deitel & Associates, Inc. and               *
 * Pearson Education, Inc. All Rights Reserved.                           *
 *                                                                        *
 * DISCLAIMER: The authors and publisher of this book have used their     *
 * best efforts in preparing the book. These efforts include the          *
 * development, research, and testing of the theories and programs        *
 * to determine their effectiveness. The authors and publisher make       *
 * no warranty of any kind, expressed or implied, with regard to these    *
 * programs or to the documentation contained in these books. The authors *
 * and publisher shall not be liable in any event for incidental or       *
 * consequential damages in connection with, or arising out of, the       *
 * furnishing, performance, or use of these programs.                     *
 *************************************************************************/