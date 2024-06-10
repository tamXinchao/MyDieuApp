package asm.java5Nhom6.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import asm.java5Nhom6.entity.Order;

public interface OrderDao extends JpaRepository<Order, Integer>{

}
