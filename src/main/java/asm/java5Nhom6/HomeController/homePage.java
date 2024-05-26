package asm.java5Nhom6.HomeController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import asm.java5Nhom6.Entity.Product;
import asm.java5Nhom6.Entity.Product_Image;
import asm.java5Nhom6.Entity.Product_Size_Color;
import asm.java5Nhom6.dao.ProductDAO;
import asm.java5Nhom6.dao.Product_ImageDAO;
import asm.java5Nhom6.dao.Product_Size_ColorDAO;
import asm.java5Nhom6.service.ProductService;
import jakarta.websocket.server.PathParam;

@Controller
public class homePage {
	@Autowired
	ProductService productService;

	@GetMapping
	public String index(Model model) {
		List<Object[]> productInfo = productService.getProductInfo();
		model.addAttribute("productInfo", productInfo);
		model.addAttribute("view", "index.jsp");
		return "index";
	}

	@RequestMapping("/trang-chu")
	public String trangChu(Model model, @ModelAttribute("product") Product product) {
		List<Object[]> productInfo = productService.getProductInfo();
		model.addAttribute("productInfo", productInfo);
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

	@RequestMapping("/detail/{productId}")
	public String detail(Model model, @PathVariable("productId") Integer productId) {
		List<Object[]> listDetail = productService.findDetailProductByProductId(productId);
		List<Object[]> listImage = productService.getImageProductById(productId);
		model.addAttribute("image", listImage);
		model.addAttribute("detail", listDetail);
		model.addAttribute("view", "detail.jsp");
		return "layout";
	}
}
