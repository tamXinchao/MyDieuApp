package asm.java5Nhom6.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import asm.java5Nhom6.entity.Product;

import asm.java5Nhom6.model.dto.dtoProduct;

@Repository
public interface ProductDAO extends JpaRepository<Product, Integer> {

	Page<Product> findByProductNameContainingAndNgayNhapAfter(String productName, Date ngayNhap, Pageable pageable);

	Page<Product> findByProductNameContaining(String productName, Pageable pageable);

	@Query("SELECT new asm.java5Nhom6.model.dto.dtoProduct(p.image, p.productName, c.price, p.id,a.cateId ) "
			+ "FROM Product p " + "LEFT JOIN p.productSizeColors c " + "LEFT JOIN p.category a "
			+ "WHERE a.cateId = :cateId " + "GROUP BY p.image, p.productName, c.price, p.id,a.cateId ")
	List<dtoProduct> selectProduct(@Param("cateId") Integer cateId);

	@Query("SELECT new asm.java5Nhom6.model.dto.dtoProduct(p.image, p.productName, c.price, p.id,a.cateId) "
			+ "FROM Product p " + "LEFT JOIN p.productSizeColors c " + "LEFT JOIN p.category a "
			+ "WHERE a.cateId IN (:cateIds) " + "GROUP BY p.image, p.productName, c.price,p.id,a.cateId")
	List<dtoProduct> selectProductByCategories(@Param("cateIds") List<Integer> cateIds);

	@Query("SELECT new asm.java5Nhom6.model.dto.dtoProduct(p.image, p.productName, c.price,p.id,a.cateId) "
			+ "FROM Product p " + "LEFT JOIN p.productSizeColors c " + "LEFT JOIN p.category a "
			+ "WHERE a.cateId IN (:cateIds) " + "GROUP BY p.image, p.productName, c.price,p.id,a.cateId")
	List<dtoProduct> findByCategoryIds(@Param("cateIds") List<Integer> cateIds);

	@Query("SELECT new asm.java5Nhom6.model.dto.dtoProduct(p.image, p.productName, c.price, p.id, p.category.cateId) "
			+ "FROM Product p " + "LEFT JOIN p.productSizeColors c " + "LEFT JOIN p.category "
			+ "WHERE p.productName LIKE %:keywords% "
			+ "GROUP BY p.image, p.productName, c.price, p.id, p.category.cateId")
	List<dtoProduct> findByProductName(@Param("keywords") String keywords);

	@Query("SELECT new asm.java5Nhom6.model.dto.dtoProduct(p.image, p.productName, c.price, p.id, p.category.cateId) "
			+ "FROM Product p " + "LEFT JOIN p.productSizeColors c " + "LEFT JOIN p.category "
			+ "GROUP BY p.image, p.productName, c.price, p.id, p.category.cateId " + "ORDER BY c.price ASC")
	List<dtoProduct> findAllOrderByPriceAsc();

	@Query("SELECT new asm.java5Nhom6.model.dto.dtoProduct(p.image, p.productName, c.price, p.id, p.category.cateId) "
			+ "FROM Product p " + "LEFT JOIN p.productSizeColors c " + "LEFT JOIN p.category "
			+ "GROUP BY p.image, p.productName, c.price, p.id, p.category.cateId " + "ORDER BY c.price DESC")
	List<dtoProduct> findAllOrderByPriceDesc();

	@Query("SELECT new asm.java5Nhom6.model.dto.dtoProduct(p.image, p.productName, c.price, p.id, p.category.cateId) "
			+ "FROM Product p " + "LEFT JOIN p.productSizeColors c " + "LEFT JOIN p.category a "
			+ "WHERE a.cateId IN (:cateIds) " + "AND c.color.colorId IN (:colorIds) "
			+ "GROUP BY p.image, p.productName, c.price, p.id, p.category.cateId")
	List<dtoProduct> findByCategoryIdsAndColorIds(@Param("cateIds") List<Integer> cateIds,
			@Param("colorIds") List<Integer> colorIds);

	@Query("SELECT new asm.java5Nhom6.model.dto.dtoProduct(p.image, p.productName, c.price, p.id, a.cateId) "
			+ "FROM Product p " + "LEFT JOIN p.productSizeColors c " + "LEFT JOIN p.category a "
			+ "WHERE a.cateId IN (:categories) " + "AND c.size.sizeId IN (:sizes) "
			+ "GROUP BY p.image, p.productName, c.price, p.id, a.cateId")
	List<dtoProduct> findByCategoryIdsAndSizeIds(@Param("categories") List<Integer> categories,
			@Param("sizes") List<Integer> sizes);

	@Query("SELECT new asm.java5Nhom6.model.dto.dtoProduct(p.image, p.productName, c.price, p.id, p.category.cateId) "
			+ "FROM Product p " + "LEFT JOIN p.productSizeColors c " + "LEFT JOIN p.category a "
			+ "WHERE a.cateId IN (:cateIds) " + "AND c.color.colorId IN (:colorIds) "
			+ "AND c.size.sizeId IN (:sizeIds) " + "GROUP BY p.image, p.productName, c.price, p.id, p.category.cateId")
	List<dtoProduct> findByCategoryIdsAndColorIdsAndSizeIds(@Param("cateIds") List<Integer> cateIds,
			@Param("colorIds") List<Integer> colorIds, @Param("sizeIds") List<Integer> sizeIds);

}
