package asm.java5Nhom6.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm.java5Nhom6.Entity.Product_Size_Color;

public interface Product_Size_ColorDAO extends JpaRepository<Product_Size_Color, Integer> {
	@Query("SELECT pi.nameImg, p.productName, MIN(psc.price), p.productId " + "FROM Product_Size_Color psc "
			+ "JOIN psc.product p " + "JOIN psc.color c " + "JOIN psc.size s "
			+ "JOIN Product_Image pi ON psc.product = pi.product " + "GROUP BY pi.nameImg, p.productName, p.productId")
	List<Object[]> findProductInfo();

	@Query("SELECT DISTINCT pi.nameImg, p.productName,p.describe, MIN(psc.price), p.productId, c.name "
		     + "FROM Product_Size_Color psc " 
		     + "JOIN psc.product p "
		     + "JOIN psc.color c "
		     + "JOIN Product_Image pi ON psc.product = pi.product "
		     + "WHERE p.productId = :productId " 
		     + "GROUP BY pi.nameImg,p.describe, p.productName, p.productId, c.name")
		List<Object[]> findDetailProductByProductId(@Param("productId") Integer productId);

}
