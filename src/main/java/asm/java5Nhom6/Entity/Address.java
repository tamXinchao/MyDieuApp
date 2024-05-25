package asm.java5Nhom6.Entity;
import jakarta.validation.constraints.Email;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Address {
	Integer Address_Id;
	String PhoneNumber;
	@Email(message="Vui lòng nhập đúng định dạng email!")
	String Email;
	String Address;
	String Provincial;
	Integer User_Id;
}
