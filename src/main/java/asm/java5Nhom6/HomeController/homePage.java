package asm.java5Nhom6.HomeController;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import asm.java5Nhom6.Entity.Category;
import asm.java5Nhom6.Entity.Manufacturer;
import asm.java5Nhom6.Entity.Product;
import asm.java5Nhom6.Entity.Product_Image;
import asm.java5Nhom6.Entity.Product_Size_Color;
import asm.java5Nhom6.dao.CategoryDAO;
import asm.java5Nhom6.service.ProductService;

@Controller
public class homePage {
	@Autowired
	ProductService productService;

	@Autowired
	CategoryDAO cateDAO;

	@GetMapping
	public String index(Model model) {
		// Lấy thông tin product
		Page<Object[]> top10ProductPage = productService.getTop10Product();
		List<Object[]> top10Product = top10ProductPage.getContent();
		model.addAttribute("top10Product", top10Product);
		top10Product.forEach(info -> System.out.println("Product Info: " + Arrays.toString(info)));
		model.addAttribute("view", "index.jsp");
		return "index";
	}

	@RequestMapping("/trang-chu")
	public String trangChu(Model model, @ModelAttribute("product") Product product) {
		Page<Object[]> top10ProductPage = productService.getTop10Product();
		List<Object[]> top10Product = top10ProductPage.getContent();
		top10Product.forEach(info -> System.out.println("Product Info: " + Arrays.toString(info)));
		model.addAttribute("top10Product", top10Product);
		model.addAttribute("view", "index.jsp");
		return "index";
	}

	@GetMapping("/register")
	public String register() {
		return "account/register";
	}

	@GetMapping("/login")
	public String login() {
		return "account/login";
	}

	@RequestMapping("/gio-hang")
	public String cart(Model model) {
		model.addAttribute("view", "cart.jsp");
		return "layout";
	}

	@RequestMapping("/shop")
	public String shop(Model model) {
		model.addAttribute("view", "shop.jsp");
		return "layout";
	}

	@GetMapping("/shop/danh-sach-san-pham")
	public String danhSachSP(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		int pageSize = 6;
		Page<Object[]> dsSpPage = productService.getProductPage(page - 1, pageSize);
		List<Object[]> dsSp = dsSpPage.getContent();

		model.addAttribute("dsSp", dsSp);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", dsSpPage.getTotalPages());
		return "forward:/shop";
	}

	@RequestMapping("/product/detail/{productId}/{cateId}")
	public String detail(Model model, @PathVariable("productId") Integer productId,
			@PathVariable("cateId") Integer cateId) {
		// Product detail by productId
		List<Object[]> listDetail = productService.findDetailProductByProductId(productId);

		// Find image by productId
		List<Object[]> listImage = productService.getImageProductById(productId);

		// Find color by productId
		List<Object[]> listColor = productService.getColorById(productId);

		// Find size by productId
		List<Object[]> listSize = productService.getSizeById(productId);

		Optional<Product> productById = productService.getProduct(productId);
		if (productById.isPresent()) {
			model.addAttribute("productById", productById.get());
		} else {
			// Handle the case where the product is not found
			model.addAttribute("error", "Product not found");
			return "error"; // Redirect to an error page or show an error message
		}

		// Find manufacture by id
		List<Object[]> listManu = productService.getManuById(productId);

		// Lấy các sản phẩm cùng thể loại
		List<Object[]> relatedProducts = productService.getRelatedProductsByCategoryId(cateId, 4);
		model.addAttribute("relatedProducts", relatedProducts);
		model.addAttribute("listManu", listManu);
		model.addAttribute("listColor", listColor);
		model.addAttribute("listSize", listSize);
		model.addAttribute("image", listImage);
		model.addAttribute("detail", listDetail);
		model.addAttribute("view", "detail.jsp");

		return "layout";
	}
}
