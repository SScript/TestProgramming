package com.ReadWriteExcel;

import org.apache.commons.io.FileUtils;
import org.apache.poi.ss.usermodel.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class ReadExcelEShop {
    public static void main(String[] args) throws Exception {

        FileInputStream file = null;
        int rownum = 0;
        StringBuilder sb = new StringBuilder();
        String val = "";

        try {
            sb.append("declare\n");
            sb.append("    next_id INTEGER;\n");
            sb.append("    eshop_id INTEGER;\n");
            sb.append("    eshop_name VARCHAR2(250);\n");
            sb.append("begin\n");
            sb.append("    select rid, rname into eshop_id, eshop_name from soa_cfg_owner.order_status_recipient WHERE rstatus = 0 and rname = 'EShop' and ROWNUM = 1;\n");
            sb.append("\n");

            file = new FileInputStream(new File("C:/tmp/15052021_09_31_import-2.xlsx"));

            Workbook workbook = WorkbookFactory.create(file);
            Sheet sheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = sheet.iterator();
            String ordernr = "";
            String orderid = "";
            String status = "";
            String substatus = "";
            Row row = null;
            while (rowIterator.hasNext()) {
                row = rowIterator.next();

                if (rownum == 0) {rownum++; continue;}

                System.out.println("Process row: " + (rownum + 1));

                Iterator<Cell> cellIterator = row.cellIterator();
                int index = 0;
                while (cellIterator.hasNext()) {
                    Cell cell = cellIterator.next();
                    CellType ct = cell.getCellType();
                    index = cell.getColumnIndex();

                    System.out.print("CellNum: " + index + " | CellType: " + (ct) + " | ");
                    if (ct == CellType.NUMERIC && index == 0) {
                        ordernr = "00" + String.valueOf((int) cell.getNumericCellValue());
                    }
                    if (ct == CellType.STRING) {
                        if (index == 0) {
                            ordernr = "00" + cell.getStringCellValue();
                        }
                        if (index == 1) {
                            orderid = cell.getStringCellValue();
                        }
                        if (index == 2) {
                            status = cell.getStringCellValue();
                        }
                        if (index == 3) {
                            substatus = cell.getStringCellValue();
                        }
                    }
                }
                sb.append("    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;\n");
                sb.append("    Insert into ");
                sb.append("SOA_CFG_OWNER.ORDER_STATUS_QUE ");
                sb.append("(QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) \n");
                sb.append("    values ");
                val = "(next_id, '" + ordernr + "', '" + orderid + "', '" + status + "', '" + substatus + "', sysdate);";
                sb.append(val);
                sb.append("\n");
                sb.append("    Insert into\n");
                sb.append("    SOA_CFG_OWNER.ORDER_STATUS_PROCESS\n");
                sb.append("        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)\n");
                sb.append("    values\n");
                sb.append("        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);\n");

                sb.append("\n");
                sb.append("\n");
                System.out.println();
                rownum++;
            }

            sb.append("    commit;\n");
            sb.append("end;");

            FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/ReadWriteExcel/insertEshopData17052021.sql"), sb.toString(), Charset.forName("UTF-8"));

        } catch (Exception e) {
            file.close();
        }
    }
}
