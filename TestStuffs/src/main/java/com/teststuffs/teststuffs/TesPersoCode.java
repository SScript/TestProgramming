package com.teststuffs.teststuffs;

public class TesPersoCode {

    /* js funkcija
    isValidPersonCode(code) {
    let pkods = code.replace('-', '')
    if (pkods.length === 11) {
        let checkSum = (1101 - (
            parseInt(pkods.charAt(0)) + 6 *
            parseInt(pkods.charAt(1)) + 3 *
            parseInt(pkods.charAt(2)) + 7 *
            parseInt(pkods.charAt(3)) + 9 *
            parseInt(pkods.charAt(4)) + 10 *
            parseInt(pkods.charAt(5)) + 5 *
            parseInt(pkods.charAt(6)) + 8 *
            parseInt(pkods.charAt(7)) + 4 *
            parseInt(pkods.charAt(8)) + 2 *
            parseInt(pkods.charAt(9))
        )) % 11
    return checkSum === parseInt(pkods.charAt(10)) ? true : false;
    } else {
        return false
    }
},
     */
    public static void main(String[] args) throws Exception {

        String persCode = "32664618265";

        System.out.println("Is valid personecode: " + persCode + "->" + isValidPersonCode(persCode));

    }

    public static Boolean isValidPersonCode(String pkods) {
        String sMagicString = "01060307091005080402";
        Integer tmLastPCInt, CheckSum, i, tmCodeInt, tmKeyInt;
        Boolean Result = false;

        CheckSum = 0;
        int tmpNum;
        //ja garums nav 11, tad tas ir nepareizi
        if (pkods.length() ==
                11) {
            //ja pirmais cipars maz?ks vai vien?ds ar 3, tad t? ir priv?tpersona ar parasto personas kodu
            if (Integer.parseInt(pkods.substring(0, 1)) <= 3) {
                //sMagicString = "01060307091005080402";
                // Apr??ina ?eksummu
                tmpNum =
                        (pkods.charAt(0) - 48) * 1 + (pkods.charAt(1) - 48) * 6 + (pkods.charAt(2) - 48) * 3 + (pkods.charAt(3) - 48) * 7 +
                                (pkods.charAt(4) - 48) * 9 + (pkods.charAt(5) - 48) * 10 + (pkods.charAt(6) - 48) * 5 + (pkods.charAt(7) - 48) * 8 +
                                (pkods.charAt(8) - 48) * 4 + (pkods.charAt(9) - 48) * 2;
                tmpNum = 1 - (tmpNum % 11);
                if (tmpNum < -1) {
                    tmpNum = tmpNum + 11;
                }
                // P?rbauda ?eksummu
                if (tmpNum == (pkods.charAt(10) - 48)) {
                    return true;
                }
            } else {
                //sMagicString = "09010408031002050706";
                // Apr??ina ?eksummu
                tmpNum =
                        (pkods.charAt(0) - 48) * 9 + (pkods.charAt(1) - 48) * 1 + (pkods.charAt(2) - 48) * 4 +
                                (pkods.charAt(3) - 48) * 8 + (pkods.charAt(4) - 48) * 3 + (pkods.charAt(5) - 48) * 10 +
                                (pkods.charAt(6) - 48) * 2 + (pkods.charAt(7) - 48) * 5 + (pkods.charAt(8) - 48) * 7 +
                                (pkods.charAt(9) - 48) * 6;
                tmpNum = 3 - (tmpNum % 11);
                if (tmpNum < -1) {
                    tmpNum = tmpNum + 11;
                }
                // P?rbauda ?eksummu
                if (tmpNum == (pkods.charAt(10) - 48)) {
                    return true;
                }
            }
            /*for (i = 0; i < pkods.length() - 1; i++) {
        tmCodeInt = Integer.parseInt(pkods.substring(i, i + 1));
        tmKeyInt = Integer.parseInt(sMagicString.substring(i * 2, i * 2 + 2));
        CheckSum = CheckSum + tmCodeInt * tmKeyInt;
      }
      tmLastPCInt = Integer.parseInt(pkods.substring(10, 11));
      if (tmLastPCInt == 0) {
        tmLastPCInt = 10;
      }
      if (Integer.parseInt(pkods.substring(i, i + 1)) < 3) {
        Result = (((CheckSum - 1) % 11) == (11 - tmLastPCInt));
      } else {
        Result = (((CheckSum - 3) % 11) == (11 - tmLastPCInt));
      }*/
        } else {
            Result = false;
        }

        return Result;
    }

}
