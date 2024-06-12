package asm.java5Nhom6.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

import asm.java5Nhom6.dao.CategoryDAO;
import asm.java5Nhom6.dao.ColorDAO;

import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;

import asm.java5Nhom6.model.dto.dtoCategory;

import asm.java5Nhom6.model.dto.dtoProduct;
import asm.java5Nhom6.dao.CartDAO;
import asm.java5Nhom6.dao.CartDAOImp;
import asm.java5Nhom6.dao.CategoryDAO;

import asm.java5Nhom6.dao.ProductDAO;
import asm.java5Nhom6.dao.Product_ImageDAO;
import asm.java5Nhom6.dao.Product_Size_ColorDAO;
import asm.java5Nhom6.dao.SizeDAO;
import asm.java5Nhom6.entity.*;

import asm.java5Nhom6.service.ProductService;
import jakarta.servlet.http.HttpServletRequest;

import asm.java5Nhom6.service.SessionKeyService;
import asm.java5Nhom6.service.SessionService;

@Controller
public class HomePage {
	@Autowired
	CategoryDAO categoryRepo;

	@Autowired
	ProductDAO productRepo;
	@Autowired
	ProductService productService;

	@Autowired
	SizeDAO sizeDao;

	@Autowired
	SessionKeyService session;

	@Autowired
	CategoryDAO cateDAO;

	@Autowired
	ColorDAO colorDao;
	
	//My
	@Autowired 
	CartDAO cartdao;
	
	// số lượng sản phẩm trong giỏ hàng
	public void getCount(Model model) {
		Sort sort = Sort.by(Direction.DESC, "date");
		Users user = session1.getAttribute("userSession");
		if (user==null) {
			model.addAttribute("Count", 0);
		}else {
			List<Cart> listProInCart = cartdao.findByUserId(user.getUser_Id(), sort);
			model.addAttribute("Count", listProInCart.size());
		}
	}
	//my
	
	@GetMapping
	public String index(Model model) {
		// Lấy thông tin product
		Page<Object[]> top10ProductPage = productService.getTop10Product();
		List<Object[]> top10Product = top10ProductPage.getContent();
//		top10Product.forEach(info -> System.out.println("Product Info: " + Arrays.toString(info)));
		model.addAttribute("top10Product", top10Product);

		List<Category> categories = categoryRepo.findAll();
		model.addAttribute("categories", categories);
		List<Product> products = productRepo.findAll();
		model.addAttribute("products", products);
		List<dtoCategory> countProductOfCate = categoryRepo.countProductofCate();
		model.addAttribute("countProductOfCate", countProductOfCate);

		top10Product.forEach(info -> System.out.println("Product Info: " + Arrays.toString(info)));
		model.addAttribute("view", "index.jsp");

		getCount(model);

		return "index";
	}

	@RequestMapping("/trang-chu")
	public String trangChu(Model model, @ModelAttribute("product") Product product) {
		Page<Object[]> top10ProductPage = productService.getTop10Product();
		List<Object[]> top10Product = top10ProductPage.getContent();
//		top10Product.forEach(info -> System.out.println("Product Info: " + Arrays.toString(info)));
		model.addAttribute("top10Product", top10Product);

		model.addAttribute("view", "index.jsp");

		List<Category> categories = categoryRepo.findAll();
		model.addAttribute("categories", categories);
		List<Product> products = productRepo.findAll();
		model.addAttribute("products", products);
		List<dtoCategory> countProductOfCate = categoryRepo.countProductofCate();
		model.addAttribute("countProductOfCate", countProductOfCate);

		getCount(model);

		return "index";
	}

	

	@RequestMapping("/shop")
	public String shop(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		int pageSize = 6;
		Page<Object[]> dsSpPage = productService.getProductPage(page - 1, pageSize);
		List<Object[]> dsSp = dsSpPage.getContent();
		getCount(model);
		List<Category> categories = categoryRepo.findAll();
		model.addAttribute("categories", categories);
		model.addAttribute("dsSp", dsSp);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", dsSpPage.getTotalPages());
		model.addAttribute("categories", categories);
		List<Product> products = productRepo.findAll();
		model.addAttribute("products", products);
		List<dtoCategory> countProductOfCate = categoryRepo.countProductofCate();
		model.addAttribute("countProductOfCate", countProductOfCate);

		model.addAttribute("view", "shop.jsp");
//		model.addAttribute("display", "more-product.jsp");

		return "layout";
	}

