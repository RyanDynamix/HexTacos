package controller.payment;

import org.json.JSONObject;
import org.apache.commons.codec.digest.HmacUtils;

import java.util.*;

public class PayOS_Helper {
    // Nên để checksumKey là static final, có thể lấy từ config
    private static final String CHECKSUM_KEY = "19b666f45f76c52de569091f1caf967820ed20f8668ec7aec492a02afb036980";

    /**
     * Kiểm tra dữ liệu với signature: sort key, nối chuỗi, hash HMAC SHA256
     * @param jsonStr
     * @param signature
     * @return 
     */
    public static boolean isValidSignature(String jsonStr, String signature) {
        try {
            JSONObject jsonObject = new JSONObject(jsonStr);
            Iterator<String> sortedIt = sortedIterator(jsonObject.keys(), Comparator.naturalOrder());
            StringBuilder transactionStr = new StringBuilder();
            while (sortedIt.hasNext()) {
                String key = sortedIt.next();
                String value = jsonObject.get(key).toString();
                transactionStr.append(key).append("=").append(value);
                if (sortedIt.hasNext()) {
                    transactionStr.append("&");
                }
            }
            String calculatedSig = new HmacUtils("HmacSHA256", CHECKSUM_KEY).hmacHex(transactionStr.toString());
            return calculatedSig.equals(signature);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Có thể dùng lại hàm sort key này cho các chỗ khác
    private static Iterator<String> sortedIterator(Iterator<?> it, Comparator<String> comparator) {
        List<String> list = new ArrayList<>();
        while (it.hasNext()) {
            list.add((String) it.next());
        }
        list.sort(comparator);
        return list.iterator();
    }
}
