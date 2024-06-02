package asm.java5Nhom6.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm.java5Nhom6.entity.Address;
import asm.java5Nhom6.entity.Users;

public interface UsersDao extends JpaRepository<Users, Integer> {
	  @Query("SELECT u FROM Users u WHERE u.Username = ?1 ")
	    Users findByUsername(String username);
	  
	  
	  	
}
