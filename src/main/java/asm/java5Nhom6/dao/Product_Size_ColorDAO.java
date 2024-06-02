package asm.java5Nhom6.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm.java5Nhom6.Entity.Product_Size_Color;

public interface Product_Size_ColorDAO extends JpaRepository<Product_Size_Color, Integer> {
	//trang chủ

    @Query("SELECT DISTINCT p.image, p.productName, psc.price, p.productId, cate.cateId " +
            "FROM Product_Size_Color psc " +
            "JOIN psc.product p " +
            "JOIN p.category cate " +
            "GROUP BY p.image, p.productName, p.productId, psc.price, cate.cateId")
     Page<Object[]> findProductInfo(Pageable pageable);
		 
		 //top 10 product
     @Query("SELECT DISTINCT p.image, p.productName, psc.price, p.productId, cate.cateId " +
    	       "FROM Product_Size_Color psc " +
    	       "JOIN psc.product p " +
    	       "JOIN p.category cate " +
    	       "GROUP BY p.image, p.productName, p.productId, psc.price, cate.cateId " +
    	       "ORDER BY psc.price ASC")
    	Page<Object[]> findTop10CheapestProducts(Pageable pageable);

	//detail
	@Query("SELECT DISTINCT p.productName,p.describe, MIN(psc.price), p.productId "
		     + "FROM Product_Size_Color psc " 
		     + "JOIN psc.product p "
		     + "WHERE p.productId = :productId " 
		     + "GROUP BY p.describe, p.productName, p.productId")
			List<Object[]> findDetailProductByProductId(@Param("productId") Integer productId);
		
	// size
		@Query("SELECT p.productId, s.name "
			       + "FROM Product_Size_Color psc "
			       + "JOIN psc.product p "
			       + "JOIN psc.size s "
			       + "WHERE p.productId = :productId "
			       + "GROUP BY p.productId, s.name")
			List<Object[]> findSizeById(@Param("productId") Integer productId);
			
			//  color
		@Query("SELECT p.productId, c.name "
				    + "FROM Product_Size_Color psc "
				    + "JOIN psc.product p "
				    + "JOIN psc.color c "
				    + "WHERE p.productId = :productId "
				    + "GROUP BY p.productId, c.name")
			List<Object[]> findColorById(@Param("productId") Integer productId);
			
			// san pham lien quan
			  @Query("SELECT p.productId, p.image, p.productName, psc.price, cate.cateId " +
			           "FROM Product_Size_Color psc " +
			           "JOIN psc.product p " +
			           "JOIN p.category cate " +
			           "WHERE cate.cateId = :categoryId " +
			           "GROUP BY p.productId, p.image, p.productName, psc.price, cate.cateId")
			  Page<Object[]> findProductsByCategoryId(@Param("categoryId") Integer categoryId, Pageable pageable);
		
}
