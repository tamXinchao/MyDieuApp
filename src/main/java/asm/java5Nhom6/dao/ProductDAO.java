package asm.java5Nhom6.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import asm.java5Nhom6.entity.Product;

import asm.java5Nhom6.model.dto.dtoProduct;
@Repository
public interface ProductDAO extends JpaRepository<Product, Integer> {

	Page<Product> findAllByProductNameLikeOrNgayNhap(String keywords, Date ngayNhap, Pageable pageable);

	@Query("SELECT new asm.java5Nhom6.model.dto.dtoProduct(p.image, p.productName, c.price) " +
	           "FROM Product p " +
	           "LEFT JOIN p.productSizeColors c " +
	           "LEFT JOIN p.category a " +
	           "WHERE a.cateId = :cateId " +
	           "GROUP BY p.image, p.productName, c.price")
	    List<dtoProduct> selectProduct(@Param("cateId") Integer cateId);


}
