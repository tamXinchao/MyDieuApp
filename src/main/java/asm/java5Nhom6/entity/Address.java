package asm.java5Nhom6.entity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
	@Column(name = "PhoneNumber", nullable = false)
	String phoneNumber;
	@Column(name = "Email", nullable = false)
	String email;
	@Column(name = "Address", nullable = false)
	String address;
	@Column(name = "Provincial", nullable = false)
	String provincial;
	
	public Address() {
		
	}
	
	
	
	
	public Address(Integer addressId, String phoneNumber, String email, String address, String provincial) {
		super();
		this.addressId = addressId;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.address = address;
		this.provincial = provincial;
	}
	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProvincial() {
		return provincial;
	}
	public void setProvincial(String provincial) {
		this.provincial = provincial;
	}
	
	
	
	
}
