package asm.java5Nhom6.Entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	Integer Id;
	Date Date;
	Integer User_Id;
	Integer Pro_Size_Color_Id;
}
