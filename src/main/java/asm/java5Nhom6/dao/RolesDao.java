package asm.java5Nhom6.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import asm.java5Nhom6.entity.Roles;

public interface RolesDao extends JpaRepository<Roles, Integer> {
	
	Roles findById(int i);
	

	
	
}
