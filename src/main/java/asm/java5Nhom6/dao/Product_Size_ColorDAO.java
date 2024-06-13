package asm.java5Nhom6.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm.java5Nhom6.entity.Product_Size_Color;
import jakarta.transaction.Transactional;

public interface Product_Size_ColorDAO extends JpaRepository<Product_Size_Color, Integer> {

	@Query("SELECT p.image, p.productName, psc.price, p.productId, cate.cateId  " + "FROM Product_Size_Color psc "
			+ "JOIN psc.product p " + "JOIN p.category cate "
			+ "GROUP BY p.productId, p.image, p.productName, psc.price, cate.cateId")
	List<Object[]> findProductInfo();

	// trang chủ

	// detail
	@Query("SELECT DISTINCT p.productName,p.describe, MIN(psc.price), p.productId " + "FROM Product_Size_Color psc "
			+ "JOIN psc.product p " + "WHERE p.productId = :productId "
			+ "GROUP BY p.describe, p.productName, p.productId")
	List<Object[]> findDetailProductByProductId(@Param("productId") Integer productId);

	@Query("SELECT DISTINCT p.image, p.productName, psc.price, p.productId, cate.cateId "
			+ "FROM Product_Size_Color psc " + "JOIN psc.product p " + "JOIN p.category cate "
			+ "GROUP BY p.image, p.productName, p.productId, psc.price, cate.cateId")
	Page<Object[]> findProductInfo(Pageable pageable);

	// top 10 product
	@Query("SELECT DISTINCT p.image, p.productName, psc.price, p.productId, cate.cateId "
			+ "FROM Product_Size_Color psc " + "JOIN psc.product p " + "JOIN p.category cate "
			+ "GROUP BY p.image, p.productName, p.productId, psc.price, cate.cateId " + "ORDER BY psc.price ASC")
	Page<Object[]> findTop10CheapestProducts(Pageable pageable);

	// size
	@Query("SELECT p.productId, s.name " + "FROM Product_Size_Color psc " + "JOIN psc.product p " + "JOIN psc.size s "
			+ "WHERE p.productId = :productId " + "GROUP BY p.productId, s.name")
	List<Object[]> findSizeById(@Param("productId") Integer productId);

	// color
	@Query("SELECT p.productId, c.name " + "FROM Product_Size_Color psc " + "JOIN psc.product p " + "JOIN psc.color c "
			+ "WHERE p.productId = :productId " + "GROUP BY p.productId, c.name")
	List<Object[]> findColorById(@Param("productId") Integer productId);

	// san pham lien quan
	@Query("SELECT p.productId, p.image, p.productName, psc.price, cate.cateId " + "FROM Product_Size_Color psc "
			+ "JOIN psc.product p " + "JOIN p.category cate " + "WHERE cate.cateId = :categoryId "
			+ "GROUP BY p.productId, p.image, p.productName, psc.price, cate.cateId")
	Page<Object[]> findProductsByCategoryId(@Param("categoryId") Integer categoryId, Pageable pageable);

	@Query("SELECT p.productId, psc.price " + "FROM Product_Size_Color psc " + "JOIN psc.product p "
			+ "WHERE p.productId = :productId " + "GROUP BY p.productId, psc.price")
	List<Object[]> findPriceByProductId(@Param("productId") Integer productId);

	// admin produc image

	@Query("SELECT p.productId, pi.nameImg, pi.Id " + "FROM Product p "
			+ "JOIN Product_Image pi ON pi.product.productId = p.productId " + "WHERE p.productId = :productId ")
	List<Object[]> findImageById(@Param("productId") Integer productId);

	@Query("SELECT psc FROM Product_Size_Color psc WHERE psc.product.productId IN :productIds")
	List<Product_Size_Color> findByProductIdIn(@Param("productIds") List<Integer> productIds);

	@Query("SELECT psc FROM Product_Size_Color psc JOIN psc.product p WHERE psc.product.id = :productId")
	List<Product_Size_Color> findByProductId(@Param("productId") Integer productId);

	@Query("SELECT psc FROM Product_Size_Color psc JOIN psc.product p WHERE psc.product.id = :productId")
	Product_Size_Color findByProductIdPrice(@Param("productId") Integer productId);

	@Modifying
	@Transactional
	@Query("DELETE FROM Product_Size_Color psc WHERE psc.product.productId = :productId")
	void deleteByProductId(@Param("productId") Integer productId);

	List<Product_Size_Color> findByProduct_ProductId(Integer productId);
	
	 Optional<Product_Size_Color> findByProduct_ProductIdAndColor_ColorIdAndSize_SizeId(Integer productId, Integer colorId, Integer sizeId);


}
