package asm.java5Nhom6.service;



import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Service;
@Service
public class PasswordHashingService {
	// Phương thức để mã hóa mật khẩu bằng SHA-256
	public String MaHoa(String password) {
		try {
	        MessageDigest digest = MessageDigest.getInstance("SHA-256");
	        byte[] hash = digest.digest(password.getBytes());
	        
	        // Chuyển mảng byte thành chuỗi hex
	        StringBuilder hexString = new StringBuilder();
	        for (byte b : hash) {
	            String hex = Integer.toHexString(0xff & b);
	            if(hex.length() == 1) 
	                hexString.append('0');
	            hexString.append(hex);
	        }
	        String hashedPassword = hexString.toString();
	        // Trả về chuỗi đã mã hóa
	        return hashedPassword;
	    } catch (NoSuchAlgorithmException e) {
	        e.printStackTrace();
	        System.out.println("Không lấy được mật khẩu");
	        System.out.println(password);
	        return null;
	    }
	}



}
