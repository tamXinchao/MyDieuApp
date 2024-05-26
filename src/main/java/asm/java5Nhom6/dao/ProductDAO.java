package asm.java5Nhom6.dao;

import asm.java5Nhom6.Entity.Product;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProductDAO extends JpaRepository<Product, Integer> {
	// Ví dụ về truy vấn trực tiếp (native query) trong DAO hoặc service
	@Query("SELECT p FROM Product p WHERE p.ngayNhap = :date")
	List<Product> findByNgayNhap(@Param("date") Date date);

}
