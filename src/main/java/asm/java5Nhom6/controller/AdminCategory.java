package asm.java5Nhom6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCategory {
	@RequestMapping("/admin/edit-category")
	public String editCategory(Model model) {
		model.addAttribute("view", "admin-category.jsp");
		return "admin/layout";
	}
}
