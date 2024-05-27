package asm.java5Nhom6.Entity;

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
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "users")
public class User {
 @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
	Integer User_Id;
@Column(name = "fullname", nullable = false)
	String Fullname;
  @Column(name = "username", nullable = false)
	String Username;
 @Column(name = "password", nullable = false)
	String Password;
@Column(name = "gender", nullable = false)
	Boolean Gender;
	Integer Role_Id;
   @OneToMany(mappedBy = "user")
    private List<Order> orders;
}
