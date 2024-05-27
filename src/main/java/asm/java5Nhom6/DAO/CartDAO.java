package asm.java5Nhom6.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import asm.java5Nhom6.entity.Cart;

public interface CartDAO extends JpaRepository<Cart, Integer> {
	/**
	 * lấy danh sách sản phẩm trong giỏ hàng theo user
	 */
	@Query("SELECT c FROM Cart c WHERE c.user.id = ?1")
	List<Cart> findByUserId(Integer userId);
	
	/**
	* Thay đổi số lượng lên của mặt hàng trong giỏ
	* @param id mã mặt hàng
	* @param qty số lượng mới
	* @return mặt hàng đã được thay đổi số lượng
	*/
	@Query("SELECT c FROM Cart c WHERE c.id = ?1")
	Cart update(Integer id, String qty);
}
