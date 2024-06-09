package asm.java5Nhom6.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import asm.java5Nhom6.entity.Order;
import asm.java5Nhom6.entity.Order_Detail;

public interface OrderDetailDao extends JpaRepository<Order_Detail, Integer>{

}
