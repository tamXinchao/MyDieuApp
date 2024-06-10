package asm.java5Nhom6.entity;

import java.util.List;

import jakarta.persistence.Column;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;

import lombok.Data;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Data
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Address")
public class Address {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer addressId;

	@Column(name = "phone_number", nullable = false)
	String phoneNumber;
	@Column(name = "Email", nullable = false)
	String email;
	@Column(name = "Address", nullable = false)
	String address;
	@Column(name = "Provincial", nullable = false)
	String provincial;
	//Mỵ thêm
	@OneToMany(mappedBy = "address")
	private List<Order> orders;

}
