package asm.java5Nhom6.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import asm.java5Nhom6.dao.CategoryDAO;
import asm.java5Nhom6.dao.ColorDAO;
import asm.java5Nhom6.dao.ManufacturesDAO;
import asm.java5Nhom6.dao.ProductDAO;
import asm.java5Nhom6.dao.Product_ImageDAO;
import asm.java5Nhom6.dao.Product_Size_ColorDAO;
import asm.java5Nhom6.dao.SizeDAO;
import asm.java5Nhom6.entity.Category;
import asm.java5Nhom6.entity.Color;
import asm.java5Nhom6.entity.Manufacturer;
import asm.java5Nhom6.entity.Product;
import asm.java5Nhom6.entity.Product_Image;
import asm.java5Nhom6.entity.Product_Size_Color;
import asm.java5Nhom6.entity.Size;
import asm.java5Nhom6.service.ParamService;
import asm.java5Nhom6.service.ProductService;

@Controller
public class AdminProduct {
	@Autowired
	ProductDAO productDao;
	@Autowired
	CategoryDAO cateDao;
	@Autowired
	Product_Size_ColorDAO pscDao;
	@Autowired
	ProductService productService;
	@Autowired
	SizeDAO sizeDao;
	@Autowired
	ColorDAO colorDao;
	@Autowired
	ManufacturesDAO manuDao;
	@Autowired
	Product_ImageDAO productImageDao;
	@Autowired
	ParamService paramService;
	Direction direction = Direction.DESC;

	@RequestMapping("/admin/tableEditProduct")
	public String table(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "field", required = false) Optional<String> field,
			@RequestParam(value = "sortDir", defaultValue = "desc") String sortDir,
			@RequestParam(value = "productName", required = false) Optional<String> productName,
			@RequestParam(value = "ngayNhap", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngayNhap) {

		String productNameKeyword = productName.orElse("");
		String sortField = field.orElse("ngayNhap");
		Direction sortDirection = sortDir.equalsIgnoreCase(Direction.ASC.name()) ? Direction.ASC : Direction.DESC;

		int pageSize = 5;
		Pageable pageable = PageRequest.of(page - 1, pageSize, Sort.by(sortDirection, sortField));

		Page<Product> products;
		if (!productNameKeyword.isEmpty() && ngayNhap != null) {
			products = productDao.findByProductNameContainingAndNgayNhapAfter(productNameKeyword, ngayNhap, pageable);
		} else if (!productNameKeyword.isEmpty()) {
			products = productDao.findByProductNameContaining(productNameKeyword, pageable);
		} else {
			products = productDao.findAll(pageable);
		}

		// Log the size of the retrieved products for debugging
		System.out.println("Products Size: " + products.getSize());

		model.addAttribute("sortField", sortField);
		model.addAttribute("sortDir", sortDir);
		List<Category> categories = cateDao.findAll();
		List<Size> sizes = sizeDao.findAll();
		List<Product_Size_Color> productSCList = pscDao.findAll();
		List<Color> colors = colorDao.findAll();
		List<Manufacturer> manu = manuDao.findAll();

		model.addAttribute("colors", colors);
		model.addAttribute("manu", manu);

		Map<Integer, Product_Size_Color> productSCMap = productSCList.stream().collect(Collectors
				.toMap(psc -> psc.getProduct().getProductId(), psc -> psc, (existing, replacement) -> existing));

		model.addAttribute("productSCMap", productSCMap);
		model.addAttribute("sizes", sizes);
		model.addAttribute("categories", categories);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", products.getTotalPages());
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("products", products);
		model.addAttribute("view", "tableEditProduct.jsp");

		return "admin/layout";
	}

	@RequestMapping("/admin/edit-product/{productId}")
	public String editProduct(@PathVariable("productId") Integer productId, Model model,
			@RequestParam(value = "page", defaultValue = "1") int page) {

		List<Object[]> price = productService.findPriceByProductId(productId);
		model.addAttribute("price", price);

		List<Object[]> images = productService.findImg(productId);
		model.addAttribute("images", images);

		List<Product_Size_Color> pscOptional = pscDao.findByProductId(productId);
		model.addAttribute("psc", pscOptional);
		
		List<Color> colors = colorDao.findAll();
		model.addAttribute("colors", colors);
		List<Category> categories = cateDao.findAll();
		model.addAttribute("categories", categories);
		List<Size> sizes = sizeDao.findAll();
		model.addAttribute("sizes", sizes);
		Optional<Product> optionalProduct = productDao.findById(productId);

		// Khởi tạo biến isUpdate ở đây và đặt giá trị mặc định là false
		boolean isUpdate = false;

		if (optionalProduct.isPresent()) {
			Product product = optionalProduct.get();
			if (productId.equals(product.getProductId())) {
				isUpdate = true;
			}
			List<Manufacturer> manu = manuDao.findAll();

			model.addAttribute("manu", manu);

			model.addAttribute("product", product);

		} else {
			model.addAttribute("error", "Product not found");
		}

		// Truyền biến isUpdate vào model
		model.addAttribute("isUpdate", isUpdate);

		return "forward:/admin/tableEditProduct";
	}

