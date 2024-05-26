package asm.java5Nhom6.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import asm.java5Nhom6.entity.Users;

public interface UsersDao extends JpaRepository<Users, Integer> {
	  @Query("SELECT u FROM Users u WHERE u.Fullname = ?1")
	    List<Users> findByName(String fullname);
}
