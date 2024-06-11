package asm.java5Nhom6.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import asm.java5Nhom6.entity.Manufacturer;


public interface ManufacturesDAO extends JpaRepository<Manufacturer, Integer> {

    @Query("SELECT p.productId, m.manuName " +
           "FROM Product p " +
           "JOIN p.manufacturer m " +
           "WHERE p.productId = :productId " +
           "GROUP BY p.productId, m.manuName")
    List<Object[]> findManufacturerById(@Param("productId") Integer productId);
    
    
}