	@PostMapping("/admin/add-product")
	public String addProduct(Model model, @RequestParam("categoryId") int categoryId,
			@RequestParam("manuId") int manuId, @RequestParam("productName") String productName,
			@RequestParam("origin") String origin, @RequestParam("material") String material,
			@RequestParam("describe") String describe,@RequestParam("imgProduct") MultipartFile imgProduct, @RequestParam("images") List<MultipartFile> images) {

		try {
			// Lấy Category và Manufacturer từ ID của chúng
			Optional<Category> categoryOptional = cateDao.findById(categoryId);
			Optional<Manufacturer> manufacturerOptional = manuDao.findById(manuId);

			// Kiểm tra xem Category và Manufacturer có tồn tại hay không
			Category category = categoryOptional.orElseThrow(() -> new RuntimeException("Không tìm thấy danh mục"));
			Manufacturer manufacturer = manufacturerOptional
					.orElseThrow(() -> new RuntimeException("Không tìm thấy nhà sản xuất"));

			// Tạo và lưu sản phẩm
			Product product = new Product();
			product.setCategory(category);
			product.setManufacturer(manufacturer);
			product.setProductName(productName);
			product.setOrigin(origin);
			product.setNgayNhap(new Date());
			product.setMaterial(material);
			product.setDescribe(describe);

			// Lưu sản phẩm vào cơ sở dữ liệu và lấy lại đối tượng sản phẩm đã lưu với ID
			product = productDao.save(product);

			// Xử lý tải ảnh chính
			if (!imgProduct.isEmpty()) {
				String uploadDir = "/user/img/";
				File savedFile = paramService.save(imgProduct, uploadDir);
				if (savedFile != null) {
					product.setImage(savedFile.getName());

					productDao.save(product); // Cập nhật sản phẩm sau khi đặt ảnh
				}
			}

			// Xử lý tải nhiều ảnh sản phẩm
			for (MultipartFile image : images) {
				if (!image.isEmpty()) {
					String uploadDir = "/user/img/";
					File savedFile = paramService.save(image, uploadDir);
					if (savedFile != null) {
						Product_Image productImage = new Product_Image();
						productImage.setNameImg(savedFile.getName());
						productImage.setProduct(product);
						productImageDao.save(productImage);
					}
				}
			}

//			// Lấy Color và Size từ ID của chúng và lưu vào bảng Product_Size_Color
//			for (Integer colorId : colorIds) {
//				Optional<Color> colorOptional = colorDao.findById(colorId);
//				Color color = colorOptional.orElseThrow(() -> new RuntimeException("Không tìm thấy màu sắc"));
//				for (Integer sizeId : sizeIds) {
//					Optional<Size> sizeOptional = sizeDao.findById(sizeId);
//					Size size = sizeOptional.orElseThrow(() -> new RuntimeException("Không tìm thấy kích thước"));
//					Product_Size_Color productSizeColor = new Product_Size_Color();
//					productSizeColor.setStatus(true);
//					productSizeColor.setColor(color);
//					productSizeColor.setSize(size);
//					productSizeColor.setProduct(product);
//					productSizeColor.setPrice(price);
//					pscDao.save(productSizeColor);
//				}
//			}

			return "redirect:/admin/tableEditProduct";
		} catch (NumberFormatException e) {
			model.addAttribute("errorMessage", "Dữ liệu đầu vào không hợp lệ: ID phải là số nguyên");
			return "error-page";
		} catch (Exception e) {
			e.printStackTrace(); // Ghi nhật ký lỗi để gỡ lỗi
			// Xử lý ngoại lệ khi cần thiết, chẳng hạn như trả về trang lỗi
			model.addAttribute("errorMessage", "Có lỗi xảy ra khi thêm sản phẩm");
			return "error-page";
		}
	}

	@RequestMapping("/admin/delete-product")
	public String delete(Model model, @RequestParam("productId") Integer productId) {
		// Delete related entries in Product_Image table
		productImageDao.deleteByProductId(productId);

		// Delete related entries in pscDao table
		pscDao.deleteByProductId(productId);

		// Delete the product itself
		productDao.deleteById(productId);

		return "redirect:/admin/tableEditProduct";
	}

