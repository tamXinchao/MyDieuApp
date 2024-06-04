package asm.java5Nhom6.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Product_Size_Color")
public class ProductDetail {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Pro_Size_Color_Id")
    private int id;
	
	@Column(name="Status")
	String status;
	
	@Column(name="Quality")
	int quality;
	
	@Column(name = "Price")
	float price;
	
	@ManyToOne
	@JoinColumn(name = "color_id")
	private Color color;

	@ManyToOne
	@JoinColumn(name = "Size_Id")
	private Size size;

	@ManyToOne
	@JoinColumn(name = "Product_Id")
	private Product product;

	@ManyToOne
	@JoinColumn(name = "Id")
	private ProductImage productImage;
}