	@GetMapping("/shop/danh-sach-san-pham")
	public String danhSachSP(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		int pageSize = 6;
		Page<Object[]> dsSpPage = productService.getProductPage(page - 1, pageSize);
		List<Object[]> dsSp = dsSpPage.getContent();

		List<Category> categories = categoryRepo.findAll();
		model.addAttribute("categories", categories);
		List<Color> colors = colorDao.findAll();
		model.addAttribute("colors", colors);
		List<Size> sizes = sizeDao.findAll();
		model.addAttribute("sizes", sizes);
		model.addAttribute("dsSp", dsSp);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", dsSpPage.getTotalPages());
		model.addAttribute("view", "shop.jsp");
		model.addAttribute("display", "more-product.jsp");
		return "layout";

	}

	// Mỵ threm lo
	@Autowired
	HttpServletRequest req;
	@Autowired
	SessionService session1;

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
		// Mỵ thêm
		String contextPath = req.getRequestURI();
		session1.setAttribute("contextPath", contextPath);
		getCount(model);

		return "layout";
	}

	@RequestMapping("/shop/category/{id}")
	public String productInCategory(@PathVariable("id") Integer id, Model model) {
		Category category = categoryRepo.findById(id).get();
		model.addAttribute("category", category);
		List<Category> categories = categoryRepo.findAll();
		model.addAttribute("categories", categories);
		List<dtoProduct> products = productRepo.selectProduct(id);
		System.out.println("Products: " + products);
		model.addAttribute("products", products);

		List<Color> colors = colorDao.findAll();
		model.addAttribute("colors", colors);
		List<Size> sizes = sizeDao.findAll();
		model.addAttribute("sizes", sizes);
		model.addAttribute("view", "shop.jsp");

		model.addAttribute("display", "productList.jsp");
		return "layout";
	}

	@PostMapping("/filterProducts")
	public String filterProducts(@RequestBody Map<String, List<Integer>> filters, Model model) {
		List<Integer> categories = filters.get("categories");
		List<Integer> colors = filters.get("colors");
		List<Integer> sizes = filters.get("sizes");

		List<dtoProduct> products;

		if ((colors == null || colors.isEmpty()) && (sizes == null || sizes.isEmpty())) {
			products = productRepo.findByCategoryIds(categories);
		} else if (colors == null || colors.isEmpty()) {
			products = productRepo.findByCategoryIdsAndSizeIds(categories, sizes);
		} else if (sizes == null || sizes.isEmpty()) {
			products = productRepo.findByCategoryIdsAndColorIds(categories, colors);
		} else {
			products = productRepo.findByCategoryIdsAndColorIdsAndSizeIds(categories, colors, sizes);
		}

		for (dtoProduct dtoProduct : products) {
			System.out.println("hiển thị:" + products);
		}
		model.addAttribute("products", products);

		List<dtoCategory> countProductOfCate = categoryRepo.countProductOfCate(categories);
		model.addAttribute("countProductOfCate", countProductOfCate);

		countProductOfCate.forEach(b -> {
			System.out.println(b.getCountProduct());
		});
		return "productList";
	}

	@RequestMapping("/shop/product/search")
	public String searchProduct(Model model, @RequestParam("keywords") Optional<String> kw) {
		String keyword = kw.orElse(session.get("keywords", ""));
		session.set("keywords", keyword);
		List<Category> categories = categoryRepo.findAll();
		model.addAttribute("categories", categories);
		List<Color> colors = colorDao.findAll();
		model.addAttribute("colors", colors);
		List<Size> sizes = sizeDao.findAll();
		model.addAttribute("sizes", sizes);
		List<dtoProduct> products = productRepo.findByProductName("%" + keyword + "%");

		// In danh sách sản phẩm ra log để kiểm tra
		System.out.println("Products: " + products);
		if (products.isEmpty()) {
			System.out.println("No products found.");
		}

		model.addAttribute("products", products);
		model.addAttribute("view", "shop.jsp");
		model.addAttribute("display", "sortList.jsp");
		return "layout";
	}

	@RequestMapping("/shop/sort")
	public String sortProducts(Model model, @RequestParam(value = "order", defaultValue = "asc") String order) {
		List<dtoProduct> products;
		if (order.equalsIgnoreCase("asc")) {
			products = productRepo.findAllOrderByPriceAsc();
		} else {
			products = productRepo.findAllOrderByPriceDesc();
		}
		List<Category> categories = categoryRepo.findAll();
		model.addAttribute("categories", categories);
		List<Color> colors = colorDao.findAll();
		model.addAttribute("colors", colors);
		List<Size> sizes = sizeDao.findAll();
		model.addAttribute("sizes", sizes);
		model.addAttribute("products", products);
		model.addAttribute("view", "shop.jsp");
		model.addAttribute("display", "productList.jsp");
		return "layout";
	}

}
