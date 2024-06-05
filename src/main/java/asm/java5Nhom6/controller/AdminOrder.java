package asm.java5Nhom6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminOrder {
	@RequestMapping("/admin/form-admin-checkout")
	public String checkout(Model model) {
		model.addAttribute("view", "admin-product-checkout.jsp");
		return "admin/layout";
	}

	@RequestMapping("/admin/form-admin-order-detail")
	public String orderDetail(Model model) {
		model.addAttribute("view", "admin-order-detail.jsp");
		return "admin/layout";
	}
}
