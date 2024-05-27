package asm.java5Nhom6.repostirori;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import asm.java5Nhom6.Entity.Product;

@Repository
public interface ProductRepostirori extends JpaRepository<Product, Integer>{
	
}
