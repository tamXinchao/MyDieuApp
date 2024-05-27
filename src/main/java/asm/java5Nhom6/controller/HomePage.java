package asm.java5Nhom6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;

import asm.java5Nhom6.Entity.*;
import asm.java5Nhom6.model.dto.dtoCategory;
import asm.java5Nhom6.repostirori.CategoryRepostirori;
import asm.java5Nhom6.repostirori.ProductRepostirori;

import asm.java5Nhom6.Entity.Cart;
import asm.java5Nhom6.Entity.Product_Image;
import asm.java5Nhom6.Entity.Product_Size_Color;
import asm.java5Nhom6.dao.CartDAO;
import asm.java5Nhom6.dao.ProductDAO;
import asm.java5Nhom6.dao.Product_ImageDAO;
import asm.java5Nhom6.dao.Product_Size_ColorDAO;
import asm.java5Nhom6.service.ProductService;
import jakarta.websocket.server.PathParam;

@Controller
public class HomePage {
	@Autowired
	CategoryRepostirori categoryRepo;
	@Autowired
	ProductRepostirori productRepo;
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
//    List<Category> categories =categoryRepo.findAll();
//		model.addAttribute("categories",categories);
//		List<Product> products = productRepo.findAll();
//		model.addAttribute("products",products);
//		List<dtoCategory> countProductOfCate = categoryRepo.countProductofCate();
//		model.addAttribute("countProductOfCate",countProductOfCate);
		return "index";
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

	@RequestMapping("/detail/{productId}")
	public String detail(Model model, @PathVariable("productId") Integer productId) {
		List<Object[]> listDetail = productService.findDetailProductByProductId(productId);
		List<Object[]> listImage = productService.getImageProductById(productId);
		model.addAttribute("image", listImage);
		model.addAttribute("detail", listDetail);
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
