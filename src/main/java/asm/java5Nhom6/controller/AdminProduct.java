package asm.java5Nhom6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminProduct {
	@RequestMapping("/admin/tableEditProduct")
	public String table(Model model) {
		model.addAttribute("view", "tableEditProduct.jsp");
		return "admin/layout";
	}

	@RequestMapping("/admin/form-add-product")
	public String addProduct(Model model) {
		model.addAttribute("view", "form-add-product.jsp");
		return "admin/layout";
	}
	
	
}
