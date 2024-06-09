package asm.java5Nhom6.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import asm.java5Nhom6.dao.ProductDAO;
import asm.java5Nhom6.dao.Product_Size_ColorDAO;
import asm.java5Nhom6.entity.Product;
import asm.java5Nhom6.entity.Product_Size_Color;

@Controller
public class QualityProdutcController {
	@Autowired
	Product_Size_ColorDAO pscDao;
	@Autowired
	ProductDAO productDao;

	@RequestMapping("/admin/product-quality/{productId}")
	public String quality(Model model, @PathVariable("productId") Integer productId) {
		Optional<Product> productOptional = productDao.findById(productId);
		Product product = productOptional.get();
		model.addAttribute("product", product);
		List<Product_Size_Color> psc = pscDao.findByProductId(productId);
		model.addAttribute("psc", psc);

		model.addAttribute("view", "quality-product.jsp");
		return "admin/layout";
	}

	@PostMapping("/admin/product-quality/{productId}")
	public String updateQuality(Model model, @RequestParam("quality") int quality,
			@PathVariable("productId") Integer productId) {
		// Tìm tất cả các đối tượng Product_Size_Color có cùng productId
		List<Product_Size_Color> pscList = pscDao.findByProduct_ProductId(productId);

		if (!pscList.isEmpty()) {
			// Lặp qua danh sách các đối tượng Product_Size_Color và cập nhật số lượng cho
			// mỗi đối tượng
			for (Product_Size_Color psc : pscList) {
				psc.setQuality(quality);
			}

			// Lưu thay đổi vào cơ sở dữ liệu
			pscDao.saveAll(pscList);
		}

		// Redirect về trang chỉnh sửa sản phẩm
		return "redirect:/admin/tableEditProduct";
	}

}