	@RequestMapping("/admin/reset")
	public String reset() {
		return "redirect:/admin/tableEditProduct";
	}

	@PostMapping("/admin/update-product/{productId}")
	public String updateProduct(Model model, @RequestParam("categoryId") int categoryId,
			@RequestParam("manuId") int manuId, @RequestParam("origin") String origin,
			@RequestParam("material") String material, @RequestParam("describe") String describe,
			@RequestParam("price") Double price, @RequestParam("imgProduct") MultipartFile imgProduct,
			@RequestParam("images") List<MultipartFile> images, @RequestParam("colorIds") List<Integer> colorIds,
			@RequestParam("sizeIds") List<Integer> sizeIds, @PathVariable("productId") Integer productId) {

		try {
			// Lấy sản phẩm từ ID
			Optional<Product> optionalProduct = productDao.findById(productId);
			if (!optionalProduct.isPresent()) {
				model.addAttribute("errorMessage", "Không tìm thấy sản phẩm");
				return "error-page";
			}

			Product product = optionalProduct.get();

			// Lấy Category và Manufacturer từ ID của chúng
			Optional<Category> categoryOptional = cateDao.findById(categoryId);
			Optional<Manufacturer> manufacturerOptional = manuDao.findById(manuId);

			// Kiểm tra xem Category và Manufacturer có tồn tại hay không
			Category category = categoryOptional.orElseThrow(() -> new RuntimeException("Không tìm thấy danh mục"));
			Manufacturer manufacturer = manufacturerOptional
					.orElseThrow(() -> new RuntimeException("Không tìm thấy nhà sản xuất"));

			// Cập nhật thông tin sản phẩm
			product.setCategory(category);
			product.setManufacturer(manufacturer);
			product.setOrigin(origin);
			product.setMaterial(material);
			product.setDescribe(describe);
			product.setNgayNhap(new Date());

			// Xử lý tải ảnh chính
			if (!imgProduct.isEmpty()) {
				String uploadDir = "/user/img/";
				File savedFile = paramService.save(imgProduct, uploadDir);
				if (savedFile != null) {
					product.setImage(savedFile.getName());
				}
			}

			// Xử lý tải nhiều ảnh sản phẩm
			for (MultipartFile image : images) {
				if (!image.isEmpty()) {
					String imageName = image.getOriginalFilename();
					List<Product_Image> existingImages = productImageDao
							.findByNameImgContainingAndProduct_ProductId(imageName, productId);
					if (existingImages.isEmpty()) {
						String uploadDir = "/user/img/";
						File savedFile = paramService.save(image, uploadDir);
						if (savedFile != null) {
							Product_Image productImage = new Product_Image();
							productImage.setNameImg(savedFile.getName());
							productImage.setProduct(product);
							productImageDao.save(productImage);
						}
					}
				}
			}

			// Lấy danh sách hiện tại của Product_Size_Color từ DB
			List<Product_Size_Color> currentPscList = pscDao.findByProductId(productId);

			// Tạo danh sách mới từ thông tin người dùng
			List<Product_Size_Color> newPscList = new ArrayList<>();
			for (Integer colorId : colorIds) {
				Optional<Color> colorOptional = colorDao.findById(colorId);
				Color color = colorOptional.orElseThrow(() -> new RuntimeException("Không tìm thấy màu sắc"));
				for (Integer sizeId : sizeIds) {
					Optional<Size> sizeOptional = sizeDao.findById(sizeId);
					Size size = sizeOptional.orElseThrow(() -> new RuntimeException("Không tìm thấy kích thước"));
					Product_Size_Color productSizeColor = new Product_Size_Color();
					productSizeColor.setStatus(true);
					productSizeColor.setColor(color);
					productSizeColor.setSize(size);
					productSizeColor.setProduct(product);
					productSizeColor.setPrice(price);
					newPscList.add(productSizeColor);
				}
			}

			// So sánh danh sách hiện tại và danh sách mới
			if (!currentPscList.equals(newPscList)) {
				// Xóa các bản ghi cũ nếu có sự thay đổi
				pscDao.deleteByProductId(productId);
				// Thêm các bản ghi mới
				for (Product_Size_Color psc : newPscList) {
					pscDao.save(psc);
				}
			}

			// Cập nhật sản phẩm sau khi thay đổi
			productDao.save(product);

			return "redirect:/admin/tableEditProduct";
		} catch (NumberFormatException e) {
			model.addAttribute("errorMessage", "Dữ liệu đầu vào không hợp lệ: ID phải là số nguyên");
			return "error-page";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", "Có lỗi xảy ra khi cập nhật sản phẩm");
			return "error-page";
		}
	}

}
