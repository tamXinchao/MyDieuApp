package asm.java5Nhom6.service;



import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import lombok.val;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest req;
	@Autowired
	ServletContext context;
	String value;

	/**
	 * Đọc chuỗi giá trị của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */

	public String getString(String name, String defaultValue) {
		value = req.getParameter(name);
		return (value != null) ? value : defaultValue;
	}

	/**
	 * Đọc số nguyên giá trị của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public int getInt(String name, int defaultValue) {
		value = req.getParameter(name);
//		return (value != null) ? Integer.parseInt(value) : defaultValue;
		if (value != null) {
			try {
				return Integer.parseInt(value);
			} catch (NumberFormatException e) {
				e.getMessage();
			}
		}
		return defaultValue;
	}

	/**
	 * Đọc số thực giá trị của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public double getDouble(String name, double defaultValue) {
		value = req.getParameter(name);
//		return (value != null) ? Double.parseDouble(value) : defaultValue;
		if (value != null) {
			try {
				return Double.parseDouble(value);
			} catch (NumberFormatException e) {
				e.getMessage();
			}
		}
		return defaultValue;
	}

	/**
	 * Đọc giá trị boolean của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public boolean getBoolean(String name, boolean defaultValue) {
		value = req.getParameter(name);
		return (value != null) ? Boolean.parseBoolean(value) : defaultValue;
	}

	/**
	 * Đọc giá trị thời gian của tham số
	 * 
	 * @param name    tên tham số
	 * @param pattern là định dạng thời gian
	 * @return giá trị tham sô hoặc null nếu không tồn tại
	 * @throws RuntimeException lỗi định dạng
	 */
	public Date getDate(String name, String pattern) {
		value = req.getParameter(name);
		if (value != null) {
			try {
				SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
				return dateFormat.parse(value);
			} catch (ParseException e) {
				throw new RuntimeException("Lỗi định dạng : " + e.getMessage());
			}
		}
		return null;
	}

	/**
	 * 
	 * @param file chứa file upload từ client
	 * @param path đường dẫn tính từ webroot
	 * @return đối tượng chứa file đã lưu hoặc null nếu không có file upload
	 * @throws RuntimeException lỗi lưu file
	 */
	public File save(MultipartFile file, String path) {
		if (file.isEmpty()) {
			return null;
		}
		try {
			// Lấy đường dẫn tuyệt đối tới thư mục lưu trữ file
			String realPath = context.getRealPath(path);
			// Tạo đối tượng File từ đường dẫn và tên file gốc
			File saveFile = new File(realPath, file.getOriginalFilename());
			// Tạo thư mục nếu chưa tồn tại
			if (!saveFile.getParentFile().exists()) {
				saveFile.getParentFile().mkdirs();
			}
			// Lưu file
			file.transferTo(saveFile);
			return saveFile;
		} catch (Exception e) {
			throw new RuntimeException("Lỗi lưu file: " + e.getMessage(), e);
		}
	}
}
