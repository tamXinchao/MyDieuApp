package asm.java5Nhom6.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest req;

	
	//Đọc giá trị chuỗi của một tham số từ yêu cầu HTTP. 
	public String getString(String name, String defaultValue) { //name là tên của tham số
		String value = req.getParameter(name);
		return (value != null) ? value : defaultValue; // nếu tham số name không tồn tại thì trả về giá trị mặc định
	}

	
	//Đọc giá trị số nguyên của một tham số từ yêu cầu HTTP.
	public int getInt(String name, int defaultValue) {
		String value = req.getParameter(name);

		try {
			return (value != null) ? Integer.valueOf(name) : defaultValue;
		} catch (Exception e) {
			return defaultValue;
		}
	}

	//Đọc giá trị số thưc của một tham số từ yêu cầu HTTP.
	public double getDouble(String name, double defaultValue) {
		String value = req.getParameter(name);

		try {
			return (value != null) ? Double.valueOf(name) : defaultValue;
		} catch (Exception e) {
			return defaultValue;
		}
	}

	//Đọc giá trị Boolean của một tham số từ yêu cầu HTTP.
	public boolean getBoolean(String name, boolean defaultValue) {
		String value = req.getParameter(name);

		try {
			return (value != null) ? Boolean.valueOf(name) : defaultValue;
		} catch (Exception e) {
			return defaultValue;
		}
	}

	// Đọc giá trị thời gian của một tham số yêu cầu từ phía client HTTP
	public Date getDate(String name, String pattern) {
		String value = req.getParameter(name);
		if (value != null) {
			try {
				SimpleDateFormat sdf = new SimpleDateFormat(pattern);
				return sdf.parse(value);
			} catch (Exception e) {
				throw new RuntimeException("Không thể format ngày");
			}

		}
		return null;
	}

	// Lưu tệp tải về từ phía client vào một thư mục trên máy chủ
	public File save(MultipartFile file, String path) {
		if (file == null || file.isEmpty()) {
			return null;
		}
		File dest = new File(path);// Tạo một đối tượng File mới đại diện cho đường dẫn nơi tệp sẽ được lưu trữ
									// trên máy chủ. Đường dẫn này được truyền vào phương thức dưới dạng tham số
									// path.
		try {
			file.transferTo(dest); // Sử dụng phương thức transferTo của MultipartFile để chuyển tệp tải lên vào vị
									// trí đích được chỉ định bởi đối tượng File dest.
			return dest;
		} catch (Exception e) {
			throw new RuntimeException("File không thể lưu", e);
		}
	}

}
