package asm.java5Nhom6.HomeController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class homePage {
	@RequestMapping("/trang-chu")
	public String trangChu(Model model) {
		model.addAttribute("view", "index.jsp");
		return "index";
	}


	@RequestMapping("/gio-hang")
	public String Cart(Model model) {
		model.addAttribute("view", "cart.jsp");
		return "layout";
	}

	@RequestMapping("/shop")
	public String Shop(Model model) {
		model.addAttribute("view", "shop.jsp");
		return "layout";
	}

	@RequestMapping("/detail")
	public String Deatail(Model model) {
		model.addAttribute("view", "detail.jsp");
		return "layout";
	}

}
