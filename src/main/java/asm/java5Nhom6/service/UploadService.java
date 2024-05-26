package asm.java5Nhom6.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

public class UploadService {
	@Autowired
	ServletContext app;
	
	public File save(MultipartFile file, String folder) {
		File dir= new File(app.getRealPath(folder));
		if(!dir.exists()) {
			dir.mkdir();
		}
		try {
			File saveFile = new File(dir,file.getOriginalFilename());
			file.transferTo(saveFile);
			return saveFile;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
