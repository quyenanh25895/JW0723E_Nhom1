/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MaHoa;

import java.security.MessageDigest;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author quyen
 */
public class GiaiMa {

    public static String fromSHA1(String hashedString) {
        // Salt để giải mã
        String salt = "asjrlkmcoewj@tjle;oxqskjhdjksjf1jurVn";
        String result = null;

        try {
            // Giải mã chuỗi Base64
            byte[] decodedBytes = Base64.decodeBase64(hashedString);
            // Lấy lại chuỗi ban đầu đã mã hóa
            String decodedString = new String(decodedBytes);

            // Lấy lại chuỗi ban đầu trước khi thêm salt
            String originalString = decodedString.substring(0, decodedString.length() - salt.length());

            // Tính toán lại giá trị SHA-1 từ chuỗi ban đầu
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            byte[] hashBytes = md.digest(originalString.getBytes("UTF-8"));

            // Chuyển đổi kết quả thành chuỗi hex
            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }

            // Kết quả giải mã
            result = sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
