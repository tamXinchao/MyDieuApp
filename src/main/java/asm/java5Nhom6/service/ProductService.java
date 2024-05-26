package asm.java5Nhom6.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import asm.java5Nhom6.Entity.Product;
import asm.java5Nhom6.Entity.Product_Image;
import asm.java5Nhom6.dao.ProductDAO;
import asm.java5Nhom6.dao.Product_ImageDAO;
import asm.java5Nhom6.dao.Product_Size_ColorDAO;

import java.util.List;

@Service
public class ProductService {
	@Autowired
	private Product_ImageDAO productImage;
	@Autowired
	private ProductDAO dao;
	@Autowired
	private Product_Size_ColorDAO productSizeColor;

	public List<Object[]> getImageProductById(Integer productId) {
		return productImage.findImagebyProdouct(productId);
	}

	public List<Object[]> getProductInfo() {
		return productSizeColor.findProductInfo();
	}

	public List<Object[]> findDetailProductByProductId(Integer productId) {
		return productSizeColor.findDetailProductByProductId(productId);
	}

	public List<Product_Image> getProductImagesWithProductId() {
		return productImage.findAll();
	}

	public List<Product> getProduct() {
		return dao.findAll();
	}

}
