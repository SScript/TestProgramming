package MyParser;

public class ParserException extends Exception {

  String errStr; // describes the error

  public ParserException(String str) {
    errStr = str;
  }

  @Override
  public String toString() {
    return errStr;
  }
}
