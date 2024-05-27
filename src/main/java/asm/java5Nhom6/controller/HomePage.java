package asm.java5Nhom6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import asm.java5Nhom6.entity.Cart;
import asm.java5Nhom6.DAO.CartDAO;

@Controller
public class HomePage {
	@RequestMapping("/trang-chu")
	public String trangChu(Model model) {
		model.addAttribute("view", "index.jsp");
		
		
		
		
		
		
		
		return "index";
	}

	@GetMapping("/register")
	public String Register() {
		return "account/register";
	}

	@GetMapping("/login")
	public String Login() {
		return "account/login";
	}

	@Autowired
	CartDAO cartdao;
	@RequestMapping("/gio-hang")
	public String Cart(Model model ) {
		List<Cart> listProInCart = cartdao.findByUserId(3);
		model.addAttribute("listProInCart", listProInCart);
		
		
		model.addAttribute("view", "cart.jsp");
		return "layout";
	}
	
	@RequestMapping("/gio-hang/update/{id}/{pre}")
	public String update(@PathVariable("id") Integer id,@PathVariable("pre") String pre) {
		cartdao.update(id, pre);
		return "redirect:/gio-hang";
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
