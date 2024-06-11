package asm.java5Nhom6.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import asm.java5Nhom6.entity.Order_Detail;


public interface OrderDetailDao extends JpaRepository<Order_Detail, Integer>{
    @Query("select odd from Order_Detail odd join odd.order od where od.orderId = ?1")
	List<Order_Detail> getListOrderDetail(Integer orderId);
}
