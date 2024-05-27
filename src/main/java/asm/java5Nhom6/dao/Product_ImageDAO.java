package asm.java5Nhom6.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm.java5Nhom6.entity.Product_Image;

public interface Product_ImageDAO extends JpaRepository<Product_Image, Integer> {
	@Query("SELECT DISTINCT pi.nameImg, p.productId " +
		       "FROM Product p " +
		       "JOIN Product_Image pi ON p.productId = pi.product.productId " +
		       "WHERE p.productId = :productId " +
		       "GROUP BY p.productId, pi.nameImg")
		List<Object[]> findImagebyProdouct(@Param("productId") Integer productId);

}
