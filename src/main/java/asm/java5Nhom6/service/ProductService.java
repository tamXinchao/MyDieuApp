package asm.java5Nhom6.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import asm.java5Nhom6.entity.*;
import jakarta.persistence.criteria.CriteriaBuilder.In;
import asm.java5Nhom6.dao.ManufacturesDAO;

import asm.java5Nhom6.dao.ProductDAO;
import asm.java5Nhom6.dao.Product_ImageDAO;
import asm.java5Nhom6.dao.Product_Size_ColorDAO;
import asm.java5Nhom6.entity.Product;
import asm.java5Nhom6.entity.Product_Image;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
	@Autowired
	private Product_ImageDAO productImage;
	@Autowired
	private ProductDAO dao;
	@Autowired
	private Product_Size_ColorDAO productSizeColor;
	@Autowired
	private ManufacturesDAO manuDAO;

	public List<Object[]> getRelatedProductsByCategoryId(Integer categoryId, int limit) {
		Pageable pageable = PageRequest.of(0, limit);
		Page<Object[]> page = productSizeColor.findProductsByCategoryId(categoryId, pageable);
		return page.getContent();
	}

	public List<Object[]> findPriceByProductId(Integer productId) {
		return productSizeColor.findPriceByProductId(productId);
	}

	public List<Object[]> getManuById(Integer productId) {
		return manuDAO.findManufacturerById(productId);
	}

	public Optional<Manufacturer> getManuFacturesByid(Integer productId) {
		return manuDAO.findById(productId);
	}

	public Optional<Product> getProduct(Integer productId) {// lấy tất cả sp
		return dao.findById(productId);
	}

	public List<Object[]> getSizeById(Integer productId) { // lấy size theo id
		return productSizeColor.findSizeById(productId);
	}

	public List<Object[]> getColorById(Integer productId) {// lấy color theo id
		return productSizeColor.findColorById(productId);
	}

	public List<Object[]> getImageProductById(Integer productId) {// lấy image theo id
		return productImage.findImagebyProdouct(productId);
	}

	public Page<Object[]> getProductPage(int page, int size) {
		Pageable pageable = PageRequest.of(page, size);
		return productSizeColor.findProductInfo(pageable);
	}

	public Page<Object[]> getTop10Product() {
		Pageable pageable = PageRequest.of(0, 12);
		return productSizeColor.findTop10CheapestProducts(pageable);
	}

	public List<Object[]> findDetailProductByProductId(Integer productId) {// lấy name, price, tất cả image của product
																			// để làm detail
		return productSizeColor.findDetailProductByProductId(productId);
	}

//admin product
	public List<Object[]> findImg(Integer productId) {
		return productSizeColor.findImageById(productId);
	}

//	public List<Object[]> findProductAdmin(Integer productId) {
//		return productSizeColor.findProductAdmin(productId);
//	}
}
