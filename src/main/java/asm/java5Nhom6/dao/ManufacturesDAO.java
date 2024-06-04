package asm.java5Nhom6.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

<<<<<<< HEAD
import asm.java5Nhom6.entity.Manufacturer;
=======
import asm.java5Nhom6.Entity.Manufacturer;
>>>>>>> 0e01b0b7cd608b7434b4559a7a4c306590955112

public interface ManufacturesDAO extends JpaRepository<Manufacturer, Integer> {

    @Query("SELECT p.productId, m.manuName " +
           "FROM Product p " +
           "JOIN p.manufacturer m " +
           "WHERE p.productId = :productId " +
           "GROUP BY p.productId, m.manuName")
    List<Object[]> findManufacturerById(@Param("productId") Integer productId);
}
