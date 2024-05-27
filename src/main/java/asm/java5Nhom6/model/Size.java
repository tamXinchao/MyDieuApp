package asm.java5Nhom6.model;

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
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Sizes")
public class Size {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Size_Id")
	private int id;
	
	@Column(name="Name")
	String name;
	
	@OneToMany(mappedBy = "size")
	private List<ProductDetail> productDetails;
}
