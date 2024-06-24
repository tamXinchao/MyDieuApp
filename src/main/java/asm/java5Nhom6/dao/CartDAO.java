package asm.java5Nhom6.dao;

import java.util.List;


import org.springframework.data.domain.Sort;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import asm.java5Nhom6.entity.Cart;
import asm.java5Nhom6.entity.Product_Size_Color;

public interface CartDAO extends JpaRepository<Cart, Integer> {
	/**
	 * lấy danh sách sản phẩm trong giỏ hàng theo user
	 */
	@Query("SELECT c FROM Cart c WHERE c.user.id = ?1")
	 List<Cart> findByUserId(Integer userId, Sort sort);
	
	/**
	* Lấy tổng số tiền các mặt hàng được chọn trong giỏ
	* Id là Pro_Size_Color_Id
	*/
	@Query(value = "select SUM(c.Quality * psc.Price) "
	        + "from Cart c join Product_Size_Color psc on c.Pro_Size_Color_Id = psc.Pro_Size_Color_Id "
	        + "where c.Pro_Size_Color_Id = ?1", nativeQuery = true)
	double getAmount(Integer Id);


//	@Query(value = "select psc.* from Product_Size_Color psc \r\n"
//			+ "join Sizes s on psc.Size_Id = s.Size_Id\r\n"
//			+ "join Colors c on psc.Color_Id = c.Color_Id\r\n"
//			+ "where c.Name like ?2 and s.Name like ?3 and psc.Product_Id=?1", nativeQuery = true)
//	
	@Query("SELECT psc FROM Product_Size_Color psc " +
	           "JOIN psc.size s " +
	           "JOIN psc.color c " +
	           "WHERE c.name LIKE ?2 AND s.name LIKE ?3 AND psc.product.id = ?1")
	   
	Product_Size_Color PSC(Integer productId, String color, String size);

}
