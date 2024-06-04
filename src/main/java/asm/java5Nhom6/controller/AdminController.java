	package asm.java5Nhom6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("/admin/trang-chu")
	public String indexAdmin(Model model) {
		model.addAttribute("view", "index.jsp");
		return "admin/layout";
	}

	@RequestMapping("/admin/chart")
	public String chart(Model model) {
		model.addAttribute("view", "chart.jsp");
		return "admin/layout";
	}
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
