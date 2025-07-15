
package util;

import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;

public class Validate {
    public static String doubleToMoney(double num) {
        String result = null;
        try {
            NumberFormat numberFormat = NumberFormat.getInstance(new Locale("vi", "VN"));
            result = numberFormat.format(num);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static double moneyToDouble(String money) {
        double result = 0;
        try {
            NumberFormat numberFormat = NumberFormat.getInstance(new Locale("vi", "VN"));
            result = numberFormat.parse(money).doubleValue();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static void main(String[] args) {
        String result = Validate.doubleToMoney(190000);
        System.out.println("Formatted Number: " + result);
    }
}
