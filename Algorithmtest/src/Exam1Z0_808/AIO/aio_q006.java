package Exam1Z0_808.AIO;

/**
 * Given the code fragment: 
 * Which two modifications, made independently, enable the code to compile?
 * A. Make the method at line n1 public.
 * B. Make the method at line n2 public.
 * C. Make the method at line n3 public.
 * D. Make the method at line n3 protected.
 * E. Make the method at line n4 public.
 * 
 * Answer: C, D
 */
public class aio_q006 {
}

abstract class Planet {
  protected void revolve() { //Line n1
  }
  abstract void rotate();    //Line n2
}

class Earth extends Planet {
  @Override
  void revolve() {           //Line n3
  }
  
  @Override
  protected void rotate() {  //Line n4
  }
}
