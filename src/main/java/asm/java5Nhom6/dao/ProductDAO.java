package asm.java5Nhom6.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm.java5Nhom6.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Integer> {
	Page<Product> findAllByProductNameLikeOrNgayNhap(String keywords, Date ngayNhap, Pageable pageable);

}
