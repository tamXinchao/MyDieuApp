package asm.java5Nhom6.Entity;

import java.util.Date;

import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	@Id
	Integer Product_Id;
	String Product_name;
	String Origin;
	String Material;
	String Describe;
	Date NgayNhap;
	Integer Manu_Id;
	Integer Cate_Id;
	
	@ManyToOne
	@JoinColumn(name = "categoryid")
	Category category;
}
