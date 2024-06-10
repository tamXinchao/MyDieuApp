package asm.java5Nhom6.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm.java5Nhom6.entity.Product_Image;
import jakarta.transaction.Transactional;

public interface Product_ImageDAO extends JpaRepository<Product_Image, Integer> {

	 List<Product_Image> findByNameImgContainingAndProduct_ProductId(String imageName, Integer productId);

	@Query("SELECT DISTINCT pi.nameImg, p.productId " + "FROM Product p "
			+ "JOIN Product_Image pi ON p.productId = pi.product.productId " + "WHERE p.productId = :productId "
			+ "GROUP BY p.productId, pi.nameImg")
	List<Object[]> findImagebyProdouct(@Param("productId") Integer productId);

	@Modifying
	@Transactional
	@Query("DELETE FROM Product_Image pi WHERE pi.product.productId = :productId")
	void deleteByProductId(@Param("productId") Integer productId);

}
