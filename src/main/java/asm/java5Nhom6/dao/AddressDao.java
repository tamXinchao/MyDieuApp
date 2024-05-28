package asm.java5Nhom6.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import asm.java5Nhom6.entity.Address;
import asm.java5Nhom6.entity.Size;
import asm.java5Nhom6.entity.Users;

public interface AddressDao extends JpaRepository<Address, Integer> {

}
