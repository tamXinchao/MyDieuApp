package asm.java5Nhom6.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Users {
	Integer User_Id;
	String Fullname;
	String Username;
	String Password;
	Boolean Gender;
	Integer Role_Id;
}
