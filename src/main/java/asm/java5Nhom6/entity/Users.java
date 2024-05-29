package asm.java5Nhom6.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "users")
public class Users {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	Integer User_Id;
	
	@NotBlank(message = "Fullname is required")
	@Column(name = "fullname", nullable = false)
	String Fullname;
	
	@NotBlank(message = "Username is required")
	@Column(name = "username", nullable = false)
	String Username;
	
	@NotBlank(message = "Password is required")
	@Column(name = "password", nullable = false)
	String Password;
	
	@Column(name = "gender", nullable = false)
	Boolean Gender;
	@ManyToOne
	@JoinColumn(name = "Role_id") // Tên cột trong bảng users
	private Roles roles;

	@OneToMany(mappedBy = "user")
	private List<Order> orders;

	public Integer getUser_Id() {
		return User_Id;
	}

	public void setUser_Id(Integer user_Id) {
		User_Id = user_Id;
	}

	public String getFullname() {
		return Fullname;
	}

	public void setFullname(String fullname) {
		Fullname = fullname;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public Boolean getGender() {
		return Gender;
	}

	public void setGender(Boolean gender) {
		Gender = gender;
	}

	public Roles getRoles() {
		return roles;
	}

	public void setRoles(Roles roles) {
		this.roles = roles;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

}
