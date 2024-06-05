
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

}
