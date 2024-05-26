package asm.java5Nhom6.HomeController;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import asm.java5Nhom6.Entity.Product;
import asm.java5Nhom6.Entity.Product_Image;
import asm.java5Nhom6.dao.ProductDAO;
import asm.java5Nhom6.dao.Product_ImageDAO;

@Controller
public class test {
	@Autowired
	Product_ImageDAO dao;
	@Autowired
	Product_Image p;

	@GetMapping("/test")
	public String test(Model model) {
		List<Product_Image> products = dao.findAll();

		model.addAttribute("products", products);
		return "test";
	}

}
