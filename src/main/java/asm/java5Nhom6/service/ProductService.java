package asm.java5Nhom6.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import asm.java5Nhom6.Entity.Manufacturer;
import asm.java5Nhom6.Entity.Product;
import asm.java5Nhom6.Entity.Product_Image;
import asm.java5Nhom6.dao.ManufacturesDAO;
import asm.java5Nhom6.dao.ProductDAO;
import asm.java5Nhom6.dao.Product_ImageDAO;
import asm.java5Nhom6.dao.Product_Size_ColorDAO;

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

	public List<Object[]> getManuById(Integer productId) {
		return manuDAO.findManufacturerById(productId);
	}

	public Optional<Manufacturer> getManuFacturesByid(Integer productId) {
		return manuDAO.findById(productId);
	}

	public Optional<Product> getProduct(Integer productId) {// lấy tất cả sp
		return dao.findById(productId);
	}

	public List<Integer[]> getSizeById(Integer productId) { // lấy size theo id
		return productSizeColor.findSizeById(productId);
	}

	public List<String[]> getColorById(Integer productId) {// lấy color theo id
		return productSizeColor.findColorById(productId);
	}

	public List<Object[]> getImageProductById(Integer productId) {// lấy image theo id
		return productImage.findImagebyProdouct(productId);
	}

	public List<Object[]> getProductInfo() { // lấy name, price, tất cả image của product để hiện lên trang chủ
		return productSizeColor.findProductInfo();
	}

	public List<Object[]> findDetailProductByProductId(Integer productId) {// lấy name, price, tất cả image của product
																			// để làm detail
		return productSizeColor.findDetailProductByProductId(productId);
	}

}
