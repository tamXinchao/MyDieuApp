package asm.java5Nhom6.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import asm.java5Nhom6.entity.Category;
import asm.java5Nhom6.model.dto.dtoCategory;

@Repository


public interface CategoryDAO extends JpaRepository<Category, Integer>{
	 @Query("select new asm.java5Nhom6.model.dto.dtoCategory(c.image,c.name, c.id, COUNT(p.id)) " +
	           "from Category c " +
	           "left join c.products p " +
	           "group by c.cateId, c.name,c.image")
	    List<dtoCategory> countProductofCate();
	    
	    @Query("SELECT new asm.java5Nhom6.model.dto.dtoCategory(c.image, c.name, c.id, COUNT(p.id)) " +
	            "FROM Category c LEFT JOIN c.products p " +
	            "WHERE c.id IN :categoryIds " +
	            "GROUP BY c.cateId, c.name,c.image")
	     List<dtoCategory> countProductOfCate(@Param("categoryIds") List<Integer> categoryIds);

}
