package asm.java5Nhom6.dao;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import asm.java5Nhom6.entity.Cart;

public interface CartDAO extends JpaRepository<Cart, Integer> {
	/**
	 * lấy danh sách sản phẩm trong giỏ hàng theo user
	 */
	@Query("SELECT c FROM Cart c WHERE c.user.id = ?1")
	 List<Cart> findByUserId(Integer userId, Sort sort);
	
	/**
	* Lấy tổng số tiền các mặt hàng được chọn trong giỏ
	*/
	@Query(value = "select SUM( c.Quality*psc.Price)  \r\n"
			+ "from Cart c join Product_Size_Color psc on c.Pro_Size_Color_Id = psc.Pro_Size_Color_Id\r\n"
			+ "where c.Pro_Size_Color_Id=?1", nativeQuery = true)
	double getAmount(Integer Id);
	
}
