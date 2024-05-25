package asm.java5Nhom6.service;

import org.springframework.beans.factory.annotation.Autowired;

import jakarta.servlet.http.HttpServletRequest;

public class ParamService {
	@Autowired
	HttpServletRequest req;
	
	
	public String getString(String name, String defautValue) {
		String value = req.getParameter(name);
		return (value != null) ? value : defautValue;
	}
	
	
	public int getInt(String name, int defautValue) {
		return 1;
	}
	
	
}
