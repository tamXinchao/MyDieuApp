package asm.java5Nhom6.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm.java5Nhom6.entity.Address_User;

public interface Address_UserDao  extends JpaRepository<Address_User, Integer>  {
	@Query("SELECT a FROM Address_User a WHERE a.user.User_Id = :userId AND a.address.addressId = :addressId")
	Address_User findAllByUserIdAndAddressId(@Param("userId") Integer userId, @Param("addressId") Integer addressId);


}
