package asm.java5Nhom6.HomeController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;

import asm.java5Nhom6.model.Category;
import asm.java5Nhom6.model.Product;
import asm.java5Nhom6.model.dto.dtoCategory;
import asm.java5Nhom6.repostirori.CategoryRepostirori;
import asm.java5Nhom6.repostirori.ProductRepostirori;

@Controller
public class homePage {
	
	@Autowired
	CategoryRepostirori categoryRepo;
	@Autowired
	ProductRepostirori productRepo;
	
	@RequestMapping("/trang-chu")
	public String trangChu(Model model) {
		List<Category> categories =categoryRepo.findAll();
		model.addAttribute("categories",categories);
		List<Product> products = productRepo.findAll();
		model.addAttribute("products",products);
		List<dtoCategory> countProductOfCate = categoryRepo.countProductofCate();
		model.addAttribute("countProductOfCate",countProductOfCate);
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
	@RequestMapping("/shop/category/{id}")
	public String productInCategory(@PathVariable("id") Integer id, Model   model) {
		//List<Category> category = categoryRepo.findById(id);
		model.addAttribute("view","shop.jsp");
		return "layout";
	}

}
