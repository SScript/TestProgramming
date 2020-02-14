package SimpleTests;

import java.io.IOException;
import java.math.BigDecimal;

public class CalcDirNames {
  
  public static void main(String[] args) throws IOException {
    BigDecimal eaFileId = new BigDecimal(3701158);
    BigDecimal MAX_FOLDER_SIZE = new BigDecimal(1000);
    
    int folderNum = eaFileId.divide(MAX_FOLDER_SIZE.multiply(MAX_FOLDER_SIZE), BigDecimal.ROUND_DOWN).intValue();
    int subFolderNum = eaFileId.divide(MAX_FOLDER_SIZE, BigDecimal.ROUND_DOWN).remainder(MAX_FOLDER_SIZE).intValue();
    
    System.out.println(folderNum + "\\" + subFolderNum);
    
    //System.in.read();
  }
  
}
