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
public class Orders {
	Integer Order_Id;
	Date date;
	String Status;
	Double TotalAmount;
	Integer User_Id;
	Integer Em_Id;
	
}
