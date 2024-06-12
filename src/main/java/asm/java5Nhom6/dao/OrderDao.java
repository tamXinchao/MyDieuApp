package asm.java5Nhom6.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.oracle.wls.shaded.org.apache.xpath.operations.Or;

import asm.java5Nhom6.entity.Order;
import asm.java5Nhom6.entity.Order_Detail;
import jakarta.persistence.criteria.CriteriaBuilder.In;

public interface OrderDao extends JpaRepository<Order, Integer>{
	List<Order> findByStatusLike(String status);

//	@Query("SELECT od FROM Order od JOIN od.user u "
//			+ "WHERE (od.orderId = ?1 OR u.Fullname LIKE ?2) and od.status like 'Chờ xác nhận' ")
	@Query("SELECT od FROM Order od JOIN od.user u "
			+ "WHERE (od.orderId = ?1 OR u.Fullname LIKE ?2) ")
	List<Order> findOrderByKeyword(Integer orderId, String keyword);
	
	
	List<Order> findByDateBetween(Date date1, Date date2);
	
	@Query("select o from Order o where o.user.User_Id = ?1")
	List<Order> findByUserId(Integer userId);
}
