package asm.java5Nhom6.Entity;

import java.util.List;

import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Category {
	@Id
	Integer Cate_Id;
	String Name;
	String Image;
	@OneToMany(mappedBy = "category")
	List<Product> products;
}
