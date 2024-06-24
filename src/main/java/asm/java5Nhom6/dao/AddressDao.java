package asm.java5Nhom6.dao;

import java.util.List;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm.java5Nhom6.entity.Address;
import asm.java5Nhom6.entity.Size;
import asm.java5Nhom6.entity.Users;

public interface AddressDao extends JpaRepository<Address, Integer> {
	@Query("SELECT a.address FROM Address_User a " + "INNER JOIN a.address b " + "INNER JOIN a.user c "
			+ "WHERE c.Username = :Username AND b.email = :email")
	Address findEmailBy(@Param("Username") String username, @Param("email") String email);

	@Query("SELECT b FROM Address_User a " + "INNER JOIN a.address b " + "INNER JOIN a.user c "
			+ "WHERE c.Username = :Username")
	List<Address> findInformationByUserName(@Param("Username") String username);

	@Query(value = "select a.* from address a join Address_User au on a.Address_Id = au.Address_Id "
			+ "where au.User_Id = ?1", nativeQuery = true)
	List<Address> findALLAddressByUserId(Integer userId);

}
