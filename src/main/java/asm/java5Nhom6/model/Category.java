package asm.java5Nhom6.model;

import java.io.Serializable;
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
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Categories")
public class Category implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Cate_Id")
	private int id;
	
	@Column(name = "Name",nullable = false)
	private String name;
	
	@Column(name = "Image")
	private String image;
	
	@OneToMany(mappedBy = "category")
    private List<Product> products;
}
