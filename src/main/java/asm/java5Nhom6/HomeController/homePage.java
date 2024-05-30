package asm.java5Nhom6.HomeController;

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

import asm.java5Nhom6.Entity.Manufacturer;
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
		// Lấy thông tin product
		Page<Object[]> top10ProductPage = productService.getTop10Product();
		List<Object[]> top10Product = top10ProductPage.getContent();
		model.addAttribute("top10Product", top10Product);
		model.addAttribute("view", "index.jsp");
		return "index";
	}

	@RequestMapping("/trang-chu")
	public String trangChu(Model model, @ModelAttribute("product") Product product) {
		// Lấy thông tin product
		Page<Object[]> top10ProductPage = productService.getTop10Product();
		List<Object[]> top10Product = top10ProductPage.getContent();
		model.addAttribute("top10Product", top10Product);
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

	@GetMapping("/shop/danh-sach-san-pham")
	public String danhSachSP(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		int pageSize = 6;
		Page<Object[]> dsSpPage = productService.getProductPage(page -1, pageSize);
		List<Object[]> dsSp = dsSpPage.getContent();

		model.addAttribute("dsSp", dsSp);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", dsSpPage.getTotalPages());
		return "forward:/shop"; 
	}

	@RequestMapping("/product/detail/{productId}")
	public String detail(Model model, @PathVariable("productId") Integer productId) {
		// product detail by productId
		List<Object[]> listDetail = productService.findDetailProductByProductId(productId);

		// find image by productId
		List<Object[]> listImage = productService.getImageProductById(productId);

		// find color by productId
		List<Object[]> listColor = productService.getColorById(productId);

		// find size by productId
		List<Object[]> listSize = productService.getSizeById(productId);

		Optional<Product> productById = productService.getProduct(productId);// thử cách mới
		// Optional không phải là một tập hợp các phần tử. cần kiểm tra
		// nếu giá trị bên trong Optional tồn tại và sau đó trích xuất giá trị đó trước
		// khi chuyển sang JSP.
		if (productById.isPresent()) {
			model.addAttribute("productById", productById.get());
		}
		// find manufacture by id
		List<Object[]> listManu = productService.getManuById(productId);
		model.addAttribute("listManu", listManu);
		model.addAttribute("listColor", listColor);
		model.addAttribute("listSize", listSize);
		model.addAttribute("image", listImage);
		model.addAttribute("detail", listDetail);
		model.addAttribute("view", "detail.jsp");
		return "layout";
	}
}